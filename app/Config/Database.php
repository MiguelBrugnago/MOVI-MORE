<?php

declare(strict_types=1);

class Database
{
    public static function conectar(): PDO
    {
        $host = getenv('DB_HOST');
        $banco = getenv('DB_NAME');
        $usuario = getenv('DB_USER');
        $senha = getenv('DB_PASSWORD');

        $dsn = "mysql:host=$host;dbname=$banco;charset=utf8mb4";

        return new PDO($dsn, $usuario, $senha, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false
        ]);
    }
}
