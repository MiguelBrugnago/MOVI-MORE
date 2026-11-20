<?php

declare(strict_types=1);

namespace App\Models;

use DomainException;
use InvalidArgumentException;

final class Treino
{
    public function __construct(private string $status)
    {
        if (!in_array($status, ['em_andamento', 'concluido', 'cancelado', 'excluido'], true)) {
            throw new InvalidArgumentException('Estado do treino inválido.');
        }
    }

    /** Retorna false quando a transição já foi aplicada (reenvio da requisição). */
    public function autorizar(string $acao): bool
    {
        if (!in_array($acao, ['finalizar', 'cancelar', 'excluir', 'notas', 'exercicio', 'descanso', 'serie', 'item_notas'], true)) {
            throw new InvalidArgumentException('Ação inválida.');
        }
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

    public function status(): string
    {
        return $this->status;
    }
}
