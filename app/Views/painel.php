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
    <title>Painel - MOVI+</title>
</head>

<body>
    <h1>Painel MOVI+</h1>

    <p>Você está autenticado.</p>

    <form method="POST" action="/logout">
        <input type="hidden" name="csrf_token" value="<?= htmlspecialchars($token, ENT_QUOTES, 'UTF-8') ?>">

        <button type="submit">Sair da conta</button>
    </form>
</body>

</html>