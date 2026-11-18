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
        '/treinos/analise' => [\App\Controllers\AnaliseTreinoController::class, 'index'],
        '/treinos/mapa-muscular' => [\App\Controllers\AnaliseTreinoController::class, 'index'],
        '/treinos/progressao' => [\App\Controllers\AnaliseTreinoController::class, 'index'],
        '/perfil' => [\App\Controllers\PerfilController::class, 'index'],
        '/perfil/avaliacoes' => [\App\Controllers\PerfilController::class, 'historico'],
        '/perfil/avaliacoes/nova' => [\App\Controllers\PerfilController::class, 'formulario'],
        '/perfil/avaliacoes/ver' => [\App\Controllers\PerfilController::class, 'formulario'],
        '/perfil/evolucao' => [\App\Controllers\PerfilController::class, 'evolucao'],
        '/' => [HomeController::class, 'index'],
        '/login' => [HomeController::class, 'login'],
        '/cadastro' => [HomeController::class, 'cadastro'],
        '/painel' => [PainelController::class, 'index'],
        '/profissional/cadastro' => [ProfissionalController::class, 'cadastro'],
        '/vinculos' => [\App\Controllers\VinculoController::class, 'index'],
        '/alunos' => [AlunoController::class, 'index'],
        '/alunos/visualizar' => [AlunoController::class, 'visualizar'],
        '/exercicios' => [ExercicioController::class, 'index'],
        '/exercicios/ver' => [ExercicioController::class, 'visualizar'],
        '/rotinas' => [\App\Controllers\RotinaController::class, 'index'],
        '/treinos' => [\App\Controllers\RotinaController::class, 'index'],
        '/treinos/personalizados' => [\App\Controllers\RotinaController::class, 'personalizados'],
        '/treinos/exercicios' => [\App\Controllers\RotinaController::class, 'seletor'],
        '/treinos/historico' => [\App\Controllers\RotinaController::class, 'historico'],
        '/treinos/estatisticas' => [\App\Controllers\RotinaController::class, 'estatisticas'],
        '/treinos/ver' => [\App\Controllers\RotinaController::class, 'treino'],
    ],
    'POST' => [
        '/perfil' => [\App\Controllers\PerfilController::class, 'salvar'],
        '/perfil/avaliacoes' => [\App\Controllers\PerfilController::class, 'salvar'],
        '/rotinas' => [\App\Controllers\RotinaController::class, 'criar'],
        '/rotinas/salvar' => [\App\Controllers\RotinaController::class, 'salvar'],
        '/treinos/personalizados' => [\App\Controllers\RotinaController::class, 'salvarPersonalizado'],
        '/treinos/salvar' => [\App\Controllers\RotinaController::class, 'sessao'],
        '/rotinas/adicionar' => [\App\Controllers\RotinaController::class, 'adicionar'],
        '/treinos/iniciar' => [\App\Controllers\RotinaController::class, 'iniciar'],
        '/treinos/serie' => [\App\Controllers\RotinaController::class, 'serie'],
        '/treinos/finalizar' => [\App\Controllers\RotinaController::class, 'finalizar'],
        '/cadastro' => [AuthController::class, 'cadastrar'],
        '/login' => [AuthController::class, 'login'],
        '/logout' => [LogoutController::class, 'sair'],
        '/profissional/cadastro' => [ProfissionalController::class, 'cadastro'],
        '/vinculos/solicitar' => [\App\Controllers\VinculoController::class, 'solicitar'],
        '/vinculos/responder' => [\App\Controllers\VinculoController::class, 'responder'],
        '/vinculos/encerrar' => [\App\Controllers\VinculoController::class, 'encerrar'],
    ]
];

