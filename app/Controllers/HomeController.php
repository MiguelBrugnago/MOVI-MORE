<?php

declare(strict_types=1);

namespace App\Controllers;

class HomeController
{
    public function index(): void
    {
        require __DIR__ . '/../Views/home.php';
    }

    public function login(): void
    {
        require __DIR__ . '/../Views/login.php';
    }

    public function cadastro(): void
    {
        require __DIR__ . '/../Views/cadastro.php';
    }
}
