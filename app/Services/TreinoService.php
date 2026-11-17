<?php

declare(strict_types=1);

namespace App\Services;

use App\Repositories\TreinoRepository as Repo;
use DomainException;

final class TreinoService
{
    public function __construct(private Repo $db) {}

    private function exercicio(int $e, int $u): array
    {
        return $this->db->um('SELECT tr.*,e.id,e.nome FROM exercicio e LEFT JOIN tipo_registro tr ON tr.id=e.tipo_registro_id
            WHERE e.id=? AND e.ativo=1 AND (e.usuario_id IS NULL OR e.usuario_id=?)', [$e, $u])
            ?? throw new DomainException('Exercício indisponível.', 404);
    }

    public static function id(array $p, string $k): int
    {
        return RegistroTreino::numero($p[$k] ?? null, 1, 2147483647)
            ?? throw new \InvalidArgumentException('Identificador ausente.');
    }

    public function rotina(int $u, array $p, string $acao): int
    {
        return $this->db->transacao(function () use ($u, $p, $acao) {
            $meta = static fn() => [
                'nome' => RegistroTreino::texto($p['nome'] ?? null, 150, 2),
                'descricao' => RegistroTreino::texto($p['descricao'] ?? null, 4000),
                'dia_semana' => RegistroTreino::numero($p['dia_semana'] ?? null, 1, 7),
            ];
            if ($acao === 'criar') return $this->db->inserir('rotina', ['usuario_id' => $u] + $meta());
            $id = self::id($p, 'rotina_id');
            $r = $this->db->rotina($id, $u, true) ?? throw new DomainException('Rotina não encontrada.', 404);
            if ($acao === 'arquivar' || $acao === 'restaurar') {
                $this->db->atualizar('rotina', $id, ['ativa' => (int)($acao === 'restaurar')]);
                return $id;
            }
            if ($acao === 'duplicar') {
                $novo = $this->db->inserir('rotina', ['usuario_id' => $u, 'nome' => $r['nome'], 'descricao' => $r['descricao'], 'objetivo' => $r['objetivo'], 'dia_semana' => $r['dia_semana']]);
                $series = $this->db->series($id, true);
                foreach ($this->db->itens($id, true) as $x) {
                    $item = $this->db->inserir('rotina_exercicio', ['rotina_id' => $novo] + array_intersect_key($x, array_flip(['exercicio_id', 'ordem', 'descanso_segundos', 'observacao', 'grupo'])));
                    foreach ($series[$x['id']] ?? [] as $s) {
                        unset($s['id']);
                        $s['rotina_exercicio_id'] = $item;
                        $this->db->inserir('rotina_serie', $s);
                    }
                }
                return $novo;
            }
            if (!$r['ativa']) throw new DomainException('Restaure a rotina para editá-la.', 409);
            if ($acao === 'editar') $this->db->atualizar('rotina', $id, $meta());
            elseif ($acao === 'adicionar') {
                $ids = $p['exercicios'] ?? [$p['exercicio_id'] ?? null];
                if (!is_array($ids) || !$ids) throw new \InvalidArgumentException('Selecione exercícios.');
                foreach ($ids as $e) {
                    $e = self::id(['e' => $e], 'e');
                    $this->exercicio($e, $u);
                    $this->anexar('rotina_exercicio', 'rotina_id', $id, 'ordem', ['exercicio_id' => $e]);
                }
            } else $this->itemRotina($id, $u, $p, $acao);
            return $id;
        });
    }

    private function anexar(string $tabela, string $chave, int $pai, string $pos, array $dados): int
    {
        $ordem = $this->db->consultar("SELECT COALESCE(MAX($pos),0)+1 FROM $tabela WHERE $chave=?", [$pai])->fetchColumn();
        return $this->db->inserir($tabela, [$chave => $pai, $pos => $ordem] + $dados);
    }

    private function mover(string $tabela, string $chave, int $pai, string $pos, array $x, bool $subir): void
    {
        [$op, $dir] = $subir ? ['<', 'DESC'] : ['>', 'ASC'];
        $vizinho = $this->db->um("SELECT id,$pos FROM $tabela WHERE $chave=? AND $pos $op ? ORDER BY $pos $dir LIMIT 1", [$pai, $x[$pos]]);
        if (!$vizinho) return;
        $temporario = $this->db->consultar("SELECT LEAST(COALESCE(MIN($pos),0),0)-1 FROM $tabela WHERE $chave=?", [$pai])->fetchColumn();
        $this->db->atualizar($tabela, (int)$x['id'], [$pos => $temporario]);
        $this->db->atualizar($tabela, (int)$vizinho['id'], [$pos => $x[$pos]]);
        $this->db->atualizar($tabela, (int)$x['id'], [$pos => $vizinho[$pos]]);
    }

    private function itemRotina(int $id, int $u, array $p, string $acao): void
    {
        $item = self::id($p, 'item_id');
        $x = $this->db->um('SELECT x.*,tr.usa_carga,tr.usa_repeticoes,tr.usa_duracao,tr.usa_distancia
            FROM rotina_exercicio x JOIN exercicio e ON e.id=x.exercicio_id LEFT JOIN tipo_registro tr ON tr.id=e.tipo_registro_id WHERE x.id=? AND x.rotina_id=?', [$item, $id])
            ?? throw new DomainException('Item não encontrado.', 404);
        switch ($acao) {
            case 'item_salvar':
                $this->db->atualizar('rotina_exercicio', $item, [
                    'descanso_segundos' => RegistroTreino::numero($p['descanso_segundos'] ?? null, 0, 86400),
                    'grupo' => RegistroTreino::numero($p['grupo'] ?? null, 1, 99999),
                    'observacao' => RegistroTreino::texto($p['observacao'] ?? null, 4000),
                ]);
                break;
            case 'item_substituir':
                $e = self::id($p, 'exercicio_id');
                $novo = $this->exercicio($e, $u);
                if ($e !== (int)$x['exercicio_id']) {
                    $this->db->atualizar('rotina_exercicio', $item, ['exercicio_id' => $e]);
                    $limpar = ['carga_alvo' => null];
                    foreach (RegistroTreino::METAS as $k => [$flag]) if (empty($novo[$flag])) $limpar[$k] = null;
                    $campos = implode('=NULL,', array_keys($limpar)) . '=NULL';
                    $this->db->consultar("UPDATE rotina_serie SET $campos WHERE rotina_exercicio_id=?", [$item]);
                }
                break;
            case 'item_remover':
                $this->db->consultar('DELETE FROM rotina_serie WHERE rotina_exercicio_id=?', [$item]);
                $this->db->consultar('DELETE FROM rotina_exercicio WHERE id=?', [$item]);
                break;
            case 'item_subir':
            case 'item_descer':
                $this->mover('rotina_exercicio', 'rotina_id', $id, 'ordem', $x, $acao === 'item_subir');
                break;
            case 'serie_adicionar':
                $this->anexar('rotina_serie', 'rotina_exercicio_id', $item, 'numero', RegistroTreino::metas($p, $x));
                break;
            default:
                $s = self::id($p, 'serie_id');
                $serie = $this->db->um('SELECT * FROM rotina_serie WHERE id=? AND rotina_exercicio_id=?', [$s, $item])
                    ?? throw new DomainException('Série não encontrada.', 404);
                match ($acao) {
                    'serie_salvar' => $this->db->atualizar('rotina_serie', $s, RegistroTreino::metas($p, $x)),
                    'serie_remover' => $this->db->consultar('DELETE FROM rotina_serie WHERE id=?', [$s]),
                    'serie_duplicar' => $this->anexar('rotina_serie', 'rotina_exercicio_id', $item, 'numero', array_diff_key($serie, array_flip(['id', 'numero', 'rotina_exercicio_id']))),
                    'serie_subir', 'serie_descer' => $this->mover('rotina_serie', 'rotina_exercicio_id', $item, 'numero', $serie, $acao === 'serie_subir'),
                    default => throw new \InvalidArgumentException('Ação inválida.'),
                };
        }
    }

    public function personalizado(int $u, array $p): int
    {
        $id = RegistroTreino::numero($p['id'] ?? null, 1, 2147483647);
        return $this->db->transacao(function () use ($u, $p, $id) {
            $atual = $id ? $this->db->um('SELECT id,tipo_registro_id FROM exercicio WHERE id=? AND usuario_id=? AND ativo=1 FOR UPDATE', [$id, $u]) : null;
            if ($id && !$atual) throw new DomainException('Exercício não encontrado.', 404);
            $dados = [
                'nome' => RegistroTreino::texto($p['nome'] ?? null, 150, 2),
                'descricao' => RegistroTreino::texto($p['descricao'] ?? null, 4000) ?? '',
                'instrucoes' => RegistroTreino::texto($p['instrucoes'] ?? null, 4000),
            ];
            foreach (['equipamento', 'grupo_muscular', 'tipo_registro'] as $tabela) {
                $campo = $tabela . '_id';
                // Keep the measurement semantics of previous sessions and planned sets.
                if ($atual && $tabela === 'tipo_registro') continue;
                $ref = self::id($p, $campo);
                if (!$this->db->um("SELECT id FROM $tabela WHERE id=?", [$ref])) throw new DomainException('Classificação indisponível.', 422);
                $dados[$campo] = $ref;
            }
            if ($id) {
                $this->db->atualizar('exercicio', $id, $dados);
                return $id;
            }
            return $this->db->inserir('exercicio', $dados + ['usuario_id' => $u, 'codigo' => 'movi_usuario_' . bin2hex(random_bytes(16))]);
        });
    }

    public function iniciar(int $u, array $p): int
    {
        $id = RegistroTreino::numero($p['rotina_id'] ?? null, 1, 2147483647);
        return $this->db->transacao(function () use ($u, $id, $p) {
            $this->db->um('SELECT id FROM usuario WHERE id=? FOR UPDATE', [$u]);
            $r = $id ? $this->db->rotina($id, $u, true) : null;
            if ($id && (!$r || !$r['ativa'])) throw new DomainException('Rotina indisponível.', 404);
            if ($ativo = $this->db->ativo($u)) return (int)$ativo['id'];
            $this->db->consultar(
                "INSERT INTO treino (usuario_id,rotina_id,nome,status,iniciado_em) VALUES (?,?,?,'em_andamento',NOW())",
                [$u, $id, $r['nome'] ?? RegistroTreino::texto($p['nome'] ?? null, 150) ?? 'Treino livre']
            );
            $t = (int)$this->db->consultar('SELECT LAST_INSERT_ID()')->fetchColumn();
            if ($id) {
                $series = $this->db->series($id, true);
                foreach ($this->db->itens($id, true) as $x) {
                    $item = $this->db->inserir('treino_exercicio', ['treino_id' => $t, 'nome_snapshot' => $x['nome']] + array_intersect_key($x, array_flip(['exercicio_id', 'ordem', 'descanso_segundos', 'grupo', 'observacao'])));
                    foreach ($series[$x['id']] ?? [] as $s) {
                        $this->db->inserir('serie', [
                            'treino_exercicio_id' => $item,
                            'numero' => $s['numero'],
                            'tipo' => $s['tipo'],
                            'metas' => json_encode(RegistroTreino::metas(['tipo' => isset(RegistroTreino::TIPOS[$s['tipo'] ?? '']) ? $s['tipo'] : 'normal'] + $s, $x), JSON_THROW_ON_ERROR)
                        ]);
                    }
                }
            }
            return $t;
        });
    }

    public function sessao(int $u, array $p, string $acao): int
    {
        $id = self::id($p, 'treino_id');
        return $this->db->transacao(function () use ($u, $p, $acao, $id) {
            $t = $this->db->treino($id, $u, true) ?? throw new DomainException('Treino não encontrado.', 404);
            $status = $t['status'];
            if (($acao === 'finalizar' && $status === 'concluido') || ($acao === 'cancelar' && $status === 'cancelado')
                || ($acao === 'excluir' && $status === 'excluido')
            ) return $id;
            if ($status !== 'em_andamento' && !($status === 'concluido' && in_array($acao, ['serie', 'notas', 'excluir'], true))) {
                throw new DomainException('Operação indisponível para este treino.', 409);
            }
            switch ($acao) {
                case 'finalizar':
                    if (!$this->db->um('SELECT s.id FROM serie s JOIN treino_exercicio x ON x.id=s.treino_exercicio_id WHERE x.treino_id=? AND s.concluida=1 LIMIT 1', [$id])) {
                        throw new DomainException('Conclua pelo menos uma série para finalizar.', 422);
                    }
                    $this->db->consultar(
                        "UPDATE treino SET status='concluido',finalizado_em=NOW(),descanso_ate=NULL,observacao=? WHERE id=?",
                        [RegistroTreino::texto($p['observacao'] ?? $t['observacao'], 4000), $id]
                    );
                    break;
                case 'cancelar':
                    $this->db->consultar("UPDATE treino SET status='cancelado',finalizado_em=NOW(),descanso_ate=NULL WHERE id=?", [$id]);
                    break;
                case 'excluir':
                    if ($status !== 'concluido') throw new DomainException('Finalize ou descarte o treino ativo.', 409);
                    $this->db->atualizar('treino', $id, ['status' => 'excluido']);
                    break;
                case 'notas':
                    $this->db->atualizar('treino', $id, ['observacao' => RegistroTreino::texto($p['observacao'] ?? null, 4000)]);
                    break;
                case 'exercicio':
                    $e = self::id($p, 'exercicio_id');
                    $ex = $this->exercicio($e, $u);
                    $this->anexar('treino_exercicio', 'treino_id', $id, 'ordem', ['exercicio_id' => $e, 'nome_snapshot' => $ex['nome']]);
                    break;
                case 'descanso':
                    $tempo = RegistroTreino::numero($p['segundos'] ?? null, 0, 86400) ?? 0;
                    $this->descanso($id, $tempo);
                    break;
                case 'serie':
                case 'item_notas':
                    $item = self::id($p, 'item_id');
                    $x = $this->db->um('SELECT x.*,tr.usa_carga,tr.usa_repeticoes,tr.usa_duracao,tr.usa_distancia
                        FROM treino_exercicio x JOIN exercicio e ON e.id=x.exercicio_id LEFT JOIN tipo_registro tr ON tr.id=e.tipo_registro_id
                        WHERE x.id=? AND x.treino_id=?', [$item, $id]) ?? throw new DomainException('Exercício não encontrado.', 404);
                    if ($acao === 'item_notas') {
                        $this->db->atualizar('treino_exercicio', $item, [
                            'observacao' => RegistroTreino::texto($p['observacao'] ?? null, 4000),
                            'descanso_segundos' => RegistroTreino::numero($p['descanso_segundos'] ?? null, 0, 86400)
                        ]);
                        break;
                    }
                    $s = RegistroTreino::numero($p['serie_id'] ?? null, 1, 2147483647);
                    $estado = $p['estado'] ?? 'concluida';
                    if (!in_array($estado, ['pendente', 'concluida', 'ignorada'], true)) throw new \InvalidArgumentException('Estado inválido.');
                    if (($p['modo'] ?? null) === 'rascunho' && (!$s || $estado !== 'pendente' || $status !== 'em_andamento')) {
                        throw new DomainException('Rascunhos exigem séries pendentes em treino ativo.', 409);
                    }
                    $dados = RegistroTreino::execucao($p, $x, $estado);
                    if ($s) {
                        $antiga = $this->db->um('SELECT concluida,ignorada FROM serie WHERE id=? AND treino_exercicio_id=?', [$s, $item])
                            ?? throw new DomainException('Série não encontrada.', 404);
                        if (($p['modo'] ?? null) === 'rascunho' && ($antiga['concluida'] || $antiga['ignorada'])) {
                            throw new DomainException('O estado da série mudou. Reabra o treino para atualizar.', 409);
                        }
                        $this->db->atualizar('serie', $s, $dados);
                        $novaConclusao = !$antiga['concluida'];
                    } else {
                        if ($status !== 'em_andamento') throw new DomainException('Edite uma série existente.', 409);
                        $chave = $p['chave'] ?? null;
                        if (!is_string($chave) || !preg_match('/^[a-f0-9]{32}$/D', $chave)) throw new \InvalidArgumentException('Identificador da requisição inválido.');
                        if ($this->db->um('SELECT id FROM serie WHERE treino_exercicio_id=? AND chave=?', [$item, $chave])) return $id;
                        $this->anexar('serie', 'treino_exercicio_id', $item, 'numero', $dados + ['chave' => $chave]);
                        $novaConclusao = true;
                    }
                    if ($status === 'em_andamento' && $dados['concluida'] && $novaConclusao && $x['descanso_segundos']) $this->descanso($id, (int)$x['descanso_segundos']);
                    break;
                default:
                    throw new \InvalidArgumentException('Ação inválida.');
            }
            return $id;
        });
    }

    private function descanso(int $id, int $tempo): void
    {
        $this->db->consultar('UPDATE treino SET descanso_ate=IF(?=0,NULL,TIMESTAMPADD(SECOND,?,NOW())) WHERE id=?', [$tempo, $tempo, $id]);
    }
}
