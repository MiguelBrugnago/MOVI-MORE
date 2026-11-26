<?php

$escapar = static fn (mixed $valor): string => htmlspecialchars((string) $valor, ENT_QUOTES, 'UTF-8');

$camposOpcionais = [
    'nome_ingles' => 'Nome em inglês',
    'tipo' => 'Tipo',
    'categoria' => 'Categoria',
    'dificuldade' => 'Dificuldade',
];
?>

<section class="exercicio-detalhes" aria-labelledby="titulo-exercicio">
    <a href="/exercicios">Voltar à biblioteca</a>
    <h1 id="titulo-exercicio"><?= $escapar($exercicio['nome']) ?></h1>

    <?php if (!empty($exercicio['descricao'])): ?>
        <p><?= $escapar($exercicio['descricao']) ?></p>
    <?php endif; ?>

    <?php if (!empty($exercicio['instrucoes'])): ?>
        <h2>Como executar</h2>
        <p><?= $escapar($exercicio['instrucoes']) ?></p>
    <?php endif; ?>

    <dl class="exercicio-ficha">
        <dt>Grupo principal</dt>
        <dd><?= $escapar($exercicio['grupo']) ?></dd>

        <dt>Equipamento</dt>
        <dd><?= $escapar($exercicio['equipamento']) ?></dd>

        <?php if ($acessorios): ?>
            <dt>Equipamentos adicionais</dt>
            <?php foreach ($acessorios as $acessorio): ?>
                <dd><?= $escapar($acessorio['nome']) ?> <?= $escapar($acessorio['observacao']) ?></dd>
            <?php endforeach; ?>
        <?php endif; ?>

        <dt>Ambientes</dt>
        <dd><?= $escapar(implode(', ', $ambientes) ?: 'Não informado') ?></dd>

        <dt>Modalidade</dt>
        <dd><?= $escapar($exercicio['modalidade']) ?></dd>

        <?php foreach ($camposOpcionais as $campoExercicio => $rotuloCampo): ?>
            <?php if (!empty($exercicio[$campoExercicio])): ?>
                <dt><?= $escapar($rotuloCampo) ?></dt>
                <dd><?= $escapar($exercicio[$campoExercicio]) ?></dd>
            <?php endif; ?>
        <?php endforeach; ?>

        <dt>Execução unilateral</dt>
        <dd><?= $exercicio['unilateral'] ? 'Sim' : 'Não' ?></dd>

        <dt>Registro</dt>
        <dd><?= $escapar($exercicio['registro']) ?></dd>
    </dl>

    <?php if ($exercicio['criterio_carga']): ?>
        <p><?= $escapar($exercicio['criterio_carga']) ?></p>
    <?php endif; ?>

    <?php if ($exercicio['criterio_repeticoes']): ?>
        <p><?= $escapar($exercicio['criterio_repeticoes']) ?></p>
    <?php endif; ?>

    <form method="post" action="/exercicios/favorito">
        <input type="hidden" name="csrf_token" value="<?= $escapar(App\Security\Csrf::gerarToken()) ?>">
        <input type="hidden" name="id" value="<?= (int) $exercicio['id'] ?>">
        <button type="submit" name="favorito" value="<?= $favorito ? '0' : '1' ?>">
            <?= $favorito ? 'Remover dos favoritos' : 'Adicionar aos favoritos' ?>
        </button>
    </form>

    <?php $temMidia = false; ?>
    <?php foreach ($midias as $midia): ?>
        <?php
        $enderecoMidia = $midia['localizacao'];

        // A mídia deve usar HTTPS ou um caminho local absoluto.
        if (!preg_match('~^(?:https://[^/]|/(?!/))[^\x00-\x20\\\\]*$~D', $enderecoMidia)) {
            continue;
        }

        $temMidia = true;
        ?>
        <img
            class="exercicio-midia"
            src="<?= $escapar($enderecoMidia) ?>"
            alt="<?= $escapar($midia['descricao_acessivel']) ?>"
            loading="lazy"
            decoding="async"
        >
    <?php endforeach; ?>

    <?php if (!$temMidia): ?>
        <p>Sem imagem ou GIF para este exercício.</p>
    <?php endif; ?>

    <h2>Músculos</h2>
    <ul>
        <?php foreach ($musculos as $musculo): ?>
            <li><?= $escapar($musculo['nome']) ?> — <?= $escapar($musculo['papel']) ?></li>
        <?php endforeach; ?>
    </ul>

    <h2>Adicionar à rotina</h2>
    <?php if ($rotinas): ?>
        <form method="post" action="/rotinas/adicionar">
            <input type="hidden" name="csrf_token" value="<?= $escapar(App\Security\Csrf::gerarToken()) ?>">
            <input type="hidden" name="exercicio_id" value="<?= (int) $exercicio['id'] ?>">
            <label>
                Rotina
                <select name="rotina_id" required>
                    <?php foreach ($rotinas as $rotina): ?>
                        <option value="<?= (int) $rotina['id'] ?>"><?= $escapar($rotina['nome']) ?></option>
                    <?php endforeach; ?>
                </select>
            </label>
            <button type="submit">Adicionar exercício</button>
        </form>
    <?php else: ?>
        <p>Crie uma rotina para selecionar este exercício.</p>
    <?php endif; ?>

    <a href="/rotinas">Minhas rotinas</a>
</section>
