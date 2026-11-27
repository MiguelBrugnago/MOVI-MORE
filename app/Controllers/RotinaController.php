<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Config\Database;
use App\Repositories\ExercicioRepository;
use App\Repositories\TreinoRepository;
use App\Repositories\PropostaRepository;
use App\Repositories\VinculoProfissionalRepository;
use App\Security\Auth;
use App\Security\Csrf;
use App\Services\TreinoService;
use App\Services\PropostaService;
use DomainException;
use InvalidArgumentException;

/**
 * Recebe as requisições de planejamento, execução e propostas. Obtém o dono pela sessão, coordena
 * TreinoService ou PropostaService e responde com HTML, redirecionamento ou JSON para o editor de
 * séries.
 */
final class RotinaController
{
    /**
     * Instancia o repositório de treino com a conexão compartilhada da aplicação.
     *
     * @return TreinoRepository
     */
    private function repo(): TreinoRepository
    {
        return new TreinoRepository(Database::conectar());
    }

    /**
     * Monta o serviço que aplica as regras de edição e de execução sobre o repositório.
     *
     * @return TreinoService
     */
    private function treinos(): TreinoService
    {
        return new TreinoService($this->repo());
    }

    /**
     * Valida a sessão e a conta ativa, marca a resposta como privada e devolve o ID do usuário.
     *
     * @return int
     */
    private function usuario(): int
    {
        $u = Auth::usuario();
        header('Cache-Control: no-store, private');
        return (int) $u['id'];
    }

    /**
     * Lê da URL um inteiro não negativo. Parâmetros ausentes ou inválidos resultam em zero.
     *
     * @param string $key Nome do parâmetro da URL.
     * @return int
     */
    private function get(string $key): int
    {
        return max(0, (int) (filter_input(INPUT_GET, $key, FILTER_VALIDATE_INT) ?: 0));
    }

    /**
     * Expõe os campos ao template sem sobrescrever variáveis locais e carrega o layout autenticado.
     *
     * @param string $nome Nome do arquivo de view escolhido pelo controller, sem a extensão PHP.
     * @param array $dados Campos associados aos seus nomes.
     */
    private function view(string $nome, array $dados = []): void
    {
        extract($dados, EXTR_SKIP);
        $titulo = 'MOVI+ | Treinos';
        $viewPath = __DIR__ . '/../Views/' . $nome . '.php';
        require __DIR__ . '/../Views/layouts/app.php';
    }

    /**
     * Define o status recebido e envia a mensagem em JSON para chamadas assíncronas ou na página de erro
     * com link de retorno.
     *
     * @param int $status Código HTTP da resposta de erro.
     * @param string $mensagem Texto de retorno a apresentar ao usuário.
     * @param string $voltar URL local para retornar após uma falha.
     */
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

