<?php

/**
 * @var int $r
 * @var int $t
 * @var int $item
 * @var array $f
 * @var array $catalogo
 * @var array $opcoes
 * @var Closure $esc
 * @var Closure $select
 * @var Closure $hidden
 */
require __DIR__ . '/treinos/comum.php';
$destino = $r ? ['rotina' => $r, 'item' => $item] : ['treino' => $t];
$multiplos = $r && !$item;
?>
<section class="treino-area">
    <h1><?= $item ? 'Substituir exercício' : 'Selecionar exercícios' ?></h1>
    <p><a href="<?= $r ? '/rotinas?id=' . $r : '/treinos/ver?id=' . $t ?>">Voltar ao treino ou à rotina</a></p>
    <form method="get" action="/treinos/exercicios" class="treino-campos">
        <?php foreach ($destino as $k => $v): ?><input type="hidden" name="<?= $esc($k) ?>" value="<?= (int)$v ?>"><?php endforeach ?>
        <label>Nome ou nome alternativo<input name="q" value="<?= $esc($f['q']) ?>" maxlength="160"></label>
        <?php foreach (['grupo' => 'Grupo muscular', 'musculo' => 'Músculo', 'equipamento' => 'Equipamento', 'ambiente' => 'Ambiente', 'modalidade' => 'Modalidade'] as $k => $label) {
            $select($k, $label, ['' => 'Todos'] + array_column($opcoes[$k], 'nome', 'id'), $f[$k]);
        } ?>
        <button>Buscar</button>
    </form>
    <p><?= (int)$catalogo['total'] ?> resultados</p>
    <?php if ($catalogo['itens']): ?>
        <form method="post" action="<?= $r ? '/rotinas/salvar' : '/treinos/salvar' ?>">
            <?php $hidden($r ? ['rotina_id' => $r, 'item_id' => $item, 'acao' => $item ? 'item_substituir' : 'adicionar'] : ['treino_id' => $t, 'acao' => 'exercicio']); ?>
            <div class="catalogo">
                <?php foreach ($catalogo['itens'] as $ex): ?>
                    <article>
                        <label class="treino-opcao"><input type="<?= $multiplos ? 'checkbox' : 'radio' ?>" name="<?= $multiplos ? 'exercicios[]' : 'exercicio_id' ?>" value="<?= (int)$ex['id'] ?>" <?= $multiplos ? '' : 'required' ?>> <?= $esc($ex['nome']) ?></label>
                        <p><?= $esc($ex['grupo']) ?> · <?= $esc($ex['equipamento']) ?></p>
                        <a href="/exercicios/ver?id=<?= (int)$ex['id'] ?>" target="_blank" rel="noopener">Ver detalhes</a>
                    </article>
                <?php endforeach ?>
            </div>
            <button><?= $item ? 'Confirmar substituição' : 'Adicionar seleção' ?></button>
        </form>
    <?php endif ?>
    <nav class="treino-acoes" aria-label="Páginas do catálogo">
        <?php foreach ([-1 => 'Anterior', 1 => 'Próxima'] as $inc => $label):
            $pag = $catalogo['pagina'] + $inc;
            if ($pag >= 1 && $pag <= $catalogo['paginas']): ?>
                <a href="/treinos/exercicios?<?= $esc(http_build_query($destino + ['pagina' => $pag] + $f)) ?>"><?= $label ?></a>
        <?php endif;
        endforeach ?>
    </nav>
</section>