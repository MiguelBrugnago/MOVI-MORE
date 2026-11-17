<?php

declare(strict_types=1);

namespace App\Services;

use InvalidArgumentException;

final class RegistroTreino
{
    public const TIPOS = ['normal' => 'Normal', 'aquecimento' => 'Aquecimento', 'drop' => 'Drop set', 'falha' => 'Até a falha', 'preparatoria' => 'Preparatória', 'backoff' => 'Back-off'];
    public const METRICAS = [
        'peso' => ['usa_carga', 'Carga (kg)', 0, 99999, 2],
        'repeticoes' => ['usa_repeticoes', 'Repetições', 1, 99999, 0],
        'duracao_segundos' => ['usa_duracao', 'Tempo (s)', 1, 99999, 0],
        'distancia_metros' => ['usa_distancia', 'Distância (m)', 0, 999999, 2],
    ];
    public const METAS = [
        'carga_alvo' => ['usa_carga', 'Carga alvo (kg)', 0, 99999, 2],
        'repeticoes_min' => ['usa_repeticoes', 'Repetições mín.', 1, 99999, 0],
        'repeticoes_max' => ['usa_repeticoes', 'Repetições máx.', 1, 99999, 0],
        'duracao_alvo_segundos' => ['usa_duracao', 'Tempo alvo (s)', 1, 99999, 0],
        'distancia_alvo_metros' => ['usa_distancia', 'Distância alvo (m)', 0, 999999, 2],
    ];

    public static function texto(mixed $v, int $max, int $min = 0): ?string
    {
        if ($v === null && !$min) return null;
        if (!is_string($v) || !preg_match('//u', $v)) throw new InvalidArgumentException('Texto inválido.');
        $v = trim($v);
        $n = preg_match_all('/./us', $v);
        if ($n < $min || $n > $max) throw new InvalidArgumentException('Comprimento de texto inválido.');
        return $v === '' ? null : $v;
    }

    public static function numero(mixed $v, int $min, int $max, int $dec = 0): int|float|null
    {
        if ($v === null || $v === '') return null;
        $pattern = $dec ? '/^\d+(?:\.\d{1,' . $dec . '})?$/D' : '/^\d+$/D';
        if ((!is_string($v) && !is_int($v) && !is_float($v)) || !preg_match($pattern, (string)$v) || $v < $min || $v > $max) {
            throw new InvalidArgumentException('Valor numérico inválido.');
        }
        return $dec ? (float)$v : (int)$v;
    }

    public static function tipo(mixed $tipo): string
    {
        if (!is_string($tipo) || !isset(self::TIPOS[$tipo])) throw new InvalidArgumentException('Tipo de série inválido.');
        return $tipo;
    }

    public static function metas(array $post, array $registro): array
    {
        $out = [];
        foreach (self::METAS as $key => [$flag,, $min, $max, $dec]) {
            $out[$key] = empty($registro[$flag]) ? null : self::numero($post[$key] ?? null, $min, $max, $dec);
        }
        $out['repeticoes_max'] ??= $out['repeticoes_min'];
        $out['repeticoes_min'] ??= $out['repeticoes_max'];
        if ($out['repeticoes_max'] < $out['repeticoes_min']) throw new InvalidArgumentException('A faixa de repetições está invertida.');
        $out['rir_alvo'] = self::numero($post['rir_alvo'] ?? null, 0, 20);
        $out['tipo'] = self::tipo($post['tipo'] ?? 'normal');
        return $out;
    }

    public static function execucao(array $post, array $registro, string $estado): array
    {
        $out = [];
        foreach (self::METRICAS as $key => [$flag,, $min, $max, $dec]) {
            $out[$key] = empty($registro[$flag]) ? null : self::numero($post[$key] ?? null, $min, $max, $dec);
            if ($estado === 'concluida' && !empty($registro[$flag]) && $out[$key] === null && $key !== 'peso') {
                throw new InvalidArgumentException('Preencha as métricas do exercício.');
            }
        }
        $lado = $post['lado'] ?? '';
        if (!in_array($lado, ['', 'direito', 'esquerdo', 'conjunto'], true)) throw new InvalidArgumentException('Lado inválido.');
        return $out + [
            'rir' => self::numero($post['rir'] ?? null, 0, 20),
            'rpe' => self::numero($post['rpe'] ?? null, 0, 10, 1),
            'tipo' => self::tipo($post['tipo'] ?? 'normal'),
            'lado' => $lado ?: null,
            'observacao' => self::texto($post['observacao'] ?? null, 4000),
            'concluida' => (int)($estado === 'concluida'),
            'ignorada' => (int)($estado === 'ignorada'),
        ];
    }
}
