-- Assinatura linha a linha do catálogo público. Compare a saída entre bancos.
-- Exclui IDs numéricos e datas de criação, que dependem da instalação.
SELECT grupo, assinatura FROM (
SELECT 'exercicio' AS grupo, SHA2(JSON_ARRAY(e.codigo,e.nome,e.descricao,e.instrucoes,e.categoria,e.dificuldade,e.tipo,e.unilateral,e.midia,e.ativo,e.slug,e.nome_ingles,e.criterio_carga,e.criterio_repeticoes,e.modalidade,q.codigo,g.codigo,t.codigo),256) AS assinatura FROM exercicio e JOIN equipamento q ON q.id=e.equipamento_id JOIN grupo_muscular g ON g.id=e.grupo_muscular_id JOIN tipo_registro t ON t.id=e.tipo_registro_id WHERE e.usuario_id IS NULL
UNION ALL
SELECT 'ambiente', SHA2(JSON_ARRAY(codigo,nome,descricao),256) FROM ambiente
UNION ALL
SELECT 'equipamento', SHA2(JSON_ARRAY(codigo,nome,descricao),256) FROM equipamento
UNION ALL
SELECT 'grupo', SHA2(JSON_ARRAY(codigo,nome,descricao,ordem),256) FROM grupo_muscular
UNION ALL
SELECT 'musculo', SHA2(JSON_ARRAY(m.codigo,m.nome,m.grupo,m.regiao,m.svg_id,p.codigo),256) FROM musculo m LEFT JOIN musculo p ON p.id=m.musculo_pai_id
UNION ALL
SELECT 'tipo', SHA2(JSON_ARRAY(codigo,nome,usa_repeticoes,usa_carga,usa_duracao,usa_distancia,natureza_carga,descricao,unidade_contagem),256) FROM tipo_registro
UNION ALL
SELECT 'aliases', SHA2(JSON_ARRAY(e.codigo,r.idioma,r.nome),256) FROM exercicio_nome_alternativo r JOIN exercicio e ON e.id=r.exercicio_id WHERE e.usuario_id IS NULL
UNION ALL
SELECT 'rel_musculos', SHA2(JSON_ARRAY(e.codigo,m.codigo,r.papel,r.peso_estimado),256) FROM exercicio_musculo r JOIN exercicio e ON e.id=r.exercicio_id JOIN musculo m ON m.id=r.musculo_id WHERE e.usuario_id IS NULL
UNION ALL
SELECT 'rel_equipamentos', SHA2(JSON_ARRAY(e.codigo,q.codigo,r.observacao),256) FROM exercicio_equipamento_adicional r JOIN exercicio e ON e.id=r.exercicio_id JOIN equipamento q ON q.id=r.equipamento_id WHERE e.usuario_id IS NULL
UNION ALL
SELECT 'rel_ambientes', SHA2(JSON_ARRAY(e.codigo,a.codigo),256) FROM exercicio_ambiente r JOIN exercicio e ON e.id=r.exercicio_id JOIN ambiente a ON a.id=r.ambiente_id WHERE e.usuario_id IS NULL
UNION ALL
SELECT 'midia', SHA2(JSON_ARRAY(e.codigo,r.codigo,r.tipo,r.localizacao,r.descricao_acessivel,
    r.angulo_visualizacao,r.lado_demonstrado,r.ordem,r.principal,r.origem,r.credito,r.licenca),256)
FROM exercicio_midia r JOIN exercicio e ON e.id=r.exercicio_id WHERE e.usuario_id IS NULL
) AS catalogo
ORDER BY grupo, assinatura;
