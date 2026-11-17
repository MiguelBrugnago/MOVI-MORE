-- A contagem de uma série pode representar repetições, passos ou andares.
ALTER TABLE tipo_registro ADD unidade_contagem VARCHAR(20) NOT NULL DEFAULT 'repetições';