    /**
     * Executa o callback com o ID autenticado. Em sucesso devolve 303 ou JSON e entrada inválida gera
     * 422, conflitos usam o código de domínio e falhas de persistência geram 503.
     *
     * Confere a sessão e o token antes de entregar os dados do formulário ao serviço.
     *
     * @param callable(int):string $fn Recebe o ID autenticado e devolve a URL de destino.
     * @param string $voltar URL local para retornar após uma falha.
     * @param bool $serie Habilita os fragmentos HTML da série na resposta JSON.
     */
    private function post(callable $fn, string $voltar, bool $serie = false): void
    {
        $u = $this->usuario();
        $token = $_POST['csrf_token'] ?? null;
        if (!is_string($token) || !Csrf::validarToken($token)) {
            $this->erro(403, 'Requisição inválida. Reabra a página e tente novamente.', $voltar);
            return;
        }
        try {
            // O callback recebe o ID da sessão. Nas ações de treino, treinos() fornece o serviço separadamente.
            $url = $fn($u);
            if (($_SERVER['HTTP_ACCEPT'] ?? '') === 'application/json') {
                header('Content-Type: application/json; charset=utf-8');
                $id = (int) filter_input(INPUT_POST, 'treino_id', FILTER_VALIDATE_INT);
                $atualizado = $id ? $this->repo()->treino($id, $u) : null;
                // O JavaScript usa a URL e o prazo de descanso como referência; apenas a gravação de série precisa de novo HTML.
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

    /**
     * Recarrega o item salvo e renderiza os formulários de série em memória para atualizar somente a
     * parte alterada no navegador.
     *
     * @param array $treino Sessão já verificada e recarregada após a gravação da série.
     * @param int $u ID da conta proprietária dos dados.
     * @return array{serie?:string,novaSerie?:string}
     */
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
        $anterioresPorNumero = array_column($anterior[$x['exercicio_id']] ?? [], null, 'numero');
        require __DIR__ . '/../Views/treinos/campos.php';
        require __DIR__ . '/../Views/treinos/resumo_serie.php';
        ob_start();
        require __DIR__ . '/../Views/treinos/serie.php';
        // A resposta reaproveita o mesmo cartão da página inicial para manter regras de edição e escape de HTML.
        $resposta = ['serie' => ob_get_clean()];
        if (!$serie && $ativo) {
            // Um reenvio pode devolver uma série que já não é a última do exercício.
            $proximoNumero = 1 + (int)$db->consultar('SELECT MAX(numero) FROM serie WHERE treino_exercicio_id=?', [$item])->fetchColumn();
            $s = [];
            ob_start();
            require __DIR__ . '/../Views/treinos/serie.php';
            $resposta['novaSerie'] = ob_get_clean();
        }
        return $resposta;
    }

    /**
     * Abre o editor compartilhado no modo profissional, que exige perfil ativo.
     *
     * Rota GET /profissional/modelos.
     */
    public function modelos(): void
    {
        $this->index(true);
    }

    /**
     * Lista rotinas próprias ativas ou arquivadas. Ao selecionar um ID, carrega seus itens e séries e
     * confere o modo do editor.
     *
     * Rotas GET /rotinas, GET /treinos.
     *
     * @param bool $modelo Indica se o editor trabalha com modelos profissionais.
     */
    public function index(bool $modelo = false): void
    {
        $u = $this->usuario();
        $db = $this->repo();
        $base = $modelo ? '/profissional/modelos' : '/rotinas';
        if ($modelo && !$db->profissionalAtivo($u)) {
            $this->erro(403, 'Perfil profissional inativo.', '/painel');
            return;
        }
        $id = $this->get('id');
        $rotina = $id ? $db->rotina($id, $u) : null;
        if ($id && (!$rotina || (bool) $rotina['modelo_profissional'] !== $modelo)) {
            $this->erro(404, 'Rotina não encontrada.', $base);
            return;
        }
        $arquivadas = (bool) $this->get('arquivadas');
        $rotinas = $db->todos('SELECT r.id, r.nome, r.dia_semana, r.ativa,
            COUNT(DISTINCT x.id) AS exercicios, COUNT(s.id) AS series
            FROM rotina r LEFT JOIN rotina_exercicio x ON x.rotina_id=r.id
            LEFT JOIN rotina_serie s ON s.rotina_exercicio_id=x.id
            WHERE r.usuario_id=? AND r.modelo_profissional=? AND r.ativa=?
            GROUP BY r.id ORDER BY COALESCE(r.dia_semana,8),r.id DESC', [$u, (int) $modelo, (int) !$arquivadas]);
        $pessoais = $modelo && !$arquivadas
            ? $db->todos('SELECT id,nome FROM rotina WHERE usuario_id=? AND modelo_profissional=0 ORDER BY nome,id', [$u]) : [];
        $ativo = $modelo ? null : $db->ativo($u);
        $alunos = $modelo && $rotina ? (new VinculoProfissionalRepository())->listarAlunosAtivos($u) : [];
        $itens = $id ? $db->itens($id, true) : [];
        $series = $id ? $db->series($id, true) : [];
        $this->view('rotinas', compact('rotina', 'rotinas', 'ativo', 'itens', 'series', 'arquivadas', 'modelo', 'base', 'alunos', 'pessoais'));
    }

    /**
     * Encaminha o formulário pessoal ao serviço com a ação de criação fixada pela rota.
     *
     * Rota POST /rotinas.
     */
    public function criar(): void
    {
        $this->salvar('criar');
    }

    /**
     * Encaminha a seleção de exercícios ao serviço com a ação de inclusão fixada pela rota.
     *
     * Rota POST /rotinas/adicionar.
     */
    public function adicionar(): void
    {
        $this->salvar('adicionar');
    }

    /**
     * Processa o formulário no modo de modelo profissional, inclusive cópia de rotina pessoal.
     *
     * Rota POST /profissional/modelos/salvar.
     */
    public function salvarModelo(): void
    {
        $this->salvar(null, true);
    }

    /**
     * Lê a ação de edição ou usa a ação fixada pela rota. Entrega o formulário ao serviço da conta e
     * devolve a URL do editor.
     *
     * Rota POST /rotinas/salvar.
     *
     * @param ?string $fixa Ação determinada pela rota, com precedência sobre o formulário.
     * @param bool $modelo Indica se o editor trabalha com modelos profissionais.
     */
    public function salvar(?string $fixa = null, bool $modelo = false): void
    {
        $base = $modelo ? '/profissional/modelos' : '/rotinas';
        $this->post(function (int $u) use ($fixa, $modelo, $base) {
            $acao = $fixa ?? $_POST['acao'] ?? '';
            if (!is_string($acao)) {
                throw new InvalidArgumentException('Ação inválida.');
            }
            $id = $this->treinos()->rotina($u, $_POST, $acao, $modelo);
            return $acao === 'arquivar' ? $base : $base . '?id=' . $id;
        }, $base . '?id=' . (int) filter_input(INPUT_POST, 'rotina_id', FILTER_VALIDATE_INT));
    }

    /**
     * Abre ou retoma uma sessão da conta pelo serviço e devolve a URL do treino resultante.
     *
     * Rota POST /treinos/iniciar.
     */
    public function iniciar(): void
    {
        $this->post(fn (int $u) => '/treinos/ver?id=' . $this->treinos()->iniciar($u, $_POST), '/rotinas');
    }

    /**
     * Encaminha o formulário para o encerramento de sessão com a ação de finalização.
     *
     * Rota POST /treinos/finalizar.
     */
    public function finalizar(): void
    {
        $this->sessao('finalizar');
    }

    /**
     * Encaminha o formulário de série para a sessão e habilita a atualização parcial da interface.
     *
     * Rota POST /treinos/serie.
     */
    public function serie(): void
    {
        $this->sessao('serie');
    }

    /**
     * Valida a ação de execução, grava pelo serviço e escolhe o destino entre sessão, rotinas e
     * histórico.
     *
     * Rota POST /treinos/salvar.
     *
     * @param ?string $fixa Ação determinada pela rota, com precedência sobre o formulário.
     */
    public function sessao(?string $fixa = null): void
    {
        $voltar = '/treinos/ver?id=' . (int) filter_input(INPUT_POST, 'treino_id', FILTER_VALIDATE_INT);
        $this->post(function (int $u) use ($fixa) {
            $acao = $fixa ?? $_POST['acao'] ?? '';
            if (!is_string($acao)) {
                throw new InvalidArgumentException('Ação inválida.');
            }
            $id = $this->treinos()->sessao($u, $_POST, $acao);
            return match ($acao) {
                'excluir' => '/treinos/historico',
                'cancelar' => '/rotinas',
                default => '/treinos/ver?id=' . $id,
            };
        }, $voltar, $fixa === 'serie');
    }

    /**
     * Confere o dono e o estado do treino pedido na URL e carrega itens, séries e referências ao
     * desempenho anterior.
     *
     * Rota GET /treinos/ver.
     */
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

    /**
     * Confere um único destino editável, lê os filtros da URL e monta a página de seleção. Modelos usam
     * o catálogo público.
     *
     * Rota GET /treinos/exercicios.
     */
    public function seletor(): void
    {
        $u = $this->usuario();
        $db = $this->repo();
        // O seletor atende ao planejamento e à execução. Deve haver exatamente um destino válido no modo editável.
        $r = $this->get('rotina');
        $t = $this->get('treino');
        $item = $this->get('item');
        $rotina = $r ? $db->rotina($r, $u) : null;
        $treino = $t ? $db->treino($t, $u) : null;
        if ((bool) $r === (bool) $t || ($r && empty($rotina['ativa'])) || ($t && ($treino['status'] ?? '') !== 'em_andamento')) {
            $this->erro(404, 'Destino indisponível.', '/rotinas');
            return;
        }
        $modelo = (bool) ($rotina['modelo_profissional'] ?? false);
        if ($modelo && !$db->profissionalAtivo($u)) {
            $this->erro(403, 'Perfil profissional inativo.', '/painel');
            return;
        }
        $repo = new ExercicioRepository();
        $f = array_fill_keys(['q', 'grupo', 'equipamento', 'modalidade', 'musculo', 'ambiente'], '');
        foreach ($f as $k => $padrao) {
            $f[$k] = mb_substr(trim(is_string($_GET[$k] ?? null) ? $_GET[$k] : $padrao), 0, 160, 'UTF-8');
        }
        $f += ['pagina' => max(1, $this->get('pagina')), 'ordem' => 'az'];
        $catalogo = $repo->pesquisar($modelo ? null : $u, $f);
        $opcoes = $repo->filtros() + [
            'musculo' => $db->todos('SELECT id,nome FROM musculo ORDER BY nome', []),
        ];
        $this->view('treino_seletor', compact('r', 't', 'item', 'f', 'catalogo', 'opcoes', 'modelo'));
    }

    /**
     * Abre a consulta de propostas no papel do profissional remetente.
     *
     * Rota GET /profissional/propostas.
     */
    public function enviadas(): void
    {
        $this->propostas(true);
    }

    /**
     * Consulta a lista ou os detalhes de uma proposta no papel solicitado. Aplica os filtros de aluno e
     * pendência e retorna 404 para um ID inacessível.
     *
     * Rota GET /propostas.
     *
     * @param bool $enviadas Seleciona a perspectiva do profissional remetente.
     */
    public function propostas(bool $enviadas = false): void
    {
        $usuario = $this->usuario();
        $db = $this->repo();
        if ($enviadas && !$db->profissionalAtivo($usuario)) {
            $this->erro(403, 'Perfil profissional inativo.', '/painel');
            return;
        }
        $base = $enviadas ? '/profissional/propostas' : '/propostas';
        $repositorio = new PropostaRepository($db);
        $id = $this->get('id');
        $proposta = $id ? $repositorio->buscar($id, $usuario, $enviadas) : null;
        if ($id && !$proposta) {
            $this->erro(404, 'Proposta não encontrada.', $base);
            return;
        }
        $itens = $proposta ? $repositorio->itens($id) : [];
        $aluno = $this->get('aluno');
        $pendentes = (bool) $this->get('pendentes');
        $lista = $proposta ? [] : $repositorio->listar($usuario, $enviadas, $aluno ?: null, $pendentes);
        $this->view('propostas', compact('base', 'enviadas', 'lista', 'proposta', 'itens', 'aluno', 'pendentes'));
    }

    /**
     * Valida IDs e chave do POST e entrega ao serviço o envio para o aluno. No sucesso aponta aos
     * detalhes da proposta.
     *
     * Rota POST /profissional/propostas/enviar.
     */
    public function enviarProposta(): void
    {
        $this->post(function (int $usuario) {
            $servico = new PropostaService($this->repo());
            $id = $servico->enviar($usuario, TreinoService::id($_POST, 'aluno_id'), TreinoService::id($_POST, 'rotina_id'),
                is_string($_POST['chave'] ?? null) ? $_POST['chave'] : '');
            return '/profissional/propostas?id=' . $id;
        }, '/profissional/modelos');
    }

    /**
     * Encaminha a decisão e o ID ao serviço, que confere o papel e a propriedade antes de aceitar,
     * recusar ou cancelar.
     *
     * Rota POST /propostas/responder.
     */
    public function responderProposta(): void
    {
        $base = ($_POST['acao'] ?? '') === 'cancelar' ? '/profissional/propostas' : '/propostas';
        $this->post(function (int $usuario) use ($base) {
            $id = TreinoService::id($_POST, 'proposta_id');
            $acao = is_string($_POST['acao'] ?? null) ? $_POST['acao'] : '';
            (new PropostaService($this->repo()))->responder($usuario, $id, $acao);
            return $base . '?id=' . $id;
        }, $base);
    }

    /**
     * Lista os exercícios ativos da conta e carrega as opções de classificação para criação ou edição.
     *
     * Rota GET /treinos/personalizados.
     */
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

    /**
     * Entrega ao serviço os campos do exercício privado e retorna à edição do registro salvo.
     *
     * Rota POST /treinos/personalizados.
     */
    public function salvarPersonalizado(): void
    {
        $this->post(fn (int $u) => '/treinos/personalizados?id=' . $this->treinos()->personalizado($u, $_POST), '/treinos/personalizados');
    }

    /**
     * Valida datas e texto da busca e consulta uma página de sessões concluídas usando o cursor da URL.
     *
     * Rota GET /treinos/historico.
     */
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

    /**
     * Carrega totais, períodos, recordes e evolução da conta, com detalhamento opcional pelo ID do
     * exercício.
     *
     * Rota GET /treinos/estatisticas.
     */
    public function estatisticas(): void
    {
        $u = $this->usuario();
        $db = $this->repo();
        $exercicio = $this->get('exercicio');
        [$totais, $periodos, $execucao, $recordes, $evolucao, $recentes, $distribuicao] = $db->estatisticas($u, $exercicio);
        $this->view('treino_estatisticas', compact('totais', 'periodos', 'execucao', 'recordes', 'evolucao', 'recentes', 'distribuicao', 'exercicio'));
    }
}
