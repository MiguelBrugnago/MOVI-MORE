<?php

declare(strict_types=1);

namespace App\Repositories;

use DomainException;
use InvalidArgumentException;
use Throwable;

use App\Config\Database;
use PDO;

/**
 * Persiste solicitações e vínculos entre alunos e profissionais. Controla quem pode responder, quais
 * categorias de dados tiveram consentimento e registra leituras autorizadas.
 */
class VinculoProfissionalRepository
{
    /**
     * Agrupa as categorias dos vínculos ativos que aparecem na tela de compartilhamento.
     */
    public function permissoesDoAluno(int $aluno): array
    {
        $s = $this->pdo->prepare("SELECT v.id,p.categoria_dados,p.permitido FROM vinculo_profissional v
            JOIN permissao_acesso p ON p.vinculo_profissional_id=v.id WHERE v.aluno_id=? AND v.status='ativo'");
        $s->execute([$aluno]);
        $permissoes = [];
        foreach ($s as $linha) {
            $permissoes[$linha['id']][$linha['categoria_dados']] = (int)$linha['permitido'];
        }
        return $permissoes;
    }

    /**
     * Confere a categoria e bloqueia o vínculo ativo do aluno antes de conceder ou revogar acesso com
     * horário do banco.
     *
     * @param int $aluno ID da conta do aluno acompanhado.
     * @param int $vinculo Identificador da relação entre profissional e aluno.
     * @param string $categoria Categoria de dados sujeita ao consentimento do aluno.
     * @param bool $permitir Indica concessão ou revogação de acesso.
     * @throws InvalidArgumentException Categoria inválida.
     * @throws DomainException Vínculo não encontrado.
     */
    public function permitir(int $aluno, int $vinculo, string $categoria, bool $permitir): void
    {
        if (!in_array($categoria, ['fisico', 'saude', 'treinos', 'nutricao'], true)) {
            throw new InvalidArgumentException('Categoria inválida.');
        }
        $this->transacao(function () use ($aluno, $vinculo, $categoria, $permitir) {
            $s = $this->pdo->prepare("SELECT id FROM vinculo_profissional WHERE id=? AND aluno_id=? AND status='ativo' FOR UPDATE");
            $s->execute([$vinculo, $aluno]);
            if (!$s->fetchColumn()) {
                throw new DomainException('Vínculo não encontrado.', 404);
            }
            $s = $this->pdo->prepare('INSERT INTO permissao_acesso (vinculo_profissional_id,categoria_dados,permitido,concedido_em,revogado_em)
                VALUES (?,?,?,IF(?=1,NOW(),NULL),IF(?=0,NOW(),NULL)) ON DUPLICATE KEY UPDATE
                permitido=VALUES(permitido),concedido_em=VALUES(concedido_em),revogado_em=VALUES(revogado_em)');
            $s->execute([$vinculo, $categoria, (int)$permitir, (int)$permitir, (int)$permitir]);
        });
    }

    /**
     * Exige as duas contas e o vínculo ativos, permissão concedida no vínculo atual e ausência de
     * revogação.
     *
     * O aluno escolhe quais categorias o profissional pode consultar no vínculo atual.
     *
     * @param int $profissionalUsuario ID da conta do profissional que solicita leitura.
     * @param int $aluno ID da conta do aluno acompanhado.
     * @param string $categoria Categoria de dados sujeita ao consentimento do aluno.
     * @return bool
     */
    public function autorizado(int $profissionalUsuario, int $aluno, string $categoria): bool
    {
        $s = $this->pdo->prepare("SELECT 1 FROM vinculo_profissional v JOIN profissional p ON p.id=v.profissional_id
            JOIN usuario u ON u.id=p.usuario_id JOIN usuario a ON a.id=v.aluno_id
            JOIN permissao_acesso pa ON pa.vinculo_profissional_id=v.id
            WHERE p.usuario_id=? AND v.aluno_id=? AND v.status='ativo' AND p.ativo=1 AND u.ativo=1 AND a.ativo=1
            AND pa.categoria_dados=? AND pa.permitido=1 AND pa.revogado_em IS NULL AND pa.concedido_em>=v.iniciado_em");
        $s->execute([$profissionalUsuario, $aluno, $categoria]);
        return (bool)$s->fetchColumn();
    }

    /**
     * Registra na auditoria quem consultou qual recurso de qual aluno.
     *
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @param int $aluno ID da conta do aluno acompanhado.
     * @param string $recurso Nome do recurso consultado para o registro de auditoria.
     */
    public function registrarLeitura(int $usuario, int $aluno, string $recurso): void
    {
        $s = $this->pdo->prepare("INSERT INTO auditoria_acesso (usuario_id,aluno_id,recurso,acao) VALUES (?,?,?,'consultar')");
        $s->execute([$usuario, $aluno, $recurso]);
    }

    /**
     * Executa a alteração do vínculo e os efeitos associados na mesma transação e reverte tudo em caso
     * de erro.
     *
     * @template T
     * @param callable():T $acao Operação cujas escritas serão confirmadas em conjunto.
     * @return T Resultado da operação confirmada.
     * @throws Throwable Propaga a falha que interrompeu a transação.
     */
    private function transacao(callable $acao): mixed
    {
        $this->pdo->beginTransaction();
        try {
            $resultado = $acao();
            $this->pdo->commit();
            return $resultado;
        } catch (Throwable $erro) {
            if ($this->pdo->inTransaction()) {
                $this->pdo->rollBack();
            }
            throw $erro;
        }
    }

    private PDO $pdo;

    /**
     * Abre a conexão compartilhada usada para vínculos, consentimentos e auditoria.
     */
    public function __construct()
    {
        $this->pdo = Database::conectar();
    }

    /**
     * Resolve o ID do perfil profissional ativo a partir do usuário autenticado.
     *
     * @param int $usuarioId ID da conta de usuário, distinto do ID do perfil profissional.
     * @return ?int
     */
    public function profissionalDoUsuario(int $usuarioId): ?int
    {
        $sql = "SELECT id FROM profissional
                WHERE usuario_id = :usuario_id AND ativo = 1";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['usuario_id' => $usuarioId]);

        $id = $stmt->fetchColumn();

        return $id === false ? null : (int) $id;
    }

    /**
     * Seleciona os vínculos da pessoa no papel escolhido e junta os nomes e e-mails dos dois
     * participantes.
     *
     * @param int $usuarioId ID da conta de usuário, distinto do ID do perfil profissional.
     * @param bool $modoProfissional Seleciona o papel profissional para esta operação.
     * @return list<array<string,scalar|null>>
     */
    public function listar(int $usuarioId, bool $modoProfissional): array
    {
        $sql = "SELECT v.*,
                       a.nome AS aluno_nome,
                       a.email AS aluno_email,
                       u.nome AS profissional_nome,
                       u.email AS profissional_email
                FROM vinculo_profissional v
                JOIN usuario a ON a.id = v.aluno_id
                JOIN profissional p ON p.id = v.profissional_id
                JOIN usuario u ON u.id = p.usuario_id
                WHERE ";

        if ($modoProfissional) {
            $sql .= "p.usuario_id = :usuario_id";
        } else {
            $sql .= "v.aluno_id = :usuario_id";
        }

        $sql .= " ORDER BY v.id DESC";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['usuario_id' => $usuarioId]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Inicia a transação de solicitação e devolve a mensagem de resultado para o formulário.
     *
     * @param int $usuarioId ID da conta de usuário, distinto do ID do perfil profissional.
     * @param string $email Endereço de e-mail da conta.
     * @param bool $modoProfissional Seleciona o papel profissional para esta operação.
     * @return string
     */
    public function solicitar(int $usuarioId, string $email, bool $modoProfissional): string
    {
        return $this->transacao(fn () => $this->solicitarNaTransacao($usuarioId, $email, $modoProfissional));
    }

    /**
     * Identifica o outro participante por e-mail, bloqueia o par e cria ou reabre a solicitação
     * revogando permissões anteriores.
     *
     * @param int $usuarioId ID da conta de usuário, distinto do ID do perfil profissional.
     * @param string $email Endereço de e-mail da conta.
     * @param bool $modoProfissional Seleciona o papel profissional para esta operação.
     * @return string
     */
    private function solicitarNaTransacao(
        int $usuarioId,
        string $email,
        bool $modoProfissional
    ): string {
        $email = trim($email);

        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return 'Informe um e-mail válido.';
        }

        if ($modoProfissional) {
            $profissionalId = $this->profissionalDoUsuario($usuarioId);

            if ($profissionalId === null) {
                return 'Você não possui um perfil profissional ativo.';
            }

            $sql = "SELECT id FROM usuario
                    WHERE email = :email AND ativo = 1";

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['email' => $email]);

            $alunoId = $stmt->fetchColumn();

            if ($alunoId === false) {
                return 'Usuário não encontrado.';
            }

            $alunoId = (int) $alunoId;
            $solicitadoPor = 'profissional';
        } else {
            $alunoId = $usuarioId;

            $sql = "SELECT p.id
                    FROM profissional p
                    JOIN usuario u ON u.id = p.usuario_id
                    WHERE u.email = :email
                      AND p.ativo = 1
                      AND u.ativo = 1";

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['email' => $email]);

            $profissionalId = $stmt->fetchColumn();

            if ($profissionalId === false) {
                return 'Profissional não encontrado.';
            }

            $profissionalId = (int) $profissionalId;
            $solicitadoPor = 'aluno';
        }

        $sql = "SELECT usuario_id FROM profissional
                WHERE id = :id FOR UPDATE";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $profissionalId]);

        if ((int) $stmt->fetchColumn() === $alunoId) {
            return 'Você não pode solicitar acompanhamento a si mesmo.';
        }

        $sql = "SELECT id, status
                FROM vinculo_profissional
                WHERE profissional_id = :profissional_id
                  AND aluno_id = :aluno_id FOR UPDATE";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([
            'profissional_id' => $profissionalId,
            'aluno_id' => $alunoId
        ]);

