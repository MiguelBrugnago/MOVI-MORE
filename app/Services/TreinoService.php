<?php

declare(strict_types=1);

namespace App\Services;

use App\Repositories\TreinoRepository as Repo;
use App\Models\Exercicio;
use App\Models\Rotina;
use App\Models\Treino;
use DomainException;

final class TreinoService
{
    public function __construct(private Repo $db)
    {
    }

    private function exercicio(int $e, int $u): array
    {
        return $this->db->exercicioDisponivel($e, $u)
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
            $meta = static fn () => [
                'nome' => RegistroTreino::texto($p['nome'] ?? null, 150, 2),
                'descricao' => RegistroTreino::texto($p['descricao'] ?? null, 4000),
                'dia_semana' => RegistroTreino::numero($p['dia_semana'] ?? null, 1, 7),
            ];
            if ($acao === 'criar') {
                return $this->db->inserir('rotina', ['usuario_id' => $u] + $meta());
            }
            $id = self::id($p, 'rotina_id');
            $r = $this->db->rotina($id, $u, true) ?? throw new DomainException('Rotina não encontrada.', 404);
            if ($acao === 'arquivar' || $acao === 'restaurar') {
                $this->db->atualizar('rotina', $id, ['ativa' => (int)($acao === 'restaurar')]);
                return $id;
            }
            // Copia exercícios e séries na mesma transação da nova rotina.
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
            if (!$r['ativa']) {
                throw new DomainException('Restaure a rotina para editá-la.', 409);
            }
            if ($acao === 'editar') {
                $this->db->atualizar('rotina', $id, $meta());
            } elseif ($acao === 'adicionar') {
                $ids = $p['exercicios'] ?? [$p['exercicio_id'] ?? null];
                if (!is_array($ids) || !$ids) {
                    throw new \InvalidArgumentException('Selecione exercícios.');
                }
                $rotina = new Rotina((bool) $r['ativa']);
                foreach ($ids as $e) {
                    $dados = $this->exercicio(self::id(['e' => $e], 'e'), $u);
                    $rotina->adicionar(new Exercicio((int) $dados['id'], $dados['nome']));
                }
                foreach ($rotina->exercicios() as $exercicio) {
                    $this->db->anexar('rotina_exercicio', 'rotina_id', $id, 'ordem', ['exercicio_id' => $exercicio->id()]);
                }
            } else {
                $this->itemRotina($id, $u, $p, $acao);
            }
            return $id;
        });
    }

    private function itemRotina(int $id, int $u, array $p, string $acao): void
    {
        $item = self::id($p, 'item_id');
        $x = $this->db->item($item, $id, true)
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
                    // A carga anterior e as metas incompatíveis não passam ao novo exercício.
                    $limpar = ['carga_alvo' => null];
                    foreach (RegistroTreino::METAS as $k => [$flag]) {
                        if (empty($novo[$flag])) {
                            $limpar[$k] = null;
                        }
                    }
                    $this->db->limparMetas($item, array_keys($limpar));
                }
                break;
            case 'item_remover':
                $this->db->removerItemRotina($item);
                break;
            case 'item_subir':
            case 'item_descer':
                $this->db->mover('rotina_exercicio', 'rotina_id', $id, 'ordem', $x, $acao === 'item_subir');
                break;
            case 'serie_adicionar':
                $this->db->anexar('rotina_serie', 'rotina_exercicio_id', $item, 'numero', RegistroTreino::metas($p, $x));
                break;
            default:
                $s = self::id($p, 'serie_id');
                $serie = $this->db->serieDoItem($s, $item, true)
                    ?? throw new DomainException('Série não encontrada.', 404);
                match ($acao) {
                    'serie_salvar' => $this->db->atualizar('rotina_serie', $s, RegistroTreino::metas($p, $x)),
                    'serie_remover' => $this->db->removerSerieRotina($s),
                    'serie_duplicar' => $this->db->anexar('rotina_serie', 'rotina_exercicio_id', $item, 'numero', array_diff_key($serie, array_flip(['id', 'numero', 'rotina_exercicio_id']))),
                    'serie_subir', 'serie_descer' => $this->db->mover('rotina_serie', 'rotina_exercicio_id', $item, 'numero', $serie, $acao === 'serie_subir'),
                    default => throw new \InvalidArgumentException('Ação inválida.'),
                };
        }
    }

    public function personalizado(int $u, array $p): int
    {
        $id = RegistroTreino::numero($p['id'] ?? null, 1, 2147483647);
        return $this->db->transacao(function () use ($u, $p, $id) {
            $atual = $id ? $this->db->personalizado($id, $u) : null;
            if ($id && !$atual) {
                throw new DomainException('Exercício não encontrado.', 404);
            }
            $dados = [
                'nome' => RegistroTreino::texto($p['nome'] ?? null, 150, 2),
                'descricao' => RegistroTreino::texto($p['descricao'] ?? null, 4000) ?? '',
                'instrucoes' => RegistroTreino::texto($p['instrucoes'] ?? null, 4000),
            ];
            foreach (['equipamento', 'grupo_muscular', 'tipo_registro'] as $tabela) {
                $campo = $tabela . '_id';
                // Preserva a modalidade dos históricos e das metas já registradas.
                if ($atual && $tabela === 'tipo_registro') {
                    continue;
                }
                $ref = self::id($p, $campo);
                if (!$this->db->classificacaoExiste($tabela, $ref)) {
                    throw new DomainException('Classificação indisponível.', 422);
                }
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
            $this->db->bloquearUsuario($u);
            $r = $id ? $this->db->rotina($id, $u, true) : null;
            if ($id && (!$r || !$r['ativa'])) {
                throw new DomainException('Rotina indisponível.', 404);
            }
            if ($ativo = $this->db->ativo($u)) {
                return (int)$ativo['id'];
            }
            $nome = $r['nome'] ?? RegistroTreino::texto($p['nome'] ?? null, 150) ?? 'Treino livre';
            $t = $this->db->iniciarTreino($u, $id, $nome);
            if ($id) {
                // O treino guarda as metas da rotina como estavam no início da sessão.
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
            $treino = new Treino($t['status']);
            $status = $treino->status();
            if (!$treino->autorizar($acao)) {
                return $id;
            }
            switch ($acao) {
                case 'finalizar':
                    $treino->finalizar($this->db->possuiSerieConcluida($id));
                    $this->db->finalizarTreino($id, RegistroTreino::texto($p['observacao'] ?? $t['observacao'], 4000));
                    break;
                case 'cancelar':
                    $this->db->cancelarTreino($id);
                    break;
                case 'excluir':
                    $this->db->atualizar('treino', $id, ['status' => 'excluido']);
                    break;
                case 'notas':
                    $this->db->atualizar('treino', $id, ['observacao' => RegistroTreino::texto($p['observacao'] ?? null, 4000)]);
                    break;
                case 'exercicio':
                    $e = self::id($p, 'exercicio_id');
                    $ex = $this->exercicio($e, $u);
                    $this->db->anexar('treino_exercicio', 'treino_id', $id, 'ordem', ['exercicio_id' => $e, 'nome_snapshot' => $ex['nome']]);
                    break;
                case 'descanso':
                    $tempo = RegistroTreino::numero($p['segundos'] ?? null, 0, 86400) ?? 0;
                    $this->db->descanso($id, $tempo);
                    break;
                case 'serie':
                case 'item_notas':
                    $item = self::id($p, 'item_id');
                    $x = $this->db->item($item, $id, false) ?? throw new DomainException('Exercício não encontrado.', 404);
                    if ($acao === 'item_notas') {
                        $this->db->atualizar('treino_exercicio', $item, [
                            'observacao' => RegistroTreino::texto($p['observacao'] ?? null, 4000),
                            'descanso_segundos' => RegistroTreino::numero($p['descanso_segundos'] ?? null, 0, 86400)
                        ]);
                        break;
                    }
                    $this->salvarSerie($id, $item, $x, $p, $status);
                    break;
                default:
                    throw new \InvalidArgumentException('Ação inválida.');
            }
            return $id;
        });
    }

    private function salvarSerie(int $id, int $item, array $x, array $p, string $status): void
    {
        $s = RegistroTreino::numero($p['serie_id'] ?? null, 1, 2147483647);
        $estado = $p['estado'] ?? 'concluida';
        if (!in_array($estado, ['pendente', 'concluida', 'ignorada'], true)) {
            throw new \InvalidArgumentException('Estado inválido.');
        }
        if (($p['modo'] ?? null) === 'rascunho' && (!$s || $estado !== 'pendente' || $status !== 'em_andamento')) {
            throw new DomainException('Rascunhos exigem séries pendentes em treino ativo.', 409);
        }
        $dados = RegistroTreino::execucao($p, $x, $estado);
        if ($s) {
            $antiga = $this->db->serieDoItem($s, $item)
                ?? throw new DomainException('Série não encontrada.', 404);
            if (($p['modo'] ?? null) === 'rascunho' && ($antiga['concluida'] || $antiga['ignorada'])) {
                throw new DomainException('O estado da série mudou. Reabra o treino para atualizar.', 409);
            }
            $this->db->atualizar('serie', $s, $dados);
            $novaConclusao = !$antiga['concluida'];
        } else {
            if ($status !== 'em_andamento') {
                throw new DomainException('Edite uma série existente.', 409);
            }
            $chave = $p['chave'] ?? null;
            if (!is_string($chave) || !preg_match('/^[a-f0-9]{32}$/D', $chave)) {
                throw new \InvalidArgumentException('Identificador da requisição inválido.');
            }
            // A chave evita inserir novamente uma série enviada pela mesma requisição.
            if ($this->db->seriePorChave($item, $chave)) {
                return;
            }
            $this->db->anexar('serie', 'treino_exercicio_id', $item, 'numero', $dados + ['chave' => $chave]);
            $novaConclusao = true;
        }
        if ($status === 'em_andamento' && $dados['concluida'] && $novaConclusao && $x['descanso_segundos']) {
            $this->db->descanso($id, (int)$x['descanso_segundos']);
        }
    }
}
