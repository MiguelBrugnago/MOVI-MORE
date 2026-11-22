<?php
// O papel atual define qual participante aparece na lista e quais solicitações ele pode responder. As permissões são carregadas por ID de vínculo.
/** @var array<int,array<string,int>> $permissoes Consentimentos agrupados por vínculo e categoria. */
$modoProfissional = $modoProfissional ?? false;
$vinculos = $vinculos ?? [];
$mensagem = $mensagem ?? '';
$ehProfissional = $ehProfissional ?? false;

$modo = $modoProfissional ? 'profissional' : 'aluno';

/**
 * Escapa texto do vínculo antes de inseri-lo no HTML.
 *
 * @param string $texto Nome, e-mail ou mensagem apresentada na tela.
 * @return string Texto com os caracteres especiais convertidos em entidades.
 */
function escaparVinculo(string $texto): string
{
    return htmlspecialchars($texto, ENT_QUOTES, 'UTF-8');
}
?>



<h1>Meus vínculos</h1>

<nav>
    <a href="/painel">Voltar ao painel</a>
    |
    <a href="/vinculos">Área do aluno</a>

    <?php if ($ehProfissional): ?>
        |
        <a href="/vinculos?modo=profissional">
            Área do profissional
        </a>
    <?php endif; ?>
</nav>

<?php if ($mensagem !== ''): ?>
    <p><?= escaparVinculo($mensagem) ?></p>
<?php endif; ?>

<h2>
    <?= $modoProfissional
        ? 'Convidar aluno'
        : 'Solicitar acompanhamento' ?>
</h2>

<form action="/vinculos/solicitar" method="POST">
    <input type="hidden" name="csrf_token" value="<?= escaparVinculo($_SESSION['csrf_token']) ?>">

    <input type="hidden" name="modo" value="<?= $modo ?>">

    <label for="email">
        <?= $modoProfissional
            ? 'E-mail do aluno'
            : 'E-mail do profissional' ?>
    </label>

    <input type="email" id="email" name="email" required>

    <button type="submit">Enviar solicitação</button>
</form>

<h2>Solicitações e acompanhamentos</h2>

<?php if (empty($vinculos)): ?>
    <p>Nenhum vínculo encontrado.</p>
<?php endif; ?>

<?php foreach ($vinculos as $vinculo): ?>
    <?php
    $nome = $modoProfissional
        ? $vinculo['aluno_nome']
        : $vinculo['profissional_nome'];

    $email = $modoProfissional
        ? $vinculo['aluno_email']
        : $vinculo['profissional_email'];

    // A mesma relação aparece para os dois usuários. Só quem recebeu uma solicitação pendente vê os controles de resposta.
    $recebida = $vinculo['status'] === 'pendente'
        && (
            ($modoProfissional &&
                $vinculo['solicitado_por'] === 'aluno')
            ||
            (!$modoProfissional &&
                $vinculo['solicitado_por'] === 'profissional')
        );
    ?>

    <hr>

    <h3><?= escaparVinculo((string) $nome) ?></h3>

    <p><?= escaparVinculo((string) $email) ?></p>

    <p>
        Status:
        <strong>
            <?= escaparVinculo((string) $vinculo['status']) ?>
        </strong>
    </p>

    <?php if ($recebida): ?>
        <form action="/vinculos/responder" method="POST">
            <input type="hidden" name="csrf_token" value="<?= escaparVinculo($_SESSION['csrf_token']) ?>">

            <input type="hidden" name="modo" value="<?= $modo ?>">

            <input type="hidden" name="vinculo_id" value="<?= (int) $vinculo['id'] ?>">

            <button type="submit" name="acao" value="aceitar">
                Aceitar
            </button>

            <button type="submit" name="acao" value="recusar">
                Recusar
            </button>
        </form>
    <?php endif; ?>

    <?php if ($vinculo['status'] === 'ativo'): ?>
        <?php if (!$modoProfissional): ?>
        <h4>Compartilhamento com este profissional</h4>
        <p>O vínculo por si só não libera seus dados. Autorize cada categoria separadamente; o acesso será somente leitura.</p>
        <?php foreach (['fisico' => 'Perfil esportivo, medidas e evolução corporal', 'saude' => 'Condições, lesões, restrições e observações pessoais', 'treinos' => 'Histórico e estatísticas de treinos'] as $categoria => $rotulo):
            $permitido = !empty($permissoes[$vinculo['id']][$categoria]); ?>
        <form action="/perfil" method="post">
            <input type="hidden" name="csrf_token" value="<?= escaparVinculo($_SESSION['csrf_token']) ?>">
            <input type="hidden" name="acao" value="permissao"><input type="hidden" name="id" value="<?= (int)$vinculo['id'] ?>">
            <input type="hidden" name="categoria" value="<?= $categoria ?>"><input type="hidden" name="permitir" value="<?= $permitido ? '0' : '1' ?>">
            <p><?= $rotulo ?>: <strong><?= $permitido ? 'Autorizado' : 'Não autorizado' ?></strong></p>
            <button><?= $permitido ? 'Revogar acesso' : 'Autorizar acesso' ?></button>
        </form>
        <?php endforeach; ?>
        <?php endif; ?>
        <form action="/vinculos/encerrar" method="POST">
            <input type="hidden" name="csrf_token" value="<?= escaparVinculo($_SESSION['csrf_token']) ?>">

            <input type="hidden" name="modo" value="<?= $modo ?>">

            <input type="hidden" name="vinculo_id" value="<?= (int) $vinculo['id'] ?>">

            <button type="submit">
                Encerrar vínculo
            </button>
        </form>
    <?php endif; ?>

<?php endforeach; ?>
