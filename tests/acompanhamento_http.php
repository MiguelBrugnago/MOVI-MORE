<?php
declare(strict_types=1);

use App\Config\Database;
use App\Repositories\TreinoRepository;
use App\Services\PerfilFisicoService;
use App\Services\TreinoService;

if (PHP_SAPI !== 'cli' || getenv('DB_NAME') !== 'movi_treinos_teste') {
    exit(1);
}
require dirname(__DIR__) . '/vendor/autoload.php';
$db = new TreinoRepository(Database::conectar());
if ($db->consultar('SELECT DATABASE()')->fetchColumn() !== 'movi_treinos_teste') {
    exit(1);
}
require __DIR__ . '/cliente_http.php';

function verificar(bool $condicao, string $mensagem): void
{
    if (!$condicao) {
        throw new RuntimeException($mensagem);
    }
}

$anon = $cliente();
foreach (['/nutricao', '/perfil/metas', '/profissional/perfil'] as $url) {
    $anon($url, 303);
}
foreach (['aluno', 'profissional'] as $papel) {
    $email = $papel . bin2hex(random_bytes(6)) . '@example.test';
    $senha = bin2hex(random_bytes(12));
    $ids[$papel] = $db->inserir('usuario', ['nome' => $papel, 'email' => $email, 'senha_hash' => password_hash($senha, PASSWORD_DEFAULT)]);
    $http = $cliente();
    $http('/login', 303, ['csrf_token' => $token($http('/login', 200)), 'email' => $email, 'senha' => $senha]);
    $csrf = ['csrf_token' => $token($http('/perfil', 200))];
    $clientes[$papel] = $http;
    $post[$papel] = static fn ($url, $status, $dados) => $http($url, $status, $csrf + $dados);
    $emails[$papel] = $email;
}
$a = $clientes['aluno'];
$p = $clientes['profissional'];
$salvar = $post['aluno'];
$prof = $post['profissional'];
$u = $ids['aluno'];
$hoje = PerfilFisicoService::hoje();
$ontem = (new DateTimeImmutable($hoje))->modify('-1 day')->format('Y-m-d');
$pagina = '/nutricao';
$urlAluno = $pagina . '?aluno=' . $u;
$a($pagina, 403, ['acao' => 'consumo']);
$a('/nutricao?data=2026-02-30', 422);
$p($urlAluno, 403);
$alimento = ['acao' => 'alimento', 'nome' => 'Rótulo <A>', 'calorias' => '140', 'proteinas' => '4', 'carboidratos' => '22', 'gorduras' => '4'];
$salvar($pagina, 422, ['proteinas' => '-2'] + $alimento);
$salvar($pagina, 303, $alimento);
$salvar($pagina, 409, $alimento);
$comida = (int)$db->consultar('SELECT id FROM alimento WHERE usuario_id=?', [$u])->fetchColumn();
verificar(str_contains($a($pagina, 200), 'Rótulo &lt;A&gt;') && !str_contains($p($pagina, 200), 'Rótulo &lt;A&gt;'), 'Isolamento do catálogo');
$consumo = ['acao' => 'consumo', 'alimento' => $comida, 'refeicao' => 'Almoço', 'gramas' => '125', 'chave' => bin2hex(random_bytes(16)), 'data' => $ontem];
$prof($pagina, 404, $consumo);
$salvar($pagina, 422, ['gramas' => 0] + $consumo);
$salvar($pagina, 303, $consumo);
$salvar($pagina, 303, $consumo);
$linhas = $db->todos('SELECT * FROM registro_alimentar WHERE usuario_id=?', [$u]);
verificar(count($linhas) === 1 && $linhas[0]['calorias_total'] === '175.00' && $linhas[0]['proteinas_total'] === '5.00'
    && $linhas[0]['carboidratos_total'] === '27.50' && $linhas[0]['gorduras_total'] === '5.00', 'Totais e reenvio');
