<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Repositories\VinculoProfissionalRepository;
use App\Security\Auth;

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
        $token = (string) ($_POST['csrf_token'] ?? '');
        $esperado = (string) ($_SESSION['csrf_token'] ?? '');

        if (
            $esperado === '' ||
            !hash_equals($esperado, $token)
        ) {
            http_response_code(403);
            exit('Token de segurança inválido.');
        }
    }

    private function voltar(string $mensagem): void
    {
        $_SESSION['mensagem_vinculo'] = $mensagem;

        $modo = $this->modoProfissional()
            ? '?modo=profissional'
            : '';

        header('Location: /vinculos' . $modo);
        exit;
    }

    public function index(): void
    {
        $usuarioId = $this->verificarAcesso();
        $modoProfissional = $this->modoProfissional();

        if (empty($_SESSION['csrf_token'])) {
            $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
        }

        $vinculos = $this->repository->listar(
            $usuarioId,
            $modoProfissional

        );

        $ehProfissional = $this->repository
            ->profissionalDoUsuario($usuarioId) !== null;

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

        $mensagem = $this->repository->solicitar(
            $usuarioId,
            (string) ($_POST['email'] ?? ''),
            $this->modoProfissional()
        );

        $this->voltar($mensagem);
    }

    public function responder(): void
    {
        $usuarioId = $this->verificarAcesso();
        $this->verificarCsrf();

        $acao = (string) ($_POST['acao'] ?? '');

        if (!in_array($acao, ['aceitar', 'recusar'], true)) {
            $this->voltar('Ação inválida.');
        }

        $mensagem = $this->repository->responder(
            (int) ($_POST['vinculo_id'] ?? 0),
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
            (int) ($_POST['vinculo_id'] ?? 0),
            $usuarioId,
            $this->modoProfissional()
        );

        $this->voltar($mensagem);
    }
}
