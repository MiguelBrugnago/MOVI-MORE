<?php

declare(strict_types=1);

namespace App\Models\Metricas;

use App\Contracts\MetricaInterface;
use InvalidArgumentException;

abstract class MetricaNumerica implements MetricaInterface
{
    private readonly int|float|null $valor;

    public function __construct(mixed $valor, int $minimo, int $maximo)
    {
        if ($minimo < 0 || $maximo < $minimo) {
            throw new InvalidArgumentException('Limites da métrica inválidos.');
        }

        // Ausência é diferente de zero e deve continuar assim no banco.
        if ($valor === null || $valor === '') {
            $this->valor = null;
            return;
        }

        if ((!is_string($valor) && !is_int($valor) && !is_float($valor))
            || (is_float($valor) && !is_finite($valor))
            || !preg_match($this->formato(), (string) $valor)
            || $valor < $minimo || $valor > $maximo) {
            throw new InvalidArgumentException('Valor numérico inválido.');
        }

        $this->valor = $this->converter($valor);
    }

    final public function valor(): int|float|null
    {
        return $this->valor;
    }

    abstract protected function formato(): string;

    abstract protected function converter(string|int|float $valor): int|float;
}
