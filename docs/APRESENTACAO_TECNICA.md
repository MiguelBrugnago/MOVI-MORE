# MOVI+ | Guia para a apresentação técnica

## Visão geral

O MOVI+ reúne o que o aluno planejou, o que realmente executou e como esses registros evoluíram. Uma rotina pode ser repetida em vários dias. Cada sessão guarda suas próprias séries. Esse é o fio condutor da demonstração, da biblioteca de exercícios até o mapa muscular.

A aplicação usa PHP orientado a objetos, Composer para autoload, MySQL e PDO. Views PHP produzem o HTML, CSS define a apresentação e JavaScript auxilia interações como salvar uma série durante o treino. O Docker Compose reúne Apache/PHP e MySQL. Perfil físico, acompanhamento profissional, nutrição e conquistas usam a mesma conta.

## Arquitetura e percurso de uma requisição

| Etapa | O que mostrar ao iniciar um treino |
| --- | --- |
| Entrada e rota | O formulário envia `POST /treinos/iniciar`. `public/index.php` e `routes/web.php` associam método e caminho a `RotinaController::iniciar`. |
| Controller | Em `app/Controllers/RotinaController.php`, acompanhe a chamada a `post`. O controller obtém a conta da sessão, verifica o token do formulário e entrega os campos ao serviço. |
| Serviço | `app/Services/TreinoService.php`, método `iniciar`, coordena a transação. Confere a rotina do aluno, retoma uma sessão ativa ou cria uma sessão e copia exercícios, ordem e metas. |
| Persistência | `app/Repositories/TreinoRepository.php` executa as consultas com a conexão de `app/Config/Database.php`. O bloqueio da conta ocorre antes da busca por sessão ativa. |
| Resposta | O destino de sucesso é `/treinos/ver?id=…`. Na leitura seguinte, o controller carrega os registros e a view `app/Views/treino.php` apresenta as séries. |

Na finalização entra outra responsabilidade do MVC. O controller recebe a ação, o serviço consulta as séries, o objeto `Treino` decide se pode concluir e o repositório grava o resultado. Essa sequência permite testar a decisão do objeto em memória e, separadamente, conferir a gravação no MySQL.

## Orientação a objetos no código

Os caminhos desta tabela são relativos a `app/`.

| Conceito | Classe, arquivo e método | Como explicar sua finalidade |
| --- | --- | --- |
| Construção e encapsulamento | `Models/Treino.php`, `Treino::__construct` e `finalizar` | O construtor recebe um estado conhecido. O atributo de estado é privado. Para concluir, o chamador precisa passar pela regra que exige uma série realizada. |
| Associação e agregação | `Models/Rotina.php`, `Rotina::adicionar(Exercicio $exercicio)` | A rotina guarda exercícios em ordem e verifica se aceita alterações. O exercício continua no catálogo e pode participar de várias rotinas. |
| Composição | `Models/SerieExecutada.php`, `SerieExecutada::__construct` | Uma série constrói e guarda suas próprias medições. A modalidade do exercício determina quais campos ela aceita. |
| Abstração e herança | `Models/Metricas/MetricaNumerica.php`, construtor e método abstrato `converter` | A classe base reúne a validação comum. As subclasses `MetricaInteira` e `MetricaDecimal` especializam formato e conversão para repetições e cargas. |
| Interface e polimorfismo | `Contracts/MetricaInterface.php` e `SerieExecutada::paraPersistencia` | A série pede `valor()` a cada medição pelo mesmo contrato. Quem percorre as medições pode obter os valores sem repetir a escolha entre inteiro e decimal. |
| Comportamento de domínio | `Models/Alimento.php`, `Alimento::totaisDaPorcao` | O alimento conhece a composição por 100 g. Multiplica cada valor pelos gramas consumidos, divide por 100 e arredonda o resultado para duas casas. |

## Banco de dados

