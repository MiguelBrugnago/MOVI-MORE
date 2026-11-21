<?php

/**
 * @var array $totais
 * @var array $periodos
 * @var array $execucao
 * @var array $recordes
 * @var array $evolucao
 * @var array $recentes
 * @var array $distribuicao
 * @var int $exercicio
 * @var Closure $esc
 * @var Closure $dataHora
 * @var Closure $duracao
 */

use App\Services\RegistroTreino;

require __DIR__ . '/treinos/comum.php';
$grafico = static function (string $titulo, array $linhas, string $campo, callable $rotulo, callable $valor) use ($esc): void {
    $linhas = array_values(array_filter($linhas, static fn ($r) => isset($r[$campo])));
    ?>
    <details class="treino-card">
        <summary><?= $esc($titulo) ?></summary>
        <?php if (!$linhas): ?><p>Sem registros compatíveis.</p><?php else:
            $max = max(1, max(array_column($linhas, $campo)));
            foreach ($linhas as $r): $nome = $rotulo($r); ?>
                <div class="treino-barra treino-grafico">
                    <span><?= $esc($nome) ?></span>
                    <meter min="0" max="<?= $esc($max) ?>" value="<?= $esc(max(0, $r[$campo])) ?>" aria-label="<?= $esc($nome . ': ' . $titulo) ?>"></meter>
                    <strong><?= $esc($valor($r[$campo])) ?></strong>
                </div>
        <?php endforeach;
        endif ?>
    </details>
<?php
};
$data = static fn ($r) => $dataHora($r['fim'], 'd/m/Y');
?>
<section class="treino-area">
    <h1>Evolução no treino</h1>
    <div class="catalogo">
        <article>
            <h2>Treinos concluídos</h2>
            <p><?= (int)$totais['total'] ?></p>
        </article>
        <article>
            <h2>Duração média</h2>
            <p><?= $duracao($totais['media']) ?></p>
        </article>
        <article>
            <h2>Séries concluídas</h2>
            <p><?= (int)$execucao['series'] ?></p>
        </article>
        <article>
            <h2>Volume de trabalho com carga externa</h2>
            <p><?= $execucao['volume'] !== null ? number_format((float)$execucao['volume'], 2, ',', '.') . ' kg × rep.' : '—' ?></p>
        </article>
    </div>
    <?php foreach (['semanas' => 'Treinos por semana (ISO)', 'meses' => 'Treinos por mês'] as $k => $tituloGrafico): ?>
        <article class="treino-card">
            <h2><?= $tituloGrafico ?></h2>
            <?php if (!$periodos[$k]): ?><p>Sem sessões concluídas.</p><?php else:
                $max = max(array_column($periodos[$k], 'total'));
                foreach (array_reverse($periodos[$k]) as $p):
                    $periodo = (string)$p['periodo'];
                    if ($k === 'semanas') {
                        $periodo = substr($periodo, 0, 4) . '-S' . substr($periodo, 4);
                    } ?>
                    <div class="treino-barra"><span><?= $esc($periodo) ?></span><meter min="0" max="<?= (int)$max ?>" value="<?= (int)$p['total'] ?>" aria-label="Treinos em <?= $esc($periodo) ?>"></meter><strong><?= (int)$p['total'] ?></strong></div>
            <?php endforeach;
            endif ?>
        </article>
    <?php endforeach ?>
    <?php
    $grafico('Volume de trabalho por sessão', array_reverse($recentes), 'volume', $data, static fn ($v) => number_format((float)$v, 2, ',', '.') . ' kg × rep.');
$grafico('Duração por sessão', array_reverse($recentes), 'duracao', $data, $duracao);
$grafico('Distribuição das séries concluídas', $distribuicao, 'total', static fn ($r) => RegistroTreino::TIPOS[$r['tipo']] ?? $r['tipo'], static fn ($v) => $v);
?>
    <article class="treino-card">
        <h2>Exercícios mais realizados e recordes</h2>
        <p>Recordes e volume de trabalho desconsideram aquecimento e séries preparatórias.</p>
        <?php if (!$recordes): ?><p>Os recordes aparecem depois de concluir um treino.</p><?php endif ?>
        <?php foreach ($recordes as $r): ?>
            <p><a href="/treinos/estatisticas?exercicio=<?= (int)$r['id'] ?>#evolucao"><?= $esc($r['nome']) ?></a> · <?= (int)$r['treinos'] ?> treinos
                <?php foreach (['carga' => 'kg', 'repeticoes' => 'rep.', 'duracao' => 's', 'distancia' => 'm'] as $k => $un): if (isset($r[$k])): ?>
                        · <?= $esc($r[$k]) ?> <?= $un ?>
                <?php endif;
                endforeach ?></p>
        <?php endforeach ?>
    </article>
    <?php if ($exercicio): ?>
        <article class="treino-card" id="evolucao">
            <h2>Melhor carga e contagem por sessão</h2>
            <?php if (!$evolucao): ?><p>Sem séries concluídas para este exercício.</p><?php else: ?>
                <?php
                                                                                        $grafico('Progressão de carga', array_reverse($evolucao), 'carga', $data, static fn ($v) => number_format((float)$v, 2, ',', '.') . ' kg');
                $grafico('Evolução da contagem', array_reverse($evolucao), 'repeticoes', $data, static fn ($v) => $v);
                ?>
                <table>
                    <thead>
                        <tr>
                            <th>Sessão</th>
                            <th>Carga (kg)</th>
                            <th>Contagem</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($evolucao as $v): ?>
                            <tr>
                                <td><a href="/treinos/ver?id=<?= (int)$v['id'] ?>"><?= $esc($dataHora($v['fim'])) ?></a></td>
                                <td><?= $esc($v['carga'] ?? '—') ?></td>
                                <td><?= $esc($v['repeticoes'] ?? '—') ?></td>
                            </tr>
                        <?php endforeach ?>
                    </tbody>
                </table>
                <p>Carga e contagem são máximos independentes e podem vir de séries diferentes.</p>
            <?php endif ?>
        </article>
    <?php endif ?>
</section>