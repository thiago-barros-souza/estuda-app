import '../models/job_role.dart';
import '../models/subject.dart';

/// Retorna as disciplinas e pesos oficiais do edital conforme o nível do cargo.
///
/// Edital nº 001/2026 – SECAD/SES/TO (banca FGV):
/// - Nível Médio (item 11.6.1): 60 questões (Português 10, Mat/Raciocínio 7,
///   Informática 7, Tocantins 6, Legislação SUS 5, Específicas 25).
/// - Nível Superior (item 11.6.2): 60 questões (Português 10, Mat/Raciocínio 8,
///   Tocantins 6, Legislação SUS 6, Específicas 30 — sem Informática Básica).
List<Subject> getSubjectsForRole(JobRole role) {
  if (role.isSuperior) {
    return [
      const Subject(key: 'portugues', label: 'Língua Portuguesa', weight: 10),
      const Subject(key: 'matematica', label: 'Matemática e Raciocínio Lógico', weight: 8),
      const Subject(key: 'tocantins', label: 'História e Geografia do Tocantins', weight: 6),
      const Subject(key: 'sus', label: 'Legislação do SUS', weight: 6),
      Subject(
        key: 'especificas',
        label: 'Conhecimentos Específicos — ${role.name}',
        weight: 30,
      ),
    ];
  }

  // Nível Médio
  return [
    const Subject(key: 'portugues', label: 'Língua Portuguesa', weight: 10),
    const Subject(key: 'matematica', label: 'Matemática e Raciocínio Lógico', weight: 7),
    const Subject(key: 'informatica', label: 'Informática Básica', weight: 7),
    const Subject(key: 'tocantins', label: 'História e Geografia do Tocantins', weight: 6),
    const Subject(key: 'sus', label: 'Legislação do SUS', weight: 5),
    Subject(
      key: 'especificas',
      label: 'Conhecimentos Específicos — ${role.name}',
      weight: 25,
    ),
  ];
}

/// Lista padrão (mantida para compatibilidade direta com o cargo padrão).
final List<Subject> subjects = getSubjectsForRole(JobRole.defaultRole);
