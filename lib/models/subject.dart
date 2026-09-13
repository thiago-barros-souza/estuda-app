/// Representa uma matéria/disciplina do edital, com seu peso (nº de questões)
/// na prova oficial de 60 questões — usado para sortear a proporção correta
/// quando o usuário monta um simulado com "todas as matérias".
class Subject {
  final String key;
  final String label;
  final int weight;

  const Subject({
    required this.key,
    required this.label,
    required this.weight,
  });
}
