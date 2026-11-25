<?php
declare(strict_types=1);

use App\Security\Csrf;

$esc = static fn ($v) => htmlspecialchars((string)$v, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
$numero = static fn ($v) => number_format((float)$v, 2, ',', '.');
$nutrientes = ['calorias' => 'Energia (kcal)', 'proteinas' => 'Proteínas (g)',
    'carboidratos' => 'Carboidratos (g)', 'gorduras' => 'Gorduras (g)'];
$campos = static function (string $acao, array $extras = []) use ($esc, $data): void {
    foreach (['acao' => $acao, 'csrf_token' => Csrf::gerarToken(), 'data' => $data] + $extras as $nome => $valor) { ?>
        <input type="hidden" name="<?= $esc($nome) ?>" value="<?= $esc($valor) ?>">
    <?php }
};
$porcao = static function () use ($diario, $esc): void { ?>
    <label>Alimento<select name="alimento" required><option value="">Selecione</option>
        <?php foreach ($diario['alimentos'] as $a): ?><option value="<?= (int)$a['id'] ?>"><?= $esc($a['nome']) ?></option><?php endforeach; ?>
    </select></label>
    <label>Quantidade (g)<input name="gramas" type="number" min="0.01" max="10000" step="0.01" required></label>
<?php };
$lista = static function (array $refeicoes, ?int $rascunhoId = null) use ($esc, $numero, $campos): void {
    foreach ($refeicoes as $id => $r): ?>
    <h3><?= $esc($r['nome']) ?></h3>
    <?php if (!$r['itens']): ?><p>Aguardando alimentos.</p><?php endif; ?>
    <ul><?php foreach ($r['itens'] as $item): ?>
        <li><?= $esc($item['alimento']) ?> · <?= $numero($item['quantidade_gramas']) ?> g · <?= $numero($item['kcal']) ?> kcal ·
            proteínas <?= $numero($item['proteinas']) ?> g · carboidratos <?= $numero($item['carboidratos']) ?> g · gorduras <?= $numero($item['gorduras']) ?> g
            <?php if ($rascunhoId): ?><form method="post">
                <?php $campos('remover_porcao', ['plano' => $rascunhoId, 'refeicao' => $id, 'alimento' => $item['alimento_id']]); ?>
                <button>Remover <?= $esc($item['alimento']) ?></button>
            </form><?php endif; ?>
        </li>
    <?php endforeach; ?></ul>
    <?php if ($rascunhoId): ?><form method="post"><?php $campos('remover_refeicao', ['plano' => $rascunhoId, 'refeicao' => $id]); ?>
        <button>Remover refeição <?= $esc($r['nome']) ?></button></form><?php endif; ?>
    <?php endforeach;
};
$plano = $diario['plano'];
$rascunho = $diario['rascunho'];
?>
<h1><?= $pessoal ? 'Minha alimentação' : 'Acompanhamento alimentar do aluno #' . (int)$titular ?></h1>
<form method="get" class="treino-acoes">
    <?php if (!$pessoal): ?><input type="hidden" name="aluno" value="<?= (int)$titular ?>"><?php endif; ?>
    <label>Dia do diário<input type="date" name="data" value="<?= $esc($data) ?>" max="<?= $hoje ?>" required></label>
    <button>Consultar dia</button>
</form>
<section class="treino-card">
    <h2>Consumo e metas do dia</h2>
    <p>Valores calculados pelas porções registradas. As metas são informadas pela conta.</p>
    <dl><?php foreach ($nutrientes as $campo => $rotulo):
        $total = array_sum(array_column($diario['registros'], $campo . '_total'));
        $alvo = $plano[$campo . '_alvo'] ?? null; ?>
        <dt><?= $rotulo ?></dt><dd><?= $numero($total) ?> consumidos · <?= $alvo === null ? 'Sem meta' : 'Meta de ' . $numero($alvo) ?></dd>
    <?php endforeach; ?></dl>
    <?php if (!$diario['registros']): ?><p>Nenhum consumo registrado neste dia.</p><?php endif; ?>
    <?php foreach ($diario['registros'] as $r): ?>
        <p><?= $esc($r['alimento_nome_snapshot']) ?> · <?= $esc($r['nome_refeicao']) ?> · <?= $numero($r['quantidade_gramas']) ?> g · <?= $numero($r['calorias_total']) ?> kcal</p>
        <?php if ($pessoal): ?><form method="post"><?php $campos('corrigir_diario', ['id' => $r['id']]); ?><button>Remover registro de <?= $esc($r['alimento_nome_snapshot']) ?></button></form><?php endif; ?>
    <?php endforeach; ?>
    <?php if ($pessoal && $diario['alimentos']): ?>
    <form method="post"><?php $campos('consumo', ['chave' => bin2hex(random_bytes(16))]); $porcao(); ?>
        <label>Nome da refeição<input name="refeicao" maxlength="120"></label><button>Registrar consumo</button>
    </form>
    <?php endif; ?>
</section>
<section class="treino-card">
    <h2>Plano em <?= $esc($data) ?></h2>
    <?php if ($plano): ?><p><?= $esc($plano['nome']) ?></p><?php $lista($diario['refeicoes']); ?>
    <?php else: ?><p>Nenhum plano vigente neste dia.</p><?php endif; ?>
</section>
<?php if ($pessoal): ?>
<details class="treino-card" <?= !$diario['alimentos'] ? 'open' : '' ?>><summary>Catálogo de alimentos</summary>
    <?php if (!$diario['alimentos']): ?><p>Cadastre os valores de um rótulo para começar.</p><?php endif; ?>
    <ul><?php foreach ($diario['alimentos'] as $a): ?><li><?= $esc($a['nome']) ?> · <?= $numero($a['calorias_100g']) ?> kcal por 100 g</li><?php endforeach; ?></ul>
    <form method="post"><?php $campos('alimento'); ?>
        <label>Nome do alimento<input name="nome" maxlength="150" required></label>
        <fieldset><legend>Composição por 100 g</legend><div class="treino-campos">
        <?php foreach ($nutrientes as $campo => $rotulo): ?><label><?= $rotulo ?><input name="<?= $campo ?>" type="number" step="0.01" min="0" max="<?= $campo === 'calorias' ? 1000 : 100 ?>" required></label><?php endforeach; ?>
        </div></fieldset><button>Salvar alimento pessoal</button>
    </form>
</details>
<details class="treino-card" <?= $rascunho ? 'open' : '' ?>><summary>Planejar refeições</summary>
    <form method="post"><?php $rascunho ? $campos('editar_plano', ['plano' => $rascunho['id']]) : $campos('plano'); ?>
        <label>Nome do plano<input name="nome" maxlength="150" value="<?= $esc($rascunho['nome'] ?? '') ?>" required></label>
        <fieldset><legend>Metas diárias opcionais</legend><div class="treino-campos">
        <?php foreach ($nutrientes as $campo => $rotulo): ?><label><?= $rotulo ?><input name="<?= $campo ?>" type="number" min="0" max="99999" step="0.01" value="<?= $esc($rascunho[$campo . '_alvo'] ?? '') ?>"></label><?php endforeach; ?>
        </div></fieldset><button><?= $rascunho ? 'Salvar nome e metas' : 'Criar rascunho' ?></button>
    </form>
<?php if ($rascunho): $idPlano = ['plano' => $rascunho['id']]; ?>
    <h2><?= $esc($rascunho['nome']) ?></h2>
    <?php $lista($diario['emEdicao'], (int)$rascunho['id']); ?>
    <form method="post"><?php $campos('refeicao', $idPlano); ?>
        <label>Nova refeição<input name="nome" maxlength="120" required></label><button>Adicionar refeição</button>
    </form>
    <?php if ($diario['emEdicao'] && $diario['alimentos']): ?>
    <form method="post"><?php $campos('porcao', $idPlano); ?>
        <label>Refeição<select name="refeicao"><?php foreach ($diario['emEdicao'] as $id => $r): ?><option value="<?= (int)$id ?>"><?= $esc($r['nome']) ?></option><?php endforeach; ?></select></label>
        <?php $porcao(); ?><button>Salvar porção na refeição</button>
    </form>
    <?php endif; ?>
    <form method="post"><?php $campos('publicar', $idPlano); ?><button>Usar este plano a partir de hoje</button></form>
<?php endif; ?>
</details>
<?php endif; ?>
<section class="treino-card"><h2>Preferências e restrições alimentares</h2>
<?php foreach (array_diff_key($diario['preferencias'], array_flip(['Preferências pessoais', 'Restrições pessoais'])) as $nome => $observacao): ?>
    <p><?= $esc($nome) ?><?= $observacao !== null ? ' · ' . $esc($observacao) : '' ?></p>
<?php endforeach; ?>
<?php if ($pessoal): ?><form method="post"><?php $campos('preferencias'); ?><?php endif; ?>
<?php foreach (['Preferências pessoais' => 'preferencias', 'Restrições pessoais' => 'restricoes'] as $nome => $campo): ?>
    <?php if ($pessoal): ?><label><?= $nome ?><textarea name="<?= $campo ?>" maxlength="1000"><?= $esc($diario['preferencias'][$nome] ?? '') ?></textarea></label>
    <?php else: ?><p><?= $nome ?> · <?= $esc($diario['preferencias'][$nome] ?? 'Sem informação') ?></p><?php endif; ?>
<?php endforeach; ?>
<?php if ($pessoal): ?><button>Salvar preferências e restrições</button></form><?php endif; ?>
</section>
