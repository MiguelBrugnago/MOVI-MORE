<?php

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
$seed = file_get_contents(dirname(__DIR__) . '/database/seeds/07_registros_especiais.sql');
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
