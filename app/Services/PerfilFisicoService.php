<?php
declare(strict_types=1);

namespace App\Services;

use DateTimeImmutable;
use DateTimeZone;
use InvalidArgumentException;

final class PerfilFisicoService
{
    public const OBJETIVOS = ['Hipertrofia', 'Força', 'Emagrecimento', 'Resistência muscular', 'Condicionamento físico', 'Manutenção', 'Recomposição corporal'];
    public const EXPERIENCIAS = ['Iniciante', 'Intermediário', 'Avançado'];
    public const MEDIDAS = [
        'peso' => ['Peso corporal', 'kg', 1, 700],
        'gordura' => ['Gordura corporal', '%', 0, 100],
        'braco' => ['Braço', 'cm', 1, 300],
        'antebraco' => ['Antebraço', 'cm', 1, 300],
        'torax' => ['Tórax', 'cm', 1, 300],
        'cintura' => ['Cintura', 'cm', 1, 300],
        'abdomen' => ['Abdômen', 'cm', 1, 300],
        'quadril' => ['Quadril', 'cm', 1, 300],
        'coxa' => ['Coxa', 'cm', 1, 300],
        'panturrilha' => ['Panturrilha', 'cm', 1, 300],
    ];

    public static function hoje(): string
    {
        return (new DateTimeImmutable('now', new DateTimeZone('America/Sao_Paulo')))->format('Y-m-d');
    }

    public static function data(mixed $valor, bool $obrigatoria = false): ?string
    {
        if (($valor === null || $valor === '') && !$obrigatoria) return null;
        if (!is_string($valor) || !preg_match('/^(\d{4})-(\d{2})-(\d{2})$/D', $valor, $m)
            || !checkdate((int)$m[2], (int)$m[3], (int)$m[1]) || $valor < '1900-01-01' || $valor > self::hoje()) {
            throw new InvalidArgumentException('Informe uma data válida entre 1900 e hoje.');
        }
        return $valor;
    }

    public static function perfil(array $p): array
    {
        $dados = ['data_nascimento' => self::data($p['data_nascimento'] ?? null)];
        foreach (['genero'=>40, 'biografia'=>4000, 'disponibilidade'=>255, 'ambiente_preferido'=>80] as $campo=>$limite) {
            $dados[$campo] = RegistroTreino::texto($p[$campo] ?? null, $limite);
        }
        foreach (['objetivo'=>self::OBJETIVOS, 'experiencia'=>self::EXPERIENCIAS] as $campo=>$opcoes) {
            $valor = RegistroTreino::texto($p[$campo] ?? null, 60);
            if ($valor !== null && !in_array($valor, $opcoes, true)) throw new InvalidArgumentException('Selecione uma opção válida para ' . $campo . '.');
            $dados[$campo] = $valor;
        }
        $dados['altura_cm'] = RegistroTreino::numero($p['altura_cm'] ?? null, 30, 280, 2);
        $dados['frequencia_semanal'] = RegistroTreino::numero($p['frequencia_semanal'] ?? null, 0, 7);
        $dados['tempo_treinamento_meses'] = RegistroTreino::numero($p['tempo_treinamento_meses'] ?? null, 0, 1200);
        return $dados;
    }

    public static function avaliacao(array $p): array
    {
        $dados = ['avaliado_em'=>self::data($p['avaliado_em'] ?? null, true),
            'observacao'=>RegistroTreino::texto($p['observacao'] ?? null, 4000), 'medidas'=>[]];
        foreach (self::MEDIDAS as $campo=>[$nome, $unidade, $min, $max]) {
            try { $dados['medidas'][$campo] = RegistroTreino::numero($p[$campo] ?? null, $min, $max, 3); }
            catch (InvalidArgumentException) { throw new InvalidArgumentException("$nome: informe um valor entre $min e $max $unidade (até três casas decimais)."); }
        }
        if (!array_filter($dados['medidas'], static fn($v) => $v !== null)) throw new InvalidArgumentException('Preencha pelo menos uma medida.');
        return $dados;
    }

    public static function composicao(array $medidas): array
    {
        if (!isset($medidas['peso'], $medidas['gordura'])) return ['massa_gorda'=>null, 'massa_magra'=>null];
        $gorda = (float)$medidas['peso'] * (float)$medidas['gordura'] / 100;
        return ['massa_gorda'=>round($gorda, 3), 'massa_magra'=>round((float)$medidas['peso'] - $gorda, 3)];
    }

    public static function inicioPeriodo(mixed $periodo): ?string
    {
        $intervalos = ['30'=>'-29 days', '90'=>'-89 days', '6m'=>'-6 months', '1a'=>'-1 year', 'todos'=>null];
        if (!is_string($periodo) || !array_key_exists($periodo, $intervalos)) throw new InvalidArgumentException('Período inválido.');
        return $intervalos[$periodo] === null ? null : (new DateTimeImmutable(self::hoje()))->modify($intervalos[$periodo])->format('Y-m-d');
    }
}
