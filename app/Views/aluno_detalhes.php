<?php
// O controller prepara cada categoria após conferir o consentimento. A apresentação mantém os blocos de treino, perfil e saúde independentes.

declare(strict_types=1);

/** @var array $aluno */
/**
 * @var bool $treinosPermitidos
 * @var list<array> $treinos Sessões liberadas pelo consentimento de treinos.
 * @var bool $maisTreinos
 * @var bool $fisicoPermitido
 * @var array|null $recente
 * @var bool $saudePermitida
 * @var string|null $observacaoPessoal
 * @var array $observacoesSaude
 * @var array $declaracoes
 */
?>

<h1>Acompanhamento do aluno</h1>

<a href="/alunos">
    Voltar para meus alunos
</a>

<hr>

<h2>
    <?= htmlspecialchars(
        (string) $aluno['aluno_nome'],
        ENT_QUOTES,
        'UTF-8'
    ) ?>
</h2>

<p>
    <strong>E-mail:</strong>
    <?= htmlspecialchars(
        (string) $aluno['aluno_email'],
        ENT_QUOTES,
        'UTF-8'
    ) ?>
</p>

<p>
    <strong>Status:</strong>
    Acompanhamento ativo
</p>

<p>
    <strong>Início:</strong>
    <?= htmlspecialchars(
        (string) ($aluno['iniciado_em'] ?? '-'),
        ENT_QUOTES,
        'UTF-8'
    ) ?>
</p>

<hr>

<p><a href="/profissional/propostas?aluno=<?= (int)$aluno['aluno_id'] ?>">Histórico de propostas deste aluno</a></p>

<h3>Treinos do aluno</h3>
<?php $somenteLeitura = true;
require __DIR__ . '/fisico_comum.php'; ?>
<?php if (!$treinosPermitidos): ?><p>O aluno ainda não autorizou o acesso aos treinos.</p><?php else: ?>
<p><a href="/treinos/analise?aluno=<?= (int)$aluno['aluno_id'] ?>">Mapa muscular, análises e progressão do aluno</a></p>
<p><?= (int)($estatisticas[0]['total'] ?? 0) ?> treinos concluídos · <?= (int)($estatisticas[2]['series'] ?? 0) ?> séries concluídas.</p>
<?php if (!$treinos): ?><p>Nenhum treino concluído.</p><?php endif; ?>
<?php foreach ($treinos as $t): ?><article><h4><?= $esc($t['nome']) ?></h4><p><?= $esc($t['finalizado_em']) ?> · <?= $numero(isset($t['duracao']) ? $t['duracao'] / 60 : null) ?> minutos</p>
<?php foreach ($t['exercicios'] as $x): ?><p><?= $esc($x['nome']) ?> · <?= (int)$x['series'] ?> séries · volume <?= $numero($x['volume']) ?> kg</p><?php endforeach; ?></article><?php endforeach; ?>
<?php if ($maisTreinos): ?><a href="?id=<?= (int)$aluno['aluno_id'] ?>&amp;periodo=<?= $esc($periodo) ?>&amp;antes=<?= (int)end($treinos)['id'] ?>">Treinos anteriores</a><?php endif; ?>
<?php endif; ?>

<h3>Evolução física</h3>
<?php if (!$fisicoPermitido): ?><p>O aluno ainda não autorizou o acesso ao perfil físico e às avaliações.</p><?php else: ?>
<article><h4>Perfil e avaliação mais recente</h4><dl>
<?php foreach (['objetivo' => 'Objetivo', 'experiencia' => 'Experiência', 'frequencia_semanal' => 'Dias por semana', 'tempo_treinamento_meses' => 'Meses de treinamento', 'disponibilidade' => 'Disponibilidade', 'ambiente_preferido' => 'Ambiente preferido', 'altura_cm' => 'Altura (cm)'] as $chave => $rotulo): ?><dt><?= $rotulo ?></dt><dd><?= $esc($perfil[$chave] ?? 'Não informado') ?></dd><?php endforeach; ?>
</dl><?php if ($recente): ?><p>Avaliação de <?= $esc($recente['avaliado_em']) ?></p><dl><?php foreach ($metricas as $chave => [$nome,$unidade]): ?><dt><?= $esc($nome) ?> (<?= $unidade ?>)</dt><dd><?= $numero($recente['medidas'][$chave] ?? null) ?></dd><?php endforeach; ?></dl><?php else: ?><p>Nenhuma avaliação registrada.</p><?php endif; ?></article>
<?php $idAlunoAcompanhado = (int)$aluno['aluno_id'];
require __DIR__ . '/fisico_evolucao.php';
    require __DIR__ . '/fisico_historico.php'; ?>
<?php endif; ?>
<?php if ($saudePermitida): ?><article><h3>Informações de saúde autorizadas</h3>
<p class="treino-nota"><?= $esc($observacaoPessoal) ?></p>
<?php foreach ($observacoesSaude as $nota): ?><p class="treino-nota"><?= $esc($nota['data']) ?>: <?= $esc($nota['texto']) ?></p><?php endforeach; ?>
<?php foreach ($declaracoes as $grupo): foreach ($grupo as $d): ?><p><?= $esc($d['nome']) ?> <?= $esc($d['observacao'] ?? '') ?></p><?php endforeach; endforeach; ?>
<?php if (empty($declaracoes['condicoes']) && empty($declaracoes['restricoes'])): ?><p>Nenhuma condição ou restrição informada.</p><?php endif; ?></article><?php endif; ?>

<?php if ($nutricaoPermitida): ?>
    <h3>Alimentação</h3>
    <p><a href="/nutricao?aluno=<?= (int)$alunoId ?>">Consultar alimentação do aluno</a></p>
<?php endif; ?>
