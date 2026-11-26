<?php
// Os filtros e a paginação carregam o destino do formulário para manter a seleção na mesma rotina ou sessão.

/**
 * @var bool $modelo Determina o catálogo e o editor de retorno.
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
$baseRotina = $modelo ? '/profissional/modelos' : '/rotinas';
// Só a inclusão na rotina aceita vários exercícios de uma vez.
$multiplos = $r && !$item;
$categorias = ['grupo' => 'Grupo muscular', 'musculo' => 'Músculo', 'equipamento' => 'Equipamento', 'ambiente' => 'Ambiente', 'modalidade' => 'Modalidade'];
$filtrosAtivos = array_filter(array_intersect_key($f, $categorias));
?>
<section class="treino-area seletor-exercicios">
    <h1><?= $item ? 'Substituir exercício' : 'Selecionar exercícios' ?></h1>
    <p><a href="<?= $r ? $baseRotina . '?id=' . $r . '#rotina-selecionada' : '/treinos/ver?id=' . $t ?>"><?= $r ? 'Voltar ao planejamento' : 'Voltar ao treino' ?></a></p>
    <form method="get" action="/treinos/exercicios" class="treino-campos">
        <?php foreach ($destino as $k => $v): ?><input type="hidden" name="<?= $esc($k) ?>" value="<?= (int)$v ?>"><?php endforeach ?>
        <label>Buscar por nome ou nome alternativo<input type="search" name="q" value="<?= $esc($f['q']) ?>" maxlength="160"></label>
        <details class="catalogo-filtros"<?= $filtrosAtivos ? ' open' : '' ?>>
            <summary>Filtros</summary>
            <div class="treino-campos">
                <?php foreach ($categorias as $k => $label) {
                    $select($k, $label, ['' => 'Todos'] + array_column($opcoes[$k], 'nome', 'id'), $f[$k]);
                } ?>
            </div>
        </details>
        <div class="treino-acoes">
            <button>Buscar</button>
            <?php if ($filtrosAtivos || $f['q'] !== ''): ?>
                <a href="/treinos/exercicios?<?= $esc(http_build_query($destino)) ?>">Limpar filtros</a>
            <?php endif ?>
        </div>
    </form>
    <p><?= $catalogo['total'] ? (int) $catalogo['total'] . ($catalogo['total'] === 1 ? ' exercício encontrado' : ' exercícios encontrados') : 'Nenhum exercício encontrado.' ?></p>
    <?php if ($catalogo['itens']): ?>
        <form method="post" action="<?= $r ? $baseRotina . '/salvar' : '/treinos/salvar' ?>">
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
