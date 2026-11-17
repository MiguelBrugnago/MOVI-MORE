<?php
declare(strict_types=1);

use App\Config\Database;
use App\Repositories\ExercicioRepository;
use App\Repositories\TreinoRepository;
use App\Services\TreinoService;

require dirname(__DIR__).'/vendor/autoload.php';

if (PHP_SAPI !== 'cli' || getenv('DB_NAME') !== 'movi_treinos_teste') {
    fwrite(STDERR,"Use exclusivamente o banco descartável movi_treinos_teste.\n");
    exit(1);
}

function verificar(bool $ok,string $nome): void {
    if (!$ok) throw new RuntimeException($nome);
}
function rejeitar(callable $fn,int $status): void {
    try { $fn(); } catch (DomainException $e) { verificar($e->getCode()===$status,$e->getMessage()); return; }
    throw new RuntimeException('A operação deveria ter sido bloqueada.');
}
function medir(string $nome,callable $acao): mixed {
    $ms = hrtime(true);
    $valor = $acao();
    printf("%s: %.1f ms\n",$nome,(hrtime(true)-$ms)/1e6);
    return $valor;
}

$db = new TreinoRepository(Database::conectar());
$svc = new TreinoService($db);
$sufixo = bin2hex(random_bytes(6));
$credenciais = ['nome'=>'Teste MOVI','senha_hash'=>password_hash('Treino-local-123',PASSWORD_DEFAULT)];
$u = $db->inserir('usuario',$credenciais+['email'=>"treino-$sufixo@example.test"]);
$outro = $db->inserir('usuario',$credenciais+['email'=>"outro-$sufixo@example.test"]);
$catalogo = new ExercicioRepository();
$f = ['q'=>'supino','grupo'=>'','equipamento'=>'','modalidade'=>'','ordem'=>'az','pagina'=>1,'musculo'=>'','ambiente'=>''];
$a = medir('Pesquisa inicial',fn()=>$catalogo->pesquisar($u,$f));
medir('Pesquisa repetida',fn()=>$catalogo->pesquisar($u,$f));
verificar($a['total']>0 && count($a['itens'])<=24,'Paginação do catálogo');
$e = $db->um("SELECT e.id,e.equipamento_id,e.grupo_muscular_id,e.tipo_registro_id FROM exercicio e JOIN tipo_registro tr ON tr.id=e.tipo_registro_id
    WHERE e.usuario_id IS NULL AND e.ativo=1 AND tr.natureza_carga='externa' AND tr.usa_repeticoes=1 ORDER BY e.id LIMIT 1",[]);
$privado = $svc->personalizado($u,['nome'=>'Exercício privado','id'=>null]+$e);
verificar($catalogo->buscarPorId($privado,$outro)===null,'Exercício privado exposto');
rejeitar(fn()=>$svc->personalizado($outro,['id'=>$privado,'nome'=>'Invasão']),404);
$svc->personalizado($u,['id'=>$privado,'nome'=>'Exercício privado atualizado']+$e);

$r = medir('Criar rotina',fn()=>$svc->rotina($u,['nome'=>'Rotina de integração','dia_semana'=>1],'criar'));
$rp = ['rotina_id'=>$r];
rejeitar(fn()=>$svc->rotina($outro,$rp,'arquivar'),404);
try {
    $svc->rotina($u,$rp+['exercicios'=>[$e['id'],PHP_INT_MAX]],'adicionar');
    throw new RuntimeException('ID inválido aceito');
} catch (InvalidArgumentException) {}
verificar(!$db->itens($r,true),'Rollback da seleção múltipla');
$svc->rotina($u,$rp+['exercicios'=>[$e['id'],$privado]],'adicionar');
[$x,$segundo] = $db->itens($r,true);
$svc->rotina($u,$rp+['item_id'=>$segundo['id']],'item_subir');
verificar((int)$db->itens($r,true)[0]['id']===(int)$segundo['id'],'Ordenação de exercícios');
$item = $rp+['item_id'=>$x['id']];
$svc->rotina($u,$item+['descanso_segundos'=>60,'grupo'=>1,'observacao'=>'Ajustar banco'],'item_salvar');
$svc->rotina($u,$item+['carga_alvo'=>'42.50','repeticoes_min'=>6,'repeticoes_max'=>9,'tipo'=>'drop'],'serie_adicionar');
$planejada = $db->series($r,true)[$x['id']][0];
$svc->rotina($u,$item+['serie_id'=>$planejada['id']],'serie_duplicar');
$duplicada = $db->series($r,true)[$x['id']][1];
$svc->rotina($u,$item+['serie_id'=>$duplicada['id']],'serie_subir');
$svc->rotina($u,$item+['serie_id'=>$duplicada['id']],'serie_remover');
$copia = $svc->rotina($u,$rp,'duplicar');
verificar($copia!==$r && count($db->itens($copia,true))===2 && count($db->series($copia,true))===1,'Duplicação de itens e séries');
$t = medir('Início da sessão',fn()=>$svc->iniciar($u,$rp));
verificar($svc->iniciar($u,$rp)===$t,'Início repetido criou outra sessão');
verificar($db->ativo($u)['id']===$t,'Sessão ativa não pode ser retomada');
$svc->rotina($u,$rp+['nome'=>'Rotina editada'],'editar');
$svc->rotina($u,$item,'item_remover');
$svc->rotina($u,$rp,'arquivar');
verificar($db->treino($t,$u)['nome']==='Rotina de integração','Sessão mudou após edição da rotina');
$exec = $db->itens($t,false)[1];
$serie = $db->series($t,false)[$exec['id']][0];
verificar(json_decode($serie['metas'],true)['repeticoes_max']===9 && $serie['peso']===null,'Meta não foi isolada da execução');
$tp = ['treino_id'=>$t,'item_id'=>$exec['id']];
rejeitar(fn()=>$svc->sessao($outro,$tp,'finalizar'),404);
rejeitar(fn()=>$svc->sessao($u,$tp,'finalizar'),422);
try {
    $svc->sessao($u,$tp+['serie_id'=>$serie['id'],'peso'=>'-1','repeticoes'=>8],'serie');
    throw new RuntimeException('Carga negativa aceita');
} catch (InvalidArgumentException) {}
$valores = ['peso'=>'42.50','repeticoes'=>8,'rir'=>1,'rpe'=>'9.5','lado'=>'esquerdo','tipo'=>'drop'];
medir('Registro de série',fn()=>$svc->sessao($u,$tp+['serie_id'=>$serie['id']]+$valores,'serie'));
verificar((int)$db->treino($t,$u)['descanso']>time(),'Descanso automático não persistiu');
$novo = $tp+['chave'=>bin2hex(random_bytes(16))]+$valores;
$svc->sessao($u,$novo,'serie');
$svc->sessao($u,$novo,'serie');
verificar(count($db->series($t,false)[$exec['id']])===2,'Série duplicada por requisição repetida');
medir('Finalização',fn()=>$svc->sessao($u,$tp,'finalizar'));
$fim = $db->treino($t,$u)['finalizado_em'];
$svc->sessao($u,$tp,'finalizar');
verificar($db->treino($t,$u)['finalizado_em']===$fim && !$db->ativo($u),'Finalização não idempotente');
$svc->sessao($u,$tp+['serie_id'=>$serie['id'],'peso'=>'40.00']+$valores,'serie');
verificar($db->series($t,false)[$exec['id']][0]['peso']==='40.00','Correção não persistiu');
[,,$agregado] = $db->estatisticas($u,(int)$e['id']);
verificar((float)$agregado['volume']===660.0,'Volume não refletiu a correção');
$medalhas = $db->recordesDaSessao($u,$t,$fim);
verificar(count($medalhas)===3,'Recordes de carga, volume e contagem não calculados');

$livre = $svc->iniciar($u,[]);
$svc->sessao($u,['treino_id'=>$livre,'exercicio_id'=>$e['id']],'exercicio');
verificar(count($db->anterior($u,$livre)[$e['id']])===2,'Última execução ausente');
verificar(!$db->anterior($outro,$livre),'Execução de outro usuário exposta');
$svc->sessao($u,['treino_id'=>$livre],'cancelar');
verificar($db->treino($livre,$u)['status']==='cancelado','Cancelamento falhou');
$svc->sessao($u,$tp,'excluir');
verificar($db->treino($t,$u)['status']==='excluido','Exclusão lógica falhou');
[,, $semExcluido] = $db->estatisticas($u,(int)$e['id']);
verificar($semExcluido['volume']===null,'Treino excluído ainda contribui com volume');

$tempo = $db->um("SELECT e.id,tr.usa_distancia,tr.usa_repeticoes FROM exercicio e JOIN tipo_registro tr ON tr.id=e.tipo_registro_id
    WHERE e.usuario_id IS NULL AND e.ativo=1 AND tr.usa_duracao=1 AND tr.usa_carga=0 AND tr.usa_repeticoes=0 LIMIT 1",[]);
$livre = $svc->iniciar($u,[]);
$svc->sessao($u,['treino_id'=>$livre,'exercicio_id'=>$tempo['id']],'exercicio');
$exec = $db->itens($livre,false)[0];
$svc->sessao($u,['treino_id'=>$livre,'item_id'=>$exec['id'],'chave'=>bin2hex(random_bytes(16)),
    'duracao_segundos'=>45,'distancia_metros'=>50,'peso'=>500,'repeticoes'=>20],'serie');
$porTempo = $db->series($livre,false)[$exec['id']][0];
verificar($porTempo['duracao_segundos']===45 && $porTempo['peso']===null && $porTempo['repeticoes']===null,'Métricas incompatíveis foram registradas');
$svc->sessao($u,['treino_id'=>$livre],'finalizar');

// Data volume for this benchmark stays in the disposable test database.
$db->consultar("INSERT INTO treino (usuario_id,nome,status,iniciado_em,finalizado_em)
    WITH RECURSIVE n AS (SELECT 1 i UNION ALL SELECT i+1 FROM n WHERE i<1000)
    SELECT ?, 'Carga de teste', 'concluido', TIMESTAMPADD(HOUR,-i,NOW()), TIMESTAMPADD(MINUTE,30,TIMESTAMPADD(HOUR,-i,NOW())) FROM n",[$u]);
$f = ['de'=>'','ate'=>'','exercicio'=>''];
[$primeira,$mais] = medir('Histórico com mil sessões',fn()=>$db->historico($u,$f,0));
[$segunda] = medir('Segunda página por cursor',fn()=>$db->historico($u,$f,(int)end($primeira)['id']));
verificar($mais && count($primeira)===20 && count($segunda)===20 && !array_intersect(array_column($primeira,'id'),array_column($segunda,'id')),'Paginação por cursor falhou');
$t = $svc->iniciar($u,[]);
$svc->sessao($u,['treino_id'=>$t,'exercicio_id'=>$e['id']],'exercicio');
$exec = $db->itens($t,false)[0];
medir('Registrar 150 séries',function () use ($svc,$u,$t,$exec) {
    for ($i=0;$i<150;$i++) {
        $svc->sessao($u,['treino_id'=>$t,'item_id'=>$exec['id'],'chave'=>bin2hex(random_bytes(16)),
            'peso'=>'0','repeticoes'=>1],'serie');
    }
});
verificar(count($db->series($t,false)[$exec['id']])===150,'Sessão extensa perdeu séries');
medir('Finalizar sessão com 150 séries',fn()=>$svc->sessao($u,['treino_id'=>$t],'finalizar'));
echo "Fluxo de rotinas e treinos OK.\n";



