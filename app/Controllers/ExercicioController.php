<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Repositories\ExercicioRepository;
use App\Security\Auth;

final class ExercicioController
{
    public function index(): void
    {
        Auth::verificar();

        header('Cache-Control: no-store, private');

        $usuarioId = (int) $_SESSION['usuario_id'];

        $repository = new ExercicioRepository();

        $exercicios = $repository->listarDisponiveis($usuarioId);

        $titulo = 'MOVI+ | Biblioteca de Exercícios';
        $viewPath = __DIR__ . '/../Views/exercicios.php';

        require __DIR__ . '/../Views/layouts/app.php';
    }
}
