<?php

declare(strict_types=1);

namespace App\Services;

use InvalidArgumentException;

use App\Repositories\TreinoRepository as Repo;
use App\Models\Exercicio;
use App\Models\Rotina;
use App\Models\Treino;
use DomainException;

/**
 * Coordena as alterações de rotinas, exercícios privados e sessões. Recebe o dono autenticado do
 * controller, consulta os modelos de domínio e agrupa as gravações relacionadas em uma transação do
 * TreinoRepository.
 */
final class TreinoService
{
    /**
     * Recebe o repositório que mantém as operações de cada treino na mesma conexão.
     *
     * @param Repo $db Repositório usado para executar as operações de persistência.
     */
    public function __construct(private Repo $db)
    {
    }

    /**
     * Localiza um exercício ativo e acessível ao dono. Um usuário nulo restringe a seleção ao catálogo
     * público.
     *
     * @param int $e Identificador do exercício no catálogo.
     * @param ?int $u ID da conta proprietária dos dados.
     * @return array<string,scalar|null>
     * @throws DomainException Exercício indisponível.
     */
    private function exercicio(int $e, ?int $u): array
    {
        return $this->db->exercicioDisponivel($e, $u)
            ?? throw new DomainException('Exercício indisponível.', 404);
    }

    /**
     * Lê uma chave obrigatória do formulário como inteiro positivo dentro da faixa aceita para os IDs.
     *
     * @param array<string,mixed> $p Campos de entrada identificados pelo nome no formulário ou na URL.
     * @param string $k Chave do identificador dentro dos campos de entrada.
     * @return int
     * @throws InvalidArgumentException Identificador ausente.
     */
    public static function id(array $p, string $k): int
    {
        return RegistroTreino::numero($p[$k] ?? null, 1, 2147483647)
            ?? throw new InvalidArgumentException('Identificador ausente.');
    }

    /**
     * Cria, edita, duplica, arquiva ou restaura a rotina do dono. Na edição, bloqueia a rotina e confere
     * se o editor está em modo pessoal ou profissional.
     *
     * @param int $u ID da conta proprietária dos dados.
     * @param array $p Campos de entrada identificados pelo nome no formulário ou na URL.
     * @param string $acao Operação solicitada pelo formulário.
     * @param bool $modelo Indica se o editor trabalha com modelos profissionais.
     * @return int
     * @throws DomainException Quando propriedade, perfil, disponibilidade ou estado impedem a alteração da rotina.
     * @throws InvalidArgumentException Selecione exercícios.
     */
    public function rotina(int $u, array $p, string $acao, bool $modelo = false): int
    {
        return $this->db->transacao(function () use ($u, $p, $acao, $modelo) {
            // O servidor decide se o editor está criando um modelo ou uma rotina pessoal.
            $dono = ['usuario_id' => $u, 'modelo_profissional' => (int) $modelo];
            if ($modelo) {
                $dono['profissional_id'] = $this->db->profissionalAtivo($u, true)
                    ?? throw new DomainException('Perfil profissional inativo.', 403);
            }
            /** Valida nome, descrição, dia e objetivo somente nas ações que precisam salvar o cabeçalho. */
            $meta = static fn (?string $objetivo = null) => [
                'nome' => RegistroTreino::texto($p['nome'] ?? null, 150, 2),
                'descricao' => RegistroTreino::texto($p['descricao'] ?? null, 4000),
                'dia_semana' => RegistroTreino::numero($p['dia_semana'] ?? null, 1, 7),
                // Formulários antigos não enviam o objetivo e devem preservar o valor salvo.
                'objetivo' => RegistroTreino::texto($p['objetivo'] ?? $objetivo, 80),
            ];
            if ($acao === 'criar') {
                return $this->db->inserir('rotina', $dono + $meta());
            }
            $id = self::id($p, 'rotina_id');
            // O dono vem da sessão. O bloqueio mantém o planejamento estável enquanto exercícios ou séries mudam de posição.
            $r = $this->db->rotina($id, $u, true) ?? throw new DomainException('Rotina não encontrada.', 404);
            // O profissional pode aproveitar uma rotina que já usava na própria conta.
            $copiarPessoal = $modelo && $acao === 'copiar_pessoal' && !$r['modelo_profissional'];
            if ((bool) $r['modelo_profissional'] !== $modelo && !$copiarPessoal) {
                throw new DomainException('Rotina não encontrada.', 404);
            }
            if ($acao === 'arquivar' || $acao === 'restaurar') {
                $this->db->atualizar('rotina', $id, ['ativa' => (int)($acao === 'restaurar')]);
                return $id;
            }
            // Copia exercícios e séries na mesma transação da nova rotina.
            if ($acao === 'duplicar' || $copiarPessoal) {
                $itens = $this->db->planejamento($id);
                if ($copiarPessoal) {
                    foreach ($itens as $item) {
                        if (!$this->db->exercicioDisponivel((int) $item['exercicio_id'], null, true)) {
                            throw new DomainException('A rotina contém um exercício privado ou inativo. Use apenas exercícios públicos ativos no modelo.', 422);
                        }
                    }
                }
                $campos = array_intersect_key($r, array_flip(['nome', 'descricao', 'objetivo', 'dia_semana']));
                $novo = $this->db->inserir('rotina', $dono + $campos);
                $this->db->copiarPlanejamento($novo, $itens);
                return $novo;
            }
            if (!$r['ativa']) {
                throw new DomainException('Restaure a rotina para editá-la.', 409);
            }
            if ($acao === 'editar') {
                $this->db->atualizar('rotina', $id, $meta($r['objetivo']));
            } elseif ($acao === 'adicionar') {
                $ids = $p['exercicios'] ?? [$p['exercicio_id'] ?? null];
                if (!is_array($ids) || !$ids) {
                    throw new InvalidArgumentException('Selecione exercícios.');
                }
                $rotina = new Rotina((bool) $r['ativa']);
                foreach ($ids as $e) {
                    $dados = $this->exercicio(self::id(['e' => $e], 'e'), $modelo ? null : $u);
                    $rotina->adicionar(new Exercicio((int) $dados['id'], $dados['nome']));
                }
                // A seleção inteira já foi validada. A transação grava as posições em sequência ou desfaz o lote.
                foreach ($rotina->exercicios() as $exercicio) {
                    $this->db->anexar('rotina_exercicio', 'rotina_id', $id, 'ordem', ['exercicio_id' => $exercicio->id()]);
                }
            } else {
                $this->itemRotina($id, $modelo ? null : $u, $p, $acao);
            }
            return $id;
        });
    }

