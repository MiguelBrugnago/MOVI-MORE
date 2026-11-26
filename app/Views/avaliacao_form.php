<?php // Avaliações vinculadas a um profissional são exibidas para leitura.
/** @var array $avaliacao Valores da avaliação, da nova ficha ou do formulário reapresentado após erro. */
require __DIR__ . '/fisico_comum.php';
$editavel = empty($avaliacao['profissional_id']); ?>
<h1><?= empty($avaliacao['id']) ? 'Nova avaliação' : 'Detalhes da avaliação' ?></h1>
<p>Registre as medidas disponíveis. Ao criar uma avaliação, o histórico anterior é preservado.</p>
<form method="post" action="/perfil/avaliacoes" class="fisico-form perfil-avaliacao-form">
<input type="hidden" name="csrf_token" value="<?= $csrf ?>"><input type="hidden" name="acao" value="avaliacao">
<?php if (!empty($avaliacao['id'])): ?><input type="hidden" name="id" value="<?= $esc($avaliacao['id']) ?>"><?php endif; ?>
<fieldset <?= !$editavel ? 'disabled' : '' ?>><legend>Medidas corporais</legend>
<label>Data da avaliação<input type="date" name="avaliado_em" required min="1900-01-01" max="<?= \App\Services\PerfilFisicoService::hoje() ?>" value="<?= $esc($avaliacao['avaliado_em'] ?? '') ?>"></label>
<div class="treino-campos">
<?php foreach ($medidas as $chave => [$nome,$unidade,$min,$max]): ?>
<label><?= $esc($nome) ?> (<?= $unidade ?>)<input type="number" name="<?= $chave ?>" step="0.001" min="<?= $min ?>" max="<?= $max ?>" value="<?= $esc($avaliacao['medidas'][$chave] ?? '') ?>"></label>
<?php endforeach; ?></div>
<label>Observações (compartilhadas somente com permissão de saúde)<textarea name="observacao" maxlength="4000" rows="3"><?= $esc($avaliacao['observacao'] ?? '') ?></textarea></label>
</fieldset>
<p>Massa magra estimada: <?= $numero($avaliacao['medidas']['massa_magra'] ?? null) ?>. Calculada após salvar, quando peso e gordura forem informados na mesma avaliação. Não é uma medição clínica.</p>
<?php if ($editavel): ?><button>Salvar avaliação</button><?php else: ?><p>Avaliação profissional: disponível somente para consulta.</p><?php endif; ?>
</form>
<?php if ($editavel && !empty($avaliacao['id'])): ?>
<details class="treino-card"><summary>Excluir esta avaliação</summary>
<p>A avaliação e suas medidas serão removidas permanentemente.</p>
<form method="post" action="/perfil/avaliacoes"><input type="hidden" name="csrf_token" value="<?= $csrf ?>"><input type="hidden" name="acao" value="excluir"><input type="hidden" name="id" value="<?= $esc($avaliacao['id']) ?>">
<label class="treino-opcao"><input type="checkbox" name="confirmar" value="sim" required>Confirmo a exclusão desta avaliação</label><button>Excluir avaliação</button></form></details>
<?php endif; ?>
