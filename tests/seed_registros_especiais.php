<?php
// Compara todas as linhas de exercício depois de executar a seed duas vezes e reverte os dados montados para o teste.

declare(strict_types=1);

use App\Config\Database;

require dirname(__DIR__) . '/vendor/autoload.php';
if (PHP_SAPI !== 'cli' || getenv('DB_NAME') !== 'movi_treinos_teste') {
    exit(1);
}
$pdo = Database::conectar();
if ($pdo->query('SELECT DATABASE()')->fetchColumn() !== 'movi_treinos_teste') {
    exit(1);
}
// Simula a falha de leitura antes da primeira escrita. A substituição de glob vale só neste processo filho.
$simulacao = 'function glob(string $pattern, int $flags = 0): false { return false; }'
    . ' require ' . var_export(dirname(__DIR__) . '/database/scripts/popular_exercicios.php', true) . ';';
$processo = proc_open([PHP_BINARY, '-d', 'disable_functions=glob', '-r', $simulacao],
    [2 => ['pipe', 'w']], $pipes);
if (!is_resource($processo)) {
    throw new RuntimeException('Falha ao iniciar o teste do importador.');
}
$mensagem = stream_get_contents($pipes[2]);
fclose($pipes[2]);
if (proc_close($processo) !== 1 || trim((string)$mensagem) !== 'Não foi possível listar os arquivos de seeds.') {
    throw new RuntimeException('O importador não identificou a falha de leitura do diretório.');
}

$seed = file_get_contents(dirname(__DIR__) . '/database/seeds/07_registros_especiais.sql');
/** Lê todas as colunas na ordem do ID para comparar o estado integral após cada execução da seed. */
$exercicios = static fn () => $pdo->query('SELECT * FROM exercicio ORDER BY id')->fetchAll();
$pdo->beginTransaction();
try {
    $tipos = $pdo->query('SELECT codigo, id FROM tipo_registro')->fetchAll(PDO::FETCH_KEY_PAIR);
    $pdo->exec("INSERT INTO usuario (nome,email,senha_hash) VALUES ('Teste seed','seed@example.test','teste')");
    $usuario = $pdo->lastInsertId();
    $inserir = $pdo->prepare("INSERT INTO exercicio
        (codigo, usuario_id, nome, nome_ingles, modalidade, tipo_registro_id, descricao, equipamento_id, grupo_muscular_id)
        SELECT ?, ?, ?, ?, ?, ?, descricao, equipamento_id, grupo_muscular_id FROM exercicio WHERE codigo='movi_4377a52b'");
    foreach ([
        ['teste_nome', $usuario, 'Stair Machine (Floors)', 'cardio'],
        ['teste_modalidade', $usuario, 'Personalizado', 'calistenia'],
        ['teste_isometria', null, 'Público de teste', 'calistenia'],
        ['teste_homonimo', null, 'Stair Machine (Steps)', 'cardio'],
    ] as [$codigo, $dono, $nome, $modalidade]) {
        $inserir->execute([$codigo, $dono, $nome, $nome, $modalidade, $tipos['duracao']]);
        if ($inserir->rowCount() !== 1) {
            throw new RuntimeException('Exercício de referência ausente.');
        }
    }
    $preparar = $pdo->prepare("UPDATE exercicio SET nome_ingles='Nome revisado', tipo_registro_id=?
        WHERE codigo IN ('movi_4377a52b','movi_4377a52c') AND usuario_id IS NULL");
    $preparar->execute([$tipos['duracao']]);
    if ($preparar->rowCount() !== 2) {
        throw new RuntimeException('Os dois exercícios de escada precisam existir no catálogo de teste.');
    }
    // O resultado esperado muda só o tipo dos exercícios selecionados. A comparação também detecta alterações indevidas no restante do catálogo.
    $destinos = ['movi_4377a52b' => 'andares_duracao', 'movi_4377a52c' => 'passos_duracao', 'teste_isometria' => 'isometria'];
    $esperado = $exercicios();
    foreach ($esperado as $i => $linha) {
        if (isset($destinos[$linha['codigo']])) {
            $esperado[$i]['tipo_registro_id'] = $tipos[$destinos[$linha['codigo']]];
        }
    }
    for ($vez = 1; $vez <= 2; $vez++) {
        $pdo->exec($seed);
        if ($exercicios() !== $esperado) {
            throw new RuntimeException("Estado inesperado dos exercícios após a execução $vez do seed 07.");
        }
    }
} finally {
    $pdo->rollBack();
}
echo "Seed 07: classificação pública, isolamento dos personalizados e reexecução OK.\n";
