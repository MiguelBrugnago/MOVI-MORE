<?php
// O mapa e as tabelas usam os mesmos totais por músculo. A métrica selecionada determina o valor comparado com o período anterior.
/**
 * @var array $p
 * @var string $metrica
 * @var int|null $aluno
 * @var bool $profissional
 * @var int $u
 * @var array $dados
 * @var array $anterior
 * @var array $opcoes
 * @var array $progressao
 * @var array $recordes
 * @var array $melhores
 * @var bool $maisSeries
 * @var array $series
 * @var int|null $exercicio
 */
use App\Services\AnaliseTreinoService as A;
use App\Services\MapaMuscular;

/** Escapa o valor no momento de inseri-lo em texto ou em um atributo HTML. */
$esc = static fn ($v) => htmlspecialchars((string)$v, ENT_QUOTES, 'UTF-8');
/** Apresenta números com uma casa decimal e marca as medições ausentes com um travessão. */
$num = static fn ($v) => $v === null ? '—' : number_format((float)$v, 1, ',', '.');
// Quando uma das medições está ausente ou a base percentual é zero, o formatador preserva a informação de indisponibilidade.
/** Formata a diferença absoluta e a variação percentual calculadas pelo serviço, preservando medidas ausentes. */
$delta = static function ($a, $b) use ($num): string {
    $d = A::comparar($a === null ? null : (float)$a, $b === null ? null : (float)$b);
    return $num($d['absoluta']) . ' (' . ($d['percentual'] === null ? '% não aplicável' : $num($d['percentual']) . '%') . ')';
};
/** Renderiza indicadores na unidade informada e usa a maior medição da série como escala. */
$barras = static function (string $titulo, array $linhas, string $unidade) use ($esc, $num): void {
    ?><details class="treino-card" open><summary><?= $esc($titulo) ?></summary><?php
    if (!$linhas) {
        echo '<p>Sem registros compatíveis no período.</p>';
    }
    // A maior barra determina a escala. O mínimo de 1 mantém o elemento meter válido quando todos os totais são zero.
    $max = max([1, ...array_values($linhas)]);
    foreach ($linhas as $nome => $valor): ?>
        <div class="analise-barra"><span><?= $esc($nome) ?></span><meter min="0" max="<?= $esc($max) ?>" value="<?= $esc($valor) ?>" aria-label="<?= $esc($nome . ' — ' . $titulo) ?>"></meter><strong><?= $num($valor) ?> <?= $esc($unidade) ?></strong></div>
    <?php endforeach; ?></details><?php
};
// Todos os links carregam a janela e a métrica atuais para que a mudança de seção preserve a comparação.
$base = ['periodo' => $p['periodo'], 'de' => $p['de'], 'ate' => $p['ate'], 'metrica' => $metrica];
if ($aluno) {
    $base['aluno'] = $aluno;
}
/** Combina o caminho e os filtros com a janela selecionada e escapa o endereço para o atributo HTML. */
$link = static fn ($caminho, $extra = []) => $esc($caminho . '?' . http_build_query(array_replace($base, $extra)));
?>
<link rel="stylesheet" href="/assets/css/analise.css">
<script src="/assets/js/analise.js" defer></script>
<section class="treino-area analise">
<nav class="treino-nav" aria-label="Análises"><a href="<?= $link('/treinos/analise') ?>">Resumo</a><a href="<?= $link('/treinos/mapa-muscular') ?>#mapa">Mapa muscular</a><a href="<?= $link('/treinos/progressao') ?>#progressao">Progressão</a><a href="<?= $profissional ? '/alunos/visualizar?id=' . (int)$u : '/rotinas' ?>">Voltar</a></nav>
<h1>Análise de treinamento</h1>
<?php if ($profissional): ?><p>Acompanhamento autorizado do aluno #<?= (int)$u ?> · somente leitura.</p><?php endif ?>
<p>Estímulo estimado a partir dos seus registros. Não mede hipertrofia, recuperação ou desequilíbrio clínico.</p>
<form method="get" class="treino-campos" action="/treinos/analise">
<?php if ($aluno): ?><input type="hidden" name="aluno" value="<?= (int)$aluno ?>"><?php endif ?>
<label>Período<select name="periodo"><?php foreach (['7' => 'Últimos 7 dias', '30' => 'Últimos 30 dias', '90' => 'Últimos 90 dias', 'semana' => 'Semana atual', 'personalizado' => 'Personalizado'] as $k => $v): ?><option value="<?= $k ?>" <?= (string)$k === $p['periodo'] ? 'selected' : '' ?>><?= $v ?></option><?php endforeach ?></select></label>
<label>De (personalizado)<input type="date" name="de" value="<?= $esc($p['de']) ?>"></label>
<label>Até (personalizado)<input type="date" name="ate" value="<?= $esc($p['ate']) ?>"></label>
<label>Coloração<select name="metrica"><?php foreach (['equivalentes' => 'Séries equivalentes estimadas', 'series' => 'Séries registradas por músculo', 'diretas' => 'Séries diretas', 'indiretas' => 'Séries indiretas'] as $k => $v): ?><option value="<?= $k ?>" <?= $metrica === $k ? 'selected' : '' ?>><?= $v ?></option><?php endforeach ?></select></label>
<?php if ($exercicio): ?><input type="hidden" name="exercicio" value="<?= (int)$exercicio ?>"><?php endif ?>
<button>Aplicar filtros</button></form>
<p><?= $esc($p['de']) ?> a <?= $esc($p['ate']) ?> · comparação: <?= A::data($p['anterior_inicio']) ?> a <?= A::data($p['anterior_fim'] - 1) ?> (São Paulo).</p>
<?php if (!$dados['total']['treinos']): ?><article class="treino-card"><h2>Nenhum treino concluído neste período</h2><p>Conclua um treino com séries executadas ou amplie o intervalo para consultar sua evolução.</p></article><?php endif ?>
<div class="analise-resumo">
<?php foreach (['treinos' => 'Treinos concluídos', 'sessoes_semana' => 'Sessões / semana', 'series' => 'Séries de trabalho', 'repeticoes' => 'Repetições registradas', 'minutos' => 'Tempo de sessão (min)', 'frequencia' => 'Dias de treino / semana'] as $k => $v): ?>
<article class="treino-card"><h2><?= $v ?></h2><strong><?= $num($dados['total'][$k]) ?></strong><p>Variação: <?= $delta($dados['total'][$k], $anterior['total'][$k]) ?></p></article>
<?php endforeach ?></div>
<details class="treino-card"><summary>Como os dados são calculados</summary><p>Somente treinos concluídos e séries concluídas, não ignoradas. Aquecimento e preparatórias são excluídos. A média semanal usa dias do intervalo ÷ 7; semanas nas extremidades podem ser parciais. Tempo inclui descansos.</p><p>Fatores heurísticos: primário = 1; secundário = 0,5; estabilizador = 0. Séries equivalentes = séries × fator. Estabilização é contabilizada separadamente. O campo peso_estimado não é interpretado como carga ou fator por não ter semântica documentada. Não há soma automática de músculos pais e filhos.</p><p>Volume externo = carga em kg × repetições; apenas natureza externa e unidade repetições. Carga ausente permanece indisponível. Peso corporal, carga adicional e assistência não entram nesse volume. Valores ficam separados por exercício e lado; não são equivalentes entre máquinas ou técnicas. A atribuição muscular aplica os mesmos fatores, sem conservar o total entre músculos.</p></details>
<article class="treino-card" id="mapa"><h2>Mapa muscular</h2>
<p>Selecione uma região ou um nome para abrir os detalhes. Desenho esquemático; músculos profundos são representados em faixas. A cor soma ambos os lados, pois as relações musculares não distinguem lateralidade.</p>
<div class="analise-legenda" aria-label="Faixas da métrica selecionada">
<?php $faixas = A::FAIXAS;
foreach (['0 — sem registro', 'Acima de 0 e abaixo de ' . $faixas[0], $faixas[0] . ' a menos de ' . $faixas[1], $faixas[1] . ' a menos de ' . $faixas[2], $faixas[2] . ' ou mais'] as $i => $texto): ?><span><i class="calor-<?= $i ?>"></i><?= $esc($texto) ?></span><?php endforeach ?></div>
<div class="analise-corpos">
<?php foreach (['frente' => 'Frente', 'costas' => 'Costas'] as $vista => $rotulo): ?>
<svg viewBox="0 0 200 430" class="analise-corpo" role="group" aria-label="Corpo: <?= $rotulo ?>">
<title><?= $rotulo ?> — regiões musculares selecionáveis</title>
<text x="100" y="20" text-anchor="middle"><?= $rotulo ?></text>
<g transform="translate(100 12)"><ellipse cx="0" cy="36" rx="17" ry="22" class="corpo-base"/>
<?php foreach ([1, -1] as $sinal): ?><path transform="scale(<?= $sinal ?> 1)" class="corpo-base" d="M0 59 L15 58 24 68 49 73 Q64 77 68 105 L78 151 91 199 Q96 216 86 220 L72 203 52 155 41 122 34 164 45 204 46 242 35 294 37 329 29 382 39 394 37 401 15 401 13 378 9 323 10 292 0 229 Z"/><?php endforeach ?>
<?php foreach ($dados['musculos'] as $m): $chave = MapaMuscular::chave($m);
    $regiao = MapaMuscular::regioes()[$chave] ?? null;
    if (!$regiao || $regiao['vista'] !== $vista) {
        continue;
    } ?>
