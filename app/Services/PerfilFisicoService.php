<?php

declare(strict_types=1);

namespace App\Services;

use App\Support\PerfilFisicoConstantes;
use DateTimeImmutable;
use DateTimeZone;
use InvalidArgumentException;

/**
 * Transforma os dados de perfil e avaliação recebidos pelo controller em campos que o
 * PerfilFisicoRepository pode gravar. Também estima composição corporal e resolve períodos de
 * consulta.
 */
final class PerfilFisicoService
{
    // Os nomes públicos continuam disponíveis para quem já consulta o serviço.
    public const OBJETIVOS = PerfilFisicoConstantes::OBJETIVOS;
    public const EXPERIENCIAS = PerfilFisicoConstantes::EXPERIENCIAS;
    public const MEDIDAS = PerfilFisicoConstantes::MEDIDAS;

    /**
     * Obtém o dia civil em São Paulo no formato usado nos formulários de data.
     *
     * @return string
     */
    public static function hoje(): string
    {
        return (new DateTimeImmutable('now', new DateTimeZone('America/Sao_Paulo')))->format('Y-m-d');
    }

    /**
     * Valida uma data civil existente entre 1900 e hoje em formato AAAA-MM-DD. Um campo opcional vazio
     * resulta em null.
     *
     * @param mixed $valor Entrada a validar ou converter.
     * @param bool $obrigatoria Indica se é permitido deixar a data em branco.
     * @return ?string
     * @throws InvalidArgumentException Informe uma data válida entre 1900 e hoje.
     */
    public static function data(mixed $valor, bool $obrigatoria = false): ?string
    {
        if (($valor === null || $valor === '') && !$obrigatoria) {
            return null;
        }
        if (!is_string($valor) || !preg_match('/^(\d{4})-(\d{2})-(\d{2})$/D', $valor, $m)
            || !checkdate((int)$m[2], (int)$m[3], (int)$m[1]) || $valor < '1900-01-01' || $valor > self::hoje()) {
            throw new InvalidArgumentException('Informe uma data válida entre 1900 e hoje.');
        }
        return $valor;
    }

    /**
     * Normaliza os textos, as opções de objetivo e experiência e as medidas opcionais do perfil.
     *
     * @param array $p Campos de entrada identificados pelo nome no formulário ou na URL.
     * @return array<string, int|float|string|null>
     * @throws InvalidArgumentException Para opções desconhecidas, datas inválidas ou campos fora dos limites.
     */
    public static function perfil(array $p): array
    {
        $dados = ['data_nascimento' => self::data($p['data_nascimento'] ?? null)];
        foreach (['genero' => 40, 'biografia' => 4000, 'disponibilidade' => 255, 'ambiente_preferido' => 80] as $campo => $limite) {
            $dados[$campo] = RegistroTreino::texto($p[$campo] ?? null, $limite);
        }
        foreach (['objetivo' => self::OBJETIVOS, 'experiencia' => self::EXPERIENCIAS] as $campo => $opcoes) {
            $valor = RegistroTreino::texto($p[$campo] ?? null, 60);
            if ($valor !== null && !in_array($valor, $opcoes, true)) {
                throw new InvalidArgumentException('Selecione uma opção válida para ' . $campo . '.');
            }
            $dados[$campo] = $valor;
        }
        $dados['altura_cm'] = RegistroTreino::numero($p['altura_cm'] ?? null, 30, 280, 2);
        $dados['frequencia_semanal'] = RegistroTreino::numero($p['frequencia_semanal'] ?? null, 0, 7);
        $dados['tempo_treinamento_meses'] = RegistroTreino::numero($p['tempo_treinamento_meses'] ?? null, 0, 1200);
        return $dados;
    }

    /**
     * Confere a data e cada medida na unidade prevista. Exige ao menos uma medição e devolve as medidas
     * agrupadas pelo tipo.
     *
     * @param array $p Campos de entrada identificados pelo nome no formulário ou na URL.
     * @return array{avaliado_em:string,observacao:?string,medidas:array<string,int|float|null>}
     * @throws InvalidArgumentException Para data inválida, medidas fora da faixa ou ausência de medições.
     */
    public static function avaliacao(array $p): array
    {
        $dados = ['avaliado_em' => self::data($p['avaliado_em'] ?? null, true),
            'observacao' => RegistroTreino::texto($p['observacao'] ?? null, 4000), 'medidas' => []];
        foreach (self::MEDIDAS as $campo => [$nome, $unidade, $min, $max]) {
            try {
                $dados['medidas'][$campo] = RegistroTreino::numero($p[$campo] ?? null, $min, $max, 3);
            } catch (InvalidArgumentException) {
                throw new InvalidArgumentException("$nome: informe um valor entre $min e $max $unidade (até três casas decimais).");
            }
        }
        // O predicado mantém zero como medida informada. Só valores nulos contam como ausência.
        if (!array_filter($dados['medidas'], static fn ($v) => $v !== null)) {
            throw new InvalidArgumentException('Preencha pelo menos uma medida.');
        }
        return $dados;
    }

    /**
     * Estima em kg a massa gorda pelo peso vezes o percentual de gordura dividido por 100. A diferença
     * para o peso é a massa magra.
     *
     * @param array $medidas Medições por tipo, com peso em kg e gordura em porcentagem.
     * @return array{massa_gorda:?float,massa_magra:?float}
     */
    public static function composicao(array $medidas): array
    {
        if (!isset($medidas['peso'], $medidas['gordura'])) {
            return ['massa_gorda' => null, 'massa_magra' => null];
        }
        // Estima as massas a partir do peso e do percentual de gordura informado.
        $gorda = (float)$medidas['peso'] * (float)$medidas['gordura'] / 100;
        return ['massa_gorda' => round($gorda, 3), 'massa_magra' => round((float)$medidas['peso'] - $gorda, 3)];
    }

    /**
     * Converte a opção de histórico na data inicial inclusiva. A opção todos retorna null para dispensar
     * o filtro.
     *
     * @param mixed $periodo Opção de intervalo escolhida no formulário.
     * @return ?string
     * @throws InvalidArgumentException Período inválido.
     */
    public static function inicioPeriodo(mixed $periodo): ?string
    {
        // A opção de 30 dias recua 29 porque hoje também participa do intervalo; as opções em meses usam o calendário.
        $intervalos = ['30' => '-29 days', '90' => '-89 days', '6m' => '-6 months', '1a' => '-1 year', 'todos' => null];
        if (!is_string($periodo) || !array_key_exists($periodo, $intervalos)) {
            throw new InvalidArgumentException('Período inválido.');
        }
        return $intervalos[$periodo] === null ? null : (new DateTimeImmutable(self::hoje()))->modify($intervalos[$periodo])->format('Y-m-d');
    }
}