    /**
     * Localiza o exercício dentro da rotina bloqueada e aplica mudanças de ordem, descanso, metas ou
     * séries somente nesse item.
     *
     * @param int $id Identificador do registro consultado ou alterado.
     * @param ?int $u ID da conta proprietária dos dados.
     * @param array $p Campos de entrada identificados pelo nome no formulário ou na URL.
     * @param string $acao Operação solicitada pelo formulário.
     * @throws DomainException Item não encontrado.
     * @throws InvalidArgumentException Ação inválida.
     */
    private function itemRotina(int $id, ?int $u, array $p, string $acao): void
    {
        $item = self::id($p, 'item_id');
        // A busca combina item e rotina para impedir que uma edição atinja o exercício de outro planejamento.
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
                    default => throw new InvalidArgumentException('Ação inválida.'),
                };
        }
    }

    /**
     * Cria ou edita um exercício da conta, valida as classificações e preserva o tipo de registro nos
     * exercícios já cadastrados.
     *
     * @param int $u ID da conta proprietária dos dados.
     * @param array $p Campos de entrada identificados pelo nome no formulário ou na URL.
     * @return int
     * @throws DomainException Exercício não encontrado.
     */
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

    /**
     * Bloqueia o usuário, reaproveita uma sessão em andamento ou inicia outra. Com rotina, copia nome,
     * ordem e metas para a sessão.
     *
     * @param int $u ID da conta proprietária dos dados.
     * @param array $p Campos de entrada identificados pelo nome no formulário ou na URL.
     * @return int
     * @throws DomainException Rotina indisponível.
     */
    public function iniciar(int $u, array $p): int
    {
        $id = RegistroTreino::numero($p['rotina_id'] ?? null, 1, 2147483647);
        return $this->db->transacao(function () use ($u, $id, $p) {
            // O bloqueio antecede a busca do treino ativo para que duas abas não iniciem sessões simultâneas da mesma conta.
            $this->db->bloquearUsuario($u);
            $r = $id ? $this->db->rotina($id, $u, true) : null;
            if ($id && (!$r || !$r['ativa'] || $r['modelo_profissional'])) {
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

    /**
     * Bloqueia o treino do usuário, consulta a transição em Treino e grava o resultado da ação. Um
     * reenvio da mesma transição devolve o ID existente.
     *
     * @param int $u ID da conta proprietária dos dados.
     * @param array $p Campos de entrada identificados pelo nome no formulário ou na URL.
     * @param string $acao Operação solicitada pelo formulário.
     * @return int
     * @throws DomainException Treino não encontrado.
     * @throws InvalidArgumentException Ação inválida.
     */
    public function sessao(int $u, array $p, string $acao): int
    {
        $id = self::id($p, 'treino_id');
        return $this->db->transacao(function () use ($u, $p, $acao, $id) {
            $t = $this->db->treino($id, $u, true) ?? throw new DomainException('Treino não encontrado.', 404);
            // O objeto de domínio decide quais transições o estado admite. Só depois o repositório atualiza o banco.
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
                    throw new InvalidArgumentException('Ação inválida.');
            }
            return $id;
        });
    }

    /**
     * Distingue edição, rascunho e nova série e a chave do formulário evita inserção dupla. Uma nova
     * conclusão pode iniciar o descanso do exercício.
     *
     * @param int $id Identificador do registro consultado ou alterado.
     * @param int $item Identificador da ocorrência do exercício na rotina ou sessão.
     * @param array $x Dados do exercício ou série já localizados no banco.
     * @param array $p Campos de entrada identificados pelo nome no formulário ou na URL.
     * @param string $status Estado persistido da sessão.
     * @throws InvalidArgumentException Estado inválido.
     * @throws DomainException Rascunhos exigem séries pendentes em treino ativo.
     */
    private function salvarSerie(int $id, int $item, array $x, array $p, string $status): void
    {
        $s = RegistroTreino::numero($p['serie_id'] ?? null, 1, 2147483647);
        $estado = $p['estado'] ?? 'concluida';
        if (!in_array($estado, ['pendente', 'concluida', 'ignorada'], true)) {
            throw new InvalidArgumentException('Estado inválido.');
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
            // Editar uma série já concluída não reinicia o descanso. O cronômetro depende da passagem para concluída.
            $novaConclusao = !$antiga['concluida'];
        } else {
            if ($status !== 'em_andamento') {
                throw new DomainException('Edite uma série existente.', 409);
            }
            $chave = $p['chave'] ?? null;
            if (!is_string($chave) || !preg_match('/^[a-f0-9]{32}$/D', $chave)) {
                throw new InvalidArgumentException('Identificador da requisição inválido.');
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
