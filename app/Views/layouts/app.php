<?php

declare(strict_types=1);

/** @var string $viewPath */
/** @var string $titulo */

use App\Security\Auth;

$usuarioLogado = Auth::usuario();
\App\Security\Csrf::gerarToken();
session_write_close();

$titulo = $titulo ?? 'MOVI+';
?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($titulo, ENT_QUOTES, 'UTF-8') ?></title>
    <link rel="stylesheet" href="/assets/css/app.css">
</head>

<body>

    <header>
        <a href="/painel"><strong>MOVI+</strong></a>
        <nav aria-label="Principal"><a href="/exercicios">Exercícios</a> · <a href="/rotinas">Rotinas e treinos</a> · <a href="/perfil">Perfil físico</a>
        </nav>

        <?php require __DIR__ . '/../partials/conta_conectada.php'; ?>
    </header>

    <main>
        <?php require $viewPath; ?>
    </main>

</body>

</html>
