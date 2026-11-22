<?php
// Verifica o ciclo de uma proposta do modelo ao treino aceito, incluindo falha no meio da cópia e duas conexões concorrentes.

declare(strict_types=1);

use App\Config\Database;
use App\Repositories\PropostaRepository;
use App\Repositories\TreinoRepository;
use App\Repositories\VinculoProfissionalRepository;
use App\Services\PropostaService;
use App\Services\TreinoService;

require dirname(__DIR__) . '/vendor/autoload.php';
if (PHP_SAPI !== 'cli' || getenv('DB_NAME') !== 'movi_treinos_teste'
    || Database::conectar()->query('SELECT DATABASE()')->fetchColumn() !== 'movi_treinos_teste') {
    exit(1);
}

/**
 * Interrompe a suíte ao encontrar uma condição falsa, identificando o cenário que falhou.
 *
 * @param bool $condicao Resultado da afirmação testada.
 * @param string $mensagem Descrição da falha esperada na saída do teste.
 * @throws RuntimeException Se a expectativa da suíte não for atendida.
 */
function conferir(bool $condicao, string $mensagem): void
{
    if (!$condicao) {
        throw new RuntimeException($mensagem);
    }
}

/**
 * Executa a tentativa e exige uma exceção de domínio com o código esperado.
 *
 * @param callable $operacao Tentativa que deve ser bloqueada.
 * @param int $status Código esperado da exceção de domínio.
 * @throws RuntimeException Se a expectativa da suíte não for atendida.
 */
function bloqueada(callable $operacao, int $status): void
{
    try {
        $operacao();
    } catch (DomainException $erro) {
        conferir($erro->getCode() === $status, $erro->getMessage());
        return;
    }
    throw new RuntimeException('Operação deveria ter sido bloqueada.');
}

$db = new TreinoRepository(Database::conectar());
$treinos = new TreinoService($db);
$servico = new PropostaService($db);
// Cada processo simula um clique em aceitar, com sua própria conexão ao MySQL.
if (($argv[1] ?? '') === '--aceitar') {
    $servico->responder((int)$argv[2], (int)$argv[3], 'aceitar');
    exit(0);
}
$repo = new PropostaRepository($db);
$vinculos = new VinculoProfissionalRepository();
/** Gera uma chave de envio independente no mesmo formato do formulário. */
$chave = static fn () => bin2hex(random_bytes(16));
/** Insere uma conta de teste com nome do cenário e e-mail único e devolve seu ID. */
$conta = static fn ($nome) => $db->inserir('usuario', ['nome' => $nome,
    'email' => $chave() . '@example.test', 'senha_hash' => 'conta-de-teste']);
$usuario = $conta('Profissional');
$aluno = $conta('Aluno');
$outro = $conta('Outra conta');
$prof = $db->inserir('profissional', ['usuario_id' => $usuario, 'tipo' => 'Personal Trainer']);
$db->inserir('profissional', ['usuario_id' => $outro, 'tipo' => 'Personal Trainer']);
$vinculo = $db->inserir('vinculo_profissional', ['profissional_id' => $prof, 'aluno_id' => $aluno,
    'status' => 'ativo', 'iniciado_em' => '2025-01-01']);
