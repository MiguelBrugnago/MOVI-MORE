-- Relações oficiais que não constavam dos lotes anteriores.
INSERT INTO exercicio_musculo (exercicio_id, musculo_id, papel, peso_estimado)
SELECT e.id, m.id, dados.papel, dados.peso
FROM (VALUES
    ROW('movi_084a67ca', 'biceps_braquial', 'secundario', NULL),
    ROW('movi_084a67ca', 'deltoide', 'primario', NULL),
    ROW('movi_084a67ca', 'reto_abdominal', 'secundario', NULL),
    ROW('movi_084a67ca', 'triceps_braquial', 'secundario', NULL),
    ROW('movi_0e608350', 'deltoide_posterior', 'secundario', NULL),
    ROW('movi_0e608350', 'latissimo_dorso', 'primario', NULL),
    ROW('movi_0e608350', 'reto_abdominal', 'secundario', NULL),
    ROW('movi_0e608350', 'triceps_braquial', 'secundario', NULL),
    ROW('movi_30f03bf0', 'deltoide_posterior', 'secundario', NULL),
    ROW('movi_30f03bf0', 'latissimo_dorso', 'primario', NULL),
    ROW('movi_30f03bf0', 'reto_abdominal', 'secundario', NULL),
    ROW('movi_30f03bf0', 'triceps_braquial', 'secundario', NULL),
    ROW('movi_9f9c164b', 'biceps_braquial', 'secundario', NULL),
    ROW('movi_9f9c164b', 'latissimo_dorso', 'primario', NULL),
    ROW('movi_9f9c164b', 'peitoral_maior', 'primario', NULL),
    ROW('movi_9f9c164b', 'reto_abdominal', 'secundario', NULL),
    ROW('movi_9f9c164b', 'triceps_braquial', 'secundario', NULL),
    ROW('movi_be3615cf', 'reto_abdominal', 'secundario', NULL),
    ROW('movi_be3615cf', 'serratil_anterior', 'secundario', NULL),
    ROW('movi_be3615cf', 'triceps_braquial', 'secundario', NULL)
) AS dados (exercicio, musculo, papel, peso)
JOIN exercicio e ON e.codigo = dados.exercicio AND e.usuario_id IS NULL
JOIN musculo m ON m.codigo = dados.musculo
ON DUPLICATE KEY UPDATE exercicio_id = exercicio_musculo.exercicio_id;
