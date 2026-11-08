<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Repositories\UsuarioRepository;
use App\Security\Csrf;
use App\Security\LoginLimiter;
use App\Security\Session;
use PDOException;

final class AuthController
{
    public function cadastrar(): void
    {
        if (($_SERVER['REQUEST_METHOD'] ?? '') !== 'POST') {
            http_response_code(405);
            exit('Método não permitido.');
        }

        if (!Csrf::validarToken($_POST['csrf_token'] ?? null)) {
            http_response_code(403);
            exit('Requisição inválida.');
        }

        $nomeInformado = $_POST['nome'] ?? null;
        $emailInformado = $_POST['email'] ?? null;
        $senhaInformada = $_POST['senha'] ?? null;

        if (
            !is_string($nomeInformado) ||
            !is_string($emailInformado) ||
            !is_string($senhaInformada)
        ) {
            http_response_code(422);
            exit('Dados de cadastro inválidos.');
        }

        $nome = trim($nomeInformado);
        $email = strtolower(trim($emailInformado));
        $senha = $senhaInformada;

        if (
            mb_strlen($nome, 'UTF-8') < 3 ||
            mb_strlen($nome, 'UTF-8') > 150 ||
            !filter_var($email, FILTER_VALIDATE_EMAIL) ||
            strlen($email) > 150 ||
            mb_strlen($senha, 'UTF-8') < 8 ||
            mb_strlen($senha, 'UTF-8') > 32
        ) {
            http_response_code(422);
            exit('Dados de cadastro inválidos.');
        }

        $repository = new UsuarioRepository();

        if ($repository->buscarPorEmail($email) !== null) {
            http_response_code(409);
            exit('Não foi possível concluir o cadastro.');
        }

        $senhaHash = password_hash($senha, PASSWORD_DEFAULT);

        try {
            $repository->cadastrar($nome, $email, $senhaHash);
        } catch (PDOException $erro) {
            if ((string) $erro->getCode() === '23000') {
                http_response_code(409);
                exit('Não foi possível concluir o cadastro.');
            }

            error_log($erro->getMessage());

            http_response_code(500);
            exit('Erro interno ao realizar o cadastro.');
        }

        http_response_code(201);
        echo 'Cadastro realizado com sucesso.';
    }

    public function login(): void
    {
        if (($_SERVER['REQUEST_METHOD'] ?? '') !== 'POST') {
            http_response_code(405);
            exit('Método não permitido.');
        }

        if (!Csrf::validarToken($_POST['csrf_token'] ?? null)) {
            http_response_code(403);
            exit('Requisição inválida.');
        }

        $emailInformado = $_POST['email'] ?? null;
        $senhaInformada = $_POST['senha'] ?? null;

        if (
            !is_string($emailInformado) ||
            !is_string($senhaInformada)
        ) {
            http_response_code(422);
            exit('Dados inválidos.');
        }

        $email = strtolower(trim($emailInformado));
        $senha = $senhaInformada;

        if (
            !filter_var($email, FILTER_VALIDATE_EMAIL) ||
            strlen($email) > 150 ||
            $senha === '' ||
            mb_strlen($senha, 'UTF-8') > 32
        ) {
            http_response_code(401);
            exit('E-mail ou senha inválidos.');
        }

        $ip = $_SERVER['REMOTE_ADDR'] ?? '';

        $limiter = new LoginLimiter($email, $ip);

        if ($limiter->bloqueado()) {
            http_response_code(429);
            header('Retry-After: 900');
            exit('Muitas tentativas de login. Tente novamente mais tarde.');
        }

        $repository = new UsuarioRepository();
        $usuario = $repository->buscarPorEmail($email);

        if (
            $usuario === null ||
            !(bool) $usuario['ativo'] ||
            !password_verify($senha, $usuario['senha_hash'])
        ) {
            $limiter->registrarFalha();

            http_response_code(401);
            exit('E-mail ou senha inválidos.');
        }

        $limiter->registrarSucesso();

        Session::regenerar();

        $_SESSION['usuario_id'] = (int) $usuario['id'];
        $_SESSION['autenticado_em'] = time();
        $_SESSION['ultima_atividade'] = time();

        header('Location: /painel', true, 303);
        exit;
    }
}
