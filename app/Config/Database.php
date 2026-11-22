<?php

declare(strict_types=1);

namespace App\Config;

use PDO;
use RuntimeException;

/**
 * Fornece a conexão PDO compartilhada pelos repositórios durante a execução do PHP. Lê a
 * configuração do ambiente e usa consultas preparadas nativas do MySQL.
 */
class Database
{
    private static ?PDO $conexao = null;

    /**
     * Abre a conexão na primeira chamada e reutiliza a mesma instância nas seguintes. Assim, as
     * consultas de uma transação usam a mesma conexão.
     *
     * @return PDO
     * @throws RuntimeException Se faltar a configuração exigida para a conexão.
     * @throws \PDOException Se a conexão com o MySQL falhar.
     */
    public static function conectar(): PDO
    {
        // Reutilizar a conexão mantém o mesmo contexto de transação para todos os repositórios chamados pelo serviço.
        if (self::$conexao !== null) {
            return self::$conexao;
        }
        $host = getenv('DB_HOST') ?: 'db';
        $porta = 3306;

        $banco = getenv('DB_NAME');
        $usuario = getenv('DB_USER');
        $senha = getenv('DB_PASSWORD');

        if (!$banco || !$usuario || $senha === false) {
            throw new RuntimeException(
                'Configuração do banco de dados incompleta.'
            );
        }

        $dsn = "mysql:host={$host};port={$porta};dbname={$banco};charset=utf8mb4";

        return self::$conexao = new PDO(
            $dsn,
            $usuario,
            $senha,
            [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES => false,
            ]
        );
    }
}