Use um diagrama pequeno. Em `treino → treino_exercicio → serie`, cada seta corresponde a uma relação um-para-muitos. A chave primária `treino.id` identifica a sessão. A chave estrangeira `treino_exercicio.treino_id` liga o item à sessão e `serie.treino_exercicio_id` liga cada série ao item. A relação muitos-para-muitos entre exercício e músculo passa por `exercicio_musculo`, que também registra o papel do músculo.

Para demonstrar CRUD, abra `app/Repositories/PerfilFisicoRepository.php`. O método `salvarAvaliacao` cria ou atualiza a avaliação e suas medidas, `historico` lê os registros e `excluir` remove medidas e avaliação dentro da mesma transação. O identificador do registro e o da conta entram como parâmetros da consulta preparada. A edição verifica também a origem da avaliação e preserva tipos legados de medida.

As chaves estrangeiras protegem os relacionamentos. As transações mantêm gravações relacionadas consistentes. As migrations em `database/migrations/` registram a evolução do esquema. O executor `database/scripts/migrar.php` verifica sequência e checksum e adquire um bloqueio para coordenar a aplicação. Os dados iniciais do catálogo vêm das seeds.

## Segurança e privacidade

| Pergunta prática | Mecanismo que vale demonstrar |
| --- | --- |
| Como guardar e conferir a senha? | `AuthController::cadastrar` usa `password_hash`. No login, `password_verify` confere a senha e `Session::regenerar` troca o identificador da sessão. `LoginLimiter` controla tentativas de acesso. |
| Quem pode consultar o mapa de um aluno? | `AnaliseTreinoController::index` identifica o usuário autenticado. Para outra conta, verifica o vínculo e a permissão de treinos e registra a leitura. A consulta do repositório restringe os dados ao aluno autorizado. |
| Por que verificar o formulário e o dono? | O token de `Security/Csrf.php` vincula o envio à sessão. A autorização decide se aquela conta pode agir sobre o recurso. São verificações complementares. |
| Como tratar dados recebidos e exibidos? | `Support/Validacao.php` verifica texto, números, datas civis e IDs opcionais. A regra de cada fluxo define limites e obrigatoriedade. PDO vincula valores à consulta preparada e as views escapam texto ao gerar HTML. |

## Fluxos para demonstrar

- **Conta e biblioteca.** Cadastre uma conta e entre. Na biblioteca, busque um exercício, confira a modalidade e selecione-o para a rotina. Nome, equipamento e músculos vêm do catálogo.
- **Rotina, treino e histórico.** Crie uma rotina com um exercício e uma série planejada. Inicie o treino, registre a carga e as repetições efetivas e finalize. Compare o histórico com as metas copiadas. A próxima sessão começa com o planejamento e pode apresentar os valores anteriores como referência.
- **Perfil e avaliações.** Registre uma avaliação com data e medida. Em evolução, compare datas com a mesma unidade. Mostre em `PerfilFisicoService::data` onde entram as condições de data obrigatória e limite de hoje. Metas podem terminar no futuro.
- **Nutrição.** Compare rascunho, plano publicado e diário. O plano publicado guarda a composição usada nas porções. No diário, 125 g de um alimento com 140 kcal por 100 g correspondem a 175 kcal. O lançamento guarda os totais daquela ocasião.
- **Gamificação.** Abra metas e conquistas depois de finalizar uma sessão com uma série realizada. A contagem parte das sessões elegíveis da conta. O saldo acompanha o histórico quando uma sessão deixa de contar.

### Como explicar o mapa muscular

