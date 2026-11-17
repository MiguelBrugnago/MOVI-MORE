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
        'good_morning_barra',
        'Good morning com barra',
        'Barbell Good Morning',
        'Apoie a barra na musculatura superior das costas. Com leve flexão dos joelhos, incline o tronco pelo movimento dos quadris, usando carga que permita controle.',
        'Apoie a barra na musculatura superior das costas. Com leve flexão dos joelhos, incline o tronco pelo movimento dos quadris, usando carga que permita controle. Leve o quadril para trás mantendo o tronco estável. Desça somente até onde consegue preservar o controle da coluna. Estenda os quadris para retornar, sem inclinar o tronco para trás no final.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'posteriores_coxa'
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
        'Registrar a massa da barra mais todas as anilhas, em quilogramas, sem somar o peso corporal.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'stiff_barra',
        'Stiff com barra',
        'Stiff-Leg Barbell Deadlift',
        'Mantenha os joelhos próximos da extensão, sem travá-los. Use amplitude menor se necessário para evitar arredondar a coluna; não force o toque da barra no chão.',
        'Mantenha os joelhos próximos da extensão, sem travá-los. Use amplitude menor se necessário para evitar arredondar a coluna; não force o toque da barra no chão. Leve o quadril para trás mantendo o tronco estável. Desça somente até onde consegue preservar o controle da coluna. Estenda os quadris para retornar, sem inclinar o tronco para trás no final.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'posteriores_coxa'
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
        'Registrar a massa da barra mais todas as anilhas, em quilogramas, sem somar o peso corporal.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'terra_romeno_barra',
        'Levantamento terra romeno com barra',
        'Barbell Romanian Deadlift',
        'Inicie em pé. Mantenha leve flexão dos joelhos enquanto leva a barra próxima às pernas. Não é necessário tocar o solo.',
        'Inicie em pé. Mantenha leve flexão dos joelhos enquanto leva a barra próxima às pernas. Não é necessário tocar o solo. Leve o quadril para trás mantendo o tronco estável. Desça somente até onde consegue preservar o controle da coluna. Estenda os quadris para retornar, sem inclinar o tronco para trás no final.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'posteriores_coxa'
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
        'Registrar a massa da barra mais todas as anilhas, em quilogramas, sem somar o peso corporal.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'terra_romeno_halteres',
        'Levantamento terra romeno com halteres',
        'Dumbbell Romanian Deadlift',
        'Use dois halteres próximos às pernas. Preserve leve flexão dos joelhos e controle a profundidade pelo movimento dos quadris.',
        'Use dois halteres próximos às pernas. Preserve leve flexão dos joelhos e controle a profundidade pelo movimento dos quadris. Leve o quadril para trás mantendo o tronco estável. Desça somente até onde consegue preservar o controle da coluna. Estenda os quadris para retornar, sem inclinar o tronco para trás no final.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'posteriores_coxa'
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
        'Registrar a soma das massas dos dois halteres, em quilogramas, sem somar o peso corporal.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'terra_romeno_unilateral_halter',
        'Levantamento terra romeno unilateral com halter',
        'Single-Leg Dumbbell Romanian Deadlift',
        'Segure um halter na mão oposta à perna de apoio. Leve a perna livre para trás sem abrir a pelve. Faça os dois lados.',
        'Segure um halter na mão oposta à perna de apoio. Leve a perna livre para trás sem abrir a pelve. Faça os dois lados. Leve o quadril para trás mantendo o tronco estável. Desça somente até onde consegue preservar o controle da coluna. Estenda os quadris para retornar, sem inclinar o tronco para trás no final.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'posteriores_coxa'
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
        '1',
        '1',
        'Registrar a massa do único halter utilizado, em quilogramas, sem somar o peso corporal.',
        'Registrar repetições por lado; realizar a mesma quantidade em ambos os lados. Uma execução completa do lado trabalhado vale uma repetição.'
    ),
    (
        'flexora_sentada',
        'Flexão de joelhos na cadeira flexora',
        'Seated Leg Curl',
        'Ajuste o apoio das coxas, puxe o rolo para baixo pelos calcanhares e retorne lentamente.',
        'Ajuste o apoio das coxas, puxe o rolo para baixo pelos calcanhares e retorne lentamente.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'posteriores_coxa'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'cadeira_flexora'
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
        'flexora_deitada',
        'Flexão de joelhos na mesa flexora',
        'Lying Leg Curl',
        'Flexione os joelhos para aproximar os calcanhares dos glúteos sem erguer a pelve.',
        'Flexione os joelhos para aproximar os calcanhares dos glúteos sem erguer a pelve.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'posteriores_coxa'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'mesa_flexora'
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
        'flexora_em_pe',
        'Flexão unilateral de joelho na máquina em pé',
        'Standing Single-Leg Curl',
        'Apoie a coxa conforme a máquina e flexione um joelho sem avançar o quadril.',
        'Apoie a coxa conforme a máquina e flexione um joelho sem avançar o quadril.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'posteriores_coxa'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'flexora_em_pe'
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
        'flexora_bola',
        'Flexão de joelhos na bola suíça',
        'Stability Ball Leg Curl',
        'Com os calcanhares sobre a bola e o quadril elevado, flexione os joelhos para trazer a bola em sua direção.',
        'Com os calcanhares sobre a bola e o quadril elevado, flexione os joelhos para trazer a bola em sua direção.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'posteriores_coxa'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'bola_suica'
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
        'movi_68b83ee0',
        'Glute Ham Raise',
        'Glute Ham Raise',
        'Movimento Glute Ham Raise, com foco em Posteriores de coxa.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'posteriores_coxa'
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
        'movi_108d7a14',
        'Nordic Hamstrings Curls',
        'Nordic Hamstrings Curls',
        'Movimento Nordic Hamstrings Curls, com foco em Posteriores de coxa.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'posteriores_coxa'
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
        'movi_0b9b92ba',
        'Romanian Deadlift (Smith Machine)',
        'Romanian Deadlift (Smith Machine)',
        'Movimento Romanian Deadlift (Smith Machine), com foco em Posteriores de coxa.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'posteriores_coxa'
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
        'movi_93472ac1',
        'Single Leg Romanian Deadlift (Barbell)',
        'Single Leg Romanian Deadlift (Barbell)',
        'Movimento Single Leg Romanian Deadlift (Barbell), com foco em Posteriores de coxa.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'posteriores_coxa'
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
        '1',
        '1',
        '',
        ''
    ),
    (
        'movi_088',
        'Nordic curl com elástico',
        '',
        'Nordic curl com elástico. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'posteriores_coxa'
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
                codigo = 'peso_corporal_assistido'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_154',
        'Flexão de joelhos nas fitas de suspensão',
        '',
        'Flexão de joelhos nas fitas de suspensão. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'posteriores_coxa'
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
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_192',
        'Alongamento de posteriores sentado',
        '',
        'Alongamento de posteriores sentado. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'posteriores_coxa'
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