<a href="#musculo-<?= (int)$m['id'] ?>" aria-label="<?= $esc($m['nome'] . ': ' . $num($m[$metrica]) . ' séries') ?>" class="regiao calor-<?= A::nivel((float)$m[$metrica]) ?>" id="<?= $esc($chave) ?>" data-musculo="<?= (int)$m['id'] ?>">
<title><?= $esc($m['nome']) ?>: <?= $num($m[$metrica]) ?></title>
<?php foreach ([1, -1] as $sinal): ?><polygon transform="scale(<?= $sinal ?> 1)" points="<?= $esc($regiao['pontos']) ?>"/><?php endforeach ?></a>
<?php endforeach ?></g></svg><?php endforeach ?></div>
<p id="mapa-status" role="status" aria-live="polite">As faixas representam quantidade registrada no período, não metas de treino.</p>
<div class="analise-musculos">
<?php foreach ($dados['musculos'] as $id => $m): ?>
<details id="musculo-<?= (int)$id ?>" class="musculo-detalhe"><summary><i class="calor-<?= A::nivel((float)$m[$metrica]) ?>"></i><?= $esc($m['nome']) ?> · <?= $num($m[$metrica]) ?></summary>
<p>Grupo: <?= $esc($m['grupo_visual']) ?><?= MapaMuscular::chave($m) === null ? ' · Sem região SVG correspondente' : '' ?></p>
<dl><dt>Séries registradas</dt><dd><?= (int)$m['series'] ?></dd><dt>Diretas estimadas / indiretas estimadas</dt><dd><?= (int)$m['diretas'] ?> / <?= (int)$m['indiretas'] ?></dd><dt>Estabilizadoras</dt><dd><?= (int)$m['estabilizadoras'] ?></dd><dt>Séries equivalentes estimadas</dt><dd><?= $num($m['equivalentes']) ?></dd><dt>Frequência (dias com estímulo / semana)</dt><dd><?= $num($m['frequencia']) ?></dd><dt>Variação de séries equivalentes</dt><dd><?= $delta($m['equivalentes'], $anterior['musculos'][$id]['equivalentes']) ?></dd></dl>
<p>Exercícios realizados: <?= $esc(implode(', ', $m['exercicios']) ?: 'Nenhum no período') ?></p>
<p>Volume externo atribuído (kg × rep., estimativa):</p>
<?php if (!$m['volumes']): ?><p>Não disponível.</p><?php endif ?>
<?php foreach ($m['volumes'] as $v): ?><p><?= $esc($v['nome'] . ' · ' . $v['lado']) ?>: <?= $num($v['volume']) ?> kg × rep.</p><?php endforeach ?>
<?php $barras('Séries equivalentes por semana', $m['semanas'], 'séries'); ?>
</details><?php endforeach ?></div></article>
<details class="treino-card"><summary>Séries planejadas e realizadas por grupo</summary>
<p>Nas sessões concluídas do período, cada série copiada da rotina conta como planejada. Uma série concluída sem meta copiada conta como extra. Esta comparação inclui aquecimento e preparatórias.</p>
<?php if (!$planejamento): ?><p>Sem séries no período.</p><?php endif; ?>
<?php foreach ($planejamento as $grupo): ?>
    <p><?= $esc($grupo['grupo']) ?> · Planejadas: <?= (int)$grupo['planejadas'] ?> · Realizadas do plano: <?= (int)$grupo['realizadas'] ?> · Extras realizadas: <?= (int)$grupo['extras'] ?></p>
