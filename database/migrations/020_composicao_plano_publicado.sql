-- A composição disponível na atualização é a única referência para planos legados.
ALTER TABLE refeicao_alimento
    ADD COLUMN nome_publicado VARCHAR(150) NULL,
    ADD COLUMN calorias_100g_publicadas DECIMAL(8,2) NULL,
    ADD COLUMN proteinas_100g_publicadas DECIMAL(8,2) NULL,
    ADD COLUMN carboidratos_100g_publicados DECIMAL(8,2) NULL,
    ADD COLUMN gorduras_100g_publicadas DECIMAL(8,2) NULL;

UPDATE refeicao_alimento i
JOIN refeicao r ON r.id=i.refeicao_id
JOIN plano_alimentar p ON p.id=r.plano_alimentar_id
JOIN alimento a ON a.id=i.alimento_id
SET i.nome_publicado=a.nome, i.calorias_100g_publicadas=a.calorias_100g,
    i.proteinas_100g_publicadas=a.proteinas_100g, i.carboidratos_100g_publicados=a.carboidratos_100g,
    i.gorduras_100g_publicadas=a.gorduras_100g
WHERE p.rascunho=0;
