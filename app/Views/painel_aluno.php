<?php

declare(strict_types=1);

$esc = static fn ($valor) => htmlspecialchars((string)$valor, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
$destinos = [
    'Treino e evolução' => [
        '/treinos/historico' => 'Histórico de treinos',
        '/treinos/estatisticas' => 'Estatísticas de treino',
        '/treinos/mapa-muscular#mapa' => 'Mapa muscular',
        '/perfil/metas' => 'Metas e conquistas',
    ],
    'Meu acompanhamento' => [
        '/perfil' => 'Perfil físico',
        '/perfil/evolucao' => 'Evolução corporal',
        '/perfil/avaliacoes' => 'Avaliações físicas',
        '/propostas' => 'Propostas de treino',
        '/vinculos' => 'Meus profissionais',
    ],
];
?>
<div class="painel-aluno">
    <h1>Olá, <?= $esc($usuarioLogado['nome']) ?>!</h1>
    <section class="treino-card painel-treino">
        <h2><?= $ativo ? 'Treino em andamento' : 'Meu treino' ?></h2>
        <p><?= $ativo ? $esc($ativo['nome']) : 'Use uma das suas rotinas ou comece um treino livre.' ?></p>
        <div class="treino-acoes">
            <?php if ($ativo): ?>
                <a class="botao-principal" href="/treinos/ver?id=<?= (int)$ativo['id'] ?>">Retomar treino</a>
                <a class="botao-secundario" href="/rotinas">Minhas rotinas</a>
            <?php else: ?>
                <a class="botao-principal" href="/rotinas">Escolher rotina</a>
                <form method="post" action="/treinos/iniciar">
                    <input type="hidden" name="csrf_token" value="<?= $esc($_SESSION['csrf_token']) ?>">
                    <button class="botao-secundario">Iniciar treino livre</button>
                </form>
            <?php endif ?>
        </div>
    </section>
    <?php if ($recente): ?>
        <section class="painel-recente">
            <div><h2>Último treino concluído</h2><p><?= $esc($recente['nome']) ?> · <?= $esc($dataRecente) ?></p></div>
            <a class="treino-link" href="/treinos/ver?id=<?= (int)$recente['id'] ?>">Ver sessão</a>
        </section>
    <?php endif ?>
    <div class="painel-grupos">
        <?php foreach ($destinos as $grupo => $links): ?>
            <nav class="painel-destinos" aria-label="<?= $esc($grupo) ?>">
                <h2><?= $esc($grupo) ?></h2>
                <?php foreach ($links as $url => $nome): ?><a href="<?= $esc($url) ?>"><?= $esc($nome) ?></a><?php endforeach ?>
            </nav>
        <?php endforeach ?>
    </div>
    <section class="painel-profissional">
        <h2>Área profissional</h2>
        <?php if ($ehProfissional): ?>
            <a href="/painel?modo=profissional">Acessar painel profissional</a>
        <?php else: ?>
            <a href="/profissional/cadastro">Cadastrar perfil profissional</a>
        <?php endif ?>
    </section>
</div>
