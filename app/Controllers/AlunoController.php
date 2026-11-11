<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Repositories\VinculoProfissionalRepository;
use App\Security\Auth;

final class AlunoController
{
    public function index(): void
    {
        Auth::verificar();

        header('Cache-Control: no-store, private');

        $usuarioId = (int) $_SESSION['usuario_id'];

        $repository = new VinculoProfissionalRepository();

        if ($repository->profissionalDoUsuario($usuarioId) === null) {
            http_response_code(403);
            echo 'Acesso permitido apenas para profissionais.';
            return;
        }

        $alunos = $repository->listarAlunosAtivos($usuarioId);

        $titulo = 'MOVI+ | Meus Alunos';
        $viewPath = __DIR__ . '/../Views/alunos.php';

        require __DIR__ . '/../Views/layouts/app.php';
    }

    public function visualizar(): void
    {
        Auth::verificar();

        header('Cache-Control: no-store, private');

        $usuarioId = (int) $_SESSION['usuario_id'];

        $alunoId = filter_input(
            INPUT_GET,
            'id',
            FILTER_VALIDATE_INT
        );

        if ($alunoId === false || $alunoId === null || $alunoId < 1) {
            http_response_code(400);
            echo 'Identificador de aluno inválido.';
            return;
        }

        $repository = new VinculoProfissionalRepository();

        if ($repository->profissionalDoUsuario($usuarioId) === null) {
            http_response_code(403);
            echo 'Acesso permitido apenas para profissionais.';
            return;
        }

        $aluno = $repository->buscarAlunoVinculado(
            $usuarioId,
            $alunoId
        );

        if ($aluno === null) {
            http_response_code(404);
            echo 'Aluno não encontrado ou sem vínculo ativo.';
            return;
        }

        $titulo = 'MOVI+ | Acompanhamento do Aluno';
        $viewPath = __DIR__ . '/../Views/aluno_detalhes.php';

        require __DIR__ . '/../Views/layouts/app.php';
    }
}
