INSERT INTO exercicio_midia (
    exercicio_id,
    codigo,
    tipo,
    localizacao,
    descricao_acessivel,
    origem,
    credito,
    licenca
)
SELECT
    exercicio.id,
    'flexao_solo_foto_01',
    'imagem',
    '/assets/img/guy-doing-push-up.jpg',
    'Pessoa demonstrando uma flexão de braços no solo.',
    'https://www.goodfreephotos.com/people/guy-doing-push-up.jpg.php',
    'Good Free Photos',
    'CC0 1.0'
FROM exercicio
WHERE exercicio.codigo = 'flexao_solo'
    AND exercicio.usuario_id IS NULL
ON DUPLICATE KEY UPDATE id = exercicio_midia.id;
