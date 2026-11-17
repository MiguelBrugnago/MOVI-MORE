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
        'farmer_walk',
        'Caminhada do fazendeiro com halteres',
        'Dumbbell Farmer Carry',
        'Caminhe com um halter em cada mão mantendo o tronco ereto e os passos estáveis.',
        'Caminhe com um halter em cada mão mantendo o tronco ereto e os passos estáveis.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
                codigo = 'carga_distancia'
        ),
        'funcional',
        'treinamento',
        '0',
        '1',
        'Registre a massa do halter.',
        'Registre a distância percorrida.'
    ),
    (
        'caminhada_esteira',
        'Caminhada na esteira',
        'Treadmill Walk',
        'Comece em velocidade baixa e caminhe com passos naturais sem se pendurar nos apoios.',
        'Comece em velocidade baixa e caminhe com passos naturais sem se pendurar nos apoios.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'esteira'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'duracao_distancia'
        ),
        'musculacao',
        'treinamento',
        '1',
        '1',
        'Deixe a carga em branco.',
        'Registre o tempo e a distância percorrida.'
    ),
    (
        'corrida_esteira',
        'Corrida na esteira',
        'Treadmill Run',
        'Aumente a velocidade gradualmente e mantenha o ritmo de corrida no centro da plataforma.',
        'Aumente a velocidade gradualmente e mantenha o ritmo de corrida no centro da plataforma.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'esteira'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'duracao_distancia'
        ),
        'cardio',
        'treinamento',
        '1',
        '1',
        'Deixe a carga em branco.',
        'Registre o tempo e a distância percorrida.'
    ),
    (
        'movi_84a77566',
        'Press Under',
        'Press Under',
        'Movimento Press Under, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_652fea39',
        'Clean Pull',
        'Clean Pull',
        'Movimento Clean Pull, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_a8814c06',
        'Squat Row',
        'Squat Row',
        'Movimento Squat Row, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_30f03bf0',
        'Front Lever Raise',
        'Front Lever Raise',
        'Movimento Front Lever Raise, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_fa5d0de1',
        'Deadlift High Pull',
        'Deadlift High Pull',
        'Movimento Deadlift High Pull, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_527da061',
        'Stretching',
        'Stretching',
        'Movimento Stretching, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_d3095577',
        'Clean and Press',
        'Clean and Press',
        'Movimento Clean and Press, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_abb00838',
        'Clean',
        'Clean',
        'Movimento Clean, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_bd4e7e53',
        'Hang Clean',
        'Hang Clean',
        'Movimento Hang Clean, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_f99c211d',
        'Kettlebell Clean',
        'Kettlebell Clean',
        'Movimento Kettlebell Clean, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_c628d768',
        'Power Clean',
        'Power Clean',
        'Movimento Power Clean, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_fb09c938',
        'Snatch',
        'Snatch',
        'Movimento Snatch, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_f3717b0e',
        'Dumbbell Snatch',
        'Dumbbell Snatch',
        'Movimento Dumbbell Snatch, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_f4e77594',
        'Hang Snatch',
        'Hang Snatch',
        'Movimento Hang Snatch, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_89304423',
        'Kettlebell Snatch',
        'Kettlebell Snatch',
        'Movimento Kettlebell Snatch, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_e22f9358',
        'Power Snatch',
        'Power Snatch',
        'Movimento Power Snatch, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_e764b907',
        'Split Jerk',
        'Split Jerk',
        'Movimento Split Jerk, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_9e09cec3',
        'Clean and Jerk',
        'Clean and Jerk',
        'Movimento Clean and Jerk, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_991833c2',
        'Jumping Jack',
        'Jumping Jack',
        'Movimento Jumping Jack, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_ba3de542',
        'Jump Shrug',
        'Jump Shrug',
        'Movimento Jump Shrug, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_7d1bd41d',
        'Sled Pull',
        'Sled Pull',
        'Movimento Sled Pull, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_ac0a1bf3',
        'Sled Push',
        'Sled Push',
        'Movimento Sled Push, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_f51d9080',
        'Ball Slams',
        'Ball Slams',
        'Movimento Ball Slams, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_a1f47acc',
        'Wall Ball',
        'Wall Ball',
        'Movimento Wall Ball, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_bb792a36',
        'Burpee',
        'Burpee',
        'Movimento Burpee, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_115cc72c',
        'Burpee Broad Jumps',
        'Burpee Broad Jumps',
        'Movimento Burpee Broad Jumps, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
                codigo = 'duracao_distancia'
        ),
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_86b00dde',
        'Burpee Over the Bar',
        'Burpee Over the Bar',
        'Movimento Burpee Over the Bar, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_f49e31d6',
        'Mountain Climber',
        'Mountain Climber',
        'Movimento Mountain Climber, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_be3615cf',
        'Handstand Hold',
        'Handstand Hold',
        'Movimento Handstand Hold, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_0e608350',
        'Front Lever Hold',
        'Front Lever Hold',
        'Movimento Front Lever Hold, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_ec2510cd',
        'Pilates',
        'Pilates',
        'Movimento Pilates, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_8c9d2928',
        'Yoga',
        'Yoga',
        'Movimento Yoga, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_2cfed196',
        'Overhead Squat',
        'Overhead Squat',
        'Movimento Overhead Squat, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_b3b1d947',
        'Bear Crawl',
        'Bear Crawl',
        'Movimento Bear Crawl, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
                codigo = 'duracao_distancia'
        ),
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_90e506d5',
        'Thruster (Barbell)',
        'Thruster (Barbell)',
        'Movimento Thruster (Barbell), com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_9f9c164b',
        'Muscle Up',
        'Muscle Up',
        'Movimento Muscle Up, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_c9ccb878',
        'High Knee Skips',
        'High Knee Skips',
        'Movimento High Knee Skips, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_7da843a3',
        'Downward Dog',
        'Downward Dog',
        'Movimento Downward Dog, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'alongamento',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_10313afd',
        'Thruster (Kettlebell)',
        'Thruster (Kettlebell)',
        'Movimento Thruster (Kettlebell), com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_5f8903bf',
        'Kettlebell Turkish Get Up',
        'Kettlebell Turkish Get Up',
        'Movimento Kettlebell Turkish Get Up, com foco em Corpo inteiro.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_104',
        'Clean duplo com kettlebells',
        '',
        'Clean duplo com kettlebells. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_105',
        'Clean e press com kettlebell',
        '',
        'Clean e press com kettlebell. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_106',
        'Clean e jerk com kettlebell',
        '',
        'Clean e jerk com kettlebell. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_107',
        'Snatch duplo com kettlebells',
        '',
        'Snatch duplo com kettlebells. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_112',
        'Man maker com halteres',
        '',
        'Man maker com halteres. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_113',
        'Thruster com halteres',
        '',
        'Thruster com halteres. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_114',
        'Devil press com halteres',
        '',
        'Devil press com halteres. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_115',
        'Clean com halteres',
        '',
        'Clean com halteres. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_117',
        'Turkish get-up com halter',
        '',
        'Turkish get-up com halter. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_122',
        'Caminhada com saco de areia abraçado',
        '',
        'Caminhada com saco de areia abraçado. Registre a distância percorrida.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'saco_areia'
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
        'movi_131',
        'Arremesso de medicine ball acima da cabeça para trás',
        '',
        'Arremesso de medicine ball acima da cabeça para trás. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'medicine_ball'
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
        'movi_143',
        'Burpee com salto na caixa',
        '',
        'Burpee com salto na caixa. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'caixa'
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
        'movi_144',
        'Burpee com barra fixa',
        '',
        'Burpee com barra fixa. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_145',
        'Sprawl sem flexão',
        '',
        'Sprawl sem flexão. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_165',
        'Saco de areia ao ombro',
        '',
        'Saco de areia ao ombro. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'saco_areia'
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
        'movi_166',
        'Levantamento de atlas stone',
        '',
        'Levantamento de atlas stone. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'atlas_stone'
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
        'movi_167',
        'Virada de pneu',
        '',
        'Virada de pneu. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'pneu'
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
        'movi_168',
        'Golpe de marreta no pneu',
        '',
        'Golpe de marreta no pneu. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'marreta'
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
        'movi_172',
        'Hang power clean',
        '',
        'Hang power clean. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_173',
        'Hang power snatch',
        '',
        'Hang power snatch. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_174',
        'Snatch balance',
        '',
        'Snatch balance. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_175',
        'Muscle snatch',
        '',
        'Muscle snatch. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_176',
        'Muscle clean',
        '',
        'Muscle clean. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_177',
        'Snatch pull',
        '',
        'Snatch pull. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_179',
        'Tall clean',
        '',
        'Tall clean. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_180',
        'Tall snatch',
        '',
        'Tall snatch. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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
        'movi_189',
        'World greatest stretch',
        '',
        'World greatest stretch. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'corpo_inteiro'
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