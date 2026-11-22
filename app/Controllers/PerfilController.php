<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Config\Database;
use App\Repositories\PerfilFisicoRepository;
use App\Repositories\VinculoProfissionalRepository;
use App\Security\Auth;
use App\Security\Csrf;
use App\Services\PerfilFisicoService as Fisico;
use App\Services\RegistroTreino;
use DomainException;
use InvalidArgumentException;

/**
 * Coordena perfil físico, avaliações, declarações e consentimentos. Identifica a conta pela sessão,
 * normaliza as entradas com PerfilFisicoService e entrega dados ao layout.
 */
final class PerfilController
{
    /**
     * Confirma a sessão, desabilita cache compartilhado da resposta e devolve o ID da conta ativa.
     *
     * @return int
     */
    private function usuario(): int
    {
        $usuario = Auth::usuario();
        header('Cache-Control: no-store, private');
        return (int)$usuario['id'];
    }

    /**
     * Prepara o acesso a perfis e avaliações com a conexão da aplicação.
     *
     * @return PerfilFisicoRepository
     */
    private function repo(): PerfilFisicoRepository
    {
        return new PerfilFisicoRepository(Database::conectar());
    }

    /**
     * Disponibiliza os dados ao template, consome a mensagem de sessão e carrega o layout.
     *
     * @param string $nome Nome do arquivo de view escolhido pelo controller, sem a extensão PHP.
     * @param array $dados Campos associados aos seus nomes.
     */
    private function view(string $nome, array $dados = []): void
    {
        extract($dados, EXTR_SKIP);
        $titulo = 'MOVI+ | Perfil físico';
        $mensagem = $mensagem ?? $_SESSION['mensagem_perfil'] ?? '';
        unset($_SESSION['mensagem_perfil']);
        $viewPath = __DIR__ . '/../Views/' . $nome . '.php';
        require __DIR__ . '/../Views/layouts/app.php';
    }

    /**
     * Extrai um ID positivo dos parâmetros da requisição e rejeita um identificador ausente.
     *
     * @param array $dados Campos associados aos seus nomes.
     * @return int
     * @throws InvalidArgumentException Identificador obrigatório.
     */
    private function id(array $dados): int
    {
        return RegistroTreino::numero($dados['id'] ?? null, 1, 2147483647) ?? throw new InvalidArgumentException('Identificador obrigatório.');
    }

    /**
     * Carrega o perfil, as declarações e a avaliação mais recente da conta.
     *
     * Rota GET /perfil.
     */
    public function index(): void
    {
        $u = $this->usuario();
        $r = $this->repo();
        $this->view('perfil', ['perfil' => $r->perfil($u), 'declaracoes' => $r->declaracoes($u), 'recente' => $r->historico($u)[0] ?? null]);
    }

    /**
     * Entrega ao template as avaliações da conta em ordem cronológica decrescente.
     *
     * Rota GET /perfil/avaliacoes.
     */
    public function historico(): void
    {
        $u = $this->usuario();
        $this->view('avaliacoes', ['avaliacoes' => $this->repo()->historico($u)]);
    }

    /**
     * Preenche a data atual ao abrir uma nova avaliação ou consulta a avaliação da conta indicada na
     * URL.
     *
     * Rotas GET /perfil/avaliacoes/nova, GET /perfil/avaliacoes/ver.
     */
    public function formulario(): void
    {
        $u = $this->usuario();
        try {
            $avaliacao = isset($_GET['id']) ? $this->repo()->avaliacao($u, $this->id($_GET)) : ['avaliado_em' => Fisico::hoje(), 'medidas' => []];
            $this->view('avaliacao_form', compact('avaliacao'));
        } catch (DomainException|InvalidArgumentException $e) {
            $this->erro($e);
        }
    }

    /**
     * Valida o período escolhido, consulta as avaliações da conta na janela e renderiza a evolução.
     *
     * Rota GET /perfil/evolucao.
     */
    public function evolucao(): void
    {
        $u = $this->usuario();
        try {
            $periodo = $_GET['periodo'] ?? 'todos';
            $avaliacoes = $this->repo()->historico($u, Fisico::inicioPeriodo($periodo));
            $this->view('evolucao', compact('avaliacoes', 'periodo'));
        } catch (InvalidArgumentException $e) {
            $this->erro($e);
        }
    }

