<?php require __DIR__ . '/fisico_comum.php'; ?>
<h1>Meu perfil físico</h1>
<p>Seu ponto de partida para acompanhar a evolução. Os campos são opcionais.</p>
<section class="catalogo" aria-label="Última avaliação">
<?php foreach (['peso','gordura','massa_magra'] as $chave): ?>
<article><h2><?= $esc($metricas[$chave][0]) ?></h2><strong><?= $numero($recente['medidas'][$chave] ?? null) ?> <?= isset($recente['medidas'][$chave]) ? $esc($metricas[$chave][1]) : '' ?></strong>
<p><?= $recente ? 'Avaliação de ' . $esc($recente['avaliado_em']) : 'Nenhuma avaliação registrada.' ?></p></article>
<?php endforeach; ?>
</section>
<p><a class="treino-link" href="/perfil/avaliacoes/nova">Registrar peso e medidas</a> · Estimativas calculadas não são medições clínicas.</p>
<form method="post" action="/perfil" class="fisico-form">
<input type="hidden" name="csrf_token" value="<?= $csrf ?>"><input type="hidden" name="acao" value="perfil">
<fieldset><legend>Dados pessoais e físicos</legend><div class="treino-campos">
<label>Data de nascimento<input type="date" name="data_nascimento" min="1900-01-01" max="<?= \App\Services\PerfilFisicoService::hoje() ?>" value="<?= $esc($perfil['data_nascimento'] ?? '') ?>"></label>
<label>Gênero (opcional)<input name="genero" maxlength="40" value="<?= $esc($perfil['genero'] ?? '') ?>"></label>
<label>Altura (cm)<input type="number" name="altura_cm" min="30" max="280" step="0.01" value="<?= $esc($perfil['altura_cm'] ?? '') ?>"></label>
</div></fieldset>
<fieldset><legend>Treinamento</legend><div class="treino-campos">
<?php foreach (['objetivo'=>['Objetivo principal',\App\Services\PerfilFisicoService::OBJETIVOS], 'experiencia'=>['Experiência',\App\Services\PerfilFisicoService::EXPERIENCIAS]] as $chave=>[$rotulo,$opcoes]): ?>
<label><?= $rotulo ?><select name="<?= $chave ?>"><option value="">Não informado</option><?php foreach ($opcoes as $opcao): ?><option <?= ($perfil[$chave] ?? '') === $opcao ? 'selected' : '' ?>><?= $esc($opcao) ?></option><?php endforeach; ?></select></label>
<?php endforeach; ?>
<label>Tempo de treinamento (meses)<input type="number" name="tempo_treinamento_meses" min="0" max="1200" value="<?= $esc($perfil['tempo_treinamento_meses'] ?? '') ?>"></label>
<label>Frequência pretendida (dias/semana)<input type="number" name="frequencia_semanal" min="0" max="7" value="<?= $esc($perfil['frequencia_semanal'] ?? '') ?>"></label>
<label>Disponibilidade<input name="disponibilidade" maxlength="255" placeholder="Ex.: segundas e quartas à noite" value="<?= $esc($perfil['disponibilidade'] ?? '') ?>"></label>
<label>Ambiente preferido<input name="ambiente_preferido" maxlength="80" placeholder="Ex.: academia, casa ou ar livre" value="<?= $esc($perfil['ambiente_preferido'] ?? '') ?>"></label>
</div></fieldset>
<label>Observações pessoais (compartilhadas somente com permissão de saúde)<textarea name="biografia" maxlength="4000" rows="3"><?= $esc($perfil['biografia'] ?? '') ?></textarea></label>
<button>Salvar perfil</button>
</form>
<h2>Condições, lesões e restrições</h2>
<p>Informe voluntariamente apenas o que considera relevante para treinar. Você controla o acesso em Compartilhamento.</p>
<?php foreach (['condicao'=>'condicoes','restricao'=>'restricoes'] as $tipo=>$grupo): ?>
<article><h3><?= $tipo === 'condicao' ? 'Condições e lesões informadas' : 'Restrições de movimento' ?></h3>
<?php if (!$declaracoes[$grupo]): ?><p>Nenhuma informação registrada.</p><?php endif; ?>
<?php foreach ($declaracoes[$grupo] as $d): ?>
<p><?= $esc($d['nome']) ?> <?= $esc($d['observacao'] ?? '') ?></p>
<form method="post" action="/perfil" class="treino-acoes"><input type="hidden" name="csrf_token" value="<?= $csrf ?>"><input type="hidden" name="acao" value="remover_declaracao"><input type="hidden" name="tipo" value="<?= $tipo ?>"><input type="hidden" name="id" value="<?= (int)$d['id'] ?>"><button>Remover <?= $esc($d['nome']) ?></button></form>
<?php endforeach; ?>
<form method="post" action="/perfil"><input type="hidden" name="csrf_token" value="<?= $csrf ?>"><input type="hidden" name="acao" value="declarar"><input type="hidden" name="tipo" value="<?= $tipo ?>">
<label><?= $tipo === 'condicao' ? 'Condição ou lesão' : 'Restrição' ?><input name="nome" required maxlength="120"></label>
<?php if ($tipo === 'restricao'): ?><label>Observação privada<textarea name="observacao" maxlength="4000"></textarea></label><?php endif; ?>
<button>Adicionar informação</button></form></article>
<?php endforeach; ?>
