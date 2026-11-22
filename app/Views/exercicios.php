<?php
// A página conserva os filtros nos links de navegação e apresenta somente os resultados liberados pelo repositório.

/** @var array{q: string, grupo: string, equipamento: string, modalidade: string, ordem: string, pagina: int} $filtros */
/** @var array<string, list<array{id: int|string, nome: string}>> $opcoes */
/** @var array{total: int, pagina: int, paginas: int, itens: list<array<string, mixed>>} $resultado */
/** Escapa o valor no momento de inseri-lo em texto ou em um atributo HTML. */
$esc = static fn ($v) => htmlspecialchars((string) $v, ENT_QUOTES, 'UTF-8');
?>
<h1>Biblioteca de exercícios</h1>
<p>Encontre um movimento e adicione à sua rotina.</p>
<form method="get" class="filtros">
    <label>Buscar por nome<input name="q" maxlength="150" value="<?= $esc($filtros['q']) ?>"
            placeholder="Nome em português ou inglês"></label>
    <?php foreach (['grupo' => 'Grupo muscular', 'equipamento' => 'Equipamento', 'modalidade' => 'Modalidade'] as $k => $label): ?>
        <label><?= $label ?><select name="<?= $k ?>">
                <option value="">Todos</option>
                <?php foreach ($opcoes[$k] as $o): ?>
                    <option value="<?= $esc($o['id']) ?>" <?= (string) $o['id'] === $filtros[$k] ? 'selected' : '' ?>>
                        <?= $esc($o['nome']) ?>
                    </option><?php endforeach; ?>
            </select></label><?php endforeach; ?>
    <label>Ordenar<select name="ordem">
            <option value="az">Nome A–Z</option>
            <option value="za" <?= $filtros['ordem'] === 'za' ? 'selected' : '' ?>>Nome Z–A</option>
        </select></label>
    <button>Buscar</button><a href="/exercicios">Limpar filtros</a>
</form>
<p><?= $resultado['total'] ?> exercícios encontrados · Página <?= $resultado['pagina'] ?> de
    <?= $resultado['paginas'] ?>
</p>
<div class="catalogo">
    <?php foreach ($resultado['itens'] as $e): ?>
        <article>
            <h2><a href="/exercicios/ver?id=<?= (int) $e['id'] ?>"><?= $esc($e['nome']) ?></a></h2>
            <p><?= $esc($e['grupo']) ?> · <?= $esc($e['equipamento']) ?></p>
            <p><?= $esc($e['registro']) ?> · <?= $esc($e['modalidade']) ?></p>
        </article>
    <?php endforeach; ?>
</div>
<?php if (!$resultado['total']): ?>
    <p>Nenhum exercício corresponde aos filtros.</p><?php endif; ?>
<nav aria-label="Paginação" class="paginacao">
    <?php for ($p = max(1, $resultado['pagina'] - 2); $p <= min($resultado['paginas'], $resultado['pagina'] + 2); $p++): ?>
        <a <?= $p === $resultado['pagina'] ? 'aria-current="page"' : '' ?>
            href="?<?= $esc(http_build_query(array_merge($filtros, ['pagina' => $p]))) ?>"><?= $p ?></a>
    <?php endfor; ?>
</nav>