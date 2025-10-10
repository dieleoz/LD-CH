window.wbsMetadataEnriquecida = {
  "version": "1.0",
  "fecha_creacion": "2025-10-08",
  "descripcion": "Metadata enriquecida de la WBS con criterios técnicos, justificaciones y trazabilidad completa",
  "items": {
    "1.1.100": {
      "descripcion": "Servidores CTC principales",
      "justificacion_tecnica": "Servidores redundantes para control centralizado del tráfico ferroviario según AT2 §5.3",
      "criterios_diseno": [
        "Redundancia N+1 para alta disponibilidad",
        "Capacidad procesamiento: 100 trenes simultáneos",
        "Tiempo respuesta < 100ms según IEC 62290-1"
      ],
      "supuestos": [
        "2 servidores (1 principal + 1 respaldo)",
        "Arquitectura cliente-servidor",
        "Comunicación redundante fibra óptica"
      ],
      "decisiones_tecnicas": [],
      "feedback_especialista": "",
      "documentos_ingenieria": [
        "V.1_CTC_Detalle_v1.0.md",
        "IV.1_CTC_Basica_v2.0.md"
      ],
      "ultima_actualizacion": "2025-10-08",
      "actualizado_por": "Sistema WBS"
    },
    "1.1.103": {
      "descripcion": "Software CTC virtual + ETCS L2 + Interoperabilidad FENOCO",
      "justificacion_tecnica": "Software CTC ampliado con ETCS Level 2, Interoperabilidad FENOCO y Alta Disponibilidad segun ofertas tecnicas Knorr Bremse/CRRC validadas - Desglose: Core $30B + ETCS L2 $25B + FENOCO $15B + HA $9.15B",
      "criterios_diseno": [
        "Licencias Core CTC: $30B - 8 estaciones + CCO + redundancia + 100 trenes simultaneos",
        "Modulo ETCS Level 2: $25B - EVC + RBC + Sistema claves + Interfaces GSM-R/TETRA",
        "Interoperabilidad FENOCO: $15B - Protocolos UIC 950-7/554 + Gestion coordinada + Transferencia control",
        "Alta Disponibilidad: $9.15B - Cluster N+1 + Failover <5seg + DR (RTO<1h, RPO<15min) + 99.95%"
      ],
      "supuestos": [
        "Licenciamiento perpetuo con 5 anos soporte tecnico incluido",
        "Certificacion CENELEC ETCS Level 2 completa incluida",
        "Interfaces FENOCO customizadas especificas del proyecto",
        "Capacitacion 300 horas (200 operadores + 100 ingenieros)",
        "Customizacion 30% del software para requisitos especificos",
        "Integracion con SCADA, PAN, CCTV incluida"
      ],
      "decisiones_tecnicas": [
        "DT-CTC-002-2025-10-08",
        "DT-CTC-003-2025-10-08"
      ],
      "feedback_especialista": "Incremento +901% justificado por alcance completo ETCS L2 + Interoperabilidad FENOCO. Valor alineado con ofertas Knorr Bremse ($82B) y CRRC ($79B) para soluciones similares. Incluye: EVC, RBC, interfaces UIC, sistema HA 99.95%.",
      "documentos_ingenieria": [
        "V.2_Centro_Control_Trafico_CTC_Detalle_v1.0.md",
        "IV.2_CTC_Basica_v2.0.md",
        "VII.2.1_SRS_ITCS_ETCS_Level2_PROVISIONAL.md"
      ],
      "ultima_actualizacion": "2025-10-08",
      "actualizado_por": "DT-CTC-003"
    },
    "1.2.100": {
      "descripcion": "Computadora ATP embarcada",
      "justificacion_tecnica": "Reducción de 15 a 8 unidades alineada con AT1: 5 locomotoras contractuales + 2 diseño/pruebas + 1 contingencia",
      "criterios_diseno": [
        "Cumplimiento CENELEC EN 50126/128/129",
        "SIL 4 para funciones vitales de seguridad",
        "Interfaz con eurobaliza y odómetro"
      ],
      "supuestos": [
        "5 locomotoras operativas según AT1 §3.1",
        "2 unidades para diseño y pruebas de aceptación",
        "1 unidad de contingencia/repuesto estratégico"
      ],
      "decisiones_tecnicas": [
        "DT-TETRA-001-2025-10-07",
        "DT-ATP-001-2025-10-09"
      ],
      "feedback_especialista": "Cantidad 8 UND justificada por Apéndice Financiero pág. 3 (5 locomotoras: 2 GR12 + 2 U10 + 1 U18C) + 3 reserva (2 pruebas FAT/SAT + 1 contingencia). Alineación contractual AT1 completa.",
      "documentos_ingenieria": [
        "V.2_ATP_Detalle_v3.0.md",
        "IV.2_ATP_Basica_v2.0.md",
        "AT1 - Apéndice Técnico 1",
        "Apéndice Financiero pág. 3"
      ],
      "referencias_contractuales": [
        "Apéndice Financiero pág. 3 - Material rodante base",
        "AT1 Cap. V y Anexo AT1-3 - Equipos embarcados"
      ],
      "ultima_actualizacion": "2025-10-09",
      "actualizado_por": "DT-ATP-001-2025-10-09"
    },
    "5.3.100": {
      "descripcion": "Servidores SCADA",
      "justificacion_tecnica": "Servidores duales para sistema SCADA de supervisión de infraestructura ferroviaria",
      "criterios_diseno": [
        "Arquitectura maestro-esclavo",
        "Monitoreo tiempo real de señales, cambios vía, detectores",
        "Integración con CTC para vista unificada"
      ],
      "supuestos": [
        "2 servidores (1 maestro + 1 esclavo)",
        "Capacidad: 500 puntos I/O",
        "Protocolo IEC 61850 para interoperabilidad"
      ],
      "decisiones_tecnicas": [
        "DT-SCADA-001-2025-10-07"
      ],
      "feedback_especialista": "Costo ajustado a $400M c/u para incluir licencias SCADA corporativas y módulos de ciberseguridad industrial.",
      "documentos_ingenieria": [
        "V.5_SCADA_Detalle_v1.0.md"
      ],
      "ultima_actualizacion": "2025-10-08",
      "actualizado_por": "DT-SCADA-001"
    },
    "5.3.101": {
      "descripcion": "Software SCADA",
      "justificacion_tecnica": "Plataforma SCADA industrial de alta confiabilidad para supervisión y control",
      "criterios_diseno": [
        "Compatibilidad con múltiples protocolos: Modbus, DNP3, IEC 61850",
        "HMI gráfico con sinópticos dinámicos",
        "Módulo de alarmas inteligentes y trending"
      ],
      "supuestos": [
        "1 licencia corporativa ilimitada",
        "Incluye: desarrollo, runtime, historian, reporting",
        "Soporte técnico 24/7 por 5 años"
      ],
      "decisiones_tecnicas": [
        "DT-SCADA-002-2025-10-07"
      ],
      "feedback_especialista": "Incremento justificado por requerimientos de ciberseguridad IEC 62443 y necesidad de módulo de gestión de energía para análisis de consumos.",
      "documentos_ingenieria": [
        "V.5_SCADA_Detalle_v1.0.md"
      ],
      "ultima_actualizacion": "2025-10-08",
      "actualizado_por": "DT-SCADA-002"
    },
    "1.1.106": {
      "descripcion": "Interfaces comunicación",
      "justificacion_tecnica": "Bloque lógico de integración (no hardware físico único). Conecta CTC con ITCS/ETCS L2, FENOCO (Gateway UIC 918-4), TETRA (voz/datos), Fibra óptica (backbone N+1) y sistemas ITS. Incluye: gateways industriales, switches de borde, firewalls IEC 62443, middleware interoperabilidad, licencias software.",
      "criterios_diseno": [
        "Integración funcional CTC-ITCS-FENOCO-TETRA-ITS",
        "Redundancia N+1 en comunicaciones críticas",
        "Middleware interoperabilidad con protocolos UIC 918-4",
        "Firewalls IEC 62443 para ciberseguridad industrial"
      ],
      "supuestos": [
        "1 UND representa conjunto lógico completo de integración",
        "Equipos físicos mayores cubiertos en ítems 1.1.100-1.1.105",
        "Incluye licencias software, configuración y ensayos FAT/SAT",
        "Interfaces con: ITCS/ETCS L2, FENOCO, TETRA, Fibra, ITS (CCTV/acceso/intrusión)"
      ],
      "decisiones_tecnicas": [
        "DT-INTERFACES-001-2025-10-09"
      ],
      "feedback_especialista": "Elemento clave de integración del sistema CTC. NO es hardware físico único sino bloque funcional que conecta todos los subsistemas. Costo $150M incluye gateways, middleware UIC, firewalls, licencias y configuración completa.",
      "documentos_ingenieria": [
        "V.2_Centro_Control_Trafico_CTC_v5.0.md",
        "IV.2_Interfaces_Sistemas_MEJORADO.md",
        "VII.2.4_Interfaces_CTC_ITCS_Protocolo_FFFIS.md"
      ],
      "ultima_actualizacion": "2025-10-09",
      "actualizado_por": "DT-INTERFACES-001-2025-10-09"
    },
    "2.1.103": {
      "descripcion": "Radios embarcados (30 unidades)",
      "justificacion_tecnica": "30 radios embarcados TETRA según Metodología Punto 42: 9 locomotoras operativas (factor 1.5 redundancia) + 9 equipos maniobras/vía + 12 personal operativo. Basado en AT2/AT10 para operación segura con redundancia en emergencias. Distribución: radio principal por locomotora + portátiles para conducción/maniobras/mantenimiento.",
      "criterios_diseno": [
        "1 radio principal embarcado por locomotora (control tráfico y voz CTC)",
        "Radios portátiles para personal conducción, maniobras y mantenimiento",
        "Factor redundancia 1.5 según Metodología Punto 42",
        "Cumplimiento AT2 y AT10 para operación segura"
      ],
      "supuestos": [
        "Flota base: 6 locomotoras operativas (U18C + GR12 + reserva)",
        "Factor 1.5 redundancia aplicado (dotación + backup)",
        "Personal operativo: 8 base (jefes tren, seguridad vía, control apartaderos)",
        "Total calculado: 9 locomotoras + 9 maniobras + 12 personal = 30 radios"
      ],
      "decisiones_tecnicas": [
        "DT-TETRA-002-2025-10-09"
      ],
      "feedback_especialista": "Cálculo basado en Apéndice Financiero 4 (material rodante tractivo) y AT2/AT10 (operación segura). 30 radios cubren: locomotoras (principal) + equipos maniobras/vía + personal operativo con redundancia emergencias.",
      "documentos_ingenieria": [
        "Apéndice Financiero 4",
        "AT2 - Operación y Mantenimiento",
        "AT10 - Capacidad Surcos"
      ],
      "referencias_contractuales": [
        "Apéndice Financiero 4: Material rodante base (1 U18 + 2 GR12 + complementario)",
        "AT2: Requerimientos operación segura y redundancia emergencias",
        "AT10: Personal operativo y requisitos comunicaciones"
      ],
      "ultima_actualizacion": "2025-10-09",
      "actualizado_por": "DT-TETRA-002-2025-10-09"
    },
    "5.3.103": {
      "descripcion": "Interfaces comunicación L2/L3",
      "justificacion_tecnica": "Switches industriales de capa 2/3 para red de comunicaciones del sistema SCADA",
      "criterios_diseno": [
        "Managed switches con VLAN y QoS",
        "Redundancia en anillo (ring topology) IEC 62439-3",
        "Grado industrial: -40°C a +75°C"
      ],
      "supuestos": [
        "1 set de equipos: core switch + distribution switches + access switches",
        "Fibra óptica para backbone, cobre para edge",
        "Certificación IEC 61850-3 para subestaciones"
      ],
      "decisiones_tecnicas": [
        "DT-SCADA-003-2025-10-07"
      ],
      "feedback_especialista": "Costo incluye switches core redundantes con protocolo PRP (Parallel Redundancy Protocol) para tiempo de conmutación <20ms según requerimientos críticos.",
      "documentos_ingenieria": [
        "V.5_SCADA_Detalle_v1.0.md",
        "V.3_Comunicacion_Detalle_v3.0.md"
      ],
      "ultima_actualizacion": "2025-10-08",
      "actualizado_por": "DT-SCADA-003"
    }
  }
};

