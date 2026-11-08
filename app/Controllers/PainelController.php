<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Security\Session;

final class PainelController
{
    public function index(): void
    {
        Session::iniciar();

        if (!isset($_SESSION['usuario_id'])) {
            header('Location: /login', true, 303);
            exit;
        }

        require __DIR__ . '/../Views/painel.php';
    }
}
