import 'package:flutter/material.dart';

import '../data/subjects.dart';
import '../main.dart';
import '../models/job_role.dart';
import '../services/quiz_engine.dart';
import '../widgets/app_card.dart';
import 'history_screen.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _qtyController = TextEditingController(text: '20');
  JobRole _selectedRole = JobRole.defaultRole;
  String _selectedSubject = kAllSubjects;
  late QuizEngine _engine;

  @override
  void initState() {
    super.initState();
    _engine = QuizEngine(role: _selectedRole);
  }

  @override
  void dispose() {
    _qtyController.dispose();
    super.dispose();
  }

  void _onRoleChanged(JobRole? newRole) {
    if (newRole == null || newRole.id == _selectedRole.id) return;
    setState(() {
      _selectedRole = newRole;
      _engine = QuizEngine(role: newRole);
      _selectedSubject = kAllSubjects; // reinicia filtro de matéria para o novo cargo
    });
  }

  int _parsedQuantity() {
    final n = int.tryParse(_qtyController.text) ?? 20;
    return n.clamp(5, 60).toInt();
  }

  void _startQuiz() {
    final total = _parsedQuantity();
    final queue = _engine.buildQueue(
      total: total,
      subjectFilter: _selectedSubject,
      role: _selectedRole,
    );

    if (queue.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não há questões suficientes para essa seleção.')),
      );
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => QuizScreen(
          queue: queue,
          subjectFilter: _selectedSubject,
          role: _selectedRole,
        ),
      ),
    );
  }

  void _openHistory() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const HistoryScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final roleSubjects = getSubjectsForRole(_selectedRole);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- SELEÇÃO DE CARGO ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Cargo desejado',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.blueDark,
                          fontSize: 13,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: _selectedRole.isSuperior
                              ? const Color(0xFFE8EEF5)
                              : const Color(0xFFEAF5EA),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          _selectedRole.level.label,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: _selectedRole.isSuperior
                                ? AppColors.blueDark
                                : AppColors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedRole.id,
                        isExpanded: true,
                        items: [
                          ...JobRole.allRoles.map((r) {
                            final tag = r.isSuperior ? '[Superior]' : '[Médio]';
                            return DropdownMenuItem<String>(
                              value: r.id,
                              child: Text(
                                '$tag ${r.name}',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 14.5),
                              ),
                            );
                          }),
                        ],
                        onChanged: (id) {
                          if (id != null) {
                            _onRoleChanged(JobRole.fromId(id));
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFEDF2F7)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _selectedRole.shortDescription,
                          style: const TextStyle(fontSize: 12, color: Color(0xFF475569)),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _selectedRole.isSuperior
                              ? '• Prova oficial: 60 questões (Português 10, Matemática 8, Tocantins 6, Legislação SUS 6, Específicas 30).'
                              : '• Prova oficial: 60 questões (Português 10, Matemática 7, Informática 7, Tocantins 6, Legislação SUS 5, Específicas 25).',
                          style: const TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // --- QUANTIDADE DE QUESTÕES ---
                  const Text(
                    'Quantidade de questões do simulado',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.blueDark,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _qtyController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Padrão: 20 · máximo 60 (total da prova oficial FGV)',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [10, 20, 30, 40, 60].map((n) {
                      return ActionChip(
                        label: Text('$n'),
                        onPressed: () => setState(() => _qtyController.text = '$n'),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 20),

                  // --- MATÉRIA ---
                  const Text(
                    'Matéria',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.blueDark,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedSubject,
                        isExpanded: true,
                        items: [
                          DropdownMenuItem(
                            value: kAllSubjects,
                            child: Text(
                              'Todas as matérias (${_selectedRole.level.label})',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ...roleSubjects.map((s) {
                            final poolSize = _engine.pool(s.key, _selectedRole).length;
                            return DropdownMenuItem(
                              value: s.key,
                              child: Text(
                                '${s.label} ($poolSize questões)',
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }),
                        ],
                        onChanged: (value) => setState(() => _selectedSubject = value ?? kAllSubjects),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Treine uma disciplina específica ou simule a proporção oficial do edital',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),

                  const SizedBox(height: 22),
                  ElevatedButton(
                    onPressed: _startQuiz,
                    child: Text('Iniciar simulado — ${_selectedRole.name}'),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: _openHistory,
                    child: const Text('Ver meu histórico de desempenho'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Banco de questões autoral elaborado com base no conteúdo programático do Edital nº 001/2026 '
              '(SECAD/SES-TO, banca FGV). Simula com rigor o estilo, a linguagem e as temáticas exigidas na prova oficial.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, color: Colors.grey, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'SES/SECAD-TO · Banca FGV',
            style: TextStyle(color: Colors.white, fontSize: 11, letterSpacing: 0.3),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Estuda APP',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.blueDark),
        ),
        const Text(
          'Simulados Oficiais — Edital nº 001/2026',
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ],
    );
  }
}
