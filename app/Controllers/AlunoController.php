<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Repositories\VinculoProfissionalRepository;
use App\Security\Auth;

final class AlunoController
{
    public function index(): void
    {
        Auth::usuario();

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
        Auth::usuario();

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

        $fisicoPermitido = $repository->autorizado($usuarioId, $alunoId, 'fisico');
        $saudePermitida = $repository->autorizado($usuarioId, $alunoId, 'saude');
        $treinosPermitidos = $repository->autorizado($usuarioId, $alunoId, 'treinos');
        $periodo = $_GET['periodo'] ?? 'todos';
        try {
            $inicio = \App\Services\PerfilFisicoService::inicioPeriodo($periodo);
        } catch (\InvalidArgumentException) {
            http_response_code(422);
            echo 'Período inválido.';
            return;
        }
        $perfil = $avaliacoes = $declaracoes = [];
        $observacoesSaude = [];
        $observacaoPessoal = null;
        $recente = null;
        $fisico = new \App\Repositories\PerfilFisicoRepository(\App\Config\Database::conectar());
        if ($fisicoPermitido) {
            $perfil = $fisico->perfil($alunoId);
            $avaliacoes = $fisico->historico($alunoId, $inicio);
            $recente = $fisico->historico($alunoId)[0] ?? null;
            $repository->registrarLeitura($usuarioId, $alunoId, 'perfil_avaliacoes');
        }
        if ($saudePermitida) {
            $declaracoes = $fisico->declaracoes($alunoId);
            $observacaoPessoal = $fisico->perfil($alunoId)['biografia'] ?? null;
            // Com acesso só à saúde, a tela recebe a data e a observação de cada avaliação, sem as medidas.
            if (!$fisicoPermitido) {
                foreach ($fisico->historico($alunoId, $inicio) as $registro) {
                    if ($registro['observacao'] !== null) {
                        $observacoesSaude[] = ['data' => $registro['avaliado_em'], 'texto' => $registro['observacao']];
                    }
                }
            }
            $repository->registrarLeitura($usuarioId, $alunoId, 'saude');
        }
        $treinos = [];
        $maisTreinos = false;
        $estatisticas = [];
        if ($treinosPermitidos) {
            $repoTreino = new \App\Repositories\TreinoRepository(\App\Config\Database::conectar());
            $antes = max(0, (int)(filter_input(INPUT_GET, 'antes', FILTER_VALIDATE_INT) ?: 0));
            [$treinos,$maisTreinos] = $repoTreino->historico($alunoId, ['de' => '', 'ate' => '', 'exercicio' => ''], $antes);
            $estatisticas = $repoTreino->estatisticas($alunoId, 0);
            $repository->registrarLeitura($usuarioId, $alunoId, 'treinos');
        }

        $titulo = 'MOVI+ | Acompanhamento do Aluno';
        $viewPath = __DIR__ . '/../Views/aluno_detalhes.php';

        require __DIR__ . '/../Views/layouts/app.php';
    }
}
