INSERT INTO
    exercicio (
        codigo,
        nome,
        nome_ingles,
        descricao,
        instrucoes,
        grupo_muscular_id,
        equipamento_id,
        tipo_registro_id,
        modalidade,
        tipo,
        unilateral,
        ativo,
        criterio_carga,
        criterio_repeticoes
    )
VALUES
    (
        'supino_reto_barra',
        'Supino reto com barra',
        'Barbell Bench Press',
        'Supino bilateral em banco horizontal com barra livre.',
        'Deite no banco com os olhos abaixo da barra e os pés apoiados. Ajuste a pegada para manter os antebraços aproximadamente verticais na parte baixa. Estabilize as escápulas e retire a barra do suporte. Desça de forma controlada em direção ao peito, sem quicar. Empurre para cima e ligeiramente em direção aos ombros, mantendo glúteos e tronco apoiados. Use suportes de segurança ajustados ou ajuda para retirar e devolver a barra quando necessário.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'barra_reta'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Registrar a massa total da barra e das anilhas, em quilogramas.',
        'Uma descida e uma subida completas dos dois braços simultaneamente correspondem a uma repetição.'
    ),
    (
        'supino_reto_halteres',
        'Supino reto com halteres',
        'Dumbbell Bench Press',
        'Supino bilateral simultâneo em banco horizontal, com um halter em cada mão.',
        'Sente no banco com os halteres apoiados nas coxas e posicione-os ao deitar. Apoie os pés e estabilize as escápulas. Mantenha os punhos alinhados aos antebraços. Desça os halteres de forma controlada ao lado do peito, dentro da amplitude que consegue controlar. Empurre ambos simultaneamente, sem bater os halteres no alto. Ao terminar, recolha os pesos de forma controlada para voltar à posição sentada.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'halter'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Registrar a soma das massas dos dois halteres, em quilogramas; dois halteres de 10 kg correspondem a 20 kg.',
        'Uma descida e uma subida completas dos dois braços simultaneamente correspondem a uma repetição.'
    ),
    (
        'supino_inclinado_30_halteres',
        'Supino inclinado a 30 graus com halteres',
        '30-Degree Incline Dumbbell Bench Press',
        'Supino bilateral simultâneo com halteres e encosto inclinado a aproximadamente 30 graus.',
        'Ajuste o encosto para aproximadamente 30 graus e confira seu travamento. Posicione os halteres com controle ao apoiar o tronco. Mantenha os pés firmes, os glúteos no assento e as escápulas estáveis. Desça os halteres ao lado da parte superior do peito, sem forçar a amplitude. Empurre simultaneamente para cima, mantendo os punhos alinhados aos antebraços. Evite aumentar o arco do tronco para transformar a execução em um supino reto.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'halter'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Registrar a soma das massas dos dois halteres, em quilogramas; dois halteres de 10 kg correspondem a 20 kg.',
        'Uma descida e uma subida completas dos dois braços simultaneamente correspondem a uma repetição.'
    ),
    (
        'flexao_joelhos',
        'Flexão de braços com joelhos apoiados',
        'Knee Push-Up',
        'Apoie os joelhos e mantenha uma linha entre joelhos, quadris e ombros. Evite dobrar o quadril para reduzir o movimento.',
        'Apoie os joelhos e mantenha uma linha entre joelhos, quadris e ombros. Evite dobrar o quadril para reduzir o movimento. Mantenha cabeça, tronco e pelve alinhados. Flexione os cotovelos de forma controlada. Empurre para retornar, sem deixar a lombar ceder.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        'Não preencher carga; o peso corporal não deve ser registrado nesse campo.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'flexao_maos_banco',
        'Flexão de braços com mãos no banco',
        'Incline Push-Up',
        'Use um banco firme, que não deslize. Apoie as mãos no banco e mantenha os pés no solo.',
        'Use um banco firme, que não deslize. Apoie as mãos no banco e mantenha os pés no solo. Mantenha cabeça, tronco e pelve alinhados. Flexione os cotovelos de forma controlada. Empurre para retornar, sem deixar a lombar ceder.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'banco_reto'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        'Não preencher carga; o peso corporal não deve ser registrado nesse campo.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'flexao_pegada_fechada',
        'Flexão de braços com pegada fechada',
        'Close-Grip Push-Up',
        'Aproxime as mãos em relação à versão convencional, sem exigir que se toquem. Mantenha os cotovelos próximos ao tronco.',
        'Aproxime as mãos em relação à versão convencional, sem exigir que se toquem. Mantenha os cotovelos próximos ao tronco. Mantenha cabeça, tronco e pelve alinhados. Flexione os cotovelos de forma controlada. Empurre para retornar, sem deixar a lombar ceder.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        'Não preencher carga; o peso corporal não deve ser registrado nesse campo.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'flexao_pes_banco',
        'Flexão de braços com pés no banco',
        'Decline Push-Up',
        'Apoie os pés no banco firme e as mãos no solo. Não eleve a pelve para encurtar a amplitude.',
        'Apoie os pés no banco firme e as mãos no solo. Não eleve a pelve para encurtar a amplitude. Mantenha cabeça, tronco e pelve alinhados. Flexione os cotovelos de forma controlada. Empurre para retornar, sem deixar a lombar ceder.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'banco_reto'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Não preencher carga; o peso corporal não deve ser registrado nesse campo.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'flexao_solo',
        'Flexão de braços no solo',
        'Push-Up',
        'Apoie mãos e pontas dos pés no solo; aproxime o peito do chão sem perder o alinhamento.',
        'Apoie mãos e pontas dos pés no solo; aproxime o peito do chão sem perder o alinhamento. Mantenha cabeça, tronco e pelve alinhados. Flexione os cotovelos de forma controlada. Empurre para retornar, sem deixar a lombar ceder.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        'Não preencher carga; o peso corporal não deve ser registrado nesse campo.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'supino_inclinado_30_barra',
        'Supino inclinado a 30 graus com barra',
        '30-Degree Incline Barbell Bench Press',
        'Trave o encosto a aproximadamente 30 graus. Desça a barra em direção à parte superior do peito. Ajuste os suportes antes de retirar a barra.',
        'Trave o encosto a aproximadamente 30 graus. Desça a barra em direção à parte superior do peito. Ajuste os suportes antes de retirar a barra. Estabilize o tronco e mantenha os punhos alinhados aos antebraços. Desça a carga com controle. Empurre sem quicar ou bater os pesos.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'barra_reta'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Registrar a massa da barra mais todas as anilhas, em quilogramas, sem somar o peso corporal.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'supino_inclinado_45_barra',
        'Supino inclinado a 45 graus com barra',
        '45-Degree Incline Barbell Bench Press',
        'Trave o encosto a aproximadamente 45 graus. Preserve essa inclinação sem compensar com um arco excessivo do tronco.',
        'Trave o encosto a aproximadamente 45 graus. Preserve essa inclinação sem compensar com um arco excessivo do tronco. Estabilize o tronco e mantenha os punhos alinhados aos antebraços. Desça a carga com controle. Empurre sem quicar ou bater os pesos.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'barra_reta'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Registrar a massa da barra mais todas as anilhas, em quilogramas, sem somar o peso corporal.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'supino_inclinado_45_halteres',
        'Supino inclinado a 45 graus com halteres',
        '45-Degree Incline Dumbbell Bench Press',
        'Trave o encosto a aproximadamente 45 graus. Use um halter em cada mão e mova ambos simultaneamente com pegada pronada.',
        'Trave o encosto a aproximadamente 45 graus. Use um halter em cada mão e mova ambos simultaneamente com pegada pronada. Estabilize o tronco e mantenha os punhos alinhados aos antebraços. Desça a carga com controle. Empurre sem quicar ou bater os pesos.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'halter'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Registrar a soma das massas dos dois halteres, em quilogramas, sem somar o peso corporal.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'supino_solo_barra',
        'Supino no solo com barra',
        'Barbell Floor Press',
        'Ajuste os suportes para retirar a barra deitado no solo. Flexione os joelhos e apoie os pés. Interrompa a descida quando os braços tocarem suavemente o chão.',
        'Ajuste os suportes para retirar a barra deitado no solo. Flexione os joelhos e apoie os pés. Interrompa a descida quando os braços tocarem suavemente o chão. Estabilize o tronco e mantenha os punhos alinhados aos antebraços. Desça a carga com controle. Empurre sem quicar ou bater os pesos.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'barra_reta'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Registrar a massa da barra mais todas as anilhas, em quilogramas, sem somar o peso corporal.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'supino_solo_halteres',
        'Supino no solo com halteres',
        'Dumbbell Floor Press',
        'Deite no solo com joelhos flexionados e pés apoiados. Mova os halteres simultaneamente. Pare a descida quando os braços tocarem suavemente o chão.',
        'Deite no solo com joelhos flexionados e pés apoiados. Mova os halteres simultaneamente. Pare a descida quando os braços tocarem suavemente o chão. Estabilize o tronco e mantenha os punhos alinhados aos antebraços. Desça a carga com controle. Empurre sem quicar ou bater os pesos.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'halter'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Registrar a soma das massas dos dois halteres, em quilogramas, sem somar o peso corporal.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'supino_maquina',
        'Supino sentado na máquina',
        'Machine Chest Press',
        'Ajuste o assento para alinhar as alças ao peito e empurre sem tirar as costas do encosto.',
        'Ajuste o assento para alinhar as alças ao peito e empurre sem tirar as costas do encosto.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'supino_maquina'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Registre o valor indicado no seletor da máquina.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'crucifixo_halteres',
        'Crucifixo reto com halteres',
        'Dumbbell Fly',
        'Abra os braços com os cotovelos levemente flexionados e reúna os halteres acima do peito.',
        'Abra os braços com os cotovelos levemente flexionados e reúna os halteres acima do peito.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'halter'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Registre a soma das massas dos dois halteres.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'crucifixo_maquina',
        'Crucifixo no peck deck',
        'Pec Deck Fly',
        'Com as costas apoiadas, aproxime os braços à frente do peito e retorne sem soltar a carga.',
        'Com as costas apoiadas, aproxime os braços à frente do peito e retorne sem soltar a carga.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peck_deck'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Registre o valor indicado no seletor da máquina.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'flexao_argolas',
        'Flexão de braços nas argolas',
        'Ring Push-Up',
        'Ajuste as argolas à mesma altura, aproxime o peito das mãos e empurre mantendo o tronco firme.',
        'Ajuste as argolas à mesma altura, aproxime o peito das mãos e empurre mantendo o tronco firme.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'argolas'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Deixe a carga em branco.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'movi_982734d4',
        'Plate Press',
        'Plate Press',
        'Movimento Plate Press, com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'anilha'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_651f844c',
        'Cable Fly Crossovers',
        'Cable Fly Crossovers',
        'Movimento Cable Fly Crossovers, com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'polia_ajustavel'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_ddb7c19f',
        'Chest Fly (Band)',
        'Chest Fly (Band)',
        'Movimento Chest Fly (Band), com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'elastico_resistencia'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_31436f5d',
        'Plank Pushup',
        'Plank Pushup',
        'Movimento Plank Pushup, com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_99c1f2ad',
        'Bench Press (Cable)',
        'Bench Press (Cable)',
        'Movimento Bench Press (Cable), com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'polia_ajustavel'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_0fbf7195',
        'Bench Press (Smith Machine)',
        'Bench Press (Smith Machine)',
        'Movimento Bench Press (Smith Machine), com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'smith'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_da0f0470',
        'Decline Bench Press (Barbell)',
        'Decline Bench Press (Barbell)',
        'Movimento Decline Bench Press (Barbell), com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'barra_reta'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_d3e2ab55',
        'Incline Chest Fly (Dumbbell)',
        'Incline Chest Fly (Dumbbell)',
        'Movimento Incline Chest Fly (Dumbbell), com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'halter'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_fbf92739',
        'Incline Chest Press (Machine)',
        'Incline Chest Press (Machine)',
        'Movimento Incline Chest Press (Machine), com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'maquina'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_18487fa7',
        'Decline Bench Press (Dumbbell)',
        'Decline Bench Press (Dumbbell)',
        'Movimento Decline Bench Press (Dumbbell), com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'halter'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_6fcd7755',
        'Chest Dip',
        'Chest Dip',
        'Movimento Chest Dip, com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'maquina'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_51a0edaa',
        'Ring Dips',
        'Ring Dips',
        'Movimento Ring Dips, com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'argolas'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_e9e4089f',
        'Chest Dip (Assisted)',
        'Chest Dip (Assisted)',
        'Movimento Chest Dip (Assisted), com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'maquina'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_assistido'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_10d76e8f',
        'Clap Push Ups',
        'Clap Push Ups',
        'Movimento Clap Push Ups, com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_720b0d70',
        'Chest Fly (Suspension)',
        'Chest Fly (Suspension)',
        'Movimento Chest Fly (Suspension), com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'fitas_suspensao'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_8372bbcc',
        'Single Arm Cable Crossover',
        'Single Arm Cable Crossover',
        'Movimento Single Arm Cable Crossover, com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'polia_ajustavel'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '1',
        '1',
        '',
        ''
    ),
    (
        'movi_f72fa239',
        'Dumbbell Squeeze Press',
        'Dumbbell Squeeze Press',
        'Movimento Dumbbell Squeeze Press, com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'halter'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_29472be1',
        'Chest Dip (Weighted)',
        'Chest Dip (Weighted)',
        'Movimento Chest Dip (Weighted), com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'maquina'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_carga_adicional'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_eac7d9c5',
        'Chest Press (Band)',
        'Chest Press (Band)',
        'Movimento Chest Press (Band), com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'elastico_resistencia'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_6b4c797e',
        'Seated Chest Flys (Cable)',
        'Seated Chest Flys (Cable)',
        'Movimento Seated Chest Flys (Cable), com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'polia_ajustavel'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_3a6fa3d1',
        'Incline Bench Press (Smith Machine)',
        'Incline Bench Press (Smith Machine)',
        'Movimento Incline Bench Press (Smith Machine), com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'smith'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_ffc106cb',
        'Decline Bench Press (Smith Machine)',
        'Decline Bench Press (Smith Machine)',
        'Movimento Decline Bench Press (Smith Machine), com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'smith'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_a351aed7',
        'Decline Chest Fly (Dumbbell)',
        'Decline Chest Fly (Dumbbell)',
        'Movimento Decline Chest Fly (Dumbbell), com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'halter'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_e644f828',
        'Bench Press - Wide Grip (Barbell)',
        'Bench Press - Wide Grip (Barbell)',
        'Movimento Bench Press - Wide Grip (Barbell), com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'barra_reta'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_b140095e',
        'One Arm Push Up',
        'One Arm Push Up',
        'Movimento One Arm Push Up, com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '1',
        '1',
        '',
        ''
    ),
    (
        'movi_24706dcd',
        'Iso-Lateral Chest Press (Machine)',
        'Iso-Lateral Chest Press (Machine)',
        'Movimento Iso-Lateral Chest Press (Machine), com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'maquina'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_19372abc',
        'Push Up (Weighted)',
        'Push Up (Weighted)',
        'Movimento Push Up (Weighted), com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_carga_adicional'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_293483ad',
        'Low Cable Fly Crossovers',
        'Low Cable Fly Crossovers',
        'Movimento Low Cable Fly Crossovers, com foco em Peitoral.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'polia_ajustavel'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_020',
        'Flexão pseudo planche',
        '',
        'Flexão pseudo planche. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_066',
        'Flexão arqueiro',
        '',
        'Flexão arqueiro. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_067',
        'Flexão arqueiro nas argolas',
        '',
        'Flexão arqueiro nas argolas. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'argolas'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_068',
        'Flexão hindu',
        '',
        'Flexão hindu. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_069',
        'Flexão mergulhador',
        '',
        'Flexão mergulhador. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_070',
        'Flexão com déficit',
        '',
        'Flexão com déficit. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'paraletes'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_071',
        'Flexão com elástico',
        '',
        'Flexão com elástico. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'elastico_resistencia'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_073',
        'Flexão com mãos afastadas',
        '',
        'Flexão com mãos afastadas. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_074',
        'Flexão com mãos desencontradas',
        '',
        'Flexão com mãos desencontradas. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_075',
        'Flexão spiderman',
        '',
        'Flexão spiderman. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_076',
        'Flexão com toque nos ombros',
        '',
        'Flexão com toque nos ombros. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_129',
        'Arremesso de medicine ball ao peito',
        '',
        'Arremesso de medicine ball ao peito. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'medicine_ball'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_repeticoes'
        ),
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_152',
        'Flexão nas fitas de suspensão',
        '',
        'Flexão nas fitas de suspensão. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'fitas_suspensao'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'peso_corporal_repeticoes'
        ),
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_195',
        'Alongamento de peitoral na porta',
        '',
        'Alongamento de peitoral na porta. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'peitoral'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'peso_corporal'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'duracao'
        ),
        'alongamento',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ) ON DUPLICATE KEY
UPDATE nome =
VALUES
    (nome),
    nome_ingles =
VALUES
    (nome_ingles),
    descricao =
VALUES
    (descricao),
    instrucoes =
VALUES
    (instrucoes),
    grupo_muscular_id =
VALUES
    (grupo_muscular_id),
    equipamento_id =
VALUES
    (equipamento_id),
    tipo_registro_id =
VALUES
    (tipo_registro_id),
    modalidade =
VALUES
    (modalidade),
    tipo =
VALUES
    (tipo),
    unilateral =
VALUES
    (unilateral),
    ativo =
VALUES
    (ativo),
    criterio_carga =
VALUES
    (criterio_carga),
    criterio_repeticoes =
VALUES
    (criterio_repeticoes);