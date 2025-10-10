# ANÁLISIS CONTRACTUAL A.2: OPERACIÓN, MANTENIMIENTO E INDICADORES
## APP La Dorada - Chiriguaná

**Fecha de creación:** 02 de octubre de 2025  
**Fecha de actualización:** 02 de octubre de 2025
**Proyecto:** APP La Dorada - Chiriguaná  
**Contrato:** Concesión No. 001 de 2025  
**Documento:** A.2 - Análisis Contractual  

---
## INFORMACIÓN DEL DOCUMENTO

| Campo | Valor |
| **Fecha de creación** | 02 de octubre de 2025 |
| **Proyecto** | APP La Dorada - Chiriguaná |
| **Contrato** | Concesión No. 001 de 2025 |
| **Versión** | v1.0 |
| **Responsable** | Administrador Contractual EPC |
| **Tipo** | Análisis Contractual |
| **Categoría** | Fase A - Análisis Contractual |

---

## 1. PROPÓSITO

Este documento traduce las obligaciones del **Apéndice Técnico 2 (Operación y Mantenimiento)** y el **Apéndice Técnico 4 (Indicadores de Desempeño)** en requisitos de ingeniería. Su objetivo es asegurar que los sistemas se diseñen para ser operables, mantenibles y capaces de cumplir con los KPIs contractuales.

---

## 2. OBLIGACIONES CLAVE EXTRAÍDAS

### 2.1 Del Apéndice Técnico 2 - Operación y Mantenimiento

| Obligación | Requisito para Ingeniería | Documento Relacionado |
|:---|:---|:---|
| **Continuidad del Servicio 24/7** | Diseñar sistemas con alta disponibilidad y redundancia (N+1). | `35_Criterios_Redundancia...md` |
| **Reglamento de Operación (ROT)** | El diseño del CTC y la Señalización debe soportar el ROT. | `26. Sistem_CTC_Int...md` |
| **Seguridad en Vía** | El diseño de CCTV y Control de Accesos debe cubrir puntos críticos. | `31_Sistema_CCTV_Integrado...md` |
| **Mantenimiento Integral** | Diseñar sistemas con capacidad de diagnóstico remoto y fácil mantenimiento. | `VI. Operacion y Mantenimiento/` |

### 2.2 Del Apéndice Técnico 4 - Indicadores de Desempeño

| Indicador | KPI Contractual | Requisito para Ingeniería | Documento Relacionado |
|:---|:---|:---|:---|
| **Disponibilidad de Sistemas Críticos** | ≥ 99.95% (CTC, Señalización) | Diseño de redundancia N+1, UPS con 4h de autonomía. | `25.1_Matriz_Alcance_Electrico.md` |
| **Disponibilidad Sistemas No Críticos** | ≥ 99.5% (TETRA, CCTV, ITS) | Diseño de redundancia N+0/N+1, UPS con 2h de autonomía. | `25.1_Matriz_Alcance_Electrico.md` |
| **Disponibilidad SICC** | ≥ 99.5% | El Sistema Informático de Contabilización y Control debe ser redundante. | `35_Criterios_Redundancia...md` |
| **Calidad de Servicio** | Tiempos de respuesta, cobertura. | El diseño de la red TETRA y Fibra Óptica debe garantizar la cobertura y latencia requeridas. | `27_Sistema_TETRA_Integrado...md` |

---

## 3. RIESGOS Y SUPUESTOS IDENTIFICADOS (PMI)

| ID | Riesgo/Supuesto | Impacto | Estrategia de Mitigación |
|:---|:---|:---|:---|
| **R-CON-001** | Ambigüedad en la medición de la disponibilidad del 100% para Pasos a Nivel. | **Alto.** Riesgo de penalidades por un KPI inalcanzable. | Presentar consulta a la Interventoría para definir criterios de medición y eximentes. |
| **R-OPE-001** | Falla en la gestión de la conmutación (failover) de sistemas redundantes. | **Alto.** La redundancia existe pero no se activa, incumpliendo el KPI de disponibilidad. | Incluir pruebas de conmutación obligatorias en el Plan de Pruebas (FAT/SAT/SIT). |

---

## 4. CONCLUSIONES

El diseño de la ingeniería debe estar intrínsecamente ligado a los KPIs de operación y mantenimiento.
1.  **Diseño Orientado a la Disponibilidad:** La redundancia no es una opción, es una obligación contractual derivada del AT4.
2.  **Medición desde el Diseño:** Todos los sistemas deben incluir los hooks y telemetría necesarios para reportar su estado al SICC.
3.  **Clarificar KPIs Ambiguos:** Es prioritario resolver las zonas grises en la medición de indicadores (ej. Pasos a Nivel) para evitar riesgos contractuales.

---

----
----
----
----
----
----
----
> Esta información es únicamente de carácter informativo. Se recomienda su revisión y validación por el equipo jurídico del proyecto antes de ser utilizada formalmente.
