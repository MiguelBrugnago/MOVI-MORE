<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Config\Database;
use App\Repositories\NutricaoRepository;
use App\Repositories\VinculoProfissionalRepository;
use App\Security\Auth;
use App\Security\Csrf;
use App\Services\PerfilFisicoService;
use App\Services\TreinoService;
use App\Support\Validacao;
use DomainException;
use InvalidArgumentException;

final class NutricaoController
{
    public function index(): void
    {
        $usuario = (int)Auth::usuario()['id'];
        header('Cache-Control: no-store, private');
        try {
            $titular = isset($_GET['aluno']) ? TreinoService::id($_GET, 'aluno') : $usuario;
            $pessoal = $titular === $usuario;
            if (!$pessoal) {
                $vinculos = new VinculoProfissionalRepository();
                if (!$vinculos->autorizado($usuario, $titular, 'nutricao')) {
                    throw new DomainException('Acompanhamento alimentar indisponível.', 403);
                }
            }
            $hoje = PerfilFisicoService::hoje();
            $data = PerfilFisicoService::data($_GET['data'] ?? $hoje, true);
            $repo = new NutricaoRepository(Database::conectar());
            $diario = $repo->dia($titular, $data, $pessoal);
            if (!$pessoal) {
                $vinculos->registrarLeitura($usuario, $titular, 'nutricao');
            }
            $titulo = 'MOVI+ | Nutrição';
            $viewPath = __DIR__ . '/../Views/nutricao.php';
            require __DIR__ . '/../Views/layouts/app.php';
        } catch (DomainException|InvalidArgumentException $e) {
            $this->erro($e);
        }
    }

    private function erro(DomainException|InvalidArgumentException $e): void
    {
        http_response_code($e instanceof DomainException ? $e->getCode() : 422);
        $mensagem = $e->getMessage();
        $voltar = '/nutricao';
        $titulo = 'MOVI+ | Nutrição';
        $viewPath = __DIR__ . '/../Views/treino_erro.php';
        require __DIR__ . '/../Views/layouts/app.php';
    }

    public function salvar(): void
    {
        $usuario = (int)Auth::usuario()['id'];
        header('Cache-Control: no-store, private');
        if (!Csrf::validarToken($_POST['csrf_token'] ?? null) || isset($_POST['aluno']) || isset($_GET['aluno'])) {
            http_response_code(403);
            return;
        }
        try {
            $hoje = PerfilFisicoService::hoje();
            $data = PerfilFisicoService::data($_POST['data'] ?? $hoje, true);
            $acao = $_POST['acao'] ?? '';
            $dados = [];
            switch ($acao) {
                case 'editar_plano':
                    $dados['plano'] = TreinoService::id($_POST, 'plano');
                    // A edição e a criação usam as mesmas unidades e limites.
                case 'plano':
                case 'alimento':
                    $dados['nome'] = Validacao::texto($_POST['nome'] ?? null, 150, 1);
                    foreach (['calorias', 'proteinas', 'carboidratos', 'gorduras'] as $campo) {
                        $limite = $acao !== 'alimento' ? 99999 : ($campo === 'calorias' ? 1000 : 100);
                        $valor = Validacao::numero($_POST[$campo] ?? null, 0, $limite, 2);
                        if ($acao === 'alimento' && $valor === null) {
                            throw new InvalidArgumentException('Preencha os quatro valores do rótulo por 100 g.');
                        }
                        $dados['nutrientes'][] = $valor;
                    }
                    break;
                case 'preferencias':
                    foreach (['preferencias', 'restricoes'] as $campo) {
                        $dados[$campo] = Validacao::texto($_POST[$campo] ?? null, 1000);
                    }
                    break;
                case 'consumo':
                case 'porcao':
                    $dados['alimento'] = TreinoService::id($_POST, 'alimento');
                    $dados['gramas'] = Validacao::numero($_POST['gramas'] ?? null, 0, 10000, 2);
                    if (!$dados['gramas']) {
                        throw new InvalidArgumentException('Informe a quantidade em gramas, maior que zero.');
                    }
                    if ($acao === 'consumo') {
                        $dados['data'] = $data;
                        $dados['refeicao'] = Validacao::texto($_POST['refeicao'] ?? null, 120);
                        $dados['chave'] = $_POST['chave'] ?? null;
                        if (!is_string($dados['chave']) || !preg_match('/^[a-f0-9]{32}$/D', $dados['chave'])) {
                            throw new InvalidArgumentException('Reabra o diário para fazer o registro.');
                        }
                    } else {
                        $dados['plano'] = TreinoService::id($_POST, 'plano');
                        $dados['refeicao'] = TreinoService::id($_POST, 'refeicao');
                    }
                    break;
                case 'remover_refeicao':
                case 'remover_porcao':
                    $dados['plano'] = TreinoService::id($_POST, 'plano');
                    $dados['refeicao'] = TreinoService::id($_POST, 'refeicao');
                    if ($acao === 'remover_porcao') {
                        $dados['alimento'] = TreinoService::id($_POST, 'alimento');
                    }
                    break;
                case 'refeicao':
                    $dados['nome'] = Validacao::texto($_POST['nome'] ?? null, 120, 1);
                    $dados['plano'] = TreinoService::id($_POST, 'plano');
                    break;
                case 'publicar':
                    $dados['plano'] = TreinoService::id($_POST, 'plano');
                    break;
                case 'corrigir_diario':
                    $dados['id'] = TreinoService::id($_POST, 'id');
                    break;
                default:
                    throw new InvalidArgumentException('Ação inválida.');
            }
            (new NutricaoRepository(Database::conectar()))->salvar($usuario, $acao, $dados, $hoje);
            header('Location: /nutricao?data=' . ($acao === 'publicar' ? $hoje : $data), true, 303);
        } catch (DomainException|InvalidArgumentException $e) {
            $this->erro($e);
        }
    }
}
