-- Executar uma vez, depois de 001-008 e de um backup verificado.
-- Preserva IDs de exercícios, usuários, rotinas, séries e históricos.
ALTER TABLE exercicio
DROP FOREIGN KEY fk_exercicio_familia_movimento,
DROP CHECK ck_exercicio_lateralidade,
DROP CHECK ck_exercicio_mecanismo_carga,
DROP CHECK ck_exercicio_bracos_independentes,
DROP COLUMN familia_movimento_id,
DROP COLUMN lateralidade,
DROP COLUMN posicao_corporal,
DROP COLUMN posicao_articular,
DROP COLUMN angulo_execucao,
DROP COLUMN trajetoria,
DROP COLUMN apoio_estabilidade,
DROP COLUMN perfil_resistencia,
DROP COLUMN mecanismo_carga,
DROP COLUMN bracos_independentes,
ADD COLUMN modalidade VARCHAR(40) NOT NULL DEFAULT 'musculacao',
ADD INDEX idx_exercicio_catalogo (ativo, usuario_id, nome),
ADD INDEX idx_exercicio_modalidade (modalidade, ativo);

-- Relações de ambiente e equipamento adicional são úteis e ficam preservadas.
-- Taxonomias de movimento não eram utilizadas em nenhum fluxo do aplicativo.
DROP TABLE exercicio_padrao_movimento;

DROP TABLE padrao_movimento;

DROP TABLE familia_movimento;

-- Não remover mídias: a tabela suporta créditos/licenças para futuros arquivos.
ALTER TABLE tentativa_login ADD INDEX idx_login_ip_sucesso_data (ip_hash, sucesso, criado_em);

INSERT INTO
    biblioteca_migracao (codigo)
VALUES
    ('009_simplificar_catalogo');