<?php endforeach; ?></details>
<?php $barras('Distribuição de séries por grupo do exercício', $dados['grupos'], 'séries'); ?>
<p>Uma série conta uma vez no grupo cadastrado do exercício. Na análise por músculo ela pode aparecer em várias regiões. Diferenças entre grupos descrevem os registros e não constituem diagnóstico.</p>
<?php $barras('Frequência de treino por semana', array_map(static fn ($s) => $s['treinos'], $dados['semanas']), 'sessões'); ?>
<details class="treino-card" open><summary>Volume externo no período e comparação</summary>
<?php if (!$dados['volumes']): ?><p>Sem carga externa e repetições compatíveis.</p><?php endif ?>
<?php foreach ($dados['volumes'] as $key => $v): ?><p><?= $esc($v['nome'] . ' · ' . $v['equipamento'] . ' · ' . $v['lado']) ?>: <strong><?= $num($v['volume']) ?> kg × rep.</strong> · variação <?= $delta($v['volume'], $anterior['volumes'][$key]['volume'] ?? null) ?></p><?php endforeach ?></details>
<details class="treino-card"><summary>Volume semanal por grupo (separado por exercício e lado)</summary>
<?php foreach ($dados['semanas'] as $semana => $s): foreach ($s['grupos'] as $grupo => $volumes): $linhas = [];
    foreach ($volumes as $v) {
        $linhas[$v['nome'] . ' · ' . $v['lado']] = $v['volume'];
    } $barras($semana . ' · ' . $grupo, $linhas, 'kg × rep.'); endforeach; endforeach ?></details>
