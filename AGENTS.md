# AGENTS.md — MOVI+

## 1. Objetivo e escopo

O MOVI+ é um projeto acadêmico de Ciência da Computação voltado à musculação, ao planejamento e registro de treinos, à evolução física, à nutrição e à gamificação. O objetivo é desenvolver um produto funcional, seguro, simples de usar e compreensível por um estudante de graduação.

Estas instruções se aplicam ao repositório inteiro. Respeite também instruções locais aplicáveis ao diretório em que estiver trabalhando. O pedido atual do usuário define o escopo da tarefa. Não transforme uma alteração pontual em uma refatoração geral sem necessidade.

- Use sempre o nome **MOVI+**, inclusive na interface e documentação.
- Use o código e o banco versionado como fontes de verdade; não presuma que o README ou este arquivo descrevam o estado atual de cada funcionalidade.
- Quando solicitado a implementar ou corrigir algo, execute as alterações e valide o resultado. Não entregue apenas um plano, salvo quando esse for o pedido.
- Não declare uma funcionalidade concluída apenas porque existe uma classe, tabela, rota ou tela.
- Preserve funcionalidades existentes e decisões anteriores, salvo mudança solicitada explicitamente.

## 2. Antes de modificar o projeto

1. Leia este arquivo, o README, as instruções locais e os arquivos relevantes. Para qualquer alteração visual ou de experiência de uso, leia também `DESIGN.md` na raiz.
2. Inspecione `git status --short`, `git diff` e, quando necessário, `git diff --cached`. Identifique alterações preexistentes e não as descarte.
3. Entenda a estrutura real, as dependências, as configurações, os fluxos e os testes relacionados à tarefa.
4. Identifique a causa de erros antes de aplicar correções. Não faça mudanças especulativas em áreas não relacionadas.
5. Para tarefas extensas, divida o trabalho em etapas verificáveis e valide cada fluxo afetado.

Não considere uma tarefa impossível apenas porque o ambiente ainda não está iniciado. Inspecione as configurações e use os recursos disponíveis de forma segura. Se uma validação depender de credenciais, permissões ou serviços indisponíveis, informe a limitação sem inventar resultados.

## 3. Arquitetura e tecnologias

A base do projeto é PHP orientado a objetos, sem framework de aplicação, MySQL, HTML, CSS e JavaScript, com ambiente Docker Compose. Confirme versões e estrutura em `composer.json`, `compose.yml` e nos arquivos de configuração reais.

Respeite as responsabilidades das camadas existentes:

| Camada | Responsabilidade |
| --- | --- |
| `app/Controllers/` | Receber requisições, coordenar fluxos e encaminhar respostas. |
| `app/Models/` | Representar entidades e comportamento do domínio. |
| `app/Repositories/` | Consultar e persistir dados. |
| `app/Services/` | Concentrar regras e operações de negócio, conforme arquitetura existente. |
| `app/Views/` | Apresentar dados e formulários, sem concentrar regras de negócio. |
| `app/Config/` e `app/Security/` | Configuração, conexão e mecanismos de segurança quando presentes. |
| `routes/` e `public/` | Rotas, entrada pública e assets. |
| `database/` | Migrations, seeds e ferramentas de banco. |
| `tests/` | Testes e infraestrutura de validação. |

A tabela descreve a organização conhecida; confirme os nomes e responsabilidades reais antes de criar arquivos.

- Mantenha POO, encapsulamento, responsabilidades claras e reaproveitamento de código, sem abstrações desnecessárias.
- Siga o autoload, namespaces, padrões de nomes, tipagem e organização adotados no projeto.
- Não introduza Laravel, Symfony, React, Vue, Tailwind, Bootstrap ou outras dependências por conveniência. Qualquer mudança de stack exige autorização explícita.
- Use o PDO e o mecanismo de conexão existentes. Não crie conexões paralelas nem coloque SQL de negócio nas views.
- Não introduza JSON como formato de armazenamento ou modelagem de domínio. Preserve contratos HTTP/JavaScript e serializações existentes quando necessários; não remova JSON já funcional por causa desta regra.
- Prefira soluções compatíveis com o conteúdo acadêmico e com a manutenção futura. Não simplifique a ponto de comprometer segurança ou integridade.

