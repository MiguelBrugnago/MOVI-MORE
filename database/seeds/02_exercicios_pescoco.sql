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
        'movi_22fedca4',
        'Lying Neck Curls',
        'Lying Neck Curls',
        'Movimento Lying Neck Curls, com foco em Pescoço.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'pescoco'
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
        'movi_0910bd28',
        'Lying Neck Extension',
        'Lying Neck Extension',
        'Movimento Lying Neck Extension, com foco em Pescoço.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'pescoco'
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
        'movi_31b8da0f',
        'Lying Neck Curls (Weighted)',
        'Lying Neck Curls (Weighted)',
        'Movimento Lying Neck Curls (Weighted), com foco em Pescoço.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'pescoco'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'anilha'
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
        '',
        ''
    ),
    (
        'movi_d6a73cf2',
        'Lying Neck Extension (Weighted)',
        'Lying Neck Extension (Weighted)',
        'Movimento Lying Neck Extension (Weighted), com foco em Pescoço.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'pescoco'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'anilha'
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
        '',
        ''
    ),
    (
        'movi_205',
        'Alongamento lateral do pescoço',
        '',
        'Alongamento lateral do pescoço. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'pescoco'
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