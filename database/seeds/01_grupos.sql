INSERT INTO
    grupo_muscular (codigo, nome, descricao, ordem)
VALUES
    (
        'peitoral',
        'Peitoral',
        'Exercícios organizados com foco na região peitoral.',
        '1'
    ),
    (
        'dorsais',
        'Dorsais',
        'Exercícios organizados com foco no latíssimo do dorso e movimentos associados.',
        '2'
    ),
    (
        'dorso_superior',
        'Dorso superior',
        'Exercícios organizados com foco na região superior das costas e no controle escapular.',
        '3'
    ),
    (
        'trapezio',
        'Trapézio',
        'Exercícios organizados com foco nas porções do trapézio.',
        '4'
    ),
    (
        'ombros',
        'Ombros',
        'Exercícios organizados com foco nos deltoides e na musculatura do ombro.',
        '5'
    ),
    (
        'biceps',
        'Bíceps',
        'Exercícios organizados com foco nos flexores do cotovelo.',
        '6'
    ),
    (
        'triceps',
        'Tríceps',
        'Exercícios organizados com foco no tríceps braquial.',
        '7'
    ),
    (
        'antebracos',
        'Antebraços',
        'Exercícios organizados com foco nos antebraços, punhos e preensão.',
        '8'
    ),
    (
        'quadriceps',
        'Quadríceps',
        'Exercícios organizados com foco na região anterior da coxa.',
        '9'
    ),
    (
        'posteriores_coxa',
        'Posteriores de coxa',
        'Exercícios organizados com foco na musculatura posterior da coxa.',
        '10'
    ),
    (
        'gluteos',
        'Glúteos',
        'Exercícios organizados com foco na musculatura glútea.',
        '11'
    ),
    (
        'adutores',
        'Adutores',
        'Exercícios organizados com foco nos adutores do quadril.',
        '12'
    ),
    (
        'abdutores',
        'Abdutores',
        'Exercícios organizados com foco nos abdutores do quadril.',
        '13'
    ),
    (
        'panturrilhas',
        'Panturrilhas',
        'Exercícios organizados com foco na musculatura da panturrilha.',
        '14'
    ),
    (
        'abdomen_core',
        'Abdômen e core',
        'Exercícios organizados com foco no abdômen e na estabilidade do tronco.',
        '15'
    ),
    (
        'lombar',
        'Lombar',
        'Exercícios organizados com foco na região lombar e nos extensores do tronco.',
        '16'
    ),
    (
        'pescoco',
        'Pescoço',
        'Exercícios organizados com foco na musculatura cervical.',
        '17'
    ),
    (
        'corpo_inteiro',
        'Corpo inteiro',
        'Exercícios integrados que envolvem múltiplas regiões corporais.',
        '18'
    ),
    ('cardio', 'Cardio', 'Atividades aeróbicas', '19') ON DUPLICATE KEY
UPDATE nome =
VALUES
    (nome),
    descricao =
VALUES
    (descricao),
    ordem =
VALUES
    (ordem);