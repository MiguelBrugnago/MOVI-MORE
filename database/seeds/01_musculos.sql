INSERT INTO
    musculo (codigo, nome, grupo, regiao, svg_id)
VALUES
    ('biceps_braquial', 'Bíceps braquial', '', '', ''),
    ('braquial', 'Braquial', '', '', ''),
    ('braquiorradial', 'Braquiorradial', '', '', ''),
    ('deltoide', 'Deltoide', '', '', ''),
    ('infraespinal', 'Infraespinal', '', '', ''),
    (
        'latissimo_dorso',
        'Latíssimo do dorso',
        '',
        '',
        ''
    ),
    ('peitoral_maior', 'Peitoral maior', '', '', ''),
    ('peitoral_menor', 'Peitoral menor', '', '', ''),
    (
        'serratil_anterior',
        'Serrátil anterior',
        '',
        '',
        ''
    ),
    ('supraespinal', 'Supraespinal', '', '', ''),
    ('trapezio', 'Trapézio', '', '', ''),
    (
        'triceps_braquial',
        'Tríceps braquial',
        '',
        '',
        ''
    ),
    (
        'deltoide_anterior',
        'Deltoide - porção anterior',
        '',
        '',
        ''
    ),
    (
        'deltoide_lateral',
        'Deltoide - porção lateral',
        '',
        '',
        ''
    ),
    (
        'deltoide_posterior',
        'Deltoide - porção posterior',
        '',
        '',
        ''
    ),
    (
        'trapezio_inferior',
        'Trapézio - porção inferior',
        '',
        '',
        ''
    ),
    (
        'trapezio_medio',
        'Trapézio - porção média',
        '',
        '',
        ''
    ),
    (
        'trapezio_superior',
        'Trapézio - porção superior',
        '',
        '',
        ''
    ),
    ('adutor_curto', 'Adutor curto', '', '', ''),
    ('adutor_longo', 'Adutor longo', '', '', ''),
    ('adutor_magno', 'Adutor magno', '', '', ''),
    ('biceps_femoral', 'Bíceps femoral', '', '', ''),
    (
        'eretores_espinha',
        'Eretores da espinha',
        '',
        '',
        ''
    ),
    (
        'esternocleidomastoideo',
        'Esternocleidomastóideo',
        '',
        '',
        ''
    ),
    (
        'extensor_dedos',
        'Extensor dos dedos',
        '',
        '',
        ''
    ),
    (
        'extensor_radial_curto_carpo',
        'Extensor radial curto do carpo',
        '',
        '',
        ''
    ),
    (
        'extensor_radial_longo_carpo',
        'Extensor radial longo do carpo',
        '',
        '',
        ''
    ),
    (
        'extensor_ulnar_carpo',
        'Extensor ulnar do carpo',
        '',
        '',
        ''
    ),
    (
        'flexor_radial_carpo',
        'Flexor radial do carpo',
        '',
        '',
        ''
    ),
    (
        'flexor_ulnar_carpo',
        'Flexor ulnar do carpo',
        '',
        '',
        ''
    ),
    ('gastrocnemio', 'Gastrocnêmio', '', '', ''),
    ('gluteo_maximo', 'Glúteo máximo', '', '', ''),
    ('gluteo_medio', 'Glúteo médio', '', '', ''),
    ('gluteo_minimo', 'Glúteo mínimo', '', '', ''),
    ('gracil', 'Grácil', '', '', ''),
    ('iliopsoas', 'Iliopsoas', '', '', ''),
    ('multifidos', 'Multífidos', '', '', ''),
    (
        'obliquo_externo',
        'Oblíquo externo do abdômen',
        '',
        '',
        ''
    ),
    (
        'obliquo_interno',
        'Oblíquo interno do abdômen',
        '',
        '',
        ''
    ),
    ('pectineo', 'Pectíneo', '', '', ''),
    ('quadrado_lombar', 'Quadrado lombar', '', '', ''),
    ('reto_abdominal', 'Reto abdominal', '', '', ''),
    ('reto_femoral', 'Reto femoral', '', '', ''),
    ('semimembranoso', 'Semimembranoso', '', '', ''),
    ('semitendinoso', 'Semitendinoso', '', '', ''),
    ('soleo', 'Sóleo', '', '', ''),
    (
        'tensor_fascia_lata',
        'Tensor da fáscia lata',
        '',
        '',
        ''
    ),
    ('tibial_anterior', 'Tibial anterior', '', '', ''),
    (
        'transverso_abdomen',
        'Transverso do abdômen',
        '',
        '',
        ''
    ),
    (
        'vasto_intermedio',
        'Vasto intermédio',
        '',
        '',
        ''
    ),
    ('vasto_lateral', 'Vasto lateral', '', '', ''),
    ('vasto_medial', 'Vasto medial', '', '', '') ON DUPLICATE KEY
UPDATE nome =
VALUES
    (nome),
    grupo =
VALUES
    (grupo),
    regiao =
VALUES
    (regiao),
    svg_id =
VALUES
    (svg_id);