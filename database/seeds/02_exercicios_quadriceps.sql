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
        'agachamento_barra_costas',
        'Agachamento com barra nas costas',
        'Barbell Back Squat',
        'Apoie a barra na musculatura superior das costas, fora da região cervical. Ajuste as travas do rack antes de iniciar.',
        'Apoie a barra na musculatura superior das costas, fora da região cervical. Ajuste as travas do rack antes de iniciar. Mantenha o pé inteiro apoiado. Flexione quadris e joelhos, deixando os joelhos acompanharem a direção dos pés. Desça até a amplitude controlável e levante sem perder o apoio.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'agachamento_dividido_corporal',
        'Agachamento dividido com peso corporal',
        'Bodyweight Split Squat',
        'Mantenha os pés na mesma posição durante toda a série, com o calcanhar traseiro elevado. Faça os dois lados.',
        'Mantenha os pés na mesma posição durante toda a série, com o calcanhar traseiro elevado. Faça os dois lados. Mantenha espaço lateral entre os pés para equilibrar-se. Flexione os joelhos com controle, mantendo o pé dianteiro apoiado. Eleve o corpo sem deixar o joelho dianteiro desviar para dentro.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'musculacao',
        'treinamento',
        '1',
        '1',
        'Não preencher carga; o peso corporal não deve ser registrado nesse campo.',
        'Registrar repetições por lado; realizar a mesma quantidade em ambos os lados. Uma execução completa do lado trabalhado vale uma repetição.'
    ),
    (
        'agachamento_dividido_halteres',
        'Agachamento dividido com halteres',
        'Dumbbell Split Squat',
        'Segure um halter em cada mão ao lado do corpo. Mantenha a base fixa durante a série e depois troque a perna dianteira.',
        'Segure um halter em cada mão ao lado do corpo. Mantenha a base fixa durante a série e depois troque a perna dianteira. Mantenha espaço lateral entre os pés para equilibrar-se. Flexione os joelhos com controle, mantendo o pé dianteiro apoiado. Eleve o corpo sem deixar o joelho dianteiro desviar para dentro.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        '1',
        '1',
        'Registrar a soma das massas dos dois halteres, em quilogramas, sem somar o peso corporal.',
        'Registrar repetições por lado; realizar a mesma quantidade em ambos os lados. Uma execução completa do lado trabalhado vale uma repetição.'
    ),
    (
        'agachamento_frontal_barra',
        'Agachamento frontal com barra',
        'Front Squat',
        'Apoie a barra à frente dos ombros e mantenha os cotovelos elevados. Use uma pegada que permita sustentar a barra sem transferir todo o peso para os punhos.',
        'Apoie a barra à frente dos ombros e mantenha os cotovelos elevados. Use uma pegada que permita sustentar a barra sem transferir todo o peso para os punhos. Mantenha o pé inteiro apoiado. Flexione quadris e joelhos, deixando os joelhos acompanharem a direção dos pés. Desça até a amplitude controlável e levante sem perder o apoio.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'agachamento_goblet_halter',
        'Agachamento goblet com halter',
        'Dumbbell Goblet Squat',
        'Segure um único halter junto ao peito com as duas mãos. Mantenha-o próximo do corpo durante toda a repetição.',
        'Segure um único halter junto ao peito com as duas mãos. Mantenha-o próximo do corpo durante toda a repetição. Mantenha o pé inteiro apoiado. Flexione quadris e joelhos, deixando os joelhos acompanharem a direção dos pés. Desça até a amplitude controlável e levante sem perder o apoio.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'Registrar a massa do único halter utilizado, em quilogramas, sem somar o peso corporal.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'agachamento_livre_corporal',
        'Agachamento livre com peso corporal',
        'Bodyweight Squat',
        'Posicione os pés em uma largura confortável e mantenha os braços à frente para equilíbrio.',
        'Posicione os pés em uma largura confortável e mantenha os braços à frente para equilíbrio. Mantenha o pé inteiro apoiado. Flexione quadris e joelhos, deixando os joelhos acompanharem a direção dos pés. Desça até a amplitude controlável e levante sem perder o apoio.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'musculacao',
        'treinamento',
        '0',
        '1',
        'Não preencher carga; o peso corporal não deve ser registrado nesse campo.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'agachamento_smith',
        'Agachamento no Smith',
        'Smith Machine Squat',
        'Posicione os pés de acordo com a trajetória do equipamento. Ajuste as travas e mantenha o pé inteiro apoiado durante a descida.',
        'Posicione os pés de acordo com a trajetória do equipamento. Ajuste as travas e mantenha o pé inteiro apoiado durante a descida. Mantenha o pé inteiro apoiado. Flexione quadris e joelhos, deixando os joelhos acompanharem a direção dos pés. Desça até a amplitude controlável e levante sem perder o apoio.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'Registrar as anilhas e a resistência efetiva da barra informada pelo fabricante. Se ela for desconhecida, registrar somente as anilhas e manter essa convenção no mesmo equipamento.',
        'Um ciclo completo de ida e volta vale uma repetição. Quando ambos os membros se movem simultaneamente, contar o ciclo conjunto uma única vez.'
    ),
    (
        'avanco_caminhando_halteres',
        'Avanço caminhando com halteres',
        'Dumbbell Walking Lunge',
        'Segure dois halteres ao lado do corpo. Avance alternando as pernas em um percurso livre de obstáculos; conte cada passo como uma repetição.',
        'Segure dois halteres ao lado do corpo. Avance alternando as pernas em um percurso livre de obstáculos; conte cada passo como uma repetição. Mantenha espaço lateral entre os pés para equilibrar-se. Flexione os joelhos com controle, mantendo o pé dianteiro apoiado. Eleve o corpo sem deixar o joelho dianteiro desviar para dentro.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        '1',
        '1',
        'Registrar a soma das massas dos dois halteres, em quilogramas, sem somar o peso corporal.',
        'Registrar o total de passos alternados. Cada passo completo vale uma repetição; 20 passos correspondem a 10 por lado.'
    ),
    (
        'avanco_reverso_corporal',
        'Avanço reverso com peso corporal',
        'Bodyweight Reverse Lunge',
        'Dê um passo para trás, desça e retorne à posição inicial. Execute todas as repetições de um lado antes de trocar.',
        'Dê um passo para trás, desça e retorne à posição inicial. Execute todas as repetições de um lado antes de trocar. Mantenha espaço lateral entre os pés para equilibrar-se. Flexione os joelhos com controle, mantendo o pé dianteiro apoiado. Eleve o corpo sem deixar o joelho dianteiro desviar para dentro.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'Não preencher carga; o peso corporal não deve ser registrado nesse campo.',
        'Registrar repetições por lado; realizar a mesma quantidade em ambos os lados. Uma execução completa do lado trabalhado vale uma repetição.'
    ),
    (
        'avanco_reverso_halteres',
        'Avanço reverso com halteres',
        'Dumbbell Reverse Lunge',
        'Segure dois halteres ao lado do corpo. Dê um passo para trás e retorne com controle. Complete um lado antes de trocar.',
        'Segure dois halteres ao lado do corpo. Dê um passo para trás e retorne com controle. Complete um lado antes de trocar. Mantenha espaço lateral entre os pés para equilibrar-se. Flexione os joelhos com controle, mantendo o pé dianteiro apoiado. Eleve o corpo sem deixar o joelho dianteiro desviar para dentro.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        '1',
        '1',
        'Registrar a soma das massas dos dois halteres, em quilogramas, sem somar o peso corporal.',
        'Registrar repetições por lado; realizar a mesma quantidade em ambos os lados. Uma execução completa do lado trabalhado vale uma repetição.'
    ),
    (
        'leg_press_45',
        'Leg press a 45 graus',
        '45-Degree Leg Press',
        'Apoie os pés na plataforma e flexione os joelhos sem deixar a pelve descolar do encosto.',
        'Apoie os pés na plataforma e flexione os joelhos sem deixar a pelve descolar do encosto.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'leg_press_45'
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
        'Registre a soma das anilhas adicionadas.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'leg_press_horizontal',
        'Leg press horizontal',
        'Horizontal Leg Press',
        'Empurre a plataforma e retorne até a flexão de joelhos que permita manter a pelve apoiada.',
        'Empurre a plataforma e retorne até a flexão de joelhos que permita manter a pelve apoiada.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'leg_press_horizontal'
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
        'agachamento_hack',
        'Agachamento no hack',
        'Hack Squat',
        'Apoie ombros e costas no trenó. Flexione joelhos e quadris e empurre a plataforma para subir.',
        'Apoie ombros e costas no trenó. Flexione joelhos e quadris e empurre a plataforma para subir.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'hack_agachamento'
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
        'Registre a soma das anilhas adicionadas.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'belt_squat',
        'Agachamento com cinto na máquina',
        'Belt Squat',
        'Prenda o cinto ao mecanismo, flexione joelhos e quadris e retorne mantendo os pés apoiados.',
        'Prenda o cinto ao mecanismo, flexione joelhos e quadris e retorne mantendo os pés apoiados.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'belt_squat'
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
        'Registre a soma das anilhas adicionadas.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'agachamento_pendular',
        'Agachamento pendular',
        'Pendulum Squat',
        'Mantenha as costas no apoio durante a descida em arco e empurre a plataforma para subir.',
        'Mantenha as costas no apoio durante a descida em arco e empurre a plataforma para subir.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'agachamento_pendular'
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
        'Registre a soma das anilhas adicionadas.',
        'Conte cada ciclo completo como uma repetição.'
    ),
    (
        'extensora_bilateral',
        'Extensão de joelhos na cadeira extensora',
        'Machine Leg Extension',
        'Alinhe os joelhos ao eixo da máquina, estenda-os e retorne sem deixar a pilha bater.',
        'Alinhe os joelhos ao eixo da máquina, estenda-os e retorne sem deixar a pilha bater.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'cadeira_extensora'
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
        'extensora_unilateral',
        'Extensão unilateral na cadeira extensora',
        'Single-Leg Extension',
        'Alinhe o joelho ao eixo da máquina e mova o rolo com uma perna mantendo a pelve apoiada.',
        'Alinhe o joelho ao eixo da máquina e mova o rolo com uma perna mantendo a pelve apoiada.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'cadeira_extensora'
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
        'Registre o valor indicado no seletor da máquina.',
        'Conte os ciclos completos por lado.'
    ),
    (
        'bicicleta_ergometrica',
        'Pedalada na bicicleta ergométrica',
        'Stationary Cycling',
        'Ajuste o selim para manter leve flexão do joelho no ponto mais baixo e pedale de forma contínua.',
        'Ajuste o selim para manter leve flexão do joelho no ponto mais baixo e pedale de forma contínua.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'bicicleta_ergometrica'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'duracao'
        ),
        'musculacao',
        'treinamento',
        '1',
        '1',
        'Deixe a carga em branco.',
        'Registre o tempo de execução.'
    ),
    (
        'step_up_corporal',
        'Subida no step com peso corporal',
        'Bodyweight Step-Up',
        'Apoie o pé inteiro no step e suba pressionando esse pé. Desça com controle.',
        'Apoie o pé inteiro no step e suba pressionando esse pé. Desça com controle.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'step'
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
        '1',
        '1',
        'Deixe a carga em branco.',
        'Conte os ciclos completos por lado.'
    ),
    (
        'agachamento_bulgaro_halteres',
        'Agachamento búlgaro com halteres',
        'Dumbbell Bulgarian Split Squat',
        'Apoie o pé traseiro no banco e flexione o joelho da frente mantendo o pé dianteiro firme.',
        'Apoie o pé traseiro no banco e flexione o joelho da frente mantendo o pé dianteiro firme.',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        '1',
        '1',
        'Registre a soma das massas dos dois halteres.',
        'Conte os ciclos completos por lado.'
    ),
    (
        'movi_ac5a4c58',
        'Hack Squat',
        'Hack Squat',
        'Movimento Hack Squat, com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_70d4ebbf',
        'Jump Squat',
        'Jump Squat',
        'Movimento Jump Squat, com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_40c6a9fc',
        'Zercher Squat',
        'Zercher Squat',
        'Movimento Zercher Squat, com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_5e1a7777',
        'Lunge',
        'Lunge',
        'Movimento Lunge, com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_5cc07a1f',
        'Jumping Lunge',
        'Jumping Lunge',
        'Movimento Jumping Lunge, com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_f2a37357',
        'Lateral Lunge',
        'Lateral Lunge',
        'Movimento Lateral Lunge, com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_6e6ee645',
        'Lunge (Barbell)',
        'Lunge (Barbell)',
        'Movimento Lunge (Barbell), com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_b537d09f',
        'Lunge (Dumbbell)',
        'Lunge (Dumbbell)',
        'Movimento Lunge (Dumbbell), com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_3fd83744',
        'Single Leg Press (Machine)',
        'Single Leg Press (Machine)',
        'Movimento Single Leg Press (Machine), com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        '1',
        '1',
        '',
        ''
    ),
    (
        'movi_32hkj34k',
        'Walking Lunge',
        'Walking Lunge',
        'Movimento Walking Lunge, com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_d39ec9eb',
        'Curtsy Lunge (Dumbbell)',
        'Curtsy Lunge (Dumbbell)',
        'Movimento Curtsy Lunge (Dumbbell), com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_56092dd1',
        'Box Jump',
        'Box Jump',
        'Movimento Box Jump, com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'outro'
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
        'movi_207dc636',
        'Frog Jumps',
        'Frog Jumps',
        'Movimento Frog Jumps, com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_5bff35ba',
        'Assisted Pistol Squats',
        'Assisted Pistol Squats',
        'Movimento Assisted Pistol Squats, com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_b82d6418',
        'Squat (Suspension)',
        'Squat (Suspension)',
        'Movimento Squat (Suspension), com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_3ff6a22e',
        'Pistol Squat',
        'Pistol Squat',
        'Movimento Pistol Squat, com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_c8706c80',
        'Wall Sit',
        'Wall Sit',
        'Movimento Wall Sit, com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'outro'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'duracao'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_4c6721b9',
        'Overhead Dumbbell Lunge',
        'Overhead Dumbbell Lunge',
        'Movimento Overhead Dumbbell Lunge, com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_0f24286a',
        'Bulgarian Split Squat (Barbell)',
        'Bulgarian Split Squat (Barbell)',
        'Movimento Bulgarian Split Squat (Barbell), com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_3f5f8d40',
        'Sumo Squat',
        'Sumo Squat',
        'Movimento Sumo Squat, com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_6622e5a0',
        'Sumo Squat (Barbell)',
        'Sumo Squat (Barbell)',
        'Movimento Sumo Squat (Barbell), com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_05293bca',
        'Sumo Squat (Dumbbell)',
        'Sumo Squat (Dumbbell)',
        'Movimento Sumo Squat (Dumbbell), com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_5e10d0e6',
        'Sumo Squat (Kettlebell)',
        'Sumo Squat (Kettlebell)',
        'Movimento Sumo Squat (Kettlebell), com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'kettlebell'
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
        'movi_38fc1ab9',
        'Box Squat (Barbell)',
        'Box Squat (Barbell)',
        'Movimento Box Squat (Barbell), com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_cc35a01f',
        'Squat (Machine)',
        'Squat (Machine)',
        'Movimento Squat (Machine), com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_f1258206',
        'Squat (Band)',
        'Squat (Band)',
        'Movimento Squat (Band), com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_f30a4f01',
        'Walking Lunge (Sandbag)',
        'Walking Lunge (Sandbag)',
        'Movimento Walking Lunge (Sandbag), com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'outro'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_distancia'
        ),
        'musculacao',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_d731cca8',
        'Lateral Squat',
        'Lateral Squat',
        'Movimento Lateral Squat, com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_bf6ece89',
        'Dumbbell Step Up',
        'Dumbbell Step Up',
        'Movimento Dumbbell Step Up, com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_a127da73',
        'Kettlebell Goblet Squat',
        'Kettlebell Goblet Squat',
        'Movimento Kettlebell Goblet Squat, com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'kettlebell'
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
        'movi_dcff3e9f',
        'Squat (Dumbbell)',
        'Squat (Dumbbell)',
        'Movimento Squat (Dumbbell), com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_f5def1eb',
        'Sissy Squat (Weighted)',
        'Sissy Squat (Weighted)',
        'Movimento Sissy Squat (Weighted), com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_818ba121',
        'Reverse Lunge (Barbell)',
        'Reverse Lunge (Barbell)',
        'Movimento Reverse Lunge (Barbell), com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_ce1054ce',
        'Pause Squat (Barbell)',
        'Pause Squat (Barbell)',
        'Movimento Pause Squat (Barbell), com foco em Quadríceps.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_083',
        'Pistol squat com carga',
        '',
        'Pistol squat com carga. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'calistenia',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_084',
        'Shrimp squat',
        '',
        'Shrimp squat. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_086',
        'Agachamento sissy sem carga',
        '',
        'Agachamento sissy sem carga. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_087',
        'Nordic curl reverso',
        '',
        'Nordic curl reverso. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_110',
        'Agachamento frontal com dois kettlebells',
        '',
        'Agachamento frontal com dois kettlebells. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'kettlebell'
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
        'movi_123',
        'Arrasto de trenó para trás',
        '',
        'Arrasto de trenó para trás. Registre a distância percorrida.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'treno'
        ),
        (
            SELECT
                id
            FROM
                tipo_registro
            WHERE
                codigo = 'carga_distancia'
        ),
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_133',
        'Salto horizontal parado',
        '',
        'Salto horizontal parado. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_134',
        'Salto lateral sobre caixa',
        '',
        'Salto lateral sobre caixa. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'caixa'
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
        'movi_135',
        'Salto com queda e rebote (depth jump)',
        '',
        'Salto com queda e rebote (depth jump). Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'caixa'
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
        'movi_136',
        'Salto com aterrissagem (drop jump)',
        '',
        'Salto com aterrissagem (drop jump). Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'caixa'
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
        'movi_137',
        'Salto unilateral sobre caixa',
        '',
        'Salto unilateral sobre caixa. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'caixa'
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
        'movi_139',
        'Salto com joelhos ao peito',
        '',
        'Salto com joelhos ao peito. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_141',
        'Saltos sobre barreiras',
        '',
        'Saltos sobre barreiras. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'barreira'
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
        'movi_149',
        'Duck walk',
        '',
        'Duck walk. Registre a distância percorrida.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
                codigo = 'distancia'
        ),
        'funcional',
        'treinamento',
        '0',
        '1',
        '',
        ''
    ),
    (
        'movi_157',
        'Afundo suspenso nas fitas',
        '',
        'Afundo suspenso nas fitas. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
        'movi_164',
        'Agachamento com saco de areia',
        '',
        'Agachamento com saco de areia. Execute o movimento de forma controlada e registre as repetições.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
        ),
        (
            SELECT
                id
            FROM
                equipamento
            WHERE
                codigo = 'saco_areia'
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
        'movi_190',
        'Alongamento do flexor de quadril ajoelhado',
        '',
        'Alongamento do flexor de quadril ajoelhado. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
    ),
    (
        'movi_191',
        'Alongamento de quadríceps em pé',
        '',
        'Alongamento de quadríceps em pé. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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
    ),
    (
        'movi_206',
        'Alongamento couch stretch',
        '',
        'Alongamento couch stretch. Sustente a posição e registre o tempo.',
        '',
        (
            SELECT
                id
            FROM
                grupo_muscular
            WHERE
                codigo = 'quadriceps'
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