<?php

declare(strict_types=1);

/** @var array $aluno */
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

<h3>Treinos do aluno</h3>
<p>Funcionalidade prevista para uma próxima etapa.</p>

<h3>Evolução física</h3>
<p>Funcionalidade prevista para uma próxima etapa.</p>

<h3>Alimentação</h3>
<p>Funcionalidade prevista para uma próxima etapa.</p>