enum EducationLevel {
  medio,
  superior,
}

extension EducationLevelExt on EducationLevel {
  String get label {
    switch (this) {
      case EducationLevel.medio:
        return 'Nível Médio';
      case EducationLevel.superior:
        return 'Nível Superior';
    }
  }
}

class JobRole {
  final String id;
  final String name;
  final EducationLevel level;
  final String shortDescription;

  const JobRole({
    required this.id,
    required this.name,
    required this.level,
    required this.shortDescription,
  });

  bool get isSuperior => level == EducationLevel.superior;
  bool get isMedio => level == EducationLevel.medio;

  static const JobRole defaultRole = JobRole(
    id: 'tecnico_enfermagem',
    name: 'Técnico em Enfermagem',
    level: EducationLevel.medio,
    shortDescription: 'Procedimentos, biossegurança, clínica, urgência e PNI',
  );

  static const List<JobRole> allRoles = [
    // Cargos de Nível Superior
    JobRole(
      id: 'administrador_hospitalar',
      name: 'Administrador Hospitalar',
      level: EducationLevel.superior,
      shortDescription: 'Gestão hospitalar, faturamento SUS, custos e compras (Lei 14.133)',
    ),
    JobRole(
      id: 'assistente_social',
      name: 'Assistente Social',
      level: EducationLevel.superior,
      shortDescription: 'Seguridade social, ECA, idoso, instrumental técnico no SUS',
    ),
    JobRole(
      id: 'auditor_saude',
      name: 'Auditor em Saúde',
      level: EducationLevel.superior,
      shortDescription: 'Sistema Nacional de Auditoria (SNA), controle e conformidade no SUS',
    ),
    JobRole(
      id: 'executivo_saude',
      name: 'Executivo em Saúde',
      level: EducationLevel.superior,
      shortDescription: 'Governança, vigilância sanitária (Anvisa) e portarias de consolidação',
    ),
    JobRole(
      id: 'gestor_saude',
      name: 'Gestor em Saúde',
      level: EducationLevel.superior,
      shortDescription: 'Planejamento estratégico, Balanced Scorecard e gestão por competências',
    ),

    // Cargos de Nível Médio
    JobRole(
      id: 'assistente_servicos_saude',
      name: 'Assistente de Serviços de Saúde',
      level: EducationLevel.medio,
      shortDescription: 'Atendimento humanizado, prontuários, fluxos e rotinas administrativas',
    ),
    JobRole(
      id: 'instrumentador_cirurgico',
      name: 'Instrumentador Cirúrgico',
      level: EducationLevel.medio,
      shortDescription: 'Tempos cirúrgicos, montagem de mesa, esterilização e assepsia',
    ),
    JobRole(
      id: 'tecnico_saude_bucal',
      name: 'Técnico em Saúde Bucal',
      level: EducationLevel.medio,
      shortDescription: 'Instrumentais odontológicos, isolamento, biossegurança e profilaxia',
    ),
    JobRole(
      id: 'tecnico_enfermagem',
      name: 'Técnico em Enfermagem',
      level: EducationLevel.medio,
      shortDescription: 'Procedimentos, biossegurança, clínica, urgência e PNI',
    ),
  ];

  static JobRole fromId(String id) {
    for (final role in allRoles) {
      if (role.id == id) return role;
    }
    return defaultRole;
  }
}
