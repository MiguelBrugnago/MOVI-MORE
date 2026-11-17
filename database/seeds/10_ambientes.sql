-- Taxonomia oficial de ambientes recuperada da biblioteca do MOVI+.
INSERT INTO ambiente (codigo, nome, descricao)
VALUES ('academia', 'Academia', 'Ambiente de treinamento cuja compatibilidade depende dos equipamentos disponíveis e das condições de execução.'),
       ('casa', 'Casa', 'Ambiente doméstico cuja compatibilidade depende do espaço, dos apoios e dos equipamentos disponíveis.'),
       ('parque', 'Parque', 'Ambiente ao ar livre cuja compatibilidade depende do piso, das estruturas e dos equipamentos disponíveis.')
ON DUPLICATE KEY UPDATE codigo = COALESCE(ambiente.codigo, VALUES(codigo));
