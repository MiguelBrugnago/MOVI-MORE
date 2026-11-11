<?php

declare(strict_types=1);

namespace App\Repositories;

use App\Config\Database;
use PDO;

final class ProfissionalRepository
{
    private PDO $pdo;

    public function __construct()
    {
        $this->pdo = Database::conectar();
    }

    public function buscarPorUsuarioId(int $usuarioId): ?array
    {
        $stmt = $this->pdo->prepare(
            'SELECT *
             FROM profissional
             WHERE usuario_id = :usuario_id
             LIMIT 1'
        );

        $stmt->execute([
            'usuario_id' => $usuarioId
        ]);

        $profissional = $stmt->fetch(PDO::FETCH_ASSOC);

        return $profissional === false ? null : $profissional;
    }

    public function ehProfissional(int $usuarioId): bool
    {
        $stmt = $this->pdo->prepare(
            'SELECT 1
             FROM profissional
             WHERE usuario_id = :usuario_id
             AND ativo = 1
             LIMIT 1'
        );

        $stmt->execute([
            'usuario_id' => $usuarioId
        ]);

        return $stmt->fetchColumn() !== false;
    }

    public function cadastrar(
        int $usuarioId,
        string $tipo,
        ?string $registro,
        ?string $especialidade,
        ?string $descricao
    ): bool {
        $stmt = $this->pdo->prepare(
            'INSERT INTO profissional
                (usuario_id, tipo, registro_profissional,
                 especialidade, descricao, verificado, ativo)
             VALUES
                (:usuario_id, :tipo, :registro,
                 :especialidade, :descricao, 0, 1)'
        );

        return $stmt->execute([
            'usuario_id' => $usuarioId,
            'tipo' => $tipo,
            'registro' => $registro,
            'especialidade' => $especialidade,
            'descricao' => $descricao
        ]);
    }
}
