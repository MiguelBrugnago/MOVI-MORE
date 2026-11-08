<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Security\Auth;

final class PainelController
{
    public function index(): void
    {
        Auth::verificar();

        header('Cache-Control: no-store, private');

        require __DIR__ . '/../Views/painel.php';
    }
}
