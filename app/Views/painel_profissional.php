<?php

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
        <li>Gerenciar treinos</li>
        <li>Acompanhar evolução</li>
        <li>Meu perfil profissional</li>
    </ul>
</nav>

<p>Gerencie seus alunos e acompanhe seus resultados.</p>

<a href="/painel?modo=aluno">
    Acessar painel do aluno
</a>