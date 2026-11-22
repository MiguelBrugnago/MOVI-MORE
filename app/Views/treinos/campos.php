<?php
// Os auxiliares abaixo escapam valores e incluem o token da sessão nos formulários de treino.

use App\Security\Csrf;

/** Escapa o valor no momento de inseri-lo em texto ou em um atributo HTML. */
$esc = static fn ($v) => htmlspecialchars((string) $v, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
// O token da sessão tem precedência sobre qualquer campo com o mesmo nome fornecido pela view.
/** Escreve os campos ocultos de identificação e o token de segurança usados no POST. */
$hidden = static function (array $fields) use ($esc): void {
    foreach (['csrf_token' => Csrf::gerarToken()] + $fields as $k => $v) {
        echo '<input type="hidden" name="' . $esc($k) . '" value="' . $esc($v) . '">';
    }
};
/** Renderiza uma área de texto com rótulo, valor escapado e limite de caracteres. */
$texto = static function ($key, $label, $value, $max = 4000) use ($esc): void {
    echo '<label>' . $esc($label) . '<textarea name="' . $esc($key) . '" maxlength="' . $max . '" rows="2">' . $esc($value) . '</textarea></label>';
};
// A precisão define o passo do input numérico. O serviço volta a validar o valor no recebimento.
/** Renderiza um campo numérico com limites e passo compatíveis com a precisão da métrica. */
$num = static function ($key, $label, $value, $min, $max, $dec = 0) use ($esc): void {
    $step = $dec ? 10 ** -$dec : 1;
    echo '<label>' . $esc($label) . '<input type="number" inputmode="' . ($dec ? 'decimal' : 'numeric') . '" name="' . $esc($key) . '" value="' . $esc($value) . '" min="' . $min . '" max="' . $max . '" step="' . $step . '"></label>';
};
// A comparação como texto mantém a opção selecionada mesmo quando o ID veio do POST como string.
/** Renderiza pares de valor e rótulo, marcando a opção já gravada no registro. */
$select = static function ($key, $label, $options, $value) use ($esc): void {
    echo '<label>' . $esc($label) . '<select name="' . $esc($key) . '">';
    foreach ($options as $id => $nome) {
        echo '<option value="' . $esc($id) . '"' . ((string) $id === (string) $value ? ' selected' : '') . '>' . $esc($nome) . '</option>';
    }
    echo '</select></label>';
};
/** Converte a duração em segundos para horas, minutos e segundos, indicando ausência com um travessão. */
$duracao = static fn ($s) => $s === null ? '—' : sprintf('%02d:%02d:%02d', intdiv(max(0, (int) $s), 3600), intdiv(max(0, (int) $s), 60) % 60, max(0, (int) $s) % 60);
$fusoTreino = new DateTimeZone('America/Sao_Paulo');
/** Converte o instante Unix para o fuso de São Paulo e aplica a máscara solicitada. */
$dataHora = static fn ($epoch, $formato = 'd/m/Y H:i') => $epoch === null ? '—' : (new DateTimeImmutable('@' . (int) $epoch))->setTimezone($fusoTreino)->format($formato);
$dias = ['' => 'Sem dia fixo', 1 => 'Segunda', 2 => 'Terça', 3 => 'Quarta', 4 => 'Quinta', 5 => 'Sexta', 6 => 'Sábado', 7 => 'Domingo'];
