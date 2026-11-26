<?php

/** @var array{q: string, grupo: string, equipamento: string, modalidade: string, ambiente: string, favoritos: string, ordem: string, pagina: int} $filtros */
/** @var array<string, list<array{id: int|string, nome: string}>> $opcoes */
/** @var array{total: int, pagina: int, paginas: int, itens: list<array<string, mixed>>} $resultado */

$escapar = static fn (mixed $valor): string => htmlspecialchars((string) $valor, ENT_QUOTES, 'UTF-8');

$filtrosDeSelecao = [
    'grupo' => 'Grupo muscular',
    'equipamento' => 'Equipamento',
    'modalidade' => 'Modalidade',
    'ambiente' => 'Ambiente',
];
$opcoesAtivas = array_filter(array_intersect_key($filtros, $filtrosDeSelecao)) || $filtros['favoritos'] === '1' || $filtros['ordem'] === 'za';
?>

<section class="biblioteca-exercicios" aria-labelledby="titulo-biblioteca-exercicios">
    <h1 id="titulo-biblioteca-exercicios">Biblioteca de exercícios</h1>

    <form method="get" class="filtros">
        <label>
            Buscar por nome
            <input
                type="search"
                name="q"
                maxlength="150"
                value="<?= $escapar($filtros['q']) ?>"
                placeholder="Nome em português ou inglês"
            >
        </label>

        <details class="catalogo-filtros"<?= $opcoesAtivas ? ' open' : '' ?>>
            <summary>Filtros e ordenação</summary>
            <div class="treino-campos">
                <?php foreach ($filtrosDeSelecao as $campoFiltro => $rotuloFiltro): ?>
                    <label>
                        <?= $escapar($rotuloFiltro) ?>
                        <select name="<?= $escapar($campoFiltro) ?>">
                            <option value="">Todos</option>
                            <?php foreach ($opcoes[$campoFiltro] as $opcaoFiltro): ?>
                                <option
                                    value="<?= $escapar($opcaoFiltro['id']) ?>"
                                    <?= (string) $opcaoFiltro['id'] === $filtros[$campoFiltro] ? 'selected' : '' ?>
                                >
                                    <?= $escapar($opcaoFiltro['nome']) ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </label>
                <?php endforeach; ?>

                <label class="biblioteca-filtro-favoritos">
                    <input type="checkbox" name="favoritos" value="1" <?= $filtros['favoritos'] === '1' ? 'checked' : '' ?>>
                    Somente favoritos
                </label>

                <label>
                    Ordenar
                    <select name="ordem">
                        <option value="az">Nome A–Z</option>
                        <option value="za" <?= $filtros['ordem'] === 'za' ? 'selected' : '' ?>>Nome Z–A</option>
                    </select>
                </label>
            </div>
        </details>
        <div class="treino-acoes">
            <button type="submit">Buscar</button>
            <?php if ($opcoesAtivas || $filtros['q'] !== ''): ?><a href="/exercicios">Limpar filtros</a><?php endif ?>
        </div>
    </form>

    <?php if ($resultado['total']): ?>
        <p><?= (int) $resultado['total'] ?> <?= $resultado['total'] === 1 ? 'exercício encontrado' : 'exercícios encontrados' ?> · Página <?= (int) $resultado['pagina'] ?> de <?= (int) $resultado['paginas'] ?></p>
    <?php endif ?>

    <div class="catalogo">
        <?php foreach ($resultado['itens'] as $exercicio): ?>
            <article>
                <h2>
                    <a href="/exercicios/ver?id=<?= (int) $exercicio['id'] ?>">
                        <?= $escapar($exercicio['nome']) ?>
                    </a>
                </h2>
                <p><?= $escapar($exercicio['grupo']) ?> · <?= $escapar($exercicio['equipamento']) ?></p>
                <p><?= $escapar($exercicio['registro']) ?> · <?= $escapar($exercicio['modalidade']) ?></p>
            </article>
        <?php endforeach; ?>
    </div>

    <?php if (!$resultado['total']): ?>
        <p><?= $opcoesAtivas || $filtros['q'] !== '' ? 'Nenhum exercício corresponde à busca. Tente outro nome ou ajuste os filtros.' : 'Nenhum exercício disponível na biblioteca.' ?></p>
    <?php endif; ?>

    <?php if ($resultado['paginas'] > 1): ?>
        <nav aria-label="Paginação" class="paginacao">
            <?php for (
                $numeroPagina = max(1, $resultado['pagina'] - 2);
                $numeroPagina <= min($resultado['paginas'], $resultado['pagina'] + 2);
                $numeroPagina++
            ): ?>
                <a
                    <?= $numeroPagina === $resultado['pagina'] ? 'aria-current="page"' : '' ?>
                    href="?<?= $escapar(http_build_query(array_merge($filtros, ['pagina' => $numeroPagina]))) ?>"
                ><?= $numeroPagina ?></a>
            <?php endfor; ?>
        </nav>
    <?php endif ?>
</section>
