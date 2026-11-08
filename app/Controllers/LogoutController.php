<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Security\Csrf;
use App\Security\Session;

final class LogoutController
{
    public function sair(): void
    {
        if (($_SERVER['REQUEST_METHOD'] ?? '') !== 'POST') {
            http_response_code(405);
            exit('Método não permitido.');
        }

        if (!Csrf::validarToken($_POST['csrf_token'] ?? null)) {
            http_response_code(403);
            exit('Requisição inválida.');
        }

        Session::destruir();

        header('Location: /login', true, 303);
        exit;
    }
}
