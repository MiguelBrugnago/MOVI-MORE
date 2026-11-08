<?php

declare(strict_types=1);

use App\Controllers\HomeController;
use App\Controllers\AuthController;
use App\Controllers\PainelController;
use App\Controllers\LogoutController;

return [
    'GET' => [
        '/' => [HomeController::class, 'index'],
        '/login' => [HomeController::class, 'login'],
        '/cadastro' => [HomeController::class, 'cadastro'],
        '/painel' => [PainelController::class, 'index']
    ],
    'POST' => [
        '/cadastro' => [AuthController::class, 'cadastrar'],
        '/login' => [AuthController::class, 'login'],
        '/logout' => [LogoutController::class, 'sair']
    ]
];
