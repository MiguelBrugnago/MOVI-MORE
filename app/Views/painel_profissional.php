<?php
// O controller verifica o perfil ativo antes de carregar esta navegação para alunos, modelos e propostas.

declare(strict_types=1);

/** @var array{id: int, nome: string, email: string, ativo: int} $usuarioLogado */
?>

<h1>
    Bem-vindo ao MOVI+,
    <?= htmlspecialchars($usuarioLogado['nome'], ENT_QUOTES, 'UTF-8') ?>!
</h1>

<h2>Painel Profissional</h2>

<nav>
    <ul>
        <li><a href="/alunos">Meus alunos</a></li>
        <li><a href="/vinculos?modo=profissional">Solicitações de vínculo</a></li>
        <li><a href="/profissional/modelos">Gerenciar modelos de treino</a></li>
        <li><a href="/profissional/propostas">Propostas enviadas</a></li>
        <li><a href="/alunos">Acompanhar evolução dos alunos</a></li>
        <li><a href="/perfil">Meu perfil físico</a></li>
        <li><a href="/profissional/perfil">Meu perfil profissional</a></li>
    </ul>
</nav>

<p>Gerencie seus alunos e acompanhe seus resultados.</p>

<a href="/painel?modo=aluno">
    Acessar painel do aluno
</a>
