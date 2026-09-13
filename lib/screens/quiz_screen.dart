import 'package:flutter/material.dart';

import '../data/subjects.dart';
import '../main.dart';
import '../models/job_role.dart';
import '../models/question.dart';
import '../models/quiz_session.dart';
import '../services/history_service.dart';
import '../widgets/app_card.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final List<Question> queue;
  final String subjectFilter;
  final JobRole role;

  const QuizScreen({
    super.key,
    required this.queue,
    required this.subjectFilter,
    required this.role,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _Tally {
  int correct = 0;
  int total = 0;
}

class _QuizScreenState extends State<QuizScreen> {
  int _index = 0;
  bool _answered = false;
  int? _selectedIndex;
  int _correctCount = 0;
  final Map<String, _Tally> _bySubject = {};
  final _historyService = HistoryService();

  Question get _current => widget.queue[_index];

  String _subjectLabel(String key) {
    for (final s in getSubjectsForRole(widget.role)) {
      if (s.key == key) return s.label;
    }
    return key;
  }

  void _selectAnswer(int optionIndex) {
    if (_answered) return;

    final isCorrect = optionIndex == _current.correctIndex;
    final tally = _bySubject.putIfAbsent(_current.subject, () => _Tally());
    tally.total++;
    if (isCorrect) {
      tally.correct++;
      _correctCount++;
    }

    setState(() {
      _answered = true;
      _selectedIndex = optionIndex;
    });
  }

  Future<void> _next() async {
    if (_index + 1 < widget.queue.length) {
      setState(() {
        _index++;
        _answered = false;
        _selectedIndex = null;
      });
    } else {
      await _finish();
    }
  }

  Future<void> _finish() async {
    final total = widget.queue.length;
    final session = QuizSession(
      date: DateTime.now(),
      total: total,
      correct: _correctCount,
      subjectFilter: widget.subjectFilter,
      roleId: widget.role.id,
      roleName: widget.role.name,
      bySubject: _bySubject.map(
        (k, v) => MapEntry(k, SubjectResult(correct: v.correct, total: v.total)),
      ),
    );
    await _historyService.saveSession(session);

    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => ResultScreen(session: session)),
    );
  }

  Future<void> _confirmExit() async {
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Sair do simulado?'),
        content: const Text('Seu progresso desta sessão será perdido.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancelar')),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Sair')),
        ],
      ),
    );
    if (shouldExit == true && mounted) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = _index / widget.queue.length;
    final letters = ['A', 'B', 'C', 'D', 'E'];

    // Observação: a navegação de volta pelo botão físico/gesto do Android
    // simplesmente fecha esta tela (comportamento padrão do Flutter). A
    // confirmação de saída só é acionada pelo botão "✕" abaixo, para não
    // depender de APIs de interceptação de "pop" que mudam entre versões
    // do Flutter (WillPopScope/PopScope).
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 8, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Questão ${_index + 1} de ${widget.queue.length}',
                            style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey, fontSize: 13),
                          ),
                          Text(
                            '${widget.role.name} (${widget.role.level.label})',
                            style: const TextStyle(fontSize: 11, color: AppColors.blue, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    IconButton(onPressed: _confirmExit, icon: const Icon(Icons.close)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress.clamp(0, 1).toDouble(),
                    minHeight: 6,
                    backgroundColor: const Color(0xFFE2E8F0),
                    valueColor: const AlwaysStoppedAnimation(AppColors.blue),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    AppCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8EEF5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              _subjectLabel(_current.subject),
                              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.blue),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _current.text,
                            style: const TextStyle(fontSize: 16.5, height: 1.45, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 16),
                          ...List.generate(_current.options.length, (i) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: _OptionTile(
                                letter: letters[i],
                                text: _current.options[i],
                                state: _optionState(i),
                                onTap: () => _selectAnswer(i),
                              ),
                            );
                          }),
                          if (_answered) _buildFeedback(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (_answered)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: ElevatedButton(
                    onPressed: _next,
                    child: Text(
                      _index + 1 < widget.queue.length ? 'Próxima questão →' : 'Ver resultado final →',
                    ),
                  ),
                ),
            ],
          ),
        ),
    );
  }

  _OptionVisualState _optionState(int i) {
    if (!_answered) return _OptionVisualState.normal;
    if (i == _current.correctIndex) return _OptionVisualState.correct;
    if (i == _selectedIndex) return _OptionVisualState.wrong;
    return _OptionVisualState.disabled;
  }

  Widget _buildFeedback() {
    final isCorrect = _selectedIndex == _current.correctIndex;
    final bg = isCorrect ? const Color(0xFFEAFAF0) : const Color(0xFFFDECEC);
    final border = isCorrect ? const Color(0xFFBBF0D0) : const Color(0xFFF6C6C6);
    final letters = ['A', 'B', 'C', 'D', 'E'];

    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(color: border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isCorrect ? '✔ Você acertou!' : '✘ Você errou.',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            'Resposta correta: ${letters[_current.correctIndex]}) ${_current.options[_current.correctIndex]}',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5),
          ),
          const SizedBox(height: 6),
          Text(_current.explanation, style: const TextStyle(fontSize: 13.5, height: 1.5)),
        ],
      ),
    );
  }
}

enum _OptionVisualState { normal, correct, wrong, disabled }

class _OptionTile extends StatelessWidget {
  final String letter;
  final String text;
  final _OptionVisualState state;
  final VoidCallback onTap;

  const _OptionTile({
    required this.letter,
    required this.text,
    required this.state,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor = const Color(0xFFE2E8F0);
    Color bgColor = Colors.white;
    Color circleColor = const Color(0xFFEEF2F7);
    Color circleTextColor = AppColors.blueDark;

    switch (state) {
      case _OptionVisualState.correct:
        borderColor = AppColors.green;
        bgColor = const Color(0xFFEAFAF0);
        circleColor = AppColors.green;
        circleTextColor = Colors.white;
        break;
      case _OptionVisualState.wrong:
        borderColor = AppColors.red;
        bgColor = const Color(0xFFFDECEC);
        circleColor = AppColors.red;
        circleTextColor = Colors.white;
        break;
      case _OptionVisualState.disabled:
      case _OptionVisualState.normal:
        break;
    }

    final isDisabled = state != _OptionVisualState.normal;

    return InkWell(
      onTap: isDisabled ? null : onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: borderColor, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 26,
              height: 26,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: circleColor, shape: BoxShape.circle),
              child: Text(
                letter,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.5, color: circleTextColor),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(text, style: const TextStyle(fontSize: 15, height: 1.4)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
