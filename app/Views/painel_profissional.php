<?php
declare(strict_types=1);

$nome = htmlspecialchars(
    (string) ($_SESSION['usuario_nome'] ?? 'Profissional'),
    ENT_QUOTES,
    'UTF-8'
);
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MOVI+ | Painel Profissional</title>
</head>
<body>

    <h1>Bem-vindo ao MOVI+, <?= $nome ?>!</h1>

    <h2>Painel Profissional</h2>

    <nav>
        <ul>
            <li>Meus alunos</li>
            <li>Solicitações de vínculo</li>
            <li>Gerenciar treinos</li>
            <li>Acompanhar evolução</li>
            <li>Meu perfil profissional</li>
        </ul>
    </nav>

    <p>Gerencie seus alunos e acompanhe seus resultados.</p>

    <a href="/painel?modo=aluno">
        Acessar painel do aluno
    </a>

    <form action="/logout" method="POST">
        <button type="submit">Sair</button>
    </form>

</body>
</html>
