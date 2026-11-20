<?php

declare(strict_types=1);
if (PHP_SAPI !== 'cli' || getenv('DB_NAME') !== 'movi_treinos_teste') {
    fwrite(STDERR, "Use somente movi_treinos_teste.\n");
    exit(1);
}
require __DIR__ . '/analise_unitario.php';
use App\Config\Database;
use App\Repositories\{TreinoRepository,AnaliseTreinoRepository};
use App\Services\AnaliseTreinoService as A;
use App\Services\MapaMuscular;

$pdo = Database::conectar();
$db = new TreinoRepository($pdo);
$r = new AnaliseTreinoRepository($db);
$pdo->beginTransaction();
try {
    $u = $db->inserir('usuario', ['nome' => 'Teste análise', 'email' => uniqid('analise') . '@example.test', 'senha_hash' => 'teste']);
    $ex = $db->um("SELECT e.* FROM exercicio e JOIN tipo_registro tr ON tr.id=e.tipo_registro_id WHERE tr.natureza_carga='externa' AND tr.unidade_contagem='repetições' AND tr.usa_repeticoes=1 LIMIT 1", []);
    $musculos = array_column($r->catalogo(), 'id', 'codigo');
    $privado = $db->inserir('exercicio', ['usuario_id' => $u, 'codigo' => uniqid('analise_'), 'nome' => 'Exercício sintético', 'descricao' => '', 'grupo_muscular_id' => $ex['grupo_muscular_id'], 'tipo_registro_id' => $ex['tipo_registro_id'], 'equipamento_id' => $ex['equipamento_id']]);
    $db->inserir('exercicio_musculo', ['exercicio_id' => $privado, 'musculo_id' => $musculos['peitoral_maior'], 'papel' => 'primario']);
    $db->inserir('exercicio_musculo', ['exercicio_id' => $privado, 'musculo_id' => $musculos['triceps_braquial'], 'papel' => 'secundario']);
    $periodo = A::periodo(['periodo' => 'personalizado', 'de' => '2026-01-02', 'ate' => '2026-01-02'], new DateTimeImmutable('2026-11-18'));
    $sessao = static function (string $status, int $fim) use ($db, $u): int {
        $db->consultar('INSERT INTO treino (usuario_id,status,iniciado_em,finalizado_em) VALUES (?,?,FROM_UNIXTIME(?),FROM_UNIXTIME(?))', [$u, $status, $fim - 3600, $fim]);
        return (int)$db->consultar('SELECT LAST_INSERT_ID()')->fetchColumn();
    };
    $serie = static function (int $t, array $dados = [], ?int $e = null) use ($db, $privado): void {
        $x = $db->inserir('treino_exercicio', ['treino_id' => $t, 'exercicio_id' => $e ?? $privado, 'ordem' => (int)$db->consultar('SELECT COALESCE(MAX(ordem),0)+1 FROM treino_exercicio WHERE treino_id=?', [$t])->fetchColumn()]);
        $db->inserir('serie', array_replace(['treino_exercicio_id' => $x, 'numero' => 1, 'peso' => 20, 'repeticoes' => 10, 'concluida' => 1, 'ignorada' => 0, 'tipo' => 'normal'], $dados));
    };
    $t = $sessao('concluido', $periodo['inicio']);
    $serie($t);
    $serie($t, ['peso' => null]);
    $serie($t, ['tipo' => 'aquecimento']);
    $serie($t, ['tipo' => 'preparatoria']);
    $serie($t, ['concluida' => 0]);
    $serie($t, ['ignorada' => 1]);
    $serie($sessao('cancelado', $periodo['inicio'] + 1));
    $serie($sessao('em_andamento', $periodo['inicio'] + 2));
    $serie($sessao('excluido', $periodo['inicio'] + 3));
    $serie($sessao('concluido', $periodo['fim']));
    $serie($sessao('concluido', $periodo['inicio'] - 1), ['peso' => 15]);
    $start = hrtime(true);
    $dados = A::calcular($r->catalogo(), $r->relacoes($u, $periodo['inicio'], $periodo['fim']), $r->sessoes($u, $periodo['inicio'], $periodo['fim']), $r->execucoes($u, $periodo['inicio'], $periodo['fim']), 1);
    conferirAnalise($dados['total']['treinos'] === 1 && $dados['total']['series'] === 2, 'Filtros SQL elegíveis e limites de dia');
    conferirAnalise($dados['volumes'][$privado . ':nao_informado']['volume'] === 200.0, 'Carga ausente excluída');
    conferirAnalise($dados['musculos'][$musculos['triceps_braquial']]['equivalentes'] === 1.0, 'Ponderação SQL + serviço');
    conferirAnalise(count($r->seriesExercicio($u, $privado, $periodo['inicio'], $periodo['fim'])) === 2, 'Séries detalhadas elegíveis');
    conferirAnalise((float)$r->melhoresPorRepeticoes($u, $privado, $periodo['inicio'], $periodo['fim'])[0]['carga'] === 20.0, 'Melhor carga por repetição');
    conferirAnalise((float)$r->recordeAnterior($u, $privado, $periodo['inicio'])[0]['carga'] === 15.0, 'Recorde anterior ao intervalo');
    conferirAnalise(!$r->execucoes($u + 1, $periodo['inicio'], $periodo['fim']), 'Proprietário isolado');
    foreach ($r->catalogo() as $m) {
        conferirAnalise(MapaMuscular::chave($m) !== null, 'Catálogo sem mapeamento: ' . $m['codigo']);
    }
    // Segunda sessão e exercício sem associação: mantém total sem inventar estímulo.
    $sem = $db->inserir('exercicio', ['usuario_id' => $u, 'codigo' => uniqid('sem_'), 'nome' => 'Sem músculos', 'descricao' => '', 'grupo_muscular_id' => $ex['grupo_muscular_id'], 'tipo_registro_id' => $ex['tipo_registro_id'], 'equipamento_id' => $ex['equipamento_id']]);
    $serie($sessao('concluido', $periodo['inicio'] + 3600), [], $sem);
    $dados = A::calcular($r->catalogo(), $r->relacoes($u, $periodo['inicio'], $periodo['fim']), $r->sessoes($u, $periodo['inicio'], $periodo['fim']), $r->execucoes($u, $periodo['inicio'], $periodo['fim']), 1);
    conferirAnalise($dados['total']['treinos'] === 2 && $dados['total']['series'] === 3 && count($dados['semRelacao']) === 1, 'Várias sessões e relação ausente');
    foreach ([['adicional', 'repetições'], ['assistencia', 'repetições'], ['externa', 'passos']] as [$natureza,$unidade]) {
        $tr = $db->inserir('tipo_registro', ['codigo' => uniqid('tipo_'), 'nome' => uniqid('Tipo '), 'usa_repeticoes' => 1, 'usa_carga' => 1, 'usa_duracao' => 0, 'usa_distancia' => 0, 'natureza_carga' => $natureza, 'unidade_contagem' => $unidade]);
        $e = $db->inserir('exercicio', ['usuario_id' => $u, 'codigo' => uniqid('modal_'), 'nome' => 'Outra medição', 'descricao' => '', 'grupo_muscular_id' => $ex['grupo_muscular_id'], 'tipo_registro_id' => $tr, 'equipamento_id' => $ex['equipamento_id']]);
        $serie($t, [], $e);
        $linhas = array_values(array_filter($r->execucoes($u, $periodo['inicio'], $periodo['fim']), static fn ($x) => (int)$x['exercicio_id'] === $e));
        conferirAnalise($linhas[0]['volume'] === null, 'Não mistura natureza de carga ou passos');
        if ($unidade === 'passos') {
            conferirAnalise($linhas[0]['repeticoes'] === null, 'Passos não são repetições');
        }
    }
    printf("OK: integração MySQL, elegibilidade, volume, progressão, catálogo e isolamento (%.1f ms).\n", (hrtime(true) - $start) / 1e6);
} finally {
    $pdo->rollBack();
}
