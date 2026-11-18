<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Config\Database;
use App\Repositories\{TreinoRepository, AnaliseTreinoRepository, VinculoProfissionalRepository};
use App\Security\Auth;
use App\Services\{AnaliseTreinoService as Analise, RegistroTreino};

final class AnaliseTreinoController
{
    public function index(): void
    {
        $usuario = Auth::usuario();
        header('Cache-Control: no-store, private');
        try {
            $aluno = isset($_GET['aluno']) ? RegistroTreino::numero($_GET['aluno'], 1, 2147483647) : null;
            if (isset($_GET['aluno']) && $aluno === null) throw new \InvalidArgumentException('Aluno inválido.');
            $u = $aluno ?? (int)$usuario['id'];
            $profissional = $u !== (int)$usuario['id'];
            if ($profissional) {
                $vinculos = new VinculoProfissionalRepository();
                if (!$vinculos->autorizado((int)$usuario['id'], $u, 'treinos')) throw new \DomainException('Acesso aos treinos não autorizado.', 403);
                $vinculos->registrarLeitura((int)$usuario['id'], $u, 'analise_muscular');
            }
            $p = Analise::periodo($_GET);
            $exercicio = RegistroTreino::numero($_GET['exercicio'] ?? null, 1, 2147483647);
            $metrica = $_GET['metrica'] ?? 'equivalentes';
            if (!in_array($metrica, ['equivalentes', 'series', 'diretas', 'indiretas'], true)) throw new \InvalidArgumentException('Métrica inválida.');
            $repo = new AnaliseTreinoRepository(new TreinoRepository(Database::conectar()));
            $catalogo = $repo->catalogo();
            $relacoes = $repo->relacoes($u, $p['anterior_inicio'], $p['fim']);
            $execucoes = $repo->execucoes($u, $p['inicio'], $p['fim']);
            $dados = Analise::calcular($catalogo, $relacoes, $repo->sessoes($u, $p['inicio'], $p['fim']), $execucoes, $p['dias']);
            $anterior = Analise::calcular(
                $catalogo,
                $relacoes,
                $repo->sessoes($u, $p['anterior_inicio'], $p['anterior_fim']),
                $repo->execucoes($u, $p['anterior_inicio'], $p['anterior_fim']),
                $p['dias']
            );
            $opcoes = [];
            foreach ($execucoes as $x) $opcoes[$x['exercicio_id']] = $x['nome'];
            $series = $exercicio ? $repo->seriesExercicio($u, $exercicio, $p['inicio'], $p['fim']) : [];
            $maisSeries = count($series) > 500;
            if ($maisSeries) array_pop($series);
            $melhores = $exercicio ? $repo->melhoresPorRepeticoes($u, $exercicio, $p['inicio'], $p['fim']) : [];
            $recordes = [];
            $progressao = [];
            $maximos = $exercicio ? array_column($repo->recordeAnterior($u, $exercicio, $p['inicio']), 'carga', 'lado') : [];
            foreach ($execucoes as $x) {
                if ((int)$x['exercicio_id'] !== $exercicio) continue;
                $progressao[] = $x;
                if ($x['carga'] !== null && (!isset($maximos[$x['lado']]) || $x['carga'] > $maximos[$x['lado']])) {
                    $recordes[] = $x;
                    $maximos[$x['lado']] = $x['carga'];
                }
            }
            $titulo = 'MOVI+ | Análise de treinamento';
            $viewPath = __DIR__ . '/../Views/treino_analise.php';
            require __DIR__ . '/../Views/layouts/app.php';
        } catch (\InvalidArgumentException | \DomainException $e) {
            http_response_code($e instanceof \DomainException ? $e->getCode() : 422);
            $mensagem = $e->getMessage();
            $voltar = '/rotinas';
            $viewPath = __DIR__ . '/../Views/treino_erro.php';
            require __DIR__ . '/../Views/layouts/app.php';
        } catch (\PDOException $e) {
            error_log('Análise de treino: ' . $e->getCode());
            http_response_code(503);
            $mensagem = 'Análise indisponível no momento. Verifique com o responsável se o banco está atualizado.';
            $voltar = '/rotinas';
            $viewPath = __DIR__ . '/../Views/treino_erro.php';
            require __DIR__ . '/../Views/layouts/app.php';
        }
    }
}
