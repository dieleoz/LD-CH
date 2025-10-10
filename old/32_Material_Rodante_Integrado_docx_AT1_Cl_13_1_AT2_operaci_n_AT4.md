﻿# MATERIAL RODANTE INTEGRADO v4.0 - EQUIPOS EMBARCADOS Y PUESTA A PUNTO
## APP La Dorada - Chiriguaná

---

## 1. MARCO CONTRACTUAL

### 1.1 Base Legal
El diseño conceptual del Material Rodante y sus sistemas embarcados integra requisitos de:
- **Cláusula 13.1 (Material Rodante):** Exige que el material rodante cuente con el equipamiento técnico embarcado (ITCS, TETRA, GPS) necesario para la interoperabilidad.
- **AT1 (Alcance):** Define el tipo de material rodante (locomotoras U18 o equivalentes), la maquinaria de mantenimiento y el Factor de Calidad asociado (Cap. V).
- **AT2 (Operación y Mantenimiento):** Establece los requisitos de seguridad, el Reglamento de Operación (ROT) y los planes de mantenimiento en talleres (Cap. III, VI).
- **AT4 (Indicadores):** Define los indicadores de disponibilidad para el material rodante y los equipos embarcados.

---

### 1.2 ⚠️ EVALUACIÓN DE DEPENDENCIAS DOCUMENTALES
Este documento es crítico para la operación del corredor, ya que define las características y capacidades de los trenes que circularán.

- **Depende de:**
    - `Cl. 13.1`, `AT1`, `AT2`, `AT4`: Fuentes primarias de requisitos.
    - `27_Sistema_TETRA_Integrado...md`: Define la red de radio con la que los equipos embarcados deben ser compatibles.
- **Gobierna a:**
    - `V. Ingenieria de detalle/12_Comunicaciones_embarcadas_Contrato_8_10.md`: El diseño de detalle se basa en los conceptos aquí definidos.
    - `20. AT10_CapacidadSurcos...md`: Las características de rendimiento del material rodante son una entrada clave para la simulación de capacidad.

---

## 2. INTEGRACIÓN CON DOCUMENTOS RELACIONADOS

### 2.1 Documentos Base (Completados ✅)
Este análisis se fundamenta en la estructura de trabajo ya aprobada.

| Documento | Aporte Clave |
|---|---|
| `22` a `25_...md` | Establecen la metodología, listado de sistemas, trazabilidad y WBS. |
| `27_Sistema_TETRA_Integrado...md` | Define la arquitectura de la red de radio TETRA. |

---

### 2.2 Documentos Dependientes (Bloqueados 🔴)
El diseño detallado de los sistemas embarcados no puede finalizarse hasta que este concepto de integración sea validado.

| Documento | Dependencia |
|---|---|
| `V. Ingenieria de detalle/12_...md` | Requiere la arquitectura modular y las especificaciones de los equipos embarcados. |
| `20. AT10_CapacidadSurcos...md` | Necesita las curvas de rendimiento del material rodante para la simulación. |

### 2.3 Interfaces Críticas
- **Material Rodante ↔ ITCS:** Interfaz para el control positivo de trenes usando ETCS Level 2 hasta AT3. **(Riesgo principal por bloqueo de AT3)**.
- **Material Rodante ↔ TETRA:** Interfaz para comunicaciones de voz y datos de misión crítica.
- **Material Rodante ↔ Mantenimiento (AT2):** El diseño debe facilitar el mantenimiento en los talleres definidos en AT1.
- **Material Rodante ↔ FENOCO:** Interoperabilidad con sistemas FENOCO según protocolos UIC.

---

## 3. OPTIMIZACIONES EPC ESPECÍFICAS

### 3.1 Arquitectura Modular de Sistemas Embarcados
Para mitigar el riesgo del bloqueo de las especificaciones ITCS (dependientes de AT3), se propone una arquitectura modular para los sistemas embarcados:
- **Módulo Base (Instalación Inmediata):**
    - **Radio TETRA:** Para comunicaciones de voz y datos básicos.
    - **GPS/GNSS:** Para localización y seguimiento en el CTC.
    - **Event Recorder (Caja Negra):** Para registro de datos de operación.
    - **Cableado y Antenas:** Se instalará todo el cableado y las antenas necesarias, incluyendo las previstas para el ITCS, dejando los conectores listos ("stub-out").
