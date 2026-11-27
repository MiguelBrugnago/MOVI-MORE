<?php
// O mesmo cartão aparece no HTML inicial e na resposta assíncrona. Uma série vazia abre o formulário de inclusão.

/**
 * @var int $id
 * @var array $x
 * @var array $s
 * @var bool $ativo
 * @var bool $editavel
 * @var array $anterioresPorNumero
 * @var int $proximoNumero Usado no formulário de inclusão.
 * @var Closure $esc
 * @var Closure $resumo
 * @var Closure $hidden
 * @var Closure $num
 * @var Closure $select
 * @var Closure $texto
 */

use App\Services\RegistroTreino;

$ids = ['treino_id' => $id, 'item_id' => $x['id']];
// O JSON da sessão guarda as metas copiadas no início do treino. A série nova ainda não possui esse registro.
$metas = isset($s['metas']) ? json_decode($s['metas'], true, 512, JSON_THROW_ON_ERROR) : [];
$estado = !empty($s['concluida']) ? 'concluida' : (!empty($s['ignorada']) ? 'ignorada' : 'pendente');
$tipo = $s['tipo'] ?? 'normal';
$labelEstado = ['concluida' => 'Concluída', 'ignorada' => 'Ignorada', 'pendente' => 'Pendente'][$estado];
$valoresRegistrados = $resumo($s, $x);
// Séries ignoradas podem deixar lacunas no histórico da última sessão.
$ref = $anterioresPorNumero[$s['numero'] ?? $proximoNumero] ?? [];
$valoresAnteriores = array_filter(array_intersect_key($ref, RegistroTreino::METRICAS), static fn ($v) => $v !== null);
$valoresAlvo = array_filter([
    'peso' => $metas['carga_alvo'] ?? null,
    'repeticoes' => $metas['repeticoes_min'] ?? null,
    'duracao_segundos' => $metas['duracao_alvo_segundos'] ?? null,
    'distancia_metros' => $metas['distancia_alvo_metros'] ?? null,
], static fn ($v) => $v !== null);
$metasVisiveis = [];
foreach (RegistroTreino::METAS as $campo => [, $rotulo]) {
    if (isset($metas[$campo])) {
        $metasVisiveis[] = $rotulo . ': ' . $metas[$campo];
    }
}
if (isset($metas['rir_alvo'])) {
    $metasVisiveis[] = 'RIR: ' . $metas['rir_alvo'];
}
?>
<details class="treino-serie" data-serie-card data-estado="<?= $esc($estado) ?>"<?= !empty($abrirSerie) ? ' open' : '' ?>>
    <summary>
        <?php if ($s): ?>
            Série <?= (int) $s['numero'] ?>
            <span class="serie-estado"><?= $estado === 'concluida' ? '✓ ' : '' ?><?= $labelEstado ?></span>
            <?php if ($tipo !== 'normal'): ?> · <?= $esc(RegistroTreino::TIPOS[$tipo] ?? $tipo) ?><?php endif ?>
            <?php if ($valoresRegistrados !== ''): ?> · <?= $valoresRegistrados ?><?php endif ?>
        <?php else: ?>Adicionar série<?php endif ?>
    </summary>
    <?php if ($metasVisiveis): ?>
        <p class="serie-referencia"><strong>Meta da rotina</strong> <?= $esc(implode(' · ', $metasVisiveis)) ?></p>
    <?php endif ?>
    <?php if ($editavel): ?>
        <form method="post" action="/treinos/serie" data-serie-form data-item="<?= (int) $x['id'] ?>"
            data-serie="<?= (int) ($s['id'] ?? 0) ?>">
            <?php $hidden($ids + ($s ? ['serie_id' => $s['id']] : ['chave' => bin2hex(random_bytes(16))])); ?>
            <?php if ($ativo && $estado === 'pendente' && $valoresAnteriores): ?>
                <div class="serie-anterior">
                    <span><strong>Última sessão · série <?= (int) $ref['numero'] ?></strong> <?= $resumo($valoresAnteriores, $x) ?></span>
                    <button type="button" class="botao-secundario" data-preencher="<?= $esc(json_encode($valoresAnteriores, JSON_THROW_ON_ERROR)) ?>">Usar valores anteriores</button>
                </div>
            <?php endif ?>
            <div class="treino-campos serie-metricas">
                <?php foreach (RegistroTreino::METRICAS as $k => [$flag, $label, $min, $max, $dec]) {
                    if (empty($x[$flag])) {
                        continue;
                    }
                    if ($k === 'repeticoes') {
                        $label = ucfirst($x['unidade_contagem'] ?? $label);
                    }
                    if ($k === 'peso' && $x['natureza_carga']) {
                        $label .= ' · ' . $x['natureza_carga'];
                    }
                    $num($k, $label, $s[$k] ?? null, $min, $max, $dec);
                } ?>
            </div>
            <?php if ($ativo && $estado === 'pendente' && $valoresAlvo): ?>
                <button type="button" class="botao-secundario" data-preencher="<?= $esc(json_encode($valoresAlvo, JSON_THROW_ON_ERROR)) ?>">Usar metas da rotina</button>
            <?php endif ?>
            <details class="serie-detalhes">
                <summary>Tipo, lado, esforço e observações</summary>
                <div class="treino-campos">
                    <?php
                    $select('tipo', 'Tipo', RegistroTreino::TIPOS, $tipo);
                    $select('lado', 'Lado', ['' => 'Não informado', 'direito' => 'Direito', 'esquerdo' => 'Esquerdo', 'conjunto' => 'Conjunto'], $s['lado'] ?? '');
                    $num('rir', 'Repetições em reserva (RIR)', $s['rir'] ?? null, 0, 20);
                    $num('rpe', 'Esforço percebido (RPE)', $s['rpe'] ?? null, 0, 10, 1);
                    ?>
                </div>
                <?php $texto('observacao', 'Observações da série', $s['observacao'] ?? null); ?>
            </details>
            <div class="treino-acoes">
                <button name="estado" value="concluida"><?= $ativo ? 'Concluir série' : 'Salvar como concluída' ?></button>
                <?php if ($ativo): ?><button name="estado" value="pendente" class="botao-secundario">Salvar pendente</button><?php endif ?>
                <?php if ($s): ?><button name="estado" value="ignorada" class="botao-secundario">Ignorar série</button><?php endif ?>
            </div>
            <p data-save-status role="status"></p>
        </form>
    <?php elseif (!empty($s['observacao'])): ?>
        <p><?= $esc($s['observacao']) ?></p><?php endif ?>
</details>
