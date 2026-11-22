<?php
// O controller escolhe a mensagem e o destino de retorno. Ambos passam pelo escape de HTML na renderização.

/**
 * @var string $mensagem
 * @var string $voltar
 * @var Closure $esc
 */
require __DIR__ . '/treinos/comum.php'; ?>
<h1>Não foi possível concluir</h1>
<p role="alert"><?= $esc($mensagem) ?></p>
<p><a href="<?= $esc($voltar) ?>">Voltar</a></p>