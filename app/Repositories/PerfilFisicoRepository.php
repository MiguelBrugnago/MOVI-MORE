<?php

declare(strict_types=1);

namespace App\Repositories;

use App\Services\PerfilFisicoService;
use DomainException;
use PDO;
use Throwable;

final class PerfilFisicoRepository
{
    public function __construct(private PDO $pdo)
    {
    }

    private function consultar(string $sql, array $args = []): \PDOStatement
    {
        $s = $this->pdo->prepare($sql);
        $s->execute($args);
        return $s;
    }

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

    public function perfil(int $usuario): array
    {
        return $this->consultar('SELECT p.*,u.data_nascimento FROM usuario u LEFT JOIN perfil p ON p.usuario_id=u.id WHERE u.id=?', [$usuario])->fetch() ?: [];
    }

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

    public function historico(int $usuario, ?string $inicio = null): array
    {
        $rows = $this->consultar(
            'SELECT a.id,a.profissional_id,a.avaliado_em,a.observacao,m.tipo,m.valor,m.unidade
            FROM avaliacao a LEFT JOIN medida m ON m.avaliacao_id=a.id AND m.usuario_id=a.usuario_id
            WHERE a.usuario_id=?' . ($inicio ? ' AND a.avaliado_em>=?' : '') . ' ORDER BY a.avaliado_em DESC,a.id DESC,m.id',
            $inicio ? [$usuario, $inicio] : [$usuario]
        )->fetchAll();
        $avaliacoes = [];
        foreach ($rows as $r) {
            $id = $r['id'];
            $avaliacoes[$id] ??= ['id' => $id, 'profissional_id' => $r['profissional_id'], 'avaliado_em' => substr($r['avaliado_em'], 0, 10), 'observacao' => $r['observacao'], 'medidas' => []];
            if (isset(PerfilFisicoService::MEDIDAS[$r['tipo'] ?? '']) && $r['unidade'] === PerfilFisicoService::MEDIDAS[$r['tipo']][1]) {
                $avaliacoes[$id]['medidas'][$r['tipo']] = (float)$r['valor'];
            }
        }
        foreach ($avaliacoes as &$a) {
            $a['medidas'] += PerfilFisicoService::composicao($a['medidas']);
        }
        return array_values($avaliacoes);
    }

    public function avaliacao(int $usuario, int $id): array
    {
        foreach ($this->historico($usuario) as $a) {
            if ((int)$a['id'] === $id) {
                return $a;
            }
        }
        throw new DomainException('Avaliação não encontrada.', 404);
    }

    public function salvarAvaliacao(int $usuario, ?int $id, array $dados): int
    {
        return $this->transacao(function () use ($usuario, $id, $dados) {
            if ($id !== null) {
                $this->propria($usuario, $id);
                $this->consultar('UPDATE avaliacao SET avaliado_em=?,observacao=? WHERE id=? AND usuario_id=?', [$dados['avaliado_em'], $dados['observacao'], $id, $usuario]);
                // Preserva tipos legados desconhecidos; substitui somente métricas deste módulo.
                $tipos = array_keys(PerfilFisicoService::MEDIDAS);
                $params = implode(',', array_fill(0, count($tipos), '?'));
                $this->consultar("DELETE FROM medida WHERE avaliacao_id=? AND usuario_id=? AND tipo IN ($params)", [$id, $usuario, ...$tipos]);
            } else {
                $this->consultar("INSERT INTO avaliacao (usuario_id,avaliado_em,observacao,metodo) VALUES (?,?,?,'Autodeclarada')", [$usuario, $dados['avaliado_em'], $dados['observacao']]);
                $id = (int)$this->pdo->lastInsertId();
            }
            foreach (PerfilFisicoService::MEDIDAS as $tipo => [, $unidade]) {
                $valor = $dados['medidas'][$tipo] ?? null;
                if ($valor !== null) {
                    $this->consultar('INSERT INTO medida (usuario_id,avaliacao_id,tipo,valor,unidade,registrado_em) VALUES (?,?,?,?,?,?)', [$usuario, $id, $tipo, $valor, $unidade, $dados['avaliado_em']]);
                }
            }
            return $id;
        });
    }

    private function propria(int $usuario, int $id): void
    {
        if (!$this->consultar('SELECT id FROM avaliacao WHERE id=? AND usuario_id=? AND profissional_id IS NULL FOR UPDATE', [$id, $usuario])->fetchColumn()) {
            throw new DomainException('Avaliação própria não encontrada.', 404);
        }
    }

    public function excluir(int $usuario, int $id): void
    {
        $this->transacao(function () use ($usuario, $id) {
            $this->propria($usuario, $id);
            $this->consultar('DELETE FROM medida WHERE avaliacao_id=? AND usuario_id=?', [$id, $usuario]);
            $this->consultar('DELETE FROM avaliacao WHERE id=? AND usuario_id=?', [$id, $usuario]);
        });
    }

    public function declaracoes(int $usuario): array
    {
        return [
            'condicoes' => $this->consultar('SELECT uc.id,c.nome,uc.status,uc.origem FROM usuario_condicao uc JOIN condicao c ON c.id=uc.condicao_id WHERE uc.usuario_id=?', [$usuario])->fetchAll(),
            'restricoes' => $this->consultar('SELECT ur.id,r.nome,ur.gravidade,ur.observacao FROM usuario_restricao ur JOIN restricao r ON r.id=ur.restricao_id WHERE ur.usuario_id=?', [$usuario])->fetchAll(),
        ];
    }

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

    public function removerDeclaracao(int $usuario, string $tipo, int $id): void
    {
        $tabela = $tipo === 'condicao' ? 'usuario_condicao' : 'usuario_restricao';
        $this->consultar("DELETE FROM $tabela WHERE id=? AND usuario_id=?", [$id, $usuario]);
    }
}
