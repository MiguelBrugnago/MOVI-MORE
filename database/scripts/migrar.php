<?php

declare(strict_types=1);

if (PHP_SAPI !== 'cli') exit(1);
require_once dirname(__DIR__, 2) . '/vendor/autoload.php';

$pdo = null;
$bloqueado = false;
$lock = '';
try {
    $argumentos = array_slice($argv, 1);
    if ($argumentos !== [] && $argumentos !== ['--registrar-historico']) {
        throw new RuntimeException('Uso: php database/scripts/migrar.php [--registrar-historico]');
    }

    $arquivos = glob(dirname(__DIR__) . '/migrations/*.sql') ?: [];
    sort($arquivos, SORT_STRING);
    if (!$arquivos) throw new RuntimeException('Nenhuma migration encontrada.');
    $migrations = [];
    foreach ($arquivos as $i => $caminho) {
        $nome = basename($caminho);
        if (!preg_match('/^([0-9]{3})_[a-z0-9_]+\.sql$/D', $nome, $m) || (int)$m[1] !== $i + 1) {
            throw new RuntimeException("Numeração duplicada, inválida ou fora de sequência: $nome");
        }
        $sql = file_get_contents($caminho);
        if ($sql === false || trim($sql) === '') throw new RuntimeException("SQL ausente ou vazio: $nome");
        $migrations[$nome] = [$sql, hash('sha256', str_replace(["\r\n", "\r"], "\n", $sql))];
    }

    $pdo = App\Config\Database::conectar();
    $banco = $pdo->query('SELECT DATABASE()')->fetchColumn();
    if (!$banco) throw new RuntimeException('Nenhum banco selecionado.');
    $lock = hash('sha256', 'movi:migrar:' . $banco);
    $s = $pdo->prepare('SELECT GET_LOCK(?, 0)');
    $s->execute([$lock]);
    $bloqueado = (int)$s->fetchColumn() === 1;
    if (!$bloqueado) throw new RuntimeException('Já existe uma execução de migrations neste banco.');

    $temHistorico = (bool)$pdo->query("SELECT COUNT(*) FROM information_schema.TABLES
        WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='schema_migracao'")->fetchColumn();
    $objetos = (int)$pdo->query("SELECT
        (SELECT COUNT(*) FROM information_schema.TABLES WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME<>'schema_migracao') +
        (SELECT COUNT(*) FROM information_schema.EVENTS WHERE EVENT_SCHEMA=DATABASE()) +
        (SELECT COUNT(*) FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA=DATABASE())")->fetchColumn();
    if (!$temHistorico && ($objetos > 0 || $argumentos)) {
        throw new RuntimeException('Schema sem histórico confiável. Compare com um banco limpo e planeje a recuperação; nenhuma migration foi aplicada.');
    }
    if (!$temHistorico) {
        $pdo->exec("CREATE TABLE schema_migracao (
            arquivo VARCHAR(180) PRIMARY KEY,
            aplicada_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            sha256 CHAR(64) NULL,
            estado ENUM('em_execucao','aplicada') NOT NULL DEFAULT 'aplicada'
        ) ENGINE=InnoDB");
    }

    $colunas = $pdo->query('SHOW COLUMNS FROM schema_migracao')->fetchAll(PDO::FETCH_COLUMN);
    $legado = !in_array('sha256', $colunas, true) && !in_array('estado', $colunas, true);
    if (!$legado && (!in_array('sha256', $colunas, true) || !in_array('estado', $colunas, true))) {
        throw new RuntimeException('Colunas de controle inconsistentes em schema_migracao.');
    }
    $historico = $pdo->query('SELECT * FROM schema_migracao ORDER BY arquivo')->fetchAll(PDO::FETCH_UNIQUE);
    if (array_keys($historico) !== array_slice(array_keys($migrations), 0, count($historico))) {
        throw new RuntimeException('O histórico não é um prefixo exato dos arquivos locais. Confira nomes, ordem e lacunas.');
    }
    if (!$historico && $objetos > 0) {
        throw new RuntimeException('Histórico vazio em banco com objetos. Verifique possível execução incompleta.');
    }

    $semHash = [];
    foreach ($historico as $nome => $linha) {
        if (($linha['estado'] ?? 'aplicada') !== 'aplicada') {
            throw new RuntimeException("Execução incompleta: $nome. Restaure ou reconcilie a estrutura antes de continuar.");
        }
        if (!isset($linha['sha256'])) $semHash[] = $nome;
        elseif (!hash_equals($linha['sha256'], $migrations[$nome][1])) {
            throw new RuntimeException("Checksum divergente: $nome. Recupere o arquivo aplicado originalmente.");
        }
    }
    if ($semHash || $legado || $argumentos) {
        if (!$argumentos || count($historico) < 15 || !$semHash) {
            throw new RuntimeException('Histórico sem hashes verificáveis. Para um legado com 001–015 confirmadas, compare o schema e use --registrar-historico.');
        }
        if ($legado) {
            $pdo->exec("ALTER TABLE schema_migracao ADD sha256 CHAR(64) NULL,
                ADD estado ENUM('em_execucao','aplicada') NOT NULL DEFAULT 'aplicada'");
        }
        $pdo->beginTransaction();
        $s = $pdo->prepare('UPDATE schema_migracao SET sha256=? WHERE arquivo=? AND sha256 IS NULL');
        foreach ($semHash as $nome) $s->execute([$migrations[$nome][1], $nome]);
        $pdo->commit();
        echo "Hashes de referência registrados para o histórico conferido pelo operador. Nenhum SQL de migration executado.\n";
    } elseif (count($historico) > 0 && count($historico) < 9 && isset($migrations['009_simplificar_catalogo.sql'])) {
        throw new RuntimeException('Legado parcial anterior à 009. Restaure ou ensaie a transição em uma cópia; a 009 não será aplicada automaticamente.');
    } else {
        $inicio = $pdo->prepare("INSERT INTO schema_migracao (arquivo,sha256,estado) VALUES (?,?,'em_execucao')");
        $fim = $pdo->prepare("UPDATE schema_migracao SET aplicada_em=CURRENT_TIMESTAMP, estado='aplicada' WHERE arquivo=?");
        foreach (array_diff_key($migrations, $historico) as $nome => [$sql, $hash]) {
            if ($nome === '016_relogio_limpeza_login.sql') {
                $definer = $pdo->query("SELECT DEFINER FROM information_schema.EVENTS
                    WHERE EVENT_SCHEMA=DATABASE() AND EVENT_NAME='limpar_tentativas_login'")->fetchColumn();
                if (!$definer || $definer !== $pdo->query('SELECT CURRENT_USER()')->fetchColumn()) {
                    throw new RuntimeException('A 016 requer o evento de limpeza existente com DEFINER igual à conta da aplicação. Confira o guia do banco para legados.');
                }
            }
            $inicio->execute([$nome, $hash]);
            $pdo->exec($sql);
            $fim->execute([$nome]);
            echo "$nome aplicada\n";
        }
    }
} catch (Throwable $erro) {
    if ($pdo?->inTransaction()) $pdo->rollBack();
    fwrite(STDERR, $erro->getMessage() . "\nDDL pode ter commit implícito. Não apague o registro de execução sem verificar o schema.\n");
    $falhou = true;
} finally {
    if ($bloqueado) {
        $s = $pdo->prepare('SELECT RELEASE_LOCK(?)');
        $s->execute([$lock]);
    }
}
exit(isset($falhou) ? 1 : 0);
