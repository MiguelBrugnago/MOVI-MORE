<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Config\Database;
use App\Repositories\ExercicioRepository;
use App\Repositories\TreinoRepository;
use App\Security\Auth;
use App\Security\Csrf;
use App\Services\RegistroTreino;
use App\Services\TreinoService;
use DomainException;
use InvalidArgumentException;

final class RotinaController
{
    private function repo(): TreinoRepository
    {
        return new TreinoRepository(Database::conectar());
    }

    private function usuario(): int
    {
        $u = Auth::usuario();
        header('Cache-Control: no-store, private');
        return (int) $u['id'];
    }

    private function get(string $key): int
    {
        return max(0, (int) (filter_input(INPUT_GET, $key, FILTER_VALIDATE_INT) ?: 0));
    }

    private function view(string $nome, array $dados = []): void
    {
        extract($dados, EXTR_SKIP);
        $titulo = 'MOVI+ | Treinos';
        $viewPath = __DIR__ . '/../Views/' . $nome . '.php';
        require __DIR__ . '/../Views/layouts/app.php';
    }

    private function erro(int $status, string $mensagem, string $voltar): void
    {
        http_response_code($status);
        if (($_SERVER['HTTP_ACCEPT'] ?? '') === 'application/json') {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode(['erro' => $mensagem], JSON_THROW_ON_ERROR);
            return;
        }
        $this->view('treino_erro', compact('mensagem', 'voltar'));
    }

    private function post(callable $fn, string $voltar, bool $serie = false): void
    {
        $u = $this->usuario();
        $token = $_POST['csrf_token'] ?? null;
        if (!is_string($token) || !Csrf::validarToken($token)) {
            $this->erro(403, 'Requisição inválida. Reabra a página e tente novamente.', $voltar);
            return;
        }
        try {
            $url = $fn(new TreinoService($this->repo()), $u);
            if (($_SERVER['HTTP_ACCEPT'] ?? '') === 'application/json') {
                header('Content-Type: application/json; charset=utf-8');
                $id = (int) filter_input(INPUT_POST, 'treino_id', FILTER_VALIDATE_INT);
                $atualizado = $id ? $this->repo()->treino($id, $u) : null;
                $resposta = ['url' => $url, 'descanso' => $atualizado['descanso'] ?? null];
                if ($serie && $atualizado && ($_POST['modo'] ?? null) !== 'rascunho') {
                    $resposta += $this->fragmentosSerie($atualizado, $u);
                }
                echo json_encode($resposta, JSON_THROW_ON_ERROR);
                return;
            }
            header('Location: ' . $url, true, 303);
        } catch (InvalidArgumentException $e) {
            $this->erro(422, $e->getMessage(), $voltar);
        } catch (DomainException $e) {
            $this->erro($e->getCode(), $e->getMessage(), $voltar);
        } catch (\PDOException $e) {
            error_log('Persistência do treino: ' . $e->getCode());
            $this->erro(503, 'Não foi possível salvar. Tente novamente em instantes.', $voltar);
        }
    }

    private function fragmentosSerie(array $treino, int $u): array
    {
        $id = (int) $treino['id'];
        $ativo = $treino['status'] === 'em_andamento';
        $editavel = $ativo || $treino['status'] === 'concluido';
        $db = $this->repo();
        $item = TreinoService::id($_POST, 'item_id');
        $x = $db->itens($id, false, $item)[0] ?? null;
        $serie = filter_input(INPUT_POST, 'serie_id', FILTER_VALIDATE_INT) ?: 0;
        if (!$x) {
            return [];
        }
        $s = $serie
            ? $db->um('SELECT * FROM serie WHERE id=? AND treino_exercicio_id=?', [$serie, $item])
            : $db->um('SELECT * FROM serie WHERE chave=? AND treino_exercicio_id=?', [$_POST['chave'], $item]);
        if (!$s) {
            return [];
        }
        $anterior = $ativo && (!$serie || (!$s['concluida'] && !$s['ignorada'])) ? $db->anterior($u, $id) : [];
        require __DIR__ . '/../Views/treinos/campos.php';
        require __DIR__ . '/../Views/treinos/resumo_serie.php';
        ob_start();
        require __DIR__ . '/../Views/treinos/serie.php';
        $resposta = ['serie' => ob_get_clean()];
        if (!$serie && $ativo) {
            $s = [];
            ob_start();
            require __DIR__ . '/../Views/treinos/serie.php';
            $resposta['novaSerie'] = ob_get_clean();
        }
        return $resposta;
    }

