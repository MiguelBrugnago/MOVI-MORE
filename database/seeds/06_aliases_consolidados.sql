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
                codigo = 'desenvolvimento_halteres'
        ),
        'en',
        'Shoulder Press (Dumbbell)'
    ) ON DUPLICATE KEY
UPDATE nome =
VALUES
    (nome);