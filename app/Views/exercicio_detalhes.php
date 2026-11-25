<?php
// Mídias passam pela validação de URL antes de renderizar. Os músculos vêm das relações do catálogo para este exercício.

/**
 * @var array $exercicio
 * @var array $midias
 * @var array $musculos
 * @var array $rotinas
 */
/** Escapa o valor no momento de inseri-lo em texto ou em um atributo HTML. */
$esc = static fn ($v) => htmlspecialchars((string) $v, ENT_QUOTES, 'UTF-8'); ?>
<a href="/exercicios">Voltar à biblioteca</a>
<h1><?= $esc($exercicio['nome']) ?></h1>
<p><?= $esc($exercicio['descricao']) ?></p>
<p><?= $esc($exercicio['instrucoes']) ?></p>
<dl>
    <dt>Grupo principal</dt>
    <dd><?= $esc($exercicio['grupo']) ?></dd>
    <dt>Equipamento</dt>
    <dd><?= $esc($exercicio['equipamento']) ?></dd>
    <?php if ($acessorios): ?><dt>Equipamentos adicionais</dt>
        <?php foreach ($acessorios as $a): ?><dd><?= $esc($a['nome']) ?> <?= $esc($a['observacao']) ?></dd><?php endforeach; ?>
    <?php endif; ?>
    <dt>Ambientes</dt><dd><?= $esc(implode(', ', $ambientes) ?: 'Não informado') ?></dd>
    <dt>Modalidade</dt>
    <dd><?= $esc($exercicio['modalidade']) ?></dd>
    <?php foreach (['nome_ingles' => 'Nome em inglês', 'tipo' => 'Tipo', 'categoria' => 'Categoria', 'dificuldade' => 'Dificuldade'] as $campo => $rotulo): ?>
        <?php if (!empty($exercicio[$campo])): ?><dt><?= $rotulo ?></dt><dd><?= $esc($exercicio[$campo]) ?></dd><?php endif; ?>
    <?php endforeach; ?>
    <dt>Execução unilateral</dt><dd><?= $exercicio['unilateral'] ? 'Sim' : 'Não' ?></dd>
    <dt>Registro</dt>
    <dd><?= $esc($exercicio['registro']) ?></dd>
</dl>
<?php if ($exercicio['criterio_carga']): ?>
    <p><?= $esc($exercicio['criterio_carga']) ?></p><?php endif; ?>
<?php if ($exercicio['criterio_repeticoes']): ?><p><?= $esc($exercicio['criterio_repeticoes']) ?></p><?php endif; ?>
<form method="post" action="/exercicios/favorito">
    <input type="hidden" name="csrf_token" value="<?= $esc(App\Security\Csrf::gerarToken()) ?>">
    <input type="hidden" name="id" value="<?= (int) $exercicio['id'] ?>">
    <button name="favorito" value="<?= $favorito ? '0' : '1' ?>"><?= $favorito ? 'Remover dos favoritos' : 'Adicionar aos favoritos' ?></button>
</form>
<?php $temMidia = false;
foreach ($midias as $m):
        $url = $m['localizacao'];
        // Aceita endereços HTTPS ou caminhos locais absolutos antes de inserir a mídia na página.
        if (!preg_match('~^(?:https://[^/]|/(?!/))[^\x00-\x20\\\\]*$~D', $url)) {
            continue;
        }
        $temMidia = true; ?>
    <img src="<?= $esc($url) ?>" alt="<?= $esc($m['descricao_acessivel']) ?>" loading="lazy" decoding="async" style="max-width:100%;height:auto">
<?php endforeach ?>
<?php if (!$temMidia): ?><p class="treino-card">Sem imagem ou GIF para este exercício.</p><?php endif; ?>
<h2>Músculos</h2>
<ul><?php foreach ($musculos as $m): ?>
        <li><?= $esc($m['nome']) ?> — <?= $esc($m['papel']) ?></li><?php endforeach; ?>
</ul>
<h2>Adicionar à rotina</h2>
<?php if ($rotinas): ?>
    <form method="post" action="/rotinas/adicionar">
        <input type="hidden" name="csrf_token" value="<?= $esc(App\Security\Csrf::gerarToken()) ?>"><input type="hidden"
            name="exercicio_id" value="<?= (int) $exercicio['id'] ?>">
        <label>Rotina<select name="rotina_id" required><?php foreach ($rotinas as $r): ?>
                    <option value="<?= (int) $r['id'] ?>"><?= $esc($r['nome']) ?></option><?php endforeach; ?>
            </select></label><button>Adicionar exercício</button>
    </form>
<?php else: ?>
    <p>Crie uma rotina para selecionar este exercício.</p><?php endif; ?>
<a href="/rotinas">Minhas rotinas</a>