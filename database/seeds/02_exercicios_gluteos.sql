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
        'elevacao_pelvica_barra_banco',
        'Elevação pélvica com barra no banco',
        'Barbell Hip Thrust',
        'Apoie a região inferior das escápulas em um banco firme. Posicione a barra sobre a pelve com proteção adequada e mantenha-a estável com as mãos.',
        'Apoie a região inferior das escápulas em um banco firme. Posicione a barra sobre a pelve com proteção adequada e mantenha-a estável com as mãos. Apoie os pés e eleve a pelve pela extensão dos quadris. Termine sem hiperestender a lombar. Desça com controle mantendo a posição dos apoios.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
                codigo = 'peso_corporal_carga_adicional'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Registrar a massa da barra mais todas as anilhas, em quilogramas, sem somar o peso corporal.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'elevacao_pelvica_halter_banco',
        'Elevação pélvica com halter no banco',
        'Dumbbell Hip Thrust',
        'Apoie a região inferior das escápulas no banco e segure um halter sobre a pelve. Mantenha o banco imóvel e a carga segura.',
        'Apoie a região inferior das escápulas no banco e segure um halter sobre a pelve. Mantenha o banco imóvel e a carga segura. Apoie os pés e eleve a pelve pela extensão dos quadris. Termine sem hiperestender a lombar. Desça com controle mantendo a posição dos apoios.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
                codigo = 'peso_corporal_carga_adicional'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Registrar a massa do único halter utilizado, em quilogramas, sem somar o peso corporal.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'ponte_gluteos_halter',
        'Ponte de glúteos com halter',
        'Dumbbell Glute Bridge',
        'Deite no solo e posicione um halter sobre a pelve, mantendo-o seguro com as mãos. Use acolchoamento se necessário.',
        'Deite no solo e posicione um halter sobre a pelve, mantendo-o seguro com as mãos. Use acolchoamento se necessário. Apoie os pés e eleve a pelve pela extensão dos quadris. Termine sem hiperestender a lombar. Desça com controle mantendo a posição dos apoios.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
                codigo = 'peso_corporal_carga_adicional'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Registrar a massa do único halter utilizado, em quilogramas, sem somar o peso corporal.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'ponte_gluteos_solo',
        'Ponte de glúteos no solo',
        'Glute Bridge',
        'Deite de costas com joelhos flexionados e pés no solo. Mantenha os ombros apoiados durante o movimento.',
        'Deite de costas com joelhos flexionados e pés no solo. Mantenha os ombros apoiados durante o movimento. Apoie os pés e eleve a pelve pela extensão dos quadris. Termine sem hiperestender a lombar. Desça com controle mantendo a posição dos apoios.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'Não preencher carga; o peso corporal não deve ser registrado nesse campo.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'ponte_gluteos_unilateral',
        'Ponte de glúteos unilateral',
        'Single-Leg Glute Bridge',
        'Mantenha um pé apoiado e a outra perna suspensa. Eleve a pelve sem girá-la. Complete ambos os lados.',
        'Mantenha um pé apoiado e a outra perna suspensa. Eleve a pelve sem girá-la. Complete ambos os lados. Apoie os pés e eleve a pelve pela extensão dos quadris. Termine sem hiperestender a lombar. Desça com controle mantendo a posição dos apoios.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'Não preencher carga; o peso corporal não deve ser registrado nesse campo.',
        'Registrar repetições por lado; realizar a mesma quantidade em ambos os lados. Uma execução completa do lado trabalhado vale uma repetição.'
    ),
    (
        'terra_convencional',
        'Levantamento terra convencional com barra',
        'Conventional Barbell Deadlift',
        'Com a barra próxima às canelas, estenda joelhos e quadris e devolva a barra ao chão com controle.',
        'Com a barra próxima às canelas, estenda joelhos e quadris e devolva a barra ao chão com controle.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'terra_sumo',
        'Levantamento terra sumô com barra',
        'Sumo Deadlift',
        'Use base ampla e mãos entre os joelhos. Empurre o chão e mantenha a barra próxima ao corpo.',
        'Use base ampla e mãos entre os joelhos. Empurre o chão e mantenha a barra próxima ao corpo.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'elevacao_pelvica_maquina',
        'Elevação pélvica na máquina',
        'Machine Hip Thrust',
        'Posicione o apoio sobre a pelve e estenda os quadris mantendo os pés firmes.',
        'Posicione o apoio sobre a pelve e estenda os quadris mantendo os pés firmes.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'elevacao_pelvica_maquina'
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
        'swing_kettlebell',
        'Swing russo com kettlebell',
        'Russian Kettlebell Swing',
        'Leve o kettlebell entre as coxas com uma dobradiça de quadril. Estenda o quadril para projetá-lo até a altura do peito.',
        'Leve o kettlebell entre as coxas com uma dobradiça de quadril. Estenda o quadril para projetá-lo até a altura do peito.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'kettlebell'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'funcional',
        'treinamento',
        '0',
        '1',
        'Registre a massa do kettlebell.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'extensao_quadril_polia',
        'Extensão de quadril na polia baixa',
        'Cable Hip Extension',
        'Leve a perna para trás sem arquear a lombar ou rodar a pelve.',
        'Leve a perna para trás sem arquear a lombar ou rodar a pelve.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'movi_7c0028c3',
        'Reverse Hyperextension',
        'Reverse Hyperextension',
        'Movimento Reverse Hyperextension, com foco em Glúteos.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'movi_99507114',
        'Deadlift (Band)',
        'Deadlift (Band)',
        'Movimento Deadlift (Band), com foco em Glúteos.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'movi_5f4e6dd3',
        'Deadlift (Dumbbell)',
        'Deadlift (Dumbbell)',
        'Movimento Deadlift (Dumbbell), com foco em Glúteos.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'movi_92b8c7e1',
        'Hip Thrust',
        'Hip Thrust',
        'Movimento Hip Thrust, com foco em Glúteos.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'movi_291aba92',
        'Hip Thrust (Smith Machine)',
        'Hip Thrust (Smith Machine)',
        'Movimento Hip Thrust (Smith Machine), com foco em Glúteos.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'movi_49c922a1',
        'Glute Bridge (Barbell)',
        'Glute Bridge (Barbell)',
        'Movimento Glute Bridge (Barbell), com foco em Glúteos.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'movi_cba02382',
        'Glute Kickback (Machine)',
        'Glute Kickback (Machine)',
        'Movimento Glute Kickback (Machine), com foco em Glúteos.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'movi_987234ab',
        'Glute Kickback on Floor',
        'Glute Kickback on Floor',
        'Movimento Glute Kickback on Floor, com foco em Glúteos.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'movi_cc016611',
        'Clamshell',
        'Clamshell',
        'Movimento Clamshell, com foco em Glúteos.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        '',
        ''
    ),
    (
        'movi_2af8b552',
        'Fire Hydrants',
        'Fire Hydrants',
        'Movimento Fire Hydrants, com foco em Glúteos.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'movi_b923b230',
        'Deadlift (Trap bar)',
        'Deadlift (Trap bar)',
        'Movimento Deadlift (Trap bar), com foco em Glúteos.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'movi_20870ed5',
        'Deadlift (Smith Machine)',
        'Deadlift (Smith Machine)',
        'Movimento Deadlift (Smith Machine), com foco em Glúteos.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'movi_487b3755',
        'Single Leg Hip Thrust',
        'Single Leg Hip Thrust',
        'Movimento Single Leg Hip Thrust, com foco em Glúteos.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        '',
        ''
    ),
    (
        'movi_d1cd146f',
        'Single Leg Hip Thrust (Dumbbell)',
        'Single Leg Hip Thrust (Dumbbell)',
        'Movimento Single Leg Hip Thrust (Dumbbell), com foco em Glúteos.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        '',
        ''
    ),
    (
        'movi_8c331cd8',
        'Cable Pull Through',
        'Cable Pull Through',
        'Movimento Cable Pull Through, com foco em Glúteos.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'movi_101',
        'Swing americano com kettlebell',
        '',
        'Swing americano com kettlebell. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'kettlebell'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_102',
        'Swing unilateral com kettlebell',
        '',
        'Swing unilateral com kettlebell. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'kettlebell'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_103',
        'Swing alternado com kettlebell',
        '',
        'Swing alternado com kettlebell. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'kettlebell'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_138',
        'Salto lateral de patinador',
        '',
        'Salto lateral de patinador. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_178',
        'Terra com pegada de arranco',
        '',
        'Terra com pegada de arranco. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'olimpico',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_182',
        'Transições de quadril 90/90',
        '',
        'Transições de quadril 90/90. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'movi_188',
        'Hip airplane',
        '',
        'Hip airplane. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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
        'movi_199',
        'Alongamento de glúteo figura quatro',
        '',
        'Alongamento de glúteo figura quatro. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'gluteos'
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