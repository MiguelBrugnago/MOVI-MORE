INSERT INTO
    tipo_registro (
        codigo,
        nome,
        usa_repeticoes,
        usa_carga,
        usa_duracao,
        usa_distancia,
        natureza_carga,
        descricao
    )
VALUES
    (
        'carga_repeticoes',
        'Carga externa e repetições',
        '1',
        '1',
        '0',
        '0',
        'externa',
        'Registra repetições e carga externa conforme o critério de carga do exercício.'
    ),
    (
        'peso_corporal_repeticoes',
        'Peso corporal e repetições',
        '1',
        '0',
        '0',
        '0',
        'nenhuma',
        'Registra repetições sem informar o peso corporal no campo de carga.'
    ),
    (
        'peso_corporal_carga_adicional',
        'Peso corporal com carga adicional',
        '1',
        '1',
        '0',
        '0',
        'adicional',
        'Registra repetições e somente a carga acrescentada ao corpo, sem somar o peso corporal.'
    ),
    (
        'peso_corporal_assistido',
        'Peso corporal assistido',
        '1',
        '1',
        '0',
        '0',
        'assistencia',
        'Registra repetições e a magnitude positiva da assistência quantificável; valores maiores representam mais ajuda.'
    ),
    (
        'duracao',
        'Duração',
        '0',
        '0',
        '1',
        '0',
        'nenhuma',
        'Registra o tempo de execução, como em isometrias e atividades medidas apenas por tempo.'
    ),
    (
        'distancia',
        'Distância',
        '0',
        '0',
        '0',
        '1',
        'nenhuma',
        'Registra a distância percorrida sem exigir duração ou carga.'
    ),
    (
        'duracao_distancia',
        'Duração e distância',
        '0',
        '0',
        '1',
        '1',
        'nenhuma',
        'Registra tempo e distância percorrida, como em caminhada e corrida.'
    ),
    (
        'repeticoes_duracao',
        'Repetições e duração',
        '1',
        '0',
        '1',
        '0',
        'nenhuma',
        'Registra a quantidade de repetições e o tempo correspondente ao esforço.'
    ),
    (
        'carga_duracao',
        'Carga externa e duração',
        '0',
        '1',
        '1',
        '0',
        'externa',
        'Registra carga externa e tempo de sustentação, conforme o critério de carga do exercício.'
    ),
    (
        'carga_distancia',
        'Carga externa e distância',
        '0',
        '1',
        '0',
        '1',
        'externa',
        'Registra carga externa e distância de transporte, conforme o critério de carga do exercício.'
    ) ON DUPLICATE KEY
UPDATE nome =
VALUES
    (nome),
    usa_repeticoes =
VALUES
    (usa_repeticoes),
    usa_carga =
VALUES
    (usa_carga),
    usa_duracao =
VALUES
    (usa_duracao),
    usa_distancia =
VALUES
    (usa_distancia),
    natureza_carga =
VALUES
    (natureza_carga),
    descricao =
VALUES
    (descricao);