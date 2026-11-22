<?php

declare(strict_types=1);

namespace App\Repositories;

use App\Config\Database;
use PDO;

/**
 * Consulta o catálogo usado pela biblioteca e pelos seletores de treino. Junta os dados de
 * modalidade e equipamento e restringe exercícios privados à conta indicada.
 */
final class ExercicioRepository
{
    private PDO $pdo;

    /**
     * Obtém a conexão comum ao catálogo e às consultas dos filtros.
     */
    public function __construct()
    {
        $this->pdo = Database::conectar();
    }

    /**
     * Combina busca por nome ou alias com os filtros selecionados. Conta os resultados e limita a página
     * a 24 exercícios.
     *
     * Com usuário nulo, o seletor de modelos mostra apenas o catálogo compartilhado.
     *
     * @param ?int $usuarioId ID da conta de usuário, distinto do ID do perfil profissional.
     * @param array{q:string,grupo:string,equipamento:string,modalidade:string,ordem:string,pagina:int,musculo?:string,ambiente?:string} $filtros Opções de pesquisa, ordenação e página do catálogo.
     * @return array{itens:list<array>,total:int,pagina:int,paginas:int}
     */
    public function pesquisar(?int $usuarioId, array $filtros): array
    {
        $where = ['e.ativo=1', '(e.usuario_id IS NULL OR e.usuario_id=:usuario)'];
        $params = ['usuario' => $usuarioId];
        if ($filtros['q'] !== '') {
            $where[] = '(e.nome LIKE :nome OR e.nome_ingles LIKE :ingles OR EXISTS (SELECT 1 FROM exercicio_nome_alternativo a WHERE a.exercicio_id=e.id AND a.nome LIKE :alternativo))';
            // Na busca por nome, % e _ digitados pelo usuário contam como texto.
            $termo = '%' . str_replace(['!', '%', '_'], ['!!', '!%', '!_'], $filtros['q']) . '%';
            $where[count($where) - 1] = str_replace(['LIKE :nome', 'LIKE :ingles', 'LIKE :alternativo'], ["LIKE :nome ESCAPE '!'", "LIKE :ingles ESCAPE '!'", "LIKE :alternativo ESCAPE '!'"], $where[count($where) - 1]);
            $params += ['nome' => $termo, 'ingles' => $termo, 'alternativo' => $termo];
        }
        foreach (['grupo' => 'grupo_muscular_id', 'equipamento' => 'equipamento_id', 'modalidade' => 'modalidade'] as $chave => $coluna) {
            if ($filtros[$chave] !== '') {
                $where[] = "e.$coluna=:$chave";
                $params[$chave] = $filtros[$chave];
            }
        }
        foreach (['musculo' => 'exercicio_musculo', 'ambiente' => 'exercicio_ambiente'] as $chave => $tabela) {
            if (($filtros[$chave] ?? '') !== '') {
                $where[] = "EXISTS (SELECT 1 FROM $tabela f WHERE f.exercicio_id=e.id AND f.{$chave}_id=:$chave)";
                $params[$chave] = $filtros[$chave];
            }
        }
        $condicao = implode(' AND ', $where);
        $s = $this->pdo->prepare('SELECT COUNT(*) FROM exercicio e WHERE ' . $condicao);
        $s->execute($params);
        $total = (int) $s->fetchColumn();
        // A contagem usa os mesmos filtros da listagem. Limitar a página evita um deslocamento além do último resultado.
        $paginas = max(1, (int) ceil($total / 24));
        $pagina = min($paginas, max(1, $filtros['pagina']));
        $offset = ($pagina - 1) * 24;
        $ordem = $filtros['ordem'] === 'za' ? 'DESC' : 'ASC';
        $s = $this->pdo->prepare($this->select() . ' WHERE ' . $condicao . " ORDER BY e.nome $ordem,e.id LIMIT 24 OFFSET $offset");
        $s->execute($params);
        return ['itens' => $s->fetchAll(), 'total' => $total, 'pagina' => $pagina, 'paginas' => $paginas];
    }

    /**
     * Monta a projeção comum dos exercícios com grupo muscular, equipamento e tipo de registro para as
     * telas de lista e detalhe.
     *
     * @return string
     */
    private function select(): string
    {
        return 'SELECT e.*,g.nome AS grupo,eq.nome AS equipamento,tr.nome AS registro,tr.usa_repeticoes,tr.usa_carga,tr.usa_duracao,tr.usa_distancia,tr.natureza_carga FROM exercicio e LEFT JOIN grupo_muscular g ON g.id=e.grupo_muscular_id LEFT JOIN equipamento eq ON eq.id=e.equipamento_id LEFT JOIN tipo_registro tr ON tr.id=e.tipo_registro_id';
    }

    /**
     * Procura o exercício ativo pelo ID respeitando o acesso a registros públicos ou da própria conta.
     *
     * @param int $id Identificador do registro consultado ou alterado.
     * @param int $usuario ID da conta cujos dados delimitam a operação.
     * @return array<string,scalar|null>|null
     */
    public function buscarPorId(int $id, int $usuario): ?array
    {
        $s = $this->pdo->prepare($this->select() . ' WHERE e.id=? AND e.ativo=1 AND (e.usuario_id IS NULL OR e.usuario_id=?)');
        $s->execute([$id, $usuario]);
        return $s->fetch() ?: null;
    }

    /**
     * Monta os valores de grupo, equipamento e modalidade oferecidos na pesquisa.
     *
     * @return array{grupo:array,equipamento:array,modalidade:array}
     */
    public function filtros(): array
    {
        return ['grupo' => $this->pdo->query('SELECT id,nome FROM grupo_muscular ORDER BY ordem,nome')->fetchAll(), 'equipamento' => $this->pdo->query('SELECT DISTINCT eq.id,eq.nome FROM equipamento eq JOIN exercicio e ON e.equipamento_id=eq.id WHERE e.ativo=1 AND e.usuario_id IS NULL ORDER BY eq.nome')->fetchAll(), 'modalidade' => $this->pdo->query('SELECT DISTINCT modalidade AS id,modalidade AS nome FROM exercicio WHERE ativo=1 AND usuario_id IS NULL ORDER BY modalidade')->fetchAll()];
    }

    /**
     * Lista imagens e GIFs do exercício com descrição acessível, priorizando a mídia principal.
     *
     * @param int $id Identificador do registro consultado ou alterado.
     * @return list<array<string,scalar|null>>
     */
    public function midias(int $id): array
    {
        $s = $this->pdo->prepare("SELECT tipo,localizacao,descricao_acessivel FROM exercicio_midia WHERE exercicio_id=? AND tipo IN ('imagem','gif') ORDER BY principal DESC,ordem,id");
        $s->execute([$id]);
        return $s->fetchAll();
    }

    /**
     * Lista os músculos associados ao exercício com o papel atribuído no catálogo.
     *
     * @param int $id Identificador do registro consultado ou alterado.
     * @return list<array<string,scalar|null>>
     */
    public function musculos(int $id): array
    {
        $s = $this->pdo->prepare('SELECT m.nome,em.papel FROM exercicio_musculo em JOIN musculo m ON m.id=em.musculo_id WHERE em.exercicio_id=? ORDER BY em.papel,m.nome');
        $s->execute([$id]);
        return $s->fetchAll();
    }
}
