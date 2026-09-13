# 📚 Estuda APP — Simulados SES/SECAD-TO (FGV)

Aplicativo moderno e offline de simulados para concursos públicos desenvolvido em **Flutter**, estruturado rigorosamente com base no **Edital nº 001/2026** do concurso **SES/SECAD-TO** (Secretaria de Estado da Saúde e Secretaria da Administração do Estado do Tocantins), sob organização da banca **FGV (Fundação Getulio Vargas)**.

O projeto conta com suporte dinâmico a **múltiplos cargos de Nível Médio e Nível Superior**, respeitando a matriz de disciplinas, pesos oficiais, distribuição proporcional por amostragem matemática e persistência de desempenho no próprio dispositivo.

---

## 📑 Sumário

- [Visão Geral e Contexto](#-visão-geral-e-contexto)
- [Cargos Suportados & Regras do Edital](#-cargos-suportados--regras-do-edital)
- [Funcionalidades Principais](#-funcionalidades-principais)
- [Destaques Técnicos](#-destaques-técnicos)
  - [Motor de Simulados Inteligente (`QuizEngine`)](#motor-de-simulados-inteligente-quizengine)
  - [Histórico e Estatísticas Locais](#histórico-e-estatísticas-locais)
- [Banco de Questões Autoral](#-banco-de-questões-autoral)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Como Rodar](#-como-rodar)
- [Testes e Garantia de Qualidade](#-testes-e-garantia-de-qualidade)
- [Geração de Build (Android APK & Web)](#-geração-de-build-android-apk--web)
- [Próximos Passos e Extensibilidade](#-próximos-passos-e-extensibilidade)

---

## 🎯 Visão Geral e Contexto

A banca **FGV** possui um perfil reconhecido por enunciados contextualizados, interpretações apuradas e cobrança aprofundada de legislação e conhecimentos técnicos aplicados.

O **Estuda APP** foi concebido para proporcionar uma experiência de estudo direcionada, ágil e livre de distrações:

1. **Fidelidade ao Edital**: Aplica as regras dos itens 11.6.1 (Nível Médio) e 11.6.2 (Nível Superior) do certame.
2. **100% Funcional Offline**: Não requer conexão com a internet para carregar questões ou salvar históricos.
3. **Privacidade Total**: Todos os dados de desempenho são mantidos localmente no aparelho do usuário via `shared_preferences`.

---

## 🏛️ Cargos Suportados & Regras do Edital

O aplicativo possui matriz de conteúdos segregada por nível de escolaridade, adaptando automaticamente o painel de matérias e pesos conforme o cargo selecionado na tela inicial:

### Matriz de Distribuição Oficial (60 Questões)

| Disciplina | Nível Médio (Item 11.6.1) | Nível Superior (Item 11.6.2) |
| :--- | :---: | :---: |
| **Língua Portuguesa** | 10 questões | 10 questões |
| **Matemática e Raciocínio Lógico** | 7 questões | 8 questões |
| **Informática Básica** | 7 questões | *Não exigido no edital* |
| **História e Geografia do Tocantins** | 6 questões | 6 questões |
| **Legislação do SUS** | 5 questões | 6 questões |
| **Conhecimentos Específicos** | 25 questões | 30 questões |
| **Total de Questões da Prova** | **60 questões** | **60 questões** |

### Cargos Contemplados

#### 🎓 Nível Superior

- **Administrador Hospitalar**: Gestão financeira/contábil hospitalar, Custeio ABC, Faturamento SUS (AIH/APAC), Nova Lei de Licitações (Lei 14.133/2021) e indicadores de gestão de leitos.
- **Assistente Social**: Seguridade Social, Parâmetros de Atuação no SUS (CFESS), ECA, Estatuto do Idoso e mediação interdisciplinar.
- **Auditor em Saúde**: Sistema Nacional de Auditoria (SNA), auditoria analítica/operativa/concorrente, conformidade regulatória e controle social no SUS.
- **Executivo em Saúde**: Governança em saúde pública, vigilância sanitária (Anvisa), contratualização e diretrizes do planejamento regional integrado.
- **Gestor em Saúde**: Planejamento estratégico público, Balanced Scorecard (BSC) adaptado ao setor de saúde e Gestão por Competências (CHA).

#### 🩺 Nível Médio

- **Técnico em Enfermagem** *(Cargo padrão)*: Procedimentos e técnicas de enfermagem, biossegurança, clínica médica, urgência/emergência, cálculo de medicação e PNI.
- **Assistente de Serviços de Saúde**: Atendimento humanizado (PNH), sigilo e guarda de prontuários, regulação ambulatorial e rotinas administrativas hospitalares.
- **Instrumentador Cirúrgico**: Tempos cirúrgicos (diérese, hemostasia, exérese, síntese), montagem da mesa cirúrgica, técnicas assépticas e esterilização.
- **Técnico em Saúde Bucal (TSB)**: Instrumentais odontológicos, isolamento do campo operatório, profilaxia, ergonomia e biossegurança em odontologia.

---

## ✨ Funcionalidades Principais

- 🔄 **Seletor Dinâmico de Cargo e Escolaridade**: Altera instantaneamente as matérias, pesos e pool de questões de Conhecimentos Específicos na Home.
- 🎛️ **Configuração Flexível do Simulado**:
  - **Simulado Completo**: Treino geral ponderado com a mesma proporção da prova real da FGV.
  - **Estudo Dirigido**: Prática focada em uma matéria isolada (ex.: apenas *Legislação do SUS* ou apenas *História e Geografia do Tocantins*).
  - **Seleção de Quantidade**: De 5 a 60 questões por sessão.
- ⚡ **Resolução Interativa com Gabarito Comentado**:
  - Feedback visual imediato após responder (destaque em verde para alternativa correta e vermelho para eventual erro).
  - Justificativa pedagógica imediata explicando a fundamentação da resposta correta.
  - Barra de progresso contínua com contador de questões.
- 📊 **Relatório de Desempenho Pós-Simulado**:
  - Percentual global de aproveitamento com mensagem avaliativa.
  - Barras de progresso com taxa de acertos discriminada matéria por matéria.
  - Atalhos para repetir novo simulado ou analisar o histórico acumulado.
- 📈 **Painel de Histórico e Evolução**:
  - Indicadores globais consolidados: total de simulados concluídos, total de questões respondidas, média geral de aproveitamento (%) e melhor resultado alcançado.
  - Gráfico visual de barras demonstrando a evolução temporal dos simulados.
  - Lista detalhada de cada sessão com data, cargo disputado, modalidade e desempenho por matéria.
  - Opção para zerar o histórico com diálogo de confirmação.

---

## 🛠️ Destaques Técnicos

### Motor de Simulados Inteligente (`QuizEngine`)

Para que simulados rápidos (por exemplo, de 20 questões) representem fielmente o equilíbrio da prova de 60 questões, o `QuizEngine` implementa o **Método dos Maiores Restos (Algoritmo de Hamilton)**:

1. Calcula a cota exata de cada disciplina com base no peso oficial do edital.
2. Atribui a parte inteira de cada matéria.
3. Distribui as vagas restantes ordenando pelas maiores frações decimais residuais.
4. Aplica trava de segurança (`poolSize`) para respeitar o limite disponível no banco de questões e redistribuir eventuais excedentes sem estourar o limite de questões.
5. Embaralha as questões de forma não-viciada (Fisher-Yates) para garantir simulados sempre diversificados.

### Histórico e Estatísticas Locais

A camada de dados (`HistoryService`) utiliza o pacote `shared_preferences` serializando e desserializando instâncias de `QuizSession` em formato JSON, garantindo:

- Carregamento assíncrono instantâneo via `FutureBuilder`.
- Preservação do cargo prestado e do detalhamento matéria a matéria mesmo após fechar o aplicativo.

---

## 📖 Banco de Questões Autoral

O repositório conta com **151 questões inéditas** formuladas especificamente no estilo da banca FGV (enunciados densos, 5 alternativas A–E, situações-problema e justificativas completas):

- **Língua Portuguesa** (10 questões): Gramática normativa, regência verbal/nominal, crase, concordância, sintaxe e colocação pronominal.
- **Matemática e Raciocínio Lógico** (7 questões): Lógica proposicional, equivalências, tabela-verdade, porcentagem, razão e proporção.
- **Informática Básica** (7 questões): Segurança da informação, suíte de escritório, atalhos do Windows, navegação web e cloud.
- **História e Geografia do Tocantins** (6 questões): Criação do Estado do Tocantins (CF/88), transferência da capital para Palmas, bioma Cerrado, bacia Araguaia-Tocantins, economia e demografia tocantinense.
- **Legislação do SUS** (5 questões): Lei 8.080/1990, Lei 8.142/1990, princípios do SUS (universalidade, integralidade, equidade), descentralização e participação popular.
- **Conhecimentos Específicos**:
  - Técnico em Enfermagem: 28 questões
  - 8 outros cargos (Nível Médio e Superior): 48 questões (6 questões aprofundadas para cada cargo)

> 🛡️ **Nota Legal**: Todas as questões são produções intelectuais autorais criadas a partir do conteúdo programático do edital, respeitando integralmente a legislação de direitos autorais e as diretrizes de provas oficiais.

---

## 📂 Estrutura do Projeto

```text
estuda-app/
├── lib/
│   ├── main.dart                 # Inicialização do app, paleta de cores e tema global (Material 3)
│   ├── models/
│   │   ├── job_role.dart         # Definição de cargos, níveis de escolaridade e metadados
│   │   ├── question.dart         # Modelo imutável de questão (texto, opções, índice correto, explicação)
│   │   ├── subject.dart          # Modelo de disciplina com chave identificadora e peso no edital
│   │   └── quiz_session.dart     # Modelo de sessão concluída para estatísticas e histórico
│   ├── data/
│   │   ├── subjects.dart         # Regras de disciplinas e pesos (Nível Médio vs Nível Superior)
│   │   ├── questions_data.dart   # Banco central com questões gerais e do cargo de enfermagem
│   │   └── role_questions.dart   # Questões específicas dos demais 8 cargos de nível médio e superior
│   ├── services/
│   │   ├── quiz_engine.dart      # Algoritmo de amostragem proporcional e montagem de fila
│   │   └── history_service.dart  # Persistência local do histórico (SharedPreferences)
│   ├── screens/
│   │   ├── home_screen.dart      # Configuração do simulado e seletor de cargo/disciplina
│   │   ├── quiz_screen.dart      # Tela de resolução de questões com feedback imediato
│   │   ├── result_screen.dart    # Exibição de resultados e detalhamento por disciplina
│   │   └── history_screen.dart   # Dashboard de desempenho, gráfico e histórico detalhado
│   └── widgets/
│       └── app_card.dart         # Card estilizado reutilizável nas telas da aplicação
├── test/
│   └── widget_test.dart          # Testes automatizados (Widgets, Regras do Edital e QuizEngine)
├── android/                      # Projeto nativo Android configurado
├── web/                          # Suporte nativo para execução web
├── assets/
│   └── icon/icon.png             # Ícone da aplicação
├── pubspec.yaml                  # Manifesto do projeto e dependências Flutter
└── README.md                     # Documentação completa do projeto
```

---

## 🚀 Como Rodar

### Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado (versão 3.3.0 ou superior).
- Dispositivo Android com depuração USB ativada, emulador configurado ou Google Chrome para execução Web.

### Passo a Passo

- Clone o repositório:

```bash
git clone https://github.com/thiago-barros-souza/estuda-app.git
cd estuda-app
```

- Obtenha as dependências:

```bash
flutter pub get
```

- Execute a aplicação:

```bash
# Executar em dispositivo ou emulador conectado
flutter run

# Ou executar diretamente no navegador Web
flutter run -d chrome
```

---

## 🧪 Testes e Garantia de Qualidade

O projeto conta com suíte automatizada de testes cobrindo interface, integridade das regras do edital e algoritmos matemáticos:

```bash
# Executar suíte de testes unitários e de widgets
flutter test

# Executar análise estática de código (linter oficial do Flutter)
flutter analyze
```

### O que os testes verificam

- **Renderização e Usabilidade**: Renderização dos elementos da tela inicial, seletor de cargo e ação de início de simulado.
- **Conformidade com o Edital**: Valida que cargos de Nível Superior não possuem a disciplina de Informática Básica e possuem 30 questões de Conhecimentos Específicos, enquanto Nível Médio contém Informática e 25 questões de Específicas.
- **Distribuição do QuizEngine**: Garante que o motor gera filas válidas, balanceadas e com itens específicos do cargo selecionado.

---

## 📦 Geração de Build (Android APK & Web)

### Gerar APK para Instalação no Celular

```bash
flutter build apk --release
```

O arquivo `.apk` gerado estará disponível em:
`build/app/outputs/flutter-apk/app-release.apk`

> 💡 **Nota sobre assinatura do APK**: O `build.gradle` padrão assina a versão release com as chaves de teste para facilitar testes diretos no celular. Para publicação na Google Play Store, configure sua chave própria seguindo o [guia oficial de assinatura do Flutter](https://docs.flutter.dev/deployment/android#signing-the-app).

### Gerar Build para Web

```bash
flutter build web --release
```

Os arquivos estáticos serão gerados na pasta `build/web/`, prontos para deploy no GitHub Pages, Vercel ou Firebase Hosting.

---

## 🔮 Próximos Passos e Extensibilidade

- [ ] **Expansão Contínua do Banco**: Adicionar novas questões em `lib/data/role_questions.dart` e `lib/data/questions_data.dart`.
- [ ] **Filtro de Histórico por Cargo**: Opção de alternar a visualização das médias globais por cargo individual no `HistoryScreen`.
- [ ] **Modo Simulado Cronometrado**: Adição de temporizador regressivo simulando as 4 horas de duração da prova real.
- [ ] **Geração de Ícones Automatizada**: Configuração do pacote [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons) para ícones adaptativos do Android.
- [ ] **Modo Noturno (Dark Theme)**: Suporte a tema escuro para estudos noturnos prolongados.
