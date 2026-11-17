-- Padroniza os códigos legados do catálogo público.
-- As relações usam o ID numérico, que permanece intacto.
UPDATE exercicio
SET
  codigo = CONCAT ('movi_', RIGHT (codigo, 8))
WHERE
  usuario_id IS NULL
  AND codigo REGEXP '^hevy_[0-9a-z]{8}$';