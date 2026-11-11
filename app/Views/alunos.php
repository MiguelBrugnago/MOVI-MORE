<?php

declare(strict_types=1);

/** @var array $alunos */
?>

<h1>Meus alunos</h1>

<p>Alunos com acompanhamento ativo.</p>

<a href="/painel?modo=profissional">
    Voltar ao painel profissional
</a>

<hr>

<?php if (empty($alunos)): ?>

    <p>Você ainda não possui alunos vinculados.</p>

    <a href="/vinculos?modo=profissional">
        Gerenciar solicitações de vínculo
    </a>

<?php else: ?>

    <table>
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
                    <td>
                        <?= htmlspecialchars(
                            (string) $aluno['aluno_nome'],
                            ENT_QUOTES,
                            'UTF-8'
                        ) ?>
                    </td>

                    <td>
                        <?= htmlspecialchars(
                            (string) $aluno['aluno_email'],
                            ENT_QUOTES,
                            'UTF-8'
                        ) ?>
                    </td>

                    <td>
                        <?= htmlspecialchars(
                            (string) ($aluno['iniciado_em'] ?? '-'),
                            ENT_QUOTES,
                            'UTF-8'
                        ) ?>
                    </td>

                    <td>
                        <a href="/alunos/visualizar?id=<?= (int) $aluno['aluno_id'] ?>">
                            Visualizar
                        </a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

<?php endif; ?>