-- Os alimentos já cadastrados continuam compartilhados. Novos rótulos pertencem à conta.
ALTER TABLE alimento
    ADD COLUMN usuario_id INT NULL,
    ADD CONSTRAINT fk_alimento_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    ADD UNIQUE INDEX uq_alimento_pessoal (usuario_id, nome);

ALTER TABLE plano_alimentar
    ADD COLUMN rascunho BOOLEAN NOT NULL DEFAULT FALSE,
    ADD INDEX ix_plano_periodo (usuario_id, rascunho, data_inicio, id);

ALTER TABLE registro_alimentar
    ADD COLUMN chave CHAR(32) NULL,
    ADD UNIQUE INDEX uq_consumo_envio (usuario_id, chave),
    ADD INDEX ix_consumo_dia (usuario_id, consumido_em);

-- O texto informado fica somente na associação da conta.
INSERT INTO preferencia_alimentar (nome, categoria)
VALUES ('Preferências pessoais', 'preferencia'), ('Restrições pessoais', 'restricao')
ON DUPLICATE KEY UPDATE id=id;
