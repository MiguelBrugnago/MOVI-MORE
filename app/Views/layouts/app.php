<?php

declare(strict_types=1);

/** @var string $viewPath */
/** @var string $titulo */

use App\Security\Auth;

$usuarioLogado = Auth::usuario();

$titulo = $titulo ?? 'MOVI+';
?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($titulo, ENT_QUOTES, 'UTF-8') ?></title>
</head>

<body>

    <header>
        <a href="/painel"><strong>MOVI+</strong></a>

        <?php require __DIR__ . '/../partials/conta_conectada.php'; ?>
    </header>

    <main>
        <?php require $viewPath; ?>
    </main>

</body>

</html>