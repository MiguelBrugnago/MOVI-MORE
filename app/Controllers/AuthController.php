<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Repositories\UsuarioRepository;
use App\Security\Csrf;
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

        $nome = trim((string) ($_POST['nome'] ?? ''));
        $email = strtolower(trim((string) ($_POST['email'] ?? '')));
        $senha = (string) ($_POST['senha'] ?? '');

        if (
            mb_strlen($nome) < 3 ||
            mb_strlen($nome) > 150 ||
            !filter_var($email, FILTER_VALIDATE_EMAIL) ||
            strlen($email) > 150 ||
            strlen($senha) < 8 ||
            strlen($senha) > 1024
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
            if ($erro->getCode() === '23000') {
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
}
