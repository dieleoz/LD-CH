# CTC - DOCUMENTO MAESTRO v1.0 (Consolidación)

**Proyecto:** APP La Dorada - Chiriguaná  
**Fecha:** 03/10/2025  
**Estado:** EN PROGRESO (consolidación)  
**Responsable:** Ingeniería de Control / PMO  

## Fuentes a consolidar
- V. Ingenieria de detalle/V.2_Centro_Control_Trafico_CTC_Detalle_v1.0.md
- V. Ingenieria de detalle/V.4_Sistemas/2_Centro_de_Control_de_Tr_fico_CTC_Contrato_8_2.md
- III. Ingenieria conceptual/26. Sistem_CTC_Int – AT1(CCO) + AT2(op) + AT3(esp) + AT4(ind) + AT9(cro).md
- VII. Soporte Especializado/VII.2_Especificaciones/VII.2.8_Arquitectura_Software_CTC.md
- VII. Soporte Especializado/VII.2_Especificaciones/VII.2.4_Interfaces_CTC_ITCS_Protocolo_FFFIS.md

> **📋 DOCUMENTOS FUENTE CONSOLIDADOS:**
> - `V. Ingenieria de detalle/V.2_Centro_Control_Trafico_CTC_Detalle_v1.0.md`
> - `V. Ingenieria de detalle/V.4_Sistemas/2_Centro_de_Control_de_Tr_fico_CTC_Contrato_8_2.md`

---

## 1. Alcance del Sistema
- Definir arquitectura y funcionalidades del CCO/CTC, integración con ITCS, operación y redundancia.  
  (Fuentes: 26. Sistem_CTC_Int; V.2_CTC_Detalle_v1.0.md)

## 2. Trazabilidad Contractual
- ATs: AT1 (CCO), AT2 (operación), AT3 (especificaciones), AT4 (indicadores), AT9 (cronograma).  
  (Fuentes: 26. Sistem_CTC_Int; 8_2_CTC_Contrato)

## 3. Integración de Fuentes (plan)
- Detalle → Integración y constructivo: V.2 y 8_2  
- Conceptual → Alcance e integración: 26. Sistem_CTC_Int  
- Especializado → Arquitectura SW e interfaces FFFIS: VII.2.8 y VII.2.4  

## 4. Estructura Técnica (índice)
1. Requisitos y operaciones CCO  
   - Roles, subsistemas, HMI, flujos operativos. (26_Sistem_CTC; V.2)
2. Arquitectura SW/HW CTC  
   - Capas SW, servidores, redundancia N+1, storage. (VII.2.8; V.2)
3. Integración con ITCS (FFFIS)  
   - Mensajería, estados, alarmas, sincronización. (VII.2.4)
4. Redundancia y disponibilidad  
   - Objetivos AT4, failover, pruebas. (V.2; AT4)
5. Pruebas y puesta en servicio  
   - FAT/SAT, pruebas de integración, aceptación. (V.2)
6. O&M y monitoreo  
   - Procedimientos de operación, mantenimiento y monitoreo continuo. (AT2; V.2)
7. Seguridad y ciberseguridad  
   - Controles de acceso, segmentación, hardening. (VII.2.11 / criterios transversales)
8. RTM y KPIs  
   - Matriz de trazabilidad a ATs y KPIs de disponibilidad. (AT4; 26_Sistem_CTC)
   - KPIs (AT4): Disponibilidad CTC; tiempo de recuperación; alarmas críticas gestionadas.  
   - Evidencias: FAT/SAT, bitácoras CCO, registros de eventos y auditoría.

   RTM (resumen):
   
   | Requisito | Evidencia | Fuente |
   |---|---|---|
   | Operación CCO conforme | Manuales/HMI + pruebas operativas | AT2, 26_Sistem_CTC |
   | Redundancia N+1 activa | Reportes failover y pruebas | V.2, AT4 |
   | Integración FFFIS ITCS | Logs de mensajes/estados/alarmas | VII.2.4 |
   | KPIs disponibilidad | Registros y tablero CCO | AT4 |

### 8.2 Indicadores Clave de Rendimiento (KPIs) - Detallados

| KPI | Objetivo | Actual | Evidencia | Responsable | Estado |
|:---|:---:|:---:|:---|:---|:---:|
| **Disponibilidad CTC** | 99.95% | En diseño | Monitoreo CCO | Ing. Control | ⏳ |
| **Tiempo respuesta comandos** | <200ms | En diseño | Pruebas de latencia | Ing. Control | ⏳ |
| **MTBF servidores** | >8760h | En diseño | Análisis RAMS | Ing. Control | ⏳ |
| **Integración FFFIS** | 100% mensajes | En diseño | Logs de integración | Ing. Control | ⏳ |
| **Redundancia sistema** | 2oo3 | En diseño | Pruebas de redundancia | Ing. Control | ⏳ |

9. Criterios de Aceptación (FAT/SAT)
   - FAT: pruebas funcionales SW/HW, redundancia y alarmas críticas.
   - SAT: pruebas integradas con ITCS (FFFIS) en entorno operativo.
   - Disponibilidad: evidencia objetivos AT4 con medición inicial en producción.

## 5. Pendientes de Integración
- Integrar contenido único por sección con referencia a origen  
- Completar RTM y validar KPIs AT4 y planes de prueba  

## 6. Referencias
- Roadmap: @@Roadmap_v12.0_Marco_Gestion_Consolidado.md
- Auditoría: Reportes/Estados/REPORTE_AUDITORIA_v1.1.md
- Índice Maestro: Indice_Maestro_Consolidado_v1.0.md
