<?php

declare(strict_types=1);

/** @var array{id: int, nome: string, email: string, ativo: int} $usuarioLogado */

$ehProfissional = $ehProfissional ?? false;
?>

<h1>
    Bem-vindo ao MOVI+,
    <?= htmlspecialchars($usuarioLogado['nome'], ENT_QUOTES, 'UTF-8') ?>!
</h1>

<h2>Painel do Aluno</h2>

<nav>
    <ul>
        <li>Meus treinos</li>
        <li>Minha evolução</li>
        <li>Minha alimentação</li>
        <li><a href="/vinculos">Meus profissionais</a></li>
        <li>Meu perfil</li>
    </ul>
</nav>

<p>Gerencie seus treinos e acompanhe sua evolução.</p>

<?php if ($ehProfissional): ?>
    <a href="/painel?modo=profissional">
        Acessar painel profissional
    </a>
<?php else: ?>
    <p>Você ainda não possui um perfil profissional.</p>

    <a href="/profissional/cadastro">
        Cadastrar perfil profissional
    </a>
<?php endif; ?>