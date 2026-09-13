import 'package:flutter/material.dart';

import '../data/subjects.dart';
import '../main.dart';
import '../models/job_role.dart';
import '../models/quiz_session.dart';
import '../services/history_service.dart';
import '../widgets/app_card.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final _historyService = HistoryService();
  late Future<List<QuizSession>> _future;

  @override
  void initState() {
    super.initState();
    _future = _historyService.loadAll();
  }

  void _reload() {
    setState(() {
      _future = _historyService.loadAll();
    });
  }

  Future<void> _clearHistory() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Apagar histórico?'),
        content: const Text('Tem certeza que deseja apagar todo o histórico de desempenho?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancelar')),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Apagar')),
        ],
      ),
    );
    if (confirmed == true) {
      await _historyService.clear();
      _reload();
    }
  }

  String _subjectLabel(String key, [String? roleId]) {
    if (key == 'todas') return 'Simulado completo (todas as matérias)';
    final roleSubjects = roleId != null ? getSubjectsForRole(JobRole.fromId(roleId)) : subjects;
    for (final s in roleSubjects) {
      if (s.key == key) return s.label;
    }
    return key;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu desempenho')),
      body: SafeArea(
        child: FutureBuilder<List<QuizSession>>(
          future: _future,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final history = snapshot.data!.reversed.toList(); // mais recente primeiro

            if (history.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    'Você ainda não concluiu nenhum simulado. Seu histórico de desempenho aparecerá aqui.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
              );
            }

            final avg = (history.map((h) => h.percent).reduce((a, b) => a + b) / history.length).round();
            final best = history.map((h) => h.percent).reduce((a, b) => a > b ? a : b);
            final chrono = history.reversed.toList(); // cronológico p/ gráfico

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                AppCard(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _SummaryItem(value: '${history.length}', label: 'simulados feitos'),
                      _SummaryItem(value: '$avg%', label: 'média geral'),
                      _SummaryItem(value: '$best%', label: 'melhor resultado'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 90,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: chrono.map((h) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Tooltip(
                            message: '${_formatDate(h.date)} — ${h.percent}%',
                            child: Container(
                              width: 10,
                              height: (h.percent.clamp(3, 100)).toDouble(),
                              decoration: const BoxDecoration(
                                color: AppColors.blue,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(3)),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ...history.map((h) => _HistoryCard(session: h, subjectLabel: _subjectLabel(h.subjectFilter, h.roleId))),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: _clearHistory,
                  child: const Text('Apagar histórico', style: TextStyle(color: Colors.grey)),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String _formatDate(DateTime d) {
    final dd = d.day.toString().padLeft(2, '0');
    final mm = d.month.toString().padLeft(2, '0');
    return '$dd/$mm/${d.year}';
  }
}

class _SummaryItem extends StatelessWidget {
  final String value;
  final String label;

  const _SummaryItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.blueDark)),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final QuizSession session;
  final String subjectLabel;

  const _HistoryCard({required this.session, required this.subjectLabel});

  @override
  Widget build(BuildContext context) {
    final d = session.date;
    final dateStr =
        '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year} às '
        '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
    final good = session.percent >= 60;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(dateStr, style: const TextStyle(fontSize: 12.5, color: Colors.grey)),
              Text(
                '${session.percent}%',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  color: good ? AppColors.green : AppColors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8EEF5),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  session.roleName,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blueDark,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '$subjectLabel · ${session.correct}/${session.total} acertos',
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
