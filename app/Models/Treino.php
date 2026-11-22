<?php

declare(strict_types=1);

namespace App\Models;

use DomainException;
use InvalidArgumentException;

/**
 * Representa o estado de uma sessão em memória. TreinoService consulta as transições permitidas
 * antes de persistir alterações em treino, exercícios ou séries.
 */
final class Treino
{
    /**
     * Reconstrói o estado persistido e rejeita valores desconhecidos.
     *
     * @param string $status Estado persistido da sessão.
     * @throws InvalidArgumentException Estado do treino inválido.
     */
    public function __construct(private string $status)
    {
        if (!in_array($status, ['em_andamento', 'concluido', 'cancelado', 'excluido'], true)) {
            throw new InvalidArgumentException('Estado do treino inválido.');
        }
    }

    /**
     * Avalia a ação no estado atual. Devolve false para uma transição já aplicada e lança exceção para
     * ações incompatíveis.
     *
     * @param string $acao Operação solicitada pelo formulário.
     * @return bool
     * @throws InvalidArgumentException Ação inválida.
     * @throws DomainException Operação indisponível para este treino.
     */
    public function autorizar(string $acao): bool
    {
        if (!in_array($acao, ['finalizar', 'cancelar', 'excluir', 'notas', 'exercicio', 'descanso', 'serie', 'item_notas'], true)) {
            throw new InvalidArgumentException('Ação inválida.');
        }
        // Repetir uma transição concluída é um reenvio válido. Outras ações ainda precisam passar pelas regras do estado atual.
        $destino = ['finalizar' => 'concluido', 'cancelar' => 'cancelado', 'excluir' => 'excluido'];
        if (($destino[$acao] ?? null) === $this->status) {
            return false;
        }
        if ($this->status !== 'em_andamento'
            && !($this->status === 'concluido' && in_array($acao, ['serie', 'notas', 'excluir'], true))) {
            throw new DomainException('Operação indisponível para este treino.', 409);
        }
        if ($acao === 'excluir' && $this->status !== 'concluido') {
            throw new DomainException('Finalize ou descarte o treino ativo.', 409);
        }
        return true;
    }

    /**
     * Passa a concluído quando existe ao menos uma série concluída. O serviço grava a mudança e o
     * horário no banco.
     *
     * @param bool $possuiSerieConcluida Resultado da consulta às séries válidas da sessão.
     * @throws DomainException Conclua pelo menos uma série para finalizar.
     */
    public function finalizar(bool $possuiSerieConcluida): void
    {
        if (!$this->autorizar('finalizar')) {
            return;
        }
        if (!$possuiSerieConcluida) {
            throw new DomainException('Conclua pelo menos uma série para finalizar.', 422);
        }
        $this->status = 'concluido';
    }

    /**
     * Informa o estado atual, inclusive uma conclusão já aplicada em memória.
     *
     * @return string
     */
    public function status(): string
    {
        return $this->status;
    }
}
