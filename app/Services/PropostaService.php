<?php

declare(strict_types=1);

namespace App\Services;

use App\Repositories\PropostaRepository;
use App\Repositories\TreinoRepository;
use DomainException;
use InvalidArgumentException;

/**
 * Coordena a troca de rotinas entre profissional e aluno. Usa os repositórios de propostas e treinos
 * para preservar o conteúdo enviado e gravar o aceite junto com a cópia pessoal.
 */
final class PropostaService
{
    private PropostaRepository $propostas;

    /**
     * Compartilha o repositório de treino com o leitor de propostas para participar da mesma transação.
     *
     * @param TreinoRepository $db Repositório usado para executar as operações de persistência.
     */
    public function __construct(private TreinoRepository $db)
    {
        $this->propostas = new PropostaRepository($db);
    }

    /**
     * Confere o vínculo e o modelo do remetente, trata reenvios e grava uma versão dos exercícios e
     * metas. Devolve o ID da proposta.
     *
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @param int $aluno ID da conta do aluno acompanhado.
     * @param int $modelo ID do modelo profissional de origem.
     * @param string $chave Chave que identifica o envio do formulário.
     * @return int
     * @throws InvalidArgumentException Identificador de envio inválido. Reabra o modelo.
     * @throws DomainException Para perfil, vínculo, modelo ou exercício indisponível, ou proposta pendente em conflito.
     */
    public function enviar(int $usuario, int $aluno, int $modelo, string $chave): int
    {
        if (!preg_match('/^[0-9a-f]{32}$/D', $chave)) {
            throw new InvalidArgumentException('Identificador de envio inválido. Reabra o modelo.');
        }
        return $this->db->transacao(function () use ($usuario, $aluno, $modelo, $chave) {
            $profissional = $this->db->profissionalAtivo($usuario, true)
                ?? throw new DomainException('Perfil profissional inativo.', 403);
            // O vínculo autoriza o envio. O histórico de treinos tem uma permissão própria.
            $vinculo = $this->db->um("SELECT v.id FROM vinculo_profissional v JOIN usuario a ON a.id=v.aluno_id
                WHERE v.profissional_id=? AND a.id=? AND a.ativo=1 AND v.status='ativo' FOR UPDATE", [$profissional, $aluno])
                ?? throw new DomainException('Vínculo ativo não encontrado.', 404);
            $rotina = $this->db->rotina($modelo, $usuario, true);
            if (!$rotina || !$rotina['modelo_profissional'] || !$rotina['ativa']) {
                throw new DomainException('Modelo indisponível.', 404);
            }
            $par = [$vinculo['id'], $modelo];
            // Repetir o mesmo formulário devolve a proposta original. Outro envio do mesmo modelo deve aguardar o fim da pendência.
            $anterior = $this->db->um('SELECT id FROM proposta_rotina WHERE vinculo_id=? AND modelo_id=? AND chave_envio=?', [...$par, $chave]);
            if ($anterior) {
                return (int) $anterior['id'];
            }
            if ($this->db->um("SELECT id FROM proposta_rotina WHERE vinculo_id=? AND modelo_id=? AND status='pendente'", $par)) {
                throw new DomainException('Este aluno já tem uma proposta pendente deste modelo.', 409);
            }
            $itens = $this->db->planejamento($modelo);
            if (!$itens) {
                throw new DomainException('Adicione pelo menos um exercício antes de enviar.', 422);
            }
            $this->validarCatalogo($itens, $aluno);

            // A proposta recebe uma cópia para o aluno poder revisar o que foi enviado.
            $id = $this->db->inserir('proposta_rotina', ['vinculo_id' => $vinculo['id'], 'modelo_id' => $modelo,
                'chave_envio' => $chave] + $this->cabecalho($rotina));
            foreach ($itens as $item) {
                $item['series'] = json_encode($item['series'], JSON_THROW_ON_ERROR);
                $this->db->inserir('proposta_exercicio', ['proposta_id' => $id] + $item);
            }
            return $id;
        });
    }

    /**
     * Autoriza o remetente a cancelar e o destinatário a aceitar ou recusar. Bloqueia a proposta para
     * que dois aceites usem a mesma cópia.
     *
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @param int $id Identificador do registro consultado ou alterado.
     * @param string $acao Operação solicitada pelo formulário.
     * @throws InvalidArgumentException Resposta inválida.
     * @throws DomainException Para proposta inacessível, estado encerrado ou vínculo e catálogo indisponíveis no aceite.
     */
    public function responder(int $usuario, int $id, string $acao): void
    {
        $estados = ['aceitar' => 'aceita', 'recusar' => 'recusada', 'cancelar' => 'cancelada'];
        $estado = $estados[$acao] ?? throw new InvalidArgumentException('Resposta inválida.');
        $this->db->transacao(function () use ($usuario, $id, $acao, $estado) {
            // Só o remetente cancela. O aluno destinatário decide se aceita ou recusa.
            $proposta = $this->propostas->buscar($id, $usuario, $acao === 'cancelar', true)
                ?? throw new DomainException('Proposta não encontrada.', 404);
            // O segundo clique na mesma decisão já encontra a resposta gravada, inclusive a rotina criada no primeiro aceite.
            if ($proposta['status'] === $estado) {
                return;
            }
            if ($proposta['status'] !== 'pendente') {
                throw new DomainException('Esta proposta já foi encerrada.', 409);
            }
            $rotina = null;
            if ($acao === 'aceitar') {
                if (!$proposta['vinculo_ativo']) {
                    throw new DomainException('O vínculo e as duas contas precisam estar ativos para aceitar.', 409);
                }
                // O aceite usa o planejamento guardado no envio, mesmo quando o profissional já alterou o modelo.
                $itens = $this->propostas->itens($id);
                $this->validarCatalogo($itens, $usuario);
                $rotina = $this->db->inserir('rotina', ['usuario_id' => $usuario,
                    'profissional_id' => $proposta['profissional_id']] + $this->cabecalho($proposta));
                $this->db->copiarPlanejamento($rotina, $itens);
            }
            // A resposta e a rotina do aluno são confirmadas juntas, inclusive em um reenvio.
            $this->db->consultar('UPDATE proposta_rotina SET status=?, rotina_aceita_id=?, respondida_em=NOW() WHERE id=?',
                [$estado, $rotina, $id]);
        });
    }

    /**
     * Seleciona nome, descrição, objetivo e dia da semana que passam do modelo à proposta e desta à
     * rotina aceita.
     *
     * @param array $rotina Cabeçalho do modelo ou da proposta a copiar.
     * @return array<string,scalar|null>
     */
    private function cabecalho(array $rotina): array
    {
        return array_intersect_key($rotina, array_flip(['nome', 'descricao', 'objetivo', 'dia_semana']));
    }

    /**
     * Reconfere na transação cada referência ao catálogo pelo acesso do destinatário e bloqueia a
     * leitura durante o envio ou aceite.
     *
     * @param list<array> $itens Exercícios em ordem com os respectivos campos e séries.
     * @param int $aluno ID da conta do aluno acompanhado.
     * @throws DomainException Um exercício da proposta está indisponível para o aluno.
     */
    private function validarCatalogo(array $itens, int $aluno): void
    {
        foreach ($itens as $item) {
            if (!$this->db->exercicioDisponivel((int) $item['exercicio_id'], $aluno, true)) {
                throw new DomainException('Um exercício da proposta está indisponível para o aluno.', 409);
            }
        }
    }
}
