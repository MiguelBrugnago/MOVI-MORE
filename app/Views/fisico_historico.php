<?php
// Lista avaliações em ordem decrescente. Os controles de edição são apresentados apenas no contexto pessoal.
/**
 * @var array $avaliacoes
 * @var Closure $esc
 * @var Closure $numero
 * @var array $metricas
 */
if (!$avaliacoes): ?>
    <article><p>Nenhuma avaliação neste período.</p></article>
<?php else: ?>
    <table>
        <caption>Avaliações da mais recente à mais antiga</caption>
        <thead>
            <tr>
                <th>Data</th>
                <?php foreach ($indicadoresResumo as [$nome, $unidade]): ?>
                    <th><?= $esc($nome) ?> (<?= $esc($unidade) ?>)</th>
                <?php endforeach; ?>
                <th>Detalhes</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($avaliacoes as $a): ?>
                <tr>
                    <td><?= $esc($a['avaliado_em']) ?></td>
                    <?php foreach (array_keys($indicadoresResumo) as $chave): ?>
                        <td><?= $numero($a['medidas'][$chave] ?? null) ?></td>
                    <?php endforeach; ?>
                    <td>
                        <?php if (!($somenteLeitura ?? false)): ?>
                            <a href="/perfil/avaliacoes/ver?id=<?= (int) $a['id'] ?>">Ver e corrigir</a>
                        <?php else: ?>
                            <details>
                                <summary>Medidas</summary>
                                <dl>
                                    <?php foreach ($metricas as $chave => [$nome, $unidade]): ?>
                                        <dt><?= $esc($nome) ?> (<?= $unidade ?>)</dt>
                                        <dd><?= $numero($a['medidas'][$chave] ?? null) ?></dd>
                                    <?php endforeach; ?>
                                </dl>
                                <?php // A permissão física não libera observações de saúde.?>
                                <?php if ($saudePermitida ?? false): ?>
                                    <p class="treino-nota"><?= $esc($a['observacao']) ?></p>
                                <?php endif; ?>
                            </details>
                        <?php endif; ?>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
<?php endif; ?>
