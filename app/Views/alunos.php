<?php
// O repositório entrega alunos com acompanhamento ativo. Cada link usa o ID da conta do aluno no detalhamento.

declare(strict_types=1);

/** @var list<array{aluno_id:int,aluno_nome:string,aluno_email:string,vinculo_id:int,iniciado_em:?string}> $alunos */
?>

<h1>Meus alunos</h1>

<form method="get"><label>Buscar aluno por nome<input name="q" maxlength="150" value="<?= htmlspecialchars($busca, ENT_QUOTES, 'UTF-8') ?>"></label><button>Filtrar alunos</button></form>

<a href="/painel?modo=profissional">
    Voltar ao painel profissional
</a>

<hr>

<?php if (empty($alunos)): ?>

    <p>Nenhum aluno com acompanhamento ativo corresponde à consulta.</p>

    <a href="/vinculos?modo=profissional">
        Gerenciar solicitações de vínculo
    </a>

<?php else: ?>

    <table class="tabela-responsiva">
        <thead>
            <tr>
                <th>Nome</th>
                <th>E-mail</th>
                <th>Início do acompanhamento</th>
                <th>Ações</th>
            </tr>
        </thead>

        <tbody>
            <?php foreach ($alunos as $aluno): ?>
                <tr>
                    <td data-label="Nome">
                        <?= htmlspecialchars(
                            (string) $aluno['aluno_nome'],
                            ENT_QUOTES,
                            'UTF-8'
                        ) ?>
                    </td>

                    <td data-label="E-mail">
                        <?= htmlspecialchars(
                            (string) $aluno['aluno_email'],
                            ENT_QUOTES,
                            'UTF-8'
                        ) ?>
                    </td>

                    <td data-label="Início do acompanhamento">
                        <?= htmlspecialchars(
                            (string) ($aluno['iniciado_em'] ?? '-'),
                            ENT_QUOTES,
                            'UTF-8'
                        ) ?>
                    </td>

                    <td data-label="Ações">
                        <a href="/alunos/visualizar?id=<?= (int) $aluno['aluno_id'] ?>">
                            Visualizar
                        </a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

<?php endif; ?>