INSERT INTO
    exercicio_nome_alternativo (exercicio_id, idioma, nome)
VALUES
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'abdominal_bola'
        ),
        'en',
        'Stability Ball Crunch'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'abdominal_maquina'
        ),
        'en',
        'Machine Crunch'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'abdominal_maquina'
        ),
        'en',
        'Crunch (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'abdominal_solo'
        ),
        'en',
        'Crunch'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'abducao_deitado'
        ),
        'en',
        'Side-Lying Hip Abduction'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'abducao_deitado'
        ),
        'en',
        'Lateral Leg Raises'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'abducao_polia'
        ),
        'en',
        'Cable Hip Abduction'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'abducao_polia'
        ),
        'en',
        'Hip Abduction (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'abdutora_maquina'
        ),
        'en',
        'Seated Hip Abduction'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'abdutora_maquina'
        ),
        'en',
        'Hip Abduction (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'aducao_polia'
        ),
        'en',
        'Cable Hip Adduction'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'aducao_polia'
        ),
        'en',
        'Hip Adduction (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'adutora_maquina'
        ),
        'en',
        'Seated Hip Adduction'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'adutora_maquina'
        ),
        'en',
        'Hip Adduction (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'agachamento_barra_costas'
        ),
        'en',
        'Barbell Back Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'agachamento_barra_costas'
        ),
        'en',
        'Full Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'agachamento_barra_costas'
        ),
        'en',
        'Squat (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'agachamento_bulgaro_halteres'
        ),
        'en',
        'Dumbbell Bulgarian Split Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'agachamento_bulgaro_halteres'
        ),
        'en',
        'Bulgarian Split Squat (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'agachamento_dividido_corporal'
        ),
        'en',
        'Bodyweight Split Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'agachamento_dividido_halteres'
        ),
        'en',
        'Dumbbell Split Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'agachamento_dividido_halteres'
        ),
        'en',
        'Split Squat (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'agachamento_frontal_barra'
        ),
        'en',
        'Front Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'agachamento_goblet_halter'
        ),
        'en',
        'Dumbbell Goblet Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'agachamento_goblet_halter'
        ),
        'en',
        'Goblet Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'agachamento_hack'
        ),
        'en',
        'Hack Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'agachamento_livre_corporal'
        ),
        'en',
        'Bodyweight Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'agachamento_pendular'
        ),
        'en',
        'Pendulum Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'agachamento_pendular'
        ),
        'en',
        'Pendulum Squat (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'agachamento_smith'
        ),
        'en',
        'Smith Machine Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'agachamento_smith'
        ),
        'en',
        'Squat (Smith Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'avanco_caminhando_halteres'
        ),
        'en',
        'Dumbbell Walking Lunge'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'avanco_caminhando_halteres'
        ),
        'en',
        'Walking Lunge (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'avanco_reverso_corporal'
        ),
        'en',
        'Bodyweight Reverse Lunge'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'avanco_reverso_corporal'
        ),
        'en',
        'Reverse Lunge'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'avanco_reverso_halteres'
        ),
        'en',
        'Dumbbell Reverse Lunge'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'avanco_reverso_halteres'
        ),
        'en',
        'Reverse Lunge (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'barra_fixa_pronada'
        ),
        'en',
        'Pull-Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'barra_fixa_pronada'
        ),
        'en',
        'Pull Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'barra_fixa_supinada'
        ),
        'en',
        'Chin-Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'barra_fixa_supinada'
        ),
        'en',
        'Chin Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'belt_squat'
        ),
        'en',
        'Belt Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'belt_squat'
        ),
        'en',
        'Belt Squat (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'bicicleta_ergometrica'
        ),
        'en',
        'Stationary Cycling'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'bird_dog'
        ),
        'en',
        'Alternating Bird Dog'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'bird_dog'
        ),
        'en',
        'Bird Dog'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'caminhada_esteira'
        ),
        'en',
        'Treadmill Walk'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'caminhada_lateral_miniband'
        ),
        'en',
        'Lateral Band Walk'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'caminhada_lateral_miniband'
        ),
        'en',
        'Lateral Band Walks'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'corrida_esteira'
        ),
        'en',
        'Treadmill Run'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'corrida_esteira'
        ),
        'en',
        'Treadmill'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'crucifixo_halteres'
        ),
        'en',
        'Dumbbell Fly'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'crucifixo_halteres'
        ),
        'en',
        'Chest Fly (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'crucifixo_inverso_halteres'
        ),
        'en',
        'Bent-Over Reverse Fly'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'crucifixo_inverso_halteres'
        ),
        'en',
        'Rear Delt Reverse Fly (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'crucifixo_maquina'
        ),
        'en',
        'Pec Deck Fly'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'crucifixo_maquina'
        ),
        'en',
        'Butterfly (Pec Deck)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'crucifixo_maquina'
        ),
        'en',
        'Chest Fly (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'dead_bug'
        ),
        'en',
        'Alternating Dead Bug'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'dead_bug'
        ),
        'en',
        'Dead Bug'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'desenvolvimento_barra'
        ),
        'en',
        'Standing Barbell Overhead Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'desenvolvimento_barra'
        ),
        'en',
        'Standing Military Press (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'desenvolvimento_barra'
        ),
        'en',
        'Overhead Press (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'desenvolvimento_halteres'
        ),
        'en',
        'Seated Dumbbell Shoulder Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'desenvolvimento_halteres'
        ),
        'en',
        'Seated Overhead Press (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'desenvolvimento_maquina'
        ),
        'en',
        'Machine Shoulder Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'desenvolvimento_maquina'
        ),
        'en',
        'Seated Shoulder Press (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'elevacao_pelvica_barra_banco'
        ),
        'en',
        'Barbell Hip Thrust'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'elevacao_pelvica_barra_banco'
        ),
        'en',
        'Hip Thrust (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'elevacao_pelvica_halter_banco'
        ),
        'en',
        'Dumbbell Hip Thrust'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'elevacao_pelvica_halter_banco'
        ),
        'en',
        'Hip Thrust (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'elevacao_pelvica_maquina'
        ),
        'en',
        'Machine Hip Thrust'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'elevacao_pelvica_maquina'
        ),
        'en',
        'Hip Thrust (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'encolhimento_barra'
        ),
        'en',
        'Barbell Shrug'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'encolhimento_barra'
        ),
        'en',
        'Shrug (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'encolhimento_halteres'
        ),
        'en',
        'Dumbbell Shrug'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'encolhimento_halteres'
        ),
        'en',
        'Shrug (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'extensao_lombar_maquina'
        ),
        'en',
        'Machine Back Extension'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'extensao_lombar_maquina'
        ),
        'en',
        'Back Extension (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'extensao_quadril_polia'
        ),
        'en',
        'Cable Hip Extension'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'extensao_quadril_polia'
        ),
        'en',
        'Standing Cable Glute Kickbacks'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'extensora_bilateral'
        ),
        'en',
        'Machine Leg Extension'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'extensora_bilateral'
        ),
        'en',
        'Leg Extension (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'extensora_unilateral'
        ),
        'en',
        'Single-Leg Extension'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'extensora_unilateral'
        ),
        'en',
        'Single Leg Extensions'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'face_pull_corda'
        ),
        'en',
        'Cable Face Pull'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'face_pull_corda'
        ),
        'en',
        'Face Pull'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'farmer_walk'
        ),
        'en',
        'Dumbbell Farmer Carry'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'farmer_walk'
        ),
        'en',
        'Farmers Walk'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexao_argolas'
        ),
        'en',
        'Ring Push-Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexao_argolas'
        ),
        'en',
        'Ring Push Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexao_joelhos'
        ),
        'en',
        'Knee Push-Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexao_joelhos'
        ),
        'en',
        'Kneeling Push Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexao_maos_banco'
        ),
        'en',
        'Incline Push-Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexao_maos_banco'
        ),
        'en',
        'Incline Push Ups'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexao_pegada_fechada'
        ),
        'en',
        'Close-Grip Push-Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexao_pegada_fechada'
        ),
        'en',
        'Push Up - Close Grip'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexao_pes_banco'
        ),
        'en',
        'Decline Push-Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexao_pes_banco'
        ),
        'en',
        'Decline Push Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexao_solo'
        ),
        'en',
        'Push-Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexao_solo'
        ),
        'en',
        'Push Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexora_bola'
        ),
        'en',
        'Stability Ball Leg Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexora_deitada'
        ),
        'en',
        'Lying Leg Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexora_deitada'
        ),
        'en',
        'Lying Leg Curl (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexora_em_pe'
        ),
        'en',
        'Standing Single-Leg Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexora_em_pe'
        ),
        'en',
        'Standing Leg Curls'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexora_sentada'
        ),
        'en',
        'Seated Leg Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'flexora_sentada'
        ),
        'en',
        'Seated Leg Curl (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'good_morning_barra'
        ),
        'en',
        'Barbell Good Morning'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'good_morning_barra'
        ),
        'en',
        'Good Morning (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'leg_press_45'
        ),
        'en',
        '45-Degree Leg Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'leg_press_45'
        ),
        'en',
        'Leg Press (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'leg_press_horizontal'
        ),
        'en',
        'Horizontal Leg Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'leg_press_horizontal'
        ),
        'en',
        'Leg Press Horizontal (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'mergulho_paralelas'
        ),
        'en',
        'Parallel Bar Dip'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'mergulho_paralelas'
        ),
        'en',
        'Triceps Dip'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'pallof_polia'
        ),
        'en',
        'Cable Pallof Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'pallof_polia'
        ),
        'en',
        'Cable Core Pallof Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'panturrilha_em_pe_corporal'
        ),
        'en',
        'Standing Calf Raise'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'panturrilha_leg_press'
        ),
        'en',
        'Leg Press Calf Raise'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'panturrilha_maquina_pe'
        ),
        'en',
        'Standing Machine Calf Raise'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'panturrilha_maquina_pe'
        ),
        'en',
        'Standing Calf Raise (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'panturrilha_sentada_halteres'
        ),
        'en',
        'Seated Dumbbell Calf Raise'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'panturrilha_sentada_maquina'
        ),
        'en',
        'Seated Calf Raise Machine'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'panturrilha_sentada_maquina'
        ),
        'en',
        'Seated Calf Raise'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'panturrilha_unilateral_corporal'
        ),
        'en',
        'Single-Leg Calf Raise'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'panturrilha_unilateral_corporal'
        ),
        'en',
        'Single Leg Standing Calf Raise'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'panturrilha_unilateral_halter'
        ),
        'en',
        'Single-Leg Dumbbell Calf Raise'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'panturrilha_unilateral_halter'
        ),
        'en',
        'Single Leg Standing Calf Raise (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'ponte_gluteos_halter'
        ),
        'en',
        'Dumbbell Glute Bridge'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'ponte_gluteos_solo'
        ),
        'en',
        'Glute Bridge'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'ponte_gluteos_unilateral'
        ),
        'en',
        'Single-Leg Glute Bridge'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'ponte_gluteos_unilateral'
        ),
        'en',
        'Single Leg Glute Bridge'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'prancha_antebracos'
        ),
        'en',
        'Forearm Plank'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'prancha_antebracos'
        ),
        'en',
        'Plank'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'prancha_lateral'
        ),
        'en',
        'Side Plank'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'pullover_halter'
        ),
        'en',
        'Dumbbell Pullover'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'pullover_halter'
        ),
        'en',
        'Pullover (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'puxada_bracos_estendidos'
        ),
        'en',
        'Straight-Arm Cable Pulldown'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'puxada_bracos_estendidos'
        ),
        'en',
        'Straight Arm Lat Pulldown (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'puxada_frontal'
        ),
        'en',
        'Lat Pulldown'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'puxada_frontal'
        ),
        'en',
        'Lat Pulldown (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'remada_baixa_triangulo'
        ),
        'en',
        'Seated Cable Row'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'remada_baixa_triangulo'
        ),
        'en',
        'Seated Cable Row - V Grip (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'remada_curvada_barra_pronada'
        ),
        'en',
        'Bent-Over Barbell Row'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'remada_curvada_barra_pronada'
        ),
        'en',
        'Bent Over Row (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'remada_curvada_barra_supinada'
        ),
        'en',
        'Reverse-Grip Barbell Row'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'remada_elastico'
        ),
        'en',
        'Standing Band Row'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'remada_halteres_peito_banco_30'
        ),
        'en',
        'Chest-Supported Dumbbell Row'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'remada_halteres_peito_banco_30'
        ),
        'en',
        'Chest Supported Incline Row (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'remada_maquina'
        ),
        'en',
        'Machine Row'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'remada_maquina'
        ),
        'en',
        'Seated Row (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'remada_suspensao'
        ),
        'en',
        'Suspension Row'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'remada_suspensao'
        ),
        'en',
        'Low Row (Suspension)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'remada_unilateral_halter_banco'
        ),
        'en',
        'One-Arm Dumbbell Row'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'remada_unilateral_halter_banco'
        ),
        'en',
        'Dumbbell Row'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'roda_abdominal_joelhos'
        ),
        'en',
        'Kneeling Ab Wheel Rollout'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'roda_abdominal_joelhos'
        ),
        'en',
        'Ab Wheel'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'rosca_barra_w'
        ),
        'en',
        'EZ-Bar Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'rosca_barra_w'
        ),
        'en',
        'EZ Bar Biceps Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'rosca_concentrada'
        ),
        'en',
        'Concentration Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'rosca_direta_barra'
        ),
        'en',
        'Barbell Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'rosca_direta_barra'
        ),
        'en',
        'Bicep Curl (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'rosca_halteres_simultanea'
        ),
        'en',
        'Dumbbell Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'rosca_halteres_simultanea'
        ),
        'en',
        'Bicep Curl (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'rosca_inclinada_halteres_45'
        ),
        'en',
        'Incline Dumbbell Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'rosca_inclinada_halteres_45'
        ),
        'en',
        'Seated Incline Curl (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'rosca_inversa'
        ),
        'en',
        'EZ-Bar Reverse Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'rosca_martelo_simultanea'
        ),
        'en',
        'Hammer Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'rosca_martelo_simultanea'
        ),
        'en',
        'Hammer Curl (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'rosca_polia_baixa'
        ),
        'en',
        'Low Cable Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'rosca_polia_baixa'
        ),
        'en',
        'Bicep Curl (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'step_up_corporal'
        ),
        'en',
        'Bodyweight Step-Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'step_up_corporal'
        ),
        'en',
        'Step Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'stiff_barra'
        ),
        'en',
        'Stiff-Leg Barbell Deadlift'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'stiff_barra'
        ),
        'en',
        'Straight Leg Deadlift'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'suitcase_walk'
        ),
        'en',
        'Dumbbell Suitcase Carry'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'suitcase_walk'
        ),
        'en',
        'Suitcase Carry (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'supino_inclinado_30_barra'
        ),
        'en',
        '30-Degree Incline Barbell Bench Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'supino_inclinado_30_barra'
        ),
        'en',
        'Incline Bench Press (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'supino_inclinado_30_halteres'
        ),
        'en',
        '30-Degree Incline Dumbbell Bench Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'supino_inclinado_30_halteres'
        ),
        'pt-BR',
        'Supino com halteres em banco inclinado a 30 graus'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'supino_inclinado_30_halteres'
        ),
        'en',
        'Incline Bench Press (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'supino_inclinado_45_barra'
        ),
        'en',
        '45-Degree Incline Barbell Bench Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'supino_inclinado_45_halteres'
        ),
        'en',
        '45-Degree Incline Dumbbell Bench Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'supino_maquina'
        ),
        'en',
        'Machine Chest Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'supino_reto_barra'
        ),
        'en',
        'Barbell Bench Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'supino_reto_barra'
        ),
        'pt-BR',
        'Supino com barra em banco reto'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'supino_reto_barra'
        ),
        'en',
        'Bench Press (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'supino_reto_halteres'
        ),
        'en',
        'Dumbbell Bench Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'supino_reto_halteres'
        ),
        'pt-BR',
        'Supino com halteres em banco reto'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'supino_reto_halteres'
        ),
        'en',
        'Bench Press (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'supino_solo_barra'
        ),
        'en',
        'Barbell Floor Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'supino_solo_halteres'
        ),
        'en',
        'Dumbbell Floor Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'swing_kettlebell'
        ),
        'en',
        'Russian Kettlebell Swing'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'swing_kettlebell'
        ),
        'en',
        'Kettlebell Swing'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'terra_convencional'
        ),
        'en',
        'Conventional Barbell Deadlift'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'terra_convencional'
        ),
        'en',
        'Deadlift (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'terra_romeno_barra'
        ),
        'en',
        'Barbell Romanian Deadlift'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'terra_romeno_barra'
        ),
        'en',
        'Romanian Deadlift (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'terra_romeno_halteres'
        ),
        'en',
        'Dumbbell Romanian Deadlift'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'terra_romeno_halteres'
        ),
        'en',
        'Romanian Deadlift (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'terra_romeno_unilateral_halter'
        ),
        'en',
        'Single-Leg Dumbbell Romanian Deadlift'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'terra_romeno_unilateral_halter'
        ),
        'en',
        'Single Leg Romanian Deadlift (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'terra_sumo'
        ),
        'en',
        'Sumo Deadlift'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'triceps_acima_cabeca_corda'
        ),
        'en',
        'Overhead Rope Triceps Extension'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'triceps_acima_cabeca_corda'
        ),
        'en',
        'Overhead Triceps Extension (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'triceps_halter_acima'
        ),
        'en',
        'Overhead Dumbbell Triceps Extension'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'triceps_halter_acima'
        ),
        'en',
        'Triceps Extension (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'triceps_halter_acima'
        ),
        'en',
        'Seated Triceps Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'triceps_polia_barra_reta'
        ),
        'en',
        'Cable Triceps Pushdown'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'triceps_polia_barra_reta'
        ),
        'en',
        'Triceps Pressdown'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'triceps_polia_barra_reta'
        ),
        'en',
        'Triceps Pushdown'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'triceps_polia_corda'
        ),
        'en',
        'Rope Triceps Pushdown'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'triceps_polia_corda'
        ),
        'en',
        'Triceps Rope Pushdown'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'triceps_testa_barra_w'
        ),
        'en',
        'EZ-Bar Lying Triceps Extension'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'triceps_testa_halteres'
        ),
        'en',
        'Dumbbell Lying Triceps Extension'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'triceps_testa_halteres'
        ),
        'en',
        'Skullcrusher (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_982734d4'
        ),
        'en',
        'Plate Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_84a77566'
        ),
        'en',
        'Press Under'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_542f3cd5'
        ),
        'en',
        'Push Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_a69ff221'
        ),
        'en',
        'Arnold Press (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_ac5a4c58'
        ),
        'en',
        'Hack Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_70d4ebbf'
        ),
        'en',
        'Jump Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_e8d86ee8'
        ),
        'en',
        'Band Pullaparts'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_652fea39'
        ),
        'en',
        'Clean Pull'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_b123dd01'
        ),
        'en',
        'Pullover (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_425805f4'
        ),
        'en',
        'Inverted Row'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d7d7fcce'
        ),
        'en',
        'Landmine Row'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_0222db42'
        ),
        'en',
        'Rowing Machine'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_a8814c06'
        ),
        'en',
        'Squat Row'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d950429e'
        ),
        'en',
        'Drag Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_4e239ed8'
        ),
        'en',
        'Kettlebell Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_9283abd5'
        ),
        'en',
        'Plate Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_3bc06ad3'
        ),
        'en',
        '21s Bicep Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_7c0028c3'
        ),
        'en',
        'Reverse Hyperextension'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_4f5866f8'
        ),
        'en',
        'Back Extension (Hyperextension)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_47b9df13'
        ),
        'en',
        'Calf Extension (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_30f03bf0'
        ),
        'en',
        'Front Lever Raise'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_47b036ef'
        ),
        'en',
        'Front Raise (Band)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_bd86efd5'
        ),
        'en',
        'Front Raise (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_dbb91a3c'
        ),
        'en',
        'Front Raise (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_8293e554'
        ),
        'en',
        'Front Raise (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_afc29472'
        ),
        'en',
        'Dragonfly'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_afc29472'
        ),
        'en',
        'Dragon Flag'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_651f844c'
        ),
        'en',
        'Cable Fly Crossovers'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_ddb7c19f'
        ),
        'en',
        'Chest Fly (Band)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_31436f5d'
        ),
        'en',
        'Plank Pushup'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_99b49684'
        ),
        'en',
        'Reverse Plank'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_923874ca'
        ),
        'en',
        'Landmine 180'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_a41c7261'
        ),
        'en',
        'Bicycle Crunch'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_23a48484'
        ),
        'en',
        'Cable Crunch'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d928c232'
        ),
        'en',
        'Crunch (Weighted)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_99507114'
        ),
        'en',
        'Deadlift (Band)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_5f4e6dd3'
        ),
        'en',
        'Deadlift (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_fa5d0de1'
        ),
        'en',
        'Deadlift High Pull'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_99c1f2ad'
        ),
        'en',
        'Bench Press (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_0fbf7195'
        ),
        'en',
        'Bench Press (Smith Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_da0f0470'
        ),
        'en',
        'Decline Bench Press (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d3e2ab55'
        ),
        'en',
        'Incline Chest Fly (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_fbf92739'
        ),
        'en',
        'Incline Chest Press (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_bc10a922'
        ),
        'en',
        'Decline Crunch'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_b2398cd1'
        ),
        'en',
        'Decline Crunch (Weighted)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_18487fa7'
        ),
        'en',
        'Decline Bench Press (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_6433cd93'
        ),
        'en',
        'Kettlebell Shoulder Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_878cd1d0'
        ),
        'en',
        'Shoulder Press (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_059e835d'
        ),
        'en',
        'Shoulder Press (Machine Plates)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_df200976'
        ),
        'en',
        'Lateral Raise (Band)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_be289e45'
        ),
        'en',
        'Lateral Raise (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_422b08f1'
        ),
        'en',
        'Lateral Raise (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d5d0354d'
        ),
        'en',
        'Lateral Raise (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_c315dc2a'
        ),
        'en',
        'Rear Delt Reverse Fly (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d8281c62'
        ),
        'en',
        'Rear Delt Reverse Fly (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_c10a5ac9'
        ),
        'en',
        'Spiderman'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_527da061'
        ),
        'en',
        'Stretching'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_af328e3d'
        ),
        'en',
        'Bicep Curl (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_1d4b3d6b'
        ),
        'en',
        'Hammer Curl (Band)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_36e8f14e'
        ),
        'en',
        'Hammer Curl (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_32c4d4a2'
        ),
        'en',
        'Cross Body Hammer Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_c01f58d1'
        ),
        'en',
        'Seated Incline Hammer Curl (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_4f942934'
        ),
        'en',
        'Preacher Curl (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_fab6eb2f'
        ),
        'en',
        'Preacher Curl (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_1e9a6b8e'
        ),
        'en',
        'Preacher Curl (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_40c6a9fc'
        ),
        'en',
        'Zercher Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_2f8d3067'
        ),
        'en',
        'Triceps Extension (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_21310f5f'
        ),
        'en',
        'Triceps Extension (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_3092fadd'
        ),
        'en',
        'Triceps Extension (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_6182ee83'
        ),
        'en',
        'Triceps Extension (Suspension)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_875f585f'
        ),
        'en',
        'Skullcrusher (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_8b5bed30'
        ),
        'en',
        'Reverse Grip Triceps Pushdown'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_552ab030'
        ),
        'en',
        'Single Arm Triceps Pushdown (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d82ea543'
        ),
        'en',
        'Kneeling Pulldown (band)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d2fe7b2e'
        ),
        'en',
        'Lat Pulldown (Band)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_473cf5b8'
        ),
        'en',
        'Lat Pulldown (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_2ee45f81'
        ),
        'en',
        'Single Arm Lat Pulldown'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_046e25a2'
        ),
        'en',
        'Reverse Grip Lat Pulldown (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_f1d60854'
        ),
        'en',
        'Seated Cable Row - Bar Grip'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_c3bcabb3'
        ),
        'en',
        'Seated Cable Row - Bar Wide Grip'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_ea820646'
        ),
        'en',
        'Bent Over Row (Band)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_23e92538'
        ),
        'en',
        'Bent Over Row (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_eb813c91'
        ),
        'en',
        'Bent Over Row (Smith Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_a91838c0'
        ),
        'en',
        'Kipping Pull Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_f60bddf8'
        ),
        'en',
        'Negative Pull Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_2c37ec5e'
        ),
        'en',
        'Pull Up (Assisted)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_56808fd2'
        ),
        'en',
        'Pull Up (Band)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d23c609b'
        ),
        'en',
        'Chin Up (Assisted)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_023943f1'
        ),
        'en',
        'Chin Up (Weighted)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_cd6dc8e5'
        ),
        'en',
        'Bench Dip'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_6fcd7755'
        ),
        'en',
        'Chest Dip'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_51a0edaa'
        ),
        'en',
        'Ring Dips'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_e9e4089f'
        ),
        'en',
        'Chest Dip (Assisted)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_0efe8162'
        ),
        'en',
        'Pike Pushup'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_10d76e8f'
        ),
        'en',
        'Clap Push Ups'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_5e1a7777'
        ),
        'en',
        'Lunge'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_5cc07a1f'
        ),
        'en',
        'Jumping Lunge'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_f2a37357'
        ),
        'en',
        'Lateral Lunge'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_6e6ee645'
        ),
        'en',
        'Lunge (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_b537d09f'
        ),
        'en',
        'Lunge (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_3fd83744'
        ),
        'en',
        'Single Leg Press (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d3095577'
        ),
        'en',
        'Clean and Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_e53ccbe5'
        ),
        'en',
        'Standing Calf Raise (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_6da40660'
        ),
        'en',
        'Standing Calf Raise (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_92b8c7e1'
        ),
        'en',
        'Hip Thrust'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_291aba92'
        ),
        'en',
        'Hip Thrust (Smith Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_49c922a1'
        ),
        'en',
        'Glute Bridge (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_68b83ee0'
        ),
        'en',
        'Glute Ham Raise'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_cba02382'
        ),
        'en',
        'Glute Kickback (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_987234ab'
        ),
        'en',
        'Glute Kickback on Floor'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_abb00838'
        ),
        'en',
        'Clean'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_bd4e7e53'
        ),
        'en',
        'Hang Clean'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_f99c211d'
        ),
        'en',
        'Kettlebell Clean'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_c628d768'
        ),
        'en',
        'Power Clean'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_fb09c938'
        ),
        'en',
        'Snatch'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_f3717b0e'
        ),
        'en',
        'Dumbbell Snatch'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_f4e77594'
        ),
        'en',
        'Hang Snatch'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_89304423'
        ),
        'en',
        'Kettlebell Snatch'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_e22f9358'
        ),
        'en',
        'Power Snatch'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_e764b907'
        ),
        'en',
        'Split Jerk'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_9e09cec3'
        ),
        'en',
        'Clean and Jerk'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_5e0ddace'
        ),
        'en',
        'Aerobics'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_218da87c'
        ),
        'en',
        'Superman'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_4288g454'
        ),
        'en',
        'Kettlebell Halo'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_ac1bb830'
        ),
        'en',
        'Running'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_33edd7db'
        ),
        'en',
        'Walking'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_32hkj34k'
        ),
        'en',
        'Walking Lunge'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d8f7f851'
        ),
        'en',
        'Cycling'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d8f7f851'
        ),
        'en',
        'Spinning'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d39ec9eb'
        ),
        'en',
        'Curtsy Lunge (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_56092dd1'
        ),
        'en',
        'Box Jump'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_207dc636'
        ),
        'en',
        'Frog Jumps'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_991833c2'
        ),
        'en',
        'Jumping Jack'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_040ba2e3'
        ),
        'en',
        'Jump Rope'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_022df610'
        ),
        'en',
        'Sit Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_32b0b590'
        ),
        'en',
        'Jackknife Sit Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_9237ba12'
        ),
        'en',
        'Sit Up (Weighted)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_f8356514'
        ),
        'en',
        'Hanging Leg Raise'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_09c9f635'
        ),
        'en',
        'Lying Leg Raise'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_594450d2'
        ),
        'en',
        'Bicycle Crunch Raised Legs'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_0482da98'
        ),
        'en',
        'Leg Raise Parallel Bars'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_0e4523f4'
        ),
        'en',
        'Wrist Roller'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d8460fa6'
        ),
        'en',
        'Reverse Wrist Curl (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_95f2e076'
        ),
        'en',
        'Seated Wrist Curl (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_9202cc23'
        ),
        'en',
        'Seated Wrist Extension (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_1006df48'
        ),
        'en',
        'Seated Palms Up Wrist Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_ba3de542'
        ),
        'en',
        'Jump Shrug'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_ffabc123'
        ),
        'en',
        'Shrug (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_19a38071'
        ),
        'en',
        'Shrug (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_22fedca4'
        ),
        'en',
        'Lying Neck Curls'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_0910bd28'
        ),
        'en',
        'Lying Neck Extension'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_31b8da0f'
        ),
        'en',
        'Lying Neck Curls (Weighted)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d6a73cf2'
        ),
        'en',
        'Lying Neck Extension (Weighted)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_fbb62888'
        ),
        'en',
        'Torso Rotation'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_1ff4097b'
        ),
        'en',
        'Reverse Grip Concentration Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_24a809ef'
        ),
        'en',
        'Skating'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_72880c57'
        ),
        'en',
        'Vertical Traction (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_7d1bd41d'
        ),
        'en',
        'Sled Pull'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_ac0a1bf3'
        ),
        'en',
        'Sled Push'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_5bff35ba'
        ),
        'en',
        'Assisted Pistol Squats'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_084a67ca'
        ),
        'en',
        'Battle Ropes'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_234897ab'
        ),
        'en',
        'Rope Cable Curl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_9273ba17'
        ),
        'en',
        'Rope Straight Arm Pulldown'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_f51d9080'
        ),
        'en',
        'Ball Slams'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_a1f47acc'
        ),
        'en',
        'Wall Ball'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_bb792a36'
        ),
        'en',
        'Burpee'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_115cc72c'
        ),
        'en',
        'Burpee Broad Jumps'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_86b00dde'
        ),
        'en',
        'Burpee Over the Bar'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_f49e31d6'
        ),
        'en',
        'Mountain Climber'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_108d7a14'
        ),
        'en',
        'Nordic Hamstrings Curls'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_be3615cf'
        ),
        'en',
        'Handstand Hold'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_90b04f96'
        ),
        'en',
        'Handstand Push Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_0e608350'
        ),
        'en',
        'Front Lever Hold'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_7952b5cd'
        ),
        'en',
        'Reverse Crunch'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_cc016611'
        ),
        'en',
        'Clamshell'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_b82d6418'
        ),
        'en',
        'Squat (Suspension)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_0b4c1902'
        ),
        'en',
        'Bicep Curl (Suspension)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_720b0d70'
        ),
        'en',
        'Chest Fly (Suspension)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_796e8e2c'
        ),
        'en',
        'Front Raise (Suspension)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d410f649'
        ),
        'en',
        'Jack Knife (Suspension)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_5f09f0fc'
        ),
        'en',
        'Ring Pull Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_a0d8fa1b'
        ),
        'en',
        'Boxing'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_3ff6a22e'
        ),
        'en',
        'Pistol Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_ec2510cd'
        ),
        'en',
        'Pilates'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_b4f2ff72'
        ),
        'en',
        'Ab Scissors'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_911a58d3'
        ),
        'en',
        'Snowboarding'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_6d54a050'
        ),
        'en',
        'L-Sit Hold'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_c8706c80'
        ),
        'en',
        'Wall Sit'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_b09a1304'
        ),
        'en',
        'Overhead Press (Smith Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_8372bbcc'
        ),
        'en',
        'Single Arm Cable Crossover'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_e23f1f2b'
        ),
        'en',
        'Climbing'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_1c34a172'
        ),
        'en',
        'Hiking'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_023947ab'
        ),
        'en',
        'HIIT'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_84325755'
        ),
        'en',
        'Skiing'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_b60a678f'
        ),
        'en',
        'Swimming'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_8c9d2928'
        ),
        'en',
        'Yoga'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_9283baba'
        ),
        'en',
        'Sprints'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_2cfed196'
        ),
        'en',
        'Overhead Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_b3b1d947'
        ),
        'en',
        'Bear Crawl'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_2af8b552'
        ),
        'en',
        'Fire Hydrants'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_f72fa239'
        ),
        'en',
        'Dumbbell Squeeze Press'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_123ee239'
        ),
        'en',
        'Zottman Curl (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_582ada23'
        ),
        'en',
        'Overhead Curl (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_4c6721b9'
        ),
        'en',
        'Overhead Dumbbell Lunge'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_54e60954'
        ),
        'en',
        'Overhead Plate Raise'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d0c4a899'
        ),
        'en',
        'Single Arm Cable Row'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_b33b526e'
        ),
        'en',
        'Single Arm Curl (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_112fc6b7'
        ),
        'en',
        'Reverse Curl (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_29472be1'
        ),
        'en',
        'Chest Dip (Weighted)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_729237d1'
        ),
        'en',
        'Pull Up (Weighted)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_4b4bf8c2'
        ),
        'en',
        'Triceps Dip (Assisted)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_0b9b92ba'
        ),
        'en',
        'Romanian Deadlift (Smith Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_93472ac1'
        ),
        'en',
        'Single Leg Romanian Deadlift (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_0f24286a'
        ),
        'en',
        'Bulgarian Split Squat (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_3f5f8d40'
        ),
        'en',
        'Sumo Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_6622e5a0'
        ),
        'en',
        'Sumo Squat (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_05293bca'
        ),
        'en',
        'Sumo Squat (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_5e10d0e6'
        ),
        'en',
        'Sumo Squat (Kettlebell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_ec3b69a3'
        ),
        'en',
        'Triceps Kickback (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_6127a3ad'
        ),
        'en',
        'Triceps Kickback (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_018adc12'
        ),
        'en',
        'Pendlay Row (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_c732c341'
        ),
        'en',
        'Meadows Rows (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_90e506d5'
        ),
        'en',
        'Thruster (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_38fc1ab9'
        ),
        'en',
        'Box Squat (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_b923b230'
        ),
        'en',
        'Deadlift (Trap bar)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_cc35a01f'
        ),
        'en',
        'Squat (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_f1258206'
        ),
        'en',
        'Squat (Band)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_eac7d9c5'
        ),
        'en',
        'Chest Press (Band)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_9f9c164b'
        ),
        'en',
        'Muscle Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_3303376c'
        ),
        'en',
        'Elliptical Trainer'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_4377a52b'
        ),
        'en',
        'Stair Machine (Floors)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_4377a52c'
        ),
        'en',
        'Stair Machine (Steps)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_43573bb8'
        ),
        'en',
        'Air Bike'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_5d99a2fa'
        ),
        'en',
        'Ski Erg'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_c9ccb878'
        ),
        'en',
        'High Knee Skips'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_f30a4f01'
        ),
        'en',
        'Walking Lunge (Sandbag)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_7da843a3'
        ),
        'en',
        'Downward Dog'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_970adf87'
        ),
        'en',
        'Hollow Rock'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_bb83bdde'
        ),
        'en',
        'Russian Twist (Bodyweight)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_2982aa23'
        ),
        'en',
        'Russian Twist (Weighted)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_942bad12'
        ),
        'en',
        'Pinwheel Curl (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_567fb505'
        ),
        'en',
        'Heel Taps'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_08590920'
        ),
        'en',
        'Hanging Knee Raise'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_5122e7d9'
        ),
        'en',
        'Seated Dip Machine'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_6b4c797e'
        ),
        'en',
        'Seated Chest Flys (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_bd5935cf'
        ),
        'en',
        'Lying Knee Raise'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_3a6fa3d1'
        ),
        'en',
        'Incline Bench Press (Smith Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_ffc106cb'
        ),
        'en',
        'Decline Bench Press (Smith Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_aa1eb7d8'
        ),
        'en',
        'Iso-Lateral Row (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_9264ada1'
        ),
        'en',
        'Reverse Fly Single Arm (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_de68c825'
        ),
        'en',
        'Single Arm Lateral Raise (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_a351aed7'
        ),
        'en',
        'Decline Chest Fly (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_20870ed5'
        ),
        'en',
        'Deadlift (Smith Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_742e5bd5'
        ),
        'en',
        'Shrug (Smith Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_e51ccbe5'
        ),
        'en',
        'Single Leg Standing Calf Raise (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_b05c2c29'
        ),
        'en',
        'Single Leg Standing Calf Raise (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_487b3755'
        ),
        'en',
        'Single Leg Hip Thrust'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d1cd146f'
        ),
        'en',
        'Single Leg Hip Thrust (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_10313afd'
        ),
        'en',
        'Thruster (Kettlebell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_9372ffaa'
        ),
        'en',
        'Seated Lateral Raise (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_d731cca8'
        ),
        'en',
        'Lateral Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_91fafba3'
        ),
        'en',
        'Iso-Lateral Low Row'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_91af29e0'
        ),
        'en',
        'Seated Overhead Press (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_b582299e'
        ),
        'en',
        'Chest Supported Reverse Fly (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_6a8d3193'
        ),
        'en',
        'Chest Supported T Bar Row'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_f21d5693'
        ),
        'en',
        'Chest Supported Y Raise (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_08a2974e'
        ),
        'en',
        'T Bar Row'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_7ab9a362'
        ),
        'en',
        'Upright Row (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_e644f828'
        ),
        'en',
        'Bench Press - Wide Grip (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_b31eb524'
        ),
        'en',
        'Wide-Elbow Triceps Press (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_35b51b87'
        ),
        'en',
        'Bench Press - Close Grip (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_4e5257de'
        ),
        'en',
        'Lat Pulldown - Close Grip (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_6575f52d'
        ),
        'en',
        'Diamond Push Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_ee2938d1'
        ),
        'en',
        'Sternum Pull up (Gironda)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_b140095e'
        ),
        'en',
        'One Arm Push Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_bf6ece89'
        ),
        'en',
        'Dumbbell Step Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_286c1d0b'
        ),
        'en',
        'Upright Row (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_a127da73'
        ),
        'en',
        'Kettlebell Goblet Squat'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_5f8903bf'
        ),
        'en',
        'Kettlebell Turkish Get Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_dcff3e9f'
        ),
        'en',
        'Squat (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_f5def1eb'
        ),
        'en',
        'Sissy Squat (Weighted)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_818ba121'
        ),
        'en',
        'Reverse Lunge (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_10347bac'
        ),
        'en',
        'Triceps Dip (Weighted)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_9f48f858'
        ),
        'en',
        'Reverse Curl (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_b567dd46'
        ),
        'en',
        'Reverse Curl (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_2348ab72'
        ),
        'en',
        'Spider Curl (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_90427d4a'
        ),
        'en',
        'Spider Curl (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_72297e8c'
        ),
        'en',
        'Waiter Curl (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_2dbca395'
        ),
        'en',
        'Behind the Back Curl (Cable)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_ddb29047'
        ),
        'en',
        'Behind the Back Wrist Curl (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_75bac5c3'
        ),
        'en',
        'Toe Touch'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_2fa77b28'
        ),
        'en',
        'Flutter Kicks'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_6be68b62'
        ),
        'en',
        'V Up'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_37f9eda7'
        ),
        'en',
        'Side Bend'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_026fd047'
        ),
        'en',
        'Side Bend (Dumbbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_7fd2ec3e'
        ),
        'en',
        'Recumbent Bike'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_92d858ea'
        ),
        'en',
        'Cable Twist (Down to up)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_a2d838bd'
        ),
        'en',
        'Cable Twist (Up to down)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_ce1054ce'
        ),
        'en',
        'Pause Squat (Barbell)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_fe389074'
        ),
        'en',
        'Rack Pull'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_502fce31'
        ),
        'en',
        'Shoulder Taps'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_24706dcd'
        ),
        'en',
        'Iso-Lateral Chest Press (Machine)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_c7ae420a'
        ),
        'en',
        'Scapular Pull Ups'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_19372abc'
        ),
        'en',
        'Push Up (Weighted)'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_8c331cd8'
        ),
        'en',
        'Cable Pull Through'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_293483ad'
        ),
        'en',
        'Low Cable Fly Crossovers'
    ) ON DUPLICATE KEY
UPDATE nome =
VALUES
    (nome);