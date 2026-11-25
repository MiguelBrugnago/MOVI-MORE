<?php
$esc = static fn ($v) => htmlspecialchars((string)$v, ENT_QUOTES, 'UTF-8');
?>
<h1>Meu perfil profissional</h1>
<p><?= $esc($perfil['tipo']) ?> · Registro <?= $esc($perfil['registro_profissional'] ?? 'não informado') ?></p>
<?php if ($erro): ?><p role="alert"><?= $esc($erro) ?></p><?php endif; ?>
<form method="post">
    <input type="hidden" name="csrf_token" value="<?= $esc(\App\Security\Csrf::gerarToken()) ?>">
    <label>Especialidade<input name="especialidade" maxlength="120" value="<?= $esc($perfil['especialidade']) ?>"></label>
    <label>Descrição<textarea name="descricao"><?= $esc($perfil['descricao']) ?></textarea></label>
    <button>Salvar perfil profissional</button>
</form>
<p><a href="/painel?modo=profissional">Voltar ao painel profissional</a></p>