        // O par profissional e aluno pode voltar a se vincular. A linha bloqueada permite reusar o registro sem duplicar o par.
        $existente = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($existente) {
            if (in_array($existente['status'], ['pendente', 'ativo'], true)) {
                return 'Já existe uma solicitação ou vínculo ativo.';
            }

            // Revogação e nova solicitação precisam confirmar ou falhar juntas.
            $revogar = $this->pdo->prepare('UPDATE permissao_acesso SET permitido=0,revogado_em=NOW() WHERE vinculo_profissional_id=?');
            $revogar->execute([$existente['id']]);

            $sql = "UPDATE vinculo_profissional
                    SET status = 'pendente',
                        solicitado_por = :solicitado_por,
                        iniciado_em = NULL,
                        encerrado_em = NULL
                    WHERE id = :id";

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([
                'solicitado_por' => $solicitadoPor,
                'id' => $existente['id']
            ]);
        } else {
            $sql = "INSERT INTO vinculo_profissional
                    (profissional_id, aluno_id, solicitado_por, status)
                    VALUES
                    (:profissional_id, :aluno_id, :solicitado_por, 'pendente')";

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([
                'profissional_id' => $profissionalId,
                'aluno_id' => $alunoId,
                'solicitado_por' => $solicitadoPor
            ]);
        }

