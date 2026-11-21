<?php

declare(strict_types=1);

namespace App\Models\Metricas;

final class MetricaInteira extends MetricaNumerica
{
    protected function formato(): string
    {
        return '/^\d+$/D';
    }

    protected function converter(string|int|float $valor): int
    {
        return (int) $valor;
    }
}
