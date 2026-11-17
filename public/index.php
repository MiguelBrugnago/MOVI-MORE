<?php

declare(strict_types=1);

$inicioRequisicao = hrtime(true);
register_shutdown_function(static function () use ($inicioRequisicao): void {
    $ms = (hrtime(true) - $inicioRequisicao) / 1e6;
    if ($ms > 500)
        error_log(sprintf('MOVI: requisicao PHP lenta %.1f ms', $ms));
});

require_once __DIR__ . '/../vendor/autoload.php';

$rotas = require __DIR__ . '/../routes/web.php';

$metodoHttp = $_SERVER['REQUEST_METHOD'] ?? 'GET';

$caminho = parse_url(
    $_SERVER['REQUEST_URI'] ?? '/',
    PHP_URL_PATH
);

$caminho = $caminho ?: '/';

if (!isset($rotas[$metodoHttp][$caminho])) {
    http_response_code(404);
    echo '404 - Página não encontrada';
    exit;
}

[$classe, $metodo] = $rotas[$metodoHttp][$caminho];

$controller = new $classe();
$controller->$metodo();
