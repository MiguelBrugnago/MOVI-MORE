INSERT INTO
    tipo_registro (
        codigo,
        nome,
        usa_repeticoes,
        usa_carga,
        usa_duracao,
        usa_distancia,
        natureza_carga,
        descricao,
        unidade_contagem
    )
VALUES
    (
        'andares_duracao',
        'Andares e duração',
        1,
        0,
        1,
        0,
        'nenhuma',
        'Contagem de andares no campo de contagem da série.',
        'andares'
    ),
    (
        'passos_duracao',
        'Passos e duração',
        1,
        0,
        1,
        0,
        'nenhuma',
        'Contagem de passos no campo de contagem da série.',
        'passos'
    ),
    (
        'isometria',
        'Isometria',
        0,
        0,
        1,
        0,
        'nenhuma',
        'Tempo de sustentação da posição, em segundos.',
        'repetições'
    ) ON DUPLICATE KEY
UPDATE nome =
VALUES
    (nome),
    usa_repeticoes =
VALUES
    (usa_repeticoes),
    usa_duracao =
VALUES
    (usa_duracao),
    unidade_contagem =
VALUES
    (unidade_contagem);