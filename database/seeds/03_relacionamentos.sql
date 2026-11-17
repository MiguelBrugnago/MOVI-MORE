INSERT INTO
    exercicio_musculo (exercicio_id, musculo_id, papel)
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'obliquo_externo'
        ),
        'secundario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'abdominal_bola'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'obliquo_externo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_minimo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_minimo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'tensor_fascia_lata'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_minimo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'tensor_fascia_lata'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_curto'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_longo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_magno'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gracil'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_curto'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_longo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_magno'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gracil'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_intermedio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_magno'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_medio'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_intermedio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_medio'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_intermedio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_intermedio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_intermedio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_intermedio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_intermedio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_medio'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_intermedio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_medio'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_intermedio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_medio'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_intermedio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'multifidos'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'transverso_abdomen'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'tibial_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_minimo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'tensor_fascia_lata'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_posterior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'transverso_abdomen'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_superior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_superior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'multifidos'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'infraespinal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_posterior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_superior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'obliquo_interno'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semimembranoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semimembranoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semimembranoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semimembranoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semimembranoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'obliquo_externo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'obliquo_interno'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'transverso_abdomen'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'transverso_abdomen'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'obliquo_externo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'obliquo_interno'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_posterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_posterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_posterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_posterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_posterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'braquiorradial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'braquiorradial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'braquiorradial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'braquiorradial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'braquiorradial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'braquiorradial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semimembranoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'obliquo_externo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'quadrado_lombar'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide_anterior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semimembranoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semimembranoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'estabilizador'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semimembranoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_magno'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_superior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_superior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_superior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_superior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_magno'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_magno'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_superior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_magno'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_superior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'esternocleidomastoideo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_superior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'esternocleidomastoideo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'esternocleidomastoideo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'esternocleidomastoideo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'esternocleidomastoideo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'esternocleidomastoideo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_superior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_magno'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_magno'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_magno'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_magno'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_superior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_superior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_superior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'esternocleidomastoideo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_superior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_superior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_superior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'secundario'
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
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_001'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_002'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_003'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_004'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_005'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_006'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_007'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_008'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_009'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_010'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_011'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_012'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_013'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_014'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_015'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_016'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_017'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_018'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_019'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_020'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_021'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_022'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_023'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_024'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_025'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_026'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_027'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_028'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_029'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_030'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_031'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_032'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_033'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_034'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_035'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_036'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_037'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_038'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_039'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_040'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_041'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_042'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_043'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_044'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_045'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_046'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_047'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_048'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_049'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_050'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_051'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_052'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_053'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_054'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_055'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_056'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_057'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_058'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_059'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_060'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_061'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_062'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_063'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_064'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_065'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_066'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_067'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_068'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_069'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_070'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_071'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_072'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_073'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_074'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_075'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_076'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_077'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_078'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_079'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_080'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_081'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_braquial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_082'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_083'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_083'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_083'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_084'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_084'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_084'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_085'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_magno'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_086'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_086'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_086'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_087'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_087'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_087'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_088'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_088'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_089'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_090'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_091'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_092'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_093'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_094'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_095'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_magno'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_096'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_magno'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_097'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_098'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_099'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_100'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_101'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_102'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_103'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_104'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_104'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_104'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_105'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_105'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_105'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_106'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_106'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_106'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_107'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_107'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_107'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_108'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_109'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_110'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_110'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_110'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_111'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_112'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_112'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_112'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_113'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_113'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_113'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_114'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_114'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_114'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_115'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_115'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_115'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_116'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_117'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_117'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_117'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_118'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_119'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_120'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_121'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_122'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_122'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_122'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_123'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_123'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_123'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_124'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_125'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_magno'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_126'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_127'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_128'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_129'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_130'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_131'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_131'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_131'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_132'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_133'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_133'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_133'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_134'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_134'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_134'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_135'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_135'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_135'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_136'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_136'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_136'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_137'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_137'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_137'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_138'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_139'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_139'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_139'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_140'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_140'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_141'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_141'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_141'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_142'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_142'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_143'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_143'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_143'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_144'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_144'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_144'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_145'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_145'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_145'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_146'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_147'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_148'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_149'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_149'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_149'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_150'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_151'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_152'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_153'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_154'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_154'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_155'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_156'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_157'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_157'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_157'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_158'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_159'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_160'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_161'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_162'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_163'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_medio'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_164'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_164'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_164'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_165'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_165'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_165'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_166'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_166'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_166'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_167'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_167'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_167'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_168'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_168'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_168'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_169'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_170'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_171'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_172'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_172'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_172'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_173'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_173'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_173'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_174'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_174'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_174'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_175'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_175'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_175'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_176'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_176'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_176'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_177'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_177'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_177'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_178'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_179'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_179'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_179'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_180'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_180'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_180'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_181'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_181'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_182'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_183'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_184'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'trapezio_medio'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_185'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_186'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_187'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_188'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_189'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_189'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_189'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_190'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_190'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_190'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_191'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_191'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_191'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_192'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'biceps_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_192'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'semitendinoso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_193'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_193'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_194'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gastrocnemio'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_194'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'soleo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_195'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'peitoral_maior'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_196'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'triceps_braquial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_197'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'deltoide'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_198'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_magno'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_199'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'gluteo_maximo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_200'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'latissimo_dorso'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_201'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_202'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'flexor_radial_carpo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_203'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'eretores_espinha'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_204'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_abdominal'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_205'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'esternocleidomastoideo'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_206'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'reto_femoral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_206'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_lateral'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_206'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'vasto_medial'
        ),
        'primario'
    ),
    (
        (
            SELECT
                id
            FROM
                exercicio
            WHERE
                codigo = 'movi_207'
        ),
        (
            SELECT
                id
            FROM
                musculo
            WHERE
                codigo = 'adutor_magno'
        ),
        'primario'
    ) ON DUPLICATE KEY
UPDATE papel =
VALUES
    (papel);