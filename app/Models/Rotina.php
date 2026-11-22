<?php

declare(strict_types=1);

namespace App\Models;

use DomainException;

/**
 * Agrega referências a exercícios na ordem selecionada. TreinoService usa essa seleção antes da
 * gravação e o catálogo mantém seu próprio ciclo de vida.
 */
final class Rotina
{
    /** @var list<Exercicio> O catálogo existe independentemente desta seleção. */
    private array $exercicios = [];

    /**
     * Guarda se a rotina está disponível para receber exercícios e começa com a seleção vazia.
     *
     * @param bool $ativa Estado da rotina carregada do banco.
     */
    public function __construct(private readonly bool $ativa)
    {
    }

    /**
     * Acrescenta o exercício à próxima posição. Uma rotina arquivada precisa ser restaurada antes da
     * edição.
     *
     * @param Exercicio $exercicio Referência ao exercício selecionado no catálogo.
     * @throws DomainException Restaure a rotina para editá-la.
     */
    public function adicionar(Exercicio $exercicio): void
    {
        if (!$this->ativa) {
            throw new DomainException('Restaure a rotina para editá-la.', 409);
        }
        // Repetir um exercício em posições diferentes é permitido.
        $this->exercicios[] = $exercicio;
    }

    /**
     * Entrega os exercícios na sequência de inclusão, inclusive ocorrências repetidas.
     *
     * @return list<Exercicio>
     */
    public function exercicios(): array
    {
        return $this->exercicios;
    }
}
