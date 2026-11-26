<?php

declare(strict_types=1);

namespace App\Repositories;

use App\Services\PerfilFisicoService;
use App\Support\PerfilFisicoConstantes;
use DomainException;
use PDO;
use Throwable;

/**
 * Persiste perfil, avaliações, medidas e declarações da conta. Combina PDO com PerfilFisicoService
 * para apresentar medidas conhecidas e composição corporal no histórico.
 */
final class PerfilFisicoRepository
{
    /**
     * Recebe a conexão que será compartilhada por avaliações e respectivas medidas.
     *
     * @param PDO $pdo Conexão PDO da aplicação.
     */
    public function __construct(private PDO $pdo)
    {
    }

    /**
     * Executa a consulta preparada com os argumentos vinculados e devolve o cursor para leitura.
     *
     * @param string $sql Instrução SQL com marcadores para os valores externos.
     * @param array<int|string,scalar|null> $args Valores vinculados aos marcadores da consulta.
     * @return \PDOStatement
     */
    private function consultar(string $sql, array $args = []): \PDOStatement
    {
        $s = $this->pdo->prepare($sql);
        $s->execute($args);
        return $s;
    }

    /**
     * Confirma o resultado do callback ou reverte a transação se qualquer etapa falhar.
     *
     * @template T
     * @param callable():T $fn Operação a executar no contexto deste método.
     * @return T Resultado da operação confirmada.
     * @throws Throwable Propaga a falha que interrompeu a transação.
     */
    private function transacao(callable $fn): mixed
    {
        $this->pdo->beginTransaction();
        try {
            $resultado = $fn();
            $this->pdo->commit();
            return $resultado;
        } catch (Throwable $e) {
            if ($this->pdo->inTransaction()) {
                $this->pdo->rollBack();
            }
            throw $e;
        }
    }

    /**
     * Lê o perfil junto à data de nascimento da conta, inclusive quando ainda não existe linha em
     * perfil.
     *
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @return array
     */
    public function perfil(int $usuario): array
    {
        return $this->consultar('SELECT p.*,u.data_nascimento FROM usuario u LEFT JOIN perfil p ON p.usuario_id=u.id WHERE u.id=?', [$usuario])->fetch() ?: [];
    }

    /**
     * Atualiza nascimento e insere ou atualiza os campos permitidos do perfil em uma transação.
     *
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @param array $dados Campos associados aos seus nomes.
     */
    public function salvarPerfil(int $usuario, array $dados): void
    {
        $this->transacao(function () use ($usuario, $dados) {
            $this->consultar('UPDATE usuario SET data_nascimento=? WHERE id=?', [$dados['data_nascimento'], $usuario]);
            unset($dados['data_nascimento']);
            // Lista fechada: nunca usa nomes de colunas enviados pelo navegador.
            $campos = ['genero', 'objetivo', 'experiencia', 'frequencia_semanal', 'biografia', 'altura_cm', 'tempo_treinamento_meses', 'disponibilidade', 'ambiente_preferido'];
            $valores = array_map(static fn ($c) => $dados[$c], $campos);
            $colunas = implode(',', $campos);
            $params = implode(',', array_fill(0, count($campos), '?'));
            $atualizar = implode(',', array_map(static fn ($c) => "$c=VALUES($c)", $campos));
            $this->consultar("INSERT INTO perfil (usuario_id,$colunas) VALUES (?,$params) ON DUPLICATE KEY UPDATE $atualizar", [$usuario, ...$valores]);
        });
    }

