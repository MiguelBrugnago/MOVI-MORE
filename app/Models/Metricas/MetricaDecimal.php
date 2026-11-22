<?php

declare(strict_types=1);

namespace App\Models\Metricas;

use InvalidArgumentException;

/**
 * Especializa a validação numérica para medições fracionárias, como carga em kg. O construtor da
 * classe base usa a precisão desta instância ao testar o formato.
 */
final class MetricaDecimal extends MetricaNumerica
{
    /**
     * Aceita de uma a três casas decimais e delega ao construtor da classe base a verificação do valor e
     * dos limites.
     *
     * @param mixed $valor Entrada a validar ou converter.
     * @param int $minimo Limite inferior inclusivo.
     * @param int $maximo Limite superior inclusivo.
     * @param int $casas Quantidade permitida de casas decimais.
     * @throws InvalidArgumentException Precisão da métrica inválida.
     */
    public function __construct(mixed $valor, int $minimo, int $maximo, private readonly int $casas = 2)
    {
        if ($casas < 1 || $casas > 3) {
            throw new InvalidArgumentException('Precisão da métrica inválida.');
        }
        parent::__construct($valor, $minimo, $maximo);
    }

    /**
     * Compõe a expressão que permite dígitos e uma parte decimal opcional com ponto e a precisão
     * configurada.
     *
     * @return string
     */
    protected function formato(): string
    {
        return '/^\d+(?:\.\d{1,' . $this->casas . '})?$/D';
    }

    /**
     * Produz a medição em ponto flutuante depois da validação do formato.
     *
     * @param string|int|float $valor Entrada a validar ou converter.
     * @return float
     */
    protected function converter(string|int|float $valor): float
    {
        return (float) $valor;
    }
}
