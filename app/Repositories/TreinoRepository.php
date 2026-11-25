<?php

declare(strict_types=1);

namespace App\Repositories;

use InvalidArgumentException;

use PDO;
use Throwable;

/**
 * Executa as consultas e gravações do planejamento e das sessões de treino usando PDO. Os serviços
 * fornecem o proprietário, controlam as transações e reutilizam as consultas de itens, ordenação e
 * histórico.
 */
final class TreinoRepository
{
    /**
     * Guarda a conexão usada tanto para comandos isolados quanto para operações atômicas do serviço.
     *
     * @param PDO $pdo Conexão PDO da aplicação.
     */
    public function __construct(private PDO $pdo)
    {
    }

    /**
     * Prepara o SQL, associa os valores recebidos a seus marcadores e devolve o cursor já executado.
     *
     * @param string $sql Instrução SQL com marcadores para os valores externos.
     * @param array<int|string,scalar|null> $args Valores vinculados aos marcadores da consulta.
     * @return \PDOStatement
     */
    public function consultar(string $sql, array $args = []): \PDOStatement
    {
        $s = $this->pdo->prepare($sql);
        $s->execute($args);
        return $s;
    }

    /**
     * Lê a primeira linha como mapa de colunas ou null se a consulta não encontrar registros.
     *
     * @param string $sql Instrução SQL com marcadores para os valores externos.
     * @param array<int|string,scalar|null> $args Valores vinculados aos marcadores da consulta.
     * @return array<string,scalar|null>|null
     */
    public function um(string $sql, array $args): ?array
    {
        return $this->consultar($sql, $args)->fetch(PDO::FETCH_ASSOC) ?: null;
    }

    /**
     * Lê as linhas em ordem de resultado como mapas de coluna e valor.
     *
     * @param string $sql Instrução SQL com marcadores para os valores externos.
     * @param array<int|string,scalar|null> $args Valores vinculados aos marcadores da consulta.
     * @return list<array<string,scalar|null>>
     */
    public function todos(string $sql, array $args): array
    {
        return $this->consultar($sql, $args)->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Monta um INSERT com nomes de campos validados e um marcador por valor. Devolve o ID gerado pelo
     * banco.
     *
     * Tabelas e colunas vêm do código; valores são sempre parametrizados.
     *
     * @param string $tabela Tabela escolhida pelo código que chamou o método.
     * @param array $dados Campos associados aos seus nomes.
     * @return int
     */
    public function inserir(string $tabela, array $dados): int
    {
        $this->validarIdentificadores($tabela, $dados);
        $cols = implode(',', array_keys($dados));
        $params = implode(',', array_fill(0, count($dados), '?'));
        $this->consultar("INSERT INTO $tabela ($cols) VALUES ($params)", array_values($dados));
        return (int) $this->pdo->lastInsertId();
    }

    /**
     * Atualiza as colunas informadas pelo código para o ID indicado. O serviço verifica a propriedade
     * antes da escrita.
     *
     * @param string $tabela Tabela escolhida pelo código que chamou o método.
     * @param int $id Identificador do registro consultado ou alterado.
     * @param array $dados Campos associados aos seus nomes.
     */
    public function atualizar(string $tabela, int $id, array $dados): void
    {
        $this->validarIdentificadores($tabela, $dados);
        $cols = implode(',', array_map(static fn ($k) => "$k=?", array_keys($dados)));
        $this->consultar("UPDATE $tabela SET $cols WHERE id=?", [...array_values($dados), $id]);
    }

    /**
     * Exige pelo menos um campo e confere os nomes usados para montar o SQL, que não podem ser enviados
     * como parâmetros PDO.
     *
     * @param string $tabela Tabela escolhida pelo código que chamou o método.
     * @param array $dados Campos associados aos seus nomes.
     * @throws InvalidArgumentException Informe campos para persistir.
     */
    private function validarIdentificadores(string $tabela, array $dados): void
    {
        if ($dados === []) {
            throw new InvalidArgumentException('Informe campos para persistir.');
        }
        // Placeholders protegem valores, mas não nomes interpolados na instrução SQL.
        foreach ([$tabela, ...array_keys($dados)] as $nome) {
            if (!is_string($nome) || !preg_match('/^[a-z][a-z0-9_]*$/D', $nome)) {
                throw new InvalidArgumentException('Identificador SQL inválido.');
            }
        }
    }

    /**
     * Executa a operação entre beginTransaction e commit e devolve seu resultado. Se houver falha,
     * desfaz as escritas e propaga o erro.
     *
     * @template T
     * @param callable():T $acao Operação cujas escritas serão confirmadas em conjunto.
     * @return T Resultado da operação confirmada.
     * @throws Throwable Propaga a falha original após tentar o rollback.
     */
    public function transacao(callable $acao): mixed
    {
        // Exercícios, séries e mudanças de estado podem depender uns dos outros. A confirmação ocorre somente ao fim do callback.
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

    /**
     * Calcula a próxima posição dentro do mesmo pai e insere o exercício ou série no final da sequência.
     *
     * @param string $tabela Tabela escolhida pelo código que chamou o método.
     * @param string $chave Coluna que liga o item ao registro pai.
     * @param int $pai Identificador do registro que contém os itens.
     * @param string $pos Coluna de ordem do exercício ou de número da série.
     * @param array $dados Campos associados aos seus nomes.
     * @return int
     */
    public function anexar(string $tabela, string $chave, int $pai, string $pos, array $dados): int
    {
        $this->validarOrdenacao($tabela, $chave, $pos);
        // A numeração é local ao registro pai. COALESCE faz a primeira posição começar em 1.
        $ordem = $this->consultar("SELECT COALESCE(MAX($pos),0)+1 FROM $tabela WHERE $chave=?", [$pai])->fetchColumn();
        return $this->inserir($tabela, [$chave => $pai, $pos => $ordem] + $dados);
    }

    /**
     * Encontra o vizinho na direção desejada e troca as posições em três escritas. Uma posição
     * temporária preserva a chave única.
     *
     * @param string $tabela Tabela escolhida pelo código que chamou o método.
     * @param string $chave Coluna que liga o item ao registro pai.
     * @param int $pai Identificador do registro que contém os itens.
     * @param string $pos Coluna de ordem do exercício ou de número da série.
     * @param array $x Dados do exercício ou série já localizados no banco.
     * @param bool $subir Indica troca com o vizinho anterior em vez do seguinte.
     */
    public function mover(string $tabela, string $chave, int $pai, string $pos, array $x, bool $subir): void
    {
        $this->validarOrdenacao($tabela, $chave, $pos);
        [$op, $dir] = $subir ? ['<', 'DESC'] : ['>', 'ASC'];
        $vizinho = $this->um("SELECT id,$pos FROM $tabela WHERE $chave=? AND $pos $op ? ORDER BY $pos $dir LIMIT 1", [$pai, $x[$pos]]);
        if (!$vizinho) {
            return;
        }
        // A posição temporária evita colisão com a restrição única durante a troca.
        $temporario = $this->consultar("SELECT LEAST(COALESCE(MIN($pos),0),0)-1 FROM $tabela WHERE $chave=?", [$pai])->fetchColumn();
        $this->atualizar($tabela, (int)$x['id'], [$pos => $temporario]);
        $this->atualizar($tabela, (int)$vizinho['id'], [$pos => $x[$pos]]);
        $this->atualizar($tabela, (int)$x['id'], [$pos => $vizinho[$pos]]);
    }

    /**
     * Restringe a ordenação às combinações de tabela, chave do pai e coluna de posição usadas por
     * rotinas e treinos.
     *
     * @param string $tabela Tabela escolhida pelo código que chamou o método.
     * @param string $chave Coluna que liga o item ao registro pai.
     * @param string $pos Coluna de ordem do exercício ou de número da série.
     * @throws InvalidArgumentException Ordenação inválida.
     */
    private function validarOrdenacao(string $tabela, string $chave, string $pos): void
    {
        $permitidos = [
            ['rotina_exercicio', 'rotina_id', 'ordem'],
            ['treino_exercicio', 'treino_id', 'ordem'],
            ['rotina_serie', 'rotina_exercicio_id', 'numero'],
            ['serie', 'treino_exercicio_id', 'numero'],
        ];
        if (!in_array([$tabela, $chave, $pos], $permitidos, true)) {
            throw new InvalidArgumentException('Ordenação inválida.');
        }
    }

    /**
     * Procura ao menos uma série concluída e não ignorada entre os exercícios da sessão, requisito para
     * finalização.
     *
     * @param int $treino Identificador da sessão de treino.
     * @return bool
     */
    public function possuiSerieConcluida(int $treino): bool
    {
        return $this->um('SELECT s.id FROM serie s
            JOIN treino_exercicio x ON x.id=s.treino_exercicio_id
            WHERE x.treino_id=? AND s.concluida=1 AND s.ignorada=0 LIMIT 1', [$treino]) !== null;
    }

    /**
     * Lê o exercício ativo e as flags do tipo de registro. Aceita registros públicos ou da conta
     * indicada e permite travar a leitura.
     *
     * @param int $exercicio Identificador do exercício no catálogo.
     * @param ?int $usuario ID da conta cujos dados delimitam a operação. Null limita o catálogo aos exercícios públicos.
     * @param bool $bloquear Solicita bloqueio da linha durante a transação.
     * @return array<string,scalar|null>|null
     */
    public function exercicioDisponivel(int $exercicio, ?int $usuario, bool $bloquear = false): ?array
    {
        return $this->um('SELECT tr.*,e.id,e.nome FROM exercicio e
            LEFT JOIN tipo_registro tr ON tr.id=e.tipo_registro_id
            WHERE e.id=? AND e.ativo=1 AND (e.usuario_id IS NULL OR e.usuario_id=?)' . ($bloquear ? ' FOR SHARE' : ''), [$exercicio, $usuario]);
    }

    /**
     * Busca o exercício pela chave do item e do pai, com as flags que determinam quais medições são
     * permitidas.
     *
     * @param int $item Identificador da ocorrência do exercício na rotina ou sessão.
     * @param int $pai Identificador do registro que contém os itens.
     * @param bool $rotina Seleciona as tabelas de planejamento em vez das de execução.
     * @return array<string,scalar|null>|null
     */
    public function item(int $item, int $pai, bool $rotina): ?array
    {
        $tabela = $rotina ? 'rotina_exercicio' : 'treino_exercicio';
        $chave = $rotina ? 'rotina_id' : 'treino_id';
        return $this->um("SELECT x.*,tr.usa_carga,tr.usa_repeticoes,tr.usa_duracao,tr.usa_distancia
            FROM $tabela x JOIN exercicio e ON e.id=x.exercicio_id
            LEFT JOIN tipo_registro tr ON tr.id=e.tipo_registro_id WHERE x.id=? AND x.$chave=?", [$item, $pai]);
    }

    /**
     * Define como NULL as metas selecionadas nas séries do item após uma substituição de exercício.
     *
     * @param int $item Identificador da ocorrência do exercício na rotina ou sessão.
     * @param list<string> $campos Nomes das metas a limpar.
     */
    public function limparMetas(int $item, array $campos): void
    {
        $this->validarIdentificadores('rotina_serie', array_fill_keys($campos, null));
        $atribuicoes = implode('=NULL,', $campos) . '=NULL';
        $this->consultar("UPDATE rotina_serie SET $atribuicoes WHERE rotina_exercicio_id=?", [$item]);
    }

    /**
     * Remove primeiro as séries planejadas e depois seu exercício na transação aberta pelo serviço.
     *
     * @param int $item Identificador da ocorrência do exercício na rotina ou sessão.
     */
    public function removerItemRotina(int $item): void
    {
        // O serviço já bloqueou a rotina e abriu a transação que inclui ambas as exclusões.
        $this->consultar('DELETE FROM rotina_serie WHERE rotina_exercicio_id=?', [$item]);
        $this->consultar('DELETE FROM rotina_exercicio WHERE id=?', [$item]);
    }

    /**
     * Confere se a série pertence ao exercício informado, escolhendo entre planejamento e execução.
     *
     * @param int $serie Identificador da série selecionada.
     * @param int $item Identificador da ocorrência do exercício na rotina ou sessão.
     * @param bool $rotina Seleciona as tabelas de planejamento em vez das de execução.
     * @return array<string,scalar|null>|null
     */
    public function serieDoItem(int $serie, int $item, bool $rotina = false): ?array
    {
        $tabela = $rotina ? 'rotina_serie' : 'serie';
        $chave = $rotina ? 'rotina_exercicio_id' : 'treino_exercicio_id';
        return $this->um("SELECT * FROM $tabela WHERE id=? AND $chave=?", [$serie, $item]);
    }

    /**
     * Exclui uma série planejada após o serviço validar a rotina e o exercício.
     *
     * @param int $serie Identificador da série selecionada.
     */
    public function removerSerieRotina(int $serie): void
    {
        $this->consultar('DELETE FROM rotina_serie WHERE id=?', [$serie]);
    }

    /**
     * Lê e bloqueia o exercício ativo da conta para editar os dados preservando o tipo de registro.
     *
     * @param int $exercicio Identificador do exercício no catálogo.
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @return array<string,scalar|null>|null
     */
    public function personalizado(int $exercicio, int $usuario): ?array
    {
        return $this->um('SELECT id,nome,tipo_registro_id FROM exercicio
            WHERE id=? AND usuario_id=? AND ativo=1 FOR UPDATE', [$exercicio, $usuario]);
    }

    /**
     * Confere se a referência de equipamento, grupo muscular ou tipo de registro existe na tabela
     * permitida.
     *
     * @param string $tabela Tabela escolhida pelo código que chamou o método.
     * @param int $id Identificador do registro consultado ou alterado.
     * @return bool
     * @throws InvalidArgumentException Classificação inválida.
     */
    public function classificacaoExiste(string $tabela, int $id): bool
    {
        if (!in_array($tabela, ['equipamento', 'grupo_muscular', 'tipo_registro'], true)) {
            throw new InvalidArgumentException('Classificação inválida.');
        }
        return $this->um("SELECT id FROM $tabela WHERE id=?", [$id]) !== null;
    }

    /**
     * Serializa o início de sessões da conta com um bloqueio de linha até o final da transação.
     *
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     */
    public function bloquearUsuario(int $usuario): void
    {
        // Serializa o início de sessões para não criar dois treinos ativos na mesma conta.
        $this->um('SELECT id FROM usuario WHERE id=? FOR UPDATE', [$usuario]);
    }

    /**
     * Insere uma sessão em andamento com horário do MySQL e referência opcional à rotina. Devolve o novo
     * ID.
     *
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @param ?int $rotina Identificador da rotina de planejamento.
     * @param string $nome Nome usado no cadastro ou na apresentação.
     * @return int
     */
    public function iniciarTreino(int $usuario, ?int $rotina, string $nome): int
    {
        $this->consultar("INSERT INTO treino (usuario_id,rotina_id,nome,status,iniciado_em)
            VALUES (?,?,?,'em_andamento',NOW())", [$usuario, $rotina, $nome]);
        return (int) $this->pdo->lastInsertId();
    }

    /**
     * Marca conclusão, grava o horário e a observação final e limpa o descanso pendente.
     *
     * @param int $treino Identificador da sessão de treino.
     * @param ?string $observacao Texto opcional associado ao registro.
     */
    public function finalizarTreino(int $treino, ?string $observacao): void
    {
        $this->consultar("UPDATE treino SET status='concluido',finalizado_em=NOW(),
            descanso_ate=NULL,observacao=? WHERE id=?", [$observacao, $treino]);
    }

    /**
     * Grava o estado cancelado e o horário de encerramento e remove o prazo de descanso.
     *
     * @param int $treino Identificador da sessão de treino.
     */
    public function cancelarTreino(int $treino): void
    {
        $this->consultar("UPDATE treino SET status='cancelado',finalizado_em=NOW(),descanso_ate=NULL WHERE id=?", [$treino]);
    }

    /**
     * Localiza uma inserção anterior pelo par exercício e chave do formulário para reconhecer reenvios.
     *
     * @param int $item Identificador da ocorrência do exercício na rotina ou sessão.
     * @param string $chave Chave que identifica o envio do formulário.
     * @return array<string,scalar|null>|null
     */
    public function seriePorChave(int $item, string $chave): ?array
    {
        return $this->um('SELECT id FROM serie WHERE treino_exercicio_id=? AND chave=?', [$item, $chave]);
    }

    /**
     * Grava o instante em que o descanso termina. Zero segundos limpa o temporizador no banco.
     *
     * @param int $treino Identificador da sessão de treino.
     * @param int $segundos Duração do descanso em segundos.
     */
    public function descanso(int $treino, int $segundos): void
    {
        $this->consultar('UPDATE treino SET descanso_ate=IF(?=0,NULL,TIMESTAMPADD(SECOND,?,NOW())) WHERE id=?', [$segundos, $segundos, $treino]);
    }

    /**
     * Busca a rotina somente sob a conta proprietária. Pode manter a linha bloqueada até confirmar a
     * edição.
     *
     * @param int $id Identificador do registro consultado ou alterado.
     * @param int $u ID da conta proprietária dos dados.
     * @param bool $lock Solicita leitura com bloqueio até o fim da transação.
     * @return array<string,scalar|null>|null
     */
    public function rotina(int $id, int $u, bool $lock = false): ?array
    {
        return $this->um('SELECT * FROM rotina WHERE id=? AND usuario_id=?' . ($lock ? ' FOR UPDATE' : ''), [$id, $u]);
    }

    /**
     * Agrupa os exercícios em ordem com suas séries numeradas e retira as chaves que serão recriadas na
     * cópia.
     *
     * Lê o planejamento na ordem em que será apresentado ao aluno.
     *
     * @param int $rotina Identificador da rotina de planejamento.
     * @return list<array<string,mixed>>
     */
    public function planejamento(int $rotina): array
    {
        $series = $this->series($rotina, true);
        $itens = [];
        foreach ($this->itens($rotina, true) as $item) {
            $dados = array_intersect_key($item, array_flip(['exercicio_id', 'nome', 'ordem', 'descanso_segundos', 'grupo', 'observacao']));
            $dados['series'] = [];
            foreach ($series[$item['id']] ?? [] as $serie) {
                // A cópia terá novos IDs, mas mantém a numeração das séries.
                unset($serie['id'], $serie['rotina_exercicio_id']);
                $dados['series'][] = $serie;
            }
            $itens[] = $dados;
        }
        return $itens;
    }

    /**
     * Grava exercícios e séries com novos IDs, associando cada série ao novo exercício da rotina de
     * destino.
     *
     * @param int $rotina Identificador da rotina de planejamento.
     * @param list<array> $itens Exercícios em ordem com os respectivos campos e séries.
     */
    public function copiarPlanejamento(int $rotina, array $itens): void
    {
        foreach ($itens as $item) {
            $series = $item['series'];
            unset($item['series'], $item['nome']);
            $novo = $this->inserir('rotina_exercicio', ['rotina_id' => $rotina] + $item);
            foreach ($series as $serie) {
                $this->inserir('rotina_serie', ['rotina_exercicio_id' => $novo] + $serie);
            }
        }
    }

    /**
     * Devolve o ID profissional se tanto a conta de usuário quanto o perfil profissional estão ativos.
     *
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @param bool $bloquear Solicita bloqueio da linha durante a transação.
     * @return ?int
     */
    public function profissionalAtivo(int $usuario, bool $bloquear = false): ?int
    {
        $profissional = $this->um('SELECT p.id FROM profissional p JOIN usuario u ON u.id=p.usuario_id
            WHERE u.id=? AND u.ativo=1 AND p.ativo=1' . ($bloquear ? ' FOR UPDATE' : ''), [$usuario]);
        return $profissional ? (int) $profissional['id'] : null;
    }

    /**
     * Consulta a sessão do proprietário e inclui início, fim e descanso em timestamps e duração em
     * segundos.
     *
     * @param int $id Identificador do registro consultado ou alterado.
     * @param int $u ID da conta proprietária dos dados.
     * @param bool $lock Solicita leitura com bloqueio até o fim da transação.
     * @return array<string,scalar|null>|null
     */
    public function treino(int $id, int $u, bool $lock = false): ?array
    {
        return $this->um('SELECT t.*, UNIX_TIMESTAMP(iniciado_em) inicio, UNIX_TIMESTAMP(finalizado_em) fim, UNIX_TIMESTAMP(descanso_ate) descanso,
            TIMESTAMPDIFF(SECOND,iniciado_em,finalizado_em) duracao FROM treino t WHERE id=? AND usuario_id=?'
            . ($lock ? ' FOR UPDATE' : ''), [$id, $u]);
    }

    /**
     * Procura a sessão em andamento mais recente da conta para permitir retomada.
     *
     * @param int $u ID da conta proprietária dos dados.
     * @return array<string,scalar|null>|null
     */
    public function ativo(int $u): ?array
    {
        return $this->um("SELECT id,nome FROM treino WHERE usuario_id=? AND status='em_andamento' ORDER BY id DESC LIMIT 1", [$u]);
    }

    /**
     * Lista os exercícios em ordem de execução, opcionalmente só um item. Nas sessões, prefere o nome
     * salvo no início.
     *
     * @param int $id Identificador do registro consultado ou alterado.
     * @param bool $rotina Seleciona as tabelas de planejamento em vez das de execução.
     * @param ?int $item Identificador da ocorrência do exercício na rotina ou sessão.
     * @return list<array<string,scalar|null>>
     */
    public function itens(int $id, bool $rotina, ?int $item = null): array
    {
        $tabela = $rotina ? 'rotina_exercicio' : 'treino_exercicio';
        $pai = $rotina ? 'rotina_id' : 'treino_id';
        // Em sessões antigas o nome copiado pode estar vazio no banco como NULL. COALESCE usa o catálogo como alternativa.
        $nome = $rotina ? 'e.nome' : 'COALESCE(x.nome_snapshot,e.nome)';
        return $this->todos("SELECT x.*, tr.usa_carga,tr.usa_repeticoes,tr.usa_duracao,tr.usa_distancia,
            tr.natureza_carga,tr.unidade_contagem,$nome AS nome FROM $tabela x
            JOIN exercicio e ON e.id=x.exercicio_id LEFT JOIN tipo_registro tr ON tr.id=e.tipo_registro_id
            WHERE x.$pai=?" . ($item === null ? '' : ' AND x.id=?') . " ORDER BY x.ordem", $item === null ? [$id] : [$id, $item]);
    }

    /**
     * Agrupa as séries pelo ID do exercício e as ordena por posição de exercício e número da série.
     *
     * @param int $id Identificador do registro consultado ou alterado.
     * @param bool $rotina Seleciona as tabelas de planejamento em vez das de execução.
     * @return array<int,list<array<string,scalar|null>>>
     */
    public function series(int $id, bool $rotina): array
    {
        $tabela = $rotina ? 'rotina' : 'treino';
        $serie = $rotina ? 'rotina_serie' : 'serie';
        $resultado = [];
        foreach (
            $this->todos("SELECT s.* FROM $serie s JOIN {$tabela}_exercicio x ON x.id=s.{$tabela}_exercicio_id
            WHERE x.{$tabela}_id=? ORDER BY x.ordem,s.numero", [$id]) as $s
        ) {
            $resultado[$s[$tabela . '_exercicio_id']][] = $s;
        }
        return $resultado;
    }

    /**
     * Localiza a última sessão concluída com séries de cada exercício do treino atual e agrupa os
     * resultados por exercício.
     *
     * @param int $u ID da conta proprietária dos dados.
     * @param int $id Identificador do registro consultado ou alterado.
     * @return array<int,list<array<string,scalar|null>>>
     */
    public function anterior(int $u, int $id): array
    {
        $resultado = [];
        // Busca a última sessão concluída com séries para cada exercício do treino atual.
        $rows = $this->todos("WITH ultimos AS (
            SELECT x.exercicio_id,MAX(t.finalizado_em) fim FROM treino t JOIN treino_exercicio x ON x.treino_id=t.id
            WHERE t.usuario_id=? AND t.status='concluido' AND t.id<>?
            AND x.exercicio_id IN (SELECT exercicio_id FROM treino_exercicio WHERE treino_id=?)
            AND EXISTS (SELECT 1 FROM serie s WHERE s.treino_exercicio_id=x.id AND s.concluida=1)
            GROUP BY x.exercicio_id
        ), candidatos AS (
            SELECT x.exercicio_id,s.*,DENSE_RANK() OVER (PARTITION BY x.exercicio_id ORDER BY t.id DESC) pos
            FROM ultimos a JOIN treino t ON t.finalizado_em=a.fim AND t.usuario_id=? AND t.status='concluido' AND t.id<>?
            JOIN treino_exercicio x ON x.treino_id=t.id AND x.exercicio_id=a.exercicio_id
            JOIN serie s ON s.treino_exercicio_id=x.id AND s.concluida=1
        ) SELECT * FROM candidatos WHERE pos=1 ORDER BY exercicio_id,treino_exercicio_id,numero", [$u, $id, $id, $u, $id]);
        foreach ($rows as $s) {
            $resultado[$s['exercicio_id']][] = $s;
        }
        return $resultado;
    }

    /**
     * Filtra sessões concluídas do dono por data e exercício e pagina com data e ID. A linha extra
     * indica a existência de outra página.
     *
     * @param int $u ID da conta proprietária dos dados.
     * @param array{de:string,ate:string,exercicio:string} $f Filtros de data inicial, data final e nome de exercício.
     * @param int $antes ID da última sessão da página anterior, ou zero no início.
     * @return array{0:list<array>,1:bool}
     */
    public function historico(int $u, array $f, int $antes): array
    {
        $params = [$u];
        $where = "t.usuario_id=? AND t.status='concluido'";
        $fuso = new \DateTimeZone('America/Sao_Paulo');
        foreach (['de' => '>=', 'ate' => '<'] as $k => $op) {
            if ($f[$k] !== '') {
                $dia = new \DateTimeImmutable($f[$k] . ' 00:00:00', $fuso);
                $where .= " AND t.finalizado_em $op FROM_UNIXTIME(?)";
                $params[] = ($k === 'ate' ? $dia->modify('+1 day') : $dia)->getTimestamp();
            }
        }
        if ($f['exercicio'] !== '') {
            $where .= " AND EXISTS (SELECT 1 FROM treino_exercicio x JOIN exercicio e ON e.id=x.exercicio_id
                WHERE x.treino_id=t.id AND COALESCE(x.nome_snapshot,e.nome) LIKE ? ESCAPE '!')";
            $params[] = '%' . str_replace(['!', '%', '_'], ['!!', '!%', '!_'], $f['exercicio']) . '%';
        }
        if ($antes) {
            $cursor = $this->treino($antes, $u);
            if ($cursor && $cursor['finalizado_em']) {
                $where .= ' AND (t.finalizado_em<? OR (t.finalizado_em=? AND t.id<?))';
                array_push($params, $cursor['finalizado_em'], $cursor['finalizado_em'], $antes);
            }
        }
        $rows = $this->todos("SELECT t.id,t.nome,t.finalizado_em,UNIX_TIMESTAMP(t.finalizado_em) fim,TIMESTAMPDIFF(SECOND,t.iniciado_em,t.finalizado_em) duracao
            FROM treino t WHERE $where ORDER BY t.finalizado_em DESC,t.id DESC LIMIT 21", $params);
        // São consultadas 21 linhas para exibir até 20. A linha excedente sinaliza que o próximo cursor terá resultados.
        $mais = count($rows) > 20;
        if ($mais) {
            array_pop($rows);
        }
        if (!$rows) {
            return [[], false];
        }

        // A segunda consulta agrega apenas os exercícios das sessões desta página para evitar uma consulta por sessão.
        $ids = array_column($rows, 'id');
        $in = implode(',', array_fill(0, count($ids), '?'));
        $execucoes = $this->todos('SELECT x.treino_id,x.id,COALESCE(x.nome_snapshot,e.nome) nome,
            COUNT(*) series,SUM(' . self::VOLUME . ') volume
            FROM treino_exercicio x JOIN serie s ON s.treino_exercicio_id=x.id
            JOIN exercicio e ON e.id=x.exercicio_id JOIN tipo_registro tr ON tr.id=e.tipo_registro_id
            WHERE x.treino_id IN (' . $in . ') AND s.concluida=1
            GROUP BY x.treino_id,x.id,COALESCE(x.nome_snapshot,e.nome) ORDER BY x.treino_id,x.id', $ids);
        $resumo = [];
        foreach ($execucoes as $x) {
            $resumo[$x['treino_id']][] = $x;
        }
        foreach ($rows as &$row) {
            $row['exercicios'] = $resumo[$row['id']] ?? [];
        }
        return [$rows, $mais];
    }

    /**
     * Reúne totais por período, execução, recordes, evolução do exercício, sessões recentes e
     * distribuição dos tipos de série.
     *
     * @param int $u ID da conta proprietária dos dados.
     * @param int $exercicio Identificador do exercício no catálogo.
     * @return array{0:?array,1:array,2:?array,3:array,4:array,5:array,6:array}
     */
    public function estatisticas(int $u, int $exercicio): array
    {
        $totais = $this->um("SELECT COUNT(*) total,AVG(TIMESTAMPDIFF(SECOND,iniciado_em,finalizado_em)) media
            FROM treino WHERE usuario_id=? AND status='concluido'", [$u]);
        $periodos = [];
        $utc = "TIMESTAMPADD(SECOND,UNIX_TIMESTAMP(finalizado_em),'1970-01-01 00:00:00')";
        // Os agrupamentos usam a data local da sessão. Sem a tabela de fusos do MySQL, a expressão recorre ao deslocamento de três horas.
        $local = "COALESCE(CONVERT_TZ($utc,'+00:00','America/Sao_Paulo'),CONVERT_TZ($utc,'+00:00','-03:00'))";
        foreach (['semanas' => "YEARWEEK($local,3)", 'meses' => "DATE_FORMAT($local,'%Y-%m')"] as $k => $periodo) {
            $periodos[$k] = $this->todos("SELECT $periodo periodo,COUNT(*) total FROM treino
                WHERE usuario_id=? AND status='concluido' GROUP BY periodo ORDER BY periodo DESC LIMIT 12", [$u]);
        }
        $join = "FROM treino t JOIN treino_exercicio x ON x.treino_id=t.id JOIN serie s ON s.treino_exercicio_id=x.id
            JOIN exercicio e ON e.id=x.exercicio_id JOIN tipo_registro tr ON tr.id=e.tipo_registro_id
            WHERE t.usuario_id=? AND t.status='concluido' AND s.concluida=1";
        $execucao = $this->um('SELECT COUNT(*) series,SUM(' . self::VOLUME . ') volume ' . $join, [$u]);
        $trabalho = $join . ' AND ' . self::SERIE_TRABALHO;
        $recordes = $this->todos("SELECT e.id,e.nome,tr.natureza_carga,COUNT(DISTINCT t.id) treinos,
            MAX(CASE WHEN tr.natureza_carga IN ('externa','adicional') THEN s.peso END) carga,
            MAX(s.repeticoes) repeticoes,MAX(s.duracao_segundos) duracao,MAX(s.distancia_metros) distancia
            $trabalho GROUP BY e.id,e.nome,tr.natureza_carga ORDER BY treinos DESC,e.nome LIMIT 30", [$u]);

        $evolucao = $exercicio ? $this->todos("SELECT t.id, t.finalizado_em,UNIX_TIMESTAMP(t.finalizado_em) fim,
            MAX(CASE WHEN tr.natureza_carga IN ('externa','adicional') THEN s.peso END) carga,MAX(s.repeticoes) repeticoes
            $trabalho AND e.id=? GROUP BY t.id,t.finalizado_em ORDER BY t.finalizado_em DESC,t.id DESC LIMIT 24", [$u, $exercicio]) : [];
        $recentes = $this->todos("WITH recentes AS (
            SELECT id,finalizado_em,TIMESTAMPDIFF(SECOND,iniciado_em,finalizado_em) duracao
            FROM treino WHERE usuario_id=? AND status='concluido' ORDER BY finalizado_em DESC,id DESC LIMIT 24
        ) SELECT t.id,t.finalizado_em,UNIX_TIMESTAMP(t.finalizado_em) fim,t.duracao,SUM(" . self::VOLUME . ") volume FROM recentes t
            LEFT JOIN treino_exercicio x ON x.treino_id=t.id LEFT JOIN serie s ON s.treino_exercicio_id=x.id AND s.concluida=1
            LEFT JOIN exercicio e ON e.id=x.exercicio_id LEFT JOIN tipo_registro tr ON tr.id=e.tipo_registro_id
            GROUP BY t.id,t.finalizado_em,t.duracao ORDER BY t.finalizado_em DESC,t.id DESC", [$u]);
        $distribuicao = $this->todos("SELECT COALESCE(s.tipo,'normal') tipo,COUNT(*) total $join GROUP BY COALESCE(s.tipo,'normal') ORDER BY total DESC", [$u]);
        return [$totais, $periodos, $execucao, $recordes, $evolucao, $recentes, $distribuicao];
    }

    /**
     * Compara os máximos de séries de trabalho da sessão com sessões anteriores do mesmo exercício,
     * desempatando o horário pelo ID.
     *
     * @param int $u ID da conta proprietária dos dados.
     * @param int $id ID da sessão cujos máximos serão comparados.
     * @param string $fim Data e hora de conclusão da sessão de referência no MySQL.
     * @return list<array{nome:string,metrica:string,valor:scalar,anterior:scalar|null}>
     */
    public function recordesDaSessao(int $u, int $id, string $fim): array
    {
        $metricas = [
            'carga' => "CASE WHEN tr.natureza_carga IN ('externa','adicional') THEN s.peso END",
            'repeticoes' => 's.repeticoes',
            'duracao' => 's.duracao_segundos',
            'distancia' => 's.distancia_metros',
            'volume' => self::VOLUME,
        ];
        // Os dois conjuntos usam os mesmos máximos por métrica. O desempate por ID inclui só sessões anteriores à atual.
        $maximos = implode(',', array_map(static fn ($nome, $expr) => "MAX($expr) AS $nome", array_keys($metricas), $metricas));
        $joins = "JOIN treino_exercicio x ON x.treino_id=t.id JOIN serie s ON s.treino_exercicio_id=x.id
            JOIN exercicio e ON e.id=x.exercicio_id JOIN tipo_registro tr ON tr.id=e.tipo_registro_id";
        $rows = $this->todos("WITH atual AS (
            SELECT x.exercicio_id,MIN(COALESCE(x.nome_snapshot,e.nome)) nome,$maximos
            FROM treino t $joins WHERE t.id=? AND t.usuario_id=? AND s.concluida=1 AND " . self::SERIE_TRABALHO . "
            GROUP BY x.exercicio_id
        ), anterior AS (
            SELECT x.exercicio_id,$maximos FROM treino t $joins JOIN atual a ON a.exercicio_id=x.exercicio_id
            WHERE t.usuario_id=? AND t.status='concluido' AND (t.finalizado_em<? OR (t.finalizado_em=? AND t.id<?))
                AND s.concluida=1 AND " . self::SERIE_TRABALHO . "
            GROUP BY x.exercicio_id
        ) SELECT a.*,p.carga AS anterior_carga,p.repeticoes AS anterior_repeticoes,
            p.duracao AS anterior_duracao,p.distancia AS anterior_distancia,p.volume AS anterior_volume
            FROM atual a LEFT JOIN anterior p USING (exercicio_id)", [$id, $u, $u, $fim, $fim, $id]);
        $out = [];
        foreach ($rows as $r) {
            foreach ($metricas as $k => $expr) {
                if (isset($r[$k]) && (float) $r[$k] > (float) ($r['anterior_' . $k] ?? 0)) {
                    $out[] = ['nome' => $r['nome'], 'metrica' => $k, 'valor' => $r[$k], 'anterior' => $r['anterior_' . $k]];
                }
            }
        }
        return $out;
    }

    // O histórico trata tipo nulo como normal. Aquecimento e preparatória ficam fora dos recordes de trabalho e do volume elegível.
    public const SERIE_TRABALHO = "COALESCE(s.tipo,'normal') NOT IN ('aquecimento','preparatoria')";
    // Passos, assistência e séries ignoradas não representam volume de carga externa.
    // Para carga externa, o volume de uma série válida é peso em kg × repetições. O CASE retorna NULL quando a medida não se aplica.
    public const VOLUME = "CASE WHEN tr.natureza_carga='externa' AND tr.usa_repeticoes=1
        AND tr.unidade_contagem='repetições' AND s.concluida=1 AND s.ignorada=0
        AND s.peso>=0 AND s.repeticoes>0 AND " . self::SERIE_TRABALHO . " THEN s.peso*s.repeticoes END";
}
