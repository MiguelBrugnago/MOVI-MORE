<?php
declare(strict_types=1);
require dirname(__DIR__) . '/vendor/autoload.php';
use App\Services\PerfilFisicoService as F;

function conferir(bool $ok, string $nome): void { if (!$ok) throw new RuntimeException($nome); }
function invalido(callable $fn): void {
    try { $fn(); } catch (InvalidArgumentException) { return; }
    throw new RuntimeException('Entrada inválida aceita.');
}
conferir(F::composicao(['peso'=>80,'gordura'=>25]) === ['massa_gorda'=>20.0,'massa_magra'=>60.0], 'Composição');
conferir(F::composicao(['peso'=>80])['massa_magra'] === null,'Não combinar avaliações incompletas');
conferir(F::composicao(['peso'=>80,'gordura'=>0])['massa_magra'] === 80.0,'Zero é um valor');
conferir(F::perfil([])['altura_cm'] === null,'Perfil opcional');
conferir(F::data('2024-02-29') === '2024-02-29','Ano bissexto');
foreach (['2025-02-29','2024-02-30','2999-01-01',[], '2024-1-01'] as $data) invalido(fn()=>F::data($data));
foreach (['-1','701','NaN','1e2',[], '80.1234'] as $peso) invalido(fn()=>F::avaliacao(['avaliado_em'=>'2026-01-01','peso'=>$peso]));
invalido(fn()=>F::avaliacao(['avaliado_em'=>'2026-01-01']));
invalido(fn()=>F::perfil(['frequencia_semanal'=>'8']));
invalido(fn()=>F::perfil(['objetivo'=>'inventado']));
invalido(fn()=>F::inicioPeriodo([]));
foreach (['30','90','6m','1a','todos'] as $p) F::inicioPeriodo($p);
echo "Perfil: cálculos, datas, campos opcionais, limites e entradas malformadas OK.\n";
