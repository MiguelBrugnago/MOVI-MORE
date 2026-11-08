<?php
declare(strict_types=1);

namespace App\Repositories;

use App\Config\Database;
use PDO;

final class UsuarioRepository
{
    private PDO $pdo;

    public function __construct()
    {
        $this->pdo = Database::conectar();
    }

    public function buscarPorEmail(string $email): ?array
    {
        $sql = 'SELECT id, nome, email, senha_hash, ativo
                FROM usuario
                WHERE email = :email
                LIMIT 1';

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['email' => $email]);

        $usuario = $stmt->fetch();

        return $usuario === false ? null : $usuario;
    }

    public function cadastrar(string $nome, string $email, string $senhaHash): int
    {
        $sql = 'INSERT INTO usuario (nome, email, senha_hash)
                VALUES (:nome, :email, :senha_hash)';

        $stmt = $this->pdo->prepare($sql);

        $stmt->execute([
            'nome' => $nome,
            'email' => $email,
            'senha_hash' => $senhaHash
        ]);

        return (int) $this->pdo->lastInsertId();
    }
}
