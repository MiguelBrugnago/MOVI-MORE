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
        'remada_maquina',
        'Remada sentada na máquina',
        'Machine Row',
        'Puxe as alças em direção ao tronco sem tirar o peito do apoio.',
        'Puxe as alças em direção ao tronco sem tirar o peito do apoio.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'remada_maquina'
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
        'remada_elastico',
        'Remada em pé com elástico',
        'Standing Band Row',
        'Prenda o elástico à altura do tronco e puxe as mãos às costelas mantendo a base firme.',
        'Prenda o elástico à altura do tronco e puxe as mãos às costelas mantendo a base firme.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'elastico_resistencia'
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
        'Identifique a faixa usada nas observações.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'remada_suspensao',
        'Remada nas fitas de suspensão',
        'Suspension Row',
        'Puxe o peito em direção às alças mantendo o corpo alinhado dos calcanhares à cabeça.',
        'Puxe o peito em direção às alças mantendo o corpo alinhado dos calcanhares à cabeça.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'fitas_suspensao'
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
        'Deixe a carga em branco.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'movi_425805f4',
        'Inverted Row',
        'Inverted Row',
        'Movimento Inverted Row, com foco em Dorso superior.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
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
        'movi_d7d7fcce',
        'Landmine Row',
        'Landmine Row',
        'Movimento Landmine Row, com foco em Dorso superior.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'barra_reta'
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
        'movi_f1d60854',
        'Seated Cable Row - Bar Grip',
        'Seated Cable Row - Bar Grip',
        'Movimento Seated Cable Row - Bar Grip, com foco em Dorso superior.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'polia_ajustavel'
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
        'movi_c3bcabb3',
        'Seated Cable Row - Bar Wide Grip',
        'Seated Cable Row - Bar Wide Grip',
        'Movimento Seated Cable Row - Bar Wide Grip, com foco em Dorso superior.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'polia_ajustavel'
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
        'movi_ea820646',
        'Bent Over Row (Band)',
        'Bent Over Row (Band)',
        'Movimento Bent Over Row (Band), com foco em Dorso superior.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'elastico_resistencia'
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
        'movi_23e92538',
        'Bent Over Row (Dumbbell)',
        'Bent Over Row (Dumbbell)',
        'Movimento Bent Over Row (Dumbbell), com foco em Dorso superior.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'halter'
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
        'movi_eb813c91',
        'Bent Over Row (Smith Machine)',
        'Bent Over Row (Smith Machine)',
        'Movimento Bent Over Row (Smith Machine), com foco em Dorso superior.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'smith'
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
        'movi_d0c4a899',
        'Single Arm Cable Row',
        'Single Arm Cable Row',
        'Movimento Single Arm Cable Row, com foco em Dorso superior.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'polia_ajustavel'
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
        '1',
        '1',
        '',
        ''
    ),
    (
        'movi_018adc12',
        'Pendlay Row (Barbell)',
        'Pendlay Row (Barbell)',
        'Movimento Pendlay Row (Barbell), com foco em Dorso superior.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'barra_reta'
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
        'movi_c732c341',
        'Meadows Rows (Barbell)',
        'Meadows Rows (Barbell)',
        'Movimento Meadows Rows (Barbell), com foco em Dorso superior.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'barra_reta'
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
        'movi_aa1eb7d8',
        'Iso-Lateral Row (Machine)',
        'Iso-Lateral Row (Machine)',
        'Movimento Iso-Lateral Row (Machine), com foco em Dorso superior.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
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
        'movi_91fafba3',
        'Iso-Lateral Low Row',
        'Iso-Lateral Low Row',
        'Movimento Iso-Lateral Low Row, com foco em Dorso superior.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
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
        'movi_6a8d3193',
        'Chest Supported T Bar Row',
        'Chest Supported T Bar Row',
        'Movimento Chest Supported T Bar Row, com foco em Dorso superior.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
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
        'movi_08a2974e',
        'T Bar Row',
        'T Bar Row',
        'Movimento T Bar Row, com foco em Dorso superior.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
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
        'movi_fe389074',
        'Rack Pull',
        'Rack Pull',
        'Movimento Rack Pull, com foco em Dorso superior.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'barra_reta'
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
        'movi_c7ae420a',
        'Scapular Pull Ups',
        'Scapular Pull Ups',
        'Movimento Scapular Pull Ups, com foco em Dorso superior.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
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
        'movi_077',
        'Remada arqueiro nas argolas',
        '',
        'Remada arqueiro nas argolas. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'argolas'
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
        'movi_078',
        'Remada invertida com pés elevados',
        '',
        'Remada invertida com pés elevados. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'barra_fixa'
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
        'movi_079',
        'Remada invertida com pegada supinada',
        '',
        'Remada invertida com pegada supinada. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'barra_fixa'
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
        'movi_080',
        'Remada invertida unilateral nas argolas',
        '',
        'Remada invertida unilateral nas argolas. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'argolas'
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
        'movi_183',
        'Rotação torácica em quatro apoios',
        '',
        'Rotação torácica em quatro apoios. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
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
        'movi_184',
        'Open book deitado',
        '',
        'Open book deitado. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorso_superior'
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