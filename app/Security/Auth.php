<?php

declare(strict_types=1);

namespace App\Security;

final class Auth
{
    private const TEMPO_INATIVIDADE = 1800;

    public static function verificar(): void
    {
        Session::iniciar();

        if (!isset($_SESSION['usuario_id'])) {
            self::redirecionar();
        }

        $agora = time();
        $ultimaAtividade = $_SESSION['ultima_atividade'] ?? null;

        if (
            !is_int($ultimaAtividade) ||
            $agora - $ultimaAtividade >= self::TEMPO_INATIVIDADE
        ) {
            Session::destruir();
            self::redirecionar();
        }

        $_SESSION['ultima_atividade'] = $agora;
    }

    private static function redirecionar(): never
    {
        header('Location: /login', true, 303);
        exit;
    }
}
