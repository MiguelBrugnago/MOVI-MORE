<?php
// Verifica datas civis, unidades, campos opcionais e fórmulas de composição com entradas válidas e inválidas.

declare(strict_types=1);
require dirname(__DIR__) . '/vendor/autoload.php';
use App\Services\PerfilFisicoService as F;
use App\Support\PerfilFisicoConstantes;

/**
 * Interrompe a suíte ao encontrar uma condição falsa, identificando o cenário que falhou.
 *
 * @param bool $ok Resultado da afirmação testada.
 * @param string $nome Nome do cenário no relatório.
 * @throws RuntimeException Se a expectativa da suíte não for atendida.
 */
function conferir(bool $ok, string $nome): void
{
    if (!$ok) {
        throw new RuntimeException($nome);
    }
}
/**
 * Exige que o caso de entrada inválida seja rejeitado pelo validador.
 *
 * @param callable $fn Tentativa que deve ser rejeitada.
 * @throws RuntimeException Se a expectativa da suíte não for atendida.
 */
function invalido(callable $fn): void
{
    try {
        $fn();
    } catch (InvalidArgumentException) {
        return;
    }
    throw new RuntimeException('Entrada inválida aceita.');
}
conferir(F::OBJETIVOS === PerfilFisicoConstantes::OBJETIVOS && F::EXPERIENCIAS === PerfilFisicoConstantes::EXPERIENCIAS
    && F::MEDIDAS === PerfilFisicoConstantes::MEDIDAS, 'Compatibilidade das constantes públicas do perfil');
conferir(F::composicao(['peso' => 80, 'gordura' => 25]) === ['massa_gorda' => 20.0, 'massa_magra' => 60.0], 'Composição');
conferir(F::composicao(['peso' => 80])['massa_magra'] === null, 'Não combinar avaliações incompletas');
conferir(F::composicao(['peso' => 80, 'gordura' => 0])['massa_magra'] === 80.0, 'Zero é um valor');
conferir(F::perfil([])['altura_cm'] === null, 'Perfil opcional');
conferir(F::data('2024-02-29') === '2024-02-29', 'Ano bissexto');
foreach (['2025-02-29', '2024-02-30', '2999-01-01', [], '2024-1-01'] as $data) {
    invalido(fn () => F::data($data));
}
foreach (['-1', '701', 'NaN', '1e2', [], '80.1234'] as $peso) {
    invalido(fn () => F::avaliacao(['avaliado_em' => '2026-01-01', 'peso' => $peso]));
}
invalido(fn () => F::avaliacao(['avaliado_em' => '2026-01-01']));
invalido(fn () => F::perfil(['frequencia_semanal' => '8']));
invalido(fn () => F::perfil(['objetivo' => 'inventado']));
invalido(fn () => F::inicioPeriodo([]));
foreach (['30', '90', '6m', '1a', 'todos'] as $p) {
    F::inicioPeriodo($p);
}
echo "Perfil: cálculos, datas, campos opcionais, limites e entradas malformadas OK.\n";
