SET
    NAMES utf8mb4;

START TRANSACTION;

INSERT INTO
    padrao_movimento (codigo, nome)
VALUES
    ('elevacao_escapulas', 'Elevação das escápulas'),
    ('flexao_joelhos', 'Flexão de joelhos'),
    ('extensao_joelhos', 'Extensão de joelhos'),
    (
        'abducao_horizontal_ombro',
        'Abdução horizontal do ombro'
    ),
    (
        'aducao_horizontal_ombro',
        'Adução horizontal do ombro'
    ),
    ('extensao_ombro', 'Extensão do ombro');

INSERT INTO
    familia_movimento (codigo, nome)
VALUES
    ('extensao_tronco', 'Extensão de tronco');

INSERT INTO
    biblioteca_migracao (codigo)
VALUES
    ('008_padroes_expansao_biblioteca');

COMMIT;