- **Módulo ITCS (Instalación Futura):**
    - **Unidad de Control a Bordo (OBC):** Se conectará al cableado preinstalado una vez que las especificaciones estén disponibles, usando ETCS Level 2 como estándar hasta AT3.
    - **Interfaz de Maquinista (DMI):** Se instalará en la cabina.
    - **Disponibilidad 99.95% según AT4:** Redundancia crítica para sistemas embarcados.

Esta estrategia permite avanzar en el 85% de la instalación de los sistemas embarcados sin depender de AT3.

### 3.2 Estrategia de "Puesta a Punto" por Fases
La "Puesta a Punto" del material rodante existente (AT1, Cap. V) se abordará como un proyecto de ingeniería con fases claras:
- **Fase 1 - Diagnóstico (Mes 1-2):** Desmontaje completo, inspección y diagnóstico de cada componente (motor, chasis, bogies, etc.).
- **Fase 2 - Reparación/Reacondicionamiento (Mes 3-9):** Reparación o reemplazo de piezas según diagnóstico.
- **Fase 3 - Integración de Sistemas (Mes 10-11):** Instalación del "Módulo Base" de comunicaciones y preparación para el "Módulo ITCS".
- **Fase 4 - Pruebas y Certificación (Mes 12):** Pruebas estáticas y dinámicas, y certificación de cumplimiento de normas AAR y FRA.

---

## 4. MATRIZ DE CONTROL Y SEGUIMIENTO (REQUISITOS DE MATERIAL RODANTE)

### 4.1 Requisitos Consolidados del Material Rodante
La siguiente matriz integra los requisitos de los diferentes apéndices en funcionalidades concretas del sistema.

| Requisito Contractual | Fuente | Funcionalidad Asociada | Estado AT3/AT4 |
|---|---|---|:---:|
| **Locomotoras U18 o Equivalentes** | AT1, Cap. 5.1 | Puesta a Punto de locomotoras existentes, incluyendo motor, chasis y sistemas de frenado AAR. | ✅ Definido |
| **Equipamiento Técnico Embarcado** | Cl. 13.1 | Instalación del "Módulo Base" (TETRA, GPS, Event Recorder) y preparación para el "Módulo ITCS".<br>- **ITCS ETCS Level 2 hasta AT3**<br>- **Disponibilidad 99.95% según AT4** | ⚠️ Condicionado |
| **Interoperabilidad con FENOCO** | Cl. 13.2 | El diseño modular del ITCS debe garantizar la compatibilidad futura con la red de FENOCO.<br>- **Protocolos UIC para interoperabilidad** | 🔴 Bloqueado |
| **Seguridad en Operación** | AT2, Cap. 3.1.2 | Integración de sistemas de seguridad, como el "hombre muerto" y alarmas de cabina. | ✅ Definido |
| **Disponibilidad del Material Rodante** | AT4, Cap. 3-6 | El plan de mantenimiento (AT2) debe estar diseñado para cumplir con los KPIs de disponibilidad de AT4. | 🔴 Bloqueado |
| **Factor de Calidad (si aplica)** | AT1, Cap. 5.3 | Plan de Puesta a Punto de locomotora U18 adicional o suministro de una nueva, incluyendo ITCS. | ⚠️ Condicionado |

### 4.2 Indicadores de Riesgo por Bloqueo AT3/AT4
- **🟢 Verde (Proceder):** Puesta a Punto mecánica de locomotoras, instalación del "Módulo Base" de comunicaciones.
- **🟡 Amarillo (Diseño Modular):** Diseño de la interfaz eléctrica y de datos para el futuro "Módulo ITCS".
- **🔴 Rojo (Bloqueado):** Adquisición e instalación de la unidad de control ITCS. Desarrollo de los dashboards de KPIs de disponibilidad.

---

## 5. CONCLUSIONES Y PRÓXIMOS PASOS

