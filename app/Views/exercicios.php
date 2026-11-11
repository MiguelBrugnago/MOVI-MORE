<?php

declare(strict_types=1);

/** @var array $exercicios */
?>

<h1>Biblioteca de exercícios</h1>

<p>Consulte os exercícios disponíveis no MOVI+.</p>

<a href="/painel">Voltar ao painel</a>

<hr>

<?php if (empty($exercicios)): ?>

    <p>Nenhum exercício cadastrado.</p>

<?php else: ?>

    <table>
        <thead>
            <tr>
                <th>Exercício</th>
                <th>Categoria</th>
                <th>Dificuldade</th>
                <th>Tipo</th>
                <th>Origem</th>
            </tr>
        </thead>

        <tbody>
            <?php foreach ($exercicios as $exercicio): ?>
                <tr>
                    <td>
                        <?= htmlspecialchars(
                            (string) $exercicio['nome'],
                            ENT_QUOTES,
                            'UTF-8'
                        ) ?>
                    </td>

                    <td>
                        <?= htmlspecialchars(
                            (string) ($exercicio['categoria'] ?? '-'),
                            ENT_QUOTES,
                            'UTF-8'
                        ) ?>
                    </td>

                    <td>
                        <?= htmlspecialchars(
                            (string) ($exercicio['dificuldade'] ?? '-'),
                            ENT_QUOTES,
                            'UTF-8'
                        ) ?>
                    </td>

                    <td>
                        <?= htmlspecialchars(
                            (string) ($exercicio['tipo'] ?? '-'),
                            ENT_QUOTES,
                            'UTF-8'
                        ) ?>
                    </td>

                    <td>
                        <?= $exercicio['usuario_id'] === null
                            ? 'MOVI+'
                            : 'Personalizado' ?>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

<?php endif; ?>