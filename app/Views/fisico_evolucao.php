<?php
// A tabela chega do mais recente ao mais antigo. O gráfico percorre a ordem inversa para mostrar a evolução no tempo.
/**
 * @var int $idAlunoAcompanhado
 * @var array $avaliacoes
 * @var array $metricas
 * @var Closure $esc
 * @var Closure $numero
 * @var string $periodo
 */
?>
<form method="get" class="filtros">
<?php if ($somenteLeitura ?? false): ?><input type="hidden" name="id" value="<?= $idAlunoAcompanhado ?>"><?php endif; ?>
<label>Período<select name="periodo"><?php foreach (['30' => '30 dias', '90' => '90 dias', '6m' => 'Seis meses', '1a' => 'Um ano', 'todos' => 'Histórico completo'] as $v => $label): ?><option value="<?= $v ?>" <?= (string)$v === $periodo ? 'selected' : '' ?>><?= $label ?></option><?php endforeach; ?></select></label><button>Aplicar filtro</button></form>
<p>Estimativas de composição corporal usam peso e gordura da mesma avaliação. Não são medições clínicas. Campos ausentes não são tratados como zero.</p>
<?php if ($avaliacoes): ?>
<div class="catalogo">
<?php foreach ($metricas as $chave => [$nome,$unidade]): if ($chave === 'massa_gorda') {
    continue;
}
    // Cada indicador tem a própria sequência de datas. Uma avaliação sem a medida fica fora da linha desse gráfico.
    $pontos = [];
    foreach (array_reverse($avaliacoes) as $a) {
        if (isset($a['medidas'][$chave])) {
            $pontos[] = ['data' => $a['avaliado_em'], 'valor' => $a['medidas'][$chave]];
        }
    }
    ?>
<article><h3><?= $esc($nome) ?> (<?= $unidade ?>)</h3>
<?php if (!$pontos): ?><p>Sem dados para este indicador.</p><?php else: ?>
<div class="fisico-grafico" data-pontos="<?= $esc(json_encode($pontos, JSON_THROW_ON_ERROR)) ?>" data-rotulo="<?= $esc($nome . ' (' . $unidade . ')') ?>"></div>
<details><summary>Ver valores do gráfico</summary><table><thead><tr><th>Data</th><th><?= $unidade ?></th></tr></thead><tbody><?php foreach ($pontos as $p): ?><tr><td><?= $esc($p['data']) ?></td><td><?= $numero($p['valor']) ?></td></tr><?php endforeach; ?></tbody></table></details>
<?php endif; ?></article><?php endforeach; ?></div>
<?php if (count($avaliacoes) > 1): ?>
<article class="fisico-comparacao"><h2>Comparar avaliações</h2><div class="treino-campos">
<?php foreach (['a' => 'Avaliação inicial', 'b' => 'Avaliação final'] as $lado => $nome): ?><label><?= $nome ?><select data-comparar="<?= $lado ?>"><?php foreach (array_reverse($avaliacoes) as $i => $a): ?><option value="<?= (int)$a['id'] ?>" <?= $lado === 'b' && $i === count($avaliacoes) - 1 ? 'selected' : '' ?>><?= $esc($a['avaliado_em']) ?> · #<?= (int)$a['id'] ?></option><?php endforeach; ?></select></label><?php endforeach; ?></div>
<div data-comparacao-saida aria-live="polite"></div>
<script type="application/json" data-comparacao-dados><?= json_encode(['avaliacoes' => array_map(static fn ($a) => ['id' => $a['id'], 'medidas' => $a['medidas']], $avaliacoes), 'metricas' => $metricas], JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_THROW_ON_ERROR) ?></script>
<noscript>Consulte a tabela do histórico para comparar as avaliações. A comparação automática requer JavaScript.</noscript></article>
<?php endif; ?>
<?php else: ?><p>Nenhuma avaliação no período escolhido.</p><?php endif; ?>
<script src="/assets/js/fisico.js" defer></script>
