<?php
// Monta o resumo apenas com métricas informadas e usa a unidade de contagem do próprio exercício.

/**
 * @var Closure $esc
 */
/** Monta o texto do cartão com valores da série e a unidade de contagem do exercício. */
$resumo = static function (array $s, array $x) use ($esc): string {
    // A série pode ter métricas diferentes conforme a modalidade. Somente campos presentes ganham um valor e sua unidade no resumo.
    $partes = [];
    foreach (['peso' => 'kg', 'repeticoes' => $x['unidade_contagem'] ?? 'rep.', 'duracao_segundos' => 's', 'distancia_metros' => 'm', 'rir' => 'RIR', 'rpe' => 'RPE'] as $k => $unidade) {
        if (isset($s[$k])) {
            $partes[] = $esc($s[$k]) . ' ' . $esc($unidade);
        }
    }
    return implode(' · ', $partes);
};
