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
        'remada_baixa_triangulo',
        'Remada baixa com triângulo',
        'Seated Cable Row',
        'Sente com apoio firme dos pés e leve flexão dos joelhos. Use o triângulo e puxe em direção ao abdômen, sem embalar o tronco.',
        'Sente com apoio firme dos pés e leve flexão dos joelhos. Use o triângulo e puxe em direção ao abdômen, sem embalar o tronco. Estabilize o tronco. Puxe levando os cotovelos para trás, sem elevar os ombros. Retorne com controle, permitindo o movimento das escápulas sem perder a posição do tronco.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'remada_curvada_barra_pronada',
        'Remada curvada com barra e pegada pronada',
        'Bent-Over Barbell Row',
        'Use pegada pronada. Incline o tronco pela flexão dos quadris e puxe a barra em direção ao abdômen, sem levantar o tronco a cada repetição.',
        'Use pegada pronada. Incline o tronco pela flexão dos quadris e puxe a barra em direção ao abdômen, sem levantar o tronco a cada repetição. Estabilize o tronco. Puxe levando os cotovelos para trás, sem elevar os ombros. Retorne com controle, permitindo o movimento das escápulas sem perder a posição do tronco.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'remada_curvada_barra_supinada',
        'Remada curvada com barra e pegada supinada',
        'Reverse-Grip Barbell Row',
        'Use palmas voltadas para a frente e mantenha os cotovelos próximos ao tronco. Puxe em direção ao abdômen sem dobrar os punhos.',
        'Use palmas voltadas para a frente e mantenha os cotovelos próximos ao tronco. Puxe em direção ao abdômen sem dobrar os punhos. Estabilize o tronco. Puxe levando os cotovelos para trás, sem elevar os ombros. Retorne com controle, permitindo o movimento das escápulas sem perder a posição do tronco.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'remada_halteres_peito_banco_30',
        'Remada com halteres e peito apoiado a 30 graus',
        'Chest-Supported Dumbbell Row',
        'Apoie o peito no encosto a aproximadamente 30 graus. Com pegada neutra, puxe os dois halteres simultaneamente, mantendo o peito no apoio.',
        'Apoie o peito no encosto a aproximadamente 30 graus. Com pegada neutra, puxe os dois halteres simultaneamente, mantendo o peito no apoio. Estabilize o tronco. Puxe levando os cotovelos para trás, sem elevar os ombros. Retorne com controle, permitindo o movimento das escápulas sem perder a posição do tronco.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'remada_unilateral_halter_banco',
        'Remada unilateral com halter e apoio no banco',
        'One-Arm Dumbbell Row',
        'Apoie uma mão e o joelho do mesmo lado no banco. Puxe com o braço oposto, mantendo a pelve estável. Complete a série e troque o lado.',
        'Apoie uma mão e o joelho do mesmo lado no banco. Puxe com o braço oposto, mantendo a pelve estável. Complete a série e troque o lado. Estabilize o tronco. Puxe levando os cotovelos para trás, sem elevar os ombros. Retorne com controle, permitindo o movimento das escápulas sem perder a posição do tronco.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'puxada_frontal',
        'Puxada frontal pronada',
        'Lat Pulldown',
        'Puxe a barra à parte alta do peito e estenda os braços de forma controlada.',
        'Puxe a barra à parte alta do peito e estenda os braços de forma controlada.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'puxada_alta_maquina'
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
        'barra_fixa_pronada',
        'Barra fixa pronada',
        'Pull-Up',
        'Eleve o corpo até o queixo passar a barra e desça com controle.',
        'Eleve o corpo até o queixo passar a barra e desça com controle.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Deixe a carga em branco.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'barra_fixa_supinada',
        'Barra fixa supinada',
        'Chin-Up',
        'Com palmas voltadas para você, eleve o queixo acima da barra e retorne com controle.',
        'Com palmas voltadas para você, eleve o queixo acima da barra e retorne com controle.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Deixe a carga em branco.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'pullover_halter',
        'Pullover com halter no banco',
        'Dumbbell Pullover',
        'Segure um halter acima do peito. Leve-o para trás da cabeça com leve flexão dos cotovelos e retorne sem arquear a lombar.',
        'Segure um halter acima do peito. Leve-o para trás da cabeça com leve flexão dos cotovelos e retorne sem arquear a lombar.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'puxada_bracos_estendidos',
        'Puxada de braços estendidos na polia',
        'Straight-Arm Cable Pulldown',
        'Com leve inclinação do tronco, leve a barra até as coxas mantendo o ângulo dos cotovelos.',
        'Com leve inclinação do tronco, leve a barra até as coxas mantendo o ângulo dos cotovelos.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'Registre o valor indicado no seletor da máquina.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'movi_b123dd01',
        'Pullover (Machine)',
        'Pullover (Machine)',
        'Movimento Pullover (Machine), com foco em Dorsais.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_d82ea543',
        'Kneeling Pulldown (band)',
        'Kneeling Pulldown (band)',
        'Movimento Kneeling Pulldown (band), com foco em Dorsais.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_d2fe7b2e',
        'Lat Pulldown (Band)',
        'Lat Pulldown (Band)',
        'Movimento Lat Pulldown (Band), com foco em Dorsais.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_473cf5b8',
        'Lat Pulldown (Machine)',
        'Lat Pulldown (Machine)',
        'Movimento Lat Pulldown (Machine), com foco em Dorsais.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_2ee45f81',
        'Single Arm Lat Pulldown',
        'Single Arm Lat Pulldown',
        'Movimento Single Arm Lat Pulldown, com foco em Dorsais.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_046e25a2',
        'Reverse Grip Lat Pulldown (Cable)',
        'Reverse Grip Lat Pulldown (Cable)',
        'Movimento Reverse Grip Lat Pulldown (Cable), com foco em Dorsais.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_a91838c0',
        'Kipping Pull Up',
        'Kipping Pull Up',
        'Movimento Kipping Pull Up, com foco em Dorsais.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_f60bddf8',
        'Negative Pull Up',
        'Negative Pull Up',
        'Movimento Negative Pull Up, com foco em Dorsais.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_2c37ec5e',
        'Pull Up (Assisted)',
        'Pull Up (Assisted)',
        'Movimento Pull Up (Assisted), com foco em Dorsais.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_56808fd2',
        'Pull Up (Band)',
        'Pull Up (Band)',
        'Movimento Pull Up (Band), com foco em Dorsais.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_d23c609b',
        'Chin Up (Assisted)',
        'Chin Up (Assisted)',
        'Movimento Chin Up (Assisted), com foco em Dorsais.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_023943f1',
        'Chin Up (Weighted)',
        'Chin Up (Weighted)',
        'Movimento Chin Up (Weighted), com foco em Dorsais.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_72880c57',
        'Vertical Traction (Machine)',
        'Vertical Traction (Machine)',
        'Movimento Vertical Traction (Machine), com foco em Dorsais.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_9273ba17',
        'Rope Straight Arm Pulldown',
        'Rope Straight Arm Pulldown',
        'Movimento Rope Straight Arm Pulldown, com foco em Dorsais.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_5f09f0fc',
        'Ring Pull Up',
        'Ring Pull Up',
        'Movimento Ring Pull Up, com foco em Dorsais.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_729237d1',
        'Pull Up (Weighted)',
        'Pull Up (Weighted)',
        'Movimento Pull Up (Weighted), com foco em Dorsais.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_4e5257de',
        'Lat Pulldown - Close Grip (Cable)',
        'Lat Pulldown - Close Grip (Cable)',
        'Movimento Lat Pulldown - Close Grip (Cable), com foco em Dorsais.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_ee2938d1',
        'Sternum Pull up (Gironda)',
        'Sternum Pull up (Gironda)',
        'Movimento Sternum Pull up (Gironda), com foco em Dorsais.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_001',
        'Front lever tuck',
        '',
        'Front lever tuck. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_002',
        'Front lever advanced tuck',
        '',
        'Front lever advanced tuck. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_003',
        'Front lever straddle',
        '',
        'Front lever straddle. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_004',
        'Front lever com uma perna estendida',
        '',
        'Front lever com uma perna estendida. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_005',
        'Front lever com elástico',
        '',
        'Front lever com elástico. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_006',
        'Remada em front lever tuck',
        '',
        'Remada em front lever tuck. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_007',
        'Remada em front lever',
        '',
        'Remada em front lever. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_008',
        'Back lever',
        '',
        'Back lever. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_009',
        'Back lever tuck',
        '',
        'Back lever tuck. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_010',
        'Back lever advanced tuck',
        '',
        'Back lever advanced tuck. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_011',
        'Back lever straddle',
        '',
        'Back lever straddle. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_043',
        'Barra fixa arqueiro',
        '',
        'Barra fixa arqueiro. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_044',
        'Barra fixa máquina de escrever',
        '',
        'Barra fixa máquina de escrever. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_045',
        'Barra fixa com um braço',
        '',
        'Barra fixa com um braço. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_046',
        'Barra fixa com um braço e elástico',
        '',
        'Barra fixa com um braço e elástico. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_047',
        'Barra fixa em L-sit',
        '',
        'Barra fixa em L-sit. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_048',
        'Barra fixa com pegada neutra',
        '',
        'Barra fixa com pegada neutra. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_049',
        'Barra fixa na toalha',
        '',
        'Barra fixa na toalha. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'toalha'
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
        'movi_050',
        'Barra fixa peito na barra',
        '',
        'Barra fixa peito na barra. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_051',
        'Barra fixa commando',
        '',
        'Barra fixa commando. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_052',
        'Barra fixa com pegada mista',
        '',
        'Barra fixa com pegada mista. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_054',
        'Suspensão ativa na barra',
        '',
        'Suspensão ativa na barra. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_057',
        'Muscle-up nas argolas',
        '',
        'Muscle-up nas argolas. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_058',
        'Muscle-up com elástico',
        '',
        'Muscle-up com elástico. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_059',
        'Muscle-up com carga adicional',
        '',
        'Muscle-up com carga adicional. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_060',
        'Transição de muscle-up nas argolas baixas',
        '',
        'Transição de muscle-up nas argolas baixas. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_111',
        'Remada renegade com halteres',
        '',
        'Remada renegade com halteres. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_124',
        'Puxada de trenó com corda mão sobre mão',
        '',
        'Puxada de trenó com corda mão sobre mão. Registre a distância percorrida.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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
        'movi_169',
        'Subida de corda',
        '',
        'Subida de corda. Registre a distância percorrida.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'corda_escalada'
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
        'movi_170',
        'Subida de corda sem pernas',
        '',
        'Subida de corda sem pernas. Registre a distância percorrida.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'corda_escalada'
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
        'movi_200',
        'Alongamento de dorsais no banco',
        '',
        'Alongamento de dorsais no banco. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'dorsais'
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