<?php
// O controller usa este editor tanto para rotinas pessoais quanto para modelos. O destino dos formulários acompanha o modo autorizado.

/**
 * @var array|null $rotina
 * @var array $rotinas
 * @var array|null $ativo
 * @var array $itens
 * @var array<int,list<array>> $series Séries agrupadas pelo ID do item na rotina.
 * @var bool $arquivadas
 * @var Closure $esc
 * @var Closure $hidden
 * @var Closure $texto
 * @var Closure $select
 * @var Closure $num
 * @var array $dias
 * @var bool $modelo
 * @var string $base
 * @var array $alunos
 * @var array $pessoais
 */

use App\Services\RegistroTreino;

$tituloRotinas = match (true) {
    $modelo && $arquivadas => 'Modelos arquivados',
    $modelo => 'Modelos de treino',
    $arquivadas => 'Rotinas arquivadas',
    default => 'Minhas rotinas',
};
?>

<section class="treino-area editor-rotinas" aria-labelledby="titulo-rotinas">
    <h1 id="titulo-rotinas"><?= $tituloRotinas ?></h1>

    <?php require __DIR__ . '/treinos/comum.php'; ?>

    <div class="rotinas-acoes">
        <?php if ($modelo): ?>
            <a href="/profissional/propostas?pendentes=1" class="treino-link rotinas-acao-principal">
                Propostas pendentes
            </a>
        <?php elseif ($ativo): ?>
            <a href="/treinos/ver?id=<?= (int) $ativo['id'] ?>" class="treino-link rotinas-acao-principal">
                Retomar: <?= $esc($ativo['nome']) ?>
            </a>
        <?php else: ?>
            <form action="/treinos/iniciar" method="post">
                <?php $hidden([]); ?>
                <button type="submit" class="rotinas-acao-principal">Iniciar treino livre</button>
            </form>
        <?php endif; ?>

        <a class="treino-link" href="<?= $esc($base . ($arquivadas ? '' : '?arquivadas=1')) ?>">
            <?= $arquivadas ? 'Ver lista ativa' : 'Ver lista arquivada' ?>
        </a>
    </div>

    <?php if (!$arquivadas): ?>
        <details class="treino-card rotinas-criacao"<?= !$rotinas && !$rotina ? ' open' : '' ?>>
            <summary><?= $modelo ? 'Criar modelo' : 'Criar rotina' ?></summary>
            <form method="post" action="<?= $esc($modelo ? $base . '/salvar' : $base) ?>">
                <?php $hidden(['acao' => 'criar']); ?>
                <label>Nome<input name="nome" minlength="2" maxlength="150" required></label>
                <label>Objetivo<input name="objetivo" maxlength="80"></label>
                <?php
                $texto('descricao', 'Descrição', null);
                $select('dia_semana', 'Dia da semana', $dias, null);
                ?>
                <button type="submit" class="rotinas-acao-principal">
                    <?= $modelo ? 'Criar modelo' : 'Criar rotina' ?>
                </button>
            </form>
        </details>
    <?php endif; ?>
    <?php if ($pessoais): ?>
        <details class="treino-card">
            <summary>Criar modelo a partir de uma rotina minha</summary>
            <form method="post" action="/profissional/modelos/salvar">
                <?php $hidden(['acao' => 'copiar_pessoal']); ?>
                <label>
                    Rotina de origem
                    <select name="rotina_id" required>
                        <option value="">Selecione uma rotina</option>
                        <?php foreach ($pessoais as $pessoal): ?>
                            <option value="<?= (int) $pessoal['id'] ?>"><?= $esc($pessoal['nome']) ?></option>
                        <?php endforeach; ?>
                    </select>
                </label>
                <button type="submit">Copiar como modelo</button>
            </form>
        </details>
    <?php endif; ?>

    <?php if (!$rotinas): ?>
        <p class="treino-card rotinas-vazio">
            <?= $modelo ? 'Nenhum modelo nesta lista.' : 'Nenhuma rotina nesta lista.' ?>
        </p>
    <?php endif; ?>

    <div class="catalogo">
        <?php foreach ($rotinas as $r): ?>
            <article>
                <h2><a href="<?= $base ?>?id=<?= (int)$r['id'] ?><?= $arquivadas ? '&amp;arquivadas=1' : '' ?>#rotina-selecionada"><?= $esc($r['nome']) ?></a></h2>
                <p><?= $esc($dias[$r['dia_semana'] ?? '']) ?></p>
                <?php if (!$modelo && $r['ativa'] && !$ativo): ?>
                    <form method="post" action="/treinos/iniciar"><?php $hidden(['rotina_id' => $r['id']]); ?><button>Iniciar treino</button></form>
                <?php endif ?>
            </article>
        <?php endforeach ?>
    </div>

    <?php if ($rotina): ?>
        <h2 id="rotina-selecionada"><?= $esc($rotina['nome']) ?></h2>
        <?php if ($modelo && $rotina['ativa']): ?>
            <?php // O aluno só recebe a rotina depois de revisar a proposta e aceitar. ?>
            <h3>Propor a um aluno</h3>
            <?php if (!$alunos): ?><p>Nenhum aluno com vínculo ativo.</p>
            <?php elseif (!$itens): ?><p>Adicione um exercício para enviar este modelo.</p>
            <?php else: ?>
                <form method="post" action="/profissional/propostas/enviar" class="treino-acoes">
                    <?php $hidden(['rotina_id' => $rotina['id'], 'chave' => bin2hex(random_bytes(16))]); ?>
                    <label>Aluno<select name="aluno_id" required>
                        <option value="">Selecione um aluno</option>
                        <?php foreach ($alunos as $aluno): ?>
                            <option value="<?= (int)$aluno['aluno_id'] ?>"><?= $esc($aluno['aluno_nome']) ?> (<?= $esc($aluno['aluno_email']) ?>)</option>
                        <?php endforeach ?>
                    </select></label>
                    <button>Enviar proposta</button>
                </form>
            <?php endif ?>
        <?php endif ?>
        <form method="post" action="<?= $base ?>/salvar" class="treino-acoes">
            <?php $hidden(['rotina_id' => $rotina['id']]); ?>
            <button name="acao" value="duplicar">Duplicar</button>
            <button name="acao" value="<?= $rotina['ativa'] ? 'arquivar' : 'restaurar' ?>"><?= $rotina['ativa'] ? 'Arquivar' : 'Restaurar' ?></button>
        </form>
        <?php if ($rotina['ativa']): ?>
            <details class="treino-card">
                <summary>Editar nome, objetivo, dia e descrição</summary>
                <form method="post" action="<?= $base ?>/salvar">
                    <?php $hidden(['rotina_id' => $rotina['id'], 'acao' => 'editar']); ?>
                    <label>Nome<input name="nome" value="<?= $esc($rotina['nome']) ?>" minlength="2" maxlength="150" required></label>
                    <label>Objetivo<input name="objetivo" maxlength="80" value="<?= $esc($rotina['objetivo']) ?>"></label>
                    <?php $texto('descricao', 'Descrição', $rotina['descricao']);
            $select('dia_semana', 'Dia da semana', $dias, $rotina['dia_semana']); ?>
                    <button>Salvar rotina</button>
                </form>
            </details>
            <p><a class="treino-link" href="/treinos/exercicios?rotina=<?= (int)$rotina['id'] ?>">Adicionar exercícios</a></p>
        <?php else: ?><p><?= $esc($rotina['descricao']) ?></p><?php endif ?>
        <?php foreach ($itens as $x): $ids = ['rotina_id' => $rotina['id'], 'item_id' => $x['id']]; ?>
            <article class="treino-card">
                <h3><?= $esc($x['nome']) ?><?= $x['grupo'] ? ' · Superset ' . (int)$x['grupo'] : '' ?></h3>
                <?php if (!$rotina['ativa']): ?>
                    <p><?= count($series[$x['id']] ?? []) ?> séries · <?= $esc($x['observacao']) ?></p>
            </article><?php continue;
                endif ?>
        <div class="treino-acoes">
            <a href="/treinos/exercicios?rotina=<?= (int)$rotina['id'] ?>&amp;item=<?= (int)$x['id'] ?>">Substituir exercício</a>
            <form method="post" action="<?= $base ?>/salvar" class="treino-acoes"><?php $hidden($ids); ?>
                <button name="acao" value="item_subir" aria-label="Subir exercício">↑</button>
                <button name="acao" value="item_descer" aria-label="Descer exercício">↓</button>
                <button name="acao" value="item_remover" data-confirm="Remover o exercício e suas séries da rotina?">Remover</button>
            </form>
        </div>
        <details>
            <summary>Descanso, superset e observações</summary>
            <form method="post" action="<?= $base ?>/salvar">
                <?php $hidden($ids + ['acao' => 'item_salvar']); ?>
                <div class="treino-campos">
                    <?php $num('descanso_segundos', 'Descanso (s)', $x['descanso_segundos'], 0, 86400);
            $num('grupo', 'Número do superset', $x['grupo'], 1, 99999); ?>
                </div>
                <p>Use o mesmo número nos exercícios do grupo. Deixe em branco para retirar o exercício do grupo.</p>
                <?php $texto('observacao', 'Observações', $x['observacao']); ?>
                <button>Salvar exercício</button>
            </form>
        </details>
        <?php // A última posição vazia abre os campos para adicionar uma série ao exercício. ?>
        <?php foreach ([...($series[$x['id']] ?? []), []] as $s): ?>
            <details class="treino-serie">
                <summary><?= $s ? 'Série ' . (int)$s['numero'] . ' · ' . $esc(RegistroTreino::TIPOS[$s['tipo'] ?? ''] ?? 'Normal') : 'Adicionar série' ?>
                    <?php if ($s && $s['repeticoes_min'] !== null): ?> · <?= $esc($s['repeticoes_min']) ?><?= $s['repeticoes_max'] !== null && $s['repeticoes_max'] !== $s['repeticoes_min'] ? '–' . $esc($s['repeticoes_max']) : '' ?> rep.<?php endif ?>
                        <?php if (isset($s['carga_alvo'])): ?> · <?= $esc($s['carga_alvo']) ?> kg<?php endif ?>
                </summary>
                <form method="post" action="<?= $base ?>/salvar">
                    <?php $hidden($ids + ($s ? ['serie_id' => $s['id']] : [])); ?>
                    <div class="treino-campos">
                        <?php $select('tipo', 'Tipo', RegistroTreino::TIPOS, $s['tipo'] ?? 'normal');
            foreach (RegistroTreino::METAS as $k => [$flag, $label, $min, $max, $dec]) {
                if (!empty($x[$flag])) {
                    $num($k, $label, $s[$k] ?? null, $min, $max, $dec);
                }
            }
            $num('rir_alvo', 'RIR alvo', $s['rir_alvo'] ?? null, 0, 20); ?>
                    </div>
                    <div class="treino-acoes">
                        <button name="acao" value="<?= $s ? 'serie_salvar' : 'serie_adicionar' ?>"><?= $s ? 'Salvar série' : 'Adicionar série' ?></button>
                        <?php if ($s): ?><button name="acao" value="serie_duplicar">Duplicar</button>
                            <button name="acao" value="serie_subir" aria-label="Subir série">↑</button>
                            <button name="acao" value="serie_descer" aria-label="Descer série">↓</button>
                            <button name="acao" value="serie_remover" data-confirm="Remover esta série planejada?">Remover</button><?php endif ?>
                    </div>
                </form>
            </details>
        <?php endforeach ?>
        </article>
    <?php endforeach ?>
<?php endif ?>
</section>
