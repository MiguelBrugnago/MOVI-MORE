<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Repositories\ExercicioRepository;
use App\Config\Database;
use App\Security\Auth;

/**
 * Apresenta o catálogo à conta autenticada. Passa os filtros ao ExercicioRepository e carrega
 * músculos e mídias somente após localizar um exercício acessível.
 */
final class ExercicioController
{
    /**
     * Lê filtros e página da URL, limita o texto pesquisado e entrega a lista paginada ao layout.
     *
     * Rota GET /exercicios.
     */
    public function index(): void
    {
        Auth::usuario();
        header('Cache-Control: no-store, private');
        $filtros = [];
        foreach (['q', 'grupo', 'equipamento', 'modalidade', 'ordem'] as $k) {
            $filtros[$k] = is_string($_GET[$k] ?? null) ? mb_substr(trim($_GET[$k]), 0, 150) : '';
        }
        $filtros['pagina'] = max(1, (int) (filter_input(INPUT_GET, 'pagina', FILTER_VALIDATE_INT) ?: 1));
        $repo = new ExercicioRepository();
        $resultado = $repo->pesquisar((int) $_SESSION['usuario_id'], $filtros);
        $opcoes = $repo->filtros();
        $titulo = 'MOVI+ | Biblioteca';
        $viewPath = __DIR__ . '/../Views/exercicios.php';
        require __DIR__ . '/../Views/layouts/app.php';
    }

    /**
     * Lê o ID da URL e exige acesso ao exercício antes de consultar detalhes e rotinas disponíveis.
     * Retorna 404 quando indisponível.
     *
     * Rota GET /exercicios/ver.
     */
    public function visualizar(): void
    {
        Auth::usuario();
        header('Cache-Control: no-store, private');
        $repo = new ExercicioRepository();
        $exercicio = $repo->buscarPorId((int) (filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT) ?: 0), (int) $_SESSION['usuario_id']);
        if (!$exercicio) {
            http_response_code(404);
            echo 'Exercício não encontrado.';
            return;
        }
        $midias = $repo->midias((int) $exercicio['id']);
        $musculos = $repo->musculos((int) $exercicio['id']);
        $s = Database::conectar()->prepare('SELECT id,nome FROM rotina WHERE usuario_id=? AND ativa=1 ORDER BY nome');
        $s->execute([$_SESSION['usuario_id']]);
        $rotinas = $s->fetchAll();
        $titulo = 'MOVI+ | ' . $exercicio['nome'];
        $viewPath = __DIR__ . '/../Views/exercicio_detalhes.php';
        require __DIR__ . '/../Views/layouts/app.php';
    }
}
