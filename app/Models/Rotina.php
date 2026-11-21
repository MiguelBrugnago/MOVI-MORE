<?php

declare(strict_types=1);

namespace App\Models;

use DomainException;

final class Rotina
{
    /** @var list<Exercicio> O catálogo existe independentemente desta seleção. */
    private array $exercicios = [];

    public function __construct(private readonly bool $ativa)
    {
    }

    public function adicionar(Exercicio $exercicio): void
    {
        if (!$this->ativa) {
            throw new DomainException('Restaure a rotina para editá-la.', 409);
        }
        // Repetir um exercício em posições diferentes é permitido.
        $this->exercicios[] = $exercicio;
    }

    /** @return list<Exercicio> */
    public function exercicios(): array
    {
        return $this->exercicios;
    }
}
