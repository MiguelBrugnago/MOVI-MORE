<?php

declare(strict_types=1);

namespace App\Controllers;

/**
 * Serve as páginas públicas de entrada, login e cadastro. Os templates exibem os formulários que
 * AuthController recebe via POST.
 */
class HomeController
{
    /**
     * Carrega a página inicial pública.
     *
     * Rota GET /.
     */
    public function index(): void
    {
        require __DIR__ . '/../Views/home.php';
    }

    /**
     * Apresenta o formulário de acesso à conta.
     *
     * Rota GET /login.
     */
    public function login(): void
    {
        require __DIR__ . '/../Views/login.php';
    }

    /**
     * Apresenta o formulário de criação de conta.
     *
     * Rota GET /cadastro.
     */
    public function cadastro(): void
    {
        require __DIR__ . '/../Views/cadastro.php';
    }
}
