<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Repositories\ProfissionalRepository;
use App\Security\Auth;
use App\Security\Csrf;
use PDOException;

final class ProfissionalController
{
    public function cadastro(): void
    {
        Auth::verificar();

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

            if ($tipo === '' || strlen($tipo) > 60) {
                $erro = 'Informe um tipo de profissional válido.';
            } elseif (
                strlen($registro) > 80 ||
                strlen($especialidade) > 120 || strlen($descricao) > 65535
            ) {
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
