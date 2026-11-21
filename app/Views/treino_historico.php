<?php

/**
 * @var array $rows
 * @var bool $mais
 * @var array $f
 * @var Closure $esc
 * @var Closure $dataHora
 * @var Closure $duracao
 */
require __DIR__ . '/treinos/comum.php'; ?>
<section class="treino-area">
    <h1>Histórico de treinos</h1>
    <form action="/treinos/historico" method="get" class="treino-campos">
        <label>De<input type="date" name="de" value="<?= $esc($f['de']) ?>"></label>
        <label>Até<input type="date" name="ate" value="<?= $esc($f['ate']) ?>"></label>
        <label>Nome do exercício<input name="exercicio" value="<?= $esc($f['exercicio']) ?>"></label>
        <button>Filtrar</button>
    </form>
    <?php if (!$rows): ?><p>Nenhum treino concluído encontrado.</p><?php endif ?>
    <?php foreach ($rows as $t): ?>
        <article class="treino-card">
            <h2><a href="/treinos/ver?id=<?= (int)$t['id'] ?>"><?= $esc($t['nome'] ?? 'Treino') ?></a></h2>
            <p><?= $esc($dataHora($t['fim'])) ?> · <?= $duracao($t['duracao']) ?></p>
            <?php if ($t['exercicios']): ?>
                <p><?= $esc(implode(' · ', array_column($t['exercicios'], 'nome'))) ?></p>
                <p><?= (int)array_sum(array_column($t['exercicios'], 'series')) ?> séries concluídas
                    <?php if (array_filter(array_column($t['exercicios'], 'volume'), static fn ($v) => $v !== null)): ?>
                        · <?= number_format(array_sum(array_column($t['exercicios'], 'volume')), 2, ',', '.') ?> kg × rep.
                    <?php endif ?></p>
            <?php endif ?>
        </article>
    <?php endforeach ?>
    <?php if ($mais): ?><p><a href="/treinos/historico?<?= $esc(http_build_query($f + ['antes' => end($rows)['id']])) ?>">Ver treinos anteriores</a></p><?php endif ?>
</section>