<?php

declare(strict_types=1);

require_once __DIR__ . '/../vendor/autoload.php';

$rotas = require __DIR__ . '/../routes/web.php';

$caminho = parse_url(
    $_SERVER['REQUEST_URI'] ?? '/',
    PHP_URL_PATH
);

$caminho = $caminho ?: '/';

if (!isset($rotas[$caminho])) {
    http_response_code(404);
    echo '404 - Página não encontrada';
    exit;
}

[$classe, $metodo] = $rotas[$caminho];

$controller = new $classe();
$controller->$metodo();
