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
        'panturrilha_em_pe_corporal',
        'Elevação de panturrilhas em pé',
        'Standing Calf Raise',
        'Use os dois pés no solo e mantenha os joelhos próximos da extensão, sem travá-los.',
        'Use os dois pés no solo e mantenha os joelhos próximos da extensão, sem travá-los. Eleve os calcanhares mantendo pressão no antepé. Desça com controle, sem quicar. Preserve o alinhamento dos tornozelos e use apoio para equilíbrio quando indicado.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'panturrilhas'
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
        'panturrilha_sentada_halteres',
        'Elevação de panturrilhas sentada com halteres',
        'Seated Dumbbell Calf Raise',
        'Sente com joelhos próximos de 90 graus. Apoie um halter sobre cada coxa, próximo aos joelhos, mantendo-os seguros com as mãos. Eleve os dois calcanhares simultaneamente.',
        'Sente com joelhos próximos de 90 graus. Apoie um halter sobre cada coxa, próximo aos joelhos, mantendo-os seguros com as mãos. Eleve os dois calcanhares simultaneamente. Eleve os calcanhares mantendo pressão no antepé. Desça com controle, sem quicar. Preserve o alinhamento dos tornozelos e use apoio para equilíbrio quando indicado.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'panturrilhas'
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
        'panturrilha_sentada_maquina',
        'Elevação de panturrilhas na máquina sentada',
        'Seated Calf Raise Machine',
        'Ajuste o apoio sobre as coxas e posicione o antepé na plataforma. Libere a trava e mova os dois tornozelos simultaneamente. Esta variação usa máquina carregada por anilhas.',
        'Ajuste o apoio sobre as coxas e posicione o antepé na plataforma. Libere a trava e mova os dois tornozelos simultaneamente. Esta variação usa máquina carregada por anilhas. Eleve os calcanhares mantendo pressão no antepé. Desça com controle, sem quicar. Preserve o alinhamento dos tornozelos e use apoio para equilíbrio quando indicado.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'panturrilhas'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'panturrilha_sentada'
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
        'Registrar a soma das anilhas adicionadas, em quilogramas; manter a comparação no mesmo aparelho.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'panturrilha_unilateral_corporal',
        'Elevação de panturrilha unilateral',
        'Single-Leg Calf Raise',
        'Use um pé no solo e apoie uma mão em superfície firme para equilíbrio. Complete os dois lados.',
        'Use um pé no solo e apoie uma mão em superfície firme para equilíbrio. Complete os dois lados. Eleve os calcanhares mantendo pressão no antepé. Desça com controle, sem quicar. Preserve o alinhamento dos tornozelos e use apoio para equilíbrio quando indicado.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'panturrilhas'
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
        'panturrilha_unilateral_halter',
        'Elevação de panturrilha unilateral com halter',
        'Single-Leg Dumbbell Calf Raise',
        'Segure um halter e use a mão livre para equilíbrio. Apoie apenas o pé do lado trabalhado e faça os dois lados.',
        'Segure um halter e use a mão livre para equilíbrio. Apoie apenas o pé do lado trabalhado e faça os dois lados. Eleve os calcanhares mantendo pressão no antepé. Desça com controle, sem quicar. Preserve o alinhamento dos tornozelos e use apoio para equilíbrio quando indicado.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'panturrilhas'
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
        '1',
        '1',
        'Registrar a massa do único halter utilizado, em quilogramas, sem somar o peso corporal.',
        'Registrar repetições por lado; realizar a mesma quantidade em ambos os lados. Uma execução completa do lado trabalhado vale uma repetição.'
    ),
    (
        'panturrilha_maquina_pe',
        'Elevação de panturrilhas na máquina em pé',
        'Standing Machine Calf Raise',
        'Com a frente dos pés apoiada, baixe e eleve os calcanhares mantendo os joelhos estáveis.',
        'Com a frente dos pés apoiada, baixe e eleve os calcanhares mantendo os joelhos estáveis.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'panturrilhas'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'panturrilha_em_pe'
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
        'panturrilha_leg_press',
        'Elevação de panturrilhas no leg press',
        'Leg Press Calf Raise',
        'Apoie a frente dos pés na plataforma e mova os tornozelos mantendo o ângulo dos joelhos.',
        'Apoie a frente dos pés na plataforma e mova os tornozelos mantendo o ângulo dos joelhos.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'panturrilhas'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'leg_press_45'
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
        'Registre a soma das anilhas adicionadas.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'movi_47b9df13',
        'Calf Extension (Machine)',
        'Calf Extension (Machine)',
        'Movimento Calf Extension (Machine), com foco em Panturrilhas.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'panturrilhas'
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
        'movi_e53ccbe5',
        'Standing Calf Raise (Barbell)',
        'Standing Calf Raise (Barbell)',
        'Movimento Standing Calf Raise (Barbell), com foco em Panturrilhas.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'panturrilhas'
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
        'movi_6da40660',
        'Standing Calf Raise (Dumbbell)',
        'Standing Calf Raise (Dumbbell)',
        'Movimento Standing Calf Raise (Dumbbell), com foco em Panturrilhas.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'panturrilhas'
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
        'movi_e51ccbe5',
        'Single Leg Standing Calf Raise (Barbell)',
        'Single Leg Standing Calf Raise (Barbell)',
        'Movimento Single Leg Standing Calf Raise (Barbell), com foco em Panturrilhas.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'panturrilhas'
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
        'movi_b05c2c29',
        'Single Leg Standing Calf Raise (Machine)',
        'Single Leg Standing Calf Raise (Machine)',
        'Movimento Single Leg Standing Calf Raise (Machine), com foco em Panturrilhas.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'panturrilhas'
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
        '1',
        '1',
        '',
        ''
    ),
    (
        'movi_140',
        'Saltos pogo',
        '',
        'Saltos pogo. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'panturrilhas'
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
        'movi_142',
        'Salto duplo de corda',
        '',
        'Salto duplo de corda. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'panturrilhas'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'corda_pular'
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
        'movi_181',
        'Mobilidade de tornozelo joelho na parede',
        '',
        'Mobilidade de tornozelo joelho na parede. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'panturrilhas'
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
        'movi_193',
        'Alongamento de panturrilha na parede',
        '',
        'Alongamento de panturrilha na parede. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'panturrilhas'
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
        'movi_194',
        'Alongamento de sóleo com joelho flexionado',
        '',
        'Alongamento de sóleo com joelho flexionado. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'panturrilhas'
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