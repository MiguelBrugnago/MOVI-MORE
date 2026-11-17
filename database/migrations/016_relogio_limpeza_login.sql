-- O registro e o corte usam o relógio do MySQL, sem depender do fuso do PHP.
ALTER EVENT limpar_tentativas_login
DO
    DELETE FROM tentativa_login
    WHERE criado_em < CURRENT_TIMESTAMP - INTERVAL 1 DAY;
