<?php

$modoProfissional = $modoProfissional ?? false;
$vinculos = $vinculos ?? [];
$mensagem = $mensagem ?? '';
$ehProfissional = $ehProfissional ?? false;

$escaparVinculo = static fn (string $texto): string => htmlspecialchars($texto, ENT_QUOTES, 'UTF-8');
$tokenCsrf = $escaparVinculo($_SESSION['csrf_token'] ?? '');
$modo = $modoProfissional ? 'profissional' : 'aluno';

$categoriasCompartilhamento = [
    'fisico' => 'Perfil esportivo, medidas e evolução corporal',
    'saude' => 'Condições, lesões, restrições e observações pessoais',
    'treinos' => 'Histórico e estatísticas de treinos',
    'nutricao' => 'Planos, diário, preferências e restrições alimentares',
];
?>

<h1>Compartilhamento</h1>

<nav class="treino-nav vinculos-nav" aria-label="Navegação de compartilhamento">
    <a href="/painel">Voltar ao painel</a>
    <a href="/vinculos" <?= !$modoProfissional ? 'aria-current="page"' : '' ?>>Área do aluno</a>
    <?php if ($ehProfissional): ?>
        <a href="/vinculos?modo=profissional" <?= $modoProfissional ? 'aria-current="page"' : '' ?>>
            Área do profissional
        </a>
    <?php endif; ?>
</nav>

<?php if ($mensagem !== ''): ?>
    <p class="treino-destaque" role="status"><?= $escaparVinculo($mensagem) ?></p>
<?php endif; ?>

<div class="vinculos-conteudo">
    <section class="treino-card vinculos-solicitacao" aria-labelledby="titulo-solicitacao">
        <h2 id="titulo-solicitacao"><?= $modoProfissional ? 'Convidar aluno' : 'Solicitar acompanhamento' ?></h2>

        <form action="/vinculos/solicitar" method="post">
            <input type="hidden" name="csrf_token" value="<?= $tokenCsrf ?>">
            <input type="hidden" name="modo" value="<?= $modo ?>">

            <label>
                <?= $modoProfissional ? 'E-mail do aluno' : 'E-mail do profissional' ?>
                <input type="email" name="email" maxlength="150" required>
            </label>

            <button type="submit">Enviar solicitação</button>
        </form>
    </section>

    <section class="vinculos-lista" aria-labelledby="titulo-lista-vinculos">
        <h2 id="titulo-lista-vinculos">Solicitações e acompanhamentos</h2>

        <?php if (!$vinculos): ?>
            <p class="treino-card">Nenhum vínculo encontrado.</p>
        <?php endif; ?>

        <?php foreach ($vinculos as $vinculo): ?>
            <?php
            $vinculoId = (int) $vinculo['id'];
            $nomeParticipante = $modoProfissional ? $vinculo['aluno_nome'] : $vinculo['profissional_nome'];
            $emailParticipante = $modoProfissional ? $vinculo['aluno_email'] : $vinculo['profissional_email'];
            $statusVinculo = (string) $vinculo['status'];

            // Os controles de resposta aparecem para quem recebeu a solicitação.
            $solicitacaoRecebida = $statusVinculo === 'pendente'
                && $vinculo['solicitado_por'] === ($modoProfissional ? 'aluno' : 'profissional');
            ?>

            <article class="treino-card vinculo-cartao">
                <div class="vinculo-identificacao">
                    <div>
                        <h3><?= $escaparVinculo((string) $nomeParticipante) ?></h3>
                        <p><?= $escaparVinculo((string) $emailParticipante) ?></p>
                    </div>
                    <span class="vinculo-status" data-status="<?= $escaparVinculo($statusVinculo) ?>">
                        <?= $escaparVinculo($statusVinculo) ?>
                    </span>
                </div>

                <?php if ($solicitacaoRecebida): ?>
                    <form action="/vinculos/responder" method="post" class="vinculo-acoes">
                        <input type="hidden" name="csrf_token" value="<?= $tokenCsrf ?>">
                        <input type="hidden" name="modo" value="<?= $modo ?>">
                        <input type="hidden" name="vinculo_id" value="<?= $vinculoId ?>">

                        <button type="submit" name="acao" value="aceitar">Aceitar</button>
                        <button type="submit" name="acao" value="recusar" class="vinculo-acao-secundaria">Recusar</button>
                    </form>
                <?php endif; ?>

                <?php if ($statusVinculo === 'ativo'): ?>
                    <?php if (!$modoProfissional): ?>
                        <details class="vinculo-permissoes">
                            <summary>Gerenciar permissões de compartilhamento</summary>
                            <p>Você escolhe quais categorias o profissional pode consultar. O acesso é somente para leitura.</p>

                            <?php foreach ($categoriasCompartilhamento as $categoria => $rotuloCategoria): ?>
                                <?php $permissaoAtiva = !empty($permissoes[$vinculoId][$categoria]); ?>

                                <form action="/perfil" method="post" class="vinculo-permissao">
                                    <input type="hidden" name="csrf_token" value="<?= $tokenCsrf ?>">
                                    <input type="hidden" name="acao" value="permissao">
                                    <input type="hidden" name="id" value="<?= $vinculoId ?>">
                                    <input type="hidden" name="categoria" value="<?= $escaparVinculo($categoria) ?>">
                                    <input type="hidden" name="permitir" value="<?= $permissaoAtiva ? '0' : '1' ?>">

                                    <p>
                                        <?= $escaparVinculo($rotuloCategoria) ?><br>
                                        <strong><?= $permissaoAtiva ? 'Autorizado' : 'Não autorizado' ?></strong>
                                    </p>
                                    <button type="submit" class="vinculo-acao-secundaria">
                                        <?= $permissaoAtiva ? 'Revogar acesso' : 'Autorizar acesso' ?>
                                    </button>
                                </form>
                            <?php endforeach; ?>
                        </details>
                    <?php endif; ?>

                    <form action="/vinculos/encerrar" method="post" class="vinculo-acoes">
                        <input type="hidden" name="csrf_token" value="<?= $tokenCsrf ?>">
                        <input type="hidden" name="modo" value="<?= $modo ?>">
                        <input type="hidden" name="vinculo_id" value="<?= $vinculoId ?>">

                        <button type="submit" class="vinculo-acao-perigo">Encerrar vínculo</button>
                    </form>
                <?php endif; ?>
            </article>
        <?php endforeach; ?>
    </section>
</div>
