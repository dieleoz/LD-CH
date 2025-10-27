const wbsMetadata = {
  "version": "1.0",
  "fecha_creacion": "2025-10-08",
  "descripcion": "Metadata enriquecida de la WBS con criterios tÃ©cnicos, justificaciones y trazabilidad completa",
  "items": {
    "1.1.100": {
      "descripcion": "Servidores CTC principales",
      "justificacion_tecnica": "Fundamentado en AT1 (Material Rodante y Equipos Embarcados), que define la arquitectura tecnológica del CTC para control centralizado del tráfico ferroviario. Según AT2 (Operación y Mantenimiento) se requiere disponibilidad 99.95% para sistemas críticos. AT3 (Especificaciones Generales) establece que el CTC debe operar 24/7 con redundancia activa. Cantidad mínima: 2 UND (1 principal + 1 respaldo en hot-standby). Referencias: AT1 Alcance del Proyecto, AT2 Operación y Mantenimiento, AT3 Especificaciones Generales, AT4 Disponibilidad (99.95%)",
      "criterios_diseno": [
        "Redundancia N+1 para alta disponibilidad (AT2 Operación y Mantenimiento)",
        "Capacidad procesamiento: 100 trenes simultáneos (AT1 Alcance del Proyecto)",
        "Tiempo respuesta < 100ms según IEC 62290-1",
        "Failover automático <5 segundos para continuidad operativa (AT2)"
      ],
      "supuestos": [
        "2 servidores (1 principal + 1 respaldo en hot-standby)",
        "Arquitectura cliente-servidor virtualizada",
        "Comunicación redundante fibra óptica en doble anillo",
        "Monitoreo continuo 24/7 según AT2"
      ],
      "decisiones_tecnicas": ["DT-CTC-004-2025-10-24"],
      "feedback_especialista": "Servidores configurados según arquitectura CTC virtual sin señalización física en vía, compatible con ATP embarcado y enclavamientos ENCE.",
      "documentos_ingenieria": [
        "V.1_CTC_Detalle_v1.0.md",
        "IV.1_CTC_Basica_v2.0.md",
        "AT1 - Alcance del Proyecto",
        "AT2 - Operación y Mantenimiento",
        "AT3 - Especificaciones Generales"
      ],
      "referencias_contractuales": [
        "AT1 - Alcance del Proyecto (Material Rodante y Equipos Embarcados)",
        "AT2 - Operación y Mantenimiento (Disponibilidad 99.95%)",
        "AT3 - Especificaciones Generales (Sistema CTC)",
        "IEC 62290-1 - Sistemas de control ferroviario"
      ],
      "ultima_actualizacion": "2025-10-24",
      "actualizado_por": "DT-JUSTIFICACION-WBS-001"
    },
    "1.1.103": {
      "descripcion": "Software CTC virtual + ETCS L2 + Interoperabilidad FENOCO",
      "justificacion_tecnica": "Fundamentado en AT1 (Material Rodante), AT3 (Especificaciones ETCS L2) y AT4 (Disponibilidad), que establecen sistema CTC con ETCS Level 2 interoperable con FENOCO bajo disponibilidad 99.95%. Según cláusula 1.2(d) del Contrato y AT3 (numerales 2.1 y 2.3.1), AT10 (2.1) y AT1 (1.2), el concesionario debe implementar sistema CTC interoperable con FENOCO bajo ETCS L2 con alta disponibilidad y trazabilidad BIM. Cantidad: 1 UND (licencia corporativa completa con: Core CTC $30B para 8 estaciones + CCO + redundancia + 100 trenes simultáneos, ETCS L2 $25B para EVC + RBC + Sistema claves + Interfaces GSM-R/TETRA, Interoperabilidad FENOCO $15B para Protocolos UIC 950-7/554 + Gestión coordinada + Transferencia control, Alta Disponibilidad $9.15B para Cluster N+1 + Failover <5seg + DR RTO<1h RPO<15min + 99.95%). Referencias: AT1 Material Rodante, AT3 ETCS L2 interoperabilidad, AT4 Disponibilidad (99.95%), AT10 Interoperabilidad FENOCO, Knorr Bremse/CRRC ofertas validadas",
      "criterios_diseno": [
        "Licencias Core CTC: $30B - 8 estaciones + CCO + redundancia + 100 trenes simultáneos (AT1)",
        "Módulo ETCS Level 2: $25B - EVC + RBC + Sistema claves + Interfaces GSM-R/TETRA (AT3)",
        "Interoperabilidad FENOCO: $15B - Protocolos UIC 950-7/554 + Gestión coordinada + Transferencia control (AT10)",
        "Alta Disponibilidad: $9.15B - Cluster N+1 + Failover <5seg + DR (RTO<1h, RPO<15min) + 99.95% (AT4)"
      ],
      "supuestos": [
        "Licenciamiento perpetuo con 5 años soporte técnico incluido (AT2)",
        "Certificación CENELEC ETCS Level 2 completa incluida (AT3)",
        "Interfaces FENOCO customizadas específicas del proyecto (AT10)",
        "Capacitación 300 horas (200 operadores + 100 ingenieros según AT2)",
        "Customización 30% del software para requisitos específicos (AT1)",
        "Integración con SCADA, PAN, CCTV incluida (AT3)"
      ],
      "decisiones_tecnicas": [
        "DT-CTC-002-2025-10-08",
        "DT-CTC-003-2025-10-08"
      ],
      "feedback_especialista": "Incremento +901% justificado por alcance completo ETCS L2 + Interoperabilidad FENOCO según AT3 y AT10. Valor alineado con ofertas Knorr Bremse ($82B) y CRRC ($79B) para soluciones similares. Incluye: EVC, RBC, interfaces UIC, sistema HA 99.95% según AT4.",
      "documentos_ingenieria": [
        "V.2_Centro_Control_Trafico_CTC_Detalle_v1.0.md",
        "IV.2_CTC_Basica_v2.0.md",
        "VII.2.1_SRS_ITCS_ETCS_Level2_PROVISIONAL.md",
        "AT1 - Material Rodante",
        "AT3 - ETCS L2 interoperabilidad",
        "AT4 - Disponibilidad 99.95%",
        "AT10 - Interoperabilidad FENOCO"
      ],
      "referencias_contractuales": [
        "AT1 - Material Rodante",
        "AT3 - ETCS L2 interoperabilidad (numerales 2.1, 2.3.1)",
        "AT4 - Disponibilidad 99.95%",
        "AT10 - Interoperabilidad FENOCO (2.1)",
        "UIC 950-7/554 - Protocolos FENOCO",
        "CENELEC - Certificación ETCS L2"
      ],
      "ultima_actualizacion": "2025-10-24",
      "actualizado_por": "DT-JUSTIFICACION-WBS-001"
    },
    "5.3.100": {
      "descripcion": "Servidores SCADA",
      "justificacion_tecnica": "Fundamentado en AT3 (Especificaciones Generales), que establece sistema SCADA para supervisión de infraestructura ferroviaria. Según AT2 (Operación y Mantenimiento), se requiere supervisión remota de señales, cambios de vía, detectores de trenes y circuitos de vía. AT4 exige disponibilidad 99.9% para sistemas SCADA. Cantidad: 2 servidores (1 maestro + 1 esclavo) según arquitectura redundante requerida. Servidores supervisan 500+ puntos I/O distribuidos en 5 estaciones ENCE y talleres. Referencias: AT3 Especificaciones Generales (SCADA), AT2 Operación (supervisión remota), AT4 Disponibilidad (99.9%)",
      "criterios_diseno": [
        "Arquitectura maestro-esclavo redundante (AT3)",
        "Monitoreo tiempo real de señales, cambios vía, detectores (AT2)",
        "Integración con CTC para vista unificada (AT3)",
        "Capacidad: 500+ puntos I/O distribuidos en corredor"
      ],
      "supuestos": [
        "2 servidores (1 maestro + 1 esclavo)",
        "Capacidad: 500 puntos I/O (señales + detectores + cambios vía)",
        "Protocolo IEC 61850 para interoperabilidad",
        "Redundancia N+1 para alta disponibilidad (AT4)"
      ],
      "decisiones_tecnicas": [
        "DT-SCADA-001-2025-10-07"
      ],
      "feedback_especialista": "Costo ajustado a $400M c/u para incluir licencias SCADA corporativas y módulos de ciberseguridad industrial según AT7 (Ciberseguridad IEC 62443).",
      "documentos_ingenieria": [
        "V.5_SCADA_Detalle_v1.0.md",
        "AT3 - Especificaciones Generales (SCADA)",
        "AT2 - Operación y Mantenimiento",
        "AT4 - Disponibilidad 99.9%",
        "AT7 - Ciberseguridad IEC 62443"
      ],
      "referencias_contractuales": [
        "AT3 - Sistema SCADA supervisión infraestructura",
        "AT2 - Operación y Mantenimiento (supervisión remota)",
        "AT4 - Disponibilidad 99.9% sistemas SCADA",
        "AT7 - Ciberseguridad IEC 62443 industrial",
        "IEC 61850 - Protocolo interoperabilidad SCADA"
      ],
      "ultima_actualizacion": "2025-10-24",
      "actualizado_por": "DT-JUSTIFICACION-WBS-001"
    },
    "5.3.101": {
      "descripcion": "Software SCADA",
      "justificacion_tecnica": "Fundamentado en AT3 (Especificaciones Generales), que requiere plataforma SCADA industrial para supervisión de infraestructura ferroviaria. Según AT7 (Ciberseguridad), se debe cumplir IEC 62443 para sistemas industriales. AT2 establece necesidad de historial y reportes para mantenimiento predictivo. Cantidad: 1 licencia corporativa ilimitada para cubrir todo el sistema SCADA incluyendo 500+ puntos I/O. Software debe soportar protocolos industriales estándar y módulos de ciberseguridad. Referencias: AT3 Especificaciones Generales (SCADA), AT7 Ciberseguridad IEC 62443, AT2 Mantenimiento predictivo",
      "criterios_diseno": [
        "Compatibilidad múltiples protocolos: Modbus, DNP3, IEC 61850 (AT3)",
        "HMI gráfico con sinópticos dinámicos por estación",
        "Módulo de alarmas inteligentes y trending histórico",
        "Ciberseguridad IEC 62443 integrada (AT7)"
      ],
      "supuestos": [
        "1 licencia corporativa ilimitada para todo el sistema",
        "Incluye: desarrollo, runtime, historian (5 años histórico), reporting",
        "Soporte técnico 24/7 por 5 años según AT2",
        "Módulo gestión energética para análisis consumos"
      ],
      "decisiones_tecnicas": [
        "DT-SCADA-002-2025-10-07"
      ],
      "feedback_especialista": "Incremento justificado por requerimientos de ciberseguridad IEC 62443 según AT7 y necesidad de módulo de gestión de energía para análisis de consumos según AT2 (mantenimiento predictivo).",
      "documentos_ingenieria": [
        "V.5_SCADA_Detalle_v1.0.md",
        "AT3 - Especificaciones Generales (Software SCADA)",
        "AT7 - Ciberseguridad IEC 62443",
        "AT2 - Mantenimiento predictivo y reportes"
      ],
      "referencias_contractuales": [
        "AT3 - Software SCADA industrial",
        "AT7 - Ciberseguridad IEC 62443 sistemas industriales",
        "AT2 - Mantenimiento predictivo e historial (5 años)",
        "IEC 61850 - Protocolo interoperabilidad",
        "IEC 62443 - Ciberseguridad sistemas industriales"
      ],
      "ultima_actualizacion": "2025-10-24",
      "actualizado_por": "DT-JUSTIFICACION-WBS-001"
    },
    "5.3.103": {
      "descripcion": "Interfaces comunicaciÃ³n L2/L3",
      "justificacion_tecnica": "Fundamentado en AT3 (Especificaciones Generales), que establece red de comunicaciones industrial para sistema SCADA. Según AT4, se requiere disponibilidad 99.9% para comunicaciones críticas. AT7 (Ciberseguridad IEC 62443) exige switches industriales con protección firewall integrada. Cantidad: 1 set completo (core + distribution + access switches) según topología en anillo redundante. Switches core con protocolo PRP (Parallel Redundancy Protocol) para tiempo conmutación <20ms según AT4. Referencias: AT3 Especificaciones Generales (red comunicaciones), AT4 Disponibilidad (99.9%), AT7 Ciberseguridad IEC 62443",
      "criterios_diseno": [
        "Managed switches capa 2/3 con VLAN y QoS según AT3",
        "Redundancia en anillo (ring topology) IEC 62439-3",
        "Grado industrial: -40°C a +75°C según AT3",
        "Protocolo PRP para conmutación <20ms (AT4)"
      ],
      "supuestos": [
        "1 set de equipos: core switch + distribution switches + access switches",
        "Fibra óptica para backbone, cobre para edge según AT3",
        "Certificación IEC 61850-3 para subestaciones industriales",
        "Firewalls integrados según AT7 ciberseguridad"
      ],
      "decisiones_tecnicas": [
        "DT-SCADA-003-2025-10-07"
      ],
      "feedback_especialista": "Costo incluye switches core redundantes con protocolo PRP (Parallel Redundancy Protocol) para tiempo de conmutación <20ms según requerimientos críticos de AT4.",
      "documentos_ingenieria": [
        "V.5_SCADA_Detalle_v1.0.md",
        "V.3_Comunicacion_Detalle_v3.0.md",
        "AT3 - Especificaciones Generales (red comunicaciones)",
        "AT4 - Disponibilidad 99.9%",
        "AT7 - Ciberseguridad IEC 62443"
      ],
      "referencias_contractuales": [
        "AT3 - Switches industriales para red SCADA",
        "AT4 - Disponibilidad 99.9% comunicaciones",
        "AT7 - Ciberseguridad IEC 62443 industrial",
        "IEC 62439-3 - Redundancia ring topology",
        "IEC 61850-3 - Subestaciones industriales"
      ],
      "ultima_actualizacion": "2025-10-24",
      "actualizado_por": "DT-JUSTIFICACION-WBS-001"
    },
    "1.1.106": {
      "descripcion": "Interfaces comunicación",
      "justificacion_tecnica": "Fundamentado en AT3 (Especificaciones Generales), que establece integración de CTC con sistemas ITCS/ETCS L2, FENOCO, TETRA, fibra óptica e ITS. Según AT1, el CTC debe interoperar con todos los subsistemas mediante gateways UIC 918-4. AT7 (Ciberseguridad) requiere firewalls IEC 62443 para protección. Cantidad: 1 UND (bloque lógico completo de integración). NO es hardware físico único sino conjunto funcional que conecta: ITCS/ETCS L2 (gateways UIC 918-4), FENOCO (protocolos UIC 950-7/554), TETRA (voz/datos), Fibra óptica (backbone N+1), ITS (CCTV/acceso/intrusión). Incluye: gateways industriales, switches borde, firewalls IEC 62443, middleware interoperabilidad, licencias software. Referencias: AT3 Especificaciones Generales (integración CTC), AT1 Interoperabilidad sistemas, AT7 Ciberseguridad IEC 62443, UIC 918-4",
      "criterios_diseno": [
        "Integración funcional CTC-ITCS-FENOCO-TETRA-ITS (AT3)",
        "Redundancia N+1 en comunicaciones críticas (AT4)",
        "Middleware interoperabilidad protocolos UIC 918-4 según AT1",
        "Firewalls IEC 62443 para ciberseguridad industrial (AT7)"
      ],
      "supuestos": [
        "1 UND representa conjunto lógico completo de integración",
        "Equipos físicos mayores cubiertos en items 1.1.100-1.1.105",
        "Incluye licencias software, configuración y ensayos FAT/SAT",
        "Interfaces con: ITCS/ETCS L2, FENOCO, TETRA, Fibra, ITS (CCTV/acceso/intrusión)"
      ],
      "decisiones_tecnicas": [
        "DT-INTERFACES-001-2025-10-09"
      ],
      "feedback_especialista": "Elemento clave de integración del sistema CTC. NO es hardware físico único sino bloque funcional que conecta todos los subsistemas. Costo $150M incluye gateways, middleware UIC, firewalls, licencias y configuración completa según AT3 y AT7.",
      "documentos_ingenieria": [
        "V.2_Centro_Control_Trafico_CTC_v5.0.md",
        "IV.2_Interfaces_Sistemas_MEJORADO.md",
        "VII.2.4_Interfaces_CTC_ITCS_Protocolo_FFFIS.md",
        "AT3 - Especificaciones Generales (integración sistemas)",
        "AT1 - Interoperabilidad sistemas",
        "AT7 - Ciberseguridad IEC 62443"
      ],
      "referencias_contractuales": [
        "AT3 - Integración CTC con subsistemas",
        "AT1 - Interoperabilidad FENOCO (protocolos UIC)",
        "AT7 - Ciberseguridad IEC 62443",
        "UIC 918-4 - Gateway interoperabilidad",
        "UIC 950-7/554 - Protocolos FENOCO"
      ],
      "ultima_actualizacion": "2025-10-24",
      "actualizado_por": "DT-JUSTIFICACION-WBS-001"
    },
    "2.1.103": {
      "descripcion": "Radios embarcados (30 unidades)",
      "justificacion_tecnica": "Fundamentado en AT2 (Operación y Mantenimiento) y AT10 (Capacidad Surcos), que establecen comunicaciones radiomóviles TETRA para operación segura ferroviaria. Según Apéndice Financiero 4 (Material rodante), hay 6 locomotoras operativas base. Cantidad: 30 radios según Metodología Punto 42 (factor redundancia 1.5). Cálculo: 9 radios principales embarcados (6 locomotoras operativas + 3 reserva según factor 1.5) + 9 radios maniobras/vía + 12 radios personal operativo = 30 unidades totales. Distribución: radio principal por locomotora (control tráfico y voz CTC) + portátiles para personal conducción/maniobras/mantenimiento. Referencias: AT2 Operación segura, AT10 Requisitos comunicaciones personal, Apéndice Financiero 4 Material rodante",
      "criterios_diseno": [
        "1 radio principal embarcado por locomotora (control tráfico y voz CTC según AT2)",
        "Radios portátiles para personal conducción, maniobras y mantenimiento (AT10)",
        "Factor redundancia 1.5 según Metodología Punto 42",
        "Cumplimiento AT2 y AT10 para operación segura con redundancia emergencias"
      ],
      "supuestos": [
        "Flota base: 6 locomotoras operativas (U18C + GR12 + reserva según Apéndice Financiero 4)",
        "Factor 1.5 redundancia aplicado (dotación + backup según Metodología Punto 42)",
        "Personal operativo: 8 base (jefes tren, seguridad vía, control apartaderos según AT10)",
        "Total calculado: 9 locomotoras + 9 maniobras + 12 personal = 30 radios"
      ],
      "decisiones_tecnicas": [
        "DT-TETRA-002-2025-10-09"
      ],
      "feedback_especialista": "Cálculo basado en Apéndice Financiero 4 (material rodante tractivo) y AT2/AT10 (operación segura). 30 radios cubren: locomotoras (principal) + equipos maniobras/vía + personal operativo con redundancia emergencias.",
      "documentos_ingenieria": [
        "Apéndice Financiero 4 - Material rodante",
        "AT2 - Operación y Mantenimiento",
        "AT10 - Capacidad Surcos",
        "Metodología Punto 42 - Factor redundancia 1.5"
      ],
      "referencias_contractuales": [
        "Apéndice Financiero 4 - Material rodante base (6 locomotoras)",
        "AT2 - Requerimientos operación segura y redundancia emergencias",
        "AT10 - Personal operativo y requisitos comunicaciones",
        "Metodología Punto 42 - Factor redundancia 1.5"
      ],
      "ultima_actualizacion": "2025-10-24",
      "actualizado_por": "DT-JUSTIFICACION-WBS-001"
    }
  },
  "1.1.101": {
    "descripcion": "Servidores CTC respaldo",
    "justificacion_tecnica": "Fundamentado en AT2 (Operación y Mantenimiento), que establece redundancia hot-standby para sistemas críticos con disponibilidad 99.95%. Según AT4, el sistema CTC debe mantener operación continua 24/7 sin interrupciones. Cantidad: 2 UND (configuración N+1 con conmutación automática <5 segundos). El servidor respaldo sincroniza datos en tiempo real y toma control automáticamente ante falla del principal. Referencias: AT2 Operación y Mantenimiento, AT4 Disponibilidad (99.95%), AT3 Especificaciones Generales (redundancia CTC)",
    "criterios_diseno": [
      "Configuración activo-pasivo (hot-standby según AT2)",
      "Sincronización datos en tiempo real < 1 segundo",
      "Conmutación automática ante falla < 5 segundos (AT4)",
      "Arquitectura N+1 full-active para alta disponibilidad"
    ],
    "supuestos": [
      "2 servidores en configuración N+1 redundante",
      "Enlace dedicado fibra óptica para sincronización",
      "UPS dimensionado para 4 horas de autonomía",
      "Monitoreo continuo 24/7 según AT2"
    ],
    "decisiones_tecnicas": ["DT-CTC-005-2025-10-24"],
    "feedback_especialista": "Servidor respaldo configuración hot-standby para garantizar disponibilidad 99.95% requerida por AT2. Failover automático <5 segundos para mantenimiento continuidad operativa CTC.",
    "documentos_ingenieria": [
      "V.1_CTC_Detalle_v1.0.md",
      "IV.1_CTC_Basica_v2.0.md",
      "AT2 - Operación y Mantenimiento",
      "AT4 - Disponibilidad 99.95%",
      "AT3 - Especificaciones Generales (redundancia)"
    ],
    "referencias_contractuales": [
      "AT2 - Operación y Mantenimiento (redundancia hot-standby)",
      "AT4 - Disponibilidad 99.95% sistemas críticos",
      "AT3 - Especificaciones Generales (Sistema CTC)",
      "IEC 62290-1 - Sistemas de control ferroviario"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "1.3.100": {
    "descripcion": "Cable de cobre Cat 6A",
    "justificacion_tecnica": "Fundamentado en AT3 (Especificaciones Generales), que establece infraestructura de comunicaciones para sistemas de señalización y CTC en estaciones ENCE. Según AT1, hay 5 estaciones ENCE críticas (Zapatosa, García Cadena, Barrancabermeja, Puerto Berrío-Grecia, La Dorada-México). AT4 exige disponibilidad 99.95% para sistemas de señalización. Cantidad: 1,000 metros total (5 estaciones × 200m promedio según AT3). Cable Cat 6A para soportar 10 Gbps y garantizar velocidad necesaria para datos críticos. Referencias: AT3 Especificaciones Generales (infraestructura comunicaciones), AT4 Disponibilidad (99.95%), AT1 Estaciones ENCE (5 estaciones)",
    "criterios_diseno": [
      "Categoría 6A para 10 Gbps según AT3",
      "Blindaje STP para ambientes industriales ferroviarios",
      "Certificación permanente según TIA-568.2-D",
      "Compatibilidad poes y 802.3af/at (power over ethernet)"
    ],
    "supuestos": [
      "1,000 metros total (5 estaciones ENCE × 200m cada una)",
      "Incluye conectores RJ45, patch panels, organizadores cable",
      "Infraestructura de canalización según AT3",
      "Conectividad redundante para alta disponibilidad (AT4)"
    ],
    "decisiones_tecnicas": [],
    "feedback_especialista": "Cable Cat 6A permite operación 10 Gbps necesaria para señales digitales ENCE y comunicación con CTC centralizado según AT3.",
    "documentos_ingenieria": [
      "V.3_Comunicacion_Detalle_v3.0.md",
      "AT3 - Especificaciones Generales (comunicaciones)",
      "AT4 - Disponibilidad 99.95%",
      "AT1 - Estaciones ENCE (5 estaciones)"
    ],
    "referencias_contractuales": [
      "AT3 - Infraestructura comunicaciones CTC/ENCE",
      "AT4 - Disponibilidad 99.95% sistemas de señalización",
      "AT1 - 5 estaciones ENCE críticas",
      "TIA-568.2-D - Estándar cableado estructurado"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "2.1.100": {
    "descripcion": "Torres autosoportadas",
    "justificacion_tecnica": "Fundamentado en AT5 (Telecomunicaciones), que establece sistema de radio TETRA con cobertura 100% del corredor La Dorada-Chiriguaná. Según AT1 (Alcance del Proyecto) el corredor tiene 526.133 km de longitud. AT4 exige disponibilidad mínima 99.5% para telecomunicaciones. Cantidad: 37 torres según estudio de cobertura RF con espaciamiento promedio de 14.2 km para garantizar cobertura continua sin zonas muertas. Referencias: AT5 Telecomunicaciones (radio TETRA), AT4 Disponibilidad (99.5%), AT1 Longitud corredor (526.133 km)",
    "criterios_diseno": [
      "Cobertura 100% corredor sin zonas muertas (AT5 Telecomunicaciones)",
      "Altura: 30-45 metros según topografía para cobertura RF",
      "Diseño estructural para vientos 120 km/h (Código Sismo-Resistente)",
      "Puesta a tierra < 10 ohms según IEC 62305",
      "Solapamiento 15-20% entre estaciones contiguas (AT4)"
    ],
    "supuestos": [
      "37 estaciones base TETRA según estudio RF del corredor",
      "Espaciamiento variable según orografía (promedio 14.2 km)",
      "Incluye sistema de iluminación aeronáutica (Aerocivil)",
      "Ubicación en puntos altos para máxima cobertura"
    ],
    "decisiones_tecnicas": [
      "DT-TETRA-001-2025-10-07"
    ],
    "feedback_especialista": "37 torres garantizan cobertura continua para comunicaciones críticas tren-tierra. Reducción alineada con ATP: 8 locomotoras versus 15 originales reduce requerimientos de cobertura simultánea.",
    "documentos_ingenieria": [
      "V.3_Comunicacion_Detalle_v3.0.md",
      "IV.3_Comunicacion_Basica_v2.0.md",
      "AT5 - Telecomunicaciones",
      "AT4 - Disponibilidad (99.5%)",
      "AT1 - Alcance del Proyecto (526.133 km)"
    ],
    "referencias_contractuales": [
      "AT5 - Sistema de radio TETRA (cobertura 100%)",
      "AT4 - Disponibilidad mínima 99.5% telecomunicaciones",
      "AT1 - Longitud corredor 526.133 km",
      "IEC 62305 - Puesta a tierra"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "2.1.101": {
    "descripcion": "Estaciones base TETRA",
    "justificacion_tecnica": "Fundamentado en AT5 (Telecomunicaciones), que establece sistema de radio TETRA digital ETSI EN 300 392-2 para comunicaciones voz/datos tren-tierra. Según AT4, se requiere disponibilidad 99.5% para telecomunicaciones. Cantidad: 37 estaciones base (1 por torre según diseño cobertura RF). Configuración DMO (Direct Mode Operation) + TMO (Trunked Mode Operation) para redundancia. Cada estación con 4 portadoras para garantizar capacidad en picos de tráfico. Potencia transmisión 25W por portadora según AT5. Referencias: AT5 Telecomunicaciones (radio TETRA), AT4 Disponibilidad (99.5%), ETSI EN 300 392-2",
    "criterios_diseno": [
      "Cumplimiento ETSI EN 300 392-2 estándar TETRA",
      "Potencia transmisión 25W por portadora según AT5",
      "4 portadoras por estación para redundancia y capacidad",
      "Configuración DMO + TMO para operación dual"
    ],
    "supuestos": [
      "37 estaciones base (1 por torre según estudio RF)",
      "Configuración DMO (direct mode) + TMO (trunked mode)",
      "Frecuencias autorizadas por MinTIC según licencia",
      "Conectividad fibra óptica redundante según AT5"
    ],
    "decisiones_tecnicas": [
      "DT-TETRA-001-2025-10-07"
    ],
    "feedback_especialista": "37 sitios garantizan cobertura continua para comunicaciones críticas tren-tierra. Sistema TETRA proporciona voz, datos y posicionamiento GPS según AT5.",
    "documentos_ingenieria": [
      "V.3_Comunicacion_Detalle_v3.0.md",
      "AT5 - Telecomunicaciones (radio TETRA)",
      "AT4 - Disponibilidad 99.5%",
      "ETSI EN 300 392-2 - Estándar TETRA"
    ],
    "referencias_contractuales": [
      "AT5 - Sistema de radio TETRA digital",
      "AT4 - Disponibilidad mínima 99.5% telecomunicaciones",
      "ETSI EN 300 392-2 - Estándar TETRA ferroviario",
      "MinTIC - Licencia frecuencias radio"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "3.1.100": {
    "descripcion": "Cable FO LPOC03120484ZC",
    "justificacion_tecnica": "Fundamentado en AT5 (Telecomunicaciones), que establece backbone de fibra óptica en doble anillo redundante para soporte de CTC, TETRA, GSM-R, CCTV y sistemas ITS. Según AT1, el corredor mide 526.133 km. AT4 exige disponibilidad 99.9% para telecomunicaciones. Cálculo: 526 km corredor + 10% reserva para enrollado en cajas (AT5) + 3% contingencia operativa = 594 km total. Cantidad: 594 km de cable con 120 fibras ópticas. Referencias: AT5 Telecomunicaciones (backbone doble anillo), AT4 Disponibilidad (99.9%), AT1 Longitud corredor",
    "criterios_diseno": [
      "Backbone en doble anillo redundante (AT5 Telecomunicaciones)",
      "120 fibras ópticas para segregación por sistemas: 40 CTC, 40 TETRA/GSM-R, 20 CCTV, 20 reserva",
      "Tipo LPOC (Low Profile Optical Cable) para instalación aérea en postes",
      "Cumplimiento ITU-T G.652.D (monomodo estándar)",
      "10% reserva para enrollado en cajas cada 300m (AT5)",
      "Arquitectura N+1 para alta disponibilidad (AT4)"
    ],
    "supuestos": [
      "Instalación aérea en postes cada 50m promedio",
      "10% adicional para reservas en empalmes y reparaciones",
      "3% contingencia para reparaciones futuras",
      "Longitud total: 594 km (526 corredor + 53.37 reserva + 14.78 contingencia)"
    ],
    "decisiones_tecnicas": [],
    "feedback_especialista": "120 fibras ópticas permiten segregación completa de sistemas: CTC (40), TETRA/GSM-R (40), CCTV/accesos (20), reserva para expansión futura (20). Cable LPOC tipo aéreo según AT5.",
    "documentos_ingenieria": [
      "V.3_Comunicacion_Detalle_v3.0.md",
      "AT5 - Telecomunicaciones (backbone doble anillo)",
      "AT4 - Disponibilidad 99.9%",
      "AT1 - Alcance del Proyecto"
    ],
    "referencias_contractuales": [
      "AT5 - Backbone de fibra óptica redundante",
      "AT4 - Disponibilidad 99.9% telecomunicaciones",
      "AT1 - Longitud corredor 526.133 km",
      "ITU-T G.652.D - Fibra monomodo estándar"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "3.1.103": {
    "descripcion": "Cajas de empalme 80x80",
    "justificacion_tecnica": "Fundamentado en AT5 (Telecomunicaciones), que establece punto de acceso cada 300m para mantenimiento y gestión de la red óptica. Según AT3, se requiere acceso cada 300m para sistemas de señalización en corredor La Dorada-Chiriguaná de 520.78 km (PK 201+470 a PK 722+250). Cálculo: 1,735 cajas lineales (520.78 km ÷ 0.3 km) + 88 cajas en 22 puentes (4 por puente según AT3 puentes prioritarios) = 1,823 cajas totales. Cajas ubicadas costado derecho de vía para acceso operativo. Referencias: AT5 Telecomunicaciones (espaciamiento 300m), AT3 Señalización (puntos acceso), DT-FIBRA-641",
    "criterios_diseno": [
      "Ubicación: Costado derecho de vía para acceso operativo (AT5)",
      "Espaciamiento: 300 metros máximo según AT5",
      "Capacidad: 96 fusiones por caja (120 fibras ÷ 24 slots)",
      "Protección IP68 según IEC 60529"
    ],
    "supuestos": [
      "1,735 cajas lineales (520.78 km ÷ 0.3 km espaciamiento)",
      "88 cajas en 22 puentes prioritarios (4 cajas por puente)",
      "Total: 1,823 cajas para gestión fusiones y derivaciones",
      "Cajas tipo 80×80×80 cm estanca según AT5"
    ],
    "decisiones_tecnicas": [
      "DT-FIBRA-641-2025-10-11"
    ],
    "feedback_especialista": "Espaciamiento 300m validado técnicamente: permite mantenimiento eficiente. Alternativas 350m/400m reducirían costos ($500M/$787M) pero aumentarían riesgo operativo.",
    "documentos_ingenieria": [
      "V.3_Comunicacion_Detalle_v3.0.md",
      "AT5 - Telecomunicaciones (espaciamiento cajas 300m)",
      "AT3 - Señalización (puntos acceso cada 300m)",
      "DT-FIBRA-641-2025-10-11"
    ],
    "referencias_contractuales": [
      "AT5 - Espaciamiento cajas empalme 300m",
      "AT3 - Puntos acceso señalización cada 300m",
      "DT-FIBRA-641 - 1,823 cajas validadas",
      "IEC 60529 - Protección IP68"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "4.1.100": {
    "descripcion": "Barreras automÃ¡ticas",
    "justificacion_tecnica": "Fundamentado en AT6 (Seguridad), que establece señalización y barreras automáticas para pasos a nivel (PAN) según clasificación por tráfico vehicular. Según inventario corredor La Dorada-Chiriguaná hay 146 PANs totales: 9 Tipo C con barreras automáticas (>500 veh/día), 15 Tipo B semi-automáticos (100-500 veh/día), 122 con señalización pasiva (<100 veh/día). Cantidad: 36 barreras (9 PAN tipo C × 4 barreras por PAN según AT6). Cada PAN requiere 2 barreras por lado para control tráfico vehicular. Referencias: AT6 Seguridad (barreras automáticas), clasificación PAN por tráfico",
    "criterios_diseno": [
      "Tipo C: 4 barreras por PAN (2 por lado según AT6)",
      "Actuadores electromecÃ¡nicos 24V según normativa",
      "Tiempo cierre < 15 segundos según norma técnica",
      "Control automático integrado con detectores tren"
    ],
    "supuestos": [
      "146 pasos a nivel totales en corredor 526 km",
      "Solo 9 Tipo C con barreras automáticas (alto tráfico)",
      "Resto: 15 semi-auto + 122 señalización pasiva",
      "Barreras sincronizadas con detectores paso tren"
    ],
    "decisiones_tecnicas": [],
    "feedback_especialista": "Clasificación según tráfico vehicular: Tipo C >500 veh/día (automatizadas), Tipo B 100-500 veh/día (semi-auto), resto <100 veh/día (pasiva). Total: 36 barreras en 9 PANs críticos.",
    "documentos_ingenieria": [
      "V.5_Seguridad_Detalle_v1.0.md",
      "AT6 - Seguridad (barreras automáticas PAN)",
      "Inventario PAN - 146 pasos a nivel corredor"
    ],
    "referencias_contractuales": [
      "AT6 - Señalización y barreras automáticas PAN",
      "Inventario 146 PANs corredor (9 tipo C)",
      "Normativa técnica - Tiempo cierre <15seg"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "1.1.102": {
    "descripcion": "Workstations operadores",
    "justificacion_tecnica": "Fundamentado en AT2 (Operación y Mantenimiento), que establece estaciones de operador en el Centro de Control Operativo (CCO) para monitoreo y control de tráfico ferroviario 24/7. Según AT1, se requieren operadores para 2 turnos de 4 operadores cada uno. AT4 exige operación continua sin interrupciones. Cantidad: 8 UND (2 turnos × 4 operadores según AT2). Workstations configuradas para redundancia activa-pasiva. Referencias: AT2 Operación y Mantenimiento (estaciones operador 24/7), AT4 Operación continua, AT1 Centro Control Operativo",
    "criterios_diseno": [
      "Monitoreo tiempo real de tráfico ferroviario (AT2)",
      "Control descentralizado de rutas y surcos (AT2)",
      "Interfaz gráfica HMI para operación intuitiva (AT1)",
      "Resolución múltiple pantalla según AT3"
    ],
    "supuestos": [
      "8 workstations (2 turnos × 4 operadores según AT2)",
      "Configuración redundante para alta disponibilidad",
      "Software CTC integrado según AT1",
      "Monitoreo continuo 24/7 según AT2"
    ],
    "decisiones_tecnicas": ["DT-CTC-007-2025-10-24"],
    "feedback_especialista": "Workstations configuradas según AT2 para operación 24/7 en turnos. Cantidad 8 UND cubre 2 turnos operación continua según requerimientos contractuales.",
    "documentos_ingenieria": [
      "V.1_CTC_Detalle_v1.0.md",
      "AT2 - Operación y Mantenimiento (estaciones operador)",
      "AT4 - Operación continua 24/7",
      "AT1 - Centro Control Operativo"
    ],
    "referencias_contractuales": [
      "AT2 - Estaciones operador CCO (2 turnos)",
      "AT4 - Operación continua 24/7",
      "AT1 - Centro Control Operativo (CCO)",
      "AT3 - Especificaciones HMI"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "1.1.104": {
    "descripcion": "Base de datos centralizada",
    "justificacion_tecnica": "Fundamentado en AT3 (Especificaciones Generales), que establece almacenamiento y registro histórico de tráfico ferroviario. Según AT2, se requiere base de datos centralizada para almacenamiento mínimo 5 años de datos operativos. AT4 exige backup automático y recuperación ante desastres. Cantidad: 1 UND (sistema de base de datos redundante). Almacenamiento: mínimo 50TB según AT2 (5 años histórico). Referencias: AT3 Especificaciones Generales (base de datos centralizada), AT2 Almacenamiento histórico 5 años, AT4 Backup y recuperación",
    "criterios_diseno": [
      "Almacenamiento mínimo 5 años histórico (AT2)",
      "Base de datos redundante N+1 según AT4",
      "Backup automático diario según AT2",
      "Recuperación ante desastres RTO<1h según AT4"
    ],
    "supuestos": [
      "1 sistema base de datos (sistema redundante N+1)",
      "Almacenamiento: 50TB mínimo (5 años histórico según AT2)",
      "Backup automático incluido según AT2",
      "Recuperación RTO<1h, RPO<15min según AT4"
    ],
    "decisiones_tecnicas": ["DT-CTC-006-2025-10-24"],
    "feedback_especialista": "Base de datos centralizada configuración redundante N+1 para almacenamiento 5 años histórico según AT2 y recuperación ante desastres según AT4.",
    "documentos_ingenieria": [
      "V.1_CTC_Detalle_v1.0.md",
      "AT3 - Especificaciones Generales (base de datos)",
      "AT2 - Almacenamiento histórico 5 años",
      "AT4 - Backup y recuperación"
    ],
    "referencias_contractuales": [
      "AT3 - Base de datos centralizada",
      "AT2 - Almacenamiento histórico mínimo 5 años",
      "AT4 - Backup automático y recuperación",
      "AT4 - RTO<1h, RPO<15min"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "1.1.105": {
    "descripcion": "Sistema redundancia",
    "justificacion_tecnica": "Fundamentado en AT4 (Disponibilidad), que establece redundancia N+1 para sistemas críticos del CTC con disponibilidad 99.95%. Según AT2, todos los sistemas críticos deben tener redundancia activa. AT3 especifica arquitectura N+1 full-active para alta disponibilidad. Cantidad: 1 UND (sistema completo de redundancia). Sistema incluye: mecanismo failover automático <5 segundos, sincronización datos tiempo real, detección fallos <100ms. Referencias: AT4 Redundancia N+1 (disponibilidad 99.95%), AT2 Arquitectura redundante, AT3 Failover automático <5seg",
    "criterios_diseno": [
      "Redundancia N+1 full-active según AT4",
      "Failover automático <5 segundos (AT3)",
      "Detección fallos <100ms (AT4)",
      "Sincronización datos tiempo real (AT2)"
    ],
    "supuestos": [
      "1 sistema redundancia completo (N+1 full-active)",
      "Mecanismo failover automático <5 segundos",
      "Sincronización datos tiempo real continua",
      "Detección fallos <100ms según AT4"
    ],
    "decisiones_tecnicas": [],
    "feedback_especialista": "Sistema redundancia configuración N+1 full-active para disponibilidad 99.95% requerida por AT4. Failover automático <5 segundos según AT3.",
    "documentos_ingenieria": [
      "V.1_CTC_Detalle_v1.0.md",
      "AT4 - Redundancia N+1 (99.95%)",
      "AT2 - Arquitectura redundante",
      "AT3 - Failover automático <5seg"
    ],
    "referencias_contractuales": [
      "AT4 - Redundancia N+1 disponibilidad 99.95%",
      "AT2 - Arquitectura redundante críticos",
      "AT3 - Failover automático <5 segundos",
      "AT4 - Detección fallos <100ms"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "6.1.200": {
    "descripcion": "Computadora ATP embarcada",
    "justificacion_tecnica": "Fundamentado en AT1 (Material Rodante), que define sistema ATP embarcado para protección automática de trenes con ATP (Automatic Train Protection) compatible ETCS Level 2. Según AT3, se requiere certificación SIL-4 (CENELEC EN 50126/128/129) para funciones vitales. AT4 exige disponibilidad 99.95% para sistemas ATP. Cantidad: 8 UND (5 locomotoras contractuales según AT1 Apéndice Financiero pág. 3 + 2 para diseño/pruebas FAT/SAT + 1 contingencia/repuesto). Computadora ATP embarcada es el núcleo del sistema de protección automática que integra: Eurobaliza, odómetro, interfaces frenos, display maquinista. Referencias: AT1 Material Rodante (ATP embarcado), AT3 Especificaciones ETCS L2, AT4 Disponibilidad (99.95%), CENELEC EN 50126/128/129",
    "criterios_diseno": [
      "Certificación SIL-4 para funciones vitales (AT3 ETCS L2)",
      "Compatible ETCS Level 2 según AT3",
      "Interfaz con eurobaliza y odómetro (AT3)",
      "Disponibilidad 99.95% (AT4)"
    ],
    "supuestos": [
      "8 computadoras ATP embarcadas (5 locomotoras + 2 FAT/SAT + 1 contingencia)",
      "Interfaz con display maquinista, sensores velocidad, sistema GPS",
      "Certificación CENELEC completa incluida",
      "Compatibilidad ETCS L2 verificada"
    ],
    "decisiones_tecnicas": [
      "DT-ELIMINACION-001-2025-10-24"
    ],
    "feedback_especialista": "Computadora ATP embarcada consolidada en CAP 6 según DT-ELIMINACION-001. Sistema núcleo de protección automática con certificación SIL-4 según AT3.",
    "documentos_ingenieria": [
      "V.4_ATP_Embarcado_Detalle_v1.0.md",
      "AT1 - Material Rodante (ATP embarcado)",
      "AT3 - Especificaciones ETCS L2",
      "AT4 - Disponibilidad 99.95%",
      "DT-ELIMINACION-001-2025-10-24"
    ],
    "referencias_contractuales": [
      "AT1 - Material Rodante (5 locomotoras)",
      "AT3 - ATP compatible ETCS L2",
      "AT4 - Disponibilidad 99.95%",
      "CENELEC EN 50126/128/129 - Certificación SIL-4"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "6.1.201": {
    "descripcion": "Display maquinista",
    "justificacion_tecnica": "Fundamentado en AT3 (Especificaciones Generales ETCS L2), que establece Driver Machine Interface (DMI) en cada cabina para visualización de información crítica ATP. Según AT4, el DMI debe mostrar Movement Authority (MA), velocidad objetivo, velocidad actual y alarmas en tiempo real. Cantidad: 8 UND (1 por sistema ATP embarcado según cantidad computadoras). Display táctil con salida IP65/IK10 según AT3. Referencias: AT3 ETCS L2 DMI, AT4 Información visual crítica, UIC EIRENE",
    "criterios_diseno": [
      "Pantalla táctil 10.1 pulgadas según AT3 ETCS L2",
      "Visualización Movement Authority en tiempo real (AT4)",
      "Indicadores velocidad actual vs objetivo (AT4)",
      "Alertas visuales y sonoras (AT4)"
    ],
    "supuestos": [
      "8 displays maquinista (1 por ATP embarcado)",
      "Certificación ETCS L2 incluida",
      "Interfaz con computadora ATP embarcada",
      "Protección IP65/IK10 ambientes ferroviarios"
    ],
    "decisiones_tecnicas": [
      "DT-ELIMINACION-001-2025-10-24"
    ],
    "feedback_especialista": "Display maquinista consolidado en CAP 6 según DT-ELIMINACION-001. Interfaz maquinista según estándar UIC EIRENE y especificaciones ETCS L2.",
    "documentos_ingenieria": [
      "V.4_ATP_Embarcado_Detalle_v1.0.md",
      "AT3 - Especificaciones ETCS L2 (DMI)",
      "AT4 - Información visual crítica",
      "UIC EIRENE - Estándar DMI ferroviario"
    ],
    "referencias_contractuales": [
      "AT3 - Driver Machine Interface (DMI)",
      "AT4 - Información visual crítica",
      "UIC EIRENE - Estándar DMI ferroviario"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "6.1.206": {
    "descripcion": "Sistema redundancia ATP",
    "justificacion_tecnica": "Fundamentado en AT4 (Disponibilidad), que establece redundancia N+1 para sistemas ATP embarcados críticos con disponibilidad 99.95%. Según AT3, el sistema ATP debe tener dos canales independientes para funciones vitales. Cantidad: 8 UND (1 por sistema ATP embarcado). Sistema incluye: votación 2oo3 (2 out of 3) para decisión segura, detección fallos <100ms, fail-safe ante fallo canal. Referencias: AT4 Redundancia N+1 (99.95%), AT3 Dos canales ATP independientes, CENELEC EN 50129",
    "criterios_diseno": [
      "Dos canales independientes (AT3 ETCS L2)",
      "Voting 2oo3 para decisión segura (AT4)",
      "Detección fallos <100ms (AT4)",
      "Fail-safe ante fallo de canal (AT3)"
    ],
    "supuestos": [
      "8 sistemas redundancia ATP (1 por ATP embarcado)",
      "Arquitectura two-channel con votación 2oo3",
      "Detección fallos <100ms según AT4",
      "Fail-safe automático según AT3"
    ],
    "decisiones_tecnicas": [
      "DT-ELIMINACION-001-2025-10-24"
    ],
    "feedback_especialista": "Sistema redundancia ATP consolidado en CAP 6 según DT-ELIMINACION-001. Dos canales independientes con votación 2oo3 para disponibilidad 99.95% según AT4.",
    "documentos_ingenieria": [
      "V.4_ATP_Embarcado_Detalle_v1.0.md",
      "AT4 - Redundancia N+1 (99.95%)",
      "AT3 - Dos canales ATP independientes",
      "CENELEC EN 50129 - Certificación redundancia"
    ],
    "referencias_contractuales": [
      "AT4 - Redundancia N+1 disponibilidad 99.95%",
      "AT3 - Dos canales ATP independientes",
      "CENELEC EN 50129 - Certificación redundancia"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "2.1.102": {
    "descripcion": "Antenas TETRA",
    "justificacion_tecnica": "Fundamentado en AT5 (Telecomunicaciones), que establece sistema de radio TETRA con antenas especializadas para comunicaciones ferroviarias. Según AT4, se requiere disponibilidad 99.5% para telecomunicaciones. Cantidad: 37 UND (1 por estación base TETRA según diseño cobertura RF). Antenas omnidireccionales según AT5 para cobertura 360° en corredor. Ganancia mínima 10 dBi según AT5 para garantizar alcance RF. Referencias: AT5 Telecomunicaciones (antenas TETRA), AT4 Disponibilidad (99.5%), ETSI EN 300 392-2",
    "criterios_diseno": [
      "Antenas omnidireccionales para cobertura 360° (AT5)",
      "Ganancia mínima 10 dBi según AT5",
      "Impedancia 50 ohmios según ETSI EN 300 392-2",
      "Protección IP66 según AT5 ambientes ferroviarios"
    ],
    "supuestos": [
      "37 antenas TETRA (1 por estación base)",
      "Configuración omnidireccional para cobertura completa",
      "Frecuencias TETRA según licencia MinTIC",
      "Ubicación en torres 30-45m según AT5"
    ],
    "decisiones_tecnicas": [
      "DT-TETRA-001-2025-10-07"
    ],
    "feedback_especialista": "37 antenas TETRA omnidireccionales para cobertura completa corredor según AT5. Ganancia 10 dBi garantiza alcance RF necesario para comunicaciones críticas tren-tierra.",
    "documentos_ingenieria": [
      "V.3_Comunicacion_Detalle_v3.0.md",
      "AT5 - Telecomunicaciones (antenas TETRA)",
      "AT4 - Disponibilidad 99.5%",
      "ETSI EN 300 392-2 - Estándar TETRA"
    ],
    "referencias_contractuales": [
      "AT5 - Antenas TETRA (cobertura RF)",
      "AT4 - Disponibilidad mínima 99.5% telecomunicaciones",
      "ETSI EN 300 392-2 - Estándar TETRA",
      "MinTIC - Licencia frecuencias"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "6.1.202": {
    "descripcion": "Sensores velocidad",
    "justificacion_tecnica": "Fundamentado en AT3 (Especificaciones ETCS L2), que establece odómetro con sensores velocidad para ATP embarcado. Según AT4, se requiere medición velocidad continua para protección automática. Cantidad: 8 UND (1 por sistema ATP embarcado). Sensores redundantes tipo radar doppler o magnético según AT3. Precisión ±0.5% según especificaciones ETCS L2. Referencias: AT3 ETCS L2 odómetro, AT4 Medición velocidad continua, CENELEC EN 50126",
    "criterios_diseno": [
      "Sensores redundantes radar doppler o magnético (AT3)",
      "Precisión ±0.5% según ETCS L2",
      "Frecuencia muestreo 100 Hz según AT3",
      "Rango 0-200 km/h según AT3"
    ],
    "supuestos": [
      "8 sets sensores velocidad (1 por ATP embarcado)",
      "Redundancia en configuración 2oo3 según AT3",
      "Interfaz con computadora ATP embarcada",
      "Certificación CENELEC incluida"
    ],
    "decisiones_tecnicas": [
      "DT-ELIMINACION-001-2025-10-24"
    ],
    "feedback_especialista": "Sensores velocidad consolidados en CAP 6 según DT-ELIMINACION-001. Odómetro ATP con precisión ±0.5% según ETCS L2.",
    "documentos_ingenieria": [
      "V.4_ATP_Embarcado_Detalle_v1.0.md",
      "AT3 - ETCS L2 odómetro",
      "AT4 - Medición velocidad continua",
      "CENELEC EN 50126 - Certificación"
    ],
    "referencias_contractuales": [
      "AT3 - Odómetro ATP (sensores velocidad)",
      "AT4 - Medición velocidad continua",
      "CENELEC EN 50126 - Certificación"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "6.1.203": {
    "descripcion": "Sistema GPS",
    "justificacion_tecnica": "Fundamentado en AT3 (Especificaciones ETCS L2), que establece posicionamiento GPS para ATP embarcado con precisión ±10 metros. Según AT4, se requiere posicionamiento continuo para Movement Authority. Cantidad: 8 UND (1 por sistema ATP embarcado). Receptor GPS dual (GPS + GLONASS) según AT3 para redundancia señales satelitales. Referencias: AT3 ETCS L2 posicionamiento GPS, AT4 Posicionamiento continuo, IEC 61373",
    "criterios_diseno": [
      "Receptor GPS dual (GPS + GLONASS) según AT3",
      "Precisión ±10 metros según AT3 ETCS L2",
      "Actualización 1 Hz según AT4",
      "Protección IEC 61373 vibración/choque"
    ],
    "supuestos": [
      "8 receptores GPS (1 por ATP embarcado)",
      "Interfaz con computadora ATP embarcada",
      "Antena GPS redundante según AT3",
      "Certificación IEC 61373 ambientes ferroviarios"
    ],
    "decisiones_tecnicas": [
      "DT-ELIMINACION-001-2025-10-24"
    ],
    "feedback_especialista": "Sistema GPS consolidado en CAP 6 según DT-ELIMINACION-001. Posicionamiento continuo ±10m según ETCS L2.",
    "documentos_ingenieria": [
      "V.4_ATP_Embarcado_Detalle_v1.0.md",
      "AT3 - ETCS L2 posicionamiento GPS",
      "AT4 - Posicionamiento continuo",
      "IEC 61373 - Vibración y choque"
    ],
    "referencias_contractuales": [
      "AT3 - Posicionamiento GPS ATP",
      "AT4 - Posicionamiento continuo",
      "IEC 61373 - Vibración y choque ferroviario"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "6.1.204": {
    "descripcion": "Software ATP",
    "justificacion_tecnica": "Fundamentado en AT3 (Especificaciones ETCS L2), que requiere software ATP con certificación CENELEC para funciones protección automática. Según AT4, el software ATP debe calcular Movement Authority continuamente. Cantidad: 8 UND (1 licencia por ATP embarcado). Software ATP incluye: cálculos MA, speed profile, eurobaliza interfaces, comunicación radio RBC. Referencias: AT3 ETCS L2 software ATP, AT4 Movement Authority continua, CENELEC EN 50128",
    "criterios_diseno": [
      "Certificación CENELEC EN 50128 según AT3",
      "Cálculos Movement Authority continuos (AT4)",
      "Interfaces eurobaliza y odómetro (AT3)",
      "Comunicación radio RBC (AT3)"
    ],
    "supuestos": [
      "8 licencias software ATP (1 por ATP embarcado)",
      "Certificación CENELEC completa incluida",
      "Interfaz con display maquinista y sensores",
      "Actualizaciones 5 años según AT2"
    ],
    "decisiones_tecnicas": [
      "DT-ELIMINACION-001-2025-10-24"
    ],
    "feedback_especialista": "Software ATP consolidado en CAP 6 según DT-ELIMINACION-001. Certificación CENELEC EN 50128 según AT3.",
    "documentos_ingenieria": [
      "V.4_ATP_Embarcado_Detalle_v1.0.md",
      "AT3 - ETCS L2 software ATP",
      "AT4 - Movement Authority continua",
      "CENELEC EN 50128 - Certificación software"
    ],
    "referencias_contractuales": [
      "AT3 - Software ATP ETCS L2",
      "AT4 - Movement Authority continua",
      "CENELEC EN 50128 - Certificación software"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "6.1.205": {
    "descripcion": "Interfaces frenos",
    "justificacion_tecnica": "Fundamentado en AT3 (Especificaciones ETCS L2), que establece interfaces ATP con sistema frenos para aplicación automática de frenos en caso violación velocidad o MA. Según AT4, se requiere respuesta <3 segundos para aplicación frenos. Cantidad: 8 UND (1 por sistema ATP embarcado). Interfaces redundantes 2oo3 según AT3 para alta disponibilidad. Referencias: AT3 ETCS L2 interfaces frenos, AT4 Respuesta <3seg, CENELEC EN 50126",
    "criterios_diseno": [
      "Interfaces redundantes 2oo3 (AT3)",
      "Respuesta aplicación frenos <3 segundos (AT4)",
      "Señalización fail-safe (AT3)",
      "Comunicación con sistema frenos existente"
    ],
    "supuestos": [
      "8 sets interfaces frenos (1 por ATP embarcado)",
      "Redundancia configuración 2oo3 según AT3",
      "Interfaz con computadora ATP embarcada",
      "Señales fail-safe según AT3"
    ],
    "decisiones_tecnicas": [
      "DT-ELIMINACION-001-2025-10-24"
    ],
    "feedback_especialista": "Interfaces frenos consolidadas en CAP 6 según DT-ELIMINACION-001. Aplicación automática frenos <3seg según AT4.",
    "documentos_ingenieria": [
      "V.4_ATP_Embarcado_Detalle_v1.0.md",
      "AT3 - ETCS L2 interfaces frenos",
      "AT4 - Respuesta <3 segundos",
      "CENELEC EN 50126 - Certificación"
    ],
    "referencias_contractuales": [
      "AT3 - Interfaces frenos ATP",
      "AT4 - Respuesta <3 segundos",
      "CENELEC EN 50126 - Certificación"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "1.4.100": {
    "descripcion": "Desvíos motorizados CTC",
    "justificacion_tecnica": "Fundamentado en AT3 (Especificaciones Generales), que establece aparatos de vía motorizados y telemandados desde el CTC para control automático del tráfico. Según AT1, hay 25 desvíos motorizados en puntos críticos del corredor. AT4 exige disponibilidad 99.95% para sistemas de desvíos motorizados. Cantidad: 25 UND según inventario corredor (puntos críticos seleccionados según AT1). Desvíos motorizados permiten operación remota desde CTC según AT3. Referencias: AT3 Especificaciones Generales (desvíos motorizados), AT4 Disponibilidad (99.95%), AT1 Inventario 25 desvíos críticos",
    "criterios_diseno": [
      "Desvíos motorizados telemandados desde CTC (AT3)",
      "Control remoto automático según AT3",
      "Disponibilidad 99.95% según AT4",
      "Interfaz con CTC para operación centralizada"
    ],
    "supuestos": [
      "25 desvíos motorizados en puntos críticos",
      "Control remoto desde CTC centralizado",
      "Redundancia N+1 según AT4",
      "Interfaces con CTC integradas"
    ],
    "decisiones_tecnicas": [
      "DT-ENCE-003-2025-10-07"
    ],
    "feedback_especialista": "25 desvíos motorizados según inventario corredor AT1. Control remoto CTC para operación automática según AT3. Disponibilidad 99.95% según AT4.",
    "documentos_ingenieria": [
      "V.2_Enclavamientos_Detalle_v1.0.md",
      "AT3 - Especificaciones Generales (desvíos motorizados)",
      "AT4 - Disponibilidad 99.95%",
      "AT1 - Inventario 25 desvíos críticos"
    ],
    "referencias_contractuales": [
      "AT3 - Desvíos motorizados telemandados",
      "AT4 - Disponibilidad 99.95%",
      "AT1 - Inventario 25 desvíos críticos"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "1.4.101": {
    "descripcion": "Sistemas control remoto + redundancia N+1",
    "justificacion_tecnica": "Fundamentado en AT4 (Disponibilidad), que establece redundancia N+1 para sistemas de control remoto de desvíos motorizados. Según AT3, el control remoto debe operar con failover automático <5 segundos. AT2 requiere mantenimiento predictivo de señales desvío. Cantidad: 25 UND (1 sistema por desvío según configuración redundante N+1). Sistema incluye: control remoto CTC, redundancia N+1, failover <5seg, interfaces. Referencias: AT4 Redundancia N+1 (99.95%), AT3 Failover automático <5seg, AT2 Mantenimiento predictivo",
    "criterios_diseno": [
      "Sistemas control remoto redundante N+1 (AT4)",
      "Failover automático <5 segundos (AT3)",
      "Interfaces CTC/ENCE integradas (AT3)",
      "Monitoreo predictivo según AT2"
    ],
    "supuestos": [
      "25 sistemas control (1 por desvío motorizado)",
      "Redundancia N+1 full-active según AT4",
      "Interfaz con CTC centralizado",
      "Mantenimiento predictivo según AT2"
    ],
    "decisiones_tecnicas": [
      "DT-ENCE-003-2025-10-07"
    ],
    "feedback_especialista": "Sistemas control remoto con redundancia N+1 para disponibilidad 99.95% según AT4. Failover <5seg según AT3.",
    "documentos_ingenieria": [
      "V.2_Enclavamientos_Detalle_v1.0.md",
      "AT4 - Redundancia N+1 (99.95%)",
      "AT3 - Failover automático <5seg",
      "AT2 - Mantenimiento predictivo"
    ],
    "referencias_contractuales": [
      "AT4 - Redundancia N+1 disponibilidad 99.95%",
      "AT3 - Failover automático <5 segundos",
      "AT2 - Mantenimiento predictivo"
    ],
    "ultima_actualizacion": "2025-10-24",
    "actualizado_por": "DT-JUSTIFICACION-WBS-001"
  },
  "plantilla_nuevo_item": {
    "descripcion": "",
    "justificacion_tecnica": "",
    "criterios_diseno": [],
    "supuestos": [],
    "decisiones_tecnicas": [],
    "feedback_especialista": "",
    "documentos_ingenieria": [],
    "ultima_actualizacion": "",
    "actualizado_por": ""
  }
};

// Hacer disponible globalmente
if (typeof window !== 'undefined') {
    window.wbsMetadata = wbsMetadata;
}


