<?php

declare(strict_types=1);

namespace App\Security;

use App\Config\Database;
use PDO;

/**
 * Conta tentativas de autenticação no MySQL. AuthController consulta as falhas recentes da
 * combinação de e-mail e IP e também o limite global por IP.
 */
final class LoginLimiter
{
    private const LIMITE_COMBINACAO = 5;
    private const LIMITE_IP = 30;
    private const JANELA_SEGUNDOS = 900;

    private PDO $pdo;
    private string $identificador;
    private string $ipHash;

    /**
     * Obtém a conexão e prepara os hashes do e-mail normalizado e do endereço de origem usados nas
     * consultas.
     *
     * @param string $email Endereço de e-mail da conta.
     * @param string $ip Endereço de origem da requisição.
     */
    public function __construct(string $email, string $ip)
    {
        $this->pdo = Database::conectar();

        // As tentativas usam hashes do e-mail normalizado e do IP.
        $email = strtolower(trim($email));

        $this->identificador = hash('sha256', $email);
        $this->ipHash = hash('sha256', $ip);
    }

    /**
     * Conta falhas nos últimos 900 segundos pelo relógio do banco. Cinco para o mesmo par ou trinta para
     * o mesmo IP atingem o limite.
     *
     * @return bool
     */
    public function bloqueado(): bool
    {
        $sql = '
            SELECT COUNT(*)
            FROM tentativa_login
            WHERE identificador = :email
              AND ip_hash = :ip
              AND sucesso = 0
              AND criado_em >= TIMESTAMPADD(SECOND, :janela, CURRENT_TIMESTAMP)
        ';

        $stmt = $this->pdo->prepare($sql);

        $stmt->execute([
            'email' => $this->identificador,
            'ip' => $this->ipHash,
            'janela' => -self::JANELA_SEGUNDOS
        ]);

        $tentativasCombinacao = (int) $stmt->fetchColumn();

        // O primeiro limite cobre falhas do mesmo par. Se ele permitir prosseguir, a segunda consulta soma as falhas do IP entre contas.
        if ($tentativasCombinacao >= self::LIMITE_COMBINACAO) {
            return true;
        }

        $sql = '
            SELECT COUNT(*)
            FROM tentativa_login
            WHERE ip_hash = :ip
              AND sucesso = 0
              AND criado_em >= TIMESTAMPADD(SECOND, :janela, CURRENT_TIMESTAMP)
        ';

        $stmt = $this->pdo->prepare($sql);

        $stmt->execute([
            'ip' => $this->ipHash,
            'janela' => -self::JANELA_SEGUNDOS
        ]);

        $tentativasIp = (int) $stmt->fetchColumn();

        return $tentativasIp >= self::LIMITE_IP;
    }

    /**
     * Grava uma tentativa sem sucesso para que ela participe das próximas verificações da janela.
     */
    public function registrarFalha(): void
    {
        $sql = '
            INSERT INTO tentativa_login
                (identificador, ip_hash, sucesso)
            VALUES
                (:email, :ip, 0)
        ';

        $stmt = $this->pdo->prepare($sql);

        $stmt->execute([
            'email' => $this->identificador,
            'ip' => $this->ipHash
        ]);
    }

    /**
     * Registra a autenticação bem-sucedida. As falhas anteriores expiram de acordo com a janela.
     */
    public function registrarSucesso(): void
    {
        $sql = '
            INSERT INTO tentativa_login
                (identificador, ip_hash, sucesso)
            VALUES
                (:email, :ip, 1)
        ';

        $stmt = $this->pdo->prepare($sql);

        $stmt->execute([
            'email' => $this->identificador,
            'ip' => $this->ipHash
        ]);
    }

    /**
     * Remove tentativas com mais de um dia usando o horário do banco.
     */
    public function limparRegistrosAntigos(): void
    {
        $sql = '
            DELETE FROM tentativa_login
            WHERE criado_em < CURRENT_TIMESTAMP - INTERVAL 1 DAY
        ';

        $stmt = $this->pdo->prepare($sql);

        $stmt->execute();
    }
}
