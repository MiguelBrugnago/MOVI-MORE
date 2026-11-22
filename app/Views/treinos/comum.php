<?php // Os templates compartilham campos, navegação e o script de treino. O editor de modelos mostra as rotas do profissional.
require __DIR__ . '/campos.php'; ?>
<nav class="treino-nav" aria-label="Área de treino">
    <?php if (!empty($modelo)): ?>
        <a href="/painel?modo=profissional">Painel profissional</a>
        <a href="/profissional/modelos">Modelos de treino</a>
        <a href="/profissional/propostas">Propostas enviadas</a>
    <?php else: ?>
    <a href="/treinos/analise">Análise e mapa muscular</a>
    <a href="/rotinas">Rotinas</a><a href="/treinos/historico">Histórico</a><a
        href="/treinos/estatisticas">Evolução</a><a href="/treinos/personalizados">Exercícios personalizados</a>
    <?php endif ?>
</nav>
<script src="/assets/js/treinos.js" defer></script>