<article class="treino-card" id="progressao"><h2>Progressão por exercício</h2>
<form method="get" action="/treinos/progressao#progressao" class="treino-campos">
<?php foreach ($base as $k => $v): ?><input type="hidden" name="<?= $esc($k) ?>" value="<?= $esc($v) ?>"><?php endforeach ?>
<label>Exercício realizado<select name="exercicio" required><option value="">Selecione</option><?php foreach ($opcoes as $id => $nome): ?><option value="<?= (int)$id ?>" <?= (int)$id === $exercicio ? 'selected' : '' ?>><?= $esc($nome) ?></option><?php endforeach ?></select></label><button>Consultar progressão</button></form>
<?php if (!$progressao): ?><p>Selecione um exercício com séries de trabalho no período.</p><?php else:
    $cargas = $vs = $prs = [];
    foreach ($progressao as $x) {
        $rotulo = A::data((int)$x['fim']) . ' #' . $x['treino_id'] . ' · ' . $x['lado'];
        if ($x['carga'] !== null) {
            $cargas[$rotulo] = (float)$x['carga'];
        } if ($x['volume'] !== null) {
            $vs[$rotulo] = (float)$x['volume'];
        }
    }
    foreach ($recordes as $x) {
        $prs[A::data((int)$x['fim']) . ' #' . $x['treino_id'] . ' · ' . $x['lado']] = (float)$x['carga'];
    }
    $barras('Progressão da maior carga por sessão', $cargas, 'kg');
    $barras('Volume por sessão', $vs, 'kg × rep.');
    $barras('Evolução dos recordes pessoais de carga', $prs, 'kg'); ?>
<p>Melhor carga no período: <?= $num($cargas ? max($cargas) : null) ?> kg. Recordes comparam cada lado ao histórico anterior completo. Carga adicional é apenas o peso adicionado; assistência não é recorde de carga.</p>
<h3>Melhor carga por número de repetições e lado</h3><div class="analise-tabela"><table><thead><tr><th>Repetições</th><th>Lado</th><th>Carga (kg)</th></tr></thead><tbody><?php foreach ($melhores as $v): ?><tr><td><?= (int)$v['repeticoes'] ?></td><td><?= $esc($v['lado']) ?></td><td><?= $num($v['carga']) ?></td></tr><?php endforeach ?></tbody></table></div>
<h3>Séries de trabalho registradas</h3><?php if ($maisSeries): ?><p>Exibindo as 500 séries mais recentes; reduza o período para consultar as demais. Os gráficos e recordes incluem todo o intervalo.</p><?php endif ?>
<div class="analise-tabela"><table><thead><tr><th>Sessão</th><th>Série</th><th>Carga (kg)</th><th>Contagem / unidade</th><th>Lado</th></tr></thead><tbody>
<?php foreach ($series as $s): ?><tr><td><?= A::data((int)$s['fim']) ?> #<?= (int)$s['treino_id'] ?></td><td><?= (int)$s['numero'] ?></td><td><?= $num($s['peso']) ?> (<?= $esc($s['natureza_carga']) ?>)</td><td><?= $num($s['repeticoes']) ?> <?= $esc($s['unidade_contagem']) ?></td><td><?= $esc($s['lado'] ?? 'não informado') ?></td></tr><?php endforeach ?></tbody></table></div>
<?php endif ?></article>
<?php if ($dados['semRelacao'] || $dados['revisao']): ?><details class="treino-card" open><summary>Qualidade dos dados</summary><p>Sem associação muscular: <?= $esc(implode(', ', $dados['semRelacao']) ?: 'nenhum exercício realizado') ?>. Esses exercícios contam nos totais, mas não recebem estímulo muscular inventado.</p><p>Relações com fator legado ou papel a revisar: <?= $esc(implode(', ', $dados['revisao']) ?: 'nenhuma') ?>.</p></details><?php endif ?>
</section>