    /**
     * Agrupa medidas por avaliação da conta, filtra opcionalmente por data, confere as unidades e
     * acrescenta a composição estimada.
     *
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @param ?string $inicio Data inicial inclusiva em AAAA-MM-DD, ou null para o histórico completo.
     * @return list<array{id:int,profissional_id:?int,avaliado_em:string,observacao:?string,medidas:array<string,?float>}>
     */
    public function historico(int $usuario, ?string $inicio = null, ?int $id = null): array
    {
        $rows = $this->consultar(
            'SELECT a.id,a.profissional_id,a.avaliado_em,a.observacao,m.tipo,m.valor,m.unidade
            FROM avaliacao a LEFT JOIN medida m ON m.avaliacao_id=a.id AND m.usuario_id=a.usuario_id
            WHERE a.usuario_id=?' . ($inicio !== null ? ' AND a.avaliado_em>=?' : '') . ($id !== null ? ' AND a.id=?' : '') . ' ORDER BY a.avaliado_em DESC,a.id DESC,m.id',
            array_values(array_filter([$usuario, $inicio, $id], static fn ($v) => $v !== null))
        )->fetchAll();
        $avaliacoes = [];
        foreach ($rows as $r) {
            $id = $r['id'];
            // O JOIN repete a avaliação para cada medida. O ID agrupa todas as medições em uma entrada do histórico.
            $avaliacoes[$id] ??= ['id' => $id, 'profissional_id' => $r['profissional_id'], 'avaliado_em' => substr($r['avaliado_em'], 0, 10), 'observacao' => $r['observacao'], 'medidas' => []];
            $definicao = PerfilFisicoConstantes::MEDIDAS[$r['tipo'] ?? ''] ?? null;
            if ($definicao !== null && $r['unidade'] === $definicao[1]) {
                $avaliacoes[$id]['medidas'][$r['tipo']] = (float)$r['valor'];
            }
        }
        foreach ($avaliacoes as &$a) {
            $a['medidas'] += PerfilFisicoService::composicao($a['medidas']);
        }
        return array_values($avaliacoes);
    }

    /**
     * Seleciona uma avaliação pelo ID e pela conta na consulta SQL. Rejeita registros ausentes ou de
     * outra pessoa.
     *
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @param int $id Identificador do registro consultado ou alterado.
     * @return array
     * @throws DomainException Avaliação não encontrada.
     */
    public function avaliacao(int $usuario, int $id): array
    {
        return $this->historico($usuario, null, $id)[0] ?? throw new DomainException('Avaliação não encontrada.', 404);
    }

    public function recente(int $usuario): ?array
    {
        $id = $this->consultar('SELECT id FROM avaliacao WHERE usuario_id=? ORDER BY avaliado_em DESC,id DESC LIMIT 1', [$usuario])->fetchColumn();
        return $id ? ($this->historico($usuario, null, (int)$id)[0] ?? null) : null;
    }

    /**
     * Cria ou atualiza uma avaliação autodeclarada e grava as medidas presentes com suas unidades em uma
     * única transação.
     *
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @param ?int $id Identificador do registro consultado ou alterado. Null inicia um registro novo.
     * @param array $dados Campos associados aos seus nomes.
     * @return int ID da avaliação criada ou editada.
     * @throws DomainException Quando a avaliação indicada não é autodeclarada ou não pertence à conta.
     */
    public function salvarAvaliacao(int $usuario, ?int $id, array $dados): int
    {
        return $this->transacao(function () use ($usuario, $id, $dados) {
            if ($id !== null) {
                $this->propria($usuario, $id);
                $this->consultar('UPDATE avaliacao SET avaliado_em=?,observacao=? WHERE id=? AND usuario_id=?', [$dados['avaliado_em'], $dados['observacao'], $id, $usuario]);
                // Preserva tipos legados desconhecidos; substitui somente métricas deste módulo.
                $tipos = array_keys(PerfilFisicoConstantes::MEDIDAS);
                $params = implode(',', array_fill(0, count($tipos), '?'));
                $this->consultar("DELETE FROM medida WHERE avaliacao_id=? AND usuario_id=? AND tipo IN ($params)", [$id, $usuario, ...$tipos]);
            } else {
                $this->consultar("INSERT INTO avaliacao (usuario_id,avaliado_em,observacao,metodo) VALUES (?,?,?,'Autodeclarada')", [$usuario, $dados['avaliado_em'], $dados['observacao']]);
                $id = (int)$this->pdo->lastInsertId();
            }
            foreach (PerfilFisicoConstantes::MEDIDAS as $tipo => [, $unidade]) {
                $valor = $dados['medidas'][$tipo] ?? null;
                if ($valor !== null) {
                    $this->consultar('INSERT INTO medida (usuario_id,avaliacao_id,tipo,valor,unidade,registrado_em) VALUES (?,?,?,?,?,?)', [$usuario, $id, $tipo, $valor, $unidade, $dados['avaliado_em']]);
                }
            }
            return $id;
        });
    }

