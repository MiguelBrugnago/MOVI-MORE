<?php

declare(strict_types=1);

namespace App\Services;

use App\Models\SerieExecutada;
use App\Support\Validacao;
use InvalidArgumentException;

final class RegistroTreino
{
    public const TIPOS = SerieExecutada::TIPOS;
    public const METRICAS = SerieExecutada::METRICAS;
    public const METAS = [
        'carga_alvo' => ['usa_carga', 'Carga alvo (kg)', 0, 99999, 2],
        'repeticoes_min' => ['usa_repeticoes', 'Repetições mín.', 1, 99999, 0],
        'repeticoes_max' => ['usa_repeticoes', 'Repetições máx.', 1, 99999, 0],
        'duracao_alvo_segundos' => ['usa_duracao', 'Tempo alvo (s)', 1, 99999, 0],
        'distancia_alvo_metros' => ['usa_distancia', 'Distância alvo (m)', 0, 999999, 2],
    ];

    public static function texto(mixed $v, int $max, int $min = 0): ?string
    {
        return Validacao::texto($v, $max, $min);
    }

    public static function numero(mixed $v, int $min, int $max, int $dec = 0): int|float|null
    {
        return Validacao::numero($v, $min, $max, $dec);
    }

    public static function tipo(mixed $tipo): string
    {
        return SerieExecutada::tipo($tipo);
    }

    public static function metas(array $post, array $registro): array
    {
        $out = [];
        foreach (self::METAS as $key => [$flag,, $min, $max, $dec]) {
            $out[$key] = empty($registro[$flag]) ? null : self::numero($post[$key] ?? null, $min, $max, $dec);
        }
        // Com apenas um limite informado, a faixa de repetições fica com um valor único.
        $out['repeticoes_max'] ??= $out['repeticoes_min'];
        $out['repeticoes_min'] ??= $out['repeticoes_max'];
        if ($out['repeticoes_max'] < $out['repeticoes_min']) {
            throw new InvalidArgumentException('A faixa de repetições está invertida.');
        }
        $out['rir_alvo'] = self::numero($post['rir_alvo'] ?? null, 0, 20);
        $out['tipo'] = self::tipo($post['tipo'] ?? 'normal');
        return $out;
    }

    public static function execucao(array $post, array $registro, string $estado): array
    {
        return (new SerieExecutada($post, $registro, $estado))->paraPersistencia();
    }
}
