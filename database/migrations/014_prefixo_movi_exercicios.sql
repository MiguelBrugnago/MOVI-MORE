-- O índice único de codigo rejeita colisões sem alterar IDs ou referências.
UPDATE exercicio
SET
    codigo = CONCAT (
        'movi_',
        REGEXP_REPLACE (
            codigo,
            '^(hevy_|ex_padrao_|movi[+]_)',
            '',
            1,
            1,
            'c'
        )
    )
WHERE
    REGEXP_LIKE (codigo, '^(hevy_|ex_padrao_|movi[+]_)', 'c');