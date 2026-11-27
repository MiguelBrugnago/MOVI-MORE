<?php
// Mantém cookies separados por cliente para verificar as respostas reais das rotas, a proteção CSRF e o isolamento entre contas.

declare(strict_types=1);

if (PHP_SAPI !== 'cli' || getenv('DB_NAME') !== 'movi_treinos_teste') {
    fwrite(STDERR, "Use apenas o banco descartável movi_treinos_teste.\n");
    exit(1);
}
require dirname(__DIR__) . '/vendor/autoload.php';

$db = new App\Repositories\TreinoRepository(App\Config\Database::conectar());
$base = 'http://127.0.0.1:8088';
$senha = 'Teste-local-treino-123';
$cred = ['nome' => 'Teste HTTP', 'senha_hash' => password_hash($senha, PASSWORD_DEFAULT)];
$email = 'http-' . bin2hex(random_bytes(6)) . '@example.test';
$u = $db->inserir('usuario', $cred + ['email' => $email]);
$email2 = 'http-' . bin2hex(random_bytes(6)) . '@example.test';
$u2 = $db->inserir('usuario', $cred + ['email' => $email2]);
// Cada cliente reutiliza sua própria sessão cURL. A resposta é separada em corpo e cabeçalho para conferir o destino do 303.
/** Cria um cliente com cookies próprios que devolve corpo, redirecionamento e duração da requisição. */
$cliente = static function () use ($base): Closure {
    $ch = curl_init();
    curl_setopt_array($ch, [CURLOPT_RETURNTRANSFER => true, CURLOPT_COOKIEFILE => '', CURLOPT_HEADER => true, CURLOPT_TIMEOUT => 10]);
    return static function (string $url, int $esperado, ?array $dados = null, bool $json = false) use ($ch, $base): array {
        curl_setopt($ch, CURLOPT_URL, $base . $url);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $json ? ['Accept: application/json'] : []);
        if ($dados === null) {
            curl_setopt($ch, CURLOPT_HTTPGET, true);
        } else {
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($dados));
        }
        $start = hrtime(true);
        $resposta = curl_exec($ch);
        $status = curl_getinfo($ch, CURLINFO_RESPONSE_CODE);
        if ($status !== $esperado || $resposta === false) {
            throw new RuntimeException("$url: esperado $esperado, recebido $status " . substr((string)$resposta, 0, 1200));
        }
        $cabecalho = substr($resposta, 0, curl_getinfo($ch, CURLINFO_HEADER_SIZE));
        $body = substr($resposta, curl_getinfo($ch, CURLINFO_HEADER_SIZE));
        preg_match('/^Location: ([^\r\n]+)/mi', $cabecalho, $m);
        if (str_contains($body, 'Fatal error') || str_contains($body, 'Warning:')) {
            throw new RuntimeException($url . ': erro PHP no corpo.');
        }
        return [$body, $m[1] ?? '', (hrtime(true) - $start) / 1e6];
    };
};
/** Extrai do HTML o token do formulário recebido por este cliente ou interrompe o teste se faltar. */
$token = static function (string $html): string {
    if (!preg_match('/name="csrf_token"\s+value="([a-f0-9]+)"/', $html, $m)) {
        throw new RuntimeException('CSRF não encontrado.');
    }
    return $m[1];
};
/** Reproduz o login via formulário e devolve o token da sessão autenticada para os POSTs seguintes. */
$login = static function (Closure $http, string $email) use ($token, $senha): array {
    [$login] = $http('/login', 200);
    $http('/login', 303, ['csrf_token' => $token($login), 'email' => $email, 'senha' => $senha]);
    [$html] = $http('/rotinas', 200);
    return ['csrf_token' => $token($html)];
};

$http = $cliente();
$http('/treinos/historico', 303);
$http('/treinos/iniciar', 303, []);
$csrf = $login($http, $email);
$http('/rotinas', 403, ['nome' => 'Sem CSRF'], true);
$nome = '<img src=x onerror=alert(1)>';
[, $rotina] = $http('/rotinas', 303, $csrf + ['nome' => $nome, 'dia_semana' => 2]);
[$html] = $http($rotina, 200);
if (str_contains($html, $nome) || !str_contains($html, '&lt;img')) {
    throw new RuntimeException('Nome sem escaping.');
}
parse_str(parse_url($rotina, PHP_URL_QUERY), $ids);
$r = $ids['id'];
$e = $db->um("SELECT e.id FROM exercicio e JOIN tipo_registro tr ON tr.id=e.tipo_registro_id
    WHERE e.usuario_id IS NULL AND e.ativo=1 AND tr.natureza_carga='externa' AND tr.usa_repeticoes=1 LIMIT 1", []);
$picker = '/treinos/exercicios?rotina=' . $r . '&q=supino';
[,, $buscaFria] = $http($picker, 200);
[,, $buscaQuente] = $http($picker, 200);
$http($picker . '&musculo=1&ambiente=1', 200);
$http('/exercicios/ver?id=' . $e['id'], 200);
$http('/rotinas/adicionar', 303, $csrf + ['rotina_id' => $r, 'exercicio_id' => $e['id']]);
$x = $db->itens((int)$r, true)[0];
$http('/rotinas/salvar', 303, $csrf + ['rotina_id' => $r, 'item_id' => $x['id'], 'acao' => 'serie_adicionar', 'repeticoes_min' => 8, 'repeticoes_max' => 10, 'carga_alvo' => 30]);
[, $treino] = $http('/treinos/iniciar', 303, $csrf + ['rotina_id' => $r]);
[$paginaRotinas] = $http('/rotinas', 200);
if (!str_contains($paginaRotinas, 'Retomar:') || !str_contains($paginaRotinas, $treino)) {
    throw new RuntimeException('Sessão ativa não pode ser retomada na lista de rotinas.');
}
$http($treino, 200);
parse_str(parse_url($treino, PHP_URL_QUERY), $ids);
$t = (int)$ids['id'];
$exec = $db->itens($t, false)[0];
$s = $db->series($t, false)[$exec['id']][0];
$form = $csrf + ['treino_id' => $t, 'item_id' => $exec['id'], 'serie_id' => $s['id'], 'estado' => 'concluida', 'peso' => '32.50', 'repeticoes' => 8];
$http('/treinos/serie', 422, ['peso' => '-1'] + $form, true);
$rascunho = ['estado' => 'pendente', 'modo' => 'rascunho', 'peso' => '30.00'] + $form;
$http('/treinos/serie', 200, $rascunho, true);
if ($db->series($t, false)[$exec['id']][0]['peso'] !== '30.00') {
    throw new RuntimeException('Rascunho automático não persistiu.');
}
[$body] = $http('/treinos/serie', 200, $form, true);
$retorno = json_decode($body, true, 512, JSON_THROW_ON_ERROR);
if ($retorno['url'] !== $treino || !str_contains($retorno['serie'], 'data-estado="concluida"')) {
    throw new RuntimeException('Resposta assíncrona errada.');
}
$http('/treinos/serie', 409, $rascunho, true);
$nova = array_diff_key($form, ['serie_id' => null]) + ['chave' => bin2hex(random_bytes(16))];
[$body] = $http('/treinos/serie', 200, $nova, true);
if (!str_contains(json_decode($body, true, 512, JSON_THROW_ON_ERROR)['novaSerie'], 'Adicionar série')) {
    throw new RuntimeException('Editor de nova série ausente.');
}
[$html] = $http($treino, 200);
if (!str_contains($html, '32.50 kg')) {
    throw new RuntimeException('Recarga não restaurou a série.');
}
$http('/treinos/salvar', 200, $csrf + ['treino_id' => $t, 'acao' => 'descanso', 'segundos' => '90'], true);
$http('/treinos/finalizar', 303, $csrf + ['treino_id' => $t]);
[$html] = $http($treino, 200);
if (!str_contains($html, 'Recordes na data da sessão')) {
    throw new RuntimeException('Recordes não apareceram na sessão.');
}
// A série avulsa deve consultar sua própria posição na última sessão concluída.
[, $segundaSessao] = $http('/treinos/iniciar', 303, $csrf + ['rotina_id' => $r]);
[$html] = $http($segundaSessao, 200);
if (substr_count($html, 'Última sessão · série 1') !== 1 || !str_contains($html, 'Última sessão · série 2')) {
    throw new RuntimeException('Referência incorreta na série planejada ou na próxima série.');
}
parse_str(parse_url($segundaSessao, PHP_URL_QUERY), $segunda);
$itemAtual = $db->itens((int)$segunda['id'], false)[0];
[$body] = $http('/treinos/serie', 200, ['treino_id' => $segunda['id'], 'item_id' => $itemAtual['id'],
    'chave' => bin2hex(random_bytes(16))] + $nova, true);
$fragmento = json_decode($body, true, 512, JSON_THROW_ON_ERROR)['novaSerie'];
if (str_contains($fragmento, 'Usar valores anteriores')) {
    throw new RuntimeException('A terceira série recebeu uma referência inexistente.');
}
$http('/treinos/salvar', 303, $csrf + ['treino_id' => $segunda['id'], 'acao' => 'cancelar']);
[,, $hist] = $http('/treinos/historico', 200);
[,, $stats] = $http('/treinos/estatisticas?exercicio=' . $e['id'], 200);
$http('/treinos/personalizados', 200);
$estranho = $cliente();
$csrf2 = $login($estranho, $email2);
$estranho($rotina, 404);
$estranho($treino, 404);
$estranho('/treinos/serie', 404, $csrf2 + $form, true);
$http('/treinos/salvar', 303, $csrf + ['treino_id' => $t, 'acao' => 'excluir']);
$http($treino, 404);

// Exercita cadastro profissional, a transição de um vínculo e a visibilidade de alunos.
$http('/alunos', 403);
$estranho('/alunos', 403);
$http('/profissional/cadastro', 200);
$http('/profissional/cadastro', 403, ['tipo' => 'Personal Trainer']);
$http('/profissional/cadastro', 422, $csrf + ['tipo' => ['Personal Trainer']]);
$http('/profissional/cadastro', 303, $csrf + ['tipo' => 'Personal Trainer', 'especialidade' => 'Força']);
$http('/alunos', 200);
$http('/alunos/visualizar?id=' . $u2, 404);
$estranho('/vinculos/solicitar', 303, $csrf2 + ['email' => $email]);
[$pendentes] = $http('/vinculos?modo=profissional', 200);
if (!preg_match('/name="vinculo_id" value="([1-9][0-9]*)"/', $pendentes, $v)) {
    throw new RuntimeException('Solicitação de vínculo não aparece para o profissional.');
}
$http('/vinculos/responder', 303, $csrf + ['modo' => 'profissional', 'vinculo_id' => $v[1], 'acao' => 'aceitar']);
[$alunos] = $http('/alunos', 200);
if (!str_contains($alunos, $email2)) {
    throw new RuntimeException('Aluno vinculado não aparece.');
}
$http('/alunos/visualizar?id=' . $u2, 200);
$estranho('/alunos/visualizar?id=' . $u, 403);

// O profissional monta a proposta no editor e o aluno revisa a versão enviada antes do aceite.
$http('/profissional/modelos', 200);
$estranho('/profissional/modelos', 403);
$salvarModelo = '/profissional/modelos/salvar';
[, $editor] = $http($salvarModelo, 303, $csrf + ['acao' => 'criar', 'nome' => $nome, 'objetivo' => 'Força']);
parse_str(parse_url($editor, PHP_URL_QUERY), $modelo);
$dadosModelo = ['rotina_id' => $modelo['id']];
[$detalhesExercicio] = $http('/exercicios/ver?id=' . $e['id'], 200);
if (str_contains($detalhesExercicio, '<option value="' . $modelo['id'] . '">')) {
    throw new RuntimeException('Modelo profissional apareceu como destino em uma rotina pessoal.');
}
$http('/treinos/exercicios?rotina=' . $modelo['id'], 200);
$http($salvarModelo, 303, $csrf + $dadosModelo + ['acao' => 'adicionar', 'exercicio_id' => $e['id']]);
[$htmlModelo] = $http($editor, 200);
if (!preg_match('/name="chave" value="([a-f0-9]{32})"/', $htmlModelo, $envio)) {
    throw new RuntimeException('O editor não apresentou o formulário de envio.');
}
$formEnvio = $dadosModelo + ['aluno_id' => $u2, 'chave' => $envio[1]];
$http('/profissional/propostas/enviar', 403, $formEnvio);
[, $enviada] = $http('/profissional/propostas/enviar', 303, $csrf + $formEnvio);
$http($enviada, 200);
$estranho($enviada, 403);
parse_str(parse_url($enviada, PHP_URL_QUERY), $proposta);
$detalhe = '/propostas?id=' . $proposta['id'];
$http($detalhe, 404);
[$recebida] = $estranho($detalhe, 200);
if (str_contains($recebida, $nome) || !str_contains($recebida, '&lt;img') || !str_contains($recebida, 'Força')) {
    throw new RuntimeException('Conteúdo ou escape incorreto na proposta.');
}
$resposta = ['proposta_id' => $proposta['id'], 'acao' => 'aceitar'];
$estranho('/propostas/responder', 403, $resposta);
$http('/propostas/responder', 404, $csrf + $resposta);
$estranho('/propostas/responder', 303, $csrf2 + $resposta);
$estranho('/propostas/responder', 303, $csrf2 + $resposta);
[$recebida] = $estranho($detalhe, 200);
if (!str_contains($recebida, 'Abrir minha rotina')) {
    throw new RuntimeException('Faltou o link para a rotina aceita.');
}
$http('/profissional/propostas?aluno=' . $u2, 200);
$estranho('/propostas?pendentes=1', 200);
$http('/vinculos/encerrar', 303, $csrf + ['modo' => 'profissional', 'vinculo_id' => $v[1]]);
$http('/alunos/visualizar?id=' . $u2, 404);
$http('/logout', 303, $csrf);
$http('/alunos', 303);

$novo = $cliente();
[$cadastro] = $novo('/cadastro', 200);
$novoEmail = 'cadastro-' . bin2hex(random_bytes(6)) . '@example.test';
foreach (["senha\0invalida", str_repeat('🔐', 19)] as $invalida) {
    $novo('/cadastro', 422, ['csrf_token' => $token($cadastro), 'nome' => 'Cadastro HTTP', 'email' => $novoEmail, 'senha' => $invalida, 'confirmar_senha' => $invalida]);
}
[$sucessoCadastro] = $novo('/cadastro', 201, ['csrf_token' => $token($cadastro), 'nome' => 'Cadastro HTTP', 'email' => $novoEmail, 'senha' => $senha, 'confirmar_senha' => $senha]);
if (!str_contains($sucessoCadastro, 'href="/login"')) {
    throw new RuntimeException('Cadastro concluído sem acesso ao login.');
}
$login($novo, $novoEmail);

// MySQL e PHP em fusos diferentes: a janela deve usar o relógio que gravou a tentativa.
$pdo = App\Config\Database::conectar();
$pdo->exec("SET time_zone = '+09:00'");
date_default_timezone_set('Pacific/Honolulu');
$limiteEmail = 'janela-' . bin2hex(random_bytes(6)) . '@example.test';
$ip = 'janela-' . bin2hex(random_bytes(6));
$antiga = $pdo->prepare('INSERT INTO tentativa_login (identificador,ip_hash,criado_em)
    VALUES (?,?,CURRENT_TIMESTAMP - INTERVAL 16 MINUTE)');
for ($i = 0; $i < 5; $i++) {
    $antiga->execute([hash('sha256', $limiteEmail), hash('sha256', $ip)]);
}
$limiter = new App\Security\LoginLimiter($limiteEmail, $ip);
if ($limiter->bloqueado()) {
    throw new RuntimeException('Tentativas antigas entraram na janela.');
}
for ($i = 0; $i < 5; $i++) {
    $limiter->registrarFalha();
}
if (!$limiter->bloqueado()) {
    throw new RuntimeException('Cinco falhas recentes não bloquearam.');
}
echo "Cadastro, vínculos, alunos, logout e janela de login OK.\n";

printf("HTTP: pesquisa inicial %.1f ms, aquecida %.1f ms; histórico %.1f ms; estatísticas %.1f ms.\n", $buscaFria, $buscaQuente, $hist, $stats);
echo "Fluxo HTTP, CSRF, XSS, isolamento e salvamento assíncrono OK.\n";
