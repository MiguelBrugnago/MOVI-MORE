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
    <title>Login - MOVI+</title>
</head>

<body>
    <h1>Entrar no MOVI+</h1>

    <form method="POST" action="/login">
        <input type="hidden" name="csrf_token" value="<?= htmlspecialchars($token, ENT_QUOTES, 'UTF-8') ?>">

        <label for="email">E-mail</label>
        <input type="email" id="email" name="email" maxlength="150" autocomplete="username" required>

        <label for="senha">Senha</label>
        <input type="password" id="senha" name="senha" maxlength="32" autocomplete="current-password" required>

        <button type="submit">Entrar</button>
    </form>
</body>

</html>