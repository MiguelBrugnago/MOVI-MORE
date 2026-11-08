<?php

declare(strict_types=1);

use App\Controllers\HomeController;
use App\Controllers\AuthController;

return [
    'GET' => [
        '/' => [HomeController::class, 'index'],
        '/login' => [HomeController::class, 'login'],
        '/cadastro' => [HomeController::class, 'cadastro']
    ],
    'POST' => [
        '/cadastro' => [AuthController::class, 'cadastrar']
    ]
];
