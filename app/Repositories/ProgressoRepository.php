<?php

declare(strict_types=1);

namespace App\Repositories;

use DateTimeImmutable;
use DateTimeZone;

final class ProgressoRepository
{
    public function __construct(private TreinoRepository $treinos)
    {
    }

    // A mesma sessão conta uma vez, independentemente da quantidade de séries e de reenvios.
    private const SESSOES = "FROM treino t WHERE t.usuario_id=? AND t.status='concluido'
        AND t.finalizado_em IS NOT NULL AND EXISTS (SELECT 1 FROM treino_exercicio x
        JOIN serie s ON s.treino_exercicio_id=x.id WHERE x.treino_id=t.id AND s.concluida=1 AND s.ignorada=0)";

    public function sessoes(int $usuario): int
    {
        return (int)$this->treinos->consultar('SELECT COUNT(*) ' . self::SESSOES, [$usuario])->fetchColumn();
    }

    public function metas(int $usuario): array
    {
        // As datas da meta são dias civis em São Paulo. O histórico do MySQL usa o relógio da conexão.
        $metas = $this->treinos->todos("SELECT id,valor_alvo,data_inicio,data_fim,status FROM meta
            WHERE usuario_id=? AND tipo='sessoes' ORDER BY id DESC", [$usuario]);
        if (!$metas) {
            return [];
        }
        $zona = new DateTimeZone('America/Sao_Paulo');
        $inicio = min(array_column($metas, 'data_inicio'));
        $hoje = (new DateTimeImmutable('today', $zona))->format('Y-m-d');
        $fim = min($hoje, max(array_map(static fn ($meta) => $meta['data_fim'] ?? $hoje, $metas)));
        $sessoes = $this->treinos->todos('SELECT UNIX_TIMESTAMP(t.finalizado_em) AS fim ' . self::SESSOES .
            ' AND t.finalizado_em>=FROM_UNIXTIME(?) AND t.finalizado_em<FROM_UNIXTIME(?)', [
                $usuario, (new DateTimeImmutable($inicio, $zona))->getTimestamp(),
                (new DateTimeImmutable($fim, $zona))->modify('+1 day')->getTimestamp(),
            ]);
        $dias = [];
        foreach ($sessoes as $sessao) {
            $dia = (new DateTimeImmutable('@' . $sessao['fim']))->setTimezone($zona)->format('Y-m-d');
            $dias[$dia] = ($dias[$dia] ?? 0) + 1;
        }
        foreach ($metas as &$meta) {
            $meta['realizado'] = 0;
            foreach ($dias as $dia => $quantidade) {
                if ($dia >= $meta['data_inicio'] && $dia <= ($meta['data_fim'] ?? $hoje)) {
                    $meta['realizado'] += $quantidade;
                }
            }
        }
        return $metas;
    }

    public function metasPeso(int $usuario): array
    {
        return $this->treinos->todos("SELECT m.tipo,m.valor_alvo,m.data_inicio,m.data_fim,
            (SELECT medida.valor FROM avaliacao a JOIN medida ON medida.avaliacao_id=a.id AND medida.usuario_id=a.usuario_id
             WHERE a.usuario_id=m.usuario_id AND medida.tipo='peso' AND medida.unidade='kg' AND a.avaliado_em>=m.data_inicio
             AND (m.data_fim IS NULL OR a.avaliado_em<DATE_ADD(m.data_fim,INTERVAL 1 DAY))
             ORDER BY a.avaliado_em DESC,a.id DESC,medida.id DESC LIMIT 1) peso
            FROM meta m WHERE m.usuario_id=? AND m.tipo IN ('peso_minimo','peso_maximo') ORDER BY m.id DESC", [$usuario]);
    }

    public function criar(int $usuario, string $tipo, int|float $alvo, string $inicio, string $fim): void
    {
        $this->treinos->transacao(function () use ($usuario, $tipo, $alvo, $inicio, $fim) {
            $this->treinos->bloquearUsuario($usuario);
            $args = [$usuario, $tipo, $alvo, $inicio, $fim];
            if (!$this->treinos->um("SELECT id FROM meta WHERE usuario_id=? AND tipo=?
                AND valor_alvo=? AND data_inicio=? AND data_fim=? AND status='ativa'", $args)) {
                $this->treinos->consultar("INSERT INTO meta (usuario_id,tipo,valor_alvo,data_inicio,data_fim,status)
                    VALUES (?,?,?,?,?,'ativa')", $args);
            }
        });
    }
}
