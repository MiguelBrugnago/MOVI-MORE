# MOVI+ — Design System

> Diretriz de interface e experiência do produto. Versão 1.0 — 26/11/2026.

## 1. Direção visual

O MOVI+ deve parecer um aplicativo de musculação feito para pessoas que treinam, e não um painel corporativo ou um template genérico de SaaS. A interface deve ser familiar no primeiro uso, rápida durante o treino e consistente em todas as telas.

**Princípio central:** menos distrações, mais clareza. A ação que a pessoa precisa realizar deve ser mais evidente que a decoração.

### Referências e identidade

- **Hevy:** registro direto de séries, valores anteriores, rotinas reutilizáveis, cronômetro, biblioteca de exercícios e histórico. Aproveitar a lógica de interação, não copiar a marca.
- **Symmetry:** registro sem distrações, linguagem natural, evolução pessoal e gamificação integrada à experiência. Não copiar a identidade cromática, telas, ilustrações ou ativos proprietários.
- **MOVI+ existente:** preservar o nome MOVI+, logotipo, conceito do produto e os elementos visuais que já funcionam. Antes de editar, identificar as cores, componentes, telas e padrões reais no código local. Não presumir que este documento descreva o estado atual.

Referências públicas: [Hevy — registro de treinos](https://www.hevyapp.com/features/track-workouts/) e [Symmetry — Gym Workout Tracker](https://apps.apple.com/br/app/symmetry-gym-workout-tracker/id6474446718). Este documento é uma proposta própria, não um design system oficial de terceiros nem uma cópia do Refero.

### Não utilizar

Roxo ou lilás; gradientes decorativos; arco-íris de cores por módulo; glassmorphism; neon; sombras fortes; cards aninhados desnecessários; excesso de badges; títulos gigantes; textos motivacionais genéricos; animações permanentes; emojis como ícones de navegação; gráficos meramente decorativos; interfaces com aparência de landing page dentro da área autenticada.

## 2. Prioridades e organização

1. Uso durante o treino: registrar uma série, consultar a anterior, avançar e descansar com o mínimo de interação.
2. Planejamento: localizar exercícios, montar e iniciar uma rotina rapidamente.
3. Evolução: entender tendências, histórico, metas e volume muscular sem precisar interpretar um relatório técnico.
4. Nutrição, avaliações, conquistas e recursos profissionais: integrar ao mesmo sistema de navegação e componentes, sem uma identidade visual independente.

Utilizar divulgação progressiva: mostrar primeiro o essencial e deixar ajustes avançados acessíveis, sem esconder funcionalidades existentes. Preferir uma ação primária por seção e evitar caminhos redundantes. Uma tela de treino não deve ser interrompida por promoções, notificações não essenciais ou gamificação.

## 3. Cores e tokens

Base neutra, com uma única cor de destaque para ações e seleção. O azul abaixo é a proposta de referência, escolhida pela familiaridade e legibilidade; se a marca atual já possui um destaque único compatível, manter essa cor em vez de introduzir uma segunda. Não manter roxo em nenhum componente de interface. Não recolorir o arquivo do logotipo arbitrariamente: se ele contiver roxo, sinalizar o conflito e usar uma versão monocromática existente ou aprovada. Cores semânticas são reservadas a estados reais, nunca a categorias decorativas.

| Token | Escuro (base proposta) | Claro (se já suportado) | Uso |
|---|---|---|---|
| `--ui-bg` | #111315 | #F6F7F8 | Fundo geral |
| `--ui-surface` | #1A1D20 | #FFFFFF | Cards, navegação, formulários |
| `--ui-surface-raised` | #22262A | #EEF0F2 | Campo, seleção neutra, sobreposição |
| `--ui-border` | #30353A | #DCE0E4 | Divisórias e contornos decorativos |
| `--ui-control-border` | #747D87 | #737C85 | Contornos essenciais de controles |
| `--ui-text` | #F3F4F5 | #16191D | Texto principal |
| `--ui-muted` | #A7AFB8 | #505A65 | Texto secundário legível |
| `--ui-accent` | #79B5FF | #205CC6 | Links, seleção, foco, série ativa |
| `--ui-primary` | #79B5FF | #205CC6 | Botão principal e gráfico principal |
| `--ui-on-primary` | #101820 | #FFFFFF | Texto sobre botão principal |
| `--ui-accent-soft` | #223449 | #E9F1FF | Seleção discreta, sem competir com CTA |
| `--ui-success` | #75C69D | #176B42 | Confirmação, série concluída |
| `--ui-warning` | #E7BA74 | #805100 | Atenção que requer decisão |
| `--ui-danger` | #FF9292 | #B42318 | Erro e ação destrutiva |

Escuro é a proposta inicial, não obrigação de remover o modo claro atual. Se houver escolha de tema implementada, conservar a preferência do usuário e aplicar os tokens equivalentes. Não implementar um novo sistema de temas como requisito desta reforma. Validar contraste nas combinações reais (WCAG AA: 4,5:1 para texto normal, 3:1 para texto grande e indicadores essenciais), incluindo hover, foco e estados de erro. Não depender exclusivamente de cor para indicar estado.

Centralizar tokens no CSS global existente; reaproveitar nomes de variáveis se possível, sem criar sistemas paralelos. Não espalhar valores hexadecimais pelas views. Usar `color-scheme` de acordo com o tema efetivo quando aplicável.

## 4. Tipografia, espaçamento e superfícies

- Fonte: manter a família sans-serif atual se legível; fallback local `system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif`. Não baixar fontes por obrigação.
- Texto base: 16px, line-height 1.5; valores e tabelas: 14–16px; texto auxiliar: 13–14px, sem reduzir controles para caber.
- Títulos de página: 24–28px, peso 600–700; títulos de seção: 18–20px, peso 600; labels: 14px, peso 500–600. Valores de destaque: 24–32px apenas onde úteis.
- Números de peso, séries, tempo e métricas: `font-variant-numeric: tabular-nums`.
- Escala de espaçamento: 4, 8, 12, 16, 24, 32, 40 e 48px. Margem mobile padrão: 16px; desktop: 24–32px.
- Raios: controles 8px; cards 12px; diálogos 16px. Formas totalmente arredondadas apenas para chips e avatares.
- Bordas finas e discretas; elevação mínima. Usar sombra somente quando houver sobreposição real, como modal ou menu.
- Áreas de toque: preferir pelo menos 44×44 CSS px, com separação suficiente. Altura padrão de botão/campo 44–48px.
- Ícones de traço simples, consistentes, 20–24px; usar biblioteca existente ou SVG locais. Rótulos visíveis para navegação. Ícones isolados precisam de nome acessível e, no desktop, tooltip quando necessário.

## 5. Layout responsivo e navegação

**Mobile-first**, sem perder utilidade no desktop. Reaproveitar a arquitetura de layout e os componentes compartilhados existentes.

- Até 767px: uma coluna, header enxuto, navegação inferior se compatível com a navegação atual. Sugestão: Início, Treinos, Evolução, Perfil; Nutrição e Conquistas podem ficar no perfil ou em um ponto de acesso contextual claro. Se Nutrição já for um destino primário, preservá-la como quinta aba. Não criar rotas fictícias.
- 768–1023px: ajustar lista e detalhes conforme espaço, sem comprimir formulários.
- A partir de 1024px: menu lateral estável (aprox. 224–256px), conteúdo central, agrupamento de funcionalidades; largura útil limitada conforme tipo de tela. Fluxo de treino preferencialmente entre 680–840px, área analítica pode aproveitar até 1200px. Não preencher espaço com cards inúteis.
- Navegação ativa com texto e marcação de posição; não usar apenas cor. Respeitar safe areas e espaço ocupado por barras fixas, teclado virtual e cronômetro. Evitar cabeçalhos gigantes e navegações duplicadas.
- Durante treino, manter acesso ao treino ativo e à ação de finalizar quando disponíveis; não criar mecanismo de retomada fictício. Nunca ocultar campo focado atrás de barra fixa.
- URLs, rotas, permissões e fluxo de navegação existente são fonte de verdade. Não expor páginas administrativas ou profissionais a perfis não autorizados.

## 6. Componentes reutilizáveis

| Componente | Regra |
|---|---|
| Botão primário | Fundo de destaque, contraste alto, texto objetivo; uma ação principal por contexto. |
| Botão secundário | Neutro, contorno discreto ou texto; não competir com primário. |
| Ação destrutiva | Texto/estado semântico de erro; confirmação quando irreversível. |
| Campo | Label persistente, valor claro, unidade explícita, ajuda e erro próximos ao campo. |
| Card | Usar para agrupar um conceito; listas simples podem usar divisórias em vez de um card por item. |
| Lista de exercícios | Miniatura consistente, nome, músculo/equipamento quando disponível; favoritos e ações acessíveis. |
| Filtro | Busca primeiro, chips neutros, filtros adicionais em painel quando necessário; limpar seleção fácil. |
| Modal/painel | Uma tarefa delimitada, fechar/cancelar acessível, foco gerenciado e retorno ao elemento de origem. |
| Toast | Feedback breve e complementar; erro de formulário também fica no campo. Não cobrir a ação principal. |
| Estado vazio | Explicar a ausência e oferecer ação real. Não mostrar métricas inventadas. |
| Carregamento | Desabilitar submissão em andamento, manter contexto, anunciar estado; skeleton só onde evita salto de layout. |
| Tabela | Cabeçalho claro, valores alinhados, sem linhas verticais excessivas. Em mobile, preservar relação label–valor e não esconder dados. |

Usar elementos HTML semânticos (`button`, `label`, `input`, `nav`, `main`, `table` quando apropriado). Não substituir botões por `div` clicável. Não usar placeholder como único label. Manter foco de teclado visível, ordem lógica e `aria-live` para feedback relevante, sem anunciar o cronômetro a cada segundo.

## 7. Telas e fluxos

### Início

Mostrar contexto útil: próxima rotina (se houver), treino ativo (se houver), ação de iniciar, resumo semanal e atividade recente. Organizar por prioridade, não por quantidade de funcionalidades. Evitar KPIs artificiais, saudações grandes, banners e cards vazios em sequência. Na ausência de treinos, orientar a criar uma rotina ou iniciar um treino conforme as ações reais.

### Treinos e rotinas

Acesso imediato a iniciar treino e rotinas existentes. Cada item mostra nome, informações disponíveis e ação de iniciar. Editar, duplicar ou excluir em ações secundárias apenas quando já implementadas. Rotinas: lista de exercícios em ordem, séries e metas editáveis, descanso, observações e superset se disponíveis. Evitar formulários separados para cada dado quando edição inline é viável e segura. Diferenciar editar rotina de executar treino; nunca alterar uma rotina implicitamente ao registrar uma sessão.

### Treino em andamento — prioridade máxima

Header compacto: nome da sessão, duração e finalizar treino. Cada exercício: miniatura, nome, opções, observação e descanso se disponíveis. Usar uma grade de séries simples, com campos editáveis e botão explícito de conclusão.

Exemplo conceitual (não são dados reais):

```text
Supino reto
Descanso: 02:00                       ⋯
Série    Anterior     kg    Reps    Feita
  1      60 × 10     [60]   [10]     [✓]
  2      60 ×  9     [60]   [ 9]     [ ]
  3      60 ×  8     [60]   [ 8]     [ ]
+ Adicionar série
```

- Valores anteriores são referência, não conclusão automática; distinguir metas, valores registrados e ausência de histórico.
- Campos com teclado apropriado, unidade visível, decimal compatível com o backend e separação suficiente entre toque e concluir série.
- Série concluída: check + estado visual discreto; ignorada ou aquecimento têm rótulo próprio quando o domínio suporta. Não depender de verde/vermelho.
- RPE/RIR, lado, tempo, observações e demais atributos existentes: exibir conforme tipo de exercício, contexto e suporte real; não removê-los. Priorizar campos essenciais, colocar avançados em área expansível se isso não prejudicar o registro.
- Descanso/cronômetro: compacto, legível, não cobrir campos; respeitar estado real e preservar valores durante a sessão. Não alterar regras de temporização ou salvamento por motivos visuais.
- Finalizar e descartar são ações diferentes. Exibir o resultado real da persistência; não mostrar sucesso antes de confirmação do servidor. Preservar prevenção de duplicatas e demais garantias do fluxo existente.

### Biblioteca de exercícios

Busca visível, filtros por músculo/equipamento/ambiente se implementados, lista com miniaturas de proporção estável, nome e informação secundária. Evitar mosaico de cards grandes para navegação de um catálogo extenso. Usar GIF/vídeo quando realmente disponível; sem mídia, usar placeholder neutro e acessível. Preservar paginação, filtros e favoritos existentes. Não inventar exercícios, nem utilizar ativos proprietários de outras plataformas.

### Evolução, histórico e mapa muscular

Exibir período, unidade, fonte dos valores e estado sem dados. Gráficos com uma cor de destaque, eixos discretos e comparação por traço/estilo quando necessário. Não usar múltiplas cores decorativas. Mapa muscular: neutro para sem dados e intensidade sequencial de uma única tonalidade para o volume; legenda com faixas e valores textuais acessíveis. Não confundir volume, força ou desenvolvimento estimado; manter definição e cálculo existentes. Histórico cronológico com detalhes das sessões. Avaliações físicas, metas e medidas com contexto, sem julgamento sobre aparência ou desempenho.

### Nutrição

Resumo de ingestão e meta quando houver dados reais; refeições como listas e ações de registro. Macros com rótulos e barras da mesma família cromática; diferença entre atingido e restante perceptível por posição, texto e preenchimento. Não inventar recomendações clínicas, valores nutricionais ou metas. Usar o mesmo padrão de inputs, filtros e estados das outras áreas.

### Conquistas e perfil

Gamificação discreta e secundária ao treino: nível, XP, progresso para próxima conquista e recordes com significado, se disponíveis. Não criar cores diferentes para cada medalha; ícone, contorno e texto distinguem estados. Feedback breve, sem bloquear o próximo passo. Perfil com dados, preferências e configurações organizadas por seção; informações sensíveis e ações de conta separadas. Evitar pressão por sequência de treinos, comparações corporais ou mensagens culpabilizantes.

### Login, cadastro e áreas profissionais

Login/cadastro simples, campos claros, sem publicidade ou ilustrações gratuitas que prejudiquem foco. Reaproveitar autenticação, mensagens e proteção existentes. Aplicar o sistema às áreas profissionais/administrativas realmente existentes, com maior densidade de dados quando útil, sem mudar autorizações ou papéis.

## 8. Linguagem e comportamento

Português brasileiro, frases curtas e naturais, verbos claros. Usar os termos que já existem no domínio do MOVI+ quando corretos. Exemplos: `Iniciar treino`, `Nova rotina`, `Adicionar exercício`, `Finalizar treino`, `Treino salvo`, `Nenhum treino registrado ainda`, `Não foi possível salvar. Tente novamente.` Mensagens devem refletir o estado real; não prometer recuperação automática se ela não existir.

Evitar frases como “Maximize sua jornada fitness!”, “Aprimore sua performance agora!” e labels genéricos como “Gerenciar” quando houver uma ação específica. Erros explicam o que aconteceu e como continuar, sem expor stack trace. Consistência de unidades e formatação pt-BR, sem alterar representação exigida por PHP/JavaScript/SQL.

Movimento discreto (120–200ms quando útil), respeitando `prefers-reduced-motion`. Evitar layouts que pulam, scroll automático inesperado e feedback que interrompe a digitação. Interações devem funcionar com toque, mouse e teclado.

## 9. Implementação no repositório

O MOVI+ é um projeto PHP orientado a objetos, sem framework, com views HTML, CSS e JavaScript próprios. Confirmar estrutura e convenções reais antes de qualquer alteração. Reaproveitar o layout, CSS, assets e JavaScript existentes; separar componentes reutilizáveis conforme a organização atual. Não introduzir React, Vue, Tailwind, Bootstrap, dependências, fontes externas, novos serviços ou JSON como formato de domínio por causa desta revisão visual.

1. Ler instruções locais e `DESIGN.md`; conferir `git status --short` e `git diff` sem reverter alterações do usuário. Inventariar rotas, views, layouts, estilos, JS, assets e estados visuais. Identificar os componentes atuais que devem permanecer. Capturar baseline visual se o ambiente permitir.
2. Consolidar tokens, componentes básicos e navegação compartilhada. Reutilizar CSS existente; não duplicar arquivos ou manter duas versões concorrentes da interface. Preservar IDs, atributos, seletores, nomes de campos e contratos utilizados pelo JavaScript e backend, ou atualizar referências de forma coerente quando indispensável.
3. Aplicar primeiro às telas de treino em execução, rotinas e biblioteca; validar seus fluxos. Em seguida, início, evolução, histórico, mapa muscular, perfil, conquistas, nutrição, autenticação e áreas profissionais conforme existirem. Não criar funcionalidades fictícias para preencher o layout.
4. Revisar responsividade, acessibilidade, estados vazios, carregamento, erros, sucesso, tema e navegação. Remover estilos mortos somente depois de conferir referências e testes.
5. Executar testes disponíveis, revisar diff e informar resultado. Caso uma limitação impeça teste visual ou funcional, registrar explicitamente o que ficou sem validação.

**Escopo:** mudanças de apresentação e usabilidade; pequenos ajustes de integração de UI podem ser necessários e devem ser justificados. Não modificar esquema do banco, migrations, seeds, catálogo, IDs, modelos, regras de cálculo, regras de autenticação, CSRF, autorização, persistência, histórico ou contratos de rotas para acomodar o redesign. Se houver defeito de backend ou recurso ausente, registrar separadamente, sem mascará-lo. Não inserir dados falsos, não substituir dados reais por mocks, não introduzir marca de terceiros. Não executar commit, push, pull, merge, reset, checkout destrutivo ou remoção de alterações do usuário. Não incluir coautoria.

## 10. Critérios de aceitação

- [ ] Uma identidade coerente, neutra, sem roxo ou paleta multicolorida; uma cor primária e estados semânticos discretos.
- [ ] Nome, logo e identidade MOVI+ preservados, com conflitos cromáticos identificados.
- [ ] Uso confortável em 320, 375, 390, 768, 1024 e 1440px; sem scroll horizontal da página, sobreposição ou campos cortados. Se uma tabela exigir scroll local, tornar isso evidente e preservar a relação entre cabeçalhos e células.
- [ ] Fluxo de iniciar, editar e concluir treino funcional; sem perda de registros, duplicações ou regressão em rotina, histórico, descanso e atributos avançados que já existam.
- [ ] Busca, filtros, cadastro, login, perfil, avaliações e demais fluxos existentes permanecem funcionais, respeitando permissões.
- [ ] Todas as ações exibidas fazem algo real; feedback coerente com resultado do servidor. Estados sem dados e de erro são claros.
- [ ] Contraste AA, navegação por teclado, foco visível, labels, controles adequados ao toque, ícones acessíveis e movimento reduzido.
- [ ] CSS centralizado e reaproveitado; sem dependências desnecessárias ou alterações de domínio.
- [ ] Testes PHP/JS e integração existentes executados quando possíveis; verificar `git diff --check`. Testar manualmente os fluxos principais no navegador ou declarar indisponibilidade. Não alegar aprovação de testes não executados.
- [ ] Relatório final com arquivos modificados, decisões de design, validações realizadas, limitações e pendências; sem operações Git de publicação.

## 11. Regra para futuras telas

Antes de criar ou alterar interface, reutilizar os tokens e componentes deste documento. Se uma necessidade real exigir exceção, explicar por que ela melhora o uso e atualizar o design system de forma consistente, sem criar uma segunda linguagem visual.
