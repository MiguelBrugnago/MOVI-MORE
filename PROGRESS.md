# MOVI+ — progresso da apresentação

## Retomada

- Concluídos o diagnóstico inicial, a leitura das diretrizes e a consolidação dos tokens, controles, navegação responsiva e superfícies em `public/assets/css/app.css`. O verde vem do logotipo horizontal existente.
- Parcialmente implementados o treino, as séries, a biblioteca, o seletor, as rotinas e o histórico, com alterações em `app/Views/{treino.php,treinos/serie.php,exercicios.php,treino_seletor.php,rotinas.php,treino_historico.php}`.
- O trabalho anterior de domínio deixou diagnóstico de constantes, IDs e composição nutricional. O ambiente de validação anterior usou MySQL descartável e encontrou uma divergência na asserção HTML da nutrição. As três suítes unitárias passaram novamente na retomada.
- Próxima etapa: integrar o cabeçalho e o painel aos estilos compartilhados, concluir o fluxo de treino e as mudanças de domínio, depois executar integração, HTTP e navegador. AGENTS.md e DESIGN.md já estavam no diretório antes da tarefa.

## Implementação integrada

- Layout compartilhado, início público, login, cadastro e painel do aluno revisados. O painel usa a sessão real em andamento e uma consulta por proprietário limitada ao último treino concluído. Atualizados PainelController, TreinoRepository e as respectivas views.
- Os estilos da análise usam os componentes globais. A evolução física usa os mesmos tokens no gráfico. Nutrição exibe totais e metas com unidades e uma barra quando há meta positiva. O acompanhamento do aluno oferece a consulta alimentar conforme o consentimento.
- Sete objetivos, três níveis de experiência e dez medidas centralizados em PerfilFisicoConstantes, com aliases públicos. AnaliseTreinoController usa Validacao::idOpcional. Alimento calcula os quatro totais da porção usada por NutricaoRepository. Testes pontuais de perfil, IDs e porções atualizados.
- Verificações intermediárias: as três suítes unitárias passaram com 134 verificações de POO; o lint dos 14 arquivos técnicos passou. O Docker confirmou o ambiente isolado na porta 18091. A validação visual inicial percorreu 16 páginas nas seis larguras. Próxima etapa: repetir as suítes e o navegador com a versão integrada e conferir o diff final.

## Rotinas e modelos

- `RotinaController.php`, `rotinas.php` e `app.css` organizam a lista por nome, dia, exercícios e séries. A consulta de leitura inclui rotinas vazias e conta cada exercício uma vez. O editor agrupa opções secundárias e mantém uma série aberta por exercício.
- Revisados os destinos de início, edição, arquivamento e propostas. Próxima etapa: diário e planejamento alimentar. Validação integrada e visual pendente.

## Nutrição

- `nutricao.php` e `app.css` aproximam a data do título, compactam os quatro totais e exibem os macronutrientes gravados em cada porção. Registro, catálogo, rascunho e preferências usam controles expansíveis. A consulta profissional continua somente leitura.
- Conferidos os campos do diário, os limites para exibir progresso e a asserção histórica de 175 kcal. Próxima etapa: mapa muscular e validação das suítes.

## Mapa muscular

- `MapaMuscular.php`, `treino_analise.php` e `analise.css` usam contornos SVG curvos, preservando os códigos, as vistas, os destinos dos links e o tratamento de regiões indisponíveis. Músculos sem séries ficam em cinza. A métrica zero de um músculo registrado tem faixa própria. Os limites continuam definidos em `AnaliseTreinoService::FAIXAS`.
- Conferidos o fluxo de teclado e os seletores de seleção. Próxima etapa: testes unitários, integração, HTTP e verificação responsiva no navegador.

## Validação final para a apresentação

- No ensaio móvel, o formulário de uma série adicional repetia a referência da série 1. `app/Views/treino.php`, `app/Views/treinos/serie.php` e `RotinaController.php` passaram a identificar a posição real, inclusive após salvamento assíncrono. `tests/treinos_http.php` verifica as referências da primeira e da segunda séries e a ausência de referência para uma terceira sem histórico.
- O mapa preserva período e métrica ao aplicar filtros na própria rota. A legenda identifica a métrica em uso. O detalhe escolhido abre individualmente e oferece retorno ao mapa.
- Lint aprovado nos oito arquivos PHP modificados. O executor unitário passou nas três suítes, incluindo 134 verificações de POO. O executor completo passou nas 12 suítes no Compose de testes, com MySQL em memória, 20 migrations e 623 exercícios públicos ativos. A asserção original de acompanhamento conferiu as 175 kcal no dia histórico. Revisados os usos de PerfilFisicoConstantes, Validacao::idOpcional e Alimento::totaisDaPorcao.
- Chrome com Playwright em 320, 360, 375, 390, 768, 1024 e 1440 px: lista e editor de rotinas, nutrição, mapa e registro de séries. Cadastro, login, seleção e inclusão de exercício, série de 22 kg × 9, finalização, histórico, reaproveitamento dos valores, arquivamento e restauração, plano publicado, consumo de 125 g, filtros e seleção do mapa por toque e teclado passaram. Sem erros de console ou transbordamento horizontal nas páginas verificadas.
- Biblioteca, seletor, histórico, evolução, avaliação física, metas, vínculos, modelos, alunos, propostas e perfil profissional conferidos em 360, 768 e 1440 px. Consentimento, revogação e proposta aceita foram verificados pelas suítes HTTP. No conteúdo textual medido em 390 px, o menor contraste foi de 7,47:1. Ensaio responsivo em navegador com viewport emulado.
- Validação concluída para o escopo da apresentação. O banco principal permaneceu fora dos ensaios. Próxima etapa sugerida: demonstrar a passagem de uma rotina à sessão concluída e confrontar os resultados com os objetos de domínio.
