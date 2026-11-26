<?php
// Gera o token do formulário na sessão e libera o bloqueio antes de entregar o HTML de login.

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
    <title>Login - MOVI+</title>
    <link rel="stylesheet" href="/assets/css/app.css">
</head>

<body class="auth-page">

    <main class="auth-container">

        <a href="/" class="auth-logo"
           aria-label="MOVI+ - Página inicial">
            <img
                src="/assets/img/movi-plus-logo-horizontal.png"
                alt="MOVI+"
            >
        </a>

        <section class="auth-card">

            <h1>Entrar no MOVI+</h1>

            <form method="POST" action="/login">

                <input
                    type="hidden"
                    name="csrf_token"
                    value="<?= htmlspecialchars($token, ENT_QUOTES, 'UTF-8') ?>"
                >

                <label for="email">
                    E-mail
                    <input
                        type="email"
                        id="email"
                        name="email"
                        maxlength="150"
                        autocomplete="username"
                        placeholder="seu@email.com"
                        required
                    >
                </label>

                <label for="senha">
                    Senha
                    <input
                        type="password"
                        id="senha"
                        name="senha"
                        maxlength="32"
                        autocomplete="current-password"
                        placeholder="Digite sua senha"
                        required
                    >
                </label>

                <button type="submit" class="auth-btn">
                    Entrar
                </button>

            </form>

            <p class="auth-rodape">
                Ainda não tem uma conta?
                <a href="/cadastro">Cadastre-se</a>
            </p>

        </section>

    </main>

</body>
</html>
