<?php

/**
 * @var array $exercicio
 * @var array $midias
 * @var array $musculos
 * @var array $rotinas
 */
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
    <dt>Modalidade</dt>
    <dd><?= $esc($exercicio['modalidade']) ?></dd>
    <dt>Registro</dt>
    <dd><?= $esc($exercicio['registro']) ?></dd>
</dl>
<?php if ($exercicio['criterio_carga']): ?>
    <p><?= $esc($exercicio['criterio_carga']) ?></p><?php endif; ?>
<?php foreach ($midias as $m):
        $url = $m['localizacao'];
        if (!preg_match('~^(?:https://[^/]|/(?!/))[^\x00-\x20\\\\]*$~D', $url)) {
            continue;
        } ?>
    <img src="<?= $esc($url) ?>" alt="<?= $esc($m['descricao_acessivel']) ?>" loading="lazy" decoding="async" style="max-width:100%;height:auto">
<?php endforeach ?>
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