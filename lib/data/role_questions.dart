import '../models/question.dart';

/// Banco de questões de Conhecimentos Específicos para cada cargo previsto no
/// Edital nº 001/2026 – SECAD/SES/TO (banca FGV), elaboradas estritamente de
/// acordo com o conteúdo programático do edital.
final Map<String, List<Question>> roleSpecificQuestions = {
  // ---------------------------------------------------------------------------
  // NÍVEL SUPERIOR
  // ---------------------------------------------------------------------------

  // 1. Administrador Hospitalar
  'administrador_hospitalar': [
    const Question(
      subject: 'especificas',
      text:
          """Na gestão financeira e contábil hospitalar, o método de custeio que aloca os custos indiretos com base nas atividades consumidas pelos processos assistenciais e de apoio, proporcionando maior precisão na apuração do custo por procedimento ou diária, é denominado:""",
      options: [
        """Custeio por Absorção Tradicional.""",
        """Custeio Baseado em Atividades (Custeio ABC).""",
        """Custeio Variável ou Direto.""",
        """Custeio Padrão Estático.""",
        """Custeio Raso Marginal.""",
      ],
      correctIndex: 1,
      explanation:
          """O Custeio Baseado em Atividades (Activity-Based Costing - ABC) rastreia os recursos consumidos pelas atividades e estas para os produtos/serviços finais, sendo ideal para a complexidade das unidades hospitalares.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """No âmbito do faturamento dos serviços de saúde no SUS, o instrumento de registro utilizado obrigatoriamente para a autorização, cobrança e pagamento das internações hospitalares na rede pública e conveniada é denominado:""",
      options: [
        """BPA (Boletim de Produção Ambulatorial).""",
        """APAC (Autorização de Procedimentos de Alta Complexidade).""",
        """AIH (Autorização de Internação Hospitalar).""",
        """CIHA (Comunicação de Internação Hospitalar e Ambulatorial).""",
        """RAAS (Registro das Ações Ambulatoriais de Saúde).""",
      ],
      correctIndex: 2,
      explanation:
          """A AIH (Autorização de Internação Hospitalar) é o documento padrão que alimenta o Sistema de Informações Hospitalares do SUS (SIH-SUS), viabilizando o faturamento de leitos e internações.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Em um hospital geral de 200 leitos operacionais, registraram-se 5.400 pacientes-dia em um mês de 30 dias. A Taxa de Ocupação Hospitalar nesse período foi de:""",
      options: [
        """75%.""",
        """80%.""",
        """85%.""",
        """90%.""",
        """95%.""",
      ],
      correctIndex: 3,
      explanation:
          """A capacidade total do hospital no mês é de 200 leitos × 30 dias = 6.000 leitos-dia. A taxa de ocupação é (5.400 / 6.000) × 100 = 90%.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """De acordo com a Lei nº 14.133/2021 (Nova Lei de Licitações e Contratos Administrativos), a contratação direta para aquisição de insumos médico-hospitalares exclusivos produzidos por fabricante único, sem possibilidade de competição, caracteriza caso de:""",
      options: [
        """Dispensa de licitação em razão do valor.""",
        """Inexigibilidade de licitação pela inviabilidade de competição.""",
        """Licitação na modalidade pregão eletrônico obrigatório.""",
        """Dispensa de licitação por emergência temporária.""",
        """Concorrência com critério de maior desconto.""",
      ],
      correctIndex: 1,
      explanation:
          """Nos termos do art. 74 da Lei nº 14.133/2021, é inexigível a licitação quando for inviável a competição, em especial para aquisição de materiais que só possam ser fornecidos por produtor, empresa ou representante comercial exclusivo.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Na gestão de suprimentos e farmácia hospitalar, a classificação ABC baseia-se no princípio de Pareto, em que os itens da Classe 'A' representam:""",
      options: [
        """Aproximadamente 80% da quantidade física de itens e 20% do valor monetário total.""",
        """Itens de baixo custo unitário cuja falta não compromete as rotinas assistenciais.""",
        """Aproximadamente 20% do número total de itens em estoque, concentrando cerca de 70% a 80% do valor monetário investido.""",
        """Itens cujo suprimento é abundante no mercado local sem risco de desabastecimento.""",
        """Medicamentos isentos de prescrição médica e sem controle especial.""",
      ],
      correctIndex: 2,
      explanation:
          """A Curva ABC classifica os estoques por relevância financeira: a classe A engloba cerca de 20% dos itens que correspondem a aproximadamente 80% do valor total investido em estoque.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """O sistema de dispensação de medicamentos em ambiente hospitalar que oferece maior segurança ao paciente, redução de perdas financeiras e diminuição de erros de administração ao fornecer as doses previamente separadas e identificadas para cada horário é o:""",
      options: [
        """Sistema Coletivo por Estoque de Setor.""",
        """Sistema de Dispensação por Dose Individualizada.""",
        """Sistema de Dispensação por Dose Unitária (SDMU).""",
        """Sistema de Aquisição Direta pelo Usuário.""",
        """Sistema Tradicional de Reposição Semanal.""",
      ],
      correctIndex: 2,
      explanation:
          """O Sistema de Dispensação de Medicamentos por Dose Unitária (SDMU) prepara a medicação na forma e dosagem prontas para serem administradas ao paciente no horário prescrito, minimizando manipulações e erros.""",
    ),
  ],

  // 2. Assistente Social
  'assistente_social': [
    const Question(
      subject: 'especificas',
      text:
          """No âmbito do instrumental técnico-operativo do Serviço Social, o documento emitido pelo assistente social que expressa uma avaliação técnica fundamentada sobre determinada situação social, indicando alternativas ou diretrizes sem caráter conclusivo pericial obrigatório, denomina-se:""",
      options: [
        """Laudo Pericial Social.""",
        """Parecer Social.""",
        """Relatório Social Circunstanciado.""",
        """Estudo de Caso Psicométrico.""",
        """Auto de Constatação Judicial.""",
      ],
      correctIndex: 1,
      explanation:
          """O Parecer Social expressa um julgamento ou opinião profissional circunstanciada sobre matéria de Serviço Social, visando esclarecer ou orientar tomadas de decisão.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Segundo o Estatuto da Criança e do Adolescente (Lei nº 8.069/1990), o acolhimento institucional de crianças e adolescentes é considerado medida de caráter:""",
      options: [
        """Punitivo e de segregação familiar compulsória.""",
        """Provisório e excepcional, utilizável como transição para reintegração familiar ou família substituta.""",
        """Definitivo, vedando qualquer contato posterior com os genitores biológicos.""",
        """Prioritário em relação à manutenção na família extensa.""",
        """Exclusivo para casos de ato infracional grave comprovado.""",
      ],
      correctIndex: 1,
      explanation:
          """O acolhimento institucional é medida protetiva provisória e excepcional, não implicando privação de liberdade nem destituição prévia do poder familiar, devendo priorizar a reintegração familiar.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Nos termos do Estatuto da Pessoa Idosa (Lei nº 10.741/2003), dentre os idosos, é assegurada prioridade especial e atendimento preferencial diferenciado àqueles com idade superior a:""",
      options: [
        """65 anos.""",
        """70 anos.""",
        """75 anos.""",
        """80 anos.""",
        """85 anos.""",
      ],
      correctIndex: 3,
      explanation:
          """A Lei nº 13.466/2017 alterou o Estatuto da Pessoa Idosa estabelecendo prioridade especial aos maiores de 80 anos, cujas necessidades têm preferência em relação aos demais idosos.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """De acordo com os 'Parâmetros para Atuação de Assistentes Sociais na Política de Saúde' (CFESS), a atuação do assistente social no Sistema Único de Saúde (SUS) deve se pautar prioritariamente por:""",
      options: [
        """Práticas assistencialistas e caritativas restritas à distribuição de donativos e passagens.""",
        """Fiscalização coercitiva das equipes médicas e substituição da autoridade sanitária local.""",
        """Democratização do acesso, garantia dos direitos sociais, fortalecimento do controle social e trabalho interdisciplinar.""",
        """Diagnóstico e prescrição terapêutica em ambulatórios de especialidades.""",
        """Cobrança de coparticipação dos usuários em internações de alta complexidade.""",
      ],
      correctIndex: 2,
      explanation:
          """A atuação do assistente social na saúde busca assegurar os direitos sociais dos usuários, promover a humanização, o acesso universal e igualitário e a consolidação do controle social no SUS.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Na Lei Orgânica da Assistência Social (LOAS - Lei nº 8.742/1993), o Benefício de Prestação Continuada (BPC) garante a transferência de um salário-mínimo mensal à pessoa com deficiência e ao idoso que comprovem:""",
      options: [
        """Ter contribuído para a Previdência Social por pelo menos 15 anos ininterruptos.""",
        """Possuir idade mínima de 60 anos, independentemente da renda familiar declarada.""",
        """Idade de 65 anos ou mais, ou deficiência, sem meios de prover a própria manutenção nem de tê-la provida por sua família.""",
        """Matrícula regular em instituição de ensino técnico profissionalizante do Estado.""",
        """Ter exercido atividade remunerada formal no setor de saúde pública.""",
      ],
      correctIndex: 2,
      explanation:
          """O BPC é garantia constitucional regulamentada pela LOAS para idosos a partir de 65 anos ou pessoas com deficiência de qualquer idade que comprovem incapacidade de autossustento (critério de vulnerabilidade socioeconômica).""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """O Código de Ética Profissional do Assistente Social estabelece como dever no atendimento a usuários em unidades hospitalares e ambulatoriais:""",
      options: [
        """Compartilhar publicamente dados confidenciais dos prontuários com entidades filantrópicas sem autorização.""",
        """Manter o sigilo profissional, resguardando informações de que tenha conhecimento em razão do exercício profissional.""",
        """Condicionar o atendimento do cidadão à sua filiação partidária ou religiosa.""",
        """Divulgar detalhes íntimos dos usuários para fins de autopromoção em redes sociais.""",
        """Subordinar sua autonomia técnico-científica às opiniões leigas de terceiros desautorizados.""",
      ],
      correctIndex: 1,
      explanation:
          """O sigilo profissional é direito e dever ético fundamental do assistente social para proteger a dignidade, intimidade e privacidade do usuário atendido.""",
    ),
  ],

  // 3. Auditor em Saúde
  'auditor_saude': [
    const Question(
      subject: 'especificas',
      text:
          """No âmbito do SUS, o Sistema Nacional de Auditoria (SNA), regulamentado pelo Decreto nº 1.651/1995 com base na Lei nº 8.689/1993, atua nos três níveis de governo de forma:""",
      options: [
        """Totalmente centralizada no Ministério da Saúde, sem participação dos Estados ou Municípios.""",
        """Descentralizada, com competências próprias e articuladas nas esferas federal, estadual e municipal.""",
        """Exclusivamente punitiva, sem interface com o planejamento ou a gestão estratégica da saúde.""",
        """Subordinada diretamente aos prestadores privados contratados pelo setor de saúde suplementar.""",
        """Restrita à apuração de crimes comuns de trânsito em ambulâncias públicas.""",
      ],
      correctIndex: 1,
      explanation:
          """O SNA organiza-se de modo descentralizado nas esferas federal, estadual e municipal, integrando as atividades de controle, avaliação e auditoria sobre ações e serviços de saúde.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """A modalidade de auditoria em saúde realizada enquanto o paciente encontra-se em regime de internação hospitalar, permitindo o acompanhamento em tempo real da pertinência dos procedimentos e da qualidade da assistência, é classificada como:""",
      options: [
        """Auditoria Retrospectiva ou Pós-Faturamento.""",
        """Auditoria Concorrente (ou Operativa).""",
        """Auditoria Orçamentária Ex-Ante.""",
        """Auditoria Contábil Pericial Final.""",
        """Auditoria Sinistra Documental.""",
      ],
      correctIndex: 1,
      explanation:
          """A auditoria concorrente ocorre 'in loco' durante a prestação da assistência, permitindo identificar precocemente inconformidades assistenciais, de registro e de adequação clínica.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Em auditoria hospitalar, o cancelamento ou a recusa de pagamento de determinada cobrança efetuada pelo prestador de serviços, decorrente de cobrança indevida, falta de comprovação em prontuário ou procedimento não autorizado, denomina-se:""",
      options: [
        """Aditivo Contratual de Equilíbrio.""",
        """Glosa.""",
        """Bonificação por Desempenho.""",
        """Subvenção Ordinária.""",
        """Apostilamento de Crédito.""",
      ],
      correctIndex: 1,
      explanation:
          """A glosa é a impugnação total ou parcial de valores faturados em contas médico-hospitalares motivada por irregularidades técnicas ou administrativas constatadas na auditoria.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Na auditoria de prontuários em estabelecimentos de saúde, de acordo com as normas sanitárias e éticas vigentes, o prontuário do paciente é considerado:""",
      options: [
        """Propriedade comercial exclusiva da administração do hospital, que pode destruí-lo a qualquer momento.""",
        """Documento sigiloso pertencente ao paciente, sob a guarda legal e responsabilidade da instituição de saúde.""",
        """Documento de domínio público irrestrito, dispensado de proteção de dados pessoais.""",
        """Registro informal sem validade comprobatória perante órgãos fiscalizadores e conselhos de classe.""",
        """Arquivo descartável após 30 dias do término da internação.""",
      ],
      correctIndex: 1,
      explanation:
          """O prontuário é documento médico-legal de propriedade do paciente, cabendo à instituição de saúde sua guarda física/eletrônica, sigilo e integridade nos termos legais.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Conforme a Lei Geral de Proteção de Dados (LGPD - Lei nº 13.709/2018), os dados referentes à saúde ou à vida sexual, genéticos ou biométricos, pertencem à categoria de:""",
      options: [
        """Dados pessoais comuns de livre circulação comercial sem consentimento.""",
        """Dados pessoais sensíveis, sujeitos a regime mais rigoroso de proteção e segurança da informação.""",
        """Dados desprovidos de proteção legal na esfera da administração pública.""",
        """Informações financeiras patrimoniais de publicação obrigatória no Diário Oficial.""",
        """Dados corporativos pertencentes às operadoras de plano de saúde.""",
      ],
      correctIndex: 1,
      explanation:
          """A LGPD classifica expressamente os dados de saúde como dados pessoais sensíveis (art. 5º, II), exigindo salvaguardas adicionais para seu tratamento e auditoria.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Ao analisar a contratualização de serviços de saúde com entidades filantrópicas ou privadas complementares ao SUS, o auditor deve verificar prioritariamente:""",
      options: [
        """Se o lucro líquido da entidade privada supera o orçamento do Fundo Municipal de Saúde.""",
        """O cumprimento dos planos operativos, metas físicas e assistenciais pactuadas e a adequação da tabela de procedimentos.""",
        """A contratação de publicidade comercial pela instituição privada em emissoras locais.""",
        """A dispensa de apresentação de certidões negativas de débitos tributários e previdenciários.""",
        """A cobrança direta de taxa de quarto privativo aos pacientes encaminhados pelo SUS.""",
      ],
      correctIndex: 1,
      explanation:
          """A auditoria de contratos de saúde pública verifica a conformidade da execução físico-financeira com os instrumentos contratuais e as metas qualitativas e quantitativas estabelecidas no plano operativo.""",
    ),
  ],

  // 4. Executivo em Saúde
  'executivo_saude': [
    const Question(
      subject: 'especificas',
      text:
          """Segundo a Lei Orgânica da Saúde (Lei nº 8.080/1990), compete à direção estadual do Sistema Único de Saúde (SUS), no seu âmbito administrativo:""",
      options: [
        """Executar com exclusividade todas as ações de atenção básica do território municipal.""",
        """Coordenar e, em caráter complementar, executar ações e serviços de vigilância epidemiológica e vigilância sanitária.""",
        """Definir e fiscalizar as políticas de comércio exterior e fronteiras marítimas internacionais.""",
        """Extinguir os conselhos de saúde municipais que não apresentarem superávit orçamentário.""",
        """Gerir os hospitais federais localizados fora do território do respectivo Estado.""",
      ],
      correctIndex: 1,
      explanation:
          """Nos termos do art. 17 da Lei nº 8.080/1990, compete à direção estadual do SUS coordenar e, em caráter complementar, executar ações e serviços de vigilância epidemiológica, vigilância sanitária e saúde do trabalhador.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """A Agência Nacional de Vigilância Sanitária (Anvisa), criada pela Lei nº 9.782/1999 e regulamentada pelo Decreto nº 3.029/1999, caracteriza-se juridicamente como:""",
      options: [
        """Empresa pública de capital aberto vinculada ao Ministério da Fazenda.""",
        """Autarquia sob regime especial, vinculada ao Ministério da Saúde, dotada de autonomia administrativa e financeira.""",
        """Sociedade de economia mista prestadora de serviços hospitalares privados.""",
        """Órgão colegiado consultivo sem poder de polícia nem competência normativa sanitária.""",
        """Fundação privada instituída por confederações empresariais do setor químico.""",
      ],
      correctIndex: 1,
      explanation:
          """A Anvisa é uma autarquia sob regime especial que atua como órgão regulador e coordenador do Sistema Nacional de Vigilância Sanitária (SNVS).""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """De acordo com a história natural da doença e o modelo de prevenção de Leavell & Clark, as ações de imunização ativa (vacinação) contra doenças transmissíveis inserem-se no nível de:""",
      options: [
        """Prevenção Primária (proteção específica).""",
        """Prevenção Secundária (diagnóstico precoce).""",
        """Prevenção Terciária (reabilitação funcional).""",
        """Prevenção Quaternária (evitar iatrogenias).""",
        """Prevenção Quinquenária (cuidados paliativos terminais).""",
      ],
      correctIndex: 0,
      explanation:
          """A vacinação é medida clássica de proteção específica, componente do primeiro nível de prevenção (Prevenção Primária), atuando no período pré-patogênico.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Nos termos do Decreto Federal nº 7.508/2011, o espaço geográfico contínuo constituído por agrupamentos de Municípios limítrofes, delimitado a partir de identidades culturais, econômicas e sociais e de redes de comunicação e infraestrutura de transportes compartilhados, é a definição de:""",
      options: [
        """Distrito Sanitário Especial Indígena.""",
        """Região de Saúde.""",
        """Macrorregião Hospitalar Federal.""",
        """Área de Livre Comércio Sanitário.""",
        """Zona Especial de Proteção Epidemiológica.""",
      ],
      correctIndex: 1,
      explanation:
          """Conforme o art. 2º do Decreto nº 7.508/2011, Região de Saúde é o espaço geográfico contínuo com finalidade de integrar a organização, o planejamento e a execução de ações e serviços de saúde.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """A Portaria de Consolidação GM/MS nº 2/2017 consolida as normas sobre:""",
      options: [
        """Os direitos e deveres dos usuários da saúde.""",
        """As políticas nacionais de saúde do Sistema Único de Saúde (SUS).""",
        """A tabela unificada de procedimentos, medicamentos e OPM do SUS.""",
        """As normas de engenharia e arquitetura predial hospitalar.""",
        """O código de vestimenta profissional dos servidores públicos do Ministério da Saúde.""",
      ],
      correctIndex: 1,
      explanation:
          """A Portaria de Consolidação nº 2/2017 reúne as Políticas Nacionais de Saúde do SUS (Atenção Básica, Atenção Hospitalar, Urgência, Promoção da Saúde, Sangue, etc.).""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """O Planejamento Regional Integrado (PRI) no SUS constitui ferramenta estratégica de governança regional que tem por objetivo precípuo:""",
      options: [
        """Centralizar todas as receitas dos municípios em uma única conta estadual não auditável.""",
        """Identificar necessidades de saúde locais, pactuar a organização das Redes de Atenção à Saúde e definir responsabilidades entre os entes federados da região.""",
        """Privatizar integralmente o atendimento ambulatorial de média complexidade no Estado.""",
        """Substituir o Conselho Estadual de Saúde por auditorias privadas externas contratadas.""",
        """Suspender o atendimento de cidadãos residentes fora do município sede do serviço.""",
      ],
      correctIndex: 1,
      explanation:
          """O PRI fortalece a governança regional, orientando a conformação de redes resolutivas e a alocação tripartite coerente de recursos assistenciais e financeiros.""",
    ),
  ],

  // 5. Gestor em Saúde
  'gestor_saude': [
    const Question(
      subject: 'especificas',
      text:
          """No planejamento estratégico de instituições públicas de saúde, o 'Balanced Scorecard' (BSC) traduz a missão e a estratégia em objetivos e indicadores organizados em perspectivas integradas. No setor público, a perspectiva frequentemente colocada no topo da hierarquia é a:""",
      options: [
        """Perspectiva Financeira de Lucratividade Máxima.""",
        """Perspectiva dos Cidadãos / Sociedade / Usuários.""",
        """Perspectiva do Marketing Institucional Comercial.""",
        """Perspectiva das Sanções Disciplinares Internas.""",
        """Perspectiva da Terceirização Contratual Irrestrita.""",
      ],
      correctIndex: 1,
      explanation:
          """Diferente do setor privado lucrativo (foco no acionista/lucro), no setor público a perspectiva dos Cidadãos/Sociedade é o ápice da cadeia de valor do BSC, expressando a missão pública.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """A Gestão por Competências no setor público compreende a identificação e desenvolvimento do conjunto de Conhecimentos, Habilidades e Atitudes (CHA) necessários para o alcance dos objetivos organizacionais. O termo 'lacuna de competência' (gap) refere-se:""",
      options: [
        """À diferença entre as competências necessárias à organização e as competências efetivamente demonstradas pelos servidores.""",
        """Ao período em que o cargo público permanece vago por aposentadoria.""",
        """Ao número de faltas não justificadas na folha de ponto do servidor público.""",
        """Às atribuições exclusivas do cargo de nível fundamental na administração direta.""",
        """À margem orçamentária para reajuste salarial anual automático dos gestores.""",
      ],
      correctIndex: 0,
      explanation:
          """O gap ou lacuna de competência representa a discrepância entre o que a organização necessita para atingir sua estratégia e o que sua força de trabalho atual domina.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """De acordo com a Portaria de Consolidação GM/MS nº 3/2017 e as diretrizes das Redes de Atenção à Saúde (RAS), o componente que deve desempenhar o papel de centro de comunicação da rede e ordenadora do cuidado ao longo do tempo é a:""",
      options: [
        """Atenção Hospitalar de Alta Complexidade Terciária.""",
        """Atenção Primária à Saúde (APS / Atenção Básica).""",
        """Unidade de Pronto Atendimento (UPA 24h).""",
        """Central de Regulação de Urgências do SAMU.""",
        """Ouvidoria Geral do Sistema de Saúde.""",
      ],
      correctIndex: 1,
      explanation:
          """A Atenção Primária à Saúde (APS) é a porta de entrada preferencial, ordenadora das redes e responsável pela coordenação horizontal e vertical do cuidado continuado.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """A Lei Federal nº 8.142/1990 determina que a representação dos usuários nos Conselhos e Conferências de Saúde deve ser paritária em relação ao conjunto dos demais segmentos. Isso significa que os usuários representam:""",
      options: [
        """25% do total de membros do conselho.""",
        """33% do total de membros do conselho.""",
        """50% do total de membros do conselho.""",
        """75% do total de membros do conselho.""",
        """100% dos membros com direito a voto deliberativo.""",
      ],
      correctIndex: 2,
      explanation:
          """A paridade estabelecida pela Lei nº 8.142/1990 e reforçada pela Resolução CNS nº 453/2012 assegura que 50% dos conselheiros sejam representantes dos usuários, 25% trabalhadores de saúde e 25% gestores/prestadores.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Na governança do SUS, a contratualização de resultados entre gestores públicos e estabelecimentos de saúde visa superar modelos burocráticos tradicionais por meio da pactuação de:""",
      options: [
        """Pagamento exclusivo por procedimento sem análise de desfecho clínico ou satisfação do usuário.""",
        """Metas de produção assistencial, qualidade, segurança do paciente e compromissos com a rede regionalizada.""",
        """Liberação incondicional de recursos financeiros sem prestação de contas periódica.""",
        """Isenção permanente de vistorias sanitárias e auditorias do Ministério Público.""",
        """Substituição da equipe técnica assistencial por comitês puramente políticos partidários.""",
      ],
      correctIndex: 1,
      explanation:
          """A gestão por resultados no SUS atrela o repasse de recursos ao alcance de metas pactuadas de volume, qualidade, tempo de espera e segurança assistencial.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """A ferramenta de diagnóstico situacional que avalia sistematicamente as Forças (Strengths), Fraquezas (Weaknesses), Oportunidades (Opportunities) e Ameaças (Threats) de um serviço de saúde é a:""",
      options: [
        """Matriz SWOT (ou FOFA).""",
        """Diagrama de Ishikawa (Espinha de Peixe).""",
        """Gráfico de Gantt Operacional.""",
        """Análise do Caminho Crítico (CPM).""",
        """Matriz de Risco de Crédito Bancário.""",
      ],
      correctIndex: 0,
      explanation:
          """A Matriz SWOT (FOFA) analisa fatores internos (forças e fraquezas) e externos (oportunidades e ameaças), sendo fundamental no diagnóstico situacional do planejamento estratégico em saúde.""",
    ),
  ],

  // ---------------------------------------------------------------------------
  // NÍVEL MÉDIO
  // ---------------------------------------------------------------------------

  // 6. Assistente de Serviços de Saúde
  'assistente_servicos_saude': [
    const Question(
      subject: 'especificas',
      text:
          """Na recepção de uma Unidade Básica de Saúde (UBS), a Política Nacional de Humanização (PNH) orienta que o primeiro contato com o cidadão seja estruturado a partir do conceito de:""",
      options: [
        """Triagem burocrática excludente por ordem de chegada com corte de senhas.""",
        """Acolhimento com escuta qualificada e avaliação da necessidade de saúde do usuário.""",
        """Cobrança de taxa de cadastro de prontuário e ficha de identificação.""",
        """Encaminhamento imediato e sumário para a emergência hospitalar sem qualquer escuta.""",
        """Atendimento prioritário restrito aos usuários com plano de saúde privado suplementar.""",
      ],
      correctIndex: 1,
      explanation:
          """O acolhimento na PNH é uma postura ética e técnica de escuta qualificada, responsabilização e resolutividade, acolhendo as necessidades do usuário sem barreiras burocráticas.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Conforme o artigo 37 da Constituição Federal de 1988, a administração pública direta e indireta de qualquer dos Poderes da União, dos Estados, do Distrito Federal e dos Municípios obedecerá aos princípios expressos de:""",
      options: [
        """Lucratividade, Sigilo Irrestrito, Pessoalidade, Celeridade e Conveniência.""",
        """Legalidade, Impessoalidade, Moralidade, Publicidade e Eficiência (LIMPE).""",
        """Centralização, Arbitrariedade, Informalidade, Supremacia e Continuidade.""",
        """Proporcionalidade, Discricionariedade, Unidade, Faturamento e Livre Iniciativa.""",
        """Flexibilidade Orçamentária, Ambiência, Solidariedade e Isenção de Responsabilidade.""",
      ],
      correctIndex: 1,
      explanation:
          """O caput do art. 37 da CF/88 consagra os cinco princípios constitucionais fundamentais da Administração Pública: Legalidade, Impessoalidade, Moralidade, Publicidade e Eficiência.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Ao receber um documento oficial que necessita tramitar entre os setores de uma unidade de saúde, o procedimento que registra a entrada, a identificação, a data, a remessa e o destino do documento denomina-se:""",
      options: [
        """Descarte sumário.""",
        """Protocolo.""",
        """Expurgo imediato.""",
        """Indexação anônima.""",
        """Autenticação notarial privada.""",
      ],
      correctIndex: 1,
      explanation:
          """O serviço de protocolo é responsável pelo recebimento, registro, autuação, distribuição, controle da tramitação e expedição de correspondências e documentos em órgãos públicos.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Em relação aos prontuários médicos e registros de saúde dos pacientes, é dever do assistente de serviços de saúde:""",
      options: [
        """Permitir o livre acesso e leitura de prontuários por curiosos ou vizinhos do paciente.""",
        """Manter o rigoroso sigilo profissional sobre todas as informações clínicas e pessoais a que tiver acesso.""",
        """Fotografar os diagnósticos mais graves para divulgar em grupos de mensagens instantâneas.""",
        """Destruir prontuários físicos antigos para liberar espaço no arquivo sem autorização formal.""",
        """Alterar dados clínicos relatados pelo médico sempre que discordar da conduta adotada.""",
      ],
      correctIndex: 1,
      explanation:
          """O sigilo profissional e a preservação da privacidade e intimidade do usuário são deveres inegociáveis de todos os trabalhadores que manipulam dados assistenciais em saúde.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """De acordo com a Lei Federal nº 10.048/2000, têm direito a atendimento prioritário nas repartições públicas e concessionárias de serviços públicos as pessoas com deficiência, os idosos com idade igual ou superior a 60 anos, as gestantes, as lactantes, as pessoas com crianças de colo e os:""",
      options: [
        """Estudantes universitários com comprovante de matrícula.""",
        """Servidores públicos de outras esferas federativas em férias.""",
        """Obesos e pessoas com transtorno do espectro autista.""",
        """Moradores da zona urbana em detrimento dos moradores da zona rural.""",
        """Candidatos inscritos em concursos públicos estaduais.""",
      ],
      correctIndex: 2,
      explanation:
          """A legislação estabelece atendimento prioritário a pessoas com deficiência, idosos, gestantes, lactantes, pessoas com crianças de colo, obesos e pessoas com TEA.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Nas unidades de saúde, a medida básica mais simples, rápida e eficaz para prevenir e controlar a disseminação de infecções e contaminações cruzadas entre profissionais e usuários é a:""",
      options: [
        """Aplicação diária de antibióticos profiláticos em todos os atendentes.""",
        """Higienização adequada das mãos com água e sabonete líquido ou fricção com preparação alcoólica a 70%.""",
        """Utilização da mesma máscara descartável por vários dias ininterruptos.""",
        """Proibição total da circulação de ar nas áreas de espera e recepção.""",
        """Limpeza das superfícies apenas uma vez a cada trimestre.""",
      ],
      correctIndex: 1,
      explanation:
          """A higienização correta das mãos é a medida primordial e mais eficaz recomendada pela OMS e ANVISA para prevenção e controle de infecções nos serviços de saúde.""",
    ),
  ],

  // 7. Instrumentador Cirúrgico
  'instrumentador_cirurgico': [
    const Question(
      subject: 'especificas',
      text:
          """O ato cirúrgico clássico é dividido em tempos operatórios fundamentais, realizados em sequência lógica. A etapa inicial que consiste na incisão ou separação dos tecidos para permitir o acesso à cavidade ou órgão afetado é denominada:""",
      options: [
        """Hemostasia.""",
        """Diérese.""",
        """Exérese.""",
        """Síntese.""",
        """Antissepsia terminal.""",
      ],
      correctIndex: 1,
      explanation:
          """Os 4 tempos cirúrgicos fundamentais são: 1º Diérese (corte/separação), 2º Hemostasia (controle de sangramento), 3º Exérese (retirada/tempo principal) e 4º Síntese (fechamento/sutura).""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Dentre os instrumentais cirúrgicos comumente utilizados, assinale a alternativa que apresenta apenas instrumentos específicos destinados ao tempo de HEMOSTASIA:""",
      options: [
        """Bisturi com lâmina 15 e tesoura de Metzenbaum.""",
        """Pinça Kelly, pinça Rochester e pinça Halsted (mosquito).""",
        """Afastador Farabeuf e válvula de Doyen.""",
        """Porta-agulhas Mayo-Hegar e fio monofilamentar de náilon.""",
        """Cureta de Volkmann e rugina de Farabeuf.""",
      ],
      correctIndex: 1,
      explanation:
          """As pinças hemostáticas (Kelly, Halsted/mosquito, Rochester, Crile) são concebidas especificamente para ocluir vasos sanguíneos e conter sangramentos cirúrgicos.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Na técnica asséptica para degermação pré-operatória das mãos e antebraços da equipe cirúrgica, a duração recomendada para a primeira escovação com solução antisséptica degermante (clorexidina a 4% ou PVPI degermante) é de:""",
      options: [
        """30 segundos.""",
        """1 minuto.""",
        """3 a 5 minutos.""",
        """15 a 20 minutos.""",
        """30 minutos.""",
      ],
      correctIndex: 2,
      explanation:
          """O protocolo de higienização cirúrgica das mãos preconiza degermação inicial de 3 a 5 minutos (e cerca de 2 a 3 minutos nas cirurgias subsequentes), friccionando mãos e antebraços com escova macia/esponja estéril.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Na esterilização física por vapor saturado sob pressão em autoclaves hospitalares, o indicador biológico utilizado para o controle de qualidade do ciclo e verificação da morte de esporos bacterianos resistentes é o:""",
      options: [
        """Bacillus atrophaeus.""",
        """Geobacillus stearothermophilus.""",
        """Staphylococcus aureus.""",
        """Pseudomonas aeruginosa.""",
        """Mycobacterium tuberculosis.""",
      ],
      correctIndex: 1,
      explanation:
          """O micro-organismo teste padrão para validação biológica de ciclos de esterilização a vapor sob pressão em autoclave é o Geobacillus stearothermophilus, altamente termorresistente.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Ao montar a mesa do instrumentador cirúrgico (mesa de Mayo), a disposição padrão e ergonômica dos instrumentais orienta que:""",
      options: [
        """Todos os instrumentos devem ser empilhados aleatoriamente no centro da mesa sem organização prévia.""",
        """Os instrumentos sejam organizados ordenadamente de acordo com os tempos cirúrgicos (diérese, hemostasia, preensão/especiais, afastadores e síntese).""",
        """Os fios de sutura sejam descartados abertos no chão da sala cirúrgica antes do início do procedimento.""",
        """O bisturi elétrico permaneça ativado sobre o paciente sem a caneta protegida no estojo de segurança.""",
        """Instrumentais contaminados com secreções sejam guardados junto às compressas estéreis limpas.""",
      ],
      correctIndex: 1,
      explanation:
          """A mesa cirúrgica é disposta seguindo a sequência dos tempos cirúrgicos, permitindo agilidade, controle quantitativo de materiais e manutenção rigorosa da esterilidade do campo.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """A posição cirúrgica em que o paciente se encontra em decúbito dorsal (supino), com o corpo inclinado de modo que a cabeça fique mais baixa que os membros inferiores, indicada para melhorar o retorno venoso e a exposição de órgãos pélvicos, é a de:""",
      options: [
        """Fowler.""",
        """Trendelenburg.""",
        """Proclive ou Trendelenburg Invertido.""",
        """Litotomia ou Ginecológica.""",
        """Kraske (ou canivete).""",
      ],
      correctIndex: 1,
      explanation:
          """A posição de Trendelenburg inclina a mesa cirúrgica de forma que a cabeça e o tronco fiquem abaixo dos membros inferiores, muito utilizada em cirurgias pélvicas e ginecológicas inferiores.""",
    ),
  ],

  // 8. Técnico em Saúde Bucal
  'tecnico_saude_bucal': [
    const Question(
      subject: 'especificas',
      text:
          """Conforme a Lei Federal nº 11.889/2008, que regulamenta o exercício das profissões de Técnico em Saúde Bucal (TSB) e de Auxiliar em Saúde Bucal (ASB), é atribuição do TSB, sempre sob supervisão do Cirurgião-Dentista:""",
      options: [
        """Realizar cirurgias oromaxilofaciais de grande porte e enxertos ósseos autógenos.""",
        """Inserir e condensar substâncias restauradoras em cavidades preparadas pelo Cirurgião-Dentista e remover suturas.""",
        """Prescrever antibióticos e medicamentos de controle especial no prontuário do paciente.""",
        """Emitir laudos radiográficos e periciais definitivos para fins judiciais.""",
        """Realizar reabilitações protéticas definitivas em implantes dentários sem a presença do dentista.""",
      ],
      correctIndex: 1,
      explanation:
          """O art. 5º da Lei nº 11.889/2008 autoriza expressamente o TSB a inserir e condensar materiais restauradores em cavidades preparadas pelo CD, remover suturas, realizar profilaxia, entre outras atividades delegáveis.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """O isolamento absoluto do campo operatório é técnica indispensável para garantir um ambiente seco, asséptico e livre de umidade salivar em procedimentos restauradores e endodônticos. Dentre os instrumentais e materiais que compõem o conjunto de isolamento absoluto, destacam-se:""",
      options: [
        """Espelho clínico, sonda exploradora nº 5 e pinça de algodão.""",
        """Lençol de borracha, arco de Young, pinça perfuradora de Ainsworth, pinça porta-grampos de Palmer e grampos metálicos.""",
        """Cureta de Gracey, contra-ângulo de baixa rotação e pedra-pomes perfumada.""",
        """Moldeiras metálicas perfuradas para alginato e espátula de gesso flexível.""",
        """Matriz de aço tofflemire e cunhas de madeira interdentais isoladas.""",
      ],
      correctIndex: 1,
      explanation:
          """O kit clássico de isolamento absoluto é formado pelo lençol de borracha, arco metálico ou plástico (Young/Ostby), pinça perfuradora (Ainsworth), pinça porta-grampo (Brewer/Palmer) e grampos dentários específicos.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """O Cimento de Ionômero de Vidro (CIV) é amplamente empregado na odontologia restauradora e preventiva no SUS em razão de suas propriedades biológicas favoráveis, tais como:""",
      options: [
        """Alta toxicidade pulpar e necessidade obrigatória de fotopolimerização em 100% dos tipos.""",
        """Adesão química à estrutura dentária e liberação contínua de íons flúor ao meio bucal.""",
        """Insolubilidade total a qualquer meio aquoso imediatamente após a mistura dos componentes.""",
        """Coeficiente de expansão térmica infinitamente superior ao do dente natural.""",
        """Incompatibilidade biológica severa com tecidos moles periodontais.""",
      ],
      correctIndex: 1,
      explanation:
          """O CIV destaca-se pela adesão química ao esmalte e à dentina, biocompatibilidade, compatibilidade térmica com o dente e capacidade de liberar flúor, inibindo a desmineralização e cáries secundárias.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """No processamento e biossegurança de instrumentais odontológicos perfurocortantes (como foices, curetas e brocas), a sequência padronizada correta antes da esterilização em autoclave é:""",
      options: [
        """Empacotamento imediato sem lavagem, seguido de secagem manual.""",
        """Limpeza (manual ou ultrassônica com detergente enzimático), enxágue abundante, secagem minuciosa, inspeção visual e embalagem em papel grau cirúrgico.""",
        """Desinfecção com álcool líquido 70% direto sem remoção mecânica de matéria orgânica.""",
        """Armazenamento em caixas abertas de gavetas por até 30 dias antes do ciclo térmico.""",
        """Lavagem rápida em água fria e uso imediato no próximo paciente sem autoclave.""",
      ],
      correctIndex: 1,
      explanation:
          """A higienização adequada com detergente enzimático, enxágue, secagem e envelopamento em papel grau cirúrgico com seladora é pré-requisito indispensável para a esterilização eficaz em autoclave.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """O índice epidemiológico recomendado pela Organização Mundial da Saúde (OMS) e utilizado no Brasil nos levantamentos epidemiológicos de saúde bucal (como o SB Brasil) para quantificar o ataque de cárie na dentição permanente é o:""",
      options: [
        """Índice de Placa Visível (IPV).""",
        """Índice CPO-D (dentes cariados, perdidos e obturados).""",
        """Índice de Sangramento Gengival (ISG).""",
        """Índice Periodontal Comunitário (CPI).""",
        """Índice de Fluorose de Dean.""",
      ],
      correctIndex: 1,
      explanation:
          """O CPO-D mede a prevalência de cárie na dentição permanente (C = cariado, P = perdido por cárie, O = obturado/restaurado, D = dente). Para dentição decídua utiliza-se o ceo-d.""",
    ),
    const Question(
      subject: 'especificas',
      text:
          """Na ergonomia odontológica do trabalho a quatro mãos, considerando o mostrador do relógio imaginário tendo a cabeça do paciente às 12 horas, para um operador cirurgião-dentista destro, a 'zona de transferência' e a 'zona do assistente/técnico' situam-se, respectivamente, entre:""",
      options: [
        """Zona de transferência: 12h às 2h; Zona do assistente: 8h às 11h.""",
        """Zona de transferência: 4h às 7h; Zona do assistente: 2h às 4h.""",
        """Zona de transferência: 8h às 10h; Zona do assistente: 11h às 1h.""",
        """Zona de transferência: 1h às 3h; Zona do assistente: 7h às 9h.""",
        """Não existem zonas de trabalho padronizadas na ergonomia odontológica moderna.""",
      ],
      correctIndex: 1,
      explanation:
          """Para destros: Zona do Operador (7h às 12h), Zona Estática (12h às 2h), Zona do Assistente (2h às 4h) e Zona de Transferência (4h às 7h, na região do peito do paciente).""",
    ),
  ],
};
