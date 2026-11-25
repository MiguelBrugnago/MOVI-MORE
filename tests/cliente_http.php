<?php
declare(strict_types=1);

/** Cria um cliente que mantém a sessão entre chamadas e confere o status esperado de cada resposta. */
$cliente = static function () {
    $ch = curl_init();
    curl_setopt_array($ch, [CURLOPT_RETURNTRANSFER => true, CURLOPT_COOKIEFILE => '', CURLOPT_HEADER => true, CURLOPT_TIMEOUT => 15]);
    return static function (string $url, int $esperado, ?array $post = null) use ($ch): string {
        curl_setopt($ch, CURLOPT_URL, 'http://127.0.0.1' . $url);
        if ($post === null) {
            curl_setopt($ch, CURLOPT_HTTPGET, true);
        } else {
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post));
        }
        $res = curl_exec($ch);
        $status = curl_getinfo($ch, CURLINFO_RESPONSE_CODE);
        if ($res === false || $status !== $esperado) {
            throw new RuntimeException("$url esperava HTTP $esperado, recebeu $status");
        }
        return (string)$res;
    };
};
/** Obtém o token do HTML da própria sessão para as alterações de perfil testadas. */
$token = static function (string $html): string {
    preg_match('/name="csrf_token"\s+value="([a-f0-9]+)"/', $html, $m);
    return $m[1] ?? throw new RuntimeException('Sem CSRF');
};
