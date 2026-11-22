-- As rotinas anteriores continuam pessoais. O modelo usa o mesmo editor de exercícios e séries.
ALTER TABLE rotina
    ADD COLUMN modelo_profissional BOOLEAN NOT NULL DEFAULT FALSE,
    ADD INDEX ix_rotina_modelos (usuario_id, modelo_profissional, ativa);

CREATE TABLE proposta_rotina (
    id INT PRIMARY KEY AUTO_INCREMENT,
    vinculo_id INT NOT NULL,
    modelo_id INT NOT NULL,
    chave_envio CHAR(32) NOT NULL,
    rotina_aceita_id INT UNIQUE,
    status ENUM('pendente','aceita','recusada','cancelada') NOT NULL DEFAULT 'pendente',
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    objetivo VARCHAR(80),
    dia_semana TINYINT,
    criada_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    respondida_em DATETIME,
    -- O MySQL permite várias chaves NULL. Só a proposta pendente reserva o par vínculo/modelo.
    pendente TINYINT GENERATED ALWAYS AS (IF(status='pendente',1,NULL)) STORED,
    UNIQUE KEY uq_proposta_pendente (vinculo_id, modelo_id, pendente),
    UNIQUE KEY uq_proposta_envio (vinculo_id, modelo_id, chave_envio),
    FOREIGN KEY (vinculo_id) REFERENCES vinculo_profissional(id),
    FOREIGN KEY (modelo_id) REFERENCES rotina(id),
    FOREIGN KEY (rotina_aceita_id) REFERENCES rotina(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE proposta_exercicio (
    id INT PRIMARY KEY AUTO_INCREMENT,
    proposta_id INT NOT NULL,
    exercicio_id INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    ordem INT NOT NULL,
    descanso_segundos INT,
    observacao TEXT,
    grupo INT,
    -- As metas e a ordem das séries ficam como estavam no momento do envio.
    series JSON NOT NULL,
    UNIQUE KEY uq_proposta_ordem (proposta_id, ordem),
    FOREIGN KEY (proposta_id) REFERENCES proposta_rotina(id),
    FOREIGN KEY (exercicio_id) REFERENCES exercicio(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
