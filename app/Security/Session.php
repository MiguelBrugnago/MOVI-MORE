<?php

declare(strict_types=1);

namespace App\Security;

use RuntimeException;

final class Session
{
    public static function iniciar(): void
    {
        if (session_status() === PHP_SESSION_ACTIVE) {
            return;
        }

        if (headers_sent()) {
            throw new RuntimeException('Não foi possível iniciar a sessão.');
        }

        ini_set('session.use_strict_mode', '1');
        ini_set('session.use_only_cookies', '1');
        ini_set('session.use_trans_sid', '0');

        $https = !empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off';

        session_name('MOVISESSID');

        session_set_cookie_params([
            'lifetime' => 0,
            'path' => '/',
            'secure' => $https,
            'httponly' => true,
            'samesite' => 'Lax'
        ]);

        session_start();
    }

    public static function regenerar(): void
    {
        self::iniciar();

        session_regenerate_id(true);
    }

    public static function destruir(): void
    {
        self::iniciar();

        $_SESSION = [];

        if (ini_get('session.use_cookies')) {
            $parametros = session_get_cookie_params();

            setcookie(session_name(), '', [
                'expires' => time() - 3600,
                'path' => $parametros['path'],
                'domain' => $parametros['domain'],
                'secure' => $parametros['secure'],
                'httponly' => $parametros['httponly'],
                'samesite' => $parametros['samesite']
            ]);
        }

        session_destroy();
    }
}
