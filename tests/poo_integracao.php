<?php

declare(strict_types=1);

if (PHP_SAPI !== 'cli' || getenv('DB_NAME') !== 'movi_treinos_teste') {
    fwrite(STDERR, "Use exclusivamente o banco isolado movi_treinos_teste.\n");
    exit(1);
}
require dirname(__DIR__) . '/vendor/autoload.php';

use App\Config\Database;
use App\Repositories\TreinoRepository;
use App\Repositories\VinculoProfissionalRepository;
use App\Services\TreinoService;

$pdo = Database::conectar();
$db = new TreinoRepository($pdo);
$servico = new TreinoService($db);
$verificar = static function (bool $ok, string $caso): void {
    if (!$ok) {
        throw new RuntimeException($caso);
    }
};
$email = bin2hex(random_bytes(8)) . '@example.test';
try {
    $db->transacao(function () use ($db, $email) {
        $db->inserir('usuario', ['nome' => 'Rollback', 'email' => $email, 'senha_hash' => 'teste']);
        throw new DomainException('Falha simulada após inclusão.');
    });
    throw new RuntimeException('A falha deveria ter sido propagada.');
} catch (DomainException) {
    $verificar(!$db->um('SELECT id FROM usuario WHERE email=?', [$email]), 'Rollback não desfez inclusão');
    $verificar(!$pdo->inTransaction(), 'Transação ficou aberta');
}

$u = $db->inserir('usuario', ['nome' => 'POO integração', 'email' => $email, 'senha_hash' => 'teste']);
$rotina = $servico->rotina($u, ['nome' => 'Rotina de regressão'], 'criar');
$exercicio = $db->um('SELECT id FROM exercicio WHERE ativo=1 AND usuario_id IS NULL LIMIT 1', []);
try {
    $servico->rotina($u, ['rotina_id' => $rotina, 'exercicios' => [$exercicio['id'], 2147483647]], 'adicionar');
    throw new RuntimeException('Exercício inexistente aceito.');
} catch (DomainException $erro) {
    $verificar($erro->getCode() === 404 && $db->itens($rotina, true) === [], 'Seleção parcialmente gravada');
}
$servico->rotina($u, ['rotina_id' => $rotina, 'exercicio_id' => $exercicio['id']], 'adicionar');
$item = $db->itens($rotina, true)[0];
$servico->rotina($u, ['rotina_id' => $rotina, 'item_id' => $item['id']], 'item_remover');
$verificar($db->um('SELECT id FROM exercicio WHERE id=?', [$exercicio['id']]) !== null, 'Remoção do item apagou o catálogo');

try {
    $db->transacao(fn () => $db->inserir('rotina', ['usuario_id' => 2147483647, 'nome' => 'FK inválida']));
    throw new RuntimeException('Chave estrangeira inválida aceita.');
} catch (PDOException $erro) {
    $verificar($erro->getCode() === '23000' && !$pdo->inTransaction(), 'Integridade ou rollback');
}
foreach (['usuario; DELETE', 'usuario`'] as $tabela) {
    try {
        $db->inserir($tabela, ['nome' => 'inválido']);
        throw new RuntimeException('Identificador SQL inválido aceito.');
    } catch (InvalidArgumentException) {
    }
}

// A expressão compartilhada precisa dar a mesma resposta em todos os relatórios.
$volume = static function (string $unidade, int $ignorada, ?float $peso) use ($db): mixed {
    return $db->consultar(
        'SELECT ' . TreinoRepository::VOLUME . " FROM
        (SELECT 'externa' natureza_carga, 1 usa_repeticoes, ? unidade_contagem) tr
        CROSS JOIN (SELECT 1 concluida, ? ignorada, ? peso, 10 repeticoes, 'normal' tipo) s",
        [$unidade, $ignorada, $peso]
    )->fetchColumn();
};
$verificar((float) $volume('repetições', 0, 20) === 200.0, 'Volume externo');
$verificar($volume('passos', 0, 20) === null, 'Passos tratados como repetições');
$verificar($volume('repetições', 1, 20) === null, 'Série ignorada contribuiu com volume');
$verificar($volume('repetições', 0, null) === null, 'Carga ausente virou zero');
$verificar((float) $volume('repetições', 0, 0) === 0.0, 'Carga zero foi descartada');

// Injeta uma falha na renovação para verificar atomicidade da revogação de permissões.
$profissionalUsuario = $db->inserir('usuario', ['nome' => 'Profissional POO', 'email' => 'p-' . $email, 'senha_hash' => 'teste']);
$profissional = $db->inserir('profissional', ['usuario_id' => $profissionalUsuario, 'tipo' => 'Personal Trainer']);
$vinculo = $db->inserir('vinculo_profissional', ['profissional_id' => $profissional, 'aluno_id' => $u, 'solicitado_por' => 'aluno', 'status' => 'encerrado']);
$db->inserir('permissao_acesso', ['vinculo_profissional_id' => $vinculo, 'categoria_dados' => 'treinos', 'permitido' => 1]);
$pdo->exec("CREATE TRIGGER teste_poo_falha_vinculo BEFORE UPDATE ON vinculo_profissional
    FOR EACH ROW SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Falha de teste'");
try {
    try {
        (new VinculoProfissionalRepository())->solicitar($u, 'p-' . $email, false);
        throw new RuntimeException('A falha da renovação deveria propagar.');
    } catch (PDOException) {
        $permissao = $db->um('SELECT permitido FROM permissao_acesso WHERE vinculo_profissional_id=?', [$vinculo]);
        $verificar((int) $permissao['permitido'] === 1, 'Revogação parcial não foi revertida');
        $verificar(!$pdo->inTransaction(), 'Renovação deixou transação aberta');
    }
} finally {
    $pdo->exec('DROP TRIGGER teste_poo_falha_vinculo');
}
(new VinculoProfissionalRepository())->solicitar($u, 'p-' . $email, false);
$verificar((int) $db->um('SELECT permitido FROM permissao_acesso WHERE vinculo_profissional_id=?', [$vinculo])['permitido'] === 0, 'Renovação não revogou permissão');
echo "POO MySQL: seleção atômica, catálogo independente, rollback, FK, volume e renovação de vínculo OK.\n";
