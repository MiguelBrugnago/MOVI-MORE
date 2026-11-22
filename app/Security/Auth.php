<?php

declare(strict_types=1);

namespace App\Security;

use App\Repositories\UsuarioRepository;

/**
 * Protege as páginas autenticadas. Combina a atividade registrada na sessão com a consulta da conta
 * pelo UsuarioRepository para exigir um usuário ativo.
 */
final class Auth
{
    private const TEMPO_INATIVIDADE = 1800;

    /**
     * Confere a sessão e recarrega a conta pelo ID autenticado. Se a conta sumiu ou foi desativada,
     * encerra a sessão e redireciona.
     *
     * @return array{id:int,nome:string,email:string,ativo:int}
     */
    public static function usuario(): array
    {
        self::verificar();

        $repository = new UsuarioRepository();

        $usuario = $repository->buscarPorId(
            (int) $_SESSION['usuario_id']
        );

        // Uma sessão ainda válida pode pertencer a uma conta desativada depois do login.
        if ($usuario === null || !(bool) $usuario['ativo']) {
            Session::destruir();
            self::redirecionar();
        }

        return $usuario;
    }

    /**
     * Abre a sessão, exige a identificação do usuário e renova a última atividade. Uma inatividade de
     * 1.800 segundos encerra o acesso.
     */
    public static function verificar(): void
    {
        Session::iniciar();

        if (!isset($_SESSION['usuario_id'])) {
            self::redirecionar();
        }

        $agora = time();
        // O relógio da sessão mede inatividade entre requisições. A verificação abaixo ocorre antes de renovar o prazo.
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

    /**
     * Envia HTTP 303 para o formulário de login e termina a requisição.
     *
     * @return never
     */
    private static function redirecionar(): never
    {
        header('Location: /login', true, 303);
        exit;
    }
}