## 4. Estilo de código e documentação

- Use nomes claros, coerentes com o domínio e com os arquivos existentes; preserve o português nos conceitos de negócio quando esse for o padrão local.
- Mantenha indentação, formatação, encoding e finais de linha compatíveis com o repositório.
- Prefira funções e métodos com responsabilidade definida. Evite duplicação, classes gigantes, constantes mágicas e complexidade artificial.
- Não renomeie classes, tabelas, atributos, rotas, arquivos ou seletores sem necessidade. Se renomear for parte do pedido, atualize todas as referências e teste a compatibilidade.
- Não use comentários para repetir o que uma linha óbvia já diz. Comente motivos, regras de negócio, decisões não intuitivas, casos especiais e garantias de segurança.
- Escreva comentários naturais, objetivos, em português brasileiro e compatíveis com o nível acadêmico do projeto. Não insira textos promocionais, referências à IA, créditos ou coautoria.
- Não use TODO como substituto de implementação solicitada; registre pendências reais de maneira precisa.
- Atualize a documentação quando houver mudanças reais de instalação, comandos, requisitos ou comportamento. Não anuncie como pronto o que ainda não foi implementado.

## 5. Banco de dados e integridade

- Preserve dados existentes, IDs, relacionamentos, chaves estrangeiras, constraints e índices necessários.
- Não edite retroativamente migrations já aplicadas ou registradas. Use uma nova migration sequencial, compatível com o runner e o histórico existentes, quando a tarefa exigir alteração de esquema.
- Preserve verificações de integridade, checksum, locking, ordem de aplicação e mecanismos de recuperação do runner de migrations.
- Não manipule manualmente o histórico de migrations para esconder falhas. Não execute operações destrutivas no banco de desenvolvimento ou em bases com dados do usuário sem autorização explícita.
- Não execute `DROP DATABASE`, `TRUNCATE`, exclusões em massa, reset de banco, `docker compose down -v` ou remoção de volumes por conveniência. Utilize banco isolado para testes destrutivos.
- Mantenha seeds e catálogo de exercícios consistentes. Não duplique registros, não regenere IDs arbitrariamente e não apague exercícios inativos que sejam referenciados pelo histórico. Preserve identificadores e convenções atuais; não introduza prefixos ou referências explícitas a plataformas concorrentes.
- Use transações para operações relacionadas que precisem de atomicidade. Preserve idempotência, unicidade e proteção contra concorrência quando existentes.
- Evite consultas N+1, carregamento desnecessário do catálogo inteiro e consultas sem filtros de proprietário. Avalie índices e planos de execução quando pertinente, sem adicionar índices indiscriminadamente.
- Não altere migrations, seeds, esquema ou regras de negócio para resolver um problema exclusivamente visual.

## 6. Segurança e privacidade

- Preserve autenticação, autorização, papéis/permissões, sessões, CSRF, limitação de tentativas de login e auditoria existentes.
- Verifique no servidor a identidade, a permissão e a propriedade de cada recurso. Nunca confie apenas em campos ocultos, IDs enviados pelo cliente, cookies, JavaScript ou visibilidade de botões.
- Proteja contra SQL injection com consultas preparadas e parâmetros. Valide entradas e use listas permitidas para identificadores SQL dinâmicos, quando inevitáveis.
- Escape dados conforme o contexto de saída (HTML, atributos, URLs ou JavaScript), utilizando os mecanismos existentes. Não desative validações ou proteções para corrigir um erro de interface.
- Preserve o hashing seguro de senhas e a proteção de sessões. Não registre senhas, tokens, segredos ou dados pessoais sensíveis em logs.
- Não inclua credenciais reais no código, exemplos, commits ou respostas. Preserve `.env` e outros arquivos sensíveis; use placeholders nos exemplos.
- Trate avaliações físicas, condições de saúde, dados de perfil e alimentação como informações privadas. Não exponha dados de outro usuário ou aluno sem autorização válida.
- Erros ao usuário devem ser compreensíveis, sem revelar stack traces, SQL, credenciais ou detalhes internos. Registre informações técnicas de forma segura quando necessário.