$prof($pagina, 404, ['acao' => 'corrigir_diario', 'id' => $linhas[0]['id']]);
$salvar($pagina, 303, ['acao' => 'preferencias', 'restricoes' => 'Observação privativa']);
$salvar($pagina, 303, ['acao' => 'plano', 'nome' => 'Plano do dia', 'calorias' => 2500]);
$idPlano = (int)$db->consultar('SELECT id FROM plano_alimentar WHERE usuario_id=? AND rascunho=1', [$u])->fetchColumn();
$publicar = ['acao' => 'publicar', 'plano' => $idPlano];
$salvar($pagina, 422, $publicar);
$salvar($pagina, 303, ['acao' => 'refeicao', 'nome' => 'Refeição provisória', 'plano' => $idPlano]);
$provisoria = (int)$db->consultar('SELECT id FROM refeicao WHERE plano_alimentar_id=?', [$idPlano])->fetchColumn();
$salvar($pagina, 303, ['acao' => 'remover_refeicao', 'refeicao' => $provisoria, 'plano' => $idPlano]);
$salvar($pagina, 303, ['acao' => 'refeicao', 'nome' => 'Jantar', 'plano' => $idPlano]);
$idRefeicao = (int)$db->consultar('SELECT id FROM refeicao WHERE plano_alimentar_id=?', [$idPlano])->fetchColumn();
$porcao = ['acao' => 'porcao', 'refeicao' => $idRefeicao, 'plano' => $idPlano, 'alimento' => $comida, 'gramas' => 50];
$prof($pagina, 404, $porcao);
$salvar($pagina, 303, $porcao);
$salvar($pagina, 303, ['acao' => 'remover_porcao'] + $porcao);
verificar((int)$db->consultar('SELECT COUNT(*) FROM refeicao_alimento WHERE refeicao_id=?', [$idRefeicao])->fetchColumn() === 0, 'Remoção de porção');
$salvar($pagina, 303, ['acao' => 'editar_plano', 'plano' => $idPlano, 'nome' => 'Plano revisado', 'calorias' => 2500]);
$salvar($pagina, 303, ['gramas' => 100] + $porcao);
$salvar($pagina, 303, $publicar);
$salvar($pagina, 404, $porcao);
$salvar($pagina, 404, ['acao' => 'remover_refeicao'] + $porcao);
verificar(str_contains($a($pagina, 200), 'Meta de 2.500,00'), 'Meta publicada');
$db->consultar('UPDATE alimento SET calorias_100g=200 WHERE id=?', [$comida]);
verificar(str_contains($a($pagina, 200), '100,00 g · 140,00 kcal'), 'Composição publicada preservada após mudança do rótulo');
$historico = $a('/nutricao?data=' . $ontem, 200);
verificar(str_contains($historico, '175,00 consumidos') && !str_contains($historico, 'Meta de 2.500,00'), 'Diário preserva data e valores do registro');

// Simula a passagem de um dia e publica um novo plano com outra meta.
$db->consultar('UPDATE plano_alimentar SET data_inicio=? WHERE id=?', [$ontem, $idPlano]);
$salvar($pagina, 303, ['acao' => 'plano', 'nome' => 'Segundo plano', 'calorias' => 2300]);
$segundo = (int)$db->consultar('SELECT id FROM plano_alimentar WHERE usuario_id=? AND rascunho=1', [$u])->fetchColumn();
$salvar($pagina, 303, ['acao' => 'refeicao', 'plano' => $segundo, 'nome' => 'Ceia']);
$ceia = (int)$db->consultar('SELECT id FROM refeicao WHERE plano_alimentar_id=?', [$segundo])->fetchColumn();
$salvar($pagina, 303, ['refeicao' => $ceia, 'plano' => $segundo] + $porcao);
$salvar($pagina, 303, ['plano' => $segundo] + $publicar);
verificar(str_contains($a('/nutricao?data=' . $ontem, 200), 'Meta de 2.500,00')
    && str_contains($a('/nutricao', 200), 'Meta de 2.300,00'), 'Metas históricas do plano');

$prof('/profissional/cadastro', 303, ['tipo' => 'Nutricionista']);
$prof('/profissional/perfil', 303, ['especialidade' => 'Alimentação esportiva', 'descricao' => '<perfil>']);
verificar(str_contains($p('/profissional/perfil', 200), '&lt;perfil&gt;'), 'Perfil profissional');
$salvar('/vinculos/solicitar', 303, ['email' => $emails['profissional']]);
$vinculo = (int)$db->consultar('SELECT id FROM vinculo_profissional WHERE aluno_id=?', [$u])->fetchColumn();
$db->consultar('UPDATE usuario SET ativo=0 WHERE id=?', [$u]);
$prof('/vinculos/responder', 303, ['modo' => 'profissional', 'vinculo_id' => $vinculo, 'acao' => 'aceitar']);
verificar($db->consultar('SELECT status FROM vinculo_profissional WHERE id=?', [$vinculo])->fetchColumn() === 'pendente', 'Vínculo com aluno inativo');
$db->consultar('UPDATE usuario SET ativo=1 WHERE id=?', [$u]);
$prof('/vinculos/responder', 303, ['modo' => 'profissional', 'vinculo_id' => $vinculo, 'acao' => 'aceitar']);
verificar(!str_contains($p('/alunos?q=inexistente', 200), $emails['aluno']) && str_contains($p('/alunos?q=alu', 200), $emails['aluno']), 'Filtro de alunos');
$p($urlAluno, 403);
$permissao = ['acao' => 'permissao', 'id' => $vinculo, 'categoria' => 'nutricao', 'permitir' => '1'];
$salvar('/perfil', 303, $permissao);
$html = $p($urlAluno, 200);
verificar(str_contains($html, 'Observação privativa') && !str_contains($html, 'Salvar porção'), 'Consentimento alimentar de leitura');
$prof($urlAluno, 403, $consumo);
$salvar('/perfil', 303, ['permitir' => '0'] + $permissao);
$p($urlAluno, 403);
$salvar('/perfil', 303, $permissao);
$prof('/vinculos/encerrar', 303, ['modo' => 'profissional', 'vinculo_id' => $vinculo]);
$p($urlAluno, 403);

