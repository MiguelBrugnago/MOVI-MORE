<?php

declare(strict_types=1);

namespace App\Repositories;

use App\Config\Database;
use PDO;

final class ExercicioRepository
{
    private PDO $pdo;
    public function __construct()
    {
        $this->pdo = Database::conectar();
    }
    public function pesquisar(int $usuarioId, array $filtros): array
    {
        $where = ['e.ativo=1', '(e.usuario_id IS NULL OR e.usuario_id=:usuario)'];
        $params = ['usuario' => $usuarioId];
        if ($filtros['q'] !== '') {
            $where[] = '(e.nome LIKE :nome OR e.nome_ingles LIKE :ingles OR EXISTS (SELECT 1 FROM exercicio_nome_alternativo a WHERE a.exercicio_id=e.id AND a.nome LIKE :alternativo))';
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
        $paginas = max(1, (int) ceil($total / 24));
        $pagina = min($paginas, max(1, $filtros['pagina']));
        $offset = ($pagina - 1) * 24;
        $ordem = $filtros['ordem'] === 'za' ? 'DESC' : 'ASC';
        $s = $this->pdo->prepare($this->select() . ' WHERE ' . $condicao . " ORDER BY e.nome $ordem,e.id LIMIT 24 OFFSET $offset");
        $s->execute($params);
        return ['itens' => $s->fetchAll(), 'total' => $total, 'pagina' => $pagina, 'paginas' => $paginas];
    }
    private function select(): string
    {
        return 'SELECT e.*,g.nome AS grupo,eq.nome AS equipamento,tr.nome AS registro,tr.usa_repeticoes,tr.usa_carga,tr.usa_duracao,tr.usa_distancia,tr.natureza_carga FROM exercicio e LEFT JOIN grupo_muscular g ON g.id=e.grupo_muscular_id LEFT JOIN equipamento eq ON eq.id=e.equipamento_id LEFT JOIN tipo_registro tr ON tr.id=e.tipo_registro_id';
    }
    public function buscarPorId(int $id, int $usuario): ?array
    {
        $s = $this->pdo->prepare($this->select() . ' WHERE e.id=? AND e.ativo=1 AND (e.usuario_id IS NULL OR e.usuario_id=?)');
        $s->execute([$id, $usuario]);
        return $s->fetch() ?: null;
    }
    public function filtros(): array
    {
        return ['grupo' => $this->pdo->query('SELECT id,nome FROM grupo_muscular ORDER BY ordem,nome')->fetchAll(), 'equipamento' => $this->pdo->query('SELECT DISTINCT eq.id,eq.nome FROM equipamento eq JOIN exercicio e ON e.equipamento_id=eq.id WHERE e.ativo=1 AND e.usuario_id IS NULL ORDER BY eq.nome')->fetchAll(), 'modalidade' => $this->pdo->query('SELECT DISTINCT modalidade AS id,modalidade AS nome FROM exercicio WHERE ativo=1 AND usuario_id IS NULL ORDER BY modalidade')->fetchAll()];
    }
    public function midias(int $id): array
    {
        $s = $this->pdo->prepare("SELECT tipo,localizacao,descricao_acessivel FROM exercicio_midia WHERE exercicio_id=? AND tipo IN ('imagem','gif') ORDER BY principal DESC,ordem,id");
        $s->execute([$id]);
        return $s->fetchAll();
    }
    public function musculos(int $id): array
    {
        $s = $this->pdo->prepare('SELECT m.nome,em.papel FROM exercicio_musculo em JOIN musculo m ON m.id=em.musculo_id WHERE em.exercicio_id=? ORDER BY em.papel,m.nome');
        $s->execute([$id]);
        return $s->fetchAll();
    }
}
