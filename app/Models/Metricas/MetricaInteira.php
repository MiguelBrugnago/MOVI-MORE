<?php

declare(strict_types=1);

namespace App\Models\Metricas;

/**
 * Especializa MetricaNumerica para contagens e durações inteiras. SerieExecutada seleciona essa
 * classe quando a medição exige zero casas decimais.
 */
final class MetricaInteira extends MetricaNumerica
{
    /**
     * Fornece a expressão regular que admite somente dígitos inteiros.
     *
     * @return string
     */
    protected function formato(): string
    {
        return '/^\d+$/D';
    }

    /**
     * Entrega a contagem inteira depois da verificação dos limites.
     *
     * @param string|int|float $valor Entrada a validar ou converter.
     * @return int
     */
    protected function converter(string|int|float $valor): int
    {
        return (int) $valor;
    }
}