$ex = (int)$db->consultar("SELECT e.id FROM exercicio e JOIN tipo_registro tr ON tr.id=e.tipo_registro_id
    WHERE e.ativo=1 AND e.usuario_id IS NULL AND tr.usa_carga=1 AND tr.usa_repeticoes=1 LIMIT 1")->fetchColumn();
$acessorio = $db->um('SELECT e.id,e.nome,a.equipamento_id,q.nome acessorio FROM exercicio e
    JOIN exercicio_equipamento_adicional a ON a.exercicio_id=e.id JOIN equipamento q ON q.id=a.equipamento_id
    WHERE e.ativo=1 AND e.usuario_id IS NULL AND a.equipamento_id<>e.equipamento_id ORDER BY e.id LIMIT 1', []);
verificar(str_contains($a('/exercicios/ver?id=' . $acessorio['id'], 200), htmlspecialchars($acessorio['acessorio'], ENT_QUOTES, 'UTF-8')), 'Equipamento adicional nos detalhes');
verificar(str_contains($a('/exercicios?' . http_build_query(['equipamento' => $acessorio['equipamento_id'], 'q' => $acessorio['nome']]), 200),
    '/exercicios/ver?id=' . $acessorio['id'] . '"'), 'Filtro pelo acessório');
$marcar = ['id' => $ex, 'favorito' => '1'];
$salvar('/exercicios/favorito', 303, $marcar);
$salvar('/exercicios/favorito', 303, $marcar);
verificar(str_contains($a('/exercicios?favoritos=1', 200), '1 exercícios encontrados')
    && str_contains($p('/exercicios?favoritos=1', 200), '0 exercícios encontrados'), 'Favoritos por conta');
$salvar('/exercicios/favorito', 303, ['favorito' => '0'] + $marcar);
verificar(str_contains($a('/exercicios?favoritos=1', 200), '0 exercícios encontrados'), 'Remoção de favorito');

$meta = ['alvo' => '1', 'inicio' => $hoje, 'fim' => $hoje];
$salvar('/perfil/metas', 422, ['fim' => $ontem] + $meta);
$salvar('/perfil/metas', 303, $meta);
$salvar('/perfil/metas', 303, $meta);
verificar((int)$db->consultar('SELECT COUNT(*) FROM meta WHERE usuario_id=?', [$u])->fetchColumn() === 1, 'Meta duplicada');
$svc = new TreinoService($db);
$treino = $svc->iniciar($u, []);
$svc->sessao($u, ['treino_id' => $treino, 'exercicio_id' => $ex], 'exercicio');
$item = $db->itens($treino, false)[0]['id'];
$svc->sessao($u, ['treino_id' => $treino, 'item_id' => $item, 'chave' => bin2hex(random_bytes(16)), 'repeticoes' => 8, 'peso' => 15], 'serie');
$svc->sessao($u, ['treino_id' => $treino], 'finalizar');
$svc->sessao($u, ['treino_id' => $treino], 'finalizar');
for ($i = 0; $i < 2; $i++) {
    $html = $a('/perfil/metas', 200);
    verificar(str_contains($html, '10 XP ·') && str_contains($html, 'Meta alcançada') && str_contains($html, 'Primeiro treino · Conquistado'), 'XP, metas e conquistas');
}
verificar(str_contains($p('/perfil/metas', 200), '0 XP ·'), 'XP isolado');
verificar(str_contains($a('/treinos/analise', 200), 'Extras realizadas: 1'), 'Séries extras na análise');
$svc->sessao($u, ['treino_id' => $treino], 'excluir');
$idCancelado = $svc->iniciar($u, []);
$svc->sessao($u, ['treino_id' => $idCancelado], 'cancelar');
verificar(str_contains($a('/perfil/metas', 200), '0 XP ·') && !str_contains($a('/perfil/metas', 200), 'Meta alcançada'), 'Estorno de progresso');
for ($i = 0; $i < 10; $i++) {
    $t = $svc->iniciar($u, []);
    $svc->sessao($u, ['treino_id' => $t, 'exercicio_id' => $ex], 'exercicio');
    $item = $db->itens($t, false)[0]['id'];
    $svc->sessao($u, ['treino_id' => $t, 'item_id' => $item, 'chave' => bin2hex(random_bytes(16)), 'repeticoes' => 5, 'peso' => 20], 'serie');
    $svc->sessao($u, ['treino_id' => $t], 'finalizar');
}
$html = $a('/perfil/metas', 200);
verificar(str_contains($html, 'Nível 2') && str_contains($html, '100 XP ·') && str_contains($html, 'Cinco treinos · Conquistado'), 'Mudança de nível e conquista');
$salvar('/perfil/metas', 303, ['tipo' => 'peso_maximo', 'alvo' => '80.5'] + $meta);
verificar(str_contains($a('/perfil/metas', 200), 'Sem peso registrado no período'), 'Peso ausente');
$salvar('/perfil/avaliacoes', 303, ['acao' => 'avaliacao', 'avaliado_em' => $hoje, 'peso' => '82.5']);
verificar(str_contains($a('/perfil/metas', 200), 'Distância ao alvo: 2,00 kg'), 'Progresso de peso');
echo "Nutrição, permissões, favoritos, metas, XP e perfil profissional OK.\n";
