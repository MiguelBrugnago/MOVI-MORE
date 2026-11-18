-- Depende de 001–016. Medidas continuam em medida/avaliacao, sem duplicação.
ALTER TABLE perfil
    ADD altura_cm DECIMAL(5,2) NULL,
    ADD tempo_treinamento_meses SMALLINT UNSIGNED NULL,
    ADD disponibilidade VARCHAR(255) NULL,
    ADD ambiente_preferido VARCHAR(80) NULL;

ALTER TABLE avaliacao ADD INDEX ix_avaliacao_usuario_data (usuario_id, avaliado_em, id);
ALTER TABLE medida ADD INDEX ix_medida_avaliacao_usuario (avaliacao_id, usuario_id, tipo);
