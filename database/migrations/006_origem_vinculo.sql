ALTER TABLE vinculo_profissional
ADD COLUMN solicitado_por ENUM('aluno', 'profissional') NULL
AFTER aluno_id;