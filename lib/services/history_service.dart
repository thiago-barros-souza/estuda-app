import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/quiz_session.dart';

/// Persiste o histórico de desempenho do usuário no armazenamento local do
/// dispositivo (SharedPreferences), como uma lista de [QuizSession] em JSON.
///
/// Equivalente ao uso de `localStorage` na versão web deste app.
class HistoryService {
  static const _storageKey = 'estudaAPP_historico_v1';

  Future<List<QuizSession>> loadAll() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storageKey);
    if (raw == null || raw.isEmpty) return [];
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .map((e) => QuizSession.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      // Histórico corrompido/formato antigo: começa do zero em vez de travar o app.
      return [];
    }
  }

  Future<void> saveSession(QuizSession session) async {
    final prefs = await SharedPreferences.getInstance();
    final all = await loadAll();
    all.add(session);
    final raw = jsonEncode(all.map((s) => s.toJson()).toList());
    await prefs.setString(_storageKey, raw);
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }
}
