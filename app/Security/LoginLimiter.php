<?php

declare(strict_types=1);

namespace App\Security;

use App\Config\Database;
use PDO;

final class LoginLimiter
{
    private const LIMITE_COMBINACAO = 5;
    private const LIMITE_IP = 30;
    private const JANELA_SEGUNDOS = 900;

    private PDO $pdo;
    private string $identificador;
    private string $ipHash;

    public function __construct(string $email, string $ip)
    {
        $this->pdo = Database::conectar();

        // As tentativas usam hashes do e-mail normalizado e do IP.
        $email = strtolower(trim($email));

        $this->identificador = hash('sha256', $email);
        $this->ipHash = hash('sha256', $ip);
    }

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
