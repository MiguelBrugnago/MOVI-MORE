<?php

declare(strict_types=1);

/** @var array{id: int, nome: string, email: string, ativo: int} $usuarioLogado */

$ehProfissional = $ehProfissional ?? false;

$recursos = [
    [
        'titulo' => 'Meus treinos',
        'descricao' => 'Organize suas rotinas de treino.',
        'url' => '/rotinas',
        'cor' => 'verde'
    ],
    [
        'titulo' => 'Minha evolução',
        'descricao' => 'Acompanhe sua evolução corporal.',
        'url' => '/perfil/evolucao',
        'cor' => 'roxo'
    ],
    [
        'titulo' => 'Análise muscular',
        'descricao' => 'Consulte análises dos seus treinos.',
        'url' => '/treinos/analise',
        'cor' => 'ciano'
    ],
    [
        'titulo' => 'Minhas avaliações',
        'descricao' => 'Consulte seu histórico de avaliações.',
        'url' => '/perfil/avaliacoes',
        'cor' => 'laranja'
    ],
    [
        'titulo' => 'Propostas de treino',
        'descricao' => 'Confira propostas recebidas.',
        'url' => '/propostas',
        'cor' => 'roxo'
    ],
    [
        'titulo' => 'Meus profissionais',
        'descricao' => 'Gerencie seus vínculos profissionais.',
        'url' => '/vinculos',
        'cor' => 'ciano'
    ],
    [
        'titulo' => 'Meu perfil físico',
        'descricao' => 'Consulte e atualize suas informações.',
        'url' => '/perfil',
        'cor' => 'verde'
    ],
];
?>

<div class="painel-aluno">

    <section class="painel-boas-vindas">
        <span class="painel-tag">
            PAINEL DO ALUNO
        </span>

        <h1>
            Bem-vindo,
            <?= htmlspecialchars(
                $usuarioLogado['nome'],
                ENT_QUOTES,
                'UTF-8'
            ) ?>!
        </h1>

        <p>
            Seu espaço para organizar seus treinos
            e acompanhar sua evolução.
        </p>
    </section>

    <section class="painel-recursos">
        <h2>O que você deseja fazer hoje?</h2>

        <div class="painel-grid">

            <?php foreach ($recursos as $recurso): ?>

                <a
                    href="<?= htmlspecialchars(
                                $recurso['url'],
                                ENT_QUOTES,
                                'UTF-8'
                            ) ?>"
                    class="painel-card <?= htmlspecialchars(
                                            $recurso['cor'],
                                            ENT_QUOTES,
                                            'UTF-8'
                                        ) ?>">
                    <h3>
                        <?= htmlspecialchars(
                            $recurso['titulo'],
                            ENT_QUOTES,
                            'UTF-8'
                        ) ?>
                    </h3>

                    <p>
                        <?= htmlspecialchars(
                            $recurso['descricao'],
                            ENT_QUOTES,
                            'UTF-8'
                        ) ?>
                    </p>

                    <span class="painel-card-acao">
                        Acessar →
                    </span>
                </a>

            <?php endforeach; ?>

        </div>
    </section>

    <section class="painel-profissional">
        <h2>Área profissional</h2>

        <?php if ($ehProfissional): ?>

            <p>
                Acesse suas ferramentas profissionais.
            </p>

            <a href="/painel?modo=profissional">
                Acessar painel profissional
            </a>

        <?php else: ?>

            <p>
                Você ainda não possui um perfil profissional.
            </p>

            <a href="/profissional/cadastro">
                Cadastrar perfil profissional
            </a>

        <?php endif; ?>
    </section>

</div>