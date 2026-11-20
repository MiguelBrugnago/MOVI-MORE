<?php

/**
 * @var Closure $esc
 */
$resumo = static function (array $s, array $x) use ($esc): string {
    $partes = [];
    foreach (['peso' => 'kg', 'repeticoes' => $x['unidade_contagem'] ?? 'rep.', 'duracao_segundos' => 's', 'distancia_metros' => 'm', 'rir' => 'RIR', 'rpe' => 'RPE'] as $k => $unidade) {
        if (isset($s[$k])) {
            $partes[] = $esc($s[$k]) . ' ' . $esc($unidade);
        }
    }
    return implode(' · ', $partes);
};
