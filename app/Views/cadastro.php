<?php

declare(strict_types=1);

use App\Security\Csrf;

$token = Csrf::gerarToken();
session_write_close();
?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - MOVI+</title>
    <link rel="stylesheet" href="/assets/css/app.css">
</head>

<body>
    <h1>Criar conta</h1>

    <form method="POST" action="/cadastro">
        <input type="hidden" name="csrf_token" value="<?= htmlspecialchars($token, ENT_QUOTES, 'UTF-8') ?>">

        <label for="nome">Nome</label>
        <input id="nome" type="text" name="nome" minlength="3" maxlength="150" autocomplete="name" required>

        <label for="email">E-mail</label>
        <input id="email" type="email" name="email" maxlength="150" autocomplete="email" required>

        <label for="senha">Senha</label>
        <input id="senha" type="password" name="senha" minlength="8" maxlength="32" autocomplete="new-password"
            required>

        <label for="confirmar_senha">Confirmar senha</label>
<input
    id="confirmar_senha"
    type="password"
    name="confirmar_senha"
    minlength="8"
    maxlength="32"
    autocomplete="new-password"
    required
>
<p id="erro-senha" role="alert"></p>

        <button type="submit">Cadastrar</button>
    </form>
    <script src="/assets/js/cadastro.js" defer></script>
</body>

</html>
