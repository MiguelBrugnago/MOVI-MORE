DELETE em
FROM
    exercicio_musculo em
    JOIN exercicio e ON e.id = em.exercicio_id
    JOIN musculo m ON m.id = em.musculo_id
WHERE
    (
        e.codigo = 'movi_0e608350'
        AND m.codigo NOT IN (
            'latissimo_dorso',
            'reto_abdominal',
            'triceps_braquial',
            'deltoide_posterior'
        )
    )
    OR (
        e.codigo = 'movi_30f03bf0'
        AND m.codigo NOT IN (
            'latissimo_dorso',
            'reto_abdominal',
            'triceps_braquial',
            'deltoide_posterior'
        )
    )
    OR (
        e.codigo = 'movi_be3615cf'
        AND m.codigo NOT IN (
            'deltoide',
            'triceps_braquial',
            'serratil_anterior',
            'reto_abdominal'
        )
    )
    OR (
        e.codigo = 'movi_9f9c164b'
        AND m.codigo NOT IN (
            'latissimo_dorso',
            'peitoral_maior',
            'biceps_braquial',
            'triceps_braquial',
            'reto_abdominal'
        )
    )
    OR (
        e.codigo = 'movi_084a67ca'
        AND m.codigo NOT IN (
            'deltoide',
            'reto_abdominal',
            'biceps_braquial',
            'triceps_braquial'
        )
    );