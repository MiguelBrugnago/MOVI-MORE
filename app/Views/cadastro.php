<?php

declare(strict_types=1);

use App\Security\Csrf;

$token = Csrf::gerarToken();
?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - MOVI+</title>
</head>

<body>
    <h1>Criar conta</h1>

    <form method="POST" action="/cadastro">
        <input type="hidden" name="csrf_token" value="<?= htmlspecialchars($token, ENT_QUOTES, 'UTF-8') ?>">

        <label for="nome">Nome</label>
        <input id="nome" type="text" name="nome" maxlength="150" required>

        <label for="email">E-mail</label>
        <input id="email" type="email" name="email" maxlength="150" required>

        <label for="senha">Senha</label>
        <input id="senha" type="password" name="senha" minlength="8" maxlength="1024" autocomplete="new-password"
            required>

        <button type="submit">Cadastrar</button>
    </form>
</body>

</html>