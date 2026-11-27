<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Config\Database;
use App\Repositories\ProgressoRepository;
use App\Repositories\TreinoRepository;
use App\Security\Auth;
use App\Security\Csrf;
use App\Services\PerfilFisicoService;
use App\Support\Validacao;
use InvalidArgumentException;

final class ProgressoController
{
    private function repo(): ProgressoRepository
    {
        return new ProgressoRepository(new TreinoRepository(Database::conectar()));
    }

    public function index(): void
    {
        $usuario = (int)Auth::usuario()['id'];
        header('Cache-Control: no-store, private');
        $repo = $this->repo();
        $sessoes = $repo->sessoes($usuario);
        $metas = $repo->metas($usuario);
        $metasPeso = $repo->metasPeso($usuario);
        $hoje = PerfilFisicoService::hoje();
        $titulo = 'MOVI+ | Metas e conquistas';
        $viewPath = __DIR__ . '/../Views/metas.php';
        require __DIR__ . '/../Views/layouts/app.php';
    }

    private function data(mixed $valor): string
    {
        if (!Validacao::dataCivilValida($valor) || $valor < '1900-01-01') {
            throw new InvalidArgumentException('Informe uma data válida para a meta.');
        }
        return $valor;
    }

    public function salvar(): void
    {
        $usuario = (int)Auth::usuario()['id'];
        if (!Csrf::validarToken($_POST['csrf_token'] ?? null)) {
            http_response_code(403);
            return;
        }
        try {
            $inicio = $this->data($_POST['inicio'] ?? null);
            $fim = $this->data($_POST['fim'] ?? null);
            if ($fim < $inicio) {
                throw new InvalidArgumentException('Confira a data final da meta.');
            }
            $tipo = $_POST['tipo'] ?? 'sessoes';
            $alvo = match ($tipo) {
                'sessoes' => Validacao::numero($_POST['alvo'] ?? null, 1, 10000),
                'peso_minimo', 'peso_maximo' => Validacao::numero($_POST['alvo'] ?? null, 1, 700, 2),
                default => throw new InvalidArgumentException('Selecione um tipo de meta válido.'),
            };
            if ($alvo === null) {
                throw new InvalidArgumentException('Informe o alvo da meta.');
            }
            $this->repo()->criar($usuario, $tipo, $alvo, $inicio, $fim);
            header('Location: /perfil/metas', true, 303);
        } catch (InvalidArgumentException $e) {
            http_response_code(422);
            echo htmlspecialchars($e->getMessage(), ENT_QUOTES, 'UTF-8');
        }
    }
}
