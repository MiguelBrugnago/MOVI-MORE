<?php

declare(strict_types=1);

namespace App\Security;

use RuntimeException;

/**
 * Controla o ciclo da sessão PHP usada por Auth e Csrf. Configura o cookie, troca o identificador no
 * login e remove os dados no encerramento.
 */
final class Session
{
    /**
     * Reaproveita a sessão aberta ou inicia uma sessão via cookie antes do envio do HTML. Registra
     * esperas superiores a 250 ms.
     *
     * @throws RuntimeException Não foi possível iniciar a sessão.
     */
    public static function iniciar(): void
    {
        if (session_status() === PHP_SESSION_ACTIVE) {
            return;
        }

        if (headers_sent()) {
            throw new RuntimeException('Não foi possível iniciar a sessão.');
        }

        // O PHP aceita o identificador por cookie e deve emitir os cabeçalhos antes do corpo da página.
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

        // Uma requisição pode esperar outra liberar a mesma sessão. O log mede esse tempo em milissegundos.
        $inicio = hrtime(true);
        session_start();
        $milissegundos = (hrtime(true) - $inicio) / 1e6;
        if ($milissegundos > 250) {
            error_log(sprintf('MOVI: espera de sessao %.1f ms', $milissegundos));
        }
    }

    /**
     * Abre a sessão e substitui seu identificador após autenticar, descartando o identificador anterior.
     */
    public static function regenerar(): void
    {
        self::iniciar();

        // Troca o identificador e descarta a sessão anterior após a autenticação.
        session_regenerate_id(true);
    }

    /**
     * Esvazia os dados, expira o cookie com os mesmos parâmetros de origem e destrói a sessão no
     * servidor.
     */
    public static function destruir(): void
    {
        self::iniciar();

        $_SESSION = [];

        if (ini_get('session.use_cookies')) {
            // O navegador precisa receber a expiração com o mesmo nome, caminho e domínio do cookie original.
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
