<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Repositories\VinculoProfissionalRepository;
use App\Security\Auth;
use App\Security\Csrf;

class VinculoController
{
    private VinculoProfissionalRepository $repository;

    public function __construct()
    {
        $this->repository = new VinculoProfissionalRepository();
    }

    private function modoProfissional(): bool
    {
        return ($_POST['modo'] ?? $_GET['modo'] ?? '') === 'profissional';
    }

    private function verificarAcesso(): int
    {
        Auth::verificar();

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

    private function verificarCsrf(): void
    {
        if (!Csrf::validarToken($_POST['csrf_token'] ?? null)) {
            http_response_code(403);
            exit('Token de segurança inválido.');
        }
    }

    private function vinculoId(): int
    {
        $id = filter_input(INPUT_POST, 'vinculo_id', FILTER_VALIDATE_INT, ['options' => ['min_range' => 1]]);
        if ($id === false || $id === null) {
            $this->voltar('Vínculo inválido.');
        }
        return $id;
    }

    private function voltar(string $mensagem): never
    {
        $_SESSION['mensagem_vinculo'] = $mensagem;

        $modo = $this->modoProfissional()
            ? '?modo=profissional'
            : '';

        header('Location: /vinculos' . $modo, true, 303);
        exit;
    }

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

        $permissoes = [];
        foreach ($vinculos as $vinculo) $permissoes[$vinculo['id']] = $this->repository->permissoes((int)$vinculo['id']);

        $mensagem = $_SESSION['mensagem_vinculo'] ?? '';
        unset($_SESSION['mensagem_vinculo']);

        $titulo = 'MOVI+ | Meus Vínculos';
        $viewPath = __DIR__ . '/../Views/vinculos.php';

        require __DIR__ . '/../Views/layouts/app.php';
    }

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