    /**
     * Bloqueia a avaliação para edição ou exclusão somente se pertencer ao usuário e tiver origem
     * pessoal.
     *
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @param int $id Identificador do registro consultado ou alterado.
     * @throws DomainException Avaliação própria não encontrada.
     */
    private function propria(int $usuario, int $id): void
    {
        if (!$this->consultar('SELECT id FROM avaliacao WHERE id=? AND usuario_id=? AND profissional_id IS NULL FOR UPDATE', [$id, $usuario])->fetchColumn()) {
            throw new DomainException('Avaliação própria não encontrada.', 404);
        }
    }

    /**
     * Valida a propriedade e exclui as medidas antes de excluir a avaliação na mesma transação.
     *
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @param int $id Identificador do registro consultado ou alterado.
     */
    public function excluir(int $usuario, int $id): void
    {
        $this->transacao(function () use ($usuario, $id) {
            $this->propria($usuario, $id);
            $this->consultar('DELETE FROM medida WHERE avaliacao_id=? AND usuario_id=?', [$id, $usuario]);
            $this->consultar('DELETE FROM avaliacao WHERE id=? AND usuario_id=?', [$id, $usuario]);
        });
    }

    /**
     * Reúne condições informadas e restrições da conta com seus nomes de catálogo.
     *
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @return array{condicoes:list<array>,restricoes:list<array>}
     */
    public function declaracoes(int $usuario): array
    {
        return [
            'condicoes' => $this->consultar('SELECT uc.id,c.nome,uc.status,uc.origem FROM usuario_condicao uc JOIN condicao c ON c.id=uc.condicao_id WHERE uc.usuario_id=?', [$usuario])->fetchAll(),
            'restricoes' => $this->consultar('SELECT ur.id,r.nome,ur.gravidade,ur.observacao FROM usuario_restricao ur JOIN restricao r ON r.id=ur.restricao_id WHERE ur.usuario_id=?', [$usuario])->fetchAll(),
        ];
    }

    /**
     * Obtém ou cria o nome no catálogo e registra a associação pessoal, incluindo observações no caso de
     * restrições.
     *
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @param string $tipo Chave do tipo de registro.
     * @param string $nome Nome usado no cadastro ou na apresentação.
     * @param ?string $observacao Texto opcional associado ao registro.
     */
    public function declarar(int $usuario, string $tipo, string $nome, ?string $observacao): void
    {
        $this->transacao(function () use ($usuario, $tipo, $nome, $observacao) {
            $tabela = $tipo === 'condicao' ? 'condicao' : 'restricao';
            // O catálogo recebe apenas o nome; notas privadas ficam na relação com o usuário.
            $this->consultar("INSERT INTO $tabela (nome) VALUES (?) ON DUPLICATE KEY UPDATE id=LAST_INSERT_ID(id)", [$nome]);
            $id = (int)$this->pdo->lastInsertId();
            if ($tipo === 'condicao') {
                $this->consultar("INSERT INTO usuario_condicao (usuario_id,condicao_id,status,origem,declarado_em) VALUES (?,?,'informada','autodeclarada',NOW()) ON DUPLICATE KEY UPDATE status='informada'", [$usuario, $id]);
            } else {
                $this->consultar('INSERT INTO usuario_restricao (usuario_id,restricao_id,observacao,registrado_em) VALUES (?,?,?,NOW()) ON DUPLICATE KEY UPDATE observacao=VALUES(observacao)', [$usuario, $id, $observacao]);
            }
        });
    }

    /**
     * Remove pelo ID a associação da conta com a condição ou restrição e preserva o nome compartilhado
     * do catálogo.
     *
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @param string $tipo Chave do tipo de registro.
     * @param int $id Identificador do registro consultado ou alterado.
     */
    public function removerDeclaracao(int $usuario, string $tipo, int $id): void
    {
        $tabela = $tipo === 'condicao' ? 'usuario_condicao' : 'usuario_restricao';
        $this->consultar("DELETE FROM $tabela WHERE id=? AND usuario_id=?", [$id, $usuario]);
    }
}
