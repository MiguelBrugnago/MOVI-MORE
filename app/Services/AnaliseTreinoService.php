<?php

declare(strict_types=1);

namespace App\Services;

use DateTimeImmutable;
use DateTimeZone;
use InvalidArgumentException;

final class AnaliseTreinoService
{
    // As séries equivalentes usam o papel do músculo. O peso estimado do catálogo fica para revisão.
    public const FATORES = ['primario' => 1.0, 'secundario' => 0.5, 'estabilizador' => 0.0];
    public const FAIXAS = [5, 10, 20];

    public static function periodo(array $p, ?DateTimeImmutable $hoje = null): array
    {
        $tz = new DateTimeZone('America/Sao_Paulo');
        $hoje = ($hoje ?? new DateTimeImmutable('now', $tz))->setTimezone($tz)->setTime(0, 0);
        $periodo = $p['periodo'] ?? '30';
        if (!in_array($periodo, ['7', '30', '90', 'semana', 'personalizado'], true)) {
            throw new InvalidArgumentException('Período inválido.');
        }
        $data = static function (mixed $v) use ($tz): DateTimeImmutable {
            if (!is_string($v) || !preg_match('/^\d{4}-\d{2}-\d{2}$/D', $v)) {
                throw new InvalidArgumentException('Data inválida.');
            }
            $d = DateTimeImmutable::createFromFormat('!Y-m-d', $v, $tz);
            if (!$d || $d->format('Y-m-d') !== $v) {
                throw new InvalidArgumentException('Data inválida.');
            }
            return $d;
        };
        $ate = $periodo === 'personalizado' ? $data($p['ate'] ?? null) : $hoje;
        $de = $periodo === 'personalizado' ? $data($p['de'] ?? null)
            : ($periodo === 'semana' ? $hoje->modify('monday this week') : $ate->modify('-' . ((int)$periodo - 1) . ' days'));
        $dias = (int)$de->diff($ate)->format('%r%a') + 1;
        if ($dias < 1 || $dias > 366 || $ate > $hoje || $de->format('Y') < '1971') {
            throw new InvalidArgumentException('Use um intervalo passado ou atual de até 366 dias.');
        }
        $fim = $ate->modify('+1 day');
        // Semana atual compara os mesmos dias da semana anterior.
        $anterior = $de->modify('-' . ($periodo === 'semana' ? 7 : $dias) . ' days');
        return ['periodo' => $periodo, 'de' => $de->format('Y-m-d'), 'ate' => $ate->format('Y-m-d'), 'dias' => $dias,
            'inicio' => $de->getTimestamp(), 'fim' => $fim->getTimestamp(),
            'anterior_inicio' => $anterior->getTimestamp(), 'anterior_fim' => $anterior->modify("+$dias days")->getTimestamp()];
    }

    public static function comparar(?float $atual, ?float $anterior): array
    {
        return ['absoluta' => $atual !== null && $anterior !== null ? $atual - $anterior : null,
            'percentual' => $atual !== null && $anterior !== null && $anterior != 0 ? ($atual - $anterior) / $anterior * 100 : null];
    }

    public static function nivel(float $valor, array $faixas = self::FAIXAS): int
    {
        if (count($faixas) !== 3 || $faixas[0] <= 0 || $faixas[1] <= $faixas[0] || $faixas[2] <= $faixas[1]) {
            throw new InvalidArgumentException('Faixas inválidas.');
        }
        return $valor <= 0 ? 0 : ($valor < $faixas[0] ? 1 : ($valor < $faixas[1] ? 2 : ($valor < $faixas[2] ? 3 : 4)));
    }

    public static function data(int $timestamp, string $formato = 'd/m/Y'): string
    {
        return (new DateTimeImmutable('@' . $timestamp))->setTimezone(new DateTimeZone('America/Sao_Paulo'))->format($formato);
    }

