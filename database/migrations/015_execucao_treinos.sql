ALTER TABLE rotina
ADD COLUMN dia_semana TINYINT NULL;

ALTER TABLE rotina_exercicio
ADD COLUMN grupo INT NULL;

ALTER TABLE treino_exercicio
ADD COLUMN descanso_segundos INT NULL,
ADD COLUMN grupo INT NULL,
ADD COLUMN nome_snapshot VARCHAR(255) NULL;

ALTER TABLE serie
ADD COLUMN metas JSON NULL,
ADD COLUMN rpe DECIMAL(3, 1) NULL,
ADD COLUMN lado VARCHAR(10) NULL,
ADD COLUMN observacao TEXT NULL,
ADD COLUMN ignorada BOOLEAN NOT NULL DEFAULT FALSE,
ADD COLUMN chave CHAR(32) NULL,
ADD UNIQUE KEY uq_serie_requisicao (treino_exercicio_id, chave);

ALTER TABLE treino
ADD COLUMN descanso_ate DATETIME NULL,
ADD INDEX ix_treino_historico (usuario_id, status, finalizado_em, id);