## 7. Interface e experiência de uso

O arquivo [`DESIGN.md`](./DESIGN.md) é a referência de design do MOVI+. Leia-o integralmente antes de criar ou alterar views, layouts, CSS, componentes, assets visuais ou JavaScript de interface. Este arquivo define a engenharia; `DESIGN.md` detalha a linguagem visual e os fluxos de interação.

- Combine praticidade do Hevy, simplicidade do Symmetry e identidade atual do MOVI+, sem copiar marcas, logos, telas ou assets proprietários.
- Priorize minimalismo funcional, linguagem humana, acessibilidade, rapidez durante o treino e responsividade mobile-first.
- Use base neutra, uma única cor de destaque e cores semânticas discretas. Não use roxo, gradientes decorativos, neon, excesso de cores ou aparência de SaaS corporativo.
- Preserve nome, marca, elementos visuais úteis e preferências de tema existentes, observando os critérios de `DESIGN.md`.
- Reaproveite tokens CSS, layout e componentes compartilhados. Não crie sistemas de estilos concorrentes nem espalhe cores e espaçamentos arbitrários pelas views.
- Mantenha textos em português brasileiro, controles com labels, estados de foco, contraste adequado, navegação por teclado e áreas de toque confortáveis.
- Mantenha a relação entre campos, seletores, IDs, atributos, rotas, formulários e contratos de JavaScript/backend. Se for necessário alterá-los, atualize o fluxo inteiro e valide-o.
- Use dados reais. Não insira números fictícios, mocks em produção, botões sem função, falsas confirmações ou telas para recursos não implementados.
- Durante treino, priorize registro das séries, valores anteriores, carga, repetições, descanso e conclusão. Não esconda atributos avançados já disponíveis.
- Se a tarefa for exclusivamente de UI, não modifique o domínio, cálculos, persistência, autenticação, permissões, migrations ou seeds. Sinalize defeitos de backend separadamente, salvo se sua correção fizer parte do pedido.

## 8. Regras específicas do domínio

Estas são garantias a preservar onde já implementadas, não uma autorização para criar funcionalidades fora do escopo.

- **Rotinas e treinos:** diferencie planejamento da execução. Alterar registros de uma sessão não deve alterar silenciosamente a rotina original. Preserve ordem, metas copiadas, valores efetivos, descanso, supersets, observações, RPE/RIR, lado e estados de série quando suportados.
- **Histórico:** não permita que editar ou inativar um exercício destrua ou reescreva sessões históricas. Preserve snapshots, relacionamentos e dados previamente registrados.
- **Catálogo:** preserve busca, filtros por músculo/equipamento/ambiente, favoritos, identificadores e mídias legítimas quando disponíveis.
- **Evolução e mapa muscular:** preserve definição e cálculo das métricas, período, unidade, músculos envolvidos e ausência de dados. Não confunda volume registrado, força e desenvolvimento estimado.
- **Nutrição e avaliações:** diferencie dados registrados de metas; não invente valores nutricionais, recomendações clínicas ou medições.
- **Gamificação:** use eventos reais para pontuação, recordes e conquistas. Preserve garantias contra concessão duplicada. Não transforme a gamificação em obstáculo ao registro de treino.
- **Profissionais:** respeite os vínculos e permissões entre usuário, aluno e profissional. Não exponha dados de terceiros.

## 9. Ambiente de desenvolvimento

O ambiente conhecido utiliza Windows, Docker Desktop/WSL2, PHP e MySQL. As versões, serviços, portas, credenciais e caminhos podem variar entre máquinas. Consulte o `compose.yml`, `.env.example` quando existir, README e scripts reais antes de executar comandos.

Comandos úteis, quando aplicáveis:

```sh
git status --short
git diff --check
docker compose config --quiet
docker compose ps
docker compose up -d
```

