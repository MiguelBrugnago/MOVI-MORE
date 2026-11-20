<?php

declare(strict_types=1);

namespace App\Models\Metricas;

use InvalidArgumentException;

final class MetricaDecimal extends MetricaNumerica
{
    public function __construct(mixed $valor, int $minimo, int $maximo, private readonly int $casas = 2)
    {
        if ($casas < 1 || $casas > 3) {
            throw new InvalidArgumentException('Precisão da métrica inválida.');
        }
        parent::__construct($valor, $minimo, $maximo);
    }

    protected function formato(): string
    {
        return '/^\d+(?:\.\d{1,' . $this->casas . '})?$/D';
    }

    protected function converter(string|int|float $valor): float
    {
        return (float) $valor;
    }
}
