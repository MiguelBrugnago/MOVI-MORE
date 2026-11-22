<?php
// Importador de linha de comando. A ordem dos nomes resolve dependências entre os cadastros de base e as relações do catálogo.

declare(strict_types=1);
if (PHP_SAPI !== 'cli') {
    http_response_code(404);
    exit;
}
require_once dirname(__DIR__, 2) . '/vendor/autoload.php';
try {
    $pdo = App\Config\Database::conectar();
    $arquivos = glob(dirname(__DIR__) . '/seeds/*.sql');
    // glob() devolve false em caso de falha e uma lista vazia quando não há arquivos.
    if ($arquivos === false) {
        throw new RuntimeException('Não foi possível listar os arquivos de seeds.');
    }
    sort($arquivos);
    if (!$arquivos) {
        throw new RuntimeException('Nenhum arquivo SQL encontrado.');
    }
    // A 014 converte códigos legados uma vez no migrador. Seeds não renomeiam códigos locais.
    $pdo->beginTransaction();
    foreach ($arquivos as $arquivo) {
        $sql = file_get_contents($arquivo);
        if ($sql === false) {
            throw new RuntimeException('Não foi possível ler ' . $arquivo);
        }
        // Cada arquivo contém uma instrução, sem dividir SQL por ponto e vírgula.
        $pdo->exec($sql);
        echo basename($arquivo) . " OK\n";
    }
    // Antes de confirmar o lote, exige ao menos um exercício público ativo. A exceção ainda permite reverter a importação.
    $total = (int) $pdo->query('SELECT COUNT(*) FROM exercicio WHERE ativo=1 AND usuario_id IS NULL')->fetchColumn();
    if ($total === 0) {
        throw new RuntimeException('Catálogo incompleto: ' . $total);
    }
    $pdo->commit();
    echo "Importação concluída: $total exercícios públicos ativos.\n";
} catch (Throwable $erro) {
    if (isset($pdo) && $pdo->inTransaction()) {
        $pdo->rollBack();
    }
    fwrite(STDERR, $erro->getMessage() . PHP_EOL);
    exit(1);
}
