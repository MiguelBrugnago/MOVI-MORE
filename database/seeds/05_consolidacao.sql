-- Categorias amplas não contam como exercícios; sinônimos ficam inativos.
-- IDs são preservados caso alguma instalação já os tenha utilizado.
UPDATE exercicio
SET
    ativo = 0
WHERE
    codigo IN (
        'movi_5e0ddace',
        'movi_023947ab',
        'movi_ec2510cd',
        'movi_8c9d2928',
        'movi_527da061',
        'movi_878cd1d0'
    );