    public function index(): void
    {
        $u = $this->usuario();
        $db = $this->repo();
        $id = $this->get('id');
        $rotina = $id ? $db->rotina($id, $u) : null;
        if ($id && !$rotina) {
            $this->erro(404, 'Rotina não encontrada.', '/rotinas');
            return;
        }
        $arquivadas = (bool) $this->get('arquivadas');
        $rotinas = $db->todos('SELECT * FROM rotina WHERE usuario_id=? AND ativa=? ORDER BY COALESCE(dia_semana,8),id DESC', [$u, (int) !$arquivadas]);
        $ativo = $db->ativo($u);
        $itens = $id ? $db->itens($id, true) : [];
        $series = $id ? $db->series($id, true) : [];
        $this->view('rotinas', compact('rotina', 'rotinas', 'ativo', 'itens', 'series', 'arquivadas'));
    }

    public function criar(): void
    {
        $this->salvar('criar');
    }

    public function adicionar(): void
    {
        $this->salvar('adicionar');
    }

    public function salvar(?string $fixa = null): void
    {
        $this->post(static function (TreinoService $s, int $u) use ($fixa) {
            $acao = $fixa ?? $_POST['acao'] ?? '';
            if (!is_string($acao)) {
                throw new InvalidArgumentException('Ação inválida.');
            }
            $id = $s->rotina($u, $_POST, $acao);
            return $acao === 'arquivar' ? '/rotinas' : '/rotinas?id=' . $id;
        }, '/rotinas?id=' . (int) filter_input(INPUT_POST, 'rotina_id', FILTER_VALIDATE_INT));
    }

    public function iniciar(): void
    {
        $this->post(static fn (TreinoService $s, int $u) => '/treinos/ver?id=' . $s->iniciar($u, $_POST), '/rotinas');
    }

    public function finalizar(): void
    {
        $this->sessao('finalizar');
    }

    public function serie(): void
    {
        $this->sessao('serie');
    }

    public function sessao(?string $fixa = null): void
    {
        $voltar = '/treinos/ver?id=' . (int) filter_input(INPUT_POST, 'treino_id', FILTER_VALIDATE_INT);
        $this->post(static function (TreinoService $s, int $u) use ($fixa) {
            $acao = $fixa ?? $_POST['acao'] ?? '';
            if (!is_string($acao)) {
                throw new InvalidArgumentException('Ação inválida.');
            }
            $id = $s->sessao($u, $_POST, $acao);
            return match ($acao) {
                'excluir' => '/treinos/historico',
                'cancelar' => '/rotinas',
                default => '/treinos/ver?id=' . $id,
            };
        }, $voltar, $fixa === 'serie');
    }

