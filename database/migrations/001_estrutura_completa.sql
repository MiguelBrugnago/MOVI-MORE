CREATE TABLE
  IF NOT EXISTS `usuario` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `nivel_id` INT,
    `nome` VARCHAR(150) NOT NULL,
    `apelido` VARCHAR(80),
    `email` VARCHAR(150) NOT NULL UNIQUE,
    `senha_hash` VARCHAR(255) NOT NULL,
    `data_nascimento` DATE,
    `foto` VARCHAR(255),
    `ativo` BOOLEAN NOT NULL DEFAULT TRUE,
    `criado_em` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ultimo_acesso` DATETIME
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `perfil` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `usuario_id` INT NOT NULL UNIQUE,
    `genero` VARCHAR(40),
    `objetivo` VARCHAR(60),
    `experiencia` VARCHAR(40),
    `frequencia_semanal` INT,
    `biografia` TEXT
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `profissional` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `usuario_id` INT NOT NULL UNIQUE,
    `tipo` VARCHAR(60) NOT NULL,
    `registro_profissional` VARCHAR(80),
    `especialidade` VARCHAR(120),
    `descricao` TEXT,
    `verificado` BOOLEAN NOT NULL DEFAULT FALSE,
    `ativo` BOOLEAN NOT NULL DEFAULT TRUE
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `vinculo_profissional` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `profissional_id` INT NOT NULL,
    `aluno_id` INT NOT NULL,
    `status` VARCHAR(30) NOT NULL,
    `iniciado_em` DATETIME,
    `encerrado_em` DATETIME,
    UNIQUE KEY `uq_vinculo_profissional_1` (`profissional_id`, `aluno_id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `permissao_acesso` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `vinculo_profissional_id` INT NOT NULL,
    `categoria_dados` VARCHAR(60) NOT NULL,
    `permitido` BOOLEAN NOT NULL DEFAULT FALSE,
    `concedido_em` DATETIME,
    `revogado_em` DATETIME,
    UNIQUE KEY `uq_permissao_acesso_1` (`vinculo_profissional_id`, `categoria_dados`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `auditoria_acesso` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `usuario_id` INT NOT NULL,
    `aluno_id` INT NOT NULL,
    `recurso` VARCHAR(100) NOT NULL,
    `acao` VARCHAR(40) NOT NULL,
    `acessado_em` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `equipamento` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `nome` VARCHAR(120) NOT NULL UNIQUE,
    `descricao` TEXT
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `exercicio` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `usuario_id` INT,
    `equipamento_id` INT,
    `nome` VARCHAR(150) NOT NULL,
    `descricao` TEXT,
    `instrucoes` TEXT,
    `categoria` VARCHAR(60),
    `dificuldade` VARCHAR(40),
    `tipo` VARCHAR(40),
    `unilateral` BOOLEAN NOT NULL DEFAULT FALSE,
    `midia` VARCHAR(255),
    `ativo` BOOLEAN NOT NULL DEFAULT TRUE,
    `criado_em` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `musculo` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL UNIQUE,
    `grupo` VARCHAR(100),
    `regiao` VARCHAR(50),
    `svg_id` VARCHAR(100)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `exercicio_musculo` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `exercicio_id` INT NOT NULL,
    `musculo_id` INT NOT NULL,
    `papel` VARCHAR(30) NOT NULL,
    `peso_estimado` DECIMAL(4, 2),
    UNIQUE KEY `uq_exercicio_musculo_1` (`exercicio_id`, `musculo_id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `exercicio_favorito` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `usuario_id` INT NOT NULL,
    `exercicio_id` INT NOT NULL,
    UNIQUE KEY `uq_exercicio_favorito_1` (`usuario_id`, `exercicio_id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `ambiente` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `nome` VARCHAR(80) NOT NULL UNIQUE,
    `descricao` TEXT
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `exercicio_ambiente` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `exercicio_id` INT NOT NULL,
    `ambiente_id` INT NOT NULL,
    UNIQUE KEY `uq_exercicio_ambiente_1` (`exercicio_id`, `ambiente_id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `rotina` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `usuario_id` INT NOT NULL,
    `profissional_id` INT,
    `nome` VARCHAR(150) NOT NULL,
    `descricao` TEXT,
    `objetivo` VARCHAR(80),
    `ativa` BOOLEAN NOT NULL DEFAULT TRUE,
    `criado_em` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `rotina_exercicio` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `rotina_id` INT NOT NULL,
    `exercicio_id` INT NOT NULL,
    `ordem` INT NOT NULL,
    `descanso_segundos` INT,
    `observacao` TEXT,
    UNIQUE KEY `uq_rotina_exercicio_1` (`rotina_id`, `ordem`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `rotina_serie` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `rotina_exercicio_id` INT NOT NULL,
    `numero` INT NOT NULL,
    `repeticoes_min` INT,
    `repeticoes_max` INT,
    `carga_alvo` DECIMAL(8, 2),
    `rir_alvo` INT,
    `duracao_alvo_segundos` INT,
    `distancia_alvo_metros` DECIMAL(10, 2),
    `tipo` VARCHAR(40),
    UNIQUE KEY `uq_rotina_serie_1` (`rotina_exercicio_id`, `numero`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `treino` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `usuario_id` INT NOT NULL,
    `rotina_id` INT,
    `nome` VARCHAR(150),
    `status` VARCHAR(30) NOT NULL,
    `iniciado_em` DATETIME NOT NULL,
    `finalizado_em` DATETIME,
    `observacao` TEXT
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `treino_exercicio` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `treino_id` INT NOT NULL,
    `exercicio_id` INT NOT NULL,
    `ordem` INT NOT NULL,
    `observacao` TEXT,
    UNIQUE KEY `uq_treino_exercicio_1` (`treino_id`, `ordem`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `serie` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `treino_exercicio_id` INT NOT NULL,
    `numero` INT NOT NULL,
    `peso` DECIMAL(8, 2),
    `repeticoes` INT,
    `duracao_segundos` INT,
    `distancia_metros` DECIMAL(10, 2),
    `rir` INT,
    `tipo` VARCHAR(40),
    `concluida` BOOLEAN NOT NULL DEFAULT FALSE,
    UNIQUE KEY `uq_serie_1` (`treino_exercicio_id`, `numero`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `alimento` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `nome` VARCHAR(150) NOT NULL,
    `categoria` VARCHAR(80),
    `calorias_100g` DECIMAL(8, 2) NOT NULL,
    `proteinas_100g` DECIMAL(8, 2) NOT NULL,
    `carboidratos_100g` DECIMAL(8, 2) NOT NULL,
    `gorduras_100g` DECIMAL(8, 2) NOT NULL,
    `fibras_100g` DECIMAL(8, 2),
    `fonte_dados` VARCHAR(120),
    `ativo` BOOLEAN NOT NULL DEFAULT TRUE
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `plano_alimentar` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `usuario_id` INT NOT NULL,
    `profissional_id` INT,
    `nome` VARCHAR(150) NOT NULL,
    `objetivo` VARCHAR(80),
    `calorias_alvo` DECIMAL(8, 2),
    `proteinas_alvo` DECIMAL(8, 2),
    `carboidratos_alvo` DECIMAL(8, 2),
    `gorduras_alvo` DECIMAL(8, 2),
    `data_inicio` DATE,
    `data_fim` DATE,
    `ativo` BOOLEAN NOT NULL DEFAULT TRUE
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `refeicao` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `plano_alimentar_id` INT NOT NULL,
    `nome` VARCHAR(120) NOT NULL,
    `horario_previsto` TIME,
    `ordem` INT NOT NULL,
    `observacao` TEXT,
    UNIQUE KEY `uq_refeicao_1` (`plano_alimentar_id`, `ordem`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `refeicao_alimento` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `refeicao_id` INT NOT NULL,
    `alimento_id` INT NOT NULL,
    `quantidade_gramas` DECIMAL(8, 2) NOT NULL,
    UNIQUE KEY `uq_refeicao_alimento_1` (`refeicao_id`, `alimento_id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `registro_alimentar` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `usuario_id` INT NOT NULL,
    `alimento_id` INT,
    `refeicao_id` INT,
    `nome_refeicao` VARCHAR(120),
    `alimento_nome_snapshot` VARCHAR(150) NOT NULL,
    `quantidade_gramas` DECIMAL(8, 2) NOT NULL,
    `calorias_total` DECIMAL(9, 2) NOT NULL,
    `proteinas_total` DECIMAL(9, 2) NOT NULL,
    `carboidratos_total` DECIMAL(9, 2) NOT NULL,
    `gorduras_total` DECIMAL(9, 2) NOT NULL,
    `consumido_em` DATETIME NOT NULL,
    `observacao` TEXT
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `preferencia_alimentar` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL UNIQUE,
    `categoria` VARCHAR(50) NOT NULL,
    `descricao` TEXT
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `usuario_preferencia_alimentar` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `usuario_id` INT NOT NULL,
    `preferencia_alimentar_id` INT NOT NULL,
    `observacao` TEXT,
    UNIQUE KEY `uq_usuario_preferencia_alimentar_1` (`usuario_id`, `preferencia_alimentar_id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `avaliacao` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `usuario_id` INT NOT NULL,
    `profissional_id` INT,
    `metodo` VARCHAR(100),
    `avaliado_em` DATETIME NOT NULL,
    `observacao` TEXT
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `medida` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `usuario_id` INT NOT NULL,
    `avaliacao_id` INT,
    `tipo` VARCHAR(70) NOT NULL,
    `valor` DECIMAL(10, 3) NOT NULL,
    `unidade` VARCHAR(20) NOT NULL,
    `registrado_em` DATETIME NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `condicao` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `nome` VARCHAR(120) NOT NULL UNIQUE,
    `categoria` VARCHAR(70),
    `descricao` TEXT
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `usuario_condicao` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `usuario_id` INT NOT NULL,
    `condicao_id` INT NOT NULL,
    `status` VARCHAR(40),
    `origem` VARCHAR(60),
    `declarado_em` DATETIME,
    UNIQUE KEY `uq_usuario_condicao_1` (`usuario_id`, `condicao_id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `restricao` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `nome` VARCHAR(120) NOT NULL UNIQUE,
    `descricao` TEXT
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `usuario_restricao` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `usuario_id` INT NOT NULL,
    `restricao_id` INT NOT NULL,
    `gravidade` VARCHAR(40),
    `observacao` TEXT,
    `registrado_em` DATETIME,
    UNIQUE KEY `uq_usuario_restricao_1` (`usuario_id`, `restricao_id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `meta` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `usuario_id` INT NOT NULL,
    `tipo` VARCHAR(60) NOT NULL,
    `valor_alvo` DECIMAL(10, 2) NOT NULL,
    `data_inicio` DATE NOT NULL,
    `data_fim` DATE,
    `status` VARCHAR(30) NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `xp` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `usuario_id` INT NOT NULL,
    `treino_id` INT,
    `pontos` INT NOT NULL,
    `motivo` VARCHAR(100) NOT NULL,
    `chave_evento` VARCHAR(120) NOT NULL UNIQUE,
    `criado_em` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `nivel` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `numero` INT NOT NULL UNIQUE,
    `nome` VARCHAR(70) NOT NULL,
    `xp_minimo` INT NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `conquista` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `nome` VARCHAR(120) NOT NULL,
    `descricao` TEXT,
    `icone` VARCHAR(255),
    `criterio` VARCHAR(100),
    `valor_alvo` INT,
    `xp_recompensa` INT
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `usuario_conquista` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `usuario_id` INT NOT NULL,
    `conquista_id` INT NOT NULL,
    `desbloqueado_em` DATETIME NOT NULL,
    UNIQUE KEY `uq_usuario_conquista_1` (`usuario_id`, `conquista_id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE
  IF NOT EXISTS `local_atividade` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `ambiente_id` INT NOT NULL,
    `usuario_id` INT,
    `nome` VARCHAR(150) NOT NULL,
    `descricao` TEXT,
    `endereco` VARCHAR(255),
    `cidade` VARCHAR(100),
    `estado` CHAR(2),
    `latitude` DECIMAL(10, 7),
    `longitude` DECIMAL(10, 7),
    `publico` BOOLEAN NOT NULL DEFAULT TRUE,
    `ativo` BOOLEAN NOT NULL DEFAULT TRUE
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

ALTER TABLE `perfil` ADD CONSTRAINT `fk_perfil_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `profissional` ADD CONSTRAINT `fk_profissional_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `vinculo_profissional` ADD CONSTRAINT `fk_vinculo_profissional_profissional_id` FOREIGN KEY (`profissional_id`) REFERENCES `profissional` (`id`);

ALTER TABLE `vinculo_profissional` ADD CONSTRAINT `fk_vinculo_profissional_aluno_id` FOREIGN KEY (`aluno_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `permissao_acesso` ADD CONSTRAINT `fk_permissao_acesso_vinculo_profissional_id` FOREIGN KEY (`vinculo_profissional_id`) REFERENCES `vinculo_profissional` (`id`);

ALTER TABLE `auditoria_acesso` ADD CONSTRAINT `fk_auditoria_acesso_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `auditoria_acesso` ADD CONSTRAINT `fk_auditoria_acesso_aluno_id` FOREIGN KEY (`aluno_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `exercicio` ADD CONSTRAINT `fk_exercicio_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `exercicio` ADD CONSTRAINT `fk_exercicio_equipamento_id` FOREIGN KEY (`equipamento_id`) REFERENCES `equipamento` (`id`);

ALTER TABLE `exercicio_musculo` ADD CONSTRAINT `fk_exercicio_musculo_exercicio_id` FOREIGN KEY (`exercicio_id`) REFERENCES `exercicio` (`id`);

ALTER TABLE `exercicio_musculo` ADD CONSTRAINT `fk_exercicio_musculo_musculo_id` FOREIGN KEY (`musculo_id`) REFERENCES `musculo` (`id`);

ALTER TABLE `exercicio_favorito` ADD CONSTRAINT `fk_exercicio_favorito_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `exercicio_favorito` ADD CONSTRAINT `fk_exercicio_favorito_exercicio_id` FOREIGN KEY (`exercicio_id`) REFERENCES `exercicio` (`id`);

ALTER TABLE `exercicio_ambiente` ADD CONSTRAINT `fk_exercicio_ambiente_exercicio_id` FOREIGN KEY (`exercicio_id`) REFERENCES `exercicio` (`id`);

ALTER TABLE `exercicio_ambiente` ADD CONSTRAINT `fk_exercicio_ambiente_ambiente_id` FOREIGN KEY (`ambiente_id`) REFERENCES `ambiente` (`id`);

ALTER TABLE `rotina` ADD CONSTRAINT `fk_rotina_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `rotina` ADD CONSTRAINT `fk_rotina_profissional_id` FOREIGN KEY (`profissional_id`) REFERENCES `profissional` (`id`);

ALTER TABLE `rotina_exercicio` ADD CONSTRAINT `fk_rotina_exercicio_rotina_id` FOREIGN KEY (`rotina_id`) REFERENCES `rotina` (`id`);

ALTER TABLE `rotina_exercicio` ADD CONSTRAINT `fk_rotina_exercicio_exercicio_id` FOREIGN KEY (`exercicio_id`) REFERENCES `exercicio` (`id`);

ALTER TABLE `rotina_serie` ADD CONSTRAINT `fk_rotina_serie_rotina_exercicio_id` FOREIGN KEY (`rotina_exercicio_id`) REFERENCES `rotina_exercicio` (`id`);

ALTER TABLE `treino` ADD CONSTRAINT `fk_treino_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `treino` ADD CONSTRAINT `fk_treino_rotina_id` FOREIGN KEY (`rotina_id`) REFERENCES `rotina` (`id`);

ALTER TABLE `treino_exercicio` ADD CONSTRAINT `fk_treino_exercicio_treino_id` FOREIGN KEY (`treino_id`) REFERENCES `treino` (`id`);

ALTER TABLE `treino_exercicio` ADD CONSTRAINT `fk_treino_exercicio_exercicio_id` FOREIGN KEY (`exercicio_id`) REFERENCES `exercicio` (`id`);

ALTER TABLE `serie` ADD CONSTRAINT `fk_serie_treino_exercicio_id` FOREIGN KEY (`treino_exercicio_id`) REFERENCES `treino_exercicio` (`id`);

ALTER TABLE `plano_alimentar` ADD CONSTRAINT `fk_plano_alimentar_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `plano_alimentar` ADD CONSTRAINT `fk_plano_alimentar_profissional_id` FOREIGN KEY (`profissional_id`) REFERENCES `profissional` (`id`);

ALTER TABLE `refeicao` ADD CONSTRAINT `fk_refeicao_plano_alimentar_id` FOREIGN KEY (`plano_alimentar_id`) REFERENCES `plano_alimentar` (`id`);

ALTER TABLE `refeicao_alimento` ADD CONSTRAINT `fk_refeicao_alimento_refeicao_id` FOREIGN KEY (`refeicao_id`) REFERENCES `refeicao` (`id`);

ALTER TABLE `refeicao_alimento` ADD CONSTRAINT `fk_refeicao_alimento_alimento_id` FOREIGN KEY (`alimento_id`) REFERENCES `alimento` (`id`);

ALTER TABLE `registro_alimentar` ADD CONSTRAINT `fk_registro_alimentar_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `registro_alimentar` ADD CONSTRAINT `fk_registro_alimentar_alimento_id` FOREIGN KEY (`alimento_id`) REFERENCES `alimento` (`id`);

ALTER TABLE `registro_alimentar` ADD CONSTRAINT `fk_registro_alimentar_refeicao_id` FOREIGN KEY (`refeicao_id`) REFERENCES `refeicao` (`id`);

ALTER TABLE `usuario_preferencia_alimentar` ADD CONSTRAINT `fk_usuario_preferencia_alimentar_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `usuario_preferencia_alimentar` ADD CONSTRAINT `fk_usuario_preferencia_alimentar_preferencia_alimentar_id` FOREIGN KEY (`preferencia_alimentar_id`) REFERENCES `preferencia_alimentar` (`id`);

ALTER TABLE `avaliacao` ADD CONSTRAINT `fk_avaliacao_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `avaliacao` ADD CONSTRAINT `fk_avaliacao_profissional_id` FOREIGN KEY (`profissional_id`) REFERENCES `profissional` (`id`);

ALTER TABLE `medida` ADD CONSTRAINT `fk_medida_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `medida` ADD CONSTRAINT `fk_medida_avaliacao_id` FOREIGN KEY (`avaliacao_id`) REFERENCES `avaliacao` (`id`);

ALTER TABLE `usuario_condicao` ADD CONSTRAINT `fk_usuario_condicao_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `usuario_condicao` ADD CONSTRAINT `fk_usuario_condicao_condicao_id` FOREIGN KEY (`condicao_id`) REFERENCES `condicao` (`id`);

ALTER TABLE `usuario_restricao` ADD CONSTRAINT `fk_usuario_restricao_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `usuario_restricao` ADD CONSTRAINT `fk_usuario_restricao_restricao_id` FOREIGN KEY (`restricao_id`) REFERENCES `restricao` (`id`);

ALTER TABLE `usuario` ADD CONSTRAINT `fk_usuario_nivel_id` FOREIGN KEY (`nivel_id`) REFERENCES `nivel` (`id`);

ALTER TABLE `meta` ADD CONSTRAINT `fk_meta_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `xp` ADD CONSTRAINT `fk_xp_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `xp` ADD CONSTRAINT `fk_xp_treino_id` FOREIGN KEY (`treino_id`) REFERENCES `treino` (`id`);

ALTER TABLE `usuario_conquista` ADD CONSTRAINT `fk_usuario_conquista_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `usuario_conquista` ADD CONSTRAINT `fk_usuario_conquista_conquista_id` FOREIGN KEY (`conquista_id`) REFERENCES `conquista` (`id`);

ALTER TABLE `local_atividade` ADD CONSTRAINT `fk_local_atividade_ambiente_id` FOREIGN KEY (`ambiente_id`) REFERENCES `ambiente` (`id`);

ALTER TABLE `local_atividade` ADD CONSTRAINT `fk_local_atividade_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);