1. Em `AnaliseTreinoRepository::sessoes` e `execucoes`, localize o filtro de proprietário e o intervalo de conclusão. Entram séries de trabalho concluídas e não ignoradas. Aquecimento e preparatórias ficam fora do cálculo do mapa.
2. `relacoes` traz o papel de cada músculo nos exercícios usados. `AnaliseTreinoService::calcular` reúne as relações por exercício para percorrer as execuções já agrupadas por sessão, exercício e lado.
3. Em `atribuirSeries`, duas séries de trabalho contam como duas séries equivalentes para um músculo primário, uma para um secundário e zero para um estabilizador. A participação estabilizadora continua registrada. As equivalências expressam uma estimativa de participação.
4. Para uma série com carga externa de 20 kg e dez repetições, o volume externo é 200 kg. `somarVolume` mantém o total separado por exercício e lado e aplica o fator muscular quando necessário. Carga ausente deixa o volume indisponível.
5. A cor usa a métrica selecionada na tela. `nivel` separa zero e os intervalos positivos com cortes em 5, 10 e 20. `MapaMuscular` fornece as regiões do desenho. A view `treino_analise.php` associa a faixa à classe CSS e usa outra classe para ausência de registros. Na demonstração, selecione uma região e confira o valor no detalhe.

## Dificuldade e preparação dos slides

As notas estimam o esforço de explicar cada assunto em uma defesa de graduação. A sequência abaixo serve como roteiro dos slides e da demonstração.

| Slide e assunto | Dificuldade e motivo | O que estudar e mostrar | Frase para orientar a explicação |
| --- | --- | --- | --- |
| 1. Problema e fluxo | 2/10, conceitos familiares | Telas de rotina, treino e histórico. Identifique meta e valor realizado. | Um mesmo planejamento pode originar sessões com resultados diferentes. |
| 2. MVC | 4/10, exige seguir uma chamada | Desenhe a sequência da requisição acima e abra `RotinaController::iniciar`. | Cada camada responde a uma pergunta sobre a requisição. |
| 3. Objetos | 5/10, exige distinguir associação e composição | Mostre `Rotina::adicionar` e o construtor de `SerieExecutada`. | A rotina seleciona objetos existentes e a série cria suas medições. |
| 4. Banco e concorrência | 7/10, duas requisições podem se intercalar | Diagrama das três tabelas e trecho de `TreinoService::iniciar` que bloqueia a conta. | O segundo início verifica a sessão ativa depois que o primeiro termina a transação. |
| 5. Segurança | 6/10, cada proteção resolve um problema | `AuthController::login` e a autorização em `AnaliseTreinoController::index`. | A sessão identifica a pessoa e o consentimento delimita os dados que ela pode ler. |
| 6. Mapa e evolução | 6/10, unidades e fatores diferentes | Mostre a tabela de fatores, `atribuirSeries`, legenda e detalhe no mapa. | A mesma execução produz indicadores diferentes conforme a pergunta sobre o treino. |
| 7. Nutrição e validação | 4/10, requer ligar cálculo e persistência | Mostre `Alimento::totaisDaPorcao`, o diário e `tests/acompanhamento_http.php`. | Dá para comparar a conta feita à mão com o resultado persistido e exibido. |

## Perguntas do professor

- **Por que usar um serviço se já existe um controller?** Iniciar uma sessão envolve validar a rotina, bloquear a conta, procurar um treino ativo e copiar exercícios e metas. O serviço mantém essa operação inteira sob uma transação. O controller cuida da entrada HTTP e do destino da resposta.
- **O que acontece se o usuário finalizar duas vezes?** Na segunda chamada, `Treino::autorizar` reconhece o estado de destino. O serviço devolve o ID existente. Essa propriedade se chama idempotência.
- **O que impede uma data impossível?** A validação civil exige o formato exato e verifica dia, mês e ano com `checkdate`. Depois, o fluxo aplica seu intervalo. Por exemplo, 29 de fevereiro é aceito somente em ano bissexto.
- **Por que uma série pode aparecer em mais de um músculo?** O exercício pode ter várias relações musculares. Cada relação recebe sua ponderação. Somar essas estimativas entre músculos responderia a uma pergunta diferente da contagem de séries da sessão.
- **Como demonstrar que a regra funciona fora da tela?** Abra `tests/analise_unitario.php` para discutir entradas e resultados esperados. Em `tests/analise_integracao.php`, o MySQL também participa. Em `tests/analise_http.php`, a verificação atravessa a rota e a resposta HTTP.
