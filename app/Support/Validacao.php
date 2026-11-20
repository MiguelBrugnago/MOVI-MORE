<?php

declare(strict_types=1);

namespace App\Support;

use App\Models\Metricas\MetricaDecimal;
use App\Models\Metricas\MetricaInteira;
use InvalidArgumentException;

final class Validacao
{
    public static function texto(mixed $valor, int $maximo, int $minimo = 0): ?string
    {
        if ($valor === null && $minimo === 0) {
            return null;
        }
        if (!is_string($valor) || !preg_match('//u', $valor)) {
            throw new InvalidArgumentException('Texto inválido.');
        }
        $valor = trim($valor);
        $tamanho = preg_match_all('/./us', $valor);
        if ($tamanho < $minimo || $tamanho > $maximo) {
            throw new InvalidArgumentException('Comprimento de texto inválido.');
        }
        return $valor === '' ? null : $valor;
    }

    public static function numero(mixed $valor, int $minimo, int $maximo, int $casas = 0): int|float|null
    {
        $metrica = $casas === 0
            ? new MetricaInteira($valor, $minimo, $maximo)
            : new MetricaDecimal($valor, $minimo, $maximo, $casas);

        return $metrica->valor();
    }
}
