<?php

declare(strict_types=1);

if (PHP_SAPI !== 'cli') {
    exit(1);
}
$integracao = ($argv[1] ?? '') === '--integracao';
if (count($argv) > ($integracao ? 2 : 1)) {
    fwrite(STDERR, "Uso: php tests/executar.php [--integracao]\n");
    exit(1);
}
if ($integracao && getenv('DB_NAME') !== 'movi_treinos_teste') {
    fwrite(STDERR, "Integração permitida somente no ambiente isolado de testes.\n");
    exit(1);
}
$testes = ['poo_unitario', 'perfil_unitario', 'analise_unitario'];
$servidor = null;
if ($integracao) {
    require dirname(__DIR__) . '/vendor/autoload.php';
    if (App\Config\Database::conectar()->query('SELECT DATABASE()')->fetchColumn() !== 'movi_treinos_teste') {
        exit(1);
    }
    // O processo próprio atende a suíte legada de treinos; perfil/análise usam Apache.
    $log = sys_get_temp_dir() . '/movi-poo-http.log';
    $servidor = proc_open(
        [PHP_BINARY, '-S', '127.0.0.1:8088', '-t', 'public', 'public/index.php'],
        [0 => ['pipe', 'r'], 1 => ['file', $log, 'a'], 2 => ['file', $log, 'a']],
        $pipes,
        dirname(__DIR__)
    );
    if (!is_resource($servidor)) {
        throw new RuntimeException('Não foi possível iniciar o servidor HTTP de teste.');
    }
    fclose($pipes[0]);
    usleep(500000);
    if (!proc_get_status($servidor)['running']) {
        proc_close($servidor);
        throw new RuntimeException('A porta 8088 está indisponível. Consulte ' . $log);
    }
    array_push($testes, 'seed_registros_especiais', 'poo_integracao', 'treinos_integracao', 'analise_integracao', 'treinos_http', 'perfil_http', 'analise_http');
}
$falhas = 0;
try {
    foreach ($testes as $teste) {
        echo "\n== $teste ==\n";
        passthru(escapeshellarg(PHP_BINARY) . ' ' . escapeshellarg(__DIR__ . '/' . $teste . '.php'), $codigo);
        $falhas += (int) ($codigo !== 0);
    }
} finally {
    if (is_resource($servidor)) {
        proc_terminate($servidor);
        proc_close($servidor);
    }
}
echo "\n" . count($testes) . " suítes executadas; $falhas falhas.\n";
exit($falhas ? 1 : 0);