    public function treino(): void
    {
        $u = $this->usuario();
        $db = $this->repo();
        $id = $this->get('id');
        $treino = $db->treino($id, $u);
        if (!$treino || $treino['status'] === 'excluido') {
            $this->erro(404, 'Treino não encontrado.', '/rotinas');
            return;
        }
        $itens = $db->itens($id, false);
        $series = $db->series($id, false);
        $anterior = $treino['status'] === 'em_andamento' ? $db->anterior($u, $id) : [];
        $volume = $treino['status'] !== 'concluido' ? null : $db->consultar('SELECT SUM(' . TreinoRepository::VOLUME . ') FROM treino_exercicio x
            JOIN serie s ON s.treino_exercicio_id=x.id JOIN exercicio e ON e.id=x.exercicio_id
            JOIN tipo_registro tr ON tr.id=e.tipo_registro_id WHERE x.treino_id=?', [$id])->fetchColumn();
        $recordesSessao = $treino['status'] === 'concluido' && $treino['finalizado_em'] !== null
            ? $db->recordesDaSessao($u, $id, $treino['finalizado_em']) : [];
        $this->view('treino', compact('treino', 'itens', 'series', 'anterior', 'volume', 'recordesSessao'));
    }

    public function seletor(): void
    {
        $u = $this->usuario();
        $db = $this->repo();
        $r = $this->get('rotina');
        $t = $this->get('treino');
        $item = $this->get('item');
        $rotina = $r ? $db->rotina($r, $u) : null;
        $treino = $t ? $db->treino($t, $u) : null;
        if ((bool) $r === (bool) $t || ($r && empty($rotina['ativa'])) || ($t && ($treino['status'] ?? '') !== 'em_andamento')) {
            $this->erro(404, 'Destino indisponível.', '/rotinas');
            return;
        }
        $repo = new ExercicioRepository();
        $f = array_fill_keys(['q', 'grupo', 'equipamento', 'modalidade', 'musculo', 'ambiente'], '');
        foreach ($f as $k => $v) {
            $f[$k] = mb_substr(trim(is_string($_GET[$k] ?? null) ? $_GET[$k] : ''), 0, 160, 'UTF-8');
        }
        $f += ['pagina' => max(1, $this->get('pagina')), 'ordem' => 'az'];
        $catalogo = $repo->pesquisar($u, $f);
        $opcoes = $repo->filtros() + [
            'musculo' => $db->todos('SELECT id,nome FROM musculo ORDER BY nome', []),
            'ambiente' => $db->todos('SELECT id,nome FROM ambiente ORDER BY nome', []),
        ];
        $this->view('treino_seletor', compact('r', 't', 'item', 'f', 'catalogo', 'opcoes'));
    }

    public function personalizados(): void
    {
        $u = $this->usuario();
        $db = $this->repo();
        $itens = $db->todos('SELECT id,nome FROM exercicio WHERE usuario_id=? AND ativo=1 ORDER BY nome', [$u]);
        $id = $this->get('id');
        $editando = $id ? $db->um('SELECT * FROM exercicio WHERE id=? AND usuario_id=? AND ativo=1', [$id, $u]) : null;
        if ($id && !$editando) {
            $this->erro(404, 'Exercício não encontrado.', '/treinos/personalizados');
            return;
        }
        $opcoes = [];
        foreach (['grupo_muscular', 'equipamento', 'tipo_registro'] as $tabela) {
            $opcoes[$tabela] = array_column($db->todos("SELECT id,nome FROM $tabela ORDER BY nome", []), 'nome', 'id');
        }
        $this->view('treino_personalizados', compact('itens', 'editando', 'opcoes'));
    }

    public function salvarPersonalizado(): void
    {
        $this->post(fn (TreinoService $s, int $u) => '/treinos/personalizados?id=' . $s->personalizado($u, $_POST), '/treinos/personalizados');
    }

    public function historico(): void
    {
        $u = $this->usuario();
        $db = $this->repo();
        $f = [];
        foreach (['de', 'ate'] as $k) {
            $valor = filter_input(INPUT_GET, $k) ?: '';
            $f[$k] = preg_match('/^(\d{4})-(\d{2})-(\d{2})$/D', $valor, $m) && checkdate((int) $m[2], (int) $m[3], (int) $m[1]) ? $valor : '';
        }
        $f['exercicio'] = mb_substr(trim(filter_input(INPUT_GET, 'exercicio') ?: ''), 0, 120, 'UTF-8');
        [$rows, $mais] = $db->historico($u, $f, $this->get('antes'));
        $this->view('treino_historico', compact('rows', 'mais', 'f'));
    }

    public function estatisticas(): void
    {
        $u = $this->usuario();
        $db = $this->repo();
        $exercicio = $this->get('exercicio');
        [$totais, $periodos, $execucao, $recordes, $evolucao, $recentes, $distribuicao] = $db->estatisticas($u, $exercicio);
        $this->view('treino_estatisticas', compact('totais', 'periodos', 'execucao', 'recordes', 'evolucao', 'recentes', 'distribuicao', 'exercicio'));
    }
}
