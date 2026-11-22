<?php

declare(strict_types=1);

namespace App\Security;

/**
 * Vincula formulários à sessão da conta. Os templates recebem um token aleatório e os controllers
 * conferem esse valor antes de alterar dados.
 */
final class Csrf
{
    /**
     * Reaproveita o token disponível na sessão ou gera 32 bytes aleatórios representados em hexadecimal.
     *
     * @return string
     */
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

    /**
     * Compara o valor recebido com o token armazenado usando hash_equals. Ausência ou tipo incompatível
     * resulta em false.
     *
     * @param mixed $token Valor apresentado pelo formulário da sessão.
     * @return bool
     */
    public static function validarToken(mixed $token): bool
    {
        Session::iniciar();

        if (!is_string($token)) {
            return false;
        }

        $tokenSalvo = $_SESSION['csrf_token'] ?? null;

        // Só comparamos tokens de sessão existentes. A comparação usa tempo constante para valores de mesmo comprimento.
        return is_string($tokenSalvo)
            && hash_equals($tokenSalvo, $token);
    }
}
