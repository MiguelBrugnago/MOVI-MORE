<?php

require __DIR__ . '/fisico_comum.php';

$xpTotal = 10 * $sessoes;
$xpNoNivel = $xpTotal % 100;
$nivelAtual = 1 + intdiv($xpTotal, 100);
$conquistas = [
    1 => 'Primeiro treino',
    5 => 'Cinco treinos',
    20 => 'Vinte treinos',
];
?>

<h1>Metas e conquistas</h1>

<section class="treino-card metas-nivel" aria-labelledby="titulo-nivel-atual">
    <h2 id="titulo-nivel-atual">Nível <?= $nivelAtual ?></h2>
    <p class="metas-xp">
        <strong><?= $xpTotal ?> XP</strong>
        <span>Faltam <?= 100 - $xpNoNivel ?> XP para o próximo nível.</span>
    </p>
    <progress value="<?= $xpNoNivel ?>" max="100" aria-label="Progresso no nível"></progress>
    <p>Cada treino concluído com pelo menos uma série realizada vale 10 XP.</p>
</section>

<section class="metas-conquistas" aria-labelledby="titulo-conquistas">
    <h2 id="titulo-conquistas">Conquistas de treino</h2>
    <ul class="metas-conquistas-lista">
        <?php foreach ($conquistas as $alvoConquista => $nomeConquista): ?>
            <li class="metas-conquista">
                <strong><?= $esc($nomeConquista) ?></strong>
                <span>
                    <?= $sessoes >= $alvoConquista ? 'Conquistado' : $sessoes . ' de ' . $alvoConquista . ' treinos' ?>
                </span>
            </li>
        <?php endforeach; ?>
    </ul>
</section>

<div class="metas-conteudo">
    <section aria-labelledby="titulo-minhas-metas">
        <h2 id="titulo-minhas-metas">Minhas metas</h2>

        <?php if (!$metas && !$metasPeso): ?>
            <p class="treino-card">Você ainda não registrou metas de treino ou de peso.</p>
        <?php endif; ?>

        <?php foreach ($metas as $metaTreino): ?>
            <?php
            $alvoTreinos = (int) $metaTreino['valor_alvo'];
            $treinosConcluidos = (int) $metaTreino['realizado'];
            $situacaoMetaTreino = match (true) {
                $treinosConcluidos >= $alvoTreinos => 'Meta alcançada',
                $metaTreino['data_inicio'] > $hoje => 'Agendada',
                $metaTreino['data_fim'] !== null && $metaTreino['data_fim'] < $hoje => 'Prazo encerrado',
                default => 'Em andamento',
            };
            ?>
            <article class="treino-card meta-cartao">
                <h3><?= $alvoTreinos ?> treinos</h3>
                <p>De <?= $esc($metaTreino['data_inicio']) ?> até <?= $esc($metaTreino['data_fim'] ?? 'sem prazo') ?>.</p>
                <p><?= $treinosConcluidos ?> concluídos · <?= $esc($situacaoMetaTreino) ?></p>
                <progress
                    max="<?= $alvoTreinos ?>"
                    value="<?= min($alvoTreinos, $treinosConcluidos) ?>"
                    aria-label="Treinos concluídos"
                ></progress>
            </article>
        <?php endforeach; ?>

        <?php foreach ($metasPeso as $metaPeso): ?>
            <?php
            $pesoMinimo = $metaPeso['tipo'] === 'peso_minimo';
            $pesoRegistrado = $metaPeso['peso'];
            $pesoAlvo = $metaPeso['valor_alvo'];
            $metaAlcancada = $pesoRegistrado !== null
                && ($pesoMinimo ? $pesoRegistrado >= $pesoAlvo : $pesoRegistrado <= $pesoAlvo);
            ?>
            <article class="treino-card meta-cartao">
                <h3>Peso <?= $pesoMinimo ? 'mínimo' : 'máximo' ?> de <?= $numero($pesoAlvo) ?> kg</h3>
                <p>De <?= $esc($metaPeso['data_inicio']) ?> até <?= $esc($metaPeso['data_fim'] ?? 'sem prazo') ?>.</p>
                <?php if ($pesoRegistrado === null): ?>
                    <p>Sem peso registrado no período.</p>
                <?php else: ?>
                    <p>Última avaliação no período: <?= $numero($pesoRegistrado) ?> kg</p>
                    <p><?= $metaAlcancada ? 'Meta alcançada' : 'Distância ao alvo: ' . $numero(abs($pesoRegistrado - $pesoAlvo)) . ' kg' ?></p>
                <?php endif; ?>
            </article>
        <?php endforeach; ?>
    </section>

    <section class="metas-acoes" aria-labelledby="titulo-criar-meta">
        <h2 id="titulo-criar-meta">Criar uma meta</h2>

        <div class="treino-card">
            <h3>Meta de treino</h3>
            <form method="post">
                <input type="hidden" name="csrf_token" value="<?= $csrf ?>">
                <label>Quantidade de treinos<input name="alvo" type="number" min="1" max="10000" required></label>
                <label>Início<input name="inicio" type="date" min="1900-01-01" value="<?= $esc($hoje) ?>" required></label>
                <label>Fim<input name="fim" type="date" required></label>
                <button type="submit">Criar meta de treino</button>
            </form>
        </div>

        <details class="treino-card">
            <summary>Criar meta de peso</summary>
            <form method="post">
                <input type="hidden" name="csrf_token" value="<?= $csrf ?>">
                <label>
                    Critério
                    <select name="tipo">
                        <option value="peso_minimo">Peso igual ou maior que o alvo</option>
                        <option value="peso_maximo">Peso igual ou menor que o alvo</option>
                    </select>
                </label>
                <label>Peso alvo (kg)<input name="alvo" type="number" min="1" max="700" step="0.01" required></label>
                <label>Início<input name="inicio" type="date" min="1900-01-01" value="<?= $esc($hoje) ?>" required></label>
                <label>Fim<input name="fim" type="date" required></label>
                <button type="submit">Salvar meta de peso</button>
            </form>
        </details>
    </section>
</div>
