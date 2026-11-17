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
        'crucifixo_inverso_halteres',
        'Crucifixo inverso com halteres',
        'Bent-Over Reverse Fly',
        'Incline o tronco pelo quadril e abra os braços lateralmente sem mudar o ângulo dos cotovelos.',
        'Incline o tronco pelo quadril e abra os braços lateralmente sem mudar o ângulo dos cotovelos.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'desenvolvimento_halteres',
        'Desenvolvimento sentado com halteres',
        'Seated Dumbbell Shoulder Press',
        'Parta com os halteres ao lado dos ombros, pressione acima da cabeça e retorne sem arquear a lombar.',
        'Parta com os halteres ao lado dos ombros, pressione acima da cabeça e retorne sem arquear a lombar.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'desenvolvimento_barra',
        'Desenvolvimento em pé com barra',
        'Standing Barbell Overhead Press',
        'Da altura dos ombros, pressione a barra acima da cabeça mantendo as costelas sobre a pelve.',
        'Da altura dos ombros, pressione a barra acima da cabeça mantendo as costelas sobre a pelve.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'desenvolvimento_maquina',
        'Desenvolvimento na máquina',
        'Machine Shoulder Press',
        'Ajuste o assento para iniciar com as alças próximas aos ombros e pressione acima da cabeça.',
        'Ajuste o assento para iniciar com as alças próximas aos ombros e pressione acima da cabeça.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'desenvolvimento_maquina'
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
        'face_pull_corda',
        'Face pull com corda na polia',
        'Cable Face Pull',
        'Puxe a corda em direção ao rosto abrindo as mãos ao lado da cabeça.',
        'Puxe a corda em direção ao rosto abrindo as mãos ao lado da cabeça.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'Registre o valor indicado no seletor da máquina.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'movi_542f3cd5',
        'Push Press',
        'Push Press',
        'Movimento Push Press, com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_a69ff221',
        'Arnold Press (Dumbbell)',
        'Arnold Press (Dumbbell)',
        'Movimento Arnold Press (Dumbbell), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_e8d86ee8',
        'Band Pullaparts',
        'Band Pullaparts',
        'Movimento Band Pullaparts, com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_47b036ef',
        'Front Raise (Band)',
        'Front Raise (Band)',
        'Movimento Front Raise (Band), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_bd86efd5',
        'Front Raise (Barbell)',
        'Front Raise (Barbell)',
        'Movimento Front Raise (Barbell), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_dbb91a3c',
        'Front Raise (Cable)',
        'Front Raise (Cable)',
        'Movimento Front Raise (Cable), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_8293e554',
        'Front Raise (Dumbbell)',
        'Front Raise (Dumbbell)',
        'Movimento Front Raise (Dumbbell), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_6433cd93',
        'Kettlebell Shoulder Press',
        'Kettlebell Shoulder Press',
        'Movimento Kettlebell Shoulder Press, com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_878cd1d0',
        'Shoulder Press (Dumbbell)',
        'Shoulder Press (Dumbbell)',
        'Movimento Shoulder Press (Dumbbell), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_059e835d',
        'Shoulder Press (Machine Plates)',
        'Shoulder Press (Machine Plates)',
        'Movimento Shoulder Press (Machine Plates), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_df200976',
        'Lateral Raise (Band)',
        'Lateral Raise (Band)',
        'Movimento Lateral Raise (Band), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_be289e45',
        'Lateral Raise (Cable)',
        'Lateral Raise (Cable)',
        'Movimento Lateral Raise (Cable), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_422b08f1',
        'Lateral Raise (Dumbbell)',
        'Lateral Raise (Dumbbell)',
        'Movimento Lateral Raise (Dumbbell), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_d5d0354d',
        'Lateral Raise (Machine)',
        'Lateral Raise (Machine)',
        'Movimento Lateral Raise (Machine), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_c315dc2a',
        'Rear Delt Reverse Fly (Cable)',
        'Rear Delt Reverse Fly (Cable)',
        'Movimento Rear Delt Reverse Fly (Cable), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_d8281c62',
        'Rear Delt Reverse Fly (Machine)',
        'Rear Delt Reverse Fly (Machine)',
        'Movimento Rear Delt Reverse Fly (Machine), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_0efe8162',
        'Pike Pushup',
        'Pike Pushup',
        'Movimento Pike Pushup, com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_4288g454',
        'Kettlebell Halo',
        'Kettlebell Halo',
        'Movimento Kettlebell Halo, com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_90b04f96',
        'Handstand Push Up',
        'Handstand Push Up',
        'Movimento Handstand Push Up, com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_796e8e2c',
        'Front Raise (Suspension)',
        'Front Raise (Suspension)',
        'Movimento Front Raise (Suspension), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_b09a1304',
        'Overhead Press (Smith Machine)',
        'Overhead Press (Smith Machine)',
        'Movimento Overhead Press (Smith Machine), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_54e60954',
        'Overhead Plate Raise',
        'Overhead Plate Raise',
        'Movimento Overhead Plate Raise, com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_9264ada1',
        'Reverse Fly Single Arm (Cable)',
        'Reverse Fly Single Arm (Cable)',
        'Movimento Reverse Fly Single Arm (Cable), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_de68c825',
        'Single Arm Lateral Raise (Cable)',
        'Single Arm Lateral Raise (Cable)',
        'Movimento Single Arm Lateral Raise (Cable), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_9372ffaa',
        'Seated Lateral Raise (Dumbbell)',
        'Seated Lateral Raise (Dumbbell)',
        'Movimento Seated Lateral Raise (Dumbbell), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_91af29e0',
        'Seated Overhead Press (Barbell)',
        'Seated Overhead Press (Barbell)',
        'Movimento Seated Overhead Press (Barbell), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_b582299e',
        'Chest Supported Reverse Fly (Dumbbell)',
        'Chest Supported Reverse Fly (Dumbbell)',
        'Movimento Chest Supported Reverse Fly (Dumbbell), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_f21d5693',
        'Chest Supported Y Raise (Dumbbell)',
        'Chest Supported Y Raise (Dumbbell)',
        'Movimento Chest Supported Y Raise (Dumbbell), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_7ab9a362',
        'Upright Row (Barbell)',
        'Upright Row (Barbell)',
        'Movimento Upright Row (Barbell), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_286c1d0b',
        'Upright Row (Cable)',
        'Upright Row (Cable)',
        'Movimento Upright Row (Cable), com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_502fce31',
        'Shoulder Taps',
        'Shoulder Taps',
        'Movimento Shoulder Taps, com foco em Ombros.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_012',
        'Skin the cat nas argolas',
        '',
        'Skin the cat nas argolas. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_013',
        'German hang nas argolas',
        '',
        'German hang nas argolas. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_014',
        'Planche completa',
        '',
        'Planche completa. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'paraletes'
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
        'movi_015',
        'Planche tuck',
        '',
        'Planche tuck. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'paraletes'
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
        'movi_016',
        'Planche advanced tuck',
        '',
        'Planche advanced tuck. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'paraletes'
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
        'movi_017',
        'Planche straddle',
        '',
        'Planche straddle. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'paraletes'
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
        'movi_018',
        'Planche lean',
        '',
        'Planche lean. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_019',
        'Planche com elástico',
        '',
        'Planche com elástico. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_021',
        'Flexão em planche tuck',
        '',
        'Flexão em planche tuck. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'paraletes'
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
        'movi_022',
        'Flexão em planche completa',
        '',
        'Flexão em planche completa. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'paraletes'
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
        'movi_023',
        'Frog stand',
        '',
        'Frog stand. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_024',
        'Parada de mãos com peito na parede',
        '',
        'Parada de mãos com peito na parede. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_025',
        'Parada de mãos com costas na parede',
        '',
        'Parada de mãos com costas na parede. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_026',
        'Caminhada em parada de mãos',
        '',
        'Caminhada em parada de mãos. Registre a distância percorrida.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_027',
        'Subida de pernas à parada de mãos (press handstand)',
        '',
        'Subida de pernas à parada de mãos (press handstand). Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'paraletes'
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
        'movi_028',
        'Flexão em parada de mãos com déficit',
        '',
        'Flexão em parada de mãos com déficit. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'paraletes'
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
        'movi_029',
        'Flexão em parada de mãos com kipping',
        '',
        'Flexão em parada de mãos com kipping. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_030',
        'Flexão pike com pés elevados',
        '',
        'Flexão pike com pés elevados. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_031',
        'Flexão pike com déficit',
        '',
        'Flexão pike com déficit. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'paraletes'
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
        'movi_032',
        'Wall walk',
        '',
        'Wall walk. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_065',
        'Suporte nas argolas com rotação externa',
        '',
        'Suporte nas argolas com rotação externa. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_072',
        'Flexão escapular',
        '',
        'Flexão escapular. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_109',
        'Bent press com kettlebell',
        '',
        'Bent press com kettlebell. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_116',
        'Push press com halteres',
        '',
        'Push press com halteres. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_120',
        'Caminhada com halteres acima da cabeça',
        '',
        'Caminhada com halteres acima da cabeça. Registre a distância percorrida.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        '',
        ''
    ),
    (
        'movi_126',
        'Ondas alternadas com corda naval',
        '',
        'Ondas alternadas com corda naval. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'corda_naval'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'duracao'
        ),
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_127',
        'Ondas simultâneas com corda naval',
        '',
        'Ondas simultâneas com corda naval. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'corda_naval'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'duracao'
        ),
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_158',
        'Crucifixo inverso nas fitas',
        '',
        'Crucifixo inverso nas fitas. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_159',
        'Elevação em Y nas fitas',
        '',
        'Elevação em Y nas fitas. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_161',
        'Rotação externa de ombro com elástico',
        '',
        'Rotação externa de ombro com elástico. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_162',
        'Rotação interna de ombro com elástico',
        '',
        'Rotação interna de ombro com elástico. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_171',
        'Push jerk com barra',
        '',
        'Push jerk com barra. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_186',
        'Shoulder dislocates com bastão',
        '',
        'Shoulder dislocates com bastão. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'bastao'
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
        'movi_187',
        'Wall slides',
        '',
        'Wall slides. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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
        'movi_197',
        'Alongamento de ombro cruzado',
        '',
        'Alongamento de ombro cruzado. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'ombros'
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