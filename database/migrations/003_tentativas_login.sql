CREATE TABLE
    IF NOT EXISTS tentativa_login (
        id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        identificador CHAR(64) NOT NULL,
        ip_hash CHAR(64) NOT NULL,
        sucesso BOOLEAN NOT NULL DEFAULT FALSE,
        criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        INDEX idx_identificador_data (identificador, criado_em),
        INDEX idx_ip_data (ip_hash, criado_em)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;