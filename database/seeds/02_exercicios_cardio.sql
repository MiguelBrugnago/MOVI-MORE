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
        'movi_0222db42',
        'Rowing Machine',
        'Rowing Machine',
        'Movimento Rowing Machine, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
                codigo = 'duracao_distancia'
        ),
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_5e0ddace',
        'Aerobics',
        'Aerobics',
        'Movimento Aerobics, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_ac1bb830',
        'Running',
        'Running',
        'Movimento Running, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
                codigo = 'duracao_distancia'
        ),
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_33edd7db',
        'Walking',
        'Walking',
        'Movimento Walking, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
                codigo = 'duracao_distancia'
        ),
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_d8f7f851',
        'Cycling',
        'Cycling',
        'Movimento Cycling, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
                codigo = 'duracao_distancia'
        ),
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_040ba2e3',
        'Jump Rope',
        'Jump Rope',
        'Movimento Jump Rope, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'outro'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'duracao'
        ),
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_24a809ef',
        'Skating',
        'Skating',
        'Movimento Skating, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_084a67ca',
        'Battle Ropes',
        'Battle Ropes',
        'Movimento Battle Ropes, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
                codigo = 'duracao'
        ),
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_a0d8fa1b',
        'Boxing',
        'Boxing',
        'Movimento Boxing, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_911a58d3',
        'Snowboarding',
        'Snowboarding',
        'Movimento Snowboarding, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_e23f1f2b',
        'Climbing',
        'Climbing',
        'Movimento Climbing, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_1c34a172',
        'Hiking',
        'Hiking',
        'Movimento Hiking, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
                codigo = 'duracao_distancia'
        ),
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_023947ab',
        'HIIT',
        'HIIT',
        'Movimento HIIT, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_84325755',
        'Skiing',
        'Skiing',
        'Movimento Skiing, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_b60a678f',
        'Swimming',
        'Swimming',
        'Movimento Swimming, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
                codigo = 'duracao_distancia'
        ),
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_9283baba',
        'Sprints',
        'Sprints',
        'Movimento Sprints, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
                codigo = 'duracao_distancia'
        ),
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_3303376c',
        'Elliptical Trainer',
        'Elliptical Trainer',
        'Movimento Elliptical Trainer, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
                codigo = 'duracao_distancia'
        ),
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_4377a52b',
        'Stair Machine (Floors)',
        'Stair Machine (Floors)',
        'Movimento Stair Machine (Floors), com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
                codigo = 'duracao'
        ),
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_4377a52c',
        'Stair Machine (Steps)',
        'Stair Machine (Steps)',
        'Movimento Stair Machine (Steps), com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
                codigo = 'duracao'
        ),
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_43573bb8',
        'Air Bike',
        'Air Bike',
        'Movimento Air Bike, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
                codigo = 'duracao'
        ),
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_5d99a2fa',
        'Ski Erg',
        'Ski Erg',
        'Movimento Ski Erg, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
                codigo = 'duracao_distancia'
        ),
        'cardio',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_7fd2ec3e',
        'Recumbent Bike',
        'Recumbent Bike',
        'Movimento Recumbent Bike, com foco em Cardio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'cardio'
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
                codigo = 'duracao_distancia'
        ),
        'cardio',
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