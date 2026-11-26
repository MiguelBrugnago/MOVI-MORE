<?php

use App\Services\PerfilFisicoService;
use App\Support\PerfilFisicoConstantes;

?>

<h1>Meu perfil físico</h1>

<?php require __DIR__ . '/fisico_comum.php'; ?>

<section class="perfil-resumo" aria-labelledby="titulo-ultima-avaliacao">
    <div class="perfil-resumo-cabecalho">
        <div>
            <h2 id="titulo-ultima-avaliacao">Última avaliação</h2>
            <?php if ($recente): ?>
                <p>Avaliação de <?= $esc($recente['avaliado_em']) ?></p>
            <?php else: ?>
                <p>Nenhuma avaliação registrada.</p>
            <?php endif; ?>
        </div>

        <a class="treino-link perfil-acao-avaliacao" href="/perfil/avaliacoes/nova">
            Registrar peso e medidas
        </a>
    </div>

    <div class="catalogo perfil-indicadores">
        <?php foreach ($indicadoresResumo as $chaveMetrica => [$nomeMetrica, $unidade]): ?>
            <?php $valorMedida = $recente['medidas'][$chaveMetrica] ?? null; ?>
            <article class="perfil-indicador perfil-indicador--<?= $esc($chaveMetrica) ?>">
                <h3><?= $esc($nomeMetrica) ?></h3>
                <p>
                    <strong><?= $numero($valorMedida) ?></strong>
                    <?php if ($valorMedida !== null): ?>
                        <span><?= $esc($unidade) ?></span>
                    <?php endif; ?>
                </p>
            </article>
        <?php endforeach; ?>
    </div>

    <p class="perfil-nota">As estimativas calculadas não são medições clínicas.</p>
</section>

<h2 id="titulo-dados-perfil">Dados do perfil</h2>
<p class="perfil-nota">Todos os campos abaixo são opcionais.</p>

<form method="post" action="/perfil" class="fisico-form perfil-fisico-form" aria-labelledby="titulo-dados-perfil">
    <input type="hidden" name="csrf_token" value="<?= $csrf ?>">
    <input type="hidden" name="acao" value="perfil">

    <fieldset>
        <legend>Dados pessoais e físicos</legend>
        <div class="treino-campos">
            <label>
                Data de nascimento
                <input type="date" name="data_nascimento" min="1900-01-01"
                    max="<?= $esc(PerfilFisicoService::hoje()) ?>"
                    value="<?= $esc($perfil['data_nascimento'] ?? '') ?>">
            </label>

            <label>
                Gênero
                <input name="genero" maxlength="40" value="<?= $esc($perfil['genero'] ?? '') ?>">
            </label>

            <label>
                Altura (cm)
                <input type="number" name="altura_cm" min="30" max="280" step="0.01"
                    value="<?= $esc($perfil['altura_cm'] ?? '') ?>">
            </label>
        </div>
    </fieldset>

    <fieldset>
        <legend>Treinamento</legend>
        <div class="treino-campos">
            <?php
            $camposTreinamento = [
                'objetivo' => ['Objetivo principal', PerfilFisicoConstantes::OBJETIVOS],
                'experiencia' => ['Experiência', PerfilFisicoConstantes::EXPERIENCIAS],
            ];
            ?>
            <?php foreach ($camposTreinamento as $campoTreinamento => [$rotuloCampo, $opcoesCampo]): ?>
                <label>
                    <?= $esc($rotuloCampo) ?>
                    <select name="<?= $esc($campoTreinamento) ?>">
                        <option value="">Não informado</option>
                        <?php foreach ($opcoesCampo as $opcaoCampo): ?>
                            <option value="<?= $esc($opcaoCampo) ?>"
                                <?= ($perfil[$campoTreinamento] ?? '') === $opcaoCampo ? 'selected' : '' ?>
                            ><?= $esc($opcaoCampo) ?></option>
                        <?php endforeach; ?>
                    </select>
                </label>
            <?php endforeach; ?>

            <label>
                Tempo de treinamento (meses)
                <input type="number" name="tempo_treinamento_meses" min="0" max="1200"
                    value="<?= $esc($perfil['tempo_treinamento_meses'] ?? '') ?>">
            </label>

            <label>
                Frequência pretendida (dias/semana)
                <input type="number" name="frequencia_semanal" min="0" max="7"
                    value="<?= $esc($perfil['frequencia_semanal'] ?? '') ?>">
            </label>

            <label>
                Disponibilidade
                <input name="disponibilidade" maxlength="255" placeholder="Ex.: segundas e quartas à noite"
                    value="<?= $esc($perfil['disponibilidade'] ?? '') ?>">
            </label>

            <label>
                Ambiente preferido
                <input name="ambiente_preferido" maxlength="80" placeholder="Ex.: academia, casa ou ar livre"
                    value="<?= $esc($perfil['ambiente_preferido'] ?? '') ?>">
            </label>
        </div>
    </fieldset>

    <label>
        Observações pessoais (compartilhadas somente com permissão de saúde)
        <textarea name="biografia" maxlength="4000" rows="3"><?= $esc($perfil['biografia'] ?? '') ?></textarea>
    </label>

    <button type="submit">Salvar perfil</button>
