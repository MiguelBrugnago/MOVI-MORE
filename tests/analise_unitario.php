<?php
declare(strict_types=1);
require dirname(__DIR__).'/vendor/autoload.php';
use App\Services\AnaliseTreinoService as A;
use App\Services\MapaMuscular;
function conferirAnalise(bool $ok,string $nome): void { if (!$ok) throw new RuntimeException($nome); }
$hoje=new DateTimeImmutable('2026-11-18',new DateTimeZone('America/Sao_Paulo'));
foreach (['7'=>7,'30'=>30,'90'=>90,'semana'=>3] as $p=>$dias) conferirAnalise(A::periodo(['periodo'=>(string)$p],$hoje)['dias']===$dias,'Duração de período');
$p=A::periodo(['periodo'=>'personalizado','de'=>'2026-11-01','ate'=>'2026-11-18'],$hoje);
conferirAnalise($p['dias']===18 && A::data($p['anterior_fim']-1)==='31/10/2026','Comparação contígua');
foreach ([['periodo'=>[]],['periodo'=>'personalizado','de'=>'2026-02-30','ate'=>'2026-03-02'],['periodo'=>'personalizado','de'=>'2026-11-19','ate'=>'2026-11-19'],['periodo'=>'personalizado','de'=>[],'ate'=>'2026-11-18'],['periodo'=>'personalizado','de'=>'2024-01-01','ate'=>'2026-11-18'],['periodo'=>'personalizado','de'=>'2026-11-18','ate'=>'2026-11-01']] as $f) {
    try { A::periodo($f,$hoje); throw new RuntimeException('Filtro inválido aceito'); } catch (InvalidArgumentException) {}
}
conferirAnalise(A::comparar(10,0)===['absoluta'=>10.0,'percentual'=>null],'Divisão por zero');
conferirAnalise(A::comparar(null,2)['absoluta']===null && A::comparar(15,10)['percentual']===50.0,'Ausência e porcentagem');
foreach ([0=>0,1=>1,5=>2,10=>3,20=>4] as $v=>$nivel) conferirAnalise(A::nivel($v)===$nivel,'Limite de cor');
conferirAnalise(A::nivel(3,[2,4,6])===2,'Faixas configuráveis');
$catalogo=[];
foreach ([1=>'peitoral_maior',2=>'triceps_braquial',3=>'reto_abdominal',4=>'soleo'] as $id=>$codigo) $catalogo[]=['id'=>$id,'codigo'=>$codigo,'svg_id'=>'','nome'=>$codigo,'grupo'=>''];
$relacoes=[];
foreach ([1=>'primario',2=>'secundario',3=>'estabilizador'] as $id=>$papel) $relacoes[]=['exercicio_id'=>1,'musculo_id'=>$id,'papel'=>$papel,'peso_estimado'=>null];
$s=[['id'=>1,'fim'=>$p['inicio'],'duracao'=>120]];
$x=['treino_id'=>1,'fim'=>$p['inicio'],'exercicio_id'=>1,'nome'=>'Supino','grupo'=>'Peito','lado'=>'conjunto','equipamento'=>'Barra','series'=>3,'repeticoes'=>30,'volume'=>600,'carga'=>20];
$v=A::calcular($catalogo,$relacoes,$s,[$x],7);
conferirAnalise($v['total']['series']===3 && $v['musculos'][1]['diretas']===3 && $v['musculos'][2]['indiretas']===3,'Multiarticular não duplica totais');
conferirAnalise($v['musculos'][2]['equivalentes']===1.5 && $v['musculos'][3]['equivalentes']===0.0,'Ponderação');
conferirAnalise($v['musculos'][2]['volumes']['1:conjunto']['volume']===300.0,'Volume atribuído');
conferirAnalise($v['musculos'][4]['series']===0 && $v['musculos'][1]['frequencia']===1,'Músculo vazio e frequência');
$x['exercicio_id']=2;$x['volume']=null;$x['repeticoes']=null;
$v=A::calcular($catalogo,$relacoes,$s,[$x],7);
conferirAnalise(count($v['semRelacao'])===1 && !$v['volumes'] && $v['total']['repeticoes']===null,'Ausência não vira zero');
$v=A::calcular($catalogo,[],[],[],7);
conferirAnalise($v['total']['treinos']===0 && count($v['musculos'])===4,'Estado vazio');
foreach ($catalogo as $m) conferirAnalise(MapaMuscular::chave($m)===$m['codigo'],'Fallback SVG por código');
echo "OK: períodos, cálculo muscular, cores, nulos, comparação e mapeamento.\n";
