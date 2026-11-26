<?php
// O token acompanha os campos enviados ao cadastro. A sessão é liberada antes de renderizar o formulário público.

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

            <h1>Criar conta</h1>

            <form method="POST" action="/cadastro">

                <input
                    type="hidden"
                    name="csrf_token"
                    value="<?= htmlspecialchars($token, ENT_QUOTES, 'UTF-8') ?>"
                >

                <label for="nome">
                    Nome completo
                    <input
                        id="nome"
                        type="text"
                        name="nome"
                        minlength="3"
                        maxlength="150"
                        autocomplete="name"
                        placeholder="Seu nome completo"
                        required
                    >
                </label>

                <label for="email">
                    E-mail
                    <input
                        id="email"
                        type="email"
                        name="email"
                        maxlength="150"
                        autocomplete="email"
                        placeholder="seu@email.com"
                        required
                    >
                </label>

                <label for="senha">
                    Senha
                    <input
                        id="senha"
                        type="password"
                        name="senha"
                        minlength="8"
                        maxlength="32"
                        autocomplete="new-password"
                        aria-describedby="requisitos-senha"
                        required
                    >
                </label>

                <small id="requisitos-senha">Use de 8 a 32 caracteres.</small>
                <label for="confirmar_senha">
                    Confirmar senha
                    <input
                        id="confirmar_senha"
                        type="password"
                        name="confirmar_senha"
                        minlength="8"
                        maxlength="32"
                        autocomplete="new-password"
                        placeholder="Digite a senha novamente"
                        required
                    >
                </label>

                <button type="submit" class="auth-btn">
                    Criar minha conta
                </button>

            </form>

            <p class="auth-rodape">
                Já possui uma conta?
                <a href="/login">Entrar</a>
            </p>

        </section>

    </main>

</body>
</html>
