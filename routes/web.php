<?php

declare(strict_types=1);

use App\Controllers\HomeController;
use App\Controllers\AuthController;
use App\Controllers\PainelController;
use App\Controllers\LogoutController;
use App\Controllers\ProfissionalController;
use App\Controllers\AlunoController;
use App\Controllers\ExercicioController;

return [
    'GET' => [
        '/' => [HomeController::class, 'index'],
        '/login' => [HomeController::class, 'login'],
        '/cadastro' => [HomeController::class, 'cadastro'],
        '/painel' => [PainelController::class, 'index'],
        '/profissional/cadastro' => [ProfissionalController::class, 'cadastro'],
        '/vinculos' => [\App\Controllers\VinculoController::class, 'index'],
        '/alunos' => [AlunoController::class, 'index'],
        '/alunos/visualizar' => [AlunoController::class, 'visualizar'],
        '/exercicios' => [ExercicioController::class, 'index'],
    ],
    'POST' => [
        '/cadastro' => [AuthController::class, 'cadastrar'],
        '/login' => [AuthController::class, 'login'],
        '/logout' => [LogoutController::class, 'sair'],
        '/profissional/cadastro' => [ProfissionalController::class, 'cadastro'],
        '/vinculos/solicitar' => [\App\Controllers\VinculoController::class, 'solicitar'],
        '/vinculos/responder' => [\App\Controllers\VinculoController::class, 'responder'],
        '/vinculos/encerrar' => [\App\Controllers\VinculoController::class, 'encerrar'],
    ]
];
