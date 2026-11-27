<?php

declare(strict_types=1);

namespace App\Services;

use DateTimeImmutable;
use DateTimeZone;
use InvalidArgumentException;

/**
 * Transforma consultas de treinos concluídos em indicadores por período, músculo e lado. O
 * controller usa os mesmos cálculos para a janela escolhida e a janela anterior.
 */
final class AnaliseTreinoService
{
    // As séries equivalentes usam o papel do músculo. O peso estimado do catálogo fica para revisão.
    public const FATORES = ['primario' => 1.0, 'secundario' => 0.5, 'estabilizador' => 0.0];
    // Os cortes 5, 10 e 20 separam as cores do mapa. São faixas de visualização, sem interpretação clínica.
    public const FAIXAS = [5, 10, 20];

    /**
     * Traduz o filtro em dias civis de São Paulo e timestamps. O início entra na consulta e o fim
     * representa o início do dia seguinte ao último dia exibido.
     *
     * @param array{periodo?:mixed,de?:mixed,ate?:mixed} $p Campos de entrada identificados pelo nome no formulário ou na URL.
     * @param ?DateTimeImmutable $hoje Data de referência para delimitar a janela, ou o dia atual.
     * @return array{periodo:string,de:string,ate:string,dias:int,inicio:int,fim:int,anterior_inicio:int,anterior_fim:int}
     * @throws InvalidArgumentException Período inválido.
     */
    public static function periodo(array $p, ?DateTimeImmutable $hoje = null): array
    {
        $tz = new DateTimeZone('America/Sao_Paulo');
        $hoje = ($hoje ?? new DateTimeImmutable('now', $tz))->setTimezone($tz)->setTime(0, 0);
        $periodo = $p['periodo'] ?? '30';
        if (!in_array($periodo, ['7', '30', '90', 'semana', 'personalizado'], true)) {
            throw new InvalidArgumentException('Período inválido.');
        }
        /** Reconstrói a data em São Paulo e confere o formato de volta para rejeitar dias normalizados pelo calendário. */
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
        // A diferença entre duas datas exclui o primeiro dia. Somar um inclui as duas datas escolhidas pelo aluno.
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

    /**
     * Calcula a diferença entre as medições e a variação percentual sobre o valor anterior. Uma base
     * zero impede o cálculo percentual.
     *
     * @param ?float $atual Valor no intervalo consultado, quando disponível.
     * @param ?float $anterior Valor de referência no período anterior, quando disponível.
     * @return array{absoluta:?float,percentual:?float}
     */
    public static function comparar(?float $atual, ?float $anterior): array
    {
        return ['absoluta' => $atual !== null && $anterior !== null ? $atual - $anterior : null,
            'percentual' => $atual !== null && $anterior !== null && $anterior != 0 ? ($atual - $anterior) / $anterior * 100 : null];
    }

    /**
     * Classifica a intensidade visual de 0 a 4 usando três cortes positivos crescentes. Os cortes servem
     * à legenda do mapa.
     *
     * @param float $valor Quantidade usada para atribuir a cor da região.
     * @param list<int|float> $faixas Três limites em ordem crescente para os níveis do mapa.
     * @return int
     * @throws InvalidArgumentException Faixas inválidas.
     */
    public static function nivel(float $valor, array $faixas = self::FAIXAS): int
    {
        if (count($faixas) !== 3 || $faixas[0] <= 0 || $faixas[1] <= $faixas[0] || $faixas[2] <= $faixas[1]) {
            throw new InvalidArgumentException('Faixas inválidas.');
        }
        return match (true) {
            $valor <= 0 => 0,
            $valor < $faixas[0] => 1,
            $valor < $faixas[1] => 2,
            $valor < $faixas[2] => 3,
            default => 4,
        };
    }

    /**
     * Formata um instante Unix no fuso de São Paulo para agrupar sessões pelo dia ou semana local.
     *
     * @param int $timestamp Instante Unix em segundos.
     * @param string $formato Máscara de formatação da data do PHP.
     * @return string
     */
    public static function data(int $timestamp, string $formato = 'd/m/Y'): string
    {
        return (new DateTimeImmutable('@' . $timestamp))->setTimezone(new DateTimeZone('America/Sao_Paulo'))->format($formato);
    }

    /**
     * Distribui as séries pelos músculos relacionados, separa volumes por exercício e lado e normaliza
     * os dias treinados para a frequência semanal.
     *
     * @param array $catalogo Músculos cadastrados usados para inicializar os totais.
     * @param array $relacoes Associações entre exercício, músculo e papel no movimento.
     * @param array $sessoes Sessões concluídas com instante final e duração em segundos.
     * @param array $execucoes Séries de trabalho já agrupadas por sessão, exercício e lado.
     * @param int $dias Quantidade de dias civis cobertos pelo período.
     * @return array{musculos:array,total:array,grupos:array,semanas:array,volumes:array,semRelacao:array,revisao:array}
     * @throws InvalidArgumentException O período precisa ter pelo menos um dia.
     */
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
            // A duração vem em segundos do MySQL. O conjunto de datas conta apenas um dia mesmo que haja duas sessões nele.
            $total['minutos'] += (float)$s['duracao'] / 60;
            $total['dias'][self::data((int)$s['fim'], 'Y-m-d')] = true;
        }
        foreach ($execucoes as $execucao) {
            $quantidade = (int)$execucao['series'];
            $semana = self::data((int)$execucao['fim'], 'o-\WW');
            $total['series'] += $quantidade;
            if ($execucao['repeticoes'] !== null) {
                $total['repeticoes'] = ($total['repeticoes'] ?? 0) + (int)$execucao['repeticoes'];
            }
            $grupos[$execucao['grupo']] = ($grupos[$execucao['grupo']] ?? 0) + $quantidade;
            $semanas[$semana]['series'] += $quantidade;
            if ($execucao['volume'] !== null) {
                self::somarVolume($volumes, $execucao);
                $semanas[$semana]['grupos'][$execucao['grupo']] ??= [];
                self::somarVolume($semanas[$semana]['grupos'][$execucao['grupo']], $execucao);
            }
            if (empty($porExercicio[$execucao['exercicio_id']])) {
                $semRelacao[$execucao['exercicio_id']] = $execucao['nome'];
            }
            foreach ($porExercicio[$execucao['exercicio_id']] ?? [] as $relacao) {
                if (!isset($musculos[$relacao['musculo_id']])) {
                    continue;
                }
                self::atribuirSeries($musculos[$relacao['musculo_id']], $execucao, $relacao['papel'], $semana);
                if (!isset(self::FATORES[$relacao['papel']]) || $relacao['peso_estimado'] !== null) {
                    $musculo = $musculos[$relacao['musculo_id']];
                    $revisao[$execucao['exercicio_id'] . ':' . $musculo['id']] = $execucao['nome'] . ' / ' . $musculo['nome'];
                }
            }
        }
        // Normaliza os dias treinados para uma frequência média semanal no período.
        foreach ($musculos as &$m) {
            $m['frequencia'] = count($m['dias']) * 7 / $dias;
            $m['grupo_visual'] = $m['grupo'] ?: (MapaMuscular::regioes()[$m['codigo']]['grupo'] ?? 'Não classificado');
        }
        unset($m);
        $total['frequencia'] = count($total['dias']) * 7 / $dias;
        // Aqui o numerador conta sessões. Na frequência acima ele conta datas distintas, por isso duas sessões no mesmo dia podem dar médias diferentes.
        $total['sessoes_semana'] = $total['treinos'] * 7 / $dias;
        return compact('musculos', 'total', 'grupos', 'semanas', 'volumes', 'semRelacao', 'revisao');
    }

    private static function atribuirSeries(array &$musculo, array $execucao, string $papel, string $semana): void
    {
        $quantidade = (int) $execucao['series'];
        $fator = self::FATORES[$papel] ?? 0;
        $musculo['series'] += $quantidade;
        $campo = match ($papel) {
            'primario' => 'diretas',
            'secundario' => 'indiretas',
            default => 'estabilizadoras',
        };
        $musculo[$campo] += $quantidade;
        // Cada série conta 1 para o músculo primário, 0,5 para o secundário e 0 para o estabilizador. É uma estimativa por papel.
        $musculo['equivalentes'] += $quantidade * $fator;
        $musculo['semanas'][$semana] = ($musculo['semanas'][$semana] ?? 0) + $quantidade * $fator;
        $musculo['sessoes'][$execucao['treino_id']] = true;
        $musculo['dias'][self::data((int)$execucao['fim'], 'Y-m-d')] = true;
        $musculo['exercicios'][$execucao['exercicio_id']] = $execucao['nome'];
        if ($execucao['volume'] !== null && $fator > 0) {
            self::somarVolume($musculo['volumes'], $execucao, $fator);
        }
    }

    private static function somarVolume(array &$volumes, array $execucao, float $fator = 1.0): void
    {
        // O volume é comparável dentro do mesmo exercício e lado.
        $chave = $execucao['exercicio_id'] . ':' . $execucao['lado'];
        $volumes[$chave] ??= [
            'nome' => $execucao['nome'], 'lado' => $execucao['lado'], 'equipamento' => $execucao['equipamento'],
            'volume' => 0.0, 'series' => 0,
        ];
        $volumes[$chave]['volume'] += (float) $execucao['volume'] * $fator;
        $volumes[$chave]['series'] += (int) $execucao['series'];
    }
}
