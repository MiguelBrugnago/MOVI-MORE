<?php

declare(strict_types=1);

namespace App\Repositories;

use App\Models\Alimento;
use DomainException;
use PDO;
use PDOStatement;
use Throwable;

final class NutricaoRepository
{
    public function __construct(private PDO $pdo)
    {
    }

    private function consulta(string $sql, array $args): PDOStatement
    {
        $s = $this->pdo->prepare($sql);
        $s->execute($args);
        return $s;
    }

    public function dia(int $usuario, string $data, bool $pessoal): array
    {
        $plano = $this->consulta('SELECT * FROM plano_alimentar WHERE usuario_id=? AND rascunho=0
            AND (ativo=1 OR data_fim IS NOT NULL) AND (data_inicio IS NULL OR data_inicio<=?)
            AND (data_fim IS NULL OR data_fim>=?) ORDER BY data_inicio DESC,id DESC LIMIT 1',
            [$usuario, $data, $data])->fetch() ?: null;
        $rascunho = $pessoal ? $this->rascunho($usuario) : null;
        $registros = $this->consulta('SELECT * FROM registro_alimentar WHERE usuario_id=?
            AND consumido_em>=? AND consumido_em<DATE_ADD(?, INTERVAL 1 DAY) ORDER BY consumido_em,id',
            [$usuario, $data, $data])->fetchAll();
        $preferencias = $this->consulta('SELECT p.nome,u.observacao FROM usuario_preferencia_alimentar u
            JOIN preferencia_alimentar p ON p.id=u.preferencia_alimentar_id WHERE u.usuario_id=? ORDER BY p.nome',
            [$usuario])->fetchAll(PDO::FETCH_KEY_PAIR);
        $alimentos = $pessoal ? $this->consulta('SELECT * FROM alimento WHERE ativo=1 AND
            (usuario_id IS NULL OR usuario_id=?) ORDER BY nome,id', [$usuario])->fetchAll() : [];
        $refeicoes = $plano ? $this->refeicoes((int)$plano['id']) : [];
        $emEdicao = $rascunho ? $this->refeicoes((int)$rascunho['id']) : [];
        return compact('plano', 'rascunho', 'registros', 'preferencias', 'alimentos', 'refeicoes', 'emEdicao');
    }

    private function rascunho(int $usuario): ?array
    {
        return $this->consulta('SELECT * FROM plano_alimentar WHERE usuario_id=? AND rascunho=1
            ORDER BY id DESC LIMIT 1', [$usuario])->fetch() ?: null;
    }

    private function refeicoes(int $plano): array
    {
        $linhas = $this->consulta('SELECT r.id,r.nome,i.alimento_id,COALESCE(i.nome_publicado,a.nome) alimento,i.quantidade_gramas,
            ROUND(i.quantidade_gramas*COALESCE(i.calorias_100g_publicadas,a.calorias_100g)/100,2) kcal,
            ROUND(i.quantidade_gramas*COALESCE(i.proteinas_100g_publicadas,a.proteinas_100g)/100,2) proteinas,
            ROUND(i.quantidade_gramas*COALESCE(i.carboidratos_100g_publicados,a.carboidratos_100g)/100,2) carboidratos,
            ROUND(i.quantidade_gramas*COALESCE(i.gorduras_100g_publicadas,a.gorduras_100g)/100,2) gorduras
            FROM refeicao r LEFT JOIN refeicao_alimento i ON i.refeicao_id=r.id
            LEFT JOIN alimento a ON a.id=i.alimento_id WHERE r.plano_alimentar_id=? ORDER BY r.ordem,i.id',
            [$plano])->fetchAll();
        $refeicoes = [];
        foreach ($linhas as $linha) {
            $id = $linha['id'];
            $refeicoes[$id] ??= ['nome' => $linha['nome'], 'itens' => []];
            if ($linha['alimento'] !== null) {
                $refeicoes[$id]['itens'][] = $linha;
            }
        }
        return $refeicoes;
    }

    public function salvar(int $usuario, string $acao, array $dados, string $hoje): void
    {
        $this->pdo->beginTransaction();
        try {
            // Serializa a publicação, a edição do rascunho e os reenvios da mesma conta.
            $this->consulta('SELECT id FROM usuario WHERE id=? FOR UPDATE', [$usuario]);
            switch ($acao) {
                case 'alimento':
                    if ($this->consulta('SELECT id FROM alimento WHERE (usuario_id IS NULL OR usuario_id=?)
                        AND nome=? AND ativo=1', [$usuario, $dados['nome']])->fetchColumn()) {
                        throw new DomainException('Este alimento já está no catálogo.', 409);
                    }
                    $this->consulta("INSERT INTO alimento (usuario_id,nome,calorias_100g,proteinas_100g,
                        carboidratos_100g,gorduras_100g,fonte_dados) VALUES (?,?,?,?,?,?,'Rótulo informado pela conta')",
                        [$usuario, $dados['nome'], ...$dados['nutrientes']]);
                    break;
                case 'preferencias':
                    foreach (['Preferências pessoais' => 'preferencias', 'Restrições pessoais' => 'restricoes'] as $nome => $campo) {
                        $this->consulta('INSERT INTO usuario_preferencia_alimentar
                            (usuario_id,preferencia_alimentar_id,observacao) SELECT ?,id,? FROM preferencia_alimentar WHERE nome=?
                            ON DUPLICATE KEY UPDATE observacao=?', [$usuario, $dados[$campo], $nome, $dados[$campo]]);
                    }
                    break;
                case 'consumo':
                    $alimento = $this->alimento($usuario, $dados['alimento']);
                    $totais = $alimento->totaisDaPorcao($dados['gramas']);
                    $this->consulta('INSERT INTO registro_alimentar (usuario_id,alimento_id,alimento_nome_snapshot,
                        quantidade_gramas,consumido_em,nome_refeicao,chave,calorias_total,proteinas_total,carboidratos_total,
                        gorduras_total) VALUES (?,?,?,?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE id=id',
                        [$usuario, $alimento->id, $alimento->nome, $dados['gramas'], $dados['data'], $dados['refeicao'],
                        $dados['chave'], $totais['calorias'], $totais['proteinas'], $totais['carboidratos'], $totais['gorduras']]);
                    break;
                case 'corrigir_diario':
                    $s = $this->consulta('DELETE FROM registro_alimentar WHERE id=? AND usuario_id=?',
                        [$dados['id'], $usuario]);
                    if (!$s->rowCount()) {
                        throw new DomainException('Registro não encontrado.', 404);
                    }
                    break;
                default:
                    $this->editarPlano($usuario, $acao, $dados, $hoje);
            }
            $this->pdo->commit();
        } catch (Throwable $e) {
            if ($this->pdo->inTransaction()) {
                $this->pdo->rollBack();
            }
            throw $e;
        }
    }

    private function alimento(int $usuario, int $id): Alimento
    {
        $linha = $this->consulta('SELECT id,nome,calorias_100g,proteinas_100g,carboidratos_100g,gorduras_100g
            FROM alimento WHERE id=? AND ativo=1 AND
            (usuario_id IS NULL OR usuario_id=?)', [$id, $usuario])->fetch()
            ?: throw new DomainException('Alimento indisponível.', 404);

        return new Alimento(
            (int)$linha['id'], $linha['nome'], (float)$linha['calorias_100g'],
            (float)$linha['proteinas_100g'], (float)$linha['carboidratos_100g'], (float)$linha['gorduras_100g'],
        );
    }

    private function editarPlano(int $usuario, string $acao, array $dados, string $hoje): void
    {
        $rascunho = $this->rascunho($usuario);
        if ($acao === 'plano') {
            if ($rascunho) {
                throw new DomainException('Já existe um plano em edição.', 409);
            }
            $this->consulta('INSERT INTO plano_alimentar (usuario_id,nome,calorias_alvo,proteinas_alvo,
                carboidratos_alvo,gorduras_alvo,rascunho,ativo) VALUES (?,?,?,?,?,?,1,0)',
                [$usuario, $dados['nome'], ...$dados['nutrientes']]);
            return;
        }
        if (!$rascunho || (int)$rascunho['id'] !== $dados['plano']) {
            throw new DomainException('Rascunho indisponível.', 404);
        }
        $plano = $dados['plano'];
        if ($acao === 'editar_plano') {
            $this->consulta('UPDATE plano_alimentar SET nome=?,calorias_alvo=?,proteinas_alvo=?,
                carboidratos_alvo=?,gorduras_alvo=? WHERE id=?', [$dados['nome'], ...$dados['nutrientes'], $plano]);
        } elseif ($acao === 'refeicao') {
            $ordem = $this->consulta('SELECT COALESCE(MAX(ordem),0)+1 FROM refeicao WHERE plano_alimentar_id=?',
                [$plano])->fetchColumn();
            if (!$this->consulta('SELECT id FROM refeicao WHERE plano_alimentar_id=? AND nome=?',
                [$plano, $dados['nome']])->fetchColumn()) {
                $this->consulta('INSERT INTO refeicao (plano_alimentar_id,nome,ordem) VALUES (?,?,?)',
                    [$plano, $dados['nome'], $ordem]);
            }
        } elseif (in_array($acao, ['porcao', 'remover_porcao', 'remover_refeicao'], true)) {
            if (!$this->consulta('SELECT id FROM refeicao WHERE plano_alimentar_id=? AND id=?',
                [$plano, $dados['refeicao']])->fetchColumn()) {
                throw new DomainException('Refeição indisponível.', 404);
            }
            if ($acao === 'remover_refeicao') {
                $this->consulta('DELETE FROM refeicao_alimento WHERE refeicao_id=?', [$dados['refeicao']]);
                $this->consulta('DELETE FROM refeicao WHERE id=?', [$dados['refeicao']]);
                return;
            }
            if ($acao === 'remover_porcao') {
                $this->consulta('DELETE FROM refeicao_alimento WHERE refeicao_id=? AND alimento_id=?',
                    [$dados['refeicao'], $dados['alimento']]);
                return;
            }
            $this->alimento($usuario, $dados['alimento']);
            $this->consulta('INSERT INTO refeicao_alimento (refeicao_id,alimento_id,quantidade_gramas)
                VALUES (?,?,?) ON DUPLICATE KEY UPDATE quantidade_gramas=?',
                [$dados['refeicao'], $dados['alimento'], $dados['gramas'], $dados['gramas']]);
        } elseif ($acao === 'publicar') {
            $refeicoes = $this->refeicoes($plano);
            if (!$refeicoes || in_array([], array_column($refeicoes, 'itens'), true)) {
                throw new DomainException('Inclua pelo menos uma refeição e um alimento em cada refeição.', 422);
            }
            $this->consulta('UPDATE refeicao_alimento i JOIN refeicao r ON r.id=i.refeicao_id
                JOIN alimento a ON a.id=i.alimento_id SET i.nome_publicado=a.nome,
                i.calorias_100g_publicadas=a.calorias_100g, i.proteinas_100g_publicadas=a.proteinas_100g,
                i.carboidratos_100g_publicados=a.carboidratos_100g, i.gorduras_100g_publicadas=a.gorduras_100g
                WHERE r.plano_alimentar_id=?', [$plano]);
            $this->consulta('UPDATE plano_alimentar SET ativo=0, data_fim=GREATEST(COALESCE(data_inicio,\'1000-01-01\'), DATE_SUB(?,INTERVAL 1 DAY))
                WHERE usuario_id=? AND rascunho=0 AND ativo=1 AND (data_inicio IS NULL OR data_inicio<=?)
                AND (data_fim IS NULL OR data_fim>=?)', [$hoje, $usuario, $hoje, $hoje]);
            $this->consulta('UPDATE plano_alimentar SET rascunho=0,ativo=1,data_inicio=? WHERE id=?', [$hoje, $plano]);
        } else {
            throw new DomainException('Ação inválida.', 422);
        }
    }
}