### 5.1 Estado del Documento v4.0
Este documento ha sido actualizado a la versión 4.0, estableciendo un **plan conceptual integrado para el Material Rodante**. Define una arquitectura modular para los sistemas embarcados que mitiga el riesgo del bloqueo ITCS y estructura el proceso de "Puesta a Punto" en fases de ingeniería gestionables.

### 5.2 Acciones Requeridas para Mantener v4.0
- **Iniciar la Fase 1 (Diagnóstico):** El equipo de ingeniería debe comenzar el desmontaje y diagnóstico de la primera locomotora para validar el plan de Puesta a Punto.
- **Validar la Arquitectura Modular:** Las especificaciones del "Módulo Base" y las interfaces para el "Módulo ITCS" deben ser validadas con proveedores de tecnología.

### 5.3 Criterios para Avance
La aprobación de este documento conceptual permite:
- **Desbloquear el Bloque de Trabajo 5.0 (Criterios de Diseño):** Al tener claros los requisitos de normatividad (AAR, FRA) y redundancia para el material rodante.
- **Iniciar el Diseño Básico del Material Rodante:** Incluyendo los planos de instalación de los sistemas embarcados.
- **Avanzar en el Plan de Obras (AT9):** Detallar el cronograma de la Puesta a Punto del material rodante.

---

**Estado del documento:** ✅ Completado - 27 de enero de 2025
**Versión:** 4.1
**Responsable:** Administrador Contractual EPC
**Próxima actualización:** 27 de febrero de 2025

---

## 🔄 **ACTUALIZACIÓN v4.1 - REVISIÓN METODOLOGÍA PUNTO 42**

### ✅ **MEJORAS IMPLEMENTADAS:**

1. **🚂 ITCS ETCS Level 2:** Estrategia de avance especificada hasta AT3 para sistemas embarcados
2. **🔗 Interoperabilidad FENOCO:** Protocolos UIC especificados para compatibilidad con FENOCO
3. **📊 Criterios de Disponibilidad AT4:** 99.95% especificado para sistemas embarcados
4. **🎯 Matriz de Requisitos:** Actualizada con criterios ITCS, FENOCO y AT4

### 🎯 **VACÍOS IDENTIFICADOS Y CORREGIDOS:**
- ✅ **ITCS:** ETCS Level 2 especificado como estándar hasta AT3
- ✅ **FENOCO:** Protocolos UIC para interoperabilidad con FENOCO
- ✅ **AT4:** Criterios de disponibilidad 99.95% para sistemas embarcados
- ✅ **Interfaces:** Especificación de interfaces ITCS y FENOCO

### ⚠️ **RIESGOS IDENTIFICADOS PARA ANÁLISIS PMI:**

| **ID** | **Riesgo** | **Categoría** | **Probabilidad** | **Impacto** | **Descripción** |
|:---:|:---|:---:|:---:|:---|:---|
| **R-060** | **Dependencia AT3 para ITCS** | **Técnico** | **Alta** | **Alto** | Especificaciones ITCS embarcado pendientes de AT3 |
| **R-061** | **Interoperabilidad FENOCO** | **Técnico** | **Media** | **Alto** | Compatibilidad con sistemas FENOCO requiere protocolos UIC |
| **R-062** | **Disponibilidad 99.95%** | **Contractual** | **Media** | **Alto** | Cumplimiento AT4 requiere redundancia crítica en sistemas embarcados |
| **R-063** | **Puesta a punto locomotora** | **Gestión** | **Media** | **Medio** | Complejidad de diagnóstico y reacondicionamiento de U18 |
| **R-064** | **Integración módulos embarcados** | **Técnico** | **Media** | **Alto** | Complejidad de integración entre módulo base e ITCS |

### 📋 **RECOMENDACIONES PARA GESTIÓN DE RIESGOS:**
- **Análisis PMI requerido** para definir estrategias de mitigación
- **Plan de contingencia** para dependencias AT3 en ITCS
- **Protocolos de interoperabilidad** con FENOCO según UIC
- **Matriz de disponibilidad** para cumplimiento AT4
- **Gestión de puesta a punto** crítica para locomotoras U18
