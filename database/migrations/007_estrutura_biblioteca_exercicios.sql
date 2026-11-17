SET
    NAMES utf8mb4;

CREATE TABLE
    biblioteca_migracao (
        codigo VARCHAR(100) CHARACTER
        SET
            ascii COLLATE ascii_bin NOT NULL,
            aplicada_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (codigo)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
    grupo_muscular (
        id INT NOT NULL AUTO_INCREMENT,
        codigo VARCHAR(80) CHARACTER
        SET
            ascii COLLATE ascii_bin NOT NULL,
            nome VARCHAR(100) NOT NULL,
            descricao TEXT,
            ordem SMALLINT UNSIGNED NOT NULL DEFAULT 0,
            PRIMARY KEY (id),
            UNIQUE KEY uq_grupo_muscular_codigo (codigo),
            UNIQUE KEY uq_grupo_muscular_nome (nome)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
    familia_movimento (
        id INT NOT NULL AUTO_INCREMENT,
        codigo VARCHAR(100) CHARACTER
        SET
            ascii COLLATE ascii_bin NOT NULL,
            nome VARCHAR(120) NOT NULL,
            descricao TEXT,
            PRIMARY KEY (id),
            UNIQUE KEY uq_familia_movimento_codigo (codigo),
            UNIQUE KEY uq_familia_movimento_nome (nome)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
    padrao_movimento (
        id INT NOT NULL AUTO_INCREMENT,
        codigo VARCHAR(100) CHARACTER
        SET
            ascii COLLATE ascii_bin NOT NULL,
            nome VARCHAR(120) NOT NULL,
            descricao TEXT,
            PRIMARY KEY (id),
            UNIQUE KEY uq_padrao_movimento_codigo (codigo),
            UNIQUE KEY uq_padrao_movimento_nome (nome)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
    tipo_registro (
        id INT NOT NULL AUTO_INCREMENT,
        codigo VARCHAR(80) CHARACTER
        SET
            ascii COLLATE ascii_bin NOT NULL,
            nome VARCHAR(100) NOT NULL,
            usa_repeticoes BOOLEAN NOT NULL,
            usa_carga BOOLEAN NOT NULL,
            usa_duracao BOOLEAN NOT NULL,
            usa_distancia BOOLEAN NOT NULL,
            natureza_carga VARCHAR(30) NOT NULL,
            descricao TEXT,
            PRIMARY KEY (id),
            UNIQUE KEY uq_tipo_registro_codigo (codigo),
            UNIQUE KEY uq_tipo_registro_nome (nome),
            CONSTRAINT ck_tipo_registro_booleanos CHECK (
                usa_repeticoes IN (0, 1)
                AND usa_carga IN (0, 1)
                AND usa_duracao IN (0, 1)
                AND usa_distancia IN (0, 1)
            ),
            CONSTRAINT ck_tipo_registro_metricas CHECK (
                usa_repeticoes + usa_carga + usa_duracao + usa_distancia > 0
            ),
            CONSTRAINT ck_tipo_registro_carga CHECK (
                (
                    usa_carga = 0
                    AND natureza_carga = 'nenhuma'
                )
                OR (
                    usa_carga = 1
                    AND natureza_carga IN ('externa', 'adicional', 'assistencia')
                )
            )
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

ALTER TABLE equipamento
ADD COLUMN codigo VARCHAR(100) CHARACTER
SET
    ascii COLLATE ascii_bin NULL,
    ADD UNIQUE KEY uq_equipamento_codigo (codigo);

ALTER TABLE ambiente
ADD COLUMN codigo VARCHAR(80) CHARACTER
SET
    ascii COLLATE ascii_bin NULL,
    ADD UNIQUE KEY uq_ambiente_codigo (codigo);

ALTER TABLE musculo
ADD COLUMN codigo VARCHAR(100) CHARACTER
SET
    ascii COLLATE ascii_bin NULL,
ADD COLUMN musculo_pai_id INT NULL,
ADD UNIQUE KEY uq_musculo_codigo (codigo),
ADD KEY idx_musculo_pai (musculo_pai_id),
ADD CONSTRAINT fk_musculo_pai FOREIGN KEY (musculo_pai_id) REFERENCES musculo (id);

ALTER TABLE exercicio
ADD COLUMN codigo VARCHAR(120) CHARACTER
SET
    ascii COLLATE ascii_bin NULL,
ADD COLUMN slug VARCHAR(180) CHARACTER
SET
    ascii COLLATE ascii_bin NULL,
ADD COLUMN nome_ingles VARCHAR(180) NULL,
ADD COLUMN grupo_muscular_id INT NULL,
ADD COLUMN familia_movimento_id INT NULL,
ADD COLUMN tipo_registro_id INT NULL,
ADD COLUMN lateralidade VARCHAR(30) NULL,
ADD COLUMN posicao_corporal VARCHAR(120) NULL,
ADD COLUMN posicao_articular TEXT NULL,
ADD COLUMN angulo_execucao VARCHAR(120) NULL,
ADD COLUMN trajetoria VARCHAR(120) NULL,
ADD COLUMN apoio_estabilidade VARCHAR(180) NULL,
ADD COLUMN perfil_resistencia TEXT NULL,
ADD COLUMN mecanismo_carga VARCHAR(40) NULL,
ADD COLUMN bracos_independentes BOOLEAN NULL,
ADD COLUMN criterio_carga TEXT NULL,
ADD COLUMN criterio_repeticoes TEXT NULL,
ADD UNIQUE KEY uq_exercicio_codigo (codigo),
ADD UNIQUE KEY uq_exercicio_slug (slug),
ADD KEY idx_exercicio_nome (nome),
ADD KEY idx_exercicio_grupo_ativo (grupo_muscular_id, ativo),
ADD KEY idx_exercicio_familia (familia_movimento_id),
ADD KEY idx_exercicio_tipo_registro (tipo_registro_id),
ADD CONSTRAINT fk_exercicio_grupo_muscular FOREIGN KEY (grupo_muscular_id) REFERENCES grupo_muscular (id),
ADD CONSTRAINT fk_exercicio_familia_movimento FOREIGN KEY (familia_movimento_id) REFERENCES familia_movimento (id),
ADD CONSTRAINT fk_exercicio_tipo_registro FOREIGN KEY (tipo_registro_id) REFERENCES tipo_registro (id),
ADD CONSTRAINT ck_exercicio_lateralidade CHECK (
    lateralidade IS NULL
    OR lateralidade IN (
        'bilateral',
        'unilateral',
        'alternada',
        'nao_aplicavel'
    )
),
ADD CONSTRAINT ck_exercicio_mecanismo_carga CHECK (
    mecanismo_carga IS NULL
    OR mecanismo_carga IN (
        'peso_corporal',
        'peso_livre',
        'pilha_pesos',
        'anilhas',
        'elastico',
        'pneumatico',
        'hidraulico',
        'eletromagnetico',
        'outro'
    )
),
ADD CONSTRAINT ck_exercicio_bracos_independentes CHECK (
    bracos_independentes IS NULL
    OR bracos_independentes IN (0, 1)
);

CREATE TABLE
    exercicio_nome_alternativo (
        id INT NOT NULL AUTO_INCREMENT,
        exercicio_id INT NOT NULL,
        idioma VARCHAR(10) NOT NULL DEFAULT 'pt-BR',
        nome VARCHAR(180) NOT NULL,
        PRIMARY KEY (id),
        UNIQUE KEY uq_exercicio_nome_alternativo (exercicio_id, idioma, nome),
        KEY idx_exercicio_nome_alternativo_busca (nome),
        CONSTRAINT fk_nome_alternativo_exercicio FOREIGN KEY (exercicio_id) REFERENCES exercicio (id)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
    exercicio_padrao_movimento (
        exercicio_id INT NOT NULL,
        padrao_movimento_id INT NOT NULL,
        PRIMARY KEY (exercicio_id, padrao_movimento_id),
        KEY idx_exercicio_padrao_movimento_padrao (padrao_movimento_id, exercicio_id),
        CONSTRAINT fk_exercicio_padrao_exercicio FOREIGN KEY (exercicio_id) REFERENCES exercicio (id),
        CONSTRAINT fk_exercicio_padrao_padrao FOREIGN KEY (padrao_movimento_id) REFERENCES padrao_movimento (id)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
    exercicio_equipamento_adicional (
        exercicio_id INT NOT NULL,
        equipamento_id INT NOT NULL,
        observacao VARCHAR(255) NULL,
        PRIMARY KEY (exercicio_id, equipamento_id),
        KEY idx_exercicio_equipamento_adicional_equipamento (equipamento_id, exercicio_id),
        CONSTRAINT fk_equipamento_adicional_exercicio FOREIGN KEY (exercicio_id) REFERENCES exercicio (id),
        CONSTRAINT fk_equipamento_adicional_equipamento FOREIGN KEY (equipamento_id) REFERENCES equipamento (id)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

ALTER TABLE exercicio_musculo ADD CONSTRAINT ck_exercicio_musculo_papel CHECK (
    papel IN ('primario', 'secundario', 'estabilizador')
),
ADD KEY idx_exercicio_musculo_busca (musculo_id, papel, exercicio_id);

CREATE TABLE
    exercicio_midia (
        id INT NOT NULL AUTO_INCREMENT,
        exercicio_id INT NOT NULL,
        codigo VARCHAR(120) CHARACTER
        SET
            ascii COLLATE ascii_bin NOT NULL,
            tipo VARCHAR(20) NOT NULL,
            localizacao VARCHAR(1024) NOT NULL,
            descricao_acessivel VARCHAR(500) NOT NULL,
            angulo_visualizacao VARCHAR(100) NULL,
            lado_demonstrado VARCHAR(20) NULL,
            ordem SMALLINT UNSIGNED NOT NULL DEFAULT 0,
            principal BOOLEAN NOT NULL DEFAULT FALSE,
            origem VARCHAR(1024) NULL,
            credito VARCHAR(255) NULL,
            licenca VARCHAR(255) NULL,
            criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            exercicio_principal_id INT GENERATED ALWAYS AS (
                CASE
                    WHEN principal = 1 THEN exercicio_id
                    ELSE NULL
                END
            ) STORED,
            PRIMARY KEY (id),
            UNIQUE KEY uq_exercicio_midia_codigo (codigo),
            UNIQUE KEY uq_exercicio_midia_principal (exercicio_principal_id),
            KEY idx_exercicio_midia_ordem (exercicio_id, ordem, id),
            CONSTRAINT fk_exercicio_midia_exercicio FOREIGN KEY (exercicio_id) REFERENCES exercicio (id),
            CONSTRAINT ck_exercicio_midia_tipo CHECK (tipo IN ('imagem', 'gif', 'video')),
            CONSTRAINT ck_exercicio_midia_principal CHECK (principal IN (0, 1)),
            CONSTRAINT ck_exercicio_midia_lado CHECK (
                lado_demonstrado IS NULL
                OR lado_demonstrado IN ('direito', 'esquerdo', 'ambos', 'nao_aplicavel')
            ),
            CONSTRAINT ck_exercicio_midia_localizacao CHECK (CHAR_LENGTH(TRIM(localizacao)) > 0),
            CONSTRAINT ck_exercicio_midia_descricao CHECK (CHAR_LENGTH(TRIM(descricao_acessivel)) > 0)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

INSERT INTO
    biblioteca_migracao (codigo)
VALUES
    ('007_estrutura_biblioteca_exercicios');