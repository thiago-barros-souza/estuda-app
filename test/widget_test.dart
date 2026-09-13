import 'package:flutter_test/flutter_test.dart';

import 'package:estuda_app/data/subjects.dart';
import 'package:estuda_app/main.dart';
import 'package:estuda_app/models/job_role.dart';
import 'package:estuda_app/services/quiz_engine.dart';

void main() {
  testWidgets('App smoke test - verifies home screen and role selector render',
      (WidgetTester tester) async {
    await tester.pumpWidget(const EstudaToApp());

    expect(find.text('Estuda APP'), findsOneWidget);
    expect(find.text('Cargo desejado'), findsOneWidget);
    expect(find.textContaining('Iniciar simulado'), findsOneWidget);
  });

  test('Edital rules test - Nível Médio vs Nível Superior subjects and weights', () {
    final auditorSuperior = JobRole.fromId('auditor_saude');
    final superiorSubjects = getSubjectsForRole(auditorSuperior);

    // Nível Superior não tem Informática Básica
    expect(superiorSubjects.any((s) => s.key == 'informatica'), isFalse);
    // Específicas do superior tem peso 30 (de 60)
    final espSup = superiorSubjects.firstWhere((s) => s.key == 'especificas');
    expect(espSup.weight, 30);

    final tecMedio = JobRole.fromId('tecnico_enfermagem');
    final medioSubjects = getSubjectsForRole(tecMedio);

    // Nível Médio inclui Informática Básica
    expect(medioSubjects.any((s) => s.key == 'informatica'), isTrue);
    // Específicas do médio tem peso 25 (de 60)
    final espMed = medioSubjects.firstWhere((s) => s.key == 'especificas');
    expect(espMed.weight, 25);
  });

  test('QuizEngine buildQueue produces valid queue for selected role', () {
    final engine = QuizEngine();
    final role = JobRole.fromId('administrador_hospitalar');

    final queue = engine.buildQueue(
      total: 20,
      subjectFilter: kAllSubjects,
      role: role,
    );

    expect(queue.isNotEmpty, isTrue);
    expect(queue.length, lessThanOrEqualTo(20));
    // Verifica que há questões de específicas do Administrador Hospitalar
    expect(queue.any((q) => q.subject == 'especificas'), isTrue);
  });
}