    public static function calcular(array $catalogo, array $relacoes, array $sessoes, array $execucoes, int $dias): array
    {
        if ($dias < 1) {
            throw new InvalidArgumentException('O período precisa ter pelo menos um dia.');
        }
        $musculos = $porExercicio = $grupos = $semanas = $volumes = $semRelacao = $revisao = [];
        foreach ($catalogo as $m) {
            $musculos[$m['id']] = $m + ['series' => 0, 'diretas' => 0, 'indiretas' => 0, 'estabilizadoras' => 0, 'equivalentes' => 0.0,
                'sessoes' => [], 'dias' => [], 'exercicios' => [], 'volumes' => [], 'semanas' => []];
        }
        foreach ($relacoes as $r) {
            $porExercicio[$r['exercicio_id']][] = $r;
        }
        $total = ['treinos' => count($sessoes), 'series' => 0, 'repeticoes' => null, 'minutos' => 0, 'dias' => []];
        foreach ($sessoes as $s) {
            $semana = self::data((int)$s['fim'], 'o-\WW');
            $semanas[$semana] ??= ['treinos' => 0, 'series' => 0, 'grupos' => []];
            $semanas[$semana]['treinos']++;
            $total['minutos'] += (float)$s['duracao'] / 60;
            $total['dias'][self::data((int)$s['fim'], 'Y-m-d')] = true;
        }
        foreach ($execucoes as $x) {
            $n = (int)$x['series'];
            $semana = self::data((int)$x['fim'], 'o-\WW');
            $total['series'] += $n;
            if ($x['repeticoes'] !== null) {
                $total['repeticoes'] = ($total['repeticoes'] ?? 0) + (int)$x['repeticoes'];
            }
            $grupos[$x['grupo']] = ($grupos[$x['grupo']] ?? 0) + $n;
            $semanas[$semana]['series'] += $n;
            // Não combina exercícios, lados ou equipamentos diferentes como cargas comparáveis.
            $chave = $x['exercicio_id'] . ':' . $x['lado'];
            $volume = ['nome' => $x['nome'], 'lado' => $x['lado'], 'equipamento' => $x['equipamento'], 'volume' => 0.0, 'series' => 0];
            if ($x['volume'] !== null) {
                $volumes[$chave] ??= $volume;
                $volumes[$chave]['volume'] += (float)$x['volume'];
                $volumes[$chave]['series'] += $n;
                $semanas[$semana]['grupos'][$x['grupo']][$chave] ??= $volume;
                $semanas[$semana]['grupos'][$x['grupo']][$chave]['volume'] += (float)$x['volume'];
                $semanas[$semana]['grupos'][$x['grupo']][$chave]['series'] += $n;
            }
            if (empty($porExercicio[$x['exercicio_id']])) {
                $semRelacao[$x['exercicio_id']] = $x['nome'];
            }
            foreach ($porExercicio[$x['exercicio_id']] ?? [] as $r) {
                if (!isset($musculos[$r['musculo_id']])) {
                    continue;
                }
                $m = &$musculos[$r['musculo_id']];
                $f = self::FATORES[$r['papel']] ?? null;
                if ($f === null || $r['peso_estimado'] !== null) {
                    $revisao[$x['exercicio_id'] . ':' . $m['id']] = $x['nome'] . ' / ' . $m['nome'];
                }
                $m['series'] += $n;
                $campo = match($r['papel']) {
                    'primario' => 'diretas','secundario' => 'indiretas',default => 'estabilizadoras'
                };
                $m[$campo] += $n;
                $m['equivalentes'] += $n * ($f ?? 0);
                $m['semanas'][$semana] = ($m['semanas'][$semana] ?? 0) + $n * ($f ?? 0);
                $m['sessoes'][$x['treino_id']] = true;
                $m['dias'][self::data((int)$x['fim'], 'Y-m-d')] = true;
                $m['exercicios'][$x['exercicio_id']] = $x['nome'];
                if ($x['volume'] !== null && $f !== null && $f > 0) {
                    $m['volumes'][$chave] ??= $volume;
                    $m['volumes'][$chave]['volume'] += (float)$x['volume'] * $f;
                    $m['volumes'][$chave]['series'] += $n;
                }
                unset($m);
            }
        }
        // Normaliza os dias treinados para uma frequência média semanal no período.
        foreach ($musculos as &$m) {
            $m['frequencia'] = count($m['dias']) * 7 / $dias;
            $m['grupo_visual'] = $m['grupo'] ?: (MapaMuscular::regioes()[$m['codigo']]['grupo'] ?? 'Não classificado');
        }
        unset($m);
        $total['frequencia'] = count($total['dias']) * 7 / $dias;
        $total['sessoes_semana'] = $total['treinos'] * 7 / $dias;
        return compact('musculos', 'total', 'grupos', 'semanas', 'volumes', 'semRelacao', 'revisao');
    }
}
