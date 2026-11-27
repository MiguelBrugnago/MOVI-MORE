<?php
// O estado da sessão controla os botões de execução e edição. Séries e resultados anteriores são agrupados por exercício.

/**
 * @var array $treino
 * @var array $itens
 * @var array<int,list<array>> $series Séries executadas ou pendentes por ID do item.
 * @var array $anterior
 * @var string|int|float|false|null $volume
 * @var array $recordesSessao
 * @var Closure $esc
 * @var Closure $hidden
 * @var Closure $texto
 * @var Closure $num
 * @var Closure $duracao
 * @var Closure $dataHora
 * @var Closure $resumo
 */


$id = (int)$treino['id'];
$ativo = $treino['status'] === 'em_andamento';
$finalizado = $treino['status'] === 'concluido';
$editavel = $ativo || $finalizado;
$navegacaoCompacta = $ativo;
require __DIR__ . '/treinos/comum.php';
require __DIR__ . '/treinos/resumo_serie.php';
$primeiraSerieAberta = false;
?>
<section class="treino-area sessao-treino" data-sessao="<?= $id ?>">
    <h1><?= $esc($treino['nome'] ?? 'Treino') ?></h1>
    <p class="sessao-periodo">Início: <?= $esc($dataHora($treino['inicio'])) ?><?php if ($treino['fim']): ?> · Fim: <?= $esc($dataHora($treino['fim'])) ?><?php endif ?></p>
    <?php if ($ativo): ?>
        <div class="sessao-tempo">
            <div>Tempo de treino <strong data-inicio="<?= (int)$treino['inicio'] ?>"><?= $duracao(time() - (int)$treino['inicio']) ?></strong></div>
            <a class="treino-link" href="#finalizar-treino">Ir para a finalização</a>
        </div>
        <details class="treino-card sessao-descanso">
            <summary>Descanso <strong data-descanso="<?= (int)$treino['descanso'] ?>">00:00</strong></summary>
            <form method="post" action="/treinos/salvar" data-rest-form>
                <?php $hidden(['treino_id' => $id, 'acao' => 'descanso']); ?>
                <div class="treino-acoes">
                    <?php foreach ([30, 60, 90, 120, 180] as $tempo): ?><button name="segundos" value="<?= $tempo ?>" class="botao-secundario"><?= $tempo ?> s</button><?php endforeach ?>
                    <button name="segundos" value="0" class="botao-secundario" data-rest-end>Encerrar</button>
                </div>
            </form>
            <form method="post" action="/treinos/salvar" data-rest-form>
                <?php $hidden(['treino_id' => $id, 'acao' => 'descanso']); ?>
                <div class="treino-acoes">
                    <?php $num('segundos', 'Personalizado (s)', null, 1, 86400); ?><button data-rest-custom>Iniciar / reiniciar</button>
                    <button type="button" class="botao-secundario" data-rest-pause hidden>Pausar</button>
                </div>
            </form>
        </details>
        <p data-rest-status role="status"></p>
        <?php if (!$itens): ?><p>Adicione o primeiro exercício para registrar suas séries.</p><?php endif ?>
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
            <?php if ($x['descanso_segundos'] !== null): ?><p class="sessao-descanso-exercicio">Descanso entre séries · <?= (int) $x['descanso_segundos'] ?> s</p><?php endif ?>
            <?php if ($x['observacao']): ?><p class="treino-nota"><?= $esc($x['observacao']) ?></p><?php endif ?>
            <?php
            $seriesDoItem = $series[$x['id']] ?? [];
            $proximoNumero = 1 + max([0, ...array_column($seriesDoItem, 'numero')]);
            $anterioresPorNumero = array_column($anterior[$x['exercicio_id']] ?? [], null, 'numero');
            foreach ($ativo ? [...$seriesDoItem, []] : $seriesDoItem as $s):
                $abrirSerie = $ativo && !$primeiraSerieAberta && ($s ? !$s['concluida'] && !$s['ignorada'] : empty($series[$x['id']]));
                $primeiraSerieAberta = $primeiraSerieAberta || $abrirSerie;
                require __DIR__ . '/treinos/serie.php';
            endforeach ?>

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
        </article>
    <?php endforeach ?>

    <?php if ($editavel): ?>
        <form method="post" action="/treinos/salvar" class="treino-card">
            <?php $hidden(['treino_id' => $id]);
        $texto('observacao', 'Observações do treino', $treino['observacao']); ?>
            <div class="treino-acoes">
                <button name="acao" value="notas" class="botao-secundario">Salvar observações</button>
                <?php if ($ativo): ?>
                    <button id="finalizar-treino" name="acao" value="finalizar" class="botao-principal" data-confirm="Finalizar o treino? Séries pendentes não entram nas estatísticas.">Finalizar treino</button>
                <?php endif ?>
            </div>
        </form>
        <form method="post" action="/treinos/salvar"><?php $hidden(['treino_id' => $id]); ?>
            <button name="acao" value="<?= $ativo ? 'cancelar' : 'excluir' ?>" data-confirm="<?= $ativo ? 'Descartar o treino em andamento?' : 'Excluir este treino do histórico e das estatísticas?' ?>"><?= $ativo ? 'Descartar treino' : 'Excluir do histórico' ?></button>
        </form>
    <?php endif ?>
</section>
