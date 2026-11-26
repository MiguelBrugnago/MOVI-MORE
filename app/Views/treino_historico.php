<?php
// Cada sessão traz um resumo dos exercícios. O ID da última sessão é o cursor usado no link para a página anterior.

/**
 * @var list<array> $rows Página de sessões concluídas com seus resumos por exercício.
 * @var bool $mais
 * @var array $f
 * @var Closure $esc
 * @var Closure $dataHora
 * @var Closure $duracao
 */
require __DIR__ . '/treinos/comum.php';
$temFiltros = $f['de'] !== '' || $f['ate'] !== '' || $f['exercicio'] !== '';
?>
<section class="treino-area historico-treinos">
    <h1>Histórico de treinos</h1>
    <form action="/treinos/historico" method="get" class="treino-campos">
        <label>De<input type="date" name="de" value="<?= $esc($f['de']) ?>"></label>
        <label>Até<input type="date" name="ate" value="<?= $esc($f['ate']) ?>"></label>
        <label>Nome do exercício<input type="search" name="exercicio" maxlength="120" value="<?= $esc($f['exercicio']) ?>"></label>
        <div class="treino-acoes">
            <button>Filtrar</button>
            <?php if ($temFiltros): ?><a href="/treinos/historico">Limpar filtros</a><?php endif ?>
        </div>
    </form>
    <?php if (!$rows): ?>
        <?php if ($temFiltros): ?>
            <p>Nenhum treino concluído corresponde aos filtros. Tente outro período ou exercício.</p>
        <?php else: ?>
            <p>Os treinos aparecem aqui depois da finalização. <a href="/rotinas">Abrir rotinas</a></p>
        <?php endif ?>
    <?php endif ?>
    <?php foreach ($rows as $t): ?>
        <article class="treino-card">
            <h2><a href="/treinos/ver?id=<?= (int)$t['id'] ?>"><?= $esc($t['nome'] ?? 'Treino') ?></a></h2>
            <p>Concluído em <?= $esc($dataHora($t['fim'])) ?> · Duração <?= $duracao($t['duracao']) ?></p>
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
