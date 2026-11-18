<?php if (!$avaliacoes): ?><article><p>Nenhuma avaliação neste período.</p></article><?php else: ?>
<table><caption>Avaliações da mais recente à mais antiga</caption><thead><tr><th>Data</th><th>Peso (kg)</th><th>Gordura (%)</th><th>Massa magra estimada (kg)</th><th>Detalhes</th></tr></thead><tbody>
<?php foreach ($avaliacoes as $a): ?><tr><td><?= $esc($a['avaliado_em']) ?></td><?php foreach (['peso','gordura','massa_magra'] as $chave): ?><td><?= $numero($a['medidas'][$chave] ?? null) ?></td><?php endforeach; ?>
<td><?php if (!($somenteLeitura ?? false)): ?><a href="/perfil/avaliacoes/ver?id=<?= (int)$a['id'] ?>">Ver e corrigir</a><?php else: ?>
<details><summary>Medidas</summary><dl><?php foreach ($metricas as $chave=>[$nome,$unidade]): ?><dt><?= $esc($nome) ?> (<?= $unidade ?>)</dt><dd><?= $numero($a['medidas'][$chave] ?? null) ?></dd><?php endforeach; ?></dl>
<?php if ($saudePermitida ?? false): ?><p class="treino-nota"><?= $esc($a['observacao']) ?></p><?php endif; ?></details>
<?php endif; ?></td></tr><?php endforeach; ?></tbody></table>
<?php endif; ?>
