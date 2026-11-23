<?php
// A conta e o token ficam disponíveis ao template incluído. Liberar a sessão antes da renderização evita bloquear outra requisição da mesma aba.

declare(strict_types=1);

/** @var string $viewPath */
/** @var string $titulo */

use App\Security\Auth;

$usuarioLogado = Auth::usuario();
\App\Security\Csrf::gerarToken();
session_write_close();

$titulo = $titulo ?? 'MOVI+';

$caminhoAtual = parse_url(
    $_SERVER['REQUEST_URI'] ?? '/',
    PHP_URL_PATH
) ?: '/';

$menuAtivo = match (true) {
    $caminhoAtual === '/painel' => 'inicio',
    str_starts_with($caminhoAtual, '/exercicios') => 'exercicios',
    str_starts_with($caminhoAtual, '/rotinas'),
    str_starts_with($caminhoAtual, '/treinos') => 'treinos',
    str_starts_with($caminhoAtual, '/perfil') => 'perfil',
    default => '',
};
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
        
<a href="/painel" class="logo-link" aria-label="MOVI+ - Ir para o início">
    <img
        src="/assets/img/movi-plus-logo-horizontal.png"
        alt="MOVI+"
        class="logo-img"
        width="200"
        height="63"
    >
</a>

        

<nav class="menu-principal" aria-label="Principal">
    <?php
    $itensMenu = [
        'inicio' => ['/painel', 'Início'],
        'exercicios' => ['/exercicios', 'Exercícios'],
        'treinos' => ['/rotinas', 'Rotinas e treinos'],
        'perfil' => ['/perfil', 'Perfil físico'],
    ];

    foreach ($itensMenu as $id => [$url, $nome]):
        $ativo = $menuAtivo === $id;
    ?>
        <a
            href="<?= $url ?>"
            class="menu-link <?= $ativo ? 'ativo' : '' ?>"
            <?= $ativo ? 'aria-current="page"' : '' ?>
        >
            <?= htmlspecialchars($nome, ENT_QUOTES, 'UTF-8') ?>
        </a>
    <?php endforeach; ?>
</nav>

        <?php require __DIR__ . '/../partials/conta_conectada.php'; ?>
    </header>

    <main>
        <?php require $viewPath; ?>
    </main>

</body>

</html>
