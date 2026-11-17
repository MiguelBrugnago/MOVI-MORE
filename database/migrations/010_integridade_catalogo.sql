-- Completa apenas a classificação dos exercícios sem equipamento externo.
INSERT INTO
    equipamento (codigo, nome, descricao)
VALUES
    (
        'peso_corporal',
        'Peso corporal',
        'Resistência do próprio corpo'
    ) ON DUPLICATE KEY
UPDATE nome =
VALUES
    (nome);

UPDATE exercicio
SET
    equipamento_id = (
        SELECT
            id
        FROM
            equipamento
        WHERE
            codigo = 'peso_corporal'
    )
WHERE
    equipamento_id IS NULL;

ALTER TABLE exercicio MODIFY codigo VARCHAR(120) CHARACTER
SET
    ascii COLLATE ascii_bin NOT NULL,
    MODIFY descricao TEXT NOT NULL,
    MODIFY grupo_muscular_id INT NOT NULL,
    MODIFY equipamento_id INT NOT NULL,
    MODIFY tipo_registro_id INT NOT NULL,
    MODIFY tipo VARCHAR(40) NOT NULL DEFAULT 'treinamento';