window.wbsMetadataEnriquecida = {
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
      "decisiones_tecnicas": [],
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
    "decisiones_tecnicas": [],
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
