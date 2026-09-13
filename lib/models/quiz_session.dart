/// Resultado de uma matéria dentro de uma sessão de simulado concluída.
class SubjectResult {
  final int correct;
  final int total;

  const SubjectResult({required this.correct, required this.total});

  int get percent => total == 0 ? 0 : ((correct / total) * 100).round();

  Map<String, dynamic> toJson() => {'correct': correct, 'total': total};

  factory SubjectResult.fromJson(Map<String, dynamic> json) => SubjectResult(
        correct: json['correct'] as int,
        total: json['total'] as int,
      );
}

/// Um simulado concluído, salvo no histórico de desempenho do usuário.
class QuizSession {
  final DateTime date;
  final int total;
  final int correct;
  final String subjectFilter; // 'todas' ou a chave de uma matéria específica
  final String roleId;
  final String roleName;
  final Map<String, SubjectResult> bySubject;

  const QuizSession({
    required this.date,
    required this.total,
    required this.correct,
    required this.subjectFilter,
    this.roleId = 'tecnico_enfermagem',
    this.roleName = 'Técnico em Enfermagem',
    required this.bySubject,
  });

  int get percent => total == 0 ? 0 : ((correct / total) * 100).round();

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'total': total,
        'correct': correct,
        'subjectFilter': subjectFilter,
        'roleId': roleId,
        'roleName': roleName,
        'bySubject': bySubject.map((k, v) => MapEntry(k, v.toJson())),
      };

  factory QuizSession.fromJson(Map<String, dynamic> json) {
    final rawBySubject = (json['bySubject'] as Map<String, dynamic>? ?? {});
    return QuizSession(
      date: DateTime.parse(json['date'] as String),
      total: json['total'] as int,
      correct: json['correct'] as int,
      subjectFilter: json['subjectFilter'] as String? ?? 'todas',
      roleId: json['roleId'] as String? ?? 'tecnico_enfermagem',
      roleName: json['roleName'] as String? ?? 'Técnico em Enfermagem',
      bySubject: rawBySubject.map(
        (k, v) => MapEntry(k, SubjectResult.fromJson(v as Map<String, dynamic>)),
      ),
    );
  }
}
