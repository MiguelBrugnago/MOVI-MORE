<?php

use App\Security\Csrf;
use App\Services\RegistroTreino;

$esc = static fn ($v) => htmlspecialchars((string) $v, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
$hidden = static function (array $fields) use ($esc): void {
    foreach (['csrf_token' => Csrf::gerarToken()] + $fields as $k => $v) {
        echo '<input type="hidden" name="' . $esc($k) . '" value="' . $esc($v) . '">';
    }
};
$texto = static function ($key, $label, $value, $max = 4000) use ($esc): void {
    echo '<label>' . $esc($label) . '<textarea name="' . $esc($key) . '" maxlength="' . $max . '" rows="2">' . $esc($value) . '</textarea></label>';
};
$num = static function ($key, $label, $value, $min, $max, $dec = 0) use ($esc): void {
    $step = $dec ? 10 ** -$dec : 1;
    echo '<label>' . $esc($label) . '<input type="number" inputmode="' . ($dec ? 'decimal' : 'numeric') . '" name="' . $esc($key) . '" value="' . $esc($value) . '" min="' . $min . '" max="' . $max . '" step="' . $step . '"></label>';
};
$select = static function ($key, $label, $options, $value) use ($esc): void {
    echo '<label>' . $esc($label) . '<select name="' . $esc($key) . '">';
    foreach ($options as $id => $nome) {
        echo '<option value="' . $esc($id) . '"' . ((string) $id === (string) $value ? ' selected' : '') . '>' . $esc($nome) . '</option>';
    }
    echo '</select></label>';
};
$duracao = static fn ($s) => $s === null ? '—' : sprintf('%02d:%02d:%02d', intdiv(max(0, (int) $s), 3600), intdiv(max(0, (int) $s), 60) % 60, max(0, (int) $s) % 60);
$fusoTreino = new DateTimeZone('America/Sao_Paulo');
$dataHora = static fn ($epoch, $formato = 'd/m/Y H:i') => $epoch === null ? '—' : (new DateTimeImmutable('@' . (int) $epoch))->setTimezone($fusoTreino)->format($formato);
$dias = ['' => 'Sem dia fixo', 1 => 'Segunda', 2 => 'Terça', 3 => 'Quarta', 4 => 'Quinta', 5 => 'Sexta', 6 => 'Sábado', 7 => 'Domingo'];
