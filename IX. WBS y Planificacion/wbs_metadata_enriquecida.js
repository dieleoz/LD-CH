window.wbsMetadataEnriquecida = {
  "version": "1.0",
  "fecha_creacion": "2025-10-08",
  "descripcion": "Metadata enriquecida de la WBS con criterios tÃ©cnicos, justificaciones y trazabilidad completa",
  "items": {
    "1.1.100": {
      "descripcion": "Servidores CTC principales",
      "justificacion_tecnica": "Servidores redundantes para control centralizado del Tráfico ferroviario segÃºn AT2 Â§5.3",
      "criterios_diseno": [
        "Redundancia N+1 para alta disponibilidad",
        "Capacidad procesamiento: 100 trenes simultÃ¡neos",
        "Tiempo respuesta < 100ms segÃºn IEC 62290-1"
      ],
      "supuestos": [
        "2 servidores (1 principal + 1 respaldo)",
        "Arquitectura cliente-servidor",
        "ComunicaciÃ³n redundante fibra óptica"
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
    "5.3.100": {
      "descripcion": "Servidores SCADA",
      "justificacion_tecnica": "Servidores duales para sistema SCADA de supervisiÃ³n de infraestructura ferroviaria",
      "criterios_diseno": [
        "Arquitectura maestro-esclavo",
        "Monitoreo tiempo real de seÃ±ales, cambios vÃ­a, detectores",
        "IntegraciÃ³n con CTC para vista unificada"
      ],
      "supuestos": [
        "2 servidores (1 maestro + 1 esclavo)",
        "Capacidad: 500 puntos I/O",
        "Protocolo IEC 61850 para interoperabilidad"
      ],
      "decisiones_tecnicas": [
        "DT-SCADA-001-2025-10-07"
      ],
      "feedback_especialista": "Costo ajustado a $400M c/u para incluir licencias SCADA corporativas y mÃ³dulos de ciberseguridad industrial.",
      "documentos_ingenieria": [
        "V.5_SCADA_Detalle_v1.0.md"
      ],
      "ultima_actualizacion": "2025-10-08",
      "actualizado_por": "DT-SCADA-001"
    },
    "5.3.101": {
      "descripcion": "Software SCADA",
      "justificacion_tecnica": "Plataforma SCADA industrial de alta confiabilidad para supervisiÃ³n y control",
      "criterios_diseno": [
        "Compatibilidad con mÃºltiples protocolos: Modbus, DNP3, IEC 61850",
        "HMI grÃ¡fico con sinópticos dinÃ¡micos",
        "MÃ³dulo de alarmas inteligentes y trending"
      ],
      "supuestos": [
        "1 licencia corporativa ilimitada",
        "Incluye: desarrollo, runtime, historian, reporting",
        "Soporte tÃ©cnico 24/7 por 5 aÃ±os"
      ],
      "decisiones_tecnicas": [
        "DT-SCADA-002-2025-10-07"
      ],
      "feedback_especialista": "Incremento justificado por requerimientos de ciberseguridad IEC 62443 y necesidad de mÃ³dulo de gestiÃ³n de energÃ­a para anÃ¡lisis de consumos.",
      "documentos_ingenieria": [
        "V.5_SCADA_Detalle_v1.0.md"
      ],
      "ultima_actualizacion": "2025-10-08",
      "actualizado_por": "DT-SCADA-002"
    },
    "5.3.103": {
      "descripcion": "Interfaces comunicaciÃ³n L2/L3",
      "justificacion_tecnica": "Switches industriales de capa 2/3 para red de comunicaciones del sistema SCADA",
      "criterios_diseno": [
        "Managed switches con VLAN y QoS",
        "Redundancia en anillo (ring topology) IEC 62439-3",
        "Grado industrial: -40Â°C a +75Â°C"
      ],
      "supuestos": [
        "1 set de equipos: core switch + distribution switches + access switches",
        "Fibra óptica para backbone, cobre para edge",
        "certificación IEC 61850-3 para subestaciones"
      ],
      "decisiones_tecnicas": [
        "DT-SCADA-003-2025-10-07"
      ],
      "feedback_especialista": "Costo incluye switches core redundantes con protocolo PRP (Parallel Redundancy Protocol) para tiempo de conmutaciÃ³n <20ms segÃºn requerimientos crÃ­ticos.",
      "documentos_ingenieria": [
        "V.5_SCADA_Detalle_v1.0.md",
        "V.3_Comunicacion_Detalle_v3.0.md"
      ],
      "ultima_actualizacion": "2025-10-08",
      "actualizado_por": "DT-SCADA-003"
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
    }
  },
  "1.1.101": {
    "descripcion": "Servidores CTC respaldo",
    "justificacion_tecnica": "Servidor redundante hot-standby para continuidad operacional segÃºn AT2 Â§5.3 - Disponibilidad 99.95%",
    "criterios_diseno": [
      "ConfiguraciÃ³n activo-pasivo (hot-standby)",
      "SincronizaciÃ³n en tiempo real < 1 segundo",
      "ConmutaciÃ³n automÃ¡tica en caso de falla < 5 segundos"
    ],
    "supuestos": [
      "2 servidores en configuraciÃ³n N+1",
      "Enlace dedicado fibra óptica para sincronizaciÃ³n",
      "UPS dimensionado para 4 horas autonomÃ­a"
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
  "1.3.100": {
    "descripcion": "Cable de cobre Cat 6A",
    "justificacion_tecnica": "Cableado estructurado para red LAN del CTC - 200m por estaciÃ³n Ã— 5 estaciones ENCE",
    "criterios_diseno": [
      "CategorÃ­a 6A para 10 Gbps",
      "Blindaje STP para ambientes industriales",
      "certificación permanente segÃºn TIA-568.2-D"
    ],
    "supuestos": [
      "1,000 metros total (5 estaciones Ã— 200m c/u)",
      "Incluye conectores, patch panels, organizadores",
      "Infraestructura de canalizaciÃ³n existente"
    ],
    "decisiones_tecnicas": [],
    "feedback_especialista": "",
    "documentos_ingenieria": [
      "V.3_Comunicacion_Detalle_v3.0.md"
    ],
    "ultima_actualizacion": "2025-10-08",
    "actualizado_por": "Sistema WBS"
  },
  "2.1.100": {
    "descripcion": "Torres autosoportadas",
    "justificacion_tecnica": "37 torres para red TETRA segÃºn cobertura RF en corredor de 526 km - SeparaciÃ³n promedio 14.2 km",
    "criterios_diseno": [
      "Altura: 30-45 metros segÃºn topografÃ­a",
      "DiseÃ±o estructural para vientos 120 km/h",
      "Puesta a tierra < 10 ohms segÃºn IEC 62305"
    ],
    "supuestos": [
      "37 estaciones base TETRA segÃºn estudio RF",
      "Espaciamiento variable segÃºn orografÃ­a",
      "Incluye sistema de iluminaciÃ³n aeronÃ¡utica"
    ],
    "decisiones_tecnicas": [
      "DT-TETRA-001-2025-10-07"
    ],
    "feedback_especialista": "ReducciÃ³n alineada con ATP: de 15 a 8 locomotoras reduce requerimientos de cobertura crÃ­tica.",
    "documentos_ingenieria": [
      "V.3_Comunicacion_Detalle_v3.0.md",
      "IV.3_Comunicacion_Basica_v2.0.md"
    ],
    "ultima_actualizacion": "2025-10-07",
    "actualizado_por": "DT-TETRA-001"
  },
  "2.1.101": {
    "descripcion": "Estaciones base TETRA",
    "justificacion_tecnica": "Red TETRA digital para comunicaciones voz/datos tren-tierra segÃºn AT5 - 37 sitios en corredor",
    "criterios_diseno": [
      "Cumplimiento ETSI EN 300 392-2",
      "Potencia transmisiÃ³n 25W por portadora",
      "4 portadoras por estaciÃ³n para redundancia"
    ],
    "supuestos": [
      "37 estaciones base (1 por torre)",
      "ConfiguraciÃ³n DMO + TMO",
      "Frecuencias autorizadas por MinTIC"
    ],
    "decisiones_tecnicas": [
      "DT-TETRA-001-2025-10-07"
    ],
    "feedback_especialista": "37 sitios garantizan cobertura 95% del corredor. Zonas sin cobertura permitidas en tramos rurales segÃºn AT5 Â§4.2.",
    "documentos_ingenieria": [
      "V.3_Comunicacion_Detalle_v3.0.md"
    ],
    "ultima_actualizacion": "2025-10-07",
    "actualizado_por": "DT-TETRA-001"
  },
  "3.1.100": {
    "descripcion": "Cable FO LPOC03120484ZC",
    "justificacion_tecnica": "594 km de fibra óptica (526 km corredor + 10% reserva + 3% contingencia) segÃºn cÃ¡lculo tÃ©cnico validado",
    "criterios_diseno": [
      "120 hilos para redundancia y crecimiento futuro",
      "Tipo LPOC (Low Profile Optical Cable) para instalaciÃ³n aÃ©rea",
      "Cumplimiento ITU-T G.652.D"
    ],
    "supuestos": [
      "InstalaciÃ³n en postes cada 50m promedio",
      "10% adicional para reservas en empalmes",
      "3% contingencia para reparaciones"
    ],
    "decisiones_tecnicas": [],
    "feedback_especialista": "120 hilos permiten segregaciÃ³n por sistemas: 40 CTC, 40 TETRA, 20 CCTV, 20 reserva.",
    "documentos_ingenieria": [
      "V.3_Comunicacion_Detalle_v3.0.md"
    ],
    "ultima_actualizacion": "2025-10-08",
    "actualizado_por": "Sistema WBS"
  },
  "3.1.103": {
    "descripcion": "Cajas de empalme 80x80",
    "justificacion_tecnica": "Cajas de empalme cada 300m para gestiÃ³n de fusiones y derivaciones - Total 2,068 cajas en 594 km",
    "criterios_diseno": [
      "UbicaciÃ³n: Costado derecho de vÃ­a",
      "Espaciamiento: 300 metros (criterio optimizado)",
      "Capacidad: 24 fusiones por caja"
    ],
    "supuestos": [
      "594 km Ã· 0.3 km = 1,980 cajas + 4 cajas por puente",
      "4 puentes Ã— 4 cajas = 16 cajas adicionales",
      "88 cajas para reserva y empalmes crÃ­ticos"
    ],
    "decisiones_tecnicas": [],
    "feedback_especialista": "Espaciamiento 300m validado contra alternativas: 350m ahorrarÃ­a $500M pero riesgo mantenimiento; 400m ahorrarÃ­a $787M pero inviable operativamente.",
    "documentos_ingenieria": [
      "V.3_Comunicacion_Detalle_v3.0.md"
    ],
    "ultima_actualizacion": "2025-10-08",
    "actualizado_por": "Sistema WBS"
  },
  "4.1.100": {
    "descripcion": "Barreras automÃ¡ticas",
    "justificacion_tecnica": "146 pasos a nivel identificados: 9 Tipo C (automatizados) + 15 Tipo B (semi-auto) + 122 otros",
    "criterios_diseno": [
      "Tipo C: 4 barreras por PAN (entrada/salida ambos lados)",
      "Actuadores electromecÃ¡nicos 24V",
      "Tiempo cierre < 15 segundos segÃºn norma"
    ],
    "supuestos": [
      "146 pasos a nivel totales en corredor",
      "Solo Tipo C con barreras automÃ¡ticas",
      "Resto con SeñalizaciÃ³n pasiva"
    ],
    "decisiones_tecnicas": [],
    "feedback_especialista": "ClasificaciÃ³n segÃºn Tráfico vehicular: Tipo C >500 veh/dÃ­a, Tipo B 100-500 veh/dÃ­a, resto <100 veh/dÃ­a.",
    "documentos_ingenieria": [
      "V.5_Seguridad_Detalle_v1.0.md"
    ],
    "ultima_actualizacion": "2025-10-08",
    "actualizado_por": "Sistema WBS"
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
}



;
