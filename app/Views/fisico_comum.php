<?php
$esc = static fn ($v) => htmlspecialchars((string)($v ?? ''), ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
$numero = static fn ($v) => $v === null ? 'Não informado' : number_format((float)$v, 2, ',', '.');
$medidas = \App\Services\PerfilFisicoService::MEDIDAS;
$metricas = ['peso' => $medidas['peso'], 'gordura' => $medidas['gordura'], 'massa_magra' => ['Massa magra estimada', 'kg'], 'massa_gorda' => ['Massa gorda estimada', 'kg']] + $medidas;
$csrf = $esc(\App\Security\Csrf::gerarToken());
?>
<?php if (!($somenteLeitura ?? false)): ?>
<nav class="treino-nav" aria-label="Perfil físico">
    <a href="/perfil">Meu perfil</a><a href="/perfil/avaliacoes">Avaliações</a><a href="/perfil/evolucao">Evolução corporal</a><a href="/vinculos">Compartilhamento</a>
</nav>
<?php endif; ?>
<?php if (!empty($mensagem)): ?><p class="treino-destaque" role="status"><?= $esc($mensagem) ?></p><?php endif; ?>
<?php if (!empty($erro)): ?><p class="fisico-erro" role="alert"><?= $esc($erro) ?></p><?php endif; ?>
