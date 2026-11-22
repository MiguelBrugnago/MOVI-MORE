<?php

declare(strict_types=1);

namespace App\Support;

use App\Models\Metricas\MetricaDecimal;
use App\Models\Metricas\MetricaInteira;
use InvalidArgumentException;

/**
 * Padroniza entradas de formulários para os serviços de perfil e treino. Valida texto em UTF-8 e usa
 * os modelos de métricas para números opcionais.
 */
final class Validacao
{
    /**
     * Remove espaços nas pontas e mede o comprimento em caracteres Unicode. Um texto opcional vazio
     * resulta em null.
     *
     * @param mixed $valor Entrada a validar ou converter.
     * @param int $maximo Limite superior inclusivo.
     * @param int $minimo Limite inferior inclusivo.
     * @return ?string
     * @throws InvalidArgumentException Texto inválido.
     */
    public static function texto(mixed $valor, int $maximo, int $minimo = 0): ?string
    {
        if ($valor === null && $minimo === 0) {
            return null;
        }
        if (!is_string($valor) || !preg_match('//u', $valor)) {
            throw new InvalidArgumentException('Texto inválido.');
        }
        $valor = trim($valor);
        // O modificador Unicode conta caracteres do texto. Acentos podem ocupar mais de um byte em UTF-8.
        $tamanho = preg_match_all('/./us', $valor);
        if ($tamanho < $minimo || $tamanho > $maximo) {
            throw new InvalidArgumentException('Comprimento de texto inválido.');
        }
        return $valor === '' ? null : $valor;
    }

    /**
     * Escolhe MetricaInteira para zero casas e MetricaDecimal para valores fracionários, respeitando os
     * limites informados.
     *
     * @param mixed $valor Entrada a validar ou converter.
     * @param int $minimo Limite inferior inclusivo.
     * @param int $maximo Limite superior inclusivo.
     * @param int $casas Quantidade permitida de casas decimais.
     * @return int|float|null
     * @throws InvalidArgumentException Se o formato, a precisão ou os limites da métrica forem inválidos.
     */
    public static function numero(mixed $valor, int $minimo, int $maximo, int $casas = 0): int|float|null
    {
        $metrica = $casas === 0
            ? new MetricaInteira($valor, $minimo, $maximo)
            : new MetricaDecimal($valor, $minimo, $maximo, $casas);

        return $metrica->valor();
    }
}