- Use `docker compose up -d` apenas quando necessário para o trabalho local e depois de verificar os serviços e configurações. Não recrie ou apague volumes automaticamente.
- Para executar PHP, testes ou migrations em contêiner, identifique primeiro o serviço correto em `docker compose config --services` e utilize os comandos documentados do projeto.
- Não invente nomes de serviços, scripts, comandos Composer ou credenciais. Não execute `composer update` para corrigir dependências ausentes; inspecione primeiro o lockfile e o procedimento de instalação.
- Antes de executar migrations ou seeds, identifique a base de destino e confirme que a operação está dentro do escopo. Prefira instalação limpa e banco isolado para validação de migrações.

## 10. Testes e revisão final

Valide de acordo com o impacto da tarefa. Não confunda sintaxe válida com fluxo funcional.

1. Execute verificação de sintaxe PHP (`php -l`) nos arquivos alterados, usando PHP local ou o contêiner correspondente.
2. Execute os testes unitários, de integração e HTTP relevantes que realmente existirem, conforme a documentação. Use dados de teste e ambiente isolado para operações de escrita ou destrutivas.
3. Para alterações JavaScript/CSS/views, teste o fluxo no navegador quando disponível, verifique erros de console, requisições, formulários e responsividade.
4. Confira fluxos positivos e negativos: permissões, dados inválidos, recursos inexistentes, duplicatas, estados vazios e falhas de persistência quando relacionados à tarefa.
5. Em redesign, valide os critérios de aceitação de `DESIGN.md`, incluindo celular, tablet, desktop e registro de treinos.
6. Revise `git diff` e execute `git diff --check`. Confirme que mudanças preexistentes foram preservadas, sem arquivos temporários, segredos ou modificações desnecessárias.

Não altere testes apenas para fazê-los passar. Se uma expectativa tiver mudado legitimamente por requisito do usuário, explique e atualize os testes correspondentes. Nunca declare que testes passaram se não foram executados. Diferencie falhas preexistentes verificadas de regressões introduzidas; se não houver baseline, não faça essa atribuição sem evidência.

## 11. Git e controle de alterações

- Não execute automaticamente `git commit`, `git push`, `git pull`, `git merge`, `git rebase`, criação/troca de branch ou publicação de PR. Só realize a operação específica se o usuário autorizar explicitamente e as demais instruções permitirem.
- Não use `git reset --hard`, `git clean -fd`, restauração destrutiva, force push ou reescrita de histórico para concluir uma tarefa. Não sobrescreva nem descarte alterações preexistentes do usuário.
- Não inclua `Co-authored-by`, créditos de IA, assinaturas automáticas ou referências ao agente em código, documentação, commits ou PRs.
- Não faça commits de alterações não relacionadas quando o usuário solicitar comandos de commit. Sugira agrupamentos coerentes, selecione os arquivos necessários e use mensagens claras compatíveis com o histórico do projeto.
- Não crie arquivos auxiliares, relatórios ou scripts temporários dentro do repositório se não forem necessários ao resultado. Remova somente temporários criados pela própria tarefa e comprovadamente dispensáveis.

## 12. Entrega da tarefa

Ao finalizar uma implementação, informe objetivamente, em português brasileiro:

- O que foi implementado ou corrigido e, quando relevante, a causa original do problema.
- Arquivos e áreas modificados (agrupe por funcionalidade quando houver muitos).
- Decisões relevantes tomadas durante o trabalho e seus motivos.
- Testes e verificações realmente executados, com os resultados.
- Limitações, falhas, riscos ou pendências que ainda existam.
- Comandos necessários para executar ou validar localmente, se aplicável.

Não declare o projeto inteiro pronto se somente um módulo foi validado. Não oculte falhas. Não prometa executar atividades no futuro. Não faça alterações adicionais após concluir o escopo apenas para aumentar a quantidade de mudanças.

## 13. Manutenção das instruções

Mantenha este documento como orientação permanente de engenharia e colaboração. Mantenha `DESIGN.md` como orientação permanente de UI/UX. Não modifique nenhum dos dois para contornar uma restrição; atualize-os quando o usuário solicitar uma mudança de diretriz ou quando a tarefa autorizar explicitamente essa atualização. Se houver conflito material entre instruções locais, requisitos e código atual, explique o conflito e preserve os dados e a segurança.
