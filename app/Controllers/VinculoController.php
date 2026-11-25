<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Repositories\VinculoProfissionalRepository;
use App\Security\Auth;
use App\Security\Csrf;

/**
 * Recebe as solicitações de acompanhamento nos papéis de aluno e profissional. Identifica o usuário
 * pela sessão e delega a propriedade e as mudanças de estado ao repositório.
 */
class VinculoController
{
    private VinculoProfissionalRepository $repository;

    /**
     * Prepara o repositório usado nas consultas e mudanças de vínculo.
     */
    public function __construct()
    {
        $this->repository = new VinculoProfissionalRepository();
    }

    /**
     * Identifica o modo pelo formulário ou pela URL e o acesso ao papel é conferido separadamente.
     *
     * @return bool
     */
    private function modoProfissional(): bool
    {
        return ($_POST['modo'] ?? $_GET['modo'] ?? '') === 'profissional';
    }

    /**
     * Confere a sessão e o cadastro para o modo profissional. Redireciona ao modo pessoal quando o
     * perfil está indisponível.
     *
     * @return int
     */
    private function verificarAcesso(): int
    {
        Auth::usuario();

        $usuarioId = (int) $_SESSION['usuario_id'];

        if (
            $this->modoProfissional() &&
            $this->repository->profissionalDoUsuario($usuarioId) === null
        ) {
            header('Location: /vinculos');
            exit;
        }

        return $usuarioId;
    }

    /**
     * Confere o token do POST e encerra a requisição com HTTP 403 se for inválido.
     */
    private function verificarCsrf(): void
    {
        if (!Csrf::validarToken($_POST['csrf_token'] ?? null)) {
            http_response_code(403);
            exit('Token de segurança inválido.');
        }
    }

    /**
     * Lê um ID positivo do POST ou retorna à lista com mensagem de vínculo inválido.
     *
     * @return int
     */
    private function vinculoId(): int
    {
        $id = filter_input(INPUT_POST, 'vinculo_id', FILTER_VALIDATE_INT, ['options' => ['min_range' => 1]]);
        if ($id === false || $id === null) {
            $this->voltar('Vínculo inválido.');
        }
        return $id;
    }

    /**
     * Guarda a mensagem na sessão e redireciona com 303 à lista no modo atual.
     *
     * @param string $mensagem Texto de retorno a apresentar ao usuário.
     * @return never
     */
    private function voltar(string $mensagem): never
    {
        $_SESSION['mensagem_vinculo'] = $mensagem;

        $modo = $this->modoProfissional()
            ? '?modo=profissional'
            : '';

        header('Location: /vinculos' . $modo, true, 303);
        exit;
    }

    /**
     * Carrega os vínculos do usuário, suas permissões por categoria e a mensagem da última operação para
     * a página.
     *
     * Rota GET /vinculos.
     */
    public function index(): void
    {
        $usuarioId = $this->verificarAcesso();
        $modoProfissional = $this->modoProfissional();

        Csrf::gerarToken();

        $vinculos = $this->repository->listar(
            $usuarioId,
            $modoProfissional
        );

        $ehProfissional = $this->repository
            ->profissionalDoUsuario($usuarioId) !== null;

        // As permissões são agrupadas por vínculo, pois o mesmo aluno pode conceder categorias diferentes a cada profissional.
        $permissoes = $modoProfissional ? [] : $this->repository->permissoesDoAluno($usuarioId);

        $mensagem = $_SESSION['mensagem_vinculo'] ?? '';
        unset($_SESSION['mensagem_vinculo']);

        $titulo = 'MOVI+ | Meus Vínculos';
        $viewPath = __DIR__ . '/../Views/vinculos.php';

        require __DIR__ . '/../Views/layouts/app.php';
    }

    /**
     * Valida o e-mail do outro participante e encaminha o pedido ao repositório após conferir sessão e
     * CSRF.
     *
     * Rota POST /vinculos/solicitar.
     */
    public function solicitar(): void
    {
        $usuarioId = $this->verificarAcesso();
        $this->verificarCsrf();

        $email = $_POST['email'] ?? null;
        if (!is_string($email) || strlen($email) > 150 || !filter_var(trim($email), FILTER_VALIDATE_EMAIL)) {
            $this->voltar('Informe um e-mail válido.');
        }
        $mensagem = $this->repository->solicitar(
            $usuarioId,
            trim($email),
            $this->modoProfissional()
        );

        $this->voltar($mensagem);
    }

    /**
     * Aceita apenas as decisões de aceitar ou recusar enviadas pelo formulário do participante.
     *
     * Rota POST /vinculos/responder.
     */
    public function responder(): void
    {
        $usuarioId = $this->verificarAcesso();
        $this->verificarCsrf();

        $acao = $_POST['acao'] ?? null;

        if (!in_array($acao, ['aceitar', 'recusar'], true)) {
            $this->voltar('Ação inválida.');
        }

        $mensagem = $this->repository->responder(
            $this->vinculoId(),
            $usuarioId,
            $this->modoProfissional(),
            $acao === 'aceitar'
        );

        $this->voltar($mensagem);
    }

    /**
     * Encaminha o ID do vínculo ao repositório e exibe o resultado do encerramento na lista.
     *
     * Rota POST /vinculos/encerrar.
     */
    public function encerrar(): void
    {
        $usuarioId = $this->verificarAcesso();
        $this->verificarCsrf();

        $mensagem = $this->repository->encerrar(
            $this->vinculoId(),
            $usuarioId,
            $this->modoProfissional()
        );

        $this->voltar($mensagem);
    }
}
