<?php
// Testa contratos de métricas, entidades, validações e roteamento em memória, sem abrir conexão com o banco.

declare(strict_types=1);

require dirname(__DIR__) . '/vendor/autoload.php';

use App\Contracts\MetricaInterface;
use App\Models\Exercicio;
use App\Models\Metricas\MetricaDecimal;
use App\Models\Metricas\MetricaInteira;
use App\Models\Metricas\MetricaNumerica;
use App\Models\Rotina;
use App\Models\SerieExecutada;
use App\Models\Treino;
use App\Services\RegistroTreino;
use App\Services\AnaliseTreinoService;

$verificacoes = 0;
/** Conta a verificação aprovada ou interrompe a suíte com o nome do caso. */
$conferir = static function (bool $ok, string $caso) use (&$verificacoes): void {
    if (!$ok) {
        throw new RuntimeException($caso);
    }
    $verificacoes++;
};
// Uma entrada inválida precisa produzir a classe de exceção esperada e, quando informado, o código da regra de domínio.
/** Compara o tipo e, quando informado, o código da exceção produzida pelo caso de teste. */
$rejeitar = static function (callable $acao, string $tipo = InvalidArgumentException::class, ?int $codigo = null) use ($conferir): void {
    try {
        $acao();
    } catch (Throwable $erro) {
        $conferir($erro instanceof $tipo && ($codigo === null || $erro->getCode() === $codigo), 'Exceção inesperada: ' . $erro->getMessage());
        return;
    }
    throw new RuntimeException('Entrada ou operação inválida aceita.');
};

// O mesmo consumidor preserva a representação e os limites de cada especialização.
/** Lê a medição pelo contrato compartilhado, preservando o tipo concreto e o valor ausente. */
$ler = static fn (MetricaInterface $metrica): int|float|null => $metrica->valor();
$conferir($ler(new MetricaInteira('12', 1, 100)) === 12, 'Repetições inteiras');
$conferir($ler(new MetricaDecimal('12.50', 0, 100)) === 12.5, 'Carga decimal');
$conferir($ler(new MetricaDecimal('0', 0, 100)) === 0.0, 'Carga zero');
$conferir($ler(new MetricaInteira(null, 1, 100)) === null, 'Ausência');
$conferir((new ReflectionClass(MetricaNumerica::class))->isAbstract(), 'Base abstrata');
foreach (['-1', '1e2', 'NaN', INF, NAN, [], true, ' 1', '1 ', '1,5', '101'] as $valor) {
    $rejeitar(fn () => new MetricaInteira($valor, 0, 100));
    $rejeitar(fn () => new MetricaDecimal($valor, 0, 100));
}
$rejeitar(fn () => new MetricaInteira('1.5', 0, 100));
$rejeitar(fn () => new MetricaDecimal('1.234', 0, 100));
$rejeitar(fn () => new MetricaDecimal(1, 0, 100, 0));
$rejeitar(fn () => new MetricaInteira(1, 10, 0));

$registro = ['usa_carga' => 1, 'usa_repeticoes' => 1];
$entrada = ['peso' => '25.50', 'repeticoes' => '8', 'duracao_segundos' => '-99'];
$serie = new SerieExecutada($entrada, $registro, 'concluida');
$dados = $serie->paraPersistencia();
$conferir($dados['peso'] === 25.5 && $dados['repeticoes'] === 8 && $dados['duracao_segundos'] === null, 'Modalidade e conversão');
$entrada['peso'] = '-1';
$dados['peso'] = -1;
$conferir($serie->paraPersistencia()['peso'] === 25.5, 'Estado encapsulado, sem alias de arrays');
$conferir(RegistroTreino::execucao(['repeticoes' => 8], $registro, 'concluida')['peso'] === null, 'Carga pode ficar ausente');
$conferir(RegistroTreino::execucao([], $registro, 'pendente')['concluida'] === 0, 'Rascunho incompleto');
$conferir(RegistroTreino::execucao([], $registro, 'ignorada')['ignorada'] === 1, 'Série ignorada');
foreach (['pendente', 'concluida', 'ignorada'] as $estado) {
    $rejeitar(fn () => new SerieExecutada(['peso' => -1], $registro, $estado));
}
$rejeitar(fn () => new SerieExecutada([], $registro, 'concluida'));
$rejeitar(fn () => new SerieExecutada([], [], 'inexistente'));
$rejeitar(fn () => new SerieExecutada(['lado' => []], [], 'pendente'));
$rejeitar(fn () => RegistroTreino::metas(['repeticoes_min' => 12, 'repeticoes_max' => 8], $registro));

// As medições são criadas internamente, não são compartilhadas por séries distintas.
$ref = new ReflectionProperty(SerieExecutada::class, 'metricas');
$outraSerie = new SerieExecutada(['repeticoes' => 8], $registro, 'concluida');
$conferir($ref->isPrivate(), 'Coleção composta privada');
$a = $ref->getValue($serie);
$b = $ref->getValue($outraSerie);
foreach ($a as $campo => $metrica) {
    $conferir($metrica !== $b[$campo] && $metrica instanceof MetricaInterface, 'Medições de propriedade exclusiva');
}

$exercicio = new Exercicio(1, 'Supino');
$rotina = new Rotina(true);
$outra = new Rotina(true);
$rotina->adicionar($exercicio);
$outra->adicionar($exercicio);
$conferir($rotina->exercicios()[0] === $outra->exercicios()[0], 'Agregação compartilha exercício independente');
unset($rotina);
$conferir($exercicio->nome() === 'Supino' && $outra->exercicios()[0]->id() === 1, 'Catálogo sobrevive à rotina');
$rejeitar(fn () => (new Rotina(false))->adicionar($exercicio), DomainException::class, 409);
$rejeitar(fn () => new Exercicio(0, 'Supino'));

$treino = new Treino('em_andamento');
$rejeitar(fn () => $treino->finalizar(false), DomainException::class, 422);
$conferir($treino->status() === 'em_andamento', 'Falha não muda estado');
$rejeitar(fn () => $treino->autorizar('excluir'), DomainException::class, 409);
$treino->finalizar(true);
$conferir($treino->status() === 'concluido' && !$treino->autorizar('finalizar'), 'Transição e reenvio idempotente');
$conferir($treino->autorizar('serie') && $treino->autorizar('notas'), 'Correção de histórico permitida');
$rejeitar(fn () => $treino->autorizar('exercicio'), DomainException::class, 409);
foreach (['cancelado', 'excluido'] as $estado) {
    $rejeitar(fn () => (new Treino($estado))->autorizar('serie'), DomainException::class, 409);
}
$rejeitar(fn () => new Treino('inventado'));
$rejeitar(fn () => AnaliseTreinoService::calcular([], [], [], [], 0));

// Verifica contratos do roteador sem autenticar ou abrir uma conexão com o banco.
foreach (require dirname(__DIR__) . '/routes/web.php' as $rotas) {
    foreach ($rotas as [$classe, $metodo]) {
        $conferir(class_exists($classe) && (new ReflectionMethod($classe, $metodo))->isPublic(), 'Rota e autoload: ' . $classe . '::' . $metodo);
    }
}
echo "POO: $verificacoes verificações aprovadas.\n";
