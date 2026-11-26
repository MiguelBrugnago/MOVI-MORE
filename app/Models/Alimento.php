<?php

declare(strict_types=1);

namespace App\Models;

use DomainException;

final class Alimento
{
    public function __construct(
        public readonly int $id,
        public readonly string $nome,
        private readonly float $caloriasPor100g,
        private readonly float $proteinasPor100g,
        private readonly float $carboidratosPor100g,
        private readonly float $gordurasPor100g,
    ) {
    }

    /** Retorna a energia em kcal e os macronutrientes em gramas para a quantidade consumida. */
    public function totaisDaPorcao(float $gramas): array
    {
        $rotulo = [
            'calorias' => $this->caloriasPor100g,
            'proteinas' => $this->proteinasPor100g,
            'carboidratos' => $this->carboidratosPor100g,
            'gorduras' => $this->gordurasPor100g,
        ];
        $totais = [];
        foreach ($rotulo as $nutriente => $por100g) {
            $total = round($gramas * $por100g / 100, 2);
            if ($total < 0 || $total > 9_999_999.99) {
                throw new DomainException('O total da porção excede o intervalo permitido.', 422);
            }
            $totais[$nutriente] = $total;
        }
        return $totais;
    }
}
