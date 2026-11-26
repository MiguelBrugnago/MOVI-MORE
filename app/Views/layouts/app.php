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
    $caminhoAtual === '/nutricao' => 'nutricao',
    default => '',
};

$itensMenu = [
    'inicio' => ['/painel', 'Início', 'M3 10l9-7 9 7v10h-6v-7H9v7H3z'],
    'exercicios' => ['/exercicios', 'Exercícios', 'M3 5h7l2 2 2-2h7v14h-7l-2 2-2-2H3z M12 7v14'],
    'treinos' => ['/rotinas', 'Treinos', 'M2 10v4 M6 6v12 M6 12h12 M18 6v12 M22 10v4'],
    'nutricao' => ['/nutricao', 'Nutrição', 'M4 3v5a3 3 0 006 0V3 M7 3v18 M19 3c-3 2-4 5-4 9h4 M19 3v18'],
    'perfil' => ['/perfil', 'Perfil', 'M16 7a4 4 0 11-8 0 4 4 0 018 0z M4 21v-2a8 7 0 0116 0v2'],
];
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
    <title><?= htmlspecialchars($titulo, ENT_QUOTES, 'UTF-8') ?></title>
    <link rel="stylesheet" href="/assets/css/app.css">
</head>
<body class="movi-app">
    <a class="pular-conteudo" href="#conteudo">Ir para o conteúdo</a>
    <header class="movi-cabecalho">
        <a href="/painel" class="logo-link" aria-label="MOVI+ — Início">
            <img src="/assets/img/movi-plus-logo-horizontal.png" alt="MOVI+" class="logo-img" width="200" height="63">
        </a>
        <nav class="menu-principal" aria-label="Principal">
            <?php foreach ($itensMenu as $chave => [$url, $rotulo, $icone]): ?>
                <a class="menu-link" href="<?= $url ?>" <?= $menuAtivo === $chave ? 'aria-current="page"' : '' ?>>
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="<?= $icone ?>"/>
                    </svg>
                    <span><?= $rotulo ?></span>
                </a>
            <?php endforeach; ?>
        </nav>
        <?php require __DIR__ . '/../partials/conta_conectada.php'; ?>
    </header>
    <main class="movi-conteudo" id="conteudo" tabindex="-1">
        <?php require $viewPath; ?>
    </main>
</body>
</html>
