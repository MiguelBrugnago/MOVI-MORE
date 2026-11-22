<?php

declare(strict_types=1);

namespace App\Models;

use InvalidArgumentException;

/**
 * Representa a referência a um exercício do catálogo dentro de uma rotina. O ID e o nome são
 * imutáveis e a mesma entidade pode aparecer em várias posições.
 */
final class Exercicio
{
    /**
     * Aceita um ID positivo e um nome com conteúdo para formar uma referência válida ao catálogo.
     *
     * @param int $id ID positivo do exercício já presente no catálogo.
     * @param string $nome Nome usado no cadastro ou na apresentação.
     * @throws InvalidArgumentException Exercício inválido.
     */
    public function __construct(private readonly int $id, private readonly string $nome)
    {
        if ($id < 1 || trim($nome) === '') {
            throw new InvalidArgumentException('Exercício inválido.');
        }
    }

    /**
     * Devolve a chave do catálogo usada ao gravar a associação com a rotina.
     *
     * @return int
     */
    public function id(): int
    {
        return $this->id;
    }

    /**
     * Expõe o nome recebido na criação do objeto.
     *
     * @return string
     */
    public function nome(): string
    {
        return $this->nome;
    }
}
