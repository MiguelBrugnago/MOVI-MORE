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
        'encolhimento_halteres',
        'Encolhimento com halteres',
        'Dumbbell Shrug',
        'Segure os halteres ao lado do corpo e eleve os ombros sem girá-los.',
        'Segure os halteres ao lado do corpo e eleve os ombros sem girá-los.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'trapezio'
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
        'Registre a soma das massas dos dois halteres.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'encolhimento_barra',
        'Encolhimento com barra',
        'Barbell Shrug',
        'Segure a barra à frente das coxas e eleve os ombros com os cotovelos estendidos.',
        'Segure a barra à frente das coxas e eleve os ombros com os cotovelos estendidos.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'trapezio'
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
        'Registre a massa total da barra e das anilhas.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'movi_ffabc123',
        'Shrug (Cable)',
        'Shrug (Cable)',
        'Movimento Shrug (Cable), com foco em Trapézio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'trapezio'
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
        'movi_19a38071',
        'Shrug (Machine)',
        'Shrug (Machine)',
        'Movimento Shrug (Machine), com foco em Trapézio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'trapezio'
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
        'movi_742e5bd5',
        'Shrug (Smith Machine)',
        'Shrug (Smith Machine)',
        'Movimento Shrug (Smith Machine), com foco em Trapézio.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'trapezio'
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