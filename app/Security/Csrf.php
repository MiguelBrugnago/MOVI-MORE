<?php

declare(strict_types=1);

namespace App\Security;

final class Csrf
{
    public static function gerarToken(): string
    {
        // A renderização pode reutilizar o token depois de liberar o lock da sessão.
        if (isset($_SESSION['csrf_token']) && is_string($_SESSION['csrf_token'])) {
            return $_SESSION['csrf_token'];
        }
        Session::iniciar();

        if (!isset($_SESSION['csrf_token'])) {
            $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
        }

        return $_SESSION['csrf_token'];
    }

    public static function validarToken(mixed $token): bool
    {
        Session::iniciar();

        if (!is_string($token)) {
            return false;
        }

        $tokenSalvo = $_SESSION['csrf_token'] ?? null;

        return is_string($tokenSalvo)
            && hash_equals($tokenSalvo, $token);
    }
}
