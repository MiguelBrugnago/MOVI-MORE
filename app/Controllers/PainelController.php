<?php
declare(strict_types=1);

namespace App\Controllers;

use App\Repositories\ProfissionalRepository;
use App\Security\Auth;

final class PainelController
{
    public function index(): void
    {
        Auth::verificar();

        header('Cache-Control: no-store, private');

        $usuarioId = (int) $_SESSION['usuario_id'];

        $repository = new ProfissionalRepository();
        $ehProfissional = $repository->ehProfissional($usuarioId);

        $modo = $_GET['modo'] ?? 'aluno';

        if ($modo === 'profissional' && $ehProfissional) {
            require __DIR__ . '/../Views/painel_profissional.php';
            return;
        }

        require __DIR__ . '/../Views/painel_aluno.php';
    }
}
