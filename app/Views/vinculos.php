<?php
$modoProfissional = $modoProfissional ?? false;
$vinculos = $vinculos ?? [];
$mensagem = $mensagem ?? '';
$ehProfissional = $ehProfissional ?? false;

$modo = $modoProfissional ? 'profissional' : 'aluno';

function escaparVinculo(string $texto): string
{
    return htmlspecialchars($texto, ENT_QUOTES, 'UTF-8');
}
?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vínculos - MOVI+</title>
</head>

<body>

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
        <input
            type="hidden"
            name="csrf_token"
            value="<?= escaparVinculo($_SESSION['csrf_token']) ?>">

        <input type="hidden" name="modo" value="<?= $modo ?>">

        <label for="email">
            <?= $modoProfissional
                ? 'E-mail do aluno'
                : 'E-mail do profissional' ?>
        </label>

        <input
            type="email"
            id="email"
            name="email"
            required>

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
                <input
                    type="hidden"
                    name="csrf_token"
                    value="<?= escaparVinculo($_SESSION['csrf_token']) ?>">

                <input type="hidden" name="modo" value="<?= $modo ?>">

                <input
                    type="hidden"
                    name="vinculo_id"
                    value="<?= (int) $vinculo['id'] ?>">

                <button
                    type="submit"
                    name="acao"
                    value="aceitar">
                    Aceitar
                </button>

                <button
                    type="submit"
                    name="acao"
                    value="recusar">
                    Recusar
                </button>
            </form>
        <?php endif; ?>

        <?php if ($vinculo['status'] === 'ativo'): ?>
            <form action="/vinculos/encerrar" method="POST">
                <input
                    type="hidden"
                    name="csrf_token"
                    value="<?= escaparVinculo($_SESSION['csrf_token']) ?>">

                <input type="hidden" name="modo" value="<?= $modo ?>">

                <input
                    type="hidden"
                    name="vinculo_id"
                    value="<?= (int) $vinculo['id'] ?>">

                <button type="submit">
                    Encerrar vínculo
                </button>
            </form>
        <?php endif; ?>

    <?php endforeach; ?>

</body>

</html>