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
        'adutora_maquina',
        'Adução de quadris na cadeira adutora',
        'Seated Hip Adduction',
        'Aproxime as coxas contra os apoios e abra novamente até uma amplitude confortável.',
        'Aproxime as coxas contra os apoios e abra novamente até uma amplitude confortável.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'adutores'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'cadeira_adutora'
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
        'aducao_polia',
        'Adução de quadril na polia baixa',
        'Cable Hip Adduction',
        'De lado para a polia, traga a perna interna em direção à linha média sem girar a pelve.',
        'De lado para a polia, traga a perna interna em direção à linha média sem girar a pelve.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'adutores'
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
        'movi_085',
        'Agachamento cossaco',
        '',
        'Agachamento cossaco. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'adutores'
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
        'movi_095',
        'Prancha Copenhagen com alavanca curta',
        '',
        'Prancha Copenhagen com alavanca curta. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'adutores'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'banco_reto'
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
        'movi_096',
        'Prancha Copenhagen com alavanca longa',
        '',
        'Prancha Copenhagen com alavanca longa. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'adutores'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'banco_reto'
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
        'movi_125',
        'Arrasto lateral de trenó',
        '',
        'Arrasto lateral de trenó. Registre a distância percorrida.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'adutores'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'treno'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_distancia'
        ),
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_198',
        'Alongamento borboleta',
        '',
        'Alongamento borboleta. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'adutores'
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
    ),
    (
        'movi_207',
        'Alongamento de adutores em posição de sapo',
        '',
        'Alongamento de adutores em posição de sapo. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'adutores'
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