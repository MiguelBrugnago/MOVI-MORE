<?php

/**
 * @var array $treino
 * @var array $itens
 * @var array $series
 * @var array $anterior
 * @var string|float|null $volume
 * @var array $recordesSessao
 * @var Closure $esc
 * @var Closure $hidden
 * @var Closure $texto
 * @var Closure $num
 * @var Closure $duracao
 * @var Closure $dataHora
 * @var Closure $resumo
 */

use App\Services\RegistroTreino;

require __DIR__ . '/treinos/comum.php';
$id = (int)$treino['id'];
$ativo = $treino['status'] === 'em_andamento';
$finalizado = $treino['status'] === 'concluido';
$editavel = $ativo || $finalizado;
require __DIR__ . '/treinos/resumo_serie.php';
?>
<section class="treino-area" data-sessao="<?= $id ?>">
    <h1><?= $esc($treino['nome'] ?? 'Treino') ?></h1>
    <p>Início: <?= $esc($dataHora($treino['inicio'])) ?><?php if ($treino['fim']): ?> · Fim: <?= $esc($dataHora($treino['fim'])) ?><?php endif ?></p>
    <?php if ($ativo): ?>
        <div class="treino-destaque">
            Tempo de treino <strong data-inicio="<?= (int)$treino['inicio'] ?>"><?= $duracao(time() - (int)$treino['inicio']) ?></strong>
        </div>
        <details class="treino-card" open>
            <summary>Descanso <strong data-descanso="<?= (int)$treino['descanso'] ?>">00:00</strong></summary>
            <form method="post" action="/treinos/salvar" data-rest-form>
                <?php $hidden(['treino_id' => $id, 'acao' => 'descanso']); ?>
                <div class="treino-acoes">
                    <?php foreach ([30, 60, 90, 120, 180] as $tempo): ?><button name="segundos" value="<?= $tempo ?>"><?= $tempo ?> s</button><?php endforeach ?>
                    <button name="segundos" value="0" data-rest-end>Encerrar</button>
                </div>
            </form>
            <form method="post" action="/treinos/salvar" data-rest-form>
                <?php $hidden(['treino_id' => $id, 'acao' => 'descanso']); ?>
                <div class="treino-acoes">
                    <?php $num('segundos', 'Personalizado (s)', null, 1, 86400); ?><button data-rest-custom>Iniciar / reiniciar</button>
                    <button type="button" data-rest-pause hidden>Pausar</button>
                </div>
            </form>
            <p data-rest-status role="status"></p>
        </details>
        <p><a class="treino-link" href="/treinos/exercicios?treino=<?= $id ?>">Adicionar exercício</a></p>
    <?php else: ?>
        <p><?= $finalizado ? 'Treino concluído' : 'Treino descartado' ?> · Duração: <?= $duracao($treino['duracao']) ?></p>
    <?php endif ?>
    <?php if ($volume !== null && $volume !== false): ?>
        <p>Volume de trabalho com carga externa: <?= number_format((float)$volume, 2, ',', '.') ?> kg × rep.</p>
    <?php endif ?>

    <?php if ($recordesSessao): ?>
        <details class="treino-card">
            <summary>Recordes na data da sessão (<?= count($recordesSessao) ?>)</summary>
            <ul><?php foreach ($recordesSessao as $r): ?>
                    <li><?= $esc($r['nome']) ?> · <?= $esc($r['valor']) ?> <?= ['carga' => 'kg', 'repeticoes' => 'rep.', 'duracao' => 's', 'distancia' => 'm', 'volume' => 'kg × rep.'][$r['metrica']] ?>
                        <?= $r['anterior'] === null ? ' · primeira marca' : ' · anterior: ' . $esc($r['anterior']) ?></li>
                <?php endforeach ?>
            </ul>
        </details>
    <?php endif ?>

    <?php foreach ($itens as $x): $ids = ['treino_id' => $id, 'item_id' => $x['id']]; ?>
        <article class="treino-card" id="exercicio-<?= (int)$x['id'] ?>">
            <h2><?= $esc($x['nome']) ?><?= $x['grupo'] ? ' · Superset ' . (int)$x['grupo'] : '' ?></h2>
            <?php if ($x['observacao']): ?><p class="treino-nota"><?= $esc($x['observacao']) ?></p><?php endif ?>
            <?php if ($ativo): ?>
                <details>
                    <summary>Ajustar descanso e observações</summary>
                    <form method="post" action="/treinos/salvar">
                        <?php $hidden($ids + ['acao' => 'item_notas']);
                        $num('descanso_segundos', 'Descanso (s)', $x['descanso_segundos'], 0, 86400);
                        $texto('observacao', 'Observações', $x['observacao']); ?>
                        <button>Salvar exercício</button>
                    </form>
                </details>
                <?php if ($ultimas = ($anterior[$x['exercicio_id']] ?? [])): ?>
                    <details>
                        <summary>Última execução</summary>
                        <ol>
                            <?php foreach ($ultimas as $prev): ?><li><?= $resumo($prev, $x) ?> <?= $esc($prev['lado']) ?></li><?php endforeach ?>
                        </ol>
                        <div class="treino-acoes"><a href="/treinos/estatisticas?exercicio=<?= (int)$x['exercicio_id'] ?>#evolucao">Ver evolução</a><a href="/treinos/historico?exercicio=<?= $esc(rawurlencode($x['nome'])) ?>">Ver sessões anteriores</a></div>
                    </details>
            <?php endif;
            endif ?>

            <?php foreach ($ativo ? [...($series[$x['id']] ?? []), []] : ($series[$x['id']] ?? []) as $s):
                require __DIR__ . '/treinos/serie.php';
            endforeach ?>
        </article>
    <?php endforeach ?>

    <?php if ($editavel): ?>
        <form method="post" action="/treinos/salvar" class="treino-card">
            <?php $hidden(['treino_id' => $id]);
            $texto('observacao', 'Observações do treino', $treino['observacao']); ?>
            <div class="treino-acoes">
                <button name="acao" value="notas">Salvar observações</button>
                <?php if ($ativo): ?>
                    <button name="acao" value="finalizar" data-confirm="Finalizar o treino? Séries pendentes não entram nas estatísticas.">Finalizar treino</button>
                <?php endif ?>
            </div>
        </form>
        <form method="post" action="/treinos/salvar"><?php $hidden(['treino_id' => $id]); ?>
            <button name="acao" value="<?= $ativo ? 'cancelar' : 'excluir' ?>" data-confirm="<?= $ativo ? 'Descartar o treino em andamento?' : 'Excluir este treino do histórico e das estatísticas?' ?>"><?= $ativo ? 'Descartar treino' : 'Excluir do histórico' ?></button>
        </form>
    <?php endif ?>
</section>