$modelo = $treinos->rotina($usuario, ['nome' => 'Modelo inicial'], 'criar', true);
$rotina = ['rotina_id' => $modelo];
/** Aciona o serviço no modo profissional para o modelo e o proprietário deste cenário. */
$editar = static fn ($acao, $dados) => $treinos->rotina($usuario, $rotina + $dados, $acao, true);
/** Simula um novo formulário do modelo com outra chave para o mesmo destinatário. */
$enviar = static fn () => $servico->enviar($usuario, $aluno, $modelo, $chave());
$editar('editar', ['nome' => 'Treino A', 'objetivo' => 'Força', 'descricao' => 'Primeira semana', 'dia_semana' => 2]);
bloqueada($enviar, 422);
$ex = $db->um("SELECT e.* FROM exercicio e JOIN tipo_registro tr ON tr.id=e.tipo_registro_id
    WHERE e.ativo=1 AND e.usuario_id IS NULL AND tr.usa_carga=1 AND tr.usa_repeticoes=1 LIMIT 1", []);
$privado = $treinos->personalizado($usuario, ['nome' => 'Somente meu'] + array_intersect_key($ex, array_flip(['equipamento_id','grupo_muscular_id','tipo_registro_id'])));
bloqueada(fn () => $editar('adicionar', ['exercicio_id' => $privado]), 404);
$editar('adicionar', ['exercicios' => [$ex['id'], $ex['id']]]);
[$primeiro, $segundo] = $db->itens($modelo, true);
$editar('item_subir', ['item_id' => $segundo['id']]);
$dados = ['item_id' => $segundo['id']];
$editar('item_salvar', $dados + ['descanso_segundos' => 90, 'observacao' => 'Pausa', 'grupo' => 1]);
$editar('serie_adicionar', $dados + ['repeticoes_min' => 8, 'repeticoes_max' => 12, 'rir_alvo' => 2, 'carga_alvo' => 20]);
$editar('serie_adicionar', $dados + ['repeticoes_min' => 6, 'carga_alvo' => 25]);
$pessoal = ['rotina_id' => $treinos->rotina($usuario, ['nome' => 'Rotina existente'], 'criar')];
$treinos->rotina($usuario, $pessoal + ['exercicio_id' => $ex['id']], 'adicionar');
$importada = $treinos->rotina($usuario, $pessoal, 'copiar_pessoal', true);
conferir($db->planejamento($importada) == $db->planejamento($pessoal['rotina_id']), 'Cópia da rotina pessoal');
bloqueada(fn () => $treinos->rotina($outro, $pessoal, 'copiar_pessoal', true), 404);
$treinos->rotina($usuario, $pessoal + ['exercicio_id' => $privado], 'adicionar');
bloqueada(fn () => $treinos->rotina($usuario, $pessoal, 'copiar_pessoal', true), 422);
// O plano guardado antes da edição do modelo serve de referência para verificar a proposta e a cópia aceita.
$plano = $db->planejamento($modelo);
$copia = $editar('duplicar', []);
conferir($db->planejamento($copia) == $plano && $db->rotina($copia, $usuario)['modelo_profissional'], 'Duplicação do modelo');
$editar('arquivar', []);
bloqueada($enviar, 404);
$editar('restaurar', []);
bloqueada(fn () => $treinos->rotina($outro, $rotina, 'arquivar', true), 404);
bloqueada(fn () => $treinos->rotina($usuario, $rotina, 'arquivar'), 404);
bloqueada(fn () => $treinos->iniciar($usuario, $rotina), 404);
bloqueada(fn () => $servico->enviar($usuario, $outro, $modelo, $chave()), 404);
$db->atualizar('usuario', $aluno, ['ativo' => 0]);
bloqueada($enviar, 404);
$db->atualizar('usuario', $aluno, ['ativo' => 1]);
$token = $chave();
$id = $servico->enviar($usuario, $aluno, $modelo, $token);
conferir($id === $servico->enviar($usuario, $aluno, $modelo, $token), 'Reenvio do formulário');
bloqueada($enviar, 409);
conferir($repo->buscar($id, $outro, true) === null && $repo->buscar($id, $outro, false) === null, 'Detalhes privados');
bloqueada(fn () => $servico->responder($outro, $id, 'aceitar'), 404);
bloqueada(fn () => $servico->responder($aluno, $id, 'cancelar'), 404);
conferir(!$vinculos->autorizado($usuario, $aluno, 'treinos'), 'Enviar proposta concedeu leitura do histórico');
$editar('editar', ['nome' => 'Segunda versão']);
$editar('item_remover', $dados);
conferir($repo->itens($id) == $plano && $repo->buscar($id, $aluno, false)['nome'] === 'Treino A', 'Versão enviada alterada');

$db->atualizar('profissional', $prof, ['ativo' => 0]);
bloqueada($enviar, 403);
bloqueada(fn () => $editar('duplicar', []), 403);
bloqueada(fn () => $servico->responder($aluno, $id, 'aceitar'), 409);
$db->atualizar('profissional', $prof, ['ativo' => 1]);

// Um exercício pode sair do catálogo enquanto o aluno está avaliando a proposta.
$db->atualizar('exercicio', (int)$ex['id'], ['ativo' => 0]);
bloqueada(fn () => $servico->responder($aluno, $id, 'aceitar'), 409);
$db->atualizar('exercicio', (int)$ex['id'], ['ativo' => 1]);

// Força um erro de chave única na segunda série, depois que a rotina e a primeira série já foram inseridas.
$linha = $db->um('SELECT id,series FROM proposta_exercicio WHERE proposta_id=? ORDER BY ordem LIMIT 1', [$id]);
$series = json_decode($linha['series'], true, 512, JSON_THROW_ON_ERROR);
$db->atualizar('proposta_exercicio', (int)$linha['id'], ['series' => json_encode([$series[0], $series[0]], JSON_THROW_ON_ERROR)]);
try {
    $servico->responder($aluno, $id, 'aceitar');
    throw new RuntimeException('A falha simulada deveria impedir o aceite.');
} catch (PDOException $erro) {
    conferir(($erro->errorInfo[0] ?? null) === '23000', 'Erro diferente da falha simulada');
}
conferir($repo->buscar($id, $aluno, false)['status'] === 'pendente' && !$db->um('SELECT id FROM rotina WHERE usuario_id=?', [$aluno]), 'Aceite parcial');
$db->atualizar('proposta_exercicio', (int)$linha['id'], ['series' => $linha['series']]);
$processos = [];
for ($i = 0; $i < 2; $i++) {
    $processos[] = proc_open([PHP_BINARY, __FILE__, '--aceitar', (string)$aluno, (string)$id], [], $pipes);
}
foreach ($processos as $processo) {
    conferir(is_resource($processo) && proc_close($processo) === 0, 'Erro no aceite concorrente');
}
$servico->responder($aluno, $id, 'aceitar');
$aceita = (int) $repo->buscar($id, $aluno, false)['rotina_aceita_id'];
$minha = $db->rotina($aceita, $aluno);
conferir($minha['nome'] === 'Treino A' && $minha['objetivo'] === 'Força' && (int)$minha['profissional_id'] === $prof, 'Cabeçalho ou autoria');
conferir($db->planejamento($aceita) == $plano && count($db->todos('SELECT id FROM rotina WHERE usuario_id=?', [$aluno])) === 1, 'Cópia incorreta ou duplicada');
bloqueada(fn () => $treinos->rotina($usuario, ['rotina_id' => $aceita], 'arquivar', true), 404);
$recusada = $enviar();
$servico->responder($aluno, $recusada, 'recusar');
bloqueada(fn () => $servico->responder($aluno, $recusada, 'aceitar'), 409);
$pendente = $enviar();
$vinculos->encerrar($vinculo, $aluno, false);
bloqueada($enviar, 404);
bloqueada(fn () => $servico->responder($aluno, $pendente, 'aceitar'), 409);
conferir($repo->buscar($pendente, $aluno, false)['status'] === 'cancelada', 'Vínculo encerrado com proposta pendente');
$treino = $treinos->iniciar($aluno, ['rotina_id' => $aceita]);
$item = $db->itens($treino, false)[0];
$serie = $db->series($treino, false)[$item['id']][0];
$treinos->sessao($aluno, ['treino_id' => $treino, 'item_id' => $item['id'], 'serie_id' => $serie['id'],
    'estado' => 'concluida', 'peso' => 20, 'repeticoes' => 10], 'serie');
$treinos->sessao($aluno, ['treino_id' => $treino], 'finalizar');
$treinos->rotina($aluno, ['rotina_id' => $aceita], 'arquivar');
conferir($db->treino($treino, $aluno)['status'] === 'concluido' && $db->series($treino, false)[$item['id']][0]['metas'] === $serie['metas'], 'Histórico alterado');
conferir(count($repo->listar($usuario, true, $aluno, false)) === 3 && !$repo->listar($outro, true, $aluno, false), 'Histórico por aluno');

// O vínculo reutiliza o mesmo registro quando o aluno volta a ser acompanhado.
$emailAluno = $db->um('SELECT email FROM usuario WHERE id=?', [$aluno])['email'];
$vinculos->solicitar($usuario, $emailAluno, true);
$vinculos->responder($vinculo, $aluno, false, true);
bloqueada(fn () => $servico->responder($aluno, $pendente, 'aceitar'), 409);
$nova = $enviar();
$servico->responder($usuario, $nova, 'cancelar');
conferir($repo->buscar($nova, $aluno, false)['status'] === 'cancelada', 'Cancelamento pelo remetente');
echo "Propostas, permissões, cópias, histórico e rollback OK.\n";
