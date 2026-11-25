<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Repositories\ProfissionalRepository;
use App\Security\Auth;
use App\Security\Csrf;
use PDOException;

/**
 * Cuida da criação do perfil profissional de uma conta autenticada. O mesmo endpoint mostra o
 * formulário e envia seus dados ao ProfissionalRepository.
 */
final class ProfissionalController
{
    public function perfil(): void
    {
        $usuario = (int)Auth::usuario()['id'];
        header('Cache-Control: no-store, private');
        $repository = new ProfissionalRepository();
        $perfil = $repository->buscarPorUsuarioId($usuario);
        if (empty($perfil['ativo'])) {
            http_response_code(403);
            return;
        }
        $erro = null;
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (!Csrf::validarToken($_POST['csrf_token'] ?? null)) {
                http_response_code(403);
                return;
            }
            try {
                $especialidade = \App\Support\Validacao::texto($_POST['especialidade'] ?? null, 120);
                $descricao = \App\Support\Validacao::texto($_POST['descricao'] ?? null, 65535);
                if (strlen($descricao ?? '') > 65535) {
                    throw new \InvalidArgumentException('Descrição profissional muito longa.');
                }
                $repository->atualizarPerfil($usuario, $especialidade, $descricao);
                header('Location: /profissional/perfil', true, 303);
                return;
            } catch (\InvalidArgumentException $e) {
                http_response_code(422);
                $erro = $e->getMessage();
            }
        }
        $titulo = 'MOVI+ | Perfil profissional';
        $viewPath = __DIR__ . '/../Views/perfil_profissional.php';
        require __DIR__ . '/../Views/layouts/app.php';
    }

    /**
     * Verifica se o perfil já existe. No POST valida CSRF e os campos, grava o cadastro e redireciona ao
     * painel profissional se houver sucesso.
     *
     * Rotas GET /profissional/cadastro, POST /profissional/cadastro.
     */
    public function cadastro(): void
    {
        Auth::usuario();

        header('Cache-Control: no-store, private');

        $repository = new ProfissionalRepository();
        $usuarioId = (int) $_SESSION['usuario_id'];

        if ($repository->buscarPorUsuarioId($usuarioId) !== null) {
            header('Location: /painel');
            exit;
        }

        $erro = null;

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (!Csrf::validarToken($_POST['csrf_token'] ?? null)) {
                http_response_code(403);
                exit('Token CSRF inválido.');
            }

            $campos = [];
            foreach (['tipo', 'registro', 'especialidade', 'descricao'] as $campo) {
                $valor = $_POST[$campo] ?? '';
                if (!is_string($valor) || !mb_check_encoding($valor, 'UTF-8')) {
                    http_response_code(422);
                    exit('Dados do perfil profissional inválidos.');
                }
                $campos[] = trim($valor);
            }
            [$tipo, $registro, $especialidade, $descricao] = $campos;

            if ($tipo === '' || mb_strlen($tipo) > 60) {
                http_response_code(422);
                $erro = 'Informe um tipo de profissional válido.';
            } elseif (
                mb_strlen($registro) > 80 ||
                mb_strlen($especialidade) > 120 || strlen($descricao) > 65535
            ) {
                http_response_code(422);
                $erro = 'Um dos campos excedeu o tamanho permitido.';
            } else {
                try {
                    $cadastrado = $repository->cadastrar(
                        $usuarioId,
                        $tipo,
                        $registro !== '' ? $registro : null,
                        $especialidade !== '' ? $especialidade : null,
                        $descricao !== '' ? $descricao : null
                    );

                    if ($cadastrado) {
                        header('Location: /painel?modo=profissional', true, 303);
                        exit;
                    }

                    $erro = 'Não foi possível concluir o cadastro.';
                } catch (PDOException $e) {
                    $erro = 'Não foi possível concluir o cadastro.';
                }
            }
        }

        Csrf::gerarToken();
        session_write_close();
        require __DIR__ . '/../Views/cadastro_profissional.php';
    }
}
