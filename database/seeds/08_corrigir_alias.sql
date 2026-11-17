DELETE a
FROM
    exercicio_nome_alternativo a
    JOIN exercicio e ON e.id = a.exercicio_id
WHERE
    e.codigo = 'movi_d7d7fcce'
    AND a.nome = 'T Bar Row'
    AND a.idioma = 'en';