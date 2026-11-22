<?php

declare(strict_types=1);

namespace App\Repositories;

use App\Config\Database;
use PDO;

/**
 * Relaciona o perfil profissional à conta de usuário. O painel e o cadastro consultam esse
 * repositório para distinguir existência do perfil e habilitação atual.
 */
final class ProfissionalRepository
{
    private PDO $pdo;

    /**
     * Obtém a conexão usada para consultar e cadastrar perfis profissionais.
     */
    public function __construct()
    {
        $this->pdo = Database::conectar();
    }

    /**
     * Procura o cadastro ligado à conta, inclusive inativo, para identificar um perfil já existente.
     *
     * @param int $usuarioId ID da conta de usuário, distinto do ID do perfil profissional.
     * @return array<string,scalar|null>|null
     */
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

    /**
     * Verifica se existe um perfil ativo para habilitar o modo profissional no painel.
     *
     * @param int $usuarioId ID da conta de usuário, distinto do ID do perfil profissional.
     * @return bool
     */
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

    /**
     * Grava os dados profissionais da conta com perfil ativo e verificação inicialmente pendente.
     *
     * @param int $usuarioId ID da conta de usuário, distinto do ID do perfil profissional.
     * @param string $tipo Chave do tipo de registro.
     * @param ?string $registro Registro profissional informado no cadastro.
     * @param ?string $especialidade Área de atuação informada no cadastro.
     * @param ?string $descricao Descrição opcional do perfil profissional.
     * @return bool
     */
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
