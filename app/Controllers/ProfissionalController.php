<?php
declare(strict_types=1);

namespace App\Controllers;

use App\Repositories\ProfissionalRepository;
use App\Security\Auth;
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

        if (empty($_SESSION['csrf_token'])) {
            $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
        }

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $token = (string) ($_POST['csrf_token'] ?? '');

            if (!hash_equals((string) $_SESSION['csrf_token'], $token)) {
                http_response_code(403);
                exit('Token CSRF inválido.');
            }

            $tipo = trim((string) ($_POST['tipo'] ?? ''));
            $registro = trim((string) ($_POST['registro'] ?? ''));
            $especialidade = trim((string) ($_POST['especialidade'] ?? ''));
            $descricao = trim((string) ($_POST['descricao'] ?? ''));

            if ($tipo === '' || strlen($tipo) > 60) {
                $erro = 'Informe um tipo de profissional válido.';
            } elseif (
                strlen($registro) > 80 ||
                strlen($especialidade) > 120
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
                        header('Location: /painel?modo=profissional');
                        exit;
                    }

                    $erro = 'Não foi possível concluir o cadastro.';
                } catch (PDOException $e) {
                    $erro = 'Não foi possível concluir o cadastro.';
                }
            }
        }

        require __DIR__ . '/../Views/cadastro_profissional.php';
    }
}
