<?php

declare(strict_types=1);

namespace App\Services;

use App\Models\SerieExecutada;
use App\Support\Validacao;
use InvalidArgumentException;

/**
 * Converte os dados dos formulários de treino para os campos usados pelo repositório. Reúne as
 * regras comuns a metas planejadas e à série executada.
 */
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

    /**
     * Valida e normaliza texto opcional pelos limites de caracteres definidos pelo chamador.
     *
     * @param mixed $v Valor recebido do formulário antes da validação.
     * @param int $max Limite máximo aceito pelo campo.
     * @param int $min Limite mínimo aceito pelo campo.
     * @return ?string
     */
    public static function texto(mixed $v, int $max, int $min = 0): ?string
    {
        return Validacao::texto($v, $max, $min);
    }

    /**
     * Valida a medição numérica pela precisão e faixa do campo e mantém ausências como null.
     *
     * @param mixed $v Valor recebido do formulário antes da validação.
     * @param int $min Limite mínimo aceito pelo campo.
     * @param int $max Limite máximo aceito pelo campo.
     * @param int $dec Quantidade de casas decimais admitidas.
     * @return int|float|null
     */
    public static function numero(mixed $v, int $min, int $max, int $dec = 0): int|float|null
    {
        return Validacao::numero($v, $min, $max, $dec);
    }

    /**
     * Consulta os tipos de série aceitos por SerieExecutada antes de usar a chave no registro.
     *
     * @param mixed $tipo Chave do tipo de registro.
     * @return string
     */
    public static function tipo(mixed $tipo): string
    {
        return SerieExecutada::tipo($tipo);
    }

    /**
     * Seleciona as metas permitidas pela modalidade e valida a faixa de repetições, o RIR alvo e o tipo
     * de série.
     *
     * @param array $post Campos enviados pelo formulário da série.
     * @param array $registro Flags da modalidade que habilitam as medições.
     * @return array<string, int|float|string|null>
     * @throws InvalidArgumentException A faixa de repetições está invertida.
     */
    public static function metas(array $post, array $registro): array
    {
        $out = [];
        // O tipo de registro do catálogo decide quais metas o exercício admite, mesmo que o formulário envie outros campos.
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

    /**
     * Constrói a série realizada com as permissões de medição do exercício e extrai os campos
     * persistíveis.
     *
     * @param array $post Campos enviados pelo formulário da série.
     * @param array $registro Flags da modalidade que habilitam as medições.
     * @param string $estado Estado da série, pendente, concluída ou ignorada.
     * @return array<string, int|float|string|null>
     * @throws InvalidArgumentException Quando os campos são incompatíveis com o estado ou a modalidade.
     */
    public static function execucao(array $post, array $registro, string $estado): array
    {
        return (new SerieExecutada($post, $registro, $estado))->paraPersistencia();
    }
}
