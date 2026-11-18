<?php
declare(strict_types=1);
if (PHP_SAPI!=='cli' || getenv('DB_NAME')!=='movi_treinos_teste') { fwrite(STDERR,"Use somente movi_treinos_teste.\n"); exit(1); }
require dirname(__DIR__).'/vendor/autoload.php';
use App\Config\Database;
use App\Repositories\{TreinoRepository,VinculoProfissionalRepository};
function checkAnalise(bool $ok,string $mensagem): void { if (!$ok) throw new RuntimeException($mensagem); }
$db=new TreinoRepository(Database::conectar());$vinculos=new VinculoProfissionalRepository();
$sufixo=bin2hex(random_bytes(6));$senha='Analise-teste-123';$usuarios=[];$clientes=[];
$cliente=static function() {
    $ch=curl_init();curl_setopt_array($ch,[CURLOPT_RETURNTRANSFER=>true,CURLOPT_COOKIEFILE=>'',CURLOPT_HEADER=>true,CURLOPT_TIMEOUT=>15]);
    return static function(string $url,int $esperado,?array $post=null) use($ch): string {
        curl_setopt($ch,CURLOPT_URL,'http://127.0.0.1'.$url);
        if ($post===null) curl_setopt($ch,CURLOPT_HTTPGET,true);
        else {curl_setopt($ch,CURLOPT_POST,true);curl_setopt($ch,CURLOPT_POSTFIELDS,http_build_query($post));}
        $res=(string)curl_exec($ch);
        checkAnalise(curl_getinfo($ch,CURLINFO_RESPONSE_CODE)===$esperado,"$url: esperado $esperado; ".substr($res,0,1500));
        checkAnalise(!str_contains($res,'Warning:') && !str_contains($res,'Fatal error'),'Erro PHP no corpo HTTP');
        return $res;
    };
};
$token=static function(string $h): string {preg_match('/name="csrf_token" value="([a-f0-9]+)"/',$h,$m);return $m[1]??throw new RuntimeException('Token ausente');};
$anon=$cliente();
foreach (['analise','mapa-muscular','progressao'] as $rota) $anon('/treinos/'.$rota,303);
foreach (['aluno','outro','profissional'] as $papel) {
    $email="$papel-$sufixo@example.test";
    $usuarios[$papel]=$db->inserir('usuario',['nome'=>$papel,'email'=>$email,'senha_hash'=>password_hash($senha,PASSWORD_DEFAULT)]);
    $h=$cliente();$h('/login',303,['csrf_token'=>$token($h('/login',200)),'email'=>$email,'senha'=>$senha]);$clientes[$papel]=$h;
}
$a=$clientes['aluno'];$b=$clientes['outro'];$p=$clientes['profissional'];
$html=$a('/treinos/analise',200);
checkAnalise(str_contains($html,'Nenhum treino concluído neste período'),'Estado vazio HTTP');
foreach (['periodo[]=7','periodo=x','periodo=personalizado&de=2026-02-30&ate=2026-03-01','aluno[]=1','aluno=0','aluno=','exercicio[]=1','metrica[]=series'] as $query) $a('/treinos/analise?'.$query,422);
$url='/treinos/analise?aluno='.$usuarios['aluno'];
$b($url,403);$p($url,403);
foreach (['mapa-muscular','progressao'] as $rota) $b('/treinos/'.$rota.'?aluno='.$usuarios['aluno'],403);
$prof=$db->inserir('profissional',['usuario_id'=>$usuarios['profissional'],'tipo'=>'Personal']);
$p($url,403);
$v=$db->inserir('vinculo_profissional',['profissional_id'=>$prof,'aluno_id'=>$usuarios['aluno'],'status'=>'ativo','iniciado_em'=>'2020-01-01 00:00:00']);
$p($url,403);
$vinculos->permitir($usuarios['aluno'],$v,'fisico',true);$p($url,403);
$vinculos->permitir($usuarios['aluno'],$v,'treinos',true);$p($url,200);
checkAnalise((int)$db->consultar("SELECT COUNT(*) FROM auditoria_acesso WHERE usuario_id=? AND aluno_id=? AND recurso='analise_muscular'",[$usuarios['profissional'],$usuarios['aluno']])->fetchColumn()===1,'Auditoria de leitura');
$ex=$db->um("SELECT e.id FROM exercicio e JOIN tipo_registro tr ON tr.id=e.tipo_registro_id WHERE tr.natureza_carga='externa' AND tr.usa_repeticoes=1 LIMIT 1",[]);
$db->consultar("INSERT INTO treino (usuario_id,status,iniciado_em,finalizado_em) VALUES (?,'concluido',DATE_SUB(NOW(),INTERVAL 1 HOUR),NOW())",[$usuarios['aluno']]);
$t=(int)$db->consultar('SELECT LAST_INSERT_ID()')->fetchColumn();
$x=$db->inserir('treino_exercicio',['treino_id'=>$t,'exercicio_id'=>$ex['id'],'ordem'=>1,'nome_snapshot'=>'<script>alert(1)</script> SEGREDO-ANALISE']);
$db->inserir('serie',['treino_exercicio_id'=>$x,'numero'=>1,'peso'=>30,'repeticoes'=>8,'concluida'=>1,'tipo'=>'normal']);
$html=$a('/treinos/progressao?exercicio='.$ex['id'],200);
checkAnalise(str_contains($html,'&lt;script&gt;alert(1)&lt;/script&gt;') && !str_contains($html,'<script>alert(1)</script>'),'XSS escapado');
checkAnalise(str_contains($html,'240,0') && str_contains($html,'Evolução dos recordes pessoais'),'Volume e progressão renderizados');
foreach (['7','30','90','semana'] as $periodo) $a('/treinos/mapa-muscular?periodo='.$periodo,200);
$html=$p($url.'&exercicio='.$ex['id'],200);checkAnalise(str_contains($html,'SEGREDO-ANALISE'),'Profissional autorizado');
checkAnalise(!str_contains($b('/treinos/progressao?exercicio='.$ex['id'],200),'SEGREDO-ANALISE'),'Isolamento por exercício');
$vinculos->permitir($usuarios['aluno'],$v,'treinos',false);$p($url,403);
$vinculos->permitir($usuarios['aluno'],$v,'treinos',true);
$db->atualizar('vinculo_profissional',$v,['status'=>'encerrado']);$p($url,403);
$db->atualizar('vinculo_profissional',$v,['status'=>'ativo']);
$db->atualizar('profissional',$prof,['ativo'=>0]);$p($url,403);
$db->atualizar('profissional',$prof,['ativo'=>1]);
$db->atualizar('usuario',$usuarios['aluno'],['ativo'=>0]);$p($url,403);
echo "OK: HTTP, autenticação, XSS, filtros, dados reais, consentimento, revogação, vínculo e conta inativa.\n";
