<?php

declare(strict_types=1);

namespace App\Models;

use App\Contracts\MetricaInterface;
use App\Models\Metricas\MetricaDecimal;
use App\Models\Metricas\MetricaInteira;
use App\Support\Validacao;
use InvalidArgumentException;

final class SerieExecutada
{
    public const TIPOS = [
        'normal' => 'Normal', 'aquecimento' => 'Aquecimento', 'drop' => 'Drop set',
        'falha' => 'Até a falha', 'preparatoria' => 'Preparatória', 'backoff' => 'Back-off',
    ];
    public const METRICAS = [
        'peso' => ['usa_carga', 'Carga (kg)', 0, 99999, 2],
        'repeticoes' => ['usa_repeticoes', 'Repetições', 1, 99999, 0],
        'duracao_segundos' => ['usa_duracao', 'Tempo (s)', 1, 99999, 0],
        'distancia_metros' => ['usa_distancia', 'Distância (m)', 0, 999999, 2],
    ];

    /** @var array<string, MetricaInterface> Medições exclusivas desta série, sem setters. */
    private array $metricas = [];
    private readonly array $detalhes;

    public function __construct(array $entrada, array $registro, string $estado)
    {
        if (!in_array($estado, ['pendente', 'concluida', 'ignorada'], true)) {
            throw new InvalidArgumentException('Estado inválido.');
        }
        foreach (self::METRICAS as $campo => [$flag, , $minimo, $maximo, $casas]) {
            // Descarta campos incompatíveis com a modalidade, mesmo se vierem do navegador.
            $valor = empty($registro[$flag]) ? null : ($entrada[$campo] ?? null);
            $metrica = $casas === 0
                ? new MetricaInteira($valor, $minimo, $maximo)
                : new MetricaDecimal($valor, $minimo, $maximo, $casas);
            // A carga pode ficar em branco mesmo quando a série está concluída.
            if ($estado === 'concluida' && !empty($registro[$flag]) && $metrica->valor() === null && $campo !== 'peso') {
                throw new InvalidArgumentException('Preencha as métricas do exercício.');
            }
            $this->metricas[$campo] = $metrica;
        }
        $lado = $entrada['lado'] ?? '';
        if (!in_array($lado, ['', 'direito', 'esquerdo', 'conjunto'], true)) {
            throw new InvalidArgumentException('Lado inválido.');
        }
        $this->detalhes = [
            'rir' => Validacao::numero($entrada['rir'] ?? null, 0, 20),
            'rpe' => Validacao::numero($entrada['rpe'] ?? null, 0, 10, 1),
            'tipo' => self::tipo($entrada['tipo'] ?? 'normal'),
            'lado' => $lado ?: null,
            'observacao' => Validacao::texto($entrada['observacao'] ?? null, 4000),
            'concluida' => (int) ($estado === 'concluida'),
            'ignorada' => (int) ($estado === 'ignorada'),
        ];
    }

    public static function tipo(mixed $tipo): string
    {
        if (!is_string($tipo) || !isset(self::TIPOS[$tipo])) {
            throw new InvalidArgumentException('Tipo de série inválido.');
        }
        return $tipo;
    }

    public function paraPersistencia(): array
    {
        $dados = [];
        // O consumidor usa o contrato; cada medição preserva seu tipo e sua precisão.
        foreach ($this->metricas as $campo => $metrica) {
            $dados[$campo] = $metrica->valor();
        }
        return $dados + $this->detalhes;
    }
}
