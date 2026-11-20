<?php

/**
 * @var int $id
 * @var array $x
 * @var array $s
 * @var bool $ativo
 * @var bool $editavel
 * @var array $anterior
 * @var Closure $esc
 * @var Closure $resumo
 * @var Closure $hidden
 * @var Closure $num
 * @var Closure $select
 * @var Closure $texto
 */

use App\Services\RegistroTreino;

$ids = ['treino_id' => $id, 'item_id' => $x['id']];
$metas = isset($s['metas']) ? json_decode($s['metas'], true, 512, JSON_THROW_ON_ERROR) : [];
$estado = !empty($s['concluida']) ? 'concluida' : (!empty($s['ignorada']) ? 'ignorada' : 'pendente');
$tipo = $s['tipo'] ?? 'normal';
$labelEstado = ['concluida' => 'Concluída', 'ignorada' => 'Ignorada', 'pendente' => 'Pendente'][$estado];
?>
<details class="treino-serie" data-serie-card data-estado="<?= $esc($estado) ?>">
    <summary>
        <?= $s ? 'Série ' . (int) $s['numero'] . ' · ' . $labelEstado . ' · ' . $esc(RegistroTreino::TIPOS[$tipo] ?? $tipo) : 'Adicionar série' ?>
        <?= $s && $resumo($s, $x) !== '' ? ' · ' . $resumo($s, $x) : '' ?>
    </summary>
    <?php if ($metas): ?>
        <p>Metas:
            <?php foreach (RegistroTreino::METAS as $k => [$flag, $label]) {
                if (isset($metas[$k])) {
                    echo $esc($label) . ': ' . $esc($metas[$k]) . ' · ';
                }
            } ?>
            <?= isset($metas['rir_alvo']) ? 'RIR: ' . $esc($metas['rir_alvo']) : '' ?>
        </p>
    <?php endif ?>
    <?php if ($editavel): ?>
        <form method="post" action="/treinos/serie" data-serie-form data-item="<?= (int) $x['id'] ?>"
            data-serie="<?= (int) ($s['id'] ?? 0) ?>">
            <?php $hidden($ids + ($s ? ['serie_id' => $s['id']] : ['chave' => bin2hex(random_bytes(16))])); ?>
            <div class="treino-campos">
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
                }
        $num('rir', 'RIR', $s['rir'] ?? null, 0, 20);
        $num('rpe', 'RPE', $s['rpe'] ?? null, 0, 10, 1);
        $select('tipo', 'Tipo', RegistroTreino::TIPOS, $tipo);
        $select('lado', 'Lado', ['' => 'Não informado', 'direito' => 'Direito', 'esquerdo' => 'Esquerdo', 'conjunto' => 'Conjunto'], $s['lado'] ?? '');
        ?>
            </div>
            <?php $texto('observacao', 'Observações da série', $s['observacao'] ?? null); ?>
            <?php if ($ativo && $estado === 'pendente' && $metas): ?>
                <button type="button"
                    data-preencher="<?= $esc(json_encode(array_filter(['peso' => $metas['carga_alvo'] ?? null, 'repeticoes' => $metas['repeticoes_min'] ?? null, 'duracao_segundos' => $metas['duracao_alvo_segundos'] ?? null, 'distancia_metros' => $metas['distancia_alvo_metros'] ?? null], static fn ($v) => $v !== null), JSON_THROW_ON_ERROR)) ?>">Copiar
                    metas para os campos</button>
            <?php endif ?>
            <?php $ref = $anterior[$x['exercicio_id']][max(0, (int) ($s['numero'] ?? 1) - 1)] ?? null; ?>
            <?php if ($ativo && $estado === 'pendente' && $ref): ?>
                <button type="button"
                    data-preencher="<?= $esc(json_encode(array_filter(array_intersect_key($ref, RegistroTreino::METRICAS), static fn ($v) => $v !== null), JSON_THROW_ON_ERROR)) ?>">Copiar
                    valores da última sessão</button>
            <?php endif ?>
            <div class="treino-acoes">
                <button name="estado" value="concluida"><?= $ativo ? 'Concluir série' : 'Salvar como concluída' ?></button>
                <?php if ($ativo): ?><button name="estado" value="pendente">Salvar pendente</button><?php endif ?>
                <?php if ($s): ?><button name="estado" value="ignorada">Ignorar série</button><?php endif ?>
            </div>
            <p data-save-status role="status"></p>
        </form>
    <?php elseif (!empty($s['observacao'])): ?>
        <p><?= $esc($s['observacao']) ?></p><?php endif ?>
</details>