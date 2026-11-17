UPDATE exercicio
SET
    tipo_registro_id = CASE
        WHEN nome_ingles = 'Stair Machine (Floors)' THEN (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'andares_duracao'
        )
        WHEN nome_ingles = 'Stair Machine (Steps)' THEN (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'passos_duracao'
        )
        ELSE (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'isometria'
        )
    END
WHERE
    nome_ingles IN ('Stair Machine (Floors)', 'Stair Machine (Steps)')
    OR (
        modalidade = 'calistenia'
        AND tipo_registro_id = (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'duracao'
        )
    );