        return 'Solicitação enviada com sucesso.';
    }

    /**
     * Processa o aceite ou a recusa de forma atômica e devolve a mensagem exibida pelo controller.
     *
     * @param int $vinculoId ID da solicitação ou vínculo.
     * @param int $usuarioId ID da conta de usuário, distinto do ID do perfil profissional.
     * @param bool $modoProfissional Seleciona o papel profissional para esta operação.
     * @param bool $aceitar Decisão de aceitar ou recusar a solicitação pendente.
     * @return string
     */
    public function responder(int $vinculoId, int $usuarioId, bool $modoProfissional, bool $aceitar): string
    {
        return $this->transacao(fn () => $this->responderNaTransacao($vinculoId, $usuarioId, $modoProfissional, $aceitar));
    }

    /**
     * Trava a solicitação pendente e confere se quem responde é o destinatário. No aceite, inicia o
     * acompanhamento.
     *
     * @param int $vinculoId ID da solicitação ou vínculo.
     * @param int $usuarioId ID da conta de usuário, distinto do ID do perfil profissional.
     * @param bool $modoProfissional Seleciona o papel profissional para esta operação.
     * @param bool $aceitar Decisão de aceitar ou recusar a solicitação pendente.
     * @return string
     */
    private function responderNaTransacao(
        int $vinculoId,
        int $usuarioId,
        bool $modoProfissional,
        bool $aceitar
    ): string {
        $sql = "SELECT v.*, p.usuario_id AS usuario_profissional, p.ativo AS perfil_ativo,
                       u.ativo AS profissional_ativo, a.ativo AS aluno_ativo
                FROM vinculo_profissional v
                JOIN profissional p ON p.id = v.profissional_id
                JOIN usuario u ON u.id = p.usuario_id
                JOIN usuario a ON a.id = v.aluno_id
                WHERE v.id = :id FOR UPDATE";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $vinculoId]);
        $vinculo = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$vinculo || $vinculo['status'] !== 'pendente') {
            return 'Solicitação não encontrada ou já respondida.';
        }

        if ($modoProfissional) {
            $permitido = (int) $vinculo['usuario_profissional'] === $usuarioId
                && $vinculo['solicitado_por'] === 'aluno'
                && $this->profissionalDoUsuario($usuarioId) !== null;
        } else {
            $permitido = (int) $vinculo['aluno_id'] === $usuarioId
                && $vinculo['solicitado_por'] === 'profissional';
        }

        // Somente a parte que recebeu a solicitação pode decidir o estado do vínculo.
        if (!$permitido) {
            return 'Você não pode responder esta solicitação.';
        }

        if ($aceitar && (!$vinculo['perfil_ativo'] || !$vinculo['profissional_ativo'] || !$vinculo['aluno_ativo'])) {
            return 'Um dos participantes está inativo. Não foi possível iniciar o vínculo.';
        }
        if ($aceitar) {
            $sql = "UPDATE vinculo_profissional
                    SET status = 'ativo',
                        iniciado_em = NOW(),
                        encerrado_em = NULL
                    WHERE id = :id AND status = 'pendente'";
        } else {
            $sql = "UPDATE vinculo_profissional
                    SET status = 'recusado'
                    WHERE id = :id AND status = 'pendente'";
        }

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $vinculoId]);

        if ($stmt->rowCount() === 0) {
            return 'Esta solicitação já foi respondida.';
        }

        return $aceitar ? 'Solicitação aceita.' : 'Solicitação recusada.';
    }

    /**
     * Coordena o encerramento do vínculo e o cancelamento das propostas pendentes na mesma transação.
     *
     * @param int $vinculoId ID da solicitação ou vínculo.
     * @param int $usuarioId ID da conta de usuário, distinto do ID do perfil profissional.
     * @param bool $modoProfissional Seleciona o papel profissional para esta operação.
     * @return string
     */
    public function encerrar(int $vinculoId, int $usuarioId, bool $modoProfissional): string
    {
        return $this->transacao(fn () => $this->encerrarNaTransacao($vinculoId, $usuarioId, $modoProfissional));
    }

    /**
     * Verifica a participação antes de datar o encerramento. Cancela as propostas pendentes mesmo se o
     * vínculo vier a ser reaberto.
     *
     * @param int $vinculoId ID da solicitação ou vínculo.
     * @param int $usuarioId ID da conta de usuário, distinto do ID do perfil profissional.
     * @param bool $modoProfissional Seleciona o papel profissional para esta operação.
     * @return string
     */
    private function encerrarNaTransacao(
        int $vinculoId,
        int $usuarioId,
        bool $modoProfissional
    ): string {
        $sql = "SELECT v.*, p.usuario_id AS usuario_profissional
                FROM vinculo_profissional v
                JOIN profissional p ON p.id = v.profissional_id
                WHERE v.id = :id FOR UPDATE";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $vinculoId]);
        $vinculo = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$vinculo || $vinculo['status'] !== 'ativo') {
            return 'Vínculo ativo não encontrado.';
        }

        if ($modoProfissional) {
            $permitido = (int) $vinculo['usuario_profissional'] === $usuarioId
                && $this->profissionalDoUsuario($usuarioId) !== null;
        } else {
            $permitido = (int) $vinculo['aluno_id'] === $usuarioId;
        }

        if (!$permitido) {
            return 'Você não pode encerrar este vínculo.';
        }

        $sql = "UPDATE vinculo_profissional
                SET status = 'encerrado',
                    encerrado_em = NOW()
                WHERE id = :id AND status = 'ativo'";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $vinculoId]);

        if ($stmt->rowCount() === 0) {
            return 'Este vínculo já foi encerrado.';
        }
        // O mesmo vínculo pode ser reaberto. Propostas antigas ficam encerradas.
        $cancelar = $this->pdo->prepare("UPDATE proposta_rotina SET status='cancelada', respondida_em=NOW()
            WHERE vinculo_id=? AND status='pendente'");
        $cancelar->execute([$vinculoId]);
        return 'Vínculo encerrado.';
    }

    /**
     * Lista os alunos ativos do perfil profissional ativo com vínculo em acompanhamento, ordenados por
     * nome.
     *
     * @param int $usuarioId ID da conta de usuário, distinto do ID do perfil profissional.
     * @return list<array<string,scalar|null>>
     */
    public function listarAlunosAtivos(int $usuarioId, string $busca = ''): array
    {
        $sql = "SELECT
                v.id AS vinculo_id,
                a.id AS aluno_id,
                a.nome AS aluno_nome,
                a.email AS aluno_email,
                v.iniciado_em
            FROM vinculo_profissional v
            JOIN profissional p ON p.id = v.profissional_id
            JOIN usuario a ON a.id = v.aluno_id
            WHERE p.usuario_id = :usuario_id
              AND p.ativo = 1
              AND a.ativo = 1
              AND v.status = 'ativo'
              AND LOCATE(:busca, a.nome) > 0
            ORDER BY a.nome ASC";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['usuario_id' => $usuarioId, 'busca' => $busca]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Busca o aluno pelo par usuário profissional e ID do aluno, exigindo vínculo e cadastros ativos.
     *
     * @param int $usuarioId ID da conta de usuário, distinto do ID do perfil profissional.
     * @param int $alunoId ID da conta de aluno.
     * @return array<string,scalar|null>|null
     */
    public function buscarAlunoVinculado(
        int $usuarioId,
        int $alunoId
    ): ?array {
        $sql = "SELECT
                v.id AS vinculo_id,
                a.id AS aluno_id,
                a.nome AS aluno_nome,
                a.email AS aluno_email,
                v.iniciado_em
            FROM vinculo_profissional v
            JOIN profissional p ON p.id = v.profissional_id
            JOIN usuario a ON a.id = v.aluno_id
            WHERE p.usuario_id = :usuario_id
              AND a.id = :aluno_id
              AND p.ativo = 1
              AND a.ativo = 1
              AND v.status = 'ativo'
            LIMIT 1";

        $stmt = $this->pdo->prepare($sql);

        $stmt->execute([
            'usuario_id' => $usuarioId,
            'aluno_id' => $alunoId
        ]);

        $aluno = $stmt->fetch(PDO::FETCH_ASSOC);

        return $aluno === false ? null : $aluno;
    }
}
