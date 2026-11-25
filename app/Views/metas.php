<?php
require __DIR__ . '/fisico_comum.php';
$xp = 10 * $sessoes;
?>
<h1>Metas e conquistas</h1>
<section class="treino-card">
    <h2>Nível <?= 1 + intdiv($xp, 100) ?></h2>
    <p><?= $xp ?> XP · Faltam <?= 100 - $xp % 100 ?> XP para o próximo nível.</p>
    <progress value="<?= $xp % 100 ?>" max="100" aria-label="Progresso no nível"></progress>
    <p>Cada treino concluído com série realizada vale 10 XP. Sessões canceladas ou excluídas ficam fora dos pontos, metas e conquistas.</p>
    <ul><?php foreach ([1 => 'Primeiro treino', 5 => 'Cinco treinos', 20 => 'Vinte treinos'] as $alvo => $nome): ?>
        <li><?= $nome ?> · <?= $sessoes >= $alvo ? 'Conquistado' : min($sessoes, $alvo) . ' de ' . $alvo ?></li>
    <?php endforeach; ?></ul>
</section>
<h2>Minhas metas de treino e peso</h2>
<?php if (!$metas && !$metasPeso): ?><p>Você ainda não registrou metas.</p><?php endif; ?>
<?php foreach ($metas as $meta): $alvo = (int)$meta['valor_alvo']; ?>
<article class="treino-card">
    <h3><?= $alvo ?> treinos entre <?= $esc($meta['data_inicio']) ?> e <?= $esc($meta['data_fim'] ?? 'sem prazo') ?></h3>
    <p><?= $meta['realizado'] ?> concluídos · <?= $meta['realizado'] >= $alvo ? 'Meta alcançada' : ($meta['data_inicio'] > $hoje ? 'Agendada' : ($meta['data_fim'] !== null && $meta['data_fim'] < $hoje ? 'Prazo encerrado' : 'Em andamento')) ?></p>
    <progress max="<?= $alvo ?>" value="<?= min($alvo, $meta['realizado']) ?>" aria-label="Treinos concluídos"></progress>
</article>
<?php endforeach; ?>
<?php foreach ($metasPeso as $meta):
    $minimo = $meta['tipo'] === 'peso_minimo';
    $atingida = $meta['peso'] !== null && ($minimo ? $meta['peso'] >= $meta['valor_alvo'] : $meta['peso'] <= $meta['valor_alvo']); ?>
<article class="treino-card">
    <h3>Peso <?= $minimo ? 'mínimo' : 'máximo' ?> de <?= $numero($meta['valor_alvo']) ?> kg</h3>
    <p>De <?= $esc($meta['data_inicio']) ?> até <?= $esc($meta['data_fim'] ?? 'sem prazo') ?>.</p>
    <?php if ($meta['peso'] === null): ?><p>Sem peso registrado no período.</p>
    <?php else: ?><p>Última avaliação no período: <?= $numero($meta['peso']) ?> kg · <?= $atingida ? 'Meta alcançada' : 'Distância ao alvo: ' . $numero(abs($meta['peso'] - $meta['valor_alvo'])) . ' kg' ?></p><?php endif; ?>
</article>
<?php endforeach; ?>
<form method="post">
    <input type="hidden" name="csrf_token" value="<?= $csrf ?>">
    <label>Quantidade de treinos<input name="alvo" type="number" min="1" max="10000" required></label>
    <label>Início<input name="inicio" type="date" min="1900-01-01" value="<?= $hoje ?>" required></label>
    <label>Fim<input name="fim" type="date" required></label>
    <button>Criar meta</button>
</form>
<details class="treino-card"><summary>Criar meta de peso</summary>
<form method="post">
    <input type="hidden" name="csrf_token" value="<?= $csrf ?>">
    <label>Critério<select name="tipo"><option value="peso_minimo">Peso igual ou maior que o alvo</option><option value="peso_maximo">Peso igual ou menor que o alvo</option></select></label>
    <label>Peso alvo (kg)<input name="alvo" type="number" min="1" max="700" step="0.01" required></label>
    <label>Início<input name="inicio" type="date" min="1900-01-01" value="<?= $hoje ?>" required></label>
    <label>Fim<input name="fim" type="date" required></label>
    <button>Salvar meta de peso</button>
</form></details>
