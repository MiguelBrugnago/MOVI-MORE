SELECT
    COUNT(*) AS total,
    COUNT(DISTINCT codigo) AS codigos_distintos
FROM
    exercicio
WHERE
    ativo = 1
    AND usuario_id IS NULL;

SELECT
    id,
    codigo,
    nome
FROM
    exercicio
WHERE
    REGEXP_LIKE (codigo, '^(hevy_|ex_padrao_|movi[+]_)', 'c');

SELECT
    g.nome,
    COUNT(*) total
FROM
    exercicio e
    JOIN grupo_muscular g ON g.id = e.grupo_muscular_id
WHERE
    e.ativo = 1
GROUP BY
    g.id,
    g.nome
ORDER BY
    total DESC;

SELECT
    eq.nome,
    COUNT(*) total
FROM
    exercicio e
    JOIN equipamento eq ON eq.id = e.equipamento_id
WHERE
    e.ativo = 1
GROUP BY
    eq.id,
    eq.nome
ORDER BY
    total DESC;

SELECT
    modalidade,
    COUNT(*) total
FROM
    exercicio
WHERE
    ativo = 1
GROUP BY
    modalidade;

SELECT
    id,
    codigo,
    nome
FROM
    exercicio
WHERE
    codigo IS NULL
    OR descricao IS NULL
    OR grupo_muscular_id IS NULL
    OR equipamento_id IS NULL
    OR tipo_registro_id IS NULL;

SELECT
    nome,
    COUNT(*) total
FROM
    exercicio
WHERE
    ativo = 1
    AND usuario_id IS NULL
GROUP BY
    nome
HAVING
    COUNT(*) > 1;

SELECT
    e.codigo
FROM
    exercicio e
WHERE
    e.ativo = 1
    AND NOT EXISTS (
        SELECT
            1
        FROM
            exercicio_musculo em
        WHERE
            em.exercicio_id = e.id
            AND em.papel = 'primario'
    );

SELECT
    em.id
FROM
    exercicio_musculo em
    LEFT JOIN exercicio e ON e.id = em.exercicio_id
    LEFT JOIN musculo m ON m.id = em.musculo_id
WHERE
    e.id IS NULL
    OR m.id IS NULL;

SELECT
    e.codigo
FROM
    exercicio e
    LEFT JOIN grupo_muscular g ON g.id = e.grupo_muscular_id
    LEFT JOIN equipamento eq ON eq.id = e.equipamento_id
    LEFT JOIN tipo_registro t ON t.id = e.tipo_registro_id
WHERE
    g.id IS NULL
    OR eq.id IS NULL
    OR t.id IS NULL;

SELECT
    e.codigo,
    e.nome
FROM
    exercicio e
WHERE
    e.ativo = 0
    AND NOT EXISTS (
        SELECT
            1
        FROM
            rotina_exercicio r
        WHERE
            r.exercicio_id = e.id
    )
    AND NOT EXISTS (
        SELECT
            1
        FROM
            treino_exercicio t
        WHERE
            t.exercicio_id = e.id
    );

EXPLAIN
SELECT
    id,
    nome
FROM
    exercicio
WHERE
    ativo = 1
    AND usuario_id IS NULL
ORDER BY
    nome,
    id
LIMIT
    24;

EXPLAIN
SELECT
    id
FROM
    usuario
WHERE
    email = 'auditoria@example.test';

EXPLAIN
SELECT
    COUNT(*)
FROM
    tentativa_login
WHERE
    ip_hash = REPEAT ('0', 64)
    AND sucesso = 0
    AND criado_em >= NOW() - INTERVAL 15 MINUTE;

-- Toda relação deve apontar para linhas existentes (mesmo após uma restauração).
SELECT 'exercicio' AS tabela, COUNT(*) AS orfaos FROM exercicio e
LEFT JOIN equipamento q ON q.id=e.equipamento_id
LEFT JOIN grupo_muscular g ON g.id=e.grupo_muscular_id
LEFT JOIN tipo_registro t ON t.id=e.tipo_registro_id
WHERE q.id IS NULL OR g.id IS NULL OR t.id IS NULL
UNION ALL
SELECT 'musculo_pai', COUNT(*) FROM musculo m
LEFT JOIN musculo p ON p.id=m.musculo_pai_id WHERE m.musculo_pai_id IS NOT NULL AND p.id IS NULL
UNION ALL
SELECT 'exercicio_musculo', COUNT(*) FROM exercicio_musculo r
LEFT JOIN exercicio e ON e.id=r.exercicio_id LEFT JOIN musculo m ON m.id=r.musculo_id
WHERE e.id IS NULL OR m.id IS NULL
UNION ALL
SELECT 'exercicio_ambiente', COUNT(*) FROM exercicio_ambiente r
LEFT JOIN exercicio e ON e.id=r.exercicio_id LEFT JOIN ambiente a ON a.id=r.ambiente_id
WHERE e.id IS NULL OR a.id IS NULL
UNION ALL
SELECT 'exercicio_equipamento_adicional', COUNT(*) FROM exercicio_equipamento_adicional r
LEFT JOIN exercicio e ON e.id=r.exercicio_id LEFT JOIN equipamento q ON q.id=r.equipamento_id
WHERE e.id IS NULL OR q.id IS NULL
UNION ALL
SELECT 'exercicio_nome_alternativo', COUNT(*) FROM exercicio_nome_alternativo r
LEFT JOIN exercicio e ON e.id=r.exercicio_id WHERE e.id IS NULL
UNION ALL
SELECT 'exercicio_midia', COUNT(*) FROM exercicio_midia r
LEFT JOIN exercicio e ON e.id=r.exercicio_id WHERE e.id IS NULL;
