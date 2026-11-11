<?php

declare(strict_types=1);

$ehProfissional = $ehProfissional ?? false;

$nome = htmlspecialchars(
    (string) ($_SESSION['usuario_nome'] ?? 'Aluno'),
    ENT_QUOTES,
    'UTF-8'
);
?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MOVI+ | Painel do Aluno</title>
</head>

<body>

    <h1>Bem-vindo ao MOVI+, <?= $nome ?>!</h1>

    <h2>Painel do Aluno</h2>

    <nav>
        <ul>
            <li>Meus treinos</li>
            <li>Minha evolução</li>
            <li>Minha alimentação</li>
            <li>Meus profissionais</li>
            <li>Meu perfil</li>
        </ul>
    </nav>

    <p>Gerencie seus treinos e acompanhe sua evolução.</p>

    <?php if ($ehProfissional): ?>
        <a href="/painel?modo=profissional">
            Acessar painel profissional
        </a>
    <?php else: ?>
        <p>Você ainda não possui um perfil profissional.</p>

        <a href="/profissional/cadastro">
            Cadastrar perfil profissional
        </a>
    <?php endif; ?>

    <form action="/logout" method="POST">
        <input
            type="hidden"
            name="csrf_token"
            value="<?= htmlspecialchars(
                        $_SESSION['csrf_token'] ?? '',
                        ENT_QUOTES,
                        'UTF-8'
                    ) ?>">

        <button type="submit">Sair</button>
    </form>

</body>

</html>