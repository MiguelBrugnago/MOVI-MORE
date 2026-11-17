-- Converte códigos legados importados após o registro da migration 012.
-- Atualiza somente o código, preservando o ID e as referências existentes.
UPDATE exercicio
SET
  codigo = CONCAT ('movi_', RIGHT (codigo, 8))
WHERE
  usuario_id IS NULL
  AND codigo REGEXP '^hevy_[0-9a-z]{8}$';