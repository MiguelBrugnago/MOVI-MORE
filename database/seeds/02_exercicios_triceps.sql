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
        'triceps_acima_cabeca_corda',
        'Tríceps acima da cabeça com corda na polia',
        'Overhead Rope Triceps Extension',
        'De costas para a polia, leve a corda acima da cabeça. Mantenha os braços elevados e flexione e estenda os cotovelos sem arquear a lombar.',
        'De costas para a polia, leve a corda acima da cabeça. Mantenha os braços elevados e flexione e estenda os cotovelos sem arquear a lombar. Mantenha o tronco estável. Estenda os cotovelos sem usar balanço do corpo. Retorne com controle, preservando a posição dos braços indicada para a variação.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        '0',
        '1',
        'Registrar a carga selecionada na pilha, na unidade indicada pelo equipamento. Comparar resultados no mesmo aparelho; a relação de polias pode variar.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'triceps_polia_barra_reta',
        'Tríceps na polia com barra reta',
        'Cable Triceps Pushdown',
        'Use pegada pronada na barra curta. Mantenha os braços ao lado do tronco e empurre a barra para baixo.',
        'Use pegada pronada na barra curta. Mantenha os braços ao lado do tronco e empurre a barra para baixo. Mantenha o tronco estável. Estenda os cotovelos sem usar balanço do corpo. Retorne com controle, preservando a posição dos braços indicada para a variação.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'polia_alta'
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
        'Registrar a carga selecionada na pilha, na unidade indicada pelo equipamento. Comparar resultados no mesmo aparelho; a relação de polias pode variar.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'triceps_polia_corda',
        'Tríceps na polia com corda',
        'Rope Triceps Pushdown',
        'Segure as extremidades da corda com pegada neutra. Estenda os cotovelos mantendo os braços junto ao tronco; separe discretamente as pontas ao final.',
        'Segure as extremidades da corda com pegada neutra. Estenda os cotovelos mantendo os braços junto ao tronco; separe discretamente as pontas ao final. Mantenha o tronco estável. Estenda os cotovelos sem usar balanço do corpo. Retorne com controle, preservando a posição dos braços indicada para a variação.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'polia_alta'
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
        'Registrar a carga selecionada na pilha, na unidade indicada pelo equipamento. Comparar resultados no mesmo aparelho; a relação de polias pode variar.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'triceps_testa_barra_w',
        'Tríceps testa com barra W',
        'EZ-Bar Lying Triceps Extension',
        'Deite no banco e sustente a barra acima do tronco. Flexione os cotovelos levando a barra em direção à região acima da testa, sem aproximá-la de forma descontrolada do rosto.',
        'Deite no banco e sustente a barra acima do tronco. Flexione os cotovelos levando a barra em direção à região acima da testa, sem aproximá-la de forma descontrolada do rosto. Mantenha o tronco estável. Estenda os cotovelos sem usar balanço do corpo. Retorne com controle, preservando a posição dos braços indicada para a variação.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'barra_w'
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
        'triceps_testa_halteres',
        'Tríceps testa com halteres',
        'Dumbbell Lying Triceps Extension',
        'Deite no banco com um halter em cada mão e pegada neutra. Flexione os cotovelos levando os halteres ao lado da cabeça e estenda simultaneamente.',
        'Deite no banco com um halter em cada mão e pegada neutra. Flexione os cotovelos levando os halteres ao lado da cabeça e estenda simultaneamente. Mantenha o tronco estável. Estenda os cotovelos sem usar balanço do corpo. Retorne com controle, preservando a posição dos braços indicada para a variação.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        'mergulho_paralelas',
        'Mergulho nas barras paralelas',
        'Parallel Bar Dip',
        'Flexione os cotovelos até uma amplitude controlável e pressione as barras para retornar.',
        'Flexione os cotovelos até uma amplitude controlável e pressione as barras para retornar.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'barras_paralelas'
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
        'triceps_halter_acima',
        'Extensão de tríceps acima da cabeça com halter',
        'Overhead Dumbbell Triceps Extension',
        'Segure um halter com as duas mãos acima da cabeça e flexione os cotovelos para baixar a carga atrás dela.',
        'Segure um halter com as duas mãos acima da cabeça e flexione os cotovelos para baixar a carga atrás dela.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        'Registre a massa do halter.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'movi_2f8d3067',
        'Triceps Extension (Barbell)',
        'Triceps Extension (Barbell)',
        'Movimento Triceps Extension (Barbell), com foco em Tríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        'movi_21310f5f',
        'Triceps Extension (Cable)',
        'Triceps Extension (Cable)',
        'Movimento Triceps Extension (Cable), com foco em Tríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        'movi_3092fadd',
        'Triceps Extension (Machine)',
        'Triceps Extension (Machine)',
        'Movimento Triceps Extension (Machine), com foco em Tríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        'movi_6182ee83',
        'Triceps Extension (Suspension)',
        'Triceps Extension (Suspension)',
        'Movimento Triceps Extension (Suspension), com foco em Tríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        '',
        ''
    ),
    (
        'movi_875f585f',
        'Skullcrusher (Barbell)',
        'Skullcrusher (Barbell)',
        'Movimento Skullcrusher (Barbell), com foco em Tríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        'movi_8b5bed30',
        'Reverse Grip Triceps Pushdown',
        'Reverse Grip Triceps Pushdown',
        'Movimento Reverse Grip Triceps Pushdown, com foco em Tríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        'movi_552ab030',
        'Single Arm Triceps Pushdown (Cable)',
        'Single Arm Triceps Pushdown (Cable)',
        'Movimento Single Arm Triceps Pushdown (Cable), com foco em Tríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        'movi_cd6dc8e5',
        'Bench Dip',
        'Bench Dip',
        'Movimento Bench Dip, com foco em Tríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        'movi_4b4bf8c2',
        'Triceps Dip (Assisted)',
        'Triceps Dip (Assisted)',
        'Movimento Triceps Dip (Assisted), com foco em Tríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
                codigo = 'peso_corporal_assistido'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_ec3b69a3',
        'Triceps Kickback (Cable)',
        'Triceps Kickback (Cable)',
        'Movimento Triceps Kickback (Cable), com foco em Tríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        'movi_6127a3ad',
        'Triceps Kickback (Dumbbell)',
        'Triceps Kickback (Dumbbell)',
        'Movimento Triceps Kickback (Dumbbell), com foco em Tríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        'movi_5122e7d9',
        'Seated Dip Machine',
        'Seated Dip Machine',
        'Movimento Seated Dip Machine, com foco em Tríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        'movi_b31eb524',
        'Wide-Elbow Triceps Press (Dumbbell)',
        'Wide-Elbow Triceps Press (Dumbbell)',
        'Movimento Wide-Elbow Triceps Press (Dumbbell), com foco em Tríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        'movi_35b51b87',
        'Bench Press - Close Grip (Barbell)',
        'Bench Press - Close Grip (Barbell)',
        'Movimento Bench Press - Close Grip (Barbell), com foco em Tríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        'movi_6575f52d',
        'Diamond Push Up',
        'Diamond Push Up',
        'Movimento Diamond Push Up, com foco em Tríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        'movi_10347bac',
        'Triceps Dip (Weighted)',
        'Triceps Dip (Weighted)',
        'Movimento Triceps Dip (Weighted), com foco em Tríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
                codigo = 'peso_corporal_carga_adicional'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_061',
        'Mergulho na barra reta',
        '',
        'Mergulho na barra reta. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        'movi_062',
        'Mergulho coreano',
        '',
        'Mergulho coreano. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        'movi_063',
        'Mergulho russo nas paralelas',
        '',
        'Mergulho russo nas paralelas. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'barras_paralelas'
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
        'movi_064',
        'Mergulho nas argolas com carga',
        '',
        'Mergulho nas argolas com carga. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
                codigo = 'peso_corporal_carga_adicional'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_082',
        'Extensão de tríceps nas argolas',
        '',
        'Extensão de tríceps nas argolas. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
        'movi_146',
        'Crab walk',
        '',
        'Crab walk. Registre a distância percorrida.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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
                codigo = 'distancia'
        ),
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_196',
        'Alongamento de tríceps acima da cabeça',
        '',
        'Alongamento de tríceps acima da cabeça. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'triceps'
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