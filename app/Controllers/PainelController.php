<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Config\Database;
use App\Repositories\ProfissionalRepository;
use App\Repositories\TreinoRepository;
use App\Security\Auth;

/**
 * Seleciona o painel da conta autenticada. O modo solicitado na URL depende também do cadastro ativo
 * consultado no ProfissionalRepository.
 */
final class PainelController
{
    /**
     * Carrega o painel profissional quando a conta está habilitada e pediu esse modo. Nos demais casos
     * apresenta o painel do aluno.
     *
     * Rota GET /painel.
     */
    public function index(): void
    {
        Auth::usuario();

        header('Cache-Control: no-store, private');

        $usuarioId = (int) $_SESSION['usuario_id'];

        $repository = new ProfissionalRepository();
        $ehProfissional = $repository->ehProfissional($usuarioId);

        $modo = $_GET['modo'] ?? 'aluno';

        if ($modo === 'profissional' && $ehProfissional) {
            $titulo = 'MOVI+ | Painel Profissional';
            $viewPath = __DIR__ . '/../Views/painel_profissional.php';
        } else {
            $treinos = new TreinoRepository(Database::conectar());
            $ativo = $treinos->ativo($usuarioId);
            $recente = $treinos->ultimoConcluido($usuarioId);
            if ($recente) {
                $dataRecente = (new \DateTimeImmutable('@' . $recente['fim']))
                    ->setTimezone(new \DateTimeZone('America/Sao_Paulo'))->format('d/m/Y');
            }
            $titulo = 'MOVI+ | Painel do Aluno';
            $viewPath = __DIR__ . '/../Views/painel_aluno.php';
        }

        require __DIR__ . '/../Views/layouts/app.php';
    }
}
