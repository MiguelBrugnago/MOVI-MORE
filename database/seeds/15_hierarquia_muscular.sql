-- Preserva a hierarquia dos músculos usando os códigos do catálogo oficial.
UPDATE musculo m
JOIN (VALUES
    ROW('deltoide_anterior', 'deltoide'),
    ROW('deltoide_lateral', 'deltoide'),
    ROW('deltoide_posterior', 'deltoide'),
    ROW('trapezio_inferior', 'trapezio'),
    ROW('trapezio_medio', 'trapezio'),
    ROW('trapezio_superior', 'trapezio')
) AS dados (filho, pai) ON dados.filho = m.codigo
JOIN musculo p ON p.codigo = dados.pai
SET m.musculo_pai_id = p.id
WHERE m.musculo_pai_id IS NULL;
