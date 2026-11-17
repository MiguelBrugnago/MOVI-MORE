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
        'rosca_barra_w',
        'Rosca com barra W',
        'EZ-Bar Curl',
        'Use as partes anguladas da barra em uma posição confortável para os punhos. Mantenha os braços próximos ao tronco.',
        'Use as partes anguladas da barra em uma posição confortável para os punhos. Mantenha os braços próximos ao tronco. Mantenha o tronco estável e os punhos alinhados. Flexione os cotovelos sem impulsionar o peso com o corpo. Desça com controle, preservando a posição dos braços.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'rosca_direta_barra',
        'Rosca direta com barra reta',
        'Barbell Curl',
        'Use pegada supinada e mantenha os braços próximos ao tronco durante a subida e a descida.',
        'Use pegada supinada e mantenha os braços próximos ao tronco durante a subida e a descida. Mantenha o tronco estável e os punhos alinhados. Flexione os cotovelos sem impulsionar o peso com o corpo. Desça com controle, preservando a posição dos braços.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'rosca_halteres_simultanea',
        'Rosca simultânea com halteres',
        'Dumbbell Curl',
        'Use um halter em cada mão, com palmas voltadas para a frente. Flexione os dois cotovelos simultaneamente.',
        'Use um halter em cada mão, com palmas voltadas para a frente. Flexione os dois cotovelos simultaneamente. Mantenha o tronco estável e os punhos alinhados. Flexione os cotovelos sem impulsionar o peso com o corpo. Desça com controle, preservando a posição dos braços.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'rosca_inclinada_halteres_45',
        'Rosca inclinada com halteres a 45 graus',
        'Incline Dumbbell Curl',
        'Ajuste o banco a aproximadamente 45 graus. Apoie as costas e deixe os braços penderem, ligeiramente atrás do tronco. Flexione ambos os cotovelos sem levar os braços à frente.',
        'Ajuste o banco a aproximadamente 45 graus. Apoie as costas e deixe os braços penderem, ligeiramente atrás do tronco. Flexione ambos os cotovelos sem levar os braços à frente. Mantenha o tronco estável e os punhos alinhados. Flexione os cotovelos sem impulsionar o peso com o corpo. Desça com controle, preservando a posição dos braços.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'rosca_martelo_simultanea',
        'Rosca martelo simultânea',
        'Hammer Curl',
        'Mantenha as palmas voltadas uma para a outra durante todo o movimento. Eleve os dois halteres simultaneamente.',
        'Mantenha as palmas voltadas uma para a outra durante todo o movimento. Eleve os dois halteres simultaneamente. Mantenha o tronco estável e os punhos alinhados. Flexione os cotovelos sem impulsionar o peso com o corpo. Desça com controle, preservando a posição dos braços.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'rosca_concentrada',
        'Rosca concentrada com halter',
        'Concentration Curl',
        'Apoie a parte posterior do braço na coxa e flexione o cotovelo sem girar o tronco.',
        'Apoie a parte posterior do braço na coxa e flexione o cotovelo sem girar o tronco.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'Registre a massa do halter.',
        'Conte os ciclos completos por lado.'
    ),
    (
        'rosca_polia_baixa',
        'Rosca direta na polia baixa',
        'Low Cable Curl',
        'De frente para a polia baixa, flexione os cotovelos mantendo os braços junto ao corpo.',
        'De frente para a polia baixa, flexione os cotovelos mantendo os braços junto ao corpo.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'Registre o valor indicado no seletor da máquina.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'movi_d950429e',
        'Drag Curl',
        'Drag Curl',
        'Movimento Drag Curl, com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_4e239ed8',
        'Kettlebell Curl',
        'Kettlebell Curl',
        'Movimento Kettlebell Curl, com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_9283abd5',
        'Plate Curl',
        'Plate Curl',
        'Movimento Plate Curl, com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'anilha'
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
        'movi_3bc06ad3',
        '21s Bicep Curl',
        '21s Bicep Curl',
        'Movimento 21s Bicep Curl, com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_af328e3d',
        'Bicep Curl (Machine)',
        'Bicep Curl (Machine)',
        'Movimento Bicep Curl (Machine), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_1d4b3d6b',
        'Hammer Curl (Band)',
        'Hammer Curl (Band)',
        'Movimento Hammer Curl (Band), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_36e8f14e',
        'Hammer Curl (Cable)',
        'Hammer Curl (Cable)',
        'Movimento Hammer Curl (Cable), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_32c4d4a2',
        'Cross Body Hammer Curl',
        'Cross Body Hammer Curl',
        'Movimento Cross Body Hammer Curl, com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_c01f58d1',
        'Seated Incline Hammer Curl (Dumbbell)',
        'Seated Incline Hammer Curl (Dumbbell)',
        'Movimento Seated Incline Hammer Curl (Dumbbell), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_4f942934',
        'Preacher Curl (Barbell)',
        'Preacher Curl (Barbell)',
        'Movimento Preacher Curl (Barbell), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_fab6eb2f',
        'Preacher Curl (Dumbbell)',
        'Preacher Curl (Dumbbell)',
        'Movimento Preacher Curl (Dumbbell), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_1e9a6b8e',
        'Preacher Curl (Machine)',
        'Preacher Curl (Machine)',
        'Movimento Preacher Curl (Machine), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_1ff4097b',
        'Reverse Grip Concentration Curl',
        'Reverse Grip Concentration Curl',
        'Movimento Reverse Grip Concentration Curl, com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_234897ab',
        'Rope Cable Curl',
        'Rope Cable Curl',
        'Movimento Rope Cable Curl, com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_0b4c1902',
        'Bicep Curl (Suspension)',
        'Bicep Curl (Suspension)',
        'Movimento Bicep Curl (Suspension), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_123ee239',
        'Zottman Curl (Dumbbell)',
        'Zottman Curl (Dumbbell)',
        'Movimento Zottman Curl (Dumbbell), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_582ada23',
        'Overhead Curl (Cable)',
        'Overhead Curl (Cable)',
        'Movimento Overhead Curl (Cable), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_b33b526e',
        'Single Arm Curl (Cable)',
        'Single Arm Curl (Cable)',
        'Movimento Single Arm Curl (Cable), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_112fc6b7',
        'Reverse Curl (Barbell)',
        'Reverse Curl (Barbell)',
        'Movimento Reverse Curl (Barbell), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_942bad12',
        'Pinwheel Curl (Dumbbell)',
        'Pinwheel Curl (Dumbbell)',
        'Movimento Pinwheel Curl (Dumbbell), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_9f48f858',
        'Reverse Curl (Cable)',
        'Reverse Curl (Cable)',
        'Movimento Reverse Curl (Cable), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_b567dd46',
        'Reverse Curl (Dumbbell)',
        'Reverse Curl (Dumbbell)',
        'Movimento Reverse Curl (Dumbbell), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_2348ab72',
        'Spider Curl (Barbell)',
        'Spider Curl (Barbell)',
        'Movimento Spider Curl (Barbell), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_90427d4a',
        'Spider Curl (Dumbbell)',
        'Spider Curl (Dumbbell)',
        'Movimento Spider Curl (Dumbbell), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_72297e8c',
        'Waiter Curl (Dumbbell)',
        'Waiter Curl (Dumbbell)',
        'Movimento Waiter Curl (Dumbbell), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_2dbca395',
        'Behind the Back Curl (Cable)',
        'Behind the Back Curl (Cable)',
        'Movimento Behind the Back Curl (Cable), com foco em Bíceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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
        'movi_081',
        'Rosca nas argolas',
        '',
        'Rosca nas argolas. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'biceps'
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