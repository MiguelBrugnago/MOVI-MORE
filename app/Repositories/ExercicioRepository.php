<?php

declare(strict_types=1);

namespace App\Repositories;

use App\Config\Database;
use PDO;

final class ExercicioRepository
{
    private PDO $pdo;

    public function __construct()
    {
        $this->pdo = Database::conectar();
    }

    public function listarDisponiveis(int $usuarioId): array
    {
        $sql = "SELECT
                    id,
                    nome,
                    descricao,
                    categoria,
                    dificuldade,
                    tipo,
                    unilateral,
                    midia,
                    usuario_id
                FROM exercicio
                WHERE ativo = 1
                  AND (
                      usuario_id IS NULL
                      OR usuario_id = :usuario_id
                  )
                ORDER BY nome ASC";

        $stmt = $this->pdo->prepare($sql);

        $stmt->execute([
            'usuario_id' => $usuarioId
        ]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function buscarPorId(int $exercicioId, int $usuarioId): ?array
    {
        $sql = "SELECT *
                FROM exercicio
                WHERE id = :id
                  AND ativo = 1
                  AND (
                      usuario_id IS NULL
                      OR usuario_id = :usuario_id
                  )
                LIMIT 1";

        $stmt = $this->pdo->prepare($sql);

        $stmt->execute([
            'id' => $exercicioId,
            'usuario_id' => $usuarioId
        ]);

        $exercicio = $stmt->fetch(PDO::FETCH_ASSOC);

        return $exercicio === false ? null : $exercicio;
    }
}
