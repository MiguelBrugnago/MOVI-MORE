<?php

declare(strict_types=1);

namespace App\Models\Metricas;

use App\Contracts\MetricaInterface;
use InvalidArgumentException;

/**
 * Base das medições inteiras e decimais. Centraliza limites, ausência e imutabilidade e cada
 * subclasse define o formato aceito e a conversão do valor.
 */
abstract class MetricaNumerica implements MetricaInterface
{
    private readonly int|float|null $valor;

    /**
     * Preserva campos vazios como null. Para um valor informado, confere formato, finitude e limites
     * antes de chamar a conversão da subclasse.
     *
     * @param mixed $valor Entrada a validar ou converter.
     * @param int $minimo Limite inferior inclusivo.
     * @param int $maximo Limite superior inclusivo.
     * @throws InvalidArgumentException Para limites inválidos ou valor fora do formato ou da faixa.
     */
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

    /**
     * Expõe o valor validado, inclusive zero ou null.
     *
     * @return int|float|null
     */
    final public function valor(): int|float|null
    {
        return $this->valor;
    }

    /**
     * Fornece a expressão regular usada pelo construtor para validar a representação textual.
     *
     * @return string
     */
    abstract protected function formato(): string;

    /**
     * Converte a entrada que já passou pela validação para o tipo numérico da subclasse.
     *
     * @param string|int|float $valor Entrada a validar ou converter.
     * @return int|float
     */
    abstract protected function converter(string|int|float $valor): int|float;
}
