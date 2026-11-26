<?php

declare(strict_types=1);

namespace App\Support;

final class PerfilFisicoConstantes
{
    public const OBJETIVOS = [
        'Hipertrofia', 'Força', 'Emagrecimento', 'Resistência muscular',
        'Condicionamento físico', 'Manutenção', 'Recomposição corporal',
    ];
    public const EXPERIENCIAS = ['Iniciante', 'Intermediário', 'Avançado'];

    // Cada tipo de medida tem rótulo, unidade e limites inclusivos.
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
}
