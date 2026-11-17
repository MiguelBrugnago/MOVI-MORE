INSERT INTO
    exercicio (
        codigo,
        nome,
        nome_ingles,
        descricao,
        instrucoes,
        grupo_muscular_id,
        equipamento_id,
        tipo_registro_id,
        modalidade,
        tipo,
        unilateral,
        ativo,
        criterio_carga,
        criterio_repeticoes
    )
VALUES
    (
        'extensao_lombar_maquina',
        'Extensão de tronco na máquina',
        'Machine Back Extension',
        'Com a pelve apoiada, pressione o encosto para trás até alinhar o tronco e retorne com controle.',
        'Com a pelve apoiada, pressione o encosto para trás até alinhar o tronco e retorne com controle.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'lombar'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'extensao_lombar_maquina'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Registre o valor indicado no seletor da máquina.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'movi_4f5866f8',
        'Back Extension (Hyperextension)',
        'Back Extension (Hyperextension)',
        'Movimento Back Extension (Hyperextension), com foco em Lombar.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'lombar'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'maquina'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_218da87c',
        'Superman',
        'Superman',
        'Movimento Superman, com foco em Lombar.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'lombar'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_100',
        'Ponte dorsal',
        '',
        'Ponte dorsal. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'lombar'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'duracao'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_185',
        'Cat-cow',
        '',
        'Cat-cow. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'lombar'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'mobilidade',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_203',
        'Postura da criança',
        '',
        'Postura da criança. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'lombar'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'duracao'
        ),
        'alongamento',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ) ON DUPLICATE KEY
UPDATE nome =
VALUES
    (nome),
    nome_ingles =
VALUES
    (nome_ingles),
    descricao =
VALUES
    (descricao),
    instrucoes =
VALUES
    (instrucoes),
    grupo_muscular_id =
VALUES
    (grupo_muscular_id),
    equipamento_id =
VALUES
    (equipamento_id),
    tipo_registro_id =
VALUES
    (tipo_registro_id),
    modalidade =
VALUES
    (modalidade),
    tipo =
VALUES
    (tipo),
    unilateral =
VALUES
    (unilateral),
    ativo =
VALUES
    (ativo),
    criterio_carga =
VALUES
    (criterio_carga),
    criterio_repeticoes =
VALUES
    (criterio_repeticoes);