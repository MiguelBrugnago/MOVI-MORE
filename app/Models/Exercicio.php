<?php

declare(strict_types=1);

namespace App\Models;

use InvalidArgumentException;

final class Exercicio
{
    public function __construct(private readonly int $id, private readonly string $nome)
    {
        if ($id < 1 || trim($nome) === '') {
            throw new InvalidArgumentException('Exercício inválido.');
        }
    }

    public function id(): int
    {
        return $this->id;
    }

    public function nome(): string
    {
        return $this->nome;
    }
}
