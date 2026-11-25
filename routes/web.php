<?php
// O ponto de entrada usa o par método HTTP e caminho para escolher o controller. Rotas de consulta e de gravação possuem entradas independentes.

declare(strict_types=1);

use App\Controllers\HomeController;
use App\Controllers\AuthController;
use App\Controllers\PainelController;
use App\Controllers\LogoutController;
use App\Controllers\ProfissionalController;
use App\Controllers\AlunoController;
use App\Controllers\ExercicioController;
use App\Controllers\RotinaController;

return [
    'GET' => [
        '/nutricao' => [\App\Controllers\NutricaoController::class, 'index'],
        '/perfil/metas' => [\App\Controllers\ProgressoController::class, 'index'],
        '/profissional/modelos' => [RotinaController::class, 'modelos'],
        '/profissional/propostas' => [RotinaController::class, 'enviadas'],
        '/propostas' => [RotinaController::class, 'propostas'],
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
        '/profissional/perfil' => [ProfissionalController::class, 'perfil'],
        '/vinculos' => [\App\Controllers\VinculoController::class, 'index'],
        '/alunos' => [AlunoController::class, 'index'],
        '/alunos/visualizar' => [AlunoController::class, 'visualizar'],
        '/exercicios' => [ExercicioController::class, 'index'],
        '/exercicios/ver' => [ExercicioController::class, 'visualizar'],
        '/rotinas' => [RotinaController::class, 'index'],
        '/treinos' => [RotinaController::class, 'index'],
        '/treinos/personalizados' => [RotinaController::class, 'personalizados'],
        '/treinos/exercicios' => [RotinaController::class, 'seletor'],
        '/treinos/historico' => [RotinaController::class, 'historico'],
        '/treinos/estatisticas' => [RotinaController::class, 'estatisticas'],
        '/treinos/ver' => [RotinaController::class, 'treino'],
    ],
    'POST' => [
        '/exercicios/favorito' => [ExercicioController::class, 'salvarFavorito'],
        '/nutricao' => [\App\Controllers\NutricaoController::class, 'salvar'],
        '/perfil/metas' => [\App\Controllers\ProgressoController::class, 'salvar'],
        '/profissional/modelos/salvar' => [RotinaController::class, 'salvarModelo'],
        '/profissional/propostas/enviar' => [RotinaController::class, 'enviarProposta'],
        '/propostas/responder' => [RotinaController::class, 'responderProposta'],
        '/perfil' => [\App\Controllers\PerfilController::class, 'salvar'],
        '/perfil/avaliacoes' => [\App\Controllers\PerfilController::class, 'salvar'],
        '/rotinas' => [RotinaController::class, 'criar'],
        '/rotinas/salvar' => [RotinaController::class, 'salvar'],
        '/treinos/personalizados' => [RotinaController::class, 'salvarPersonalizado'],
        '/treinos/salvar' => [RotinaController::class, 'sessao'],
        '/rotinas/adicionar' => [RotinaController::class, 'adicionar'],
        '/treinos/iniciar' => [RotinaController::class, 'iniciar'],
        '/treinos/serie' => [RotinaController::class, 'serie'],
        '/treinos/finalizar' => [RotinaController::class, 'finalizar'],
        '/cadastro' => [AuthController::class, 'cadastrar'],
        '/login' => [AuthController::class, 'login'],
        '/logout' => [LogoutController::class, 'sair'],
        '/profissional/cadastro' => [ProfissionalController::class, 'cadastro'],
        '/profissional/perfil' => [ProfissionalController::class, 'perfil'],
        '/vinculos/solicitar' => [\App\Controllers\VinculoController::class, 'solicitar'],
        '/vinculos/responder' => [\App\Controllers\VinculoController::class, 'responder'],
        '/vinculos/encerrar' => [\App\Controllers\VinculoController::class, 'encerrar'],
    ]
];
