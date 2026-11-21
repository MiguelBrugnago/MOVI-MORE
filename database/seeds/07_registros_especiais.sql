UPDATE exercicio
SET
    tipo_registro_id = CASE
        WHEN codigo = 'movi_4377a52b' THEN (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'andares_duracao'
        )
        WHEN codigo = 'movi_4377a52c' THEN (
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
    usuario_id IS NULL
    AND (
        codigo IN ('movi_4377a52b', 'movi_4377a52c')
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
        )
    );
