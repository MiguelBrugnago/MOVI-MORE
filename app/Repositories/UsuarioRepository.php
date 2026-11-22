<?php

declare(strict_types=1);

namespace App\Repositories;

use App\Config\Database;
use PDO;

/**
 * Persiste contas e oferece projeções distintas para login e sessão. AuthController consulta o hash
 * de senha por e-mail e Auth recarrega somente os dados necessários à sessão.
 */
final class UsuarioRepository
{
    private PDO $pdo;

    /**
     * Obtém a conexão PDO usada para as operações sobre a tabela usuario.
     */
    public function __construct()
    {
        $this->pdo = Database::conectar();
    }

    /**
     * Retorna a conta correspondente ao e-mail com o hash utilizado por password_verify, ou null.
     *
     * @param string $email Endereço de e-mail da conta.
     * @return array{id:int,nome:string,email:string,senha_hash:string,ativo:int}|null
     */
    public function buscarPorEmail(string $email): ?array
    {
        $sql = 'SELECT id, nome, email, senha_hash, ativo
                FROM usuario
                WHERE email = :email
                LIMIT 1';

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['email' => $email]);

        $usuario = $stmt->fetch();

        return $usuario === false ? null : $usuario;
    }

    /**
     * Insere nome, e-mail e hash já calculado e devolve o ID da nova conta.
     *
     * @param string $nome Nome usado no cadastro ou na apresentação.
     * @param string $email Endereço de e-mail da conta.
     * @param string $senhaHash Hash produzido no cadastro antes da inserção.
     * @return int
     */
    public function cadastrar(string $nome, string $email, string $senhaHash): int
    {
        $sql = 'INSERT INTO usuario (nome, email, senha_hash)
                VALUES (:nome, :email, :senha_hash)';

        $stmt = $this->pdo->prepare($sql);

        $stmt->execute([
            'nome' => $nome,
            'email' => $email,
            'senha_hash' => $senhaHash
        ]);

        return (int) $this->pdo->lastInsertId();
    }

    /**
     * Busca os campos da conta usados pela sessão ou devolve null se não houver correspondência.
     *
     * @param int $id Identificador do registro consultado ou alterado.
     * @return array{id:int,nome:string,email:string,ativo:int}|null
     */
    public function buscarPorId(int $id): ?array
    {
        $stmt = $this->pdo->prepare(
            'SELECT id, nome, email, ativo
         FROM usuario
         WHERE id = :id
         LIMIT 1'
        );

        $stmt->execute(['id' => $id]);

        // A consulta por ID atende à sessão e não seleciona o hash reservado à autenticação com senha.
        $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

        return $usuario === false ? null : $usuario;
    }
}
