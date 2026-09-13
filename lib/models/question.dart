/// Representa uma questão de múltipla escolha (5 alternativas, padrão FGV).
class Question {
  /// Chave da matéria (deve bater com [Subject.key]).
  final String subject;

  /// Enunciado da questão.
  final String text;

  /// As 5 alternativas, na ordem A, B, C, D, E (índices 0 a 4).
  final List<String> options;

  /// Índice (0-based) da alternativa correta em [options].
  final int correctIndex;

  /// Explicação curta exibida após o candidato responder.
  final String explanation;

  const Question({
    required this.subject,
    required this.text,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });

  String get correctLetter => String.fromCharCode('A'.codeUnitAt(0) + correctIndex);
}
