<?php

declare(strict_types=1);

namespace App\Config;

use PDO;
use RuntimeException;

class Database
{
    private static ?PDO $conexao = null;

    public static function conectar(): PDO
    {
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
