<?php
// O layout fornece a conta autenticada. Nome e e-mail são escapados antes de aparecer no cabeçalho.

declare(strict_types=1);

/** @var array{id: int, nome: string, email: string, ativo: int} $usuarioLogado */

$nome = htmlspecialchars(
    (string) $usuarioLogado['nome'],
    ENT_QUOTES,
    'UTF-8'
);

$email = htmlspecialchars(
    (string) $usuarioLogado['email'],
    ENT_QUOTES,
    'UTF-8'
);
?>

<div class="conta-conectada">
    <strong><?= $nome ?></strong>
    <small><?= $email ?></small>

    <form action="/logout" method="POST">
        <input
            type="hidden"
            name="csrf_token"
            value="<?= htmlspecialchars(
                (string) ($_SESSION['csrf_token'] ?? ''),
                ENT_QUOTES,
                'UTF-8'
            ) ?>">

        <button type="submit">Sair</button>
    </form>
</div>