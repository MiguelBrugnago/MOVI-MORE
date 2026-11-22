<?php
// Usa sessões HTTP distintas para exercitar avaliações, titularidade e consentimentos de leitura profissional no banco isolado.

declare(strict_types=1);
if (PHP_SAPI !== 'cli' || getenv('DB_NAME') !== 'movi_treinos_teste') {
    fwrite(STDERR, "Use somente movi_treinos_teste.\n");
    exit(1);
}
require dirname(__DIR__) . '/vendor/autoload.php';
use App\Config\Database;
use App\Repositories\PerfilFisicoRepository;
use App\Repositories\TreinoRepository;
use App\Repositories\VinculoProfissionalRepository;

/**
 * Interrompe a suíte ao encontrar uma condição falsa, identificando o cenário que falhou.
 *
 * @param bool $ok Resultado da afirmação testada.
 * @param string $nome Nome do cenário no relatório.
 * @throws RuntimeException Se a expectativa da suíte não for atendida.
 */
function conferir(bool $ok, string $nome): void
{
    if (!$ok) {
        throw new RuntimeException($nome);
    }
}
$db = new TreinoRepository(Database::conectar());
$fisico = new PerfilFisicoRepository(Database::conectar());
$vinculos = new VinculoProfissionalRepository();
$senha = 'Perfil-teste-123';
$sufixo = bin2hex(random_bytes(5));
$usuarios = [];
foreach (['aluno', 'outro', 'profissional'] as $papel) {
    $email = "$papel-$sufixo@example.test";
    $usuarios[$papel] = $db->inserir('usuario', ['nome' => $papel, 'email' => $email, 'senha_hash' => password_hash($senha, PASSWORD_DEFAULT)]);
}
// O cliente conserva os cookies entre chamadas e exige o status esperado antes de verificar o conteúdo do perfil.
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
        conferir(curl_getinfo($ch, CURLINFO_RESPONSE_CODE) === $esperado, "$url esperado $esperado: " . substr((string)$res, 0, 900));
        return (string)$res;
    };
};
/** Obtém o token do HTML da própria sessão para as alterações de perfil testadas. */
$token = static function (string $html): string {
    preg_match('/name="csrf_token" value="([a-f0-9]+)"/', $html, $m);
    return $m[1] ?? throw new RuntimeException('Sem CSRF');
};
$anon = $cliente();
foreach (['/perfil', '/perfil/avaliacoes', '/perfil/evolucao', '/perfil/avaliacoes/nova', '/perfil/avaliacoes/ver?id=1'] as $url) {
    $anon($url, 303);
}
$clientes = $csrf = [];
foreach ($usuarios as $papel => $id) {
    $h = $cliente();
    $c = $token($h('/login', 200));
    $h('/login', 303, ['csrf_token' => $c, 'email' => "$papel-$sufixo@example.test", 'senha' => $senha]);
    $csrf[$papel] = ['csrf_token' => $token($h('/perfil', 200))];
    $clientes[$papel] = $h;
}
$a = $clientes['aluno'];
$b = $clientes['outro'];
$p = $clientes['profissional'];
$ca = $csrf['aluno'];
$cb = $csrf['outro'];
$cp = $csrf['profissional'];
$a('/perfil', 403, ['acao' => 'perfil']);
$a('/perfil', 303, $ca + ['acao' => 'perfil', 'usuario_id' => $usuarios['outro'], 'objetivo' => 'Força', 'altura_cm' => '180', 'biografia' => 'SEGREDO SAUDE']);
conferir($fisico->perfil($usuarios['outro'])['objetivo'] === null, 'Isolamento do perfil');
$a('/perfil', 422, $ca + ['acao' => 'perfil', 'altura_cm' => ['180']]);
$a('/perfil', 303, $ca + ['acao' => 'declarar', 'tipo' => 'condicao', 'nome' => 'Condição privada teste']);
$a('/perfil', 303, $ca + ['acao' => 'declarar', 'tipo' => 'restricao', 'nome' => 'Restrição privada teste', 'observacao' => 'NOTA RESTRICAO']);
$base = ['acao' => 'avaliacao', 'avaliado_em' => '2026-01-02', 'peso' => '80', 'gordura' => '25', 'cintura' => '90', 'observacao' => '<script>alert(1)</script> NOTA PRIVADA'];
$a('/perfil/avaliacoes', 303, $ca + $base);
$id = (int)$fisico->historico($usuarios['aluno'])[0]['id'];
$a('/perfil/avaliacoes', 303, $ca + ['acao' => 'avaliacao', 'avaliado_em' => '2026-02-02', 'peso' => '78']);
$historico = $fisico->historico($usuarios['aluno']);
conferir(count($historico) === 2 && $historico[0]['medidas']['massa_magra'] === null, 'Histórico preservado e sem mistura de datas');
conferir($historico[1]['medidas']['massa_magra'] === 60.0, 'Massa magra correta');
$html = $a('/perfil/avaliacoes/ver?id=' . $id, 200);
conferir(!str_contains($html, '<script>alert(1)</script>') && str_contains($html, '&lt;script&gt;'), 'Escape XSS');
$b('/perfil/avaliacoes/ver?id=' . $id, 404);
$b('/perfil/avaliacoes', 404, $cb + ['id' => $id] + $base);
$b('/perfil/avaliacoes', 404, $cb + ['acao' => 'excluir', 'id' => $id, 'confirmar' => 'sim']);
$a('/perfil/avaliacoes', 422, $ca + ['acao' => 'excluir', 'id' => $id]);
$a('/perfil/avaliacoes', 422, $ca + ['id' => $id, 'peso' => '-1'] + $base);
conferir($fisico->avaliacao($usuarios['aluno'], $id)['medidas']['peso'] === 80.0, 'Edição inválida preserva dados');
$a('/perfil/avaliacoes', 303, $ca + ['id' => $id, 'peso' => '84'] + $base);
conferir($fisico->avaliacao($usuarios['aluno'], $id)['medidas']['massa_magra'] === 63.0, 'Correção recalcula composição');
// Simula falha de persistência após apagar as medidas antigas: a transação deve restaurá-las.
try {
    $fisico->salvarAvaliacao($usuarios['aluno'], $id, ['avaliado_em' => '2026-03-03', 'observacao' => 'não persistir', 'medidas' => ['peso' => 90, 'gordura' => 10000000000]]);
    throw new RuntimeException('Falha SQL esperada.');
} catch (PDOException) {
}
conferir($fisico->avaliacao($usuarios['aluno'], $id)['medidas']['peso'] === 84.0
    && $fisico->avaliacao($usuarios['aluno'], $id)['avaliado_em'] === '2026-01-02', 'Rollback de avaliação e medidas');
foreach (['30', '90', '6m', '1a', 'todos'] as $periodo) {
    $a('/perfil/evolucao?periodo=' . $periodo, 200);
}
$a('/perfil/evolucao?periodo[]=30', 422);
$p('/profissional/cadastro', 303, $cp + ['tipo' => 'Personal']);
$p('/alunos/visualizar?id=' . $usuarios['aluno'], 404);
$a('/vinculos/solicitar', 303, $ca + ['email' => "profissional-$sufixo@example.test"]);
$v = $vinculos->listar($usuarios['aluno'], false)[0]['id'];
$p('/alunos/visualizar?id=' . $usuarios['aluno'], 404);
$p('/vinculos/responder', 303, $cp + ['modo' => 'profissional', 'vinculo_id' => $v, 'acao' => 'aceitar']);
$url = '/alunos/visualizar?id=' . $usuarios['aluno'];
$html = $p($url, 200);
conferir(!str_contains($html, '84,00') && !str_contains($html, 'SEGREDO SAUDE'), 'Vínculo não concede acesso');
$b('/perfil', 404, $cb + ['acao' => 'permissao', 'id' => $v, 'categoria' => 'fisico', 'permitir' => '1']);
$p('/perfil', 404, $cp + ['acao' => 'permissao', 'id' => $v, 'categoria' => 'fisico', 'permitir' => '1']);
$a('/perfil', 303, $ca + ['acao' => 'permissao', 'id' => $v, 'categoria' => 'fisico', 'permitir' => '1']);
$html = $p($url, 200);
conferir(str_contains($html, '84,00') && !str_contains($html, 'NOTA PRIVADA') && !str_contains($html, 'SEGREDO SAUDE') && !str_contains($html, 'Condição privada teste'), 'Separação de saúde e medidas');
$a('/perfil', 303, $ca + ['acao' => 'permissao', 'id' => $v, 'categoria' => 'saude', 'permitir' => '1']);
$html = $p($url, 200);
conferir(str_contains($html, 'NOTA PRIVADA') && str_contains($html, 'SEGREDO SAUDE') && str_contains($html, 'Condição privada teste'), 'Saúde autorizada');
$db->consultar('UPDATE profissional SET ativo=0 WHERE usuario_id=?', [$usuarios['profissional']]);
$p($url, 403);
$db->consultar('UPDATE profissional SET ativo=1 WHERE usuario_id=?', [$usuarios['profissional']]);
$p('/perfil/avaliacoes', 404, $cp + ['id' => $id] + $base);
$a('/perfil', 303, $ca + ['acao' => 'permissao', 'id' => $v, 'categoria' => 'treinos', 'permitir' => '1']);
$p($url, 200);
$a('/perfil', 303, $ca + ['acao' => 'permissao', 'id' => $v, 'categoria' => 'fisico', 'permitir' => '0']);
$html = $p($url, 200);
conferir(!str_contains($html, '84,00') && str_contains($html, 'SEGREDO SAUDE') && str_contains($html, 'NOTA PRIVADA'), 'Permissões independentes após revogação');
$p('/vinculos/encerrar', 303, $cp + ['modo' => 'profissional', 'vinculo_id' => $v]);
$p($url, 404);
$a('/vinculos/solicitar', 303, $ca + ['email' => "profissional-$sufixo@example.test"]);
$p('/vinculos/responder', 303, $cp + ['modo' => 'profissional', 'vinculo_id' => $v, 'acao' => 'aceitar']);
conferir(!$vinculos->autorizado($usuarios['profissional'], $usuarios['aluno'], 'saude'), 'Renovação exige novo consentimento');
$a('/perfil/avaliacoes', 303, $ca + ['acao' => 'excluir', 'id' => $id, 'confirmar' => 'sim']);
$a('/perfil/avaliacoes/ver?id=' . $id, 404);
conferir(count($fisico->historico($usuarios['aluno'])) === 1, 'Exclusão isolada');
conferir((int)$db->consultar('SELECT COUNT(*) FROM medida WHERE avaliacao_id=?', [$id])->fetchColumn() === 0, 'Sem medidas órfãs');
echo "Perfil HTTP: CRUD, histórico, validação, CSRF, XSS, isolamento, consentimento, revogação e renovação OK.\n";
