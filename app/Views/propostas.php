<?php
// A listagem usa os participantes do vínculo. O detalhe mostra o conteúdo salvo no envio, inclusive após edições do modelo.

declare(strict_types=1);

use App\Services\RegistroTreino;

/** @var string $base Rota da lista de propostas no papel atual. */
/** @var int $aluno Filtro por aluno, zero quando ausente. */
/** @var bool $pendentes Restringe a lista às propostas que aguardam decisão. */
/** @var bool $enviadas */
/** @var array|null $proposta */
/** @var array $lista */
/** @var list<array> $itens Exercícios da versão enviada, com as séries em ordem. */
require __DIR__ . '/treinos/campos.php';
$participante = $enviadas ? 'aluno_nome' : 'profissional_nome';
$filtroAluno = $enviadas && $aluno ? ['aluno' => $aluno] : [];
?>
<section class="treino-area">
    <h1><?= $enviadas ? 'Propostas enviadas' : 'Propostas de treino recebidas' ?></h1>
    <nav class="treino-nav" aria-label="Propostas de treino">
        <a href="<?= $base ?>">Todas</a>
        <a href="<?= $base ?>?<?= $esc(http_build_query(['pendentes' => 1] + $filtroAluno)) ?>">Pendentes</a>
        <?php if ($enviadas): ?><a href="/profissional/modelos">Modelos de treino</a>
        <?php else: ?><a href="/rotinas">Minhas rotinas</a><?php endif ?>
    </nav>

    <?php if (!$proposta): ?>
        <?php if ($filtroAluno): ?><p>Histórico do aluno selecionado · <a href="<?= $base ?>?aluno=<?= (int)$aluno ?>">Ver todos os estados</a></p><?php endif ?>
        <?php if (!$lista): ?><p><?= $pendentes ? 'Nenhuma proposta pendente.' : 'Nenhuma proposta neste histórico.' ?></p><?php endif ?>
        <?php foreach ($lista as $linha): ?>
            <article class="treino-card">
                <h2><a href="<?= $base ?>?id=<?= (int)$linha['id'] ?>"><?= $esc($linha['nome']) ?></a></h2>
                <p><?= $esc($linha[$participante]) ?> · <?= $esc(ucfirst($linha['status'])) ?> · <?= $esc($linha['criada_em']) ?></p>
                <?php if ($enviadas): ?><a href="<?= $base ?>?aluno=<?= (int)$linha['aluno_id'] ?>">Histórico deste aluno</a><?php endif ?>
            </article>
        <?php endforeach ?>
    <?php else: ?>
        <h2><?= $esc($proposta['nome']) ?></h2>
        <p><?= $enviadas ? 'Aluno' : 'Profissional' ?>: <?= $esc($proposta[$participante]) ?></p>
        <p>Enviada em <?= $esc($proposta['criada_em']) ?> · <?= $esc(ucfirst($proposta['status'])) ?>
            <?= $esc($proposta['respondida_em']) ?></p>
        <p><?= $esc($dias[$proposta['dia_semana'] ?? '']) ?></p>
        <?php if ($proposta['objetivo'] !== null): ?><p>Objetivo: <?= $esc($proposta['objetivo']) ?></p><?php endif ?>
        <?php if ($proposta['descricao'] !== null): ?><p class="treino-nota"><?= $esc($proposta['descricao']) ?></p><?php endif ?>

        <?php foreach ($itens as $item): ?>
            <article class="treino-card">
                <h3><?= $esc($item['nome']) ?></h3>
                <?php if ($item['grupo'] !== null): ?><p>Superset <?= (int)$item['grupo'] ?></p><?php endif ?>
                <?php if ($item['descanso_segundos'] !== null): ?><p>Descanso: <?= (int)$item['descanso_segundos'] ?> s</p><?php endif ?>
                <?php if ($item['observacao'] !== null): ?><p class="treino-nota"><?= $esc($item['observacao']) ?></p><?php endif ?>
                <?php if (!$item['series']): ?><p>Sem séries planejadas.</p><?php endif ?>
                <?php foreach ($item['series'] as $serie): ?>
                    <p>Série <?= (int)$serie['numero'] ?> · <?= $esc(RegistroTreino::TIPOS[$serie['tipo']] ?? 'Normal') ?>
                        <?php foreach (RegistroTreino::METAS as $campo => [, $rotulo]): ?>
                            <?php if ($serie[$campo] !== null): ?> · <?= $esc($rotulo) ?>: <?= $esc($serie[$campo]) ?><?php endif ?>
                        <?php endforeach ?>
                        <?php if ($serie['rir_alvo'] !== null): ?> · RIR: <?= (int)$serie['rir_alvo'] ?><?php endif ?>
                    </p>
                <?php endforeach ?>
            </article>
        <?php endforeach ?>

        <?php if ($proposta['status'] === 'pendente'): ?>
            <form method="post" action="/propostas/responder" class="treino-acoes">
                <?php $hidden(['proposta_id' => $proposta['id']]); ?>
                <?php if ($enviadas): ?>
                    <button name="acao" value="cancelar">Cancelar envio</button>
                <?php else: ?>
                    <?php if ($proposta['vinculo_ativo']): ?><button name="acao" value="aceitar">Aceitar e adicionar às minhas rotinas</button>
                    <?php else: ?><p>Aceite indisponível. Confira se o vínculo e o profissional estão ativos.</p><?php endif ?>
                    <button name="acao" value="recusar">Recusar proposta</button>
                <?php endif ?>
            </form>
        <?php elseif (!$enviadas && $proposta['rotina_aceita_id']): ?>
            <p><a href="/rotinas?id=<?= (int)$proposta['rotina_aceita_id'] ?>">Abrir minha rotina</a></p>
        <?php endif ?>
    <?php endif ?>
</section>
