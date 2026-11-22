<?php

declare(strict_types=1);

namespace App\Repositories;

/**
 * Recupera propostas na perspectiva do aluno ou do profissional. Relaciona o envio ao vínculo
 * histórico e lê o planejamento gravado quando o profissional enviou o modelo.
 */
final class PropostaRepository
{
    /**
     * Recebe o repositório que executa consultas na mesma conexão do serviço de propostas.
     *
     * @param TreinoRepository $db Repositório usado para executar as operações de persistência.
     */
    public function __construct(private TreinoRepository $db)
    {
    }

    // O vínculo identifica os dois participantes mesmo depois do encerramento.
    private const CONSULTA = "SELECT pr.*, v.aluno_id, v.profissional_id, a.nome AS aluno_nome,
        u.nome AS profissional_nome, (v.status='ativo' AND p.ativo AND a.ativo AND u.ativo) AS vinculo_ativo
        FROM proposta_rotina pr JOIN vinculo_profissional v ON v.id=pr.vinculo_id
        JOIN profissional p ON p.id=v.profissional_id JOIN usuario u ON u.id=p.usuario_id
        JOIN usuario a ON a.id=v.aluno_id";

    /**
     * Filtra pelo participante autenticado, aceita um aluno específico no histórico profissional e pode
     * listar apenas pendências.
     *
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @param bool $enviadas Seleciona a perspectiva do profissional remetente.
     * @param ?int $aluno ID da conta do aluno acompanhado.
     * @param bool $pendentes Restringe o histórico às propostas aguardando resposta.
     * @return list<array<string,scalar|null>>
     */
    public function listar(int $usuario, bool $enviadas, ?int $aluno, bool $pendentes): array
    {
        $condicao = $enviadas ? 'u.id=? AND p.ativo=1' : 'a.id=?';
        $args = [$usuario];
        if ($aluno !== null && $enviadas) {
            $condicao .= ' AND a.id=?';
            $args[] = $aluno;
        }
        if ($pendentes) {
            $condicao .= " AND pr.status='pendente'";
        }
        return $this->db->todos(self::CONSULTA . " WHERE $condicao ORDER BY pr.id DESC", $args);
    }

    /**
     * Confere a propriedade pelo papel do participante e busca uma proposta. Pode bloquear o registro ao
     * processar uma resposta.
     *
     * @param int $id Identificador do registro consultado ou alterado.
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @param bool $enviada Seleciona a autorização pelo remetente em vez do destinatário.
     * @param bool $bloquear Solicita bloqueio da linha durante a transação.
     * @return array<string,scalar|null>|null
     */
    public function buscar(int $id, int $usuario, bool $enviada, bool $bloquear = false): ?array
    {
        // O papel determina qual participante deve coincidir com a sessão, inclusive quando a URL contém um ID válido.
        $dono = $enviada ? 'u.id=? AND p.ativo=1 AND u.ativo=1' : 'a.id=? AND a.ativo=1';
        return $this->db->um(self::CONSULTA . " WHERE pr.id=? AND $dono" . ($bloquear ? ' FOR UPDATE' : ''), [$id, $usuario]);
    }

    /**
     * Recupera exercícios em ordem e decodifica o JSON das séries para apresentar ou copiar a versão
     * enviada.
     *
     * @param int $id Identificador do registro consultado ou alterado.
     * @return list<array<string,mixed>>
     */
    public function itens(int $id): array
    {
        $itens = $this->db->todos('SELECT exercicio_id,nome,ordem,descanso_segundos,grupo,observacao,series
            FROM proposta_exercicio WHERE proposta_id=? ORDER BY ordem', [$id]);
        foreach ($itens as &$item) {
            $item['series'] = json_decode($item['series'], true, 512, JSON_THROW_ON_ERROR);
        }
        return $itens;
    }
}
