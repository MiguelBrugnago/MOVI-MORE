<?php

/**
 * @var array $itens
 * @var array|null $editando
 * @var array $opcoes
 * @var Closure $esc
 * @var Closure $hidden
 * @var Closure $texto
 * @var Closure $select
 */
require __DIR__ . '/treinos/comum.php'; ?>
<section class="treino-area">
    <h1>Meus exercícios personalizados</h1>
    <p>Seus exercícios aparecem apenas no seu catálogo.</p>
    <ul><?php foreach ($itens as $x): ?>
            <li><a href="/treinos/personalizados?id=<?= (int)$x['id'] ?>"><?= $esc($x['nome']) ?></a></li>
        <?php endforeach ?>
    </ul>
    <?php if ($editando): ?><p><a href="/treinos/personalizados">Criar outro exercício</a></p><?php endif ?>
    <form action="/treinos/personalizados" method="post" class="treino-card">
        <h2><?= $editando ? 'Editar exercício' : 'Novo exercício' ?></h2>
        <?php $hidden($editando ? ['id' => $editando['id']] : []); ?>
        <label>Nome<input name="nome" value="<?= $esc($editando['nome'] ?? '') ?>" required minlength="2" maxlength="150"></label>
        <?php $texto('descricao', 'Descrição', $editando['descricao'] ?? null);
        $texto('instrucoes', 'Instruções', $editando['instrucoes'] ?? null);
        foreach (['grupo_muscular' => 'Grupo muscular', 'equipamento' => 'Equipamento', 'tipo_registro' => 'Métricas registradas'] as $k => $label) {
            if ($k === 'tipo_registro' && $editando) {
                echo '<p>Métricas: ' . $esc($opcoes[$k][$editando[$k . '_id']] ?? '—') . '</p>';
            } else $select($k . '_id', $label, ['' => 'Selecione'] + $opcoes[$k], $editando[$k . '_id'] ?? null);
        } ?>
        <button>Salvar exercício</button>
    </form>
</section>