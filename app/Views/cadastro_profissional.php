<?php

declare(strict_types=1);

$erro = $erro ?? null;
$escapar = static fn (string $valor): string => htmlspecialchars(
    $valor,
    ENT_QUOTES | ENT_SUBSTITUTE,
    'UTF-8'
);

$tiposProfissionais = ['Personal Trainer', 'Educador Físico', 'Nutricionista'];
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro profissional - MOVI+</title>
    <link rel="stylesheet" href="/assets/css/app.css">
</head>
<body class="auth-page">
    <main class="auth-container auth-container-profissional">
        <a href="/painel?modo=aluno" class="auth-logo" aria-label="MOVI+ - Painel do aluno">
            <img src="/assets/img/movi-plus-logo-horizontal.png" alt="MOVI+">
        </a>

        <section class="auth-card auth-cadastro-profissional" aria-labelledby="titulo-cadastro-profissional">
            <h1 id="titulo-cadastro-profissional">Cadastro profissional</h1>
            <p class="auth-subtitulo">Crie seu perfil profissional para acompanhar alunos no MOVI+.</p>

            <?php if ($erro !== null): ?>
                <p class="auth-erro" role="alert"><?= $escapar($erro) ?></p>
            <?php endif; ?>

            <form action="/profissional/cadastro" method="post">
                <input
                    type="hidden"
                    name="csrf_token"
                    value="<?= $escapar((string) ($_SESSION['csrf_token'] ?? '')) ?>"
                >

                <label for="tipo">
                    Tipo de profissional
                    <select name="tipo" id="tipo" required>
                        <option value="">Selecione</option>
                        <?php foreach ($tiposProfissionais as $tipoProfissional): ?>
                            <option
                                value="<?= $escapar($tipoProfissional) ?>"
                                <?= ($tipo ?? '') === $tipoProfissional ? 'selected' : '' ?>
                            ><?= $escapar($tipoProfissional) ?></option>
                        <?php endforeach; ?>
                    </select>
                </label>

                <label for="registro">
                    Registro profissional
                    <input
                        type="text"
                        name="registro"
                        id="registro"
                        maxlength="80"
                        value="<?= $escapar($registro ?? '') ?>"
                    >
                </label>

                <label for="especialidade">
                    Especialidade
                    <input
                        type="text"
                        name="especialidade"
                        id="especialidade"
                        maxlength="120"
                        value="<?= $escapar($especialidade ?? '') ?>"
                    >
                </label>

                <label for="descricao">
                    Descrição profissional
                    <textarea name="descricao" id="descricao" rows="4"><?= $escapar($descricao ?? '') ?></textarea>
                </label>

                <button type="submit" class="auth-btn">
                    Cadastrar perfil profissional
                </button>
            </form>

            <p class="auth-rodape">
                <a href="/painel?modo=aluno">Voltar ao painel do aluno</a>
            </p>
        </section>
    </main>
</body>
</html>
