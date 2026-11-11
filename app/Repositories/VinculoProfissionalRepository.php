<?php

declare(strict_types=1);

namespace App\Repositories;

use App\Config\Database;
use PDO;

class VinculoProfissionalRepository
{
    private PDO $pdo;

    public function __construct()
    {
        $this->pdo = Database::conectar();
    }

    public function profissionalDoUsuario(int $usuarioId): ?int
    {
        $sql = "SELECT id FROM profissional
                WHERE usuario_id = :usuario_id AND ativo = 1";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['usuario_id' => $usuarioId]);

        $id = $stmt->fetchColumn();

        return $id === false ? null : (int) $id;
    }

    public function listar(int $usuarioId, bool $modoProfissional): array
    {
        $sql = "SELECT v.*,
                       a.nome AS aluno_nome,
                       a.email AS aluno_email,
                       u.nome AS profissional_nome,
                       u.email AS profissional_email
                FROM vinculo_profissional v
                JOIN usuario a ON a.id = v.aluno_id
                JOIN profissional p ON p.id = v.profissional_id
                JOIN usuario u ON u.id = p.usuario_id
                WHERE ";

        if ($modoProfissional) {
            $sql .= "p.usuario_id = :usuario_id";
        } else {
            $sql .= "v.aluno_id = :usuario_id";
        }

        $sql .= " ORDER BY v.id DESC";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['usuario_id' => $usuarioId]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function solicitar(
        int $usuarioId,
        string $email,
        bool $modoProfissional
    ): string {
        $email = trim($email);

        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return 'Informe um e-mail válido.';
        }

        if ($modoProfissional) {
            $profissionalId = $this->profissionalDoUsuario($usuarioId);

            if ($profissionalId === null) {
                return 'Você não possui um perfil profissional ativo.';
            }

            $sql = "SELECT id FROM usuario
                    WHERE email = :email AND ativo = 1";

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['email' => $email]);

            $alunoId = $stmt->fetchColumn();

            if ($alunoId === false) {
                return 'Usuário não encontrado.';
            }

            $alunoId = (int) $alunoId;
            $solicitadoPor = 'profissional';
        } else {
            $alunoId = $usuarioId;

            $sql = "SELECT p.id
                    FROM profissional p
                    JOIN usuario u ON u.id = p.usuario_id
                    WHERE u.email = :email
                      AND p.ativo = 1
                      AND u.ativo = 1";

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['email' => $email]);

            $profissionalId = $stmt->fetchColumn();

            if ($profissionalId === false) {
                return 'Profissional não encontrado.';
            }

            $profissionalId = (int) $profissionalId;
            $solicitadoPor = 'aluno';
        }

        $sql = "SELECT usuario_id FROM profissional
                WHERE id = :id";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $profissionalId]);

        if ((int) $stmt->fetchColumn() === $alunoId) {
            return 'Você não pode solicitar acompanhamento a si mesmo.';
        }

        $sql = "SELECT id, status
                FROM vinculo_profissional
                WHERE profissional_id = :profissional_id
                  AND aluno_id = :aluno_id";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([
            'profissional_id' => $profissionalId,
            'aluno_id' => $alunoId
        ]);

        $existente = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($existente) {
            if (in_array($existente['status'], ['pendente', 'ativo'], true)) {
                return 'Já existe uma solicitação ou vínculo ativo.';
            }

            $sql = "UPDATE vinculo_profissional
                    SET status = 'pendente',
                        solicitado_por = :solicitado_por,
                        iniciado_em = NULL,
                        encerrado_em = NULL
                    WHERE id = :id";

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([
                'solicitado_por' => $solicitadoPor,
                'id' => $existente['id']
            ]);
        } else {
            $sql = "INSERT INTO vinculo_profissional
                    (profissional_id, aluno_id, solicitado_por, status)
                    VALUES
                    (:profissional_id, :aluno_id, :solicitado_por, 'pendente')";

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([
                'profissional_id' => $profissionalId,
                'aluno_id' => $alunoId,
                'solicitado_por' => $solicitadoPor
            ]);
        }

        return 'Solicitação enviada com sucesso.';
    }

    public function responder(
        int $vinculoId,
        int $usuarioId,
        bool $modoProfissional,
        bool $aceitar
    ): string {
        $sql = "SELECT v.*, p.usuario_id AS usuario_profissional
                FROM vinculo_profissional v
                JOIN profissional p ON p.id = v.profissional_id
                WHERE v.id = :id";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $vinculoId]);
        $vinculo = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$vinculo || $vinculo['status'] !== 'pendente') {
            return 'Solicitação não encontrada ou já respondida.';
        }

        if ($modoProfissional) {
            $permitido = (int) $vinculo['usuario_profissional'] === $usuarioId
                && $vinculo['solicitado_por'] === 'aluno'
                && $this->profissionalDoUsuario($usuarioId) !== null;
        } else {
            $permitido = (int) $vinculo['aluno_id'] === $usuarioId
                && $vinculo['solicitado_por'] === 'profissional';
        }

        if (!$permitido) {
            return 'Você não pode responder esta solicitação.';
        }

        if ($aceitar) {
            $sql = "UPDATE vinculo_profissional
                    SET status = 'ativo',
                        iniciado_em = NOW(),
                        encerrado_em = NULL
                    WHERE id = :id AND status = 'pendente'";
        } else {
            $sql = "UPDATE vinculo_profissional
                    SET status = 'recusado'
                    WHERE id = :id AND status = 'pendente'";
        }

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $vinculoId]);

        if ($stmt->rowCount() === 0) {
            return 'Esta solicitação já foi respondida.';
        }

        return $aceitar ? 'Solicitação aceita.' : 'Solicitação recusada.';
    }

    public function encerrar(
        int $vinculoId,
        int $usuarioId,
        bool $modoProfissional
    ): string {
        $sql = "SELECT v.*, p.usuario_id AS usuario_profissional
                FROM vinculo_profissional v
                JOIN profissional p ON p.id = v.profissional_id
                WHERE v.id = :id";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $vinculoId]);
        $vinculo = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$vinculo || $vinculo['status'] !== 'ativo') {
            return 'Vínculo ativo não encontrado.';
        }

        if ($modoProfissional) {
            $permitido = (int) $vinculo['usuario_profissional'] === $usuarioId
                && $this->profissionalDoUsuario($usuarioId) !== null;
        } else {
            $permitido = (int) $vinculo['aluno_id'] === $usuarioId;
        }

        if (!$permitido) {
            return 'Você não pode encerrar este vínculo.';
        }

        $sql = "UPDATE vinculo_profissional
                SET status = 'encerrado',
                    encerrado_em = NOW()
                WHERE id = :id AND status = 'ativo'";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $vinculoId]);

        return $stmt->rowCount() > 0
            ? 'Vínculo encerrado.'
            : 'Este vínculo já foi encerrado.';
    }
    public function listarAlunosAtivos(int $usuarioId): array
    {
        $sql = "SELECT
                v.id AS vinculo_id,
                a.id AS aluno_id,
                a.nome AS aluno_nome,
                a.email AS aluno_email,
                v.iniciado_em
            FROM vinculo_profissional v
            JOIN profissional p ON p.id = v.profissional_id
            JOIN usuario a ON a.id = v.aluno_id
            WHERE p.usuario_id = :usuario_id
              AND p.ativo = 1
              AND a.ativo = 1
              AND v.status = 'ativo'
            ORDER BY a.nome ASC";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['usuario_id' => $usuarioId]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function buscarAlunoVinculado(
        int $usuarioId,
        int $alunoId
    ): ?array {
        $sql = "SELECT
                v.id AS vinculo_id,
                a.id AS aluno_id,
                a.nome AS aluno_nome,
                a.email AS aluno_email,
                v.iniciado_em
            FROM vinculo_profissional v
            JOIN profissional p ON p.id = v.profissional_id
            JOIN usuario a ON a.id = v.aluno_id
            WHERE p.usuario_id = :usuario_id
              AND a.id = :aluno_id
              AND p.ativo = 1
              AND a.ativo = 1
              AND v.status = 'ativo'
            LIMIT 1";

        $stmt = $this->pdo->prepare($sql);

        $stmt->execute([
            'usuario_id' => $usuarioId,
            'aluno_id' => $alunoId
        ]);

        $aluno = $stmt->fetch(PDO::FETCH_ASSOC);

        return $aluno === false ? null : $aluno;
    }
}
