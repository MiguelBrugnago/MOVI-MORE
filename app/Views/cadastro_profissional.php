<?php

declare(strict_types=1);

$erro = $erro ?? null;

?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MOVI+ | Cadastro Profissional</title>
</head>
<body>

    <h1>MOVI+</h1>
    <h2>Cadastro Profissional</h2>

    <p>Cadastre seu perfil para acompanhar alunos.</p>

    <?php if ($erro !== null): ?>
        <p>
            <?= htmlspecialchars($erro, ENT_QUOTES, 'UTF-8') ?>
        </p>
    <?php endif; ?>

    <form action="/profissional/cadastro" method="POST">

        <input
            type="hidden"
            name="csrf_token"
            value="<?= htmlspecialchars(
                (string) $_SESSION['csrf_token'],
                ENT_QUOTES,
                'UTF-8'
            ) ?>"
        >

        <label for="tipo">Tipo de profissional</label>

        <select name="tipo" id="tipo" required>
            <option value="">Selecione</option>
            <option value="Personal Trainer">Personal Trainer</option>
            <option value="Educador Físico">Educador Físico</option>
            <option value="Nutricionista">Nutricionista</option>
        </select>

        <br><br>

        <label for="registro">Registro profissional</label>

        <input
            type="text"
            name="registro"
            id="registro"
            maxlength="80"
        >

        <br><br>

        <label for="especialidade">Especialidade</label>

        <input
            type="text"
            name="especialidade"
            id="especialidade"
            maxlength="120"
        >

        <br><br>

        <label for="descricao">Descrição profissional</label>

        <textarea
            name="descricao"
            id="descricao"
            rows="5"
        ></textarea>

        <br><br>

        <button type="submit">
            Cadastrar perfil profissional
        </button>

    </form>

    <br>

    <a href="/painel?modo=aluno">
        Voltar ao painel do aluno
    </a>

</body>
</html>
