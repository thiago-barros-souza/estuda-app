import 'package:flutter/material.dart';

import '../data/subjects.dart';
import '../main.dart';
import '../models/job_role.dart';
import '../models/quiz_session.dart';
import '../widgets/app_card.dart';
import 'history_screen.dart';

class ResultScreen extends StatelessWidget {
  final QuizSession session;

  const ResultScreen({super.key, required this.session});

  String _message(int percent) {
    if (percent >= 80) return 'Excelente! Continue nesse ritmo de estudos.';
    if (percent >= 60) return 'Bom desempenho! Revise os pontos que errou.';
    if (percent >= 40) return 'Você está no caminho. Foque nas matérias com mais erros.';
    return 'Continue estudando — a prática constante faz a diferença.';
  }

  @override
  Widget build(BuildContext context) {
    final percent = session.percent;
    final role = JobRole.fromId(session.roleId);
    final roleSubjects = getSubjectsForRole(role);

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado do simulado')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            AppCard(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: role.isSuperior ? const Color(0xFFE8EEF5) : const Color(0xFFEAF5EA),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${session.roleName} · ${role.level.label}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: role.isSuperior ? AppColors.blueDark : AppColors.green,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${session.correct} / ${session.total}',
                    style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w800, color: AppColors.blueDark),
                  ),
                  Text(
                    '$percent%',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.blue),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    _message(percent),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Desempenho por matéria',
                    style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.blueDark),
                  ),
                  const SizedBox(height: 14),
                  ...roleSubjects.where((s) => session.bySubject.containsKey(s.key)).map((s) {
                    final r = session.bySubject[s.key]!;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(s.label, style: const TextStyle(fontSize: 12.5), overflow: TextOverflow.ellipsis),
                          ),
                          Expanded(
                            flex: 6,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: r.total == 0 ? 0 : r.correct / r.total,
                                minHeight: 8,
                                backgroundColor: const Color(0xFFE2E8F0),
                                valueColor: const AlwaysStoppedAnimation(AppColors.blue),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 46,
                            child: Text(
                              '${r.correct}/${r.total}',
                              textAlign: TextAlign.right,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.5, color: AppColors.blueDark),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
              child: const Text('Fazer novo simulado'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const HistoryScreen()),
              ),
              child: const Text('Ver histórico de desempenho'),
            ),
          ],
        ),
      ),
    );
  }
}