</form>

<section class="perfil-saude" aria-labelledby="titulo-perfil-saude">
    <h2 id="titulo-perfil-saude">Condições, lesões e restrições</h2>
    <p class="perfil-nota">
        Informe voluntariamente apenas o que considera relevante para treinar.
        Você controla o acesso em <a href="/vinculos">Compartilhamento</a>.
    </p>

    <div class="catalogo perfil-declaracoes">
        <?php foreach (['condicao' => 'condicoes', 'restricao' => 'restricoes'] as $tipoDeclaracao => $grupoDeclaracao): ?>
            <article>
                <h3><?= $tipoDeclaracao === 'condicao' ? 'Condições e lesões informadas' : 'Restrições de movimento' ?></h3>

                <?php if (!$declaracoes[$grupoDeclaracao]): ?>
                    <p class="perfil-nota">Nenhuma informação registrada.</p>
                <?php endif; ?>

                <?php foreach ($declaracoes[$grupoDeclaracao] as $declaracao): ?>
                    <div class="perfil-declaracao">
                        <p><?= $esc($declaracao['nome']) ?> <?= $esc($declaracao['observacao'] ?? '') ?></p>
                        <form method="post" action="/perfil">
                            <input type="hidden" name="csrf_token" value="<?= $csrf ?>">
                            <input type="hidden" name="acao" value="remover_declaracao">
                            <input type="hidden" name="tipo" value="<?= $esc($tipoDeclaracao) ?>">
                            <input type="hidden" name="id" value="<?= (int) $declaracao['id'] ?>">
                            <button type="submit" class="perfil-acao-remover">Remover <?= $esc($declaracao['nome']) ?></button>
                        </form>
                    </div>
                <?php endforeach; ?>

                <form method="post" action="/perfil">
                    <input type="hidden" name="csrf_token" value="<?= $csrf ?>">
                    <input type="hidden" name="acao" value="declarar">
                    <input type="hidden" name="tipo" value="<?= $esc($tipoDeclaracao) ?>">

                    <label>
                        <?= $tipoDeclaracao === 'condicao' ? 'Condição ou lesão' : 'Restrição' ?>
                        <input name="nome" required maxlength="120">
                    </label>

                    <?php if ($tipoDeclaracao === 'restricao'): ?>
                        <label>
                            Observação privada
                            <textarea name="observacao" maxlength="4000" rows="3"></textarea>
                        </label>
                    <?php endif; ?>

                    <button type="submit">Adicionar informação</button>
                </form>
            </article>
        <?php endforeach; ?>
    </div>
</section>
