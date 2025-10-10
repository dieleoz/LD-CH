# COMUNICACIONES - DOCUMENTO MAESTRO v1.0 (Consolidación)

**Proyecto:** APP La Dorada - Chiriguaná  
**Fecha:** 03/10/2025  
**Estado:** EN PROGRESO (consolidación)  
**Responsable:** Ingeniería de Telecomunicaciones / PMO  

## Fuentes a consolidar
- V. Ingenieria de detalle/V.3_Sistemas_Comunicacion_Detalle_v1.0.md
- V. Ingenieria de detalle/V.4_Sistemas/4_Comunicaciones_generales_Contrato_8_4.md
- V. Ingenieria de detalle/V.4_Sistemas/10_Red_de_datos_Contrato_8_8_3.md
- V. Ingenieria de detalle/V.4_Sistemas/5_Radio_TETRA_Contrato_8_5.md
- V. Ingenieria de detalle/V.4_Sistemas/12_Comunicaciones_embarcadas_Contrato_8_10.md
- III. Ingenieria conceptual/28_Sistema_FibraOptica_Integrado_docx_AT1_AT3_AT5_interferencias_AT7_predios.md
- III. Ingenieria conceptual/27_Sistema_TETRA_Integrado_docx_AT1_torres_AT2_comunicaci_n_AT3_radio_AT7_predios_torres.md

> **📋 DOCUMENTOS FUENTE CONSOLIDADOS:**
> - `V. Ingenieria de detalle/V.3_Sistemas_Comunicacion_Detalle_v1.0.md`
> - `V. Ingenieria de detalle/V.4_Sistemas/4_Comunicaciones_generales_Contrato_8_4.md`
> - `V. Ingenieria de detalle/V.4_Sistemas/5_Radio_TETRA_Contrato_8_5.md`
> - `V. Ingenieria de detalle/V.4_Sistemas/12_Comunicaciones_embarcadas_Contrato_8_10.md`

---

## 1. Alcance del Sistema
- Red integral de comunicaciones: fibra óptica, radio TETRA, datos, interfonía y embarcados.  
  (Fuente: V.3_Sistemas_Comunicacion_Detalle_v1.0.md)
- Criterios de disponibilidad (AT4) y redundancia en backbone y core de datos.  
  (Fuente: 10_Red_de_datos_Contrato_8_8_3.md)

## 2. Trazabilidad Contractual
- ATs: AT1 (alcance), AT3 (especificaciones), AT4 (indicadores), AT5 (interferencias), AT7 (predios/torres).  
  (Fuentes: 4_Comunicaciones_generales_Contrato_8_4.md; 5_Radio_TETRA_Contrato_8_5.md; 28_Fibra_Integrado)

## 3. Integración de Fuentes (plan)
- Detalle → Especificaciones constructivas: V.3 y V.4_Sistemas (4,5,10,12)  
- Conceptual → Alcance y RTM: 27_TETRA, 28_Fibra  

## 4. Estructura Técnica (índice)
1. Requisitos y disponibilidad (AT4)  
   - Objetivos 99.95%, RPO/RTO, KPIs de red. (V.4_Sistemas/10_Red_de_datos)
2. Arquitectura de red y topologías  
   - Anillos DWDM, core redundante, ODF/patching. (28_Fibra_Integrado)
3. Fibra óptica (backbone, ODF, DWDM)  
   - Trazado, pérdidas presupuestadas, equipos ópticos. (V.3; 28_Fibra)
4. Radio TETRA (cobertura, frecuencias, torres)  
   - Plan de frecuencias, torres y licencias ANE. (5_Radio_TETRA_Contrato_8_5; 27_TETRA)
5. Red de datos (LAN/WAN, QoS, redundancia)  
   - Segmentación, QoS por servicio, enlaces de respaldo. (10_Red_de_datos)
6. Comunicaciones embarcadas  
   - Subsistemas embarcados y su integración con red tierra. (12_Comunicaciones_embarcadas)
7. Pruebas y validación  
   - Pruebas de fibra (OTDR/OLTS), cobertura TETRA, throughput y resiliencia. (V.3; V.4_Sistemas)
8. O&M y monitoreo  
   - NOC, telemetría, syslog/SNMP, procedimientos de mantenimiento. (V.3)

9. RTM y KPIs  
   - RTM: Requisito→Evidencia→AT/Doc fuente (AT1/3/4/5/7; V.3; V.4_Sistemas; 27_TETRA; 28_Fibra).  
   - KPIs (AT4): Disponibilidad 99.95%; latencia/red; tasa caída enlaces; cobertura TETRA.  
   - Verificación: pruebas OTDR/OLTS, throughput, drive test TETRA, logs NOC.

   RTM (resumen):
   
   | Requisito | Evidencia | Fuente |
   |---|---|---|
   | Backbone DWDM redundante | Plano + pruebas OLTS/OTDR | 28_Fibra, V.3 |
   | Cobertura TETRA requerida | Drive test y reporte cobertura | 5_Radio_TETRA, 27_TETRA |
   | Red de datos con QoS | Config y prueba throughput/latencia | 10_Red_de_datos |
   | Disponibilidad ≥ 99.95% | KPIs NOC trimestrales | AT4 |

### 9.2 Indicadores Clave de Rendimiento (KPIs) - Detallados

| KPI | Objetivo | Actual | Evidencia | Responsable | Estado |
|:---|:---:|:---:|:---|:---|:---:|
| **Disponibilidad backbone fibra** | 99.95% | En diseño | Monitoreo NOC | Ing. Telecomunicaciones | ⏳ |
| **Cobertura TETRA** | 95% territorio | En diseño | Drive test | Ing. Telecomunicaciones | ⏳ |
| **Latencia red datos** | <50ms | En diseño | Pruebas throughput | Ing. Telecomunicaciones | ⏳ |
| **MTBF equipos TETRA** | >8760h | En diseño | Análisis RAMS | Ing. Telecomunicaciones | ⏳ |
| **Throughput GSM-R** | >2Mbps | En diseño | Pruebas de campo | Ing. Telecomunicaciones | ⏳ |

10. Criterios de Aceptación (FAT/SAT)
   - FAT: pruebas de laboratorio de enlaces ópticos y performance de red.
   - SAT: pruebas de campo OTDR/OLTS, throughput, drive test TETRA.
   - Disponibilidad: evidencia de monitoreo y alertas (NOC) acorde AT4.

## 5. Pendientes de Integración
- Volcar contenido único por sección con trazabilidad a fuentes  
- Completar RTM y validar KPIs de disponibilidad (AT4) y pruebas V&V  

## 6. Referencias
- Roadmap: @@Roadmap_v12.0_Marco_Gestion_Consolidado.md
- Auditoría: Reportes/Estados/REPORTE_AUDITORIA_v1.1.md
- Índice Maestro: Indice_Maestro_Consolidado_v1.0.md
