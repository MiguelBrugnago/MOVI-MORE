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
        'abdutora_maquina',
        'Abdução de quadris na cadeira abdutora',
        'Seated Hip Abduction',
        'Afaste as coxas contra os apoios mantendo a pelve firme.',
        'Afaste as coxas contra os apoios mantendo a pelve firme.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'abdutores'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'cadeira_abdutora'
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
        'abducao_deitado',
        'Abdução de quadril deitado de lado',
        'Side-Lying Hip Abduction',
        'Eleve a perna de cima mantendo a pelve empilhada e o pé voltado à frente.',
        'Eleve a perna de cima mantendo a pelve empilhada e o pé voltado à frente.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'abdutores'
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
        '1',
        '1',
        'Deixe a carga em branco.',
        'Conte os ciclos completos por lado.'
    ),
    (
        'abducao_polia',
        'Abdução de quadril na polia baixa',
        'Cable Hip Abduction',
        'De lado para a polia, afaste a perna externa sem inclinar o tronco.',
        'De lado para a polia, afaste a perna externa sem inclinar o tronco.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'abdutores'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'polia_baixa'
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
        'Registre o valor indicado no seletor da máquina.',
        'Conte os ciclos completos por lado.'
    ),
    (
        'caminhada_lateral_miniband',
        'Caminhada lateral com miniband',
        'Lateral Band Walk',
        'Com a faixa acima dos joelhos, dê passos laterais mantendo tensão e a pelve nivelada.',
        'Com a faixa acima dos joelhos, dê passos laterais mantendo tensão e a pelve nivelada.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'abdutores'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'miniband'
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
        '1',
        '1',
        'Identifique a faixa usada nas observações.',
        'Conte cada lado executado como uma repetição.'
    ),
    (
        'movi_163',
        'Monster walk com miniband',
        '',
        'Monster walk com miniband. Registre a distância percorrida.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'abdutores'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'miniband'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'distancia'
        ),
        'funcional',
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