<?php

declare(strict_types=1);

namespace App\Repositories;

/**
 * Prepara os dados de AnaliseTreinoService com o repositório de treinos. Restringe as execuções ao
 * proprietário e usa o fim exclusivo para separar períodos consecutivos.
 *
 * Consultas limitadas por proprietário e intervalo; sem consulta por músculo.
 */
final class AnaliseTreinoRepository
{
    /**
     * Recebe o acesso PDO encapsulado pelo repositório de treino.
     *
     * @param TreinoRepository $db Repositório usado para executar as operações de persistência.
     */
    public function __construct(private TreinoRepository $db)
    {
    }

    /**
     * Lista músculos com código, grupo, identificador visual e referência ao músculo pai para
     * inicializar o mapa.
     *
     * @return list<array<string,scalar|null>>
     */
    public function catalogo(): array
    {
        return $this->db->todos('SELECT id,codigo,nome,grupo,svg_id,musculo_pai_id FROM musculo ORDER BY nome', []);
    }

    /**
     * Seleciona relações musculares dos exercícios presentes em sessões concluídas da conta no
     * intervalo.
     *
     * @param int $u ID da conta proprietária dos dados.
     * @param int $inicio Limite inicial do intervalo.
     * @param int $fim Limite final exclusivo do intervalo, em segundos Unix.
     * @return list<array<string,scalar|null>>
     */
    public function relacoes(int $u, int $inicio, int $fim): array
    {
        return $this->db->todos("SELECT em.* FROM exercicio_musculo em WHERE EXISTS (
            SELECT 1 FROM treino t JOIN treino_exercicio x ON x.treino_id=t.id
            WHERE x.exercicio_id=em.exercicio_id AND t.usuario_id=? AND t.status='concluido'
            AND t.finalizado_em>=FROM_UNIXTIME(?) AND t.finalizado_em<FROM_UNIXTIME(?))", [$u, $inicio, $fim]);
    }

    /**
     * Lista sessões concluídas em ordem cronológica com o instante final e a duração em segundos.
     *
     * @param int $u ID da conta proprietária dos dados.
     * @param int $inicio Limite inicial do intervalo.
     * @param int $fim Limite final exclusivo do intervalo, em segundos Unix.
     * @return list<array<string,scalar|null>>
     */
    public function sessoes(int $u, int $inicio, int $fim): array
    {
        return $this->db->todos("SELECT id,UNIX_TIMESTAMP(finalizado_em) fim,
            GREATEST(0,TIMESTAMPDIFF(SECOND,iniciado_em,finalizado_em)) duracao FROM treino
            WHERE usuario_id=? AND status='concluido' AND finalizado_em>=FROM_UNIXTIME(?)
            AND finalizado_em<FROM_UNIXTIME(?) ORDER BY finalizado_em,id", [$u, $inicio, $fim]);
    }

    /**
     * Agrupa séries de trabalho concluídas por sessão, exercício e lado para contar séries e somar
     * repetições e volume compatíveis.
     *
     * @param int $u ID da conta proprietária dos dados.
     * @param int $inicio Limite inicial do intervalo.
     * @param int $fim Limite final exclusivo do intervalo, em segundos Unix.
     * @return list<array<string,scalar|null>>
     */
    public function execucoes(int $u, int $inicio, int $fim): array
    {
        return $this->db->todos("SELECT t.id treino_id,UNIX_TIMESTAMP(t.finalizado_em) fim,e.id exercicio_id,
            MIN(COALESCE(x.nome_snapshot,e.nome)) nome,g.nome grupo,tr.natureza_carga,tr.unidade_contagem,
            e.unilateral,eq.nome equipamento,COALESCE(s.lado,'nao_informado') lado,
            COUNT(*) series,SUM(CASE WHEN tr.usa_repeticoes=1 AND tr.unidade_contagem='repetições' THEN s.repeticoes END) repeticoes,
            SUM(CASE WHEN tr.unidade_contagem='repetições' AND s.peso>=0 AND s.repeticoes>0 THEN " . TreinoRepository::VOLUME . " END) volume,
            MAX(CASE WHEN tr.usa_carga=1 AND tr.natureza_carga IN ('externa','adicional') AND s.peso>=0 THEN s.peso END) carga
            FROM treino t JOIN treino_exercicio x ON x.treino_id=t.id JOIN serie s ON s.treino_exercicio_id=x.id
            JOIN exercicio e ON e.id=x.exercicio_id JOIN tipo_registro tr ON tr.id=e.tipo_registro_id
            JOIN grupo_muscular g ON g.id=e.grupo_muscular_id JOIN equipamento eq ON eq.id=e.equipamento_id
            WHERE t.usuario_id=? AND t.status='concluido' AND t.finalizado_em>=FROM_UNIXTIME(?)
            AND t.finalizado_em<FROM_UNIXTIME(?) AND s.concluida=1 AND s.ignorada=0 AND " . TreinoRepository::SERIE_TRABALHO . "
            GROUP BY t.id,t.finalizado_em,e.id,g.nome,tr.natureza_carga,tr.unidade_contagem,e.unilateral,eq.nome,s.lado
            ORDER BY t.finalizado_em,t.id,e.id,s.lado", [$u, $inicio, $fim]);
    }

    /**
     * Lê as séries de trabalho mais recentes do exercício no período. A linha 501 permite à tela indicar
     * truncamento.
     *
     * @param int $u ID da conta proprietária dos dados.
     * @param int $e Identificador do exercício no catálogo.
     * @param int $inicio Limite inicial do intervalo.
     * @param int $fim Limite final exclusivo do intervalo, em segundos Unix.
     * @return list<array<string,scalar|null>>
     */
    public function seriesExercicio(int $u, int $e, int $inicio, int $fim): array
    {
        return $this->db->todos("SELECT t.id treino_id,UNIX_TIMESTAMP(t.finalizado_em) fim,s.numero,s.peso,s.repeticoes,s.lado,
            tr.natureza_carga,tr.unidade_contagem FROM treino t JOIN treino_exercicio x ON x.treino_id=t.id
            JOIN serie s ON s.treino_exercicio_id=x.id JOIN exercicio e ON e.id=x.exercicio_id
            JOIN tipo_registro tr ON tr.id=e.tipo_registro_id WHERE t.usuario_id=? AND e.id=?
            AND t.status='concluido' AND t.finalizado_em>=FROM_UNIXTIME(?) AND t.finalizado_em<FROM_UNIXTIME(?)
            AND s.concluida=1 AND s.ignorada=0 AND " . TreinoRepository::SERIE_TRABALHO . "
            ORDER BY t.finalizado_em DESC,t.id DESC,x.ordem,s.numero LIMIT 501", [$u, $e, $inicio, $fim]);
    }

    /**
     * Obtém a maior carga externa ou adicional para cada combinação de número de repetições e lado.
     *
     * @param int $u ID da conta proprietária dos dados.
     * @param int $e Identificador do exercício no catálogo.
     * @param int $inicio Limite inicial do intervalo.
     * @param int $fim Limite final exclusivo do intervalo, em segundos Unix.
     * @return list<array<string,scalar|null>>
     */
    public function melhoresPorRepeticoes(int $u, int $e, int $inicio, int $fim): array
    {
        return $this->db->todos("SELECT s.repeticoes,COALESCE(s.lado,'nao_informado') lado,MAX(s.peso) carga
            FROM treino t JOIN treino_exercicio x ON x.treino_id=t.id JOIN serie s ON s.treino_exercicio_id=x.id
            JOIN exercicio e ON e.id=x.exercicio_id JOIN tipo_registro tr ON tr.id=e.tipo_registro_id
            WHERE t.usuario_id=? AND e.id=? AND t.status='concluido' AND t.finalizado_em>=FROM_UNIXTIME(?)
            AND t.finalizado_em<FROM_UNIXTIME(?) AND s.concluida=1 AND s.ignorada=0 AND " . TreinoRepository::SERIE_TRABALHO . "
            AND tr.natureza_carga IN ('externa','adicional') AND tr.unidade_contagem='repetições'
            AND s.repeticoes>0 AND s.peso>=0 GROUP BY s.repeticoes,s.lado ORDER BY s.repeticoes,s.lado", [$u, $e, $inicio, $fim]);
    }

    /**
     * Busca a maior carga elegível por lado antes do início da janela para reconhecer um novo recorde no
     * período.
     *
     * @param int $u ID da conta proprietária dos dados.
     * @param int $e Identificador do exercício no catálogo.
     * @param int $inicio Limite inicial do intervalo.
     * @return list<array<string,scalar|null>>
     */
    public function recordeAnterior(int $u, int $e, int $inicio): array
    {
        return $this->db->todos("SELECT COALESCE(s.lado,'nao_informado') lado,MAX(s.peso) carga
            FROM treino t JOIN treino_exercicio x ON x.treino_id=t.id JOIN serie s ON s.treino_exercicio_id=x.id
            JOIN exercicio e ON e.id=x.exercicio_id JOIN tipo_registro tr ON tr.id=e.tipo_registro_id
            WHERE t.usuario_id=? AND e.id=? AND t.status='concluido' AND t.finalizado_em<FROM_UNIXTIME(?)
            AND s.concluida=1 AND s.ignorada=0 AND " . TreinoRepository::SERIE_TRABALHO . "
            AND tr.natureza_carga IN ('externa','adicional') AND s.peso>=0 GROUP BY s.lado", [$u, $e, $inicio]);
    }
}
