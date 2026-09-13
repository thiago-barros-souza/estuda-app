# Estuda APP

App de simulados para o concurso **SES/SECAD-TO** (Edital nº 001/2026, banca **FGV**) — cargo de **Técnico de Enfermagem**.

Reimplementação em **Flutter** do protótipo web (`/home/claude/quizapp` na sessão original), com a mesma lógica e o mesmo banco de questões, agora como projeto Android nativo de verdade (via Flutter), pronto para você continuar evoluindo.

## O que o app faz

- Você escolhe a quantidade de questões (padrão 20, de 5 a 60) e pode treinar todas as matérias juntas — na mesma proporção de peso da prova oficial (60 questões: Português 10, Matemática/Raciocínio Lógico 7, Informática 7, História/Geografia do TO 6, Legislação do SUS 5, Conhecimentos Específicos de Enfermagem 25) — ou uma matéria específica.
- As questões aparecem em ordem aleatória, no formato de 5 alternativas (A–E) usado pela FGV.
- Ao responder, o app mostra na hora se você acertou, qual é a alternativa correta e uma explicação.
- No final, uma tela de resultado mostra sua pontuação geral e o desempenho por matéria.
- Todo simulado concluído fica salvo no **histórico de desempenho** do aparelho (via `shared_preferences`), com média, melhor resultado e um gráfico simples de evolução ao longo do tempo.

O banco de questões é **autoral** — 103 questões originais, escritas no estilo e formato da FGV e a partir do conteúdo programático do edital, e não reproduções de provas reais (que são protegidas por direitos autorais). Veja `lib/data/questions_data.dart`.

## Estrutura do projeto

```
lib/
  main.dart                  # entrada do app, tema (MaterialApp)
  models/
    question.dart            # modelo de uma questão
    subject.dart             # modelo de uma matéria (chave, nome, peso na prova)
    quiz_session.dart        # modelo de uma sessão de simulado concluída (para o histórico)
  data/
    subjects.dart            # as 6 matérias do edital, com seus pesos
    questions_data.dart      # banco de 103 questões (gerado a partir do protótipo web)
  services/
    quiz_engine.dart         # sorteio/distribuição proporcional das questões de uma sessão
    history_service.dart     # persistência do histórico (SharedPreferences)
  screens/
    home_screen.dart         # tela inicial (quantidade, matéria, iniciar/histórico)
    quiz_screen.dart         # tela do simulado (pergunta, alternativas, feedback)
    result_screen.dart       # tela de resultado final
    history_screen.dart      # tela de histórico de desempenho
  widgets/
    app_card.dart            # cartão padrão usado nas telas
android/                     # projeto Android padrão gerado para o Flutter
assets/icon/icon.png         # ícone provisório do app (ver "Próximos passos")
```

Arquitetura propositalmente simples (StatefulWidget + `setState`, sem Provider/Bloc/Riverpod) — é um app pessoal de estudo, então o objetivo foi manter fácil de ler e mexer. Se o projeto crescer bastante, vale considerar um gerenciador de estado, mas não é necessário hoje.

## Como rodar

Pré-requisitos: [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado (channel stable) e um emulador Android ou aparelho físico com depuração USB habilitada.

```bash
cd estuda_app
flutter pub get
flutter run
```

Para gerar um `.apk` para instalar direto no celular:

```bash
flutter build apk --release
# gera em build/app/outputs/flutter-apk/app-release.apk
```

> **Nota sobre a assinatura:** por padrão o `build.gradle` do app está configurado para assinar o release com a **chave de debug** (só para simplificar testes locais). Isso é suficiente para instalar no seu próprio aparelho, mas **não** deve ser usado para publicar na Google Play. Se for publicar de verdade, siga o guia oficial ["Sign the app" na documentação do Flutter](https://docs.flutter.dev/deployment/android#signing-the-app) para gerar sua própria chave de release.

## ⚠️ Importante: este projeto não foi compilado/testado com o Flutter de verdade

Este projeto foi gerado em um ambiente sem acesso ao SDK do Flutter nem ao `pub.dev` (repositório de pacotes), então **não foi possível rodar `flutter pub get`, `flutter analyze` nem compilar o app** para validar 100% antes da entrega. O código Dart foi escrito e revisado com cuidado (inclusive com verificação automatizada de balanceamento de parênteses/colchetes em todos os arquivos), mas a primeira coisa a fazer ao abrir o projeto na sua máquina é:

```bash
flutter pub get
flutter analyze
```

e corrigir qualquer eventual apontamento — principalmente coisas pequenas e específicas de versão do Flutter/Dart instalada (nomes de propriedades de tema, etc.), já que o próprio Flutter muda pequenos detalhes de API entre versões. Se o `android/` gerado aqui conflitar com o que a sua versão do Flutter espera, a forma mais segura de resolver é: mover `android/` para fora da pasta temporariamente, rodar `flutter create .` (recria `android/`, `ios/` etc. compatíveis com a sua versão instalada) e então comparar/mesclar as poucas customizações deste projeto (nome do app, application ID `br.com.thiagobarros.estudato`, ícone).

## Próximos passos sugeridos

- **Ícone do app**: hoje há só um PNG simples (gerado programaticamente) em `assets/icon/icon.png` e copiado nas pastas `android/app/src/main/res/mipmap-*`. Para um ícone adaptável de verdade (todas as densidades, ícone adaptativo do Android), vale usar o pacote [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons).
- **Mais questões**: adicione novas entradas em `lib/data/questions_data.dart` seguindo o mesmo formato (`Question(subject: ..., text: ..., options: [...], correctIndex: ..., explanation: ...)`). O `subject` precisa bater com uma das chaves em `lib/data/subjects.dart`.
- **Conteúdo específico mais preciso**: se você tiver acesso ao Anexo I completo do edital (conteúdo programático), dá para revisar/ajustar os tópicos de Conhecimentos Específicos de Enfermagem com mais precisão ainda.
- **Outros cargos**: para outro cargo do mesmo edital, crie um novo arquivo de questões (ou uma nova lista) e troque `subjects`/`allQuestions` — ou adicione um seletor de cargo na tela inicial.
- **iOS**: este projeto só tem a pasta `android/`. Para gerar a pasta `ios/`, rode `flutter create --platforms=ios .` dentro do projeto.
- **Gráfico de evolução mais rico**: a tela de histórico hoje usa um gráfico de barras simples feito à mão (sem dependências externas). Para algo mais elaborado, o pacote [`fl_chart`](https://pub.dev/packages/fl_chart) é uma opção popular.