    /**
     * Converte a exceção de domínio em seu status HTTP e a entrada inválida em 422, com uma mensagem na
     * tela.
     *
     * @param DomainException|InvalidArgumentException $e Falha de domínio ou de validação a apresentar na resposta HTTP.
     */
    private function erro(\Exception $e): void
    {
        http_response_code($e instanceof DomainException ? $e->getCode() : 422);
        $this->view('perfil_erro', ['mensagem' => $e->getMessage()]);
    }

    /**
     * Confere CSRF e despacha a ação do formulário para perfil, avaliação, declaração ou consentimento.
     * No sucesso redireciona com 303 e em erro de validação reapresenta os campos.
     *
     * Rotas POST /perfil, POST /perfil/avaliacoes.
     */
    public function salvar(): void
    {
        $u = $this->usuario();
        if (!Csrf::validarToken($_POST['csrf_token'] ?? null)) {
            http_response_code(403);
            $this->view('perfil_erro', ['mensagem' => 'Token de segurança inválido. Reabra a página.']);
            return;
        }
        $acao = $_POST['acao'] ?? '';
        try {
            $r = $this->repo();
            $url = '/perfil';
            switch ($acao) {
                case 'perfil': $r->salvarPerfil($u, Fisico::perfil($_POST));
                    break;
                case 'avaliacao':
                    $id = RegistroTreino::numero($_POST['id'] ?? null, 1, 2147483647);
                    $id = $r->salvarAvaliacao($u, $id, Fisico::avaliacao($_POST));
                    $url = '/perfil/avaliacoes/ver?id=' . $id;
                    break;
                case 'excluir':
                    if (($_POST['confirmar'] ?? '') !== 'sim') {
                        throw new InvalidArgumentException('Confirme a exclusão.');
                    }
                    $r->excluir($u, $this->id($_POST));
                    $url = '/perfil/avaliacoes';
                    break;
                case 'declarar':
                case 'remover_declaracao':
                    $tipo = $_POST['tipo'] ?? '';
                    if (!in_array($tipo, ['condicao', 'restricao'], true)) {
                        throw new InvalidArgumentException('Tipo inválido.');
                    }
                    if ($acao === 'remover_declaracao') {
                        $r->removerDeclaracao($u, $tipo, $this->id($_POST));
                    } else {
                        $r->declarar($u, $tipo, RegistroTreino::texto($_POST['nome'] ?? null, 120, 1), RegistroTreino::texto($_POST['observacao'] ?? null, 4000));
                    }
                    break;
                case 'permissao':
                    $categoria = $_POST['categoria'] ?? '';
                    if (!is_string($categoria) || !in_array($_POST['permitir'] ?? null, ['0', '1'], true)) {
                        throw new InvalidArgumentException('Permissão inválida.');
                    }
                    (new VinculoProfissionalRepository())->permitir($u, $this->id($_POST), $categoria, $_POST['permitir'] === '1');
                    $url = '/vinculos';
                    break;
                default: throw new InvalidArgumentException('Ação inválida.');
            }
            $_SESSION['mensagem_perfil'] = 'Alterações salvas com sucesso.';
            if ($acao === 'permissao') {
                $_SESSION['mensagem_vinculo'] = 'Permissão atualizada.';
            }
            header('Location: ' . $url, true, 303);
        } catch (InvalidArgumentException $e) {
            http_response_code(422);
            // Reapresenta os textos em UTF-8, inclusive o valor que o usuário precisa corrigir.
            // Na resposta 422, os valores válidos para HTML voltam ao formulário para o usuário corrigir o campo indicado.
            $entrada = array_filter($_POST, static fn ($v) => is_string($v) && mb_check_encoding($v, 'UTF-8'));
            if ($acao === 'perfil') {
                $this->view('perfil', ['perfil' => $entrada, 'erro' => $e->getMessage(), 'declaracoes' => $this->repo()->declaracoes($u), 'recente' => $this->repo()->historico($u)[0] ?? null]);
            } elseif ($acao === 'avaliacao') {
                $this->view('avaliacao_form', ['avaliacao' => $entrada + ['medidas' => $entrada], 'erro' => $e->getMessage()]);
            } else {
                $this->erro($e);
            }
        } catch (DomainException $e) {
            $this->erro($e);
        } catch (\PDOException $e) {
            http_response_code(500);
            $this->view('perfil_erro', ['mensagem' => 'Não foi possível salvar. Seus dados anteriores foram preservados. Tente novamente.']);
        }
    }
}
