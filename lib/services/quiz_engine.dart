import 'dart:math';

import '../data/questions_data.dart';
import '../data/subjects.dart';
import '../models/job_role.dart';
import '../models/question.dart';

/// Constante usada para pedir um simulado com todas as matérias, respeitando
/// a proporção de peso de cada uma na prova oficial (em vez de uma matéria só).
const String kAllSubjects = 'todas';

/// Monta a lista de questões de uma sessão de simulado considerando o cargo e nível.
///
/// - Se [subjectFilter] for [kAllSubjects], distribui as [total] questões
///   entre as matérias proporcionalmente ao peso de cada uma no edital
///   (método dos maiores restos), respeitando o cargo (nível médio ou superior),
///   e depois embaralha a ordem final.
/// - Se [subjectFilter] for a chave de uma matéria, sorteia só dentro dela.
class QuizEngine {
  final Random _random;
  final JobRole _defaultRole;

  QuizEngine({JobRole? role, Random? random})
      : _defaultRole = role ?? JobRole.defaultRole,
        _random = random ?? Random();

  /// Retorna as questões disponíveis para a matéria e cargo especificados.
  List<Question> pool(String subjectKey, [JobRole? role]) {
    final effectiveRole = role ?? _defaultRole;
    if (subjectKey == 'especificas') {
      return getSpecificQuestionsForRole(effectiveRole.id);
    }
    return getQuestionsForRole(effectiveRole)
        .where((q) => q.subject == subjectKey)
        .toList();
  }

  List<T> _shuffled<T>(List<T> input) {
    final list = List<T>.from(input);
    list.shuffle(_random);
    return list;
  }

  /// Distribui [total] questões entre as matérias de acordo com os pesos do edital
  /// para o cargo/nível selecionado (método dos maiores restos / Hamilton),
  /// sem nunca exceder o total de questões disponíveis no banco de cada matéria.
  Map<String, int> computeDistribution(int total, [JobRole? role]) {
    final effectiveRole = role ?? _defaultRole;
    final roleSubjects = getSubjectsForRole(effectiveRole);
    final totalWeight = roleSubjects.fold<int>(0, (sum, s) => sum + s.weight);

    final entries = roleSubjects.map((s) {
      final exact = total * s.weight / totalWeight;
      final base = exact.floor();
      return _DistEntry(
        key: s.key,
        base: base,
        remainder: exact - base,
        poolSize: pool(s.key, effectiveRole).length,
      );
    }).toList();

    var assigned = entries.fold<int>(0, (sum, e) => sum + e.base);
    var missing = total - assigned;

    entries.sort((a, b) => b.remainder.compareTo(a.remainder));
    for (var i = 0; i < missing; i++) {
      entries[i % entries.length].base += 1;
    }

    final dist = <String, int>{
      for (final e in entries) e.key: min(e.base, e.poolSize),
    };

    // Se o limite do banco de alguma matéria reduziu o total, redistribui a
    // diferença entre as matérias que ainda têm questões sobrando no pool.
    var current = dist.values.fold<int>(0, (sum, v) => sum + v);
    var deficit = total - current;
    var guard = 0;
    while (deficit > 0 && guard < 50) {
      guard++;
      var progressed = false;
      for (final key in dist.keys) {
        if (deficit <= 0) break;
        final poolSize = pool(key, effectiveRole).length;
        if (dist[key]! < poolSize) {
          dist[key] = dist[key]! + 1;
          deficit--;
          progressed = true;
        }
      }
      if (!progressed) break;
    }

    return dist;
  }

  /// Monta e embaralha a fila de questões de uma sessão para o cargo selecionado.
  List<Question> buildQueue({
    required int total,
    required String subjectFilter,
    JobRole? role,
  }) {
    final effectiveRole = role ?? _defaultRole;

    if (subjectFilter != kAllSubjects) {
      final shuffledPool = _shuffled(pool(subjectFilter, effectiveRole));
      return shuffledPool.take(min(total, shuffledPool.length)).toList();
    }

    final roleSubjects = getSubjectsForRole(effectiveRole);
    final dist = computeDistribution(total, effectiveRole);
    final list = <Question>[];
    for (final s in roleSubjects) {
      final count = dist[s.key] ?? 0;
      final shuffledPool = _shuffled(pool(s.key, effectiveRole));
      list.addAll(shuffledPool.take(count));
    }
    return _shuffled(list);
  }
}

class _DistEntry {
  final String key;
  int base;
  final double remainder;
  final int poolSize;

  _DistEntry({
    required this.key,
    required this.base,
    required this.remainder,
    required this.poolSize,
  });
}
