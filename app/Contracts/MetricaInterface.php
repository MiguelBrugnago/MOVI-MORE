<?php

declare(strict_types=1);

namespace App\Contracts;

/**
 * Contrato das medições de uma série. SerieExecutada consulta peso, repetições, duração e distância
 * pela mesma operação, preservando a representação de cada modalidade.
 */
interface MetricaInterface
{
    /**
     * Devolve a medição validada ou null quando o campo ficou em branco.
     *
     * @return int|float|null
     */
    public function valor(): int|float|null;
}
