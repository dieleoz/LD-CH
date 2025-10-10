﻿# SISTEMA DE SEÑALIZACIÓN INTEGRADO v4.0 - CONTROL Y SEGURIDAD
## APP La Dorada - Chiriguaná

---

## 1. MARCO CONTRACTUAL

### 1.1 Base Legal
El Sistema de Señalización es un componente de seguridad vital, cuyas especificaciones se derivan de múltiples fuentes contractuales:
- **AT1 (Alcance):** Define el alcance físico, incluyendo **5 enclavamientos electrónicos** y **146 pasos a nivel** con su tipología (Tabla 17, Cap. 4.5).
- **AT2 (Operación):** Establece los requisitos de seguridad en la operación y el mantenimiento de los sistemas de señalización (Cap. 3.1.2, 6.4).
- **AT3 (Especificaciones):** Detalla las normas técnicas ADIF (ET, NAS, NRS) para enclavamientos, señales, detectores y pasos a nivel (Cap. 8.1, 8.3).
- **AT4 (Indicadores):** Exige una disponibilidad del 100% para los Pasos a Nivel tipo B y C (PNBC) y define indicadores de seguridad operativa.
- **AT8 (Gestión Social):** Requiere programas de cultura vial y capacitación en seguridad ferroviaria, directamente ligados a la señalización en pasos a nivel.
- **Cláusula 8.2 (Construcción):** Obliga a la instalación y puesta en marcha de todos los sistemas de señalización.

### 1.2 ⚠️ EVALUACIÓN DE DEPENDENCIAS DOCUMENTALES
Este documento es la base para el diseño de la seguridad en la vía. Su correcta definición es crítica para la protección de la operación y de las comunidades.

- **Depende de:**
    - `AT1`, `AT2`, `AT3`, `AT4`, `AT8`: Fuentes primarias de requisitos.
    - `26. Sistem_CTC_Int...md`: Define las interfaces de control que la señalización debe obedecer. **(Recién completado, desbloquea este documento)**.
- **Gobierna a:**
    - `V. Ingenieria de detalle/1_Se_alizaci_n_ferroviaria_Contrato_8_1.md`: El diseño de detalle de enclavamientos y señales se basa en los conceptos aquí definidos.
    - `V. Ingenieria de detalle/3_Pasos_a_nivel_Contrato_8_3.md`: El diseño de los 146 pasos a nivel se rige por las especificaciones de esta sección.
    - `34_Criterios_Interoperabilidad...md`: La señalización debe ser compatible con los estándares de FENOCO.

---

## 2. INTEGRACIÓN CON DOCUMENTOS RELACIONADOS

### 2.1 Documentos Base (Completados ✅)
Este análisis se fundamenta en la estructura de trabajo ya aprobada y en el documento CTC recién finalizado.

| Documento | Aporte Clave |
|---|---|
| `22` a `25_...md` | Establecen la metodología, listado de sistemas, trazabilidad y WBS. |
| `26. Sistem_CTC_Int...md` | Define la arquitectura de control y las interfaces que los enclavamientos deben proveer al CTC. |

### 2.2 Documentos Dependientes (Bloqueados 🔴)
El diseño detallado de la señalización no puede avanzar hasta que este concepto de integración sea validado.

| Documento | Dependencia |
|---|---|
| `V. Ingenieria de detalle/1_...md` | Requiere la filosofía de señalización y las especificaciones de los enclavamientos. |
| `V. Ingenieria de detalle/3_...md` | Necesita la clasificación y especificaciones técnicas de los 146 pasos a nivel. |

### 2.3 Interfaces Críticas
- **Señalización ↔ CTC:** La señalización es el "brazo ejecutor" del CTC. Recibe comandos y devuelve el estado de la vía.
- **Señalización ↔ Pasos a Nivel:** Los sistemas de protección de los pasos a nivel (barreras, luces) son parte integral del sistema de señalización y deben estar enclavados.
- **Señalización ↔ Gestión Social (AT8):** El diseño de la señalización en pasos a nivel debe considerar las campañas de cultura vial y la seguridad de las comunidades.
- **Señalización ↔ Energía:** Requiere alimentación eléctrica redundante y respaldada por UPS para garantizar la operación continua y segura.
- **Señalización ↔ ITCS:** Preparación de interfaces para integración con sistemas de control embarcados usando ETCS Level 2 hasta AT3.
- **Señalización ↔ FENOCO:** Compatibilidad con estándares de señalización FENOCO según protocolos UIC.

---

## 3. OPTIMIZACIONES EPC ESPECÍFICAS

### 3.1 Filosofía de Señalización para Proyectos EPC
Se propone una filosofía de señalización que optimiza la seguridad y la eficiencia de la construcción:
- **Sistema de Bloqueo Automático con Contadores de Ejes:** En lugar de circuitos de vía tradicionales (sensibles a la humedad y condiciones del balasto), se utilizarán contadores de ejes (norma ADIF ED3M1) para la detección de trenes. Esto simplifica la instalación, reduce el mantenimiento y aumenta la fiabilidad, especialmente en el clima del corredor.
- **Enclavamientos Electrónicos (CBI) Modulares:** Los 5 enclavamientos (Zapatosa, García Cadena, Barrancabermeja, Puerto Berrío-Grecia, La Dorada-México) se diseñarán con una arquitectura modular. Esto permite desarrollar y probar la lógica de control de forma independiente a las especificaciones finales de ITCS (bloqueadas por AT3), preparando interfaces para ETCS Level 2.
- **Señalización LED de Alta Eficiencia:** Todas las señales luminosas utilizarán tecnología LED (ET 03.365.501.0), reduciendo el consumo energético y los costos de mantenimiento a largo plazo.

### 3.2 Estrategia de Implementación de Pasos a Nivel (PN)
Dada la gran cantidad de PN (146), se propone una implementación por fases alineada con el riesgo y el Plan de Obras (AT9):
- **Fase 1 (Prioridad Alta):** Construcción de los **9 PN Tipo C (barreras automáticas)** y los **15 PN Tipo B (señales luminosas/acústicas)** en las zonas de mayor tráfico vehicular y riesgo comunitario. Estos PN se integrarán y probarán con el CTC de Operación Temprana (UF3).
- **Fase 2 (Prioridad Media):** Instalación de los **122 PN Tipo A (señalización fija)**, coordinando con las campañas de cultura vial del programa de Gestión Social (AT8).

---

## 4. MATRIZ DE CONTROL Y SEGUIMIENTO (REQUISITOS DE SEÑALIZACIÓN)

### 4.1 Requisitos Consolidados del Sistema de Señalización
La siguiente matriz integra los requisitos de los diferentes apéndices en funcionalidades concretas del sistema.

| Requisito Contractual | Fuente | Funcionalidad de Señalización Asociada | Estado AT3/AT4 |
|---|---|---|:---:|
| **5 Enclavamientos Electrónicos (ENCE)** | AT1, Tabla 17 | Diseño e implementación de CBI en Zapatosa, García Cadena, Barrancabermeja, Puerto Berrío-Grecia, La Dorada-México.<br>- **Disponibilidad 99.95% según AT4** | ⚠️ Condicionado |
| **146 Pasos a Nivel (PN)** | AT1, Cap. 4.5 | Diseño e instalación de 9 PN Tipo C (barreras), 15 PN Tipo B (luz/sonido) y 122 PN Tipo A (fijas), cumpliendo NTC 4741. | ✅ Definido |
| **Detección de Trenes** | AT3, Cap. 8.1 | Implementación de contadores de ejes (ET 03.365.310.6) como sistema principal de detección. | ✅ Definido |
| **Disponibilidad PNBC 100%** | AT4 | Diseño de sistemas de protección de PN con redundancia en alimentación y comunicación para garantizar disponibilidad total. | 🔴 Bloqueado |
| **Cultura Vial Ferroviaria** | AT8, Cap. 7.19 | Diseño de señalización en PN (especialmente Tipo A) coordinado con las campañas de capacitación y sensibilización comunitaria. | ✅ Definido |
| **Integración con CTC** | AT3, Cap. 8.2 | Implementación de interfaz SCI-CC-A (NAS 830) en cada enclavamiento para la comunicación con el CTC. | ✅ Definido |
| **Integración ITCS/PTC** | AT1, Tabla 17 | Preparación de interfaces en enclavamientos para la futura integración con el sistema de control positivo de trenes.<br>- **ITCS ETCS Level 2 hasta AT3**<br>- **Interoperabilidad FENOCO UIC** | 🔴 Bloqueado |

### 4.2 Indicadores de Riesgo por Bloqueo AT3/AT4
- **🟢 Verde (Proceder):** Diseño conceptual de la filosofía de señalización, diseño de PN Tipo A, planificación de la implementación por fases, coordinación con programas de AT8.
- **🟡 Amarillo (Diseño Modular):** Diseño de la lógica de los enclavamientos (CBI) y de los PN Tipo B y C. Se puede avanzar en el diseño funcional, pero las especificaciones de hardware dependen de AT3.
- **🔴 Rojo (Bloqueado):** Adquisición de equipos específicos de señalización cuyas especificaciones técnicas están en AT3. Cálculo y reporte de indicadores de disponibilidad definidos en AT4.

---

## 5. CONCLUSIONES Y PRÓXIMOS PASOS

### 5.1 Estado del Documento v4.0
Este documento ha sido actualizado a la versión 4.0, estableciendo un **plan conceptual integrado para el Sistema de Señalización**. Define una filosofía de señalización clara y segura, integra los requisitos de 5 apéndices técnicos (AT1, AT2, AT3, AT4, AT8) y establece una estrategia de implementación por fases para los 146 pasos a nivel, mitigando riesgos operativos y de cronograma.

### 5.2 Acciones Requeridas para Mantener v4.0
- **Validación de Filosofía:** El equipo de ingeniería debe validar la adopción de contadores de ejes como sistema principal de detección.
- **Coordinación con Gestión Social:** El diseño de la señalización en Pasos a Nivel debe realizarse en talleres conjuntos con el equipo de Gestión Social para asegurar la coherencia con las campañas de AT8.

### 5.3 Criterios para Avance
La aprobación de este documento conceptual permite:
- **Desbloquear el Paquete de Trabajo 1.3 (Capacidad y Surcos):** Al definir cómo se detectarán los trenes y se controlarán las rutas, se puede avanzar en el modelo de simulación de capacidad.
- **Iniciar el Diseño Básico de Señalización:** Incluyendo la elaboración de los planos de principio para los 5 enclavamientos y los diseños tipo para los PN.
- **Avanzar en el Plan de Obras (AT9):** Detallar el cronograma de implementación de los PN por fases.

---

**Estado del documento:** ✅ Completado - 27 de enero de 2025
**Versión:** 4.1
**Responsable:** Administrador Contractual EPC
**Próxima actualización:** 27 de febrero de 2025

---

## 🔄 **ACTUALIZACIÓN v4.1 - REVISIÓN METODOLOGÍA PUNTO 42**

### ✅ **MEJORAS IMPLEMENTADAS:**

1. **🚂 ITCS ETCS Level 2:** Preparación de interfaces especificada para integración con sistemas de control embarcados
2. **🔗 Interoperabilidad FENOCO:** Protocolos UIC especificados para compatibilidad con FENOCO
3. **📊 Criterios de Disponibilidad AT4:** 99.95% especificado para enclavamientos
4. **🎯 Matriz de Requisitos:** Actualizada con criterios ITCS, FENOCO y AT4

### 🎯 **VACÍOS IDENTIFICADOS Y CORREGIDOS:**
- ✅ **ITCS:** Preparación de interfaces ETCS Level 2 especificada para enclavamientos
- ✅ **FENOCO:** Protocolos UIC para compatibilidad con estándares FENOCO
- ✅ **AT4:** Criterios de disponibilidad 99.95% para enclavamientos
- ✅ **Interfaces:** Especificación de interfaces ITCS y FENOCO

### ⚠️ **RIESGOS IDENTIFICADOS PARA ANÁLISIS PMI:**

| **ID** | **Riesgo** | **Categoría** | **Probabilidad** | **Impacto** | **Descripción** |
|:---:|:---|:---:|:---:|:---|:---|
| **R-045** | **Dependencia AT3 para equipos** | **Técnico** | **Alta** | **Alto** | Especificaciones de señalización pendientes de AT3 |
| **R-046** | **Interoperabilidad FENOCO** | **Técnico** | **Media** | **Alto** | Compatibilidad con estándares FENOCO requiere protocolos UIC |
| **R-047** | **Disponibilidad 99.95%** | **Contractual** | **Media** | **Alto** | Cumplimiento AT4 requiere redundancia crítica |
| **R-048** | **Gestión de 146 PN** | **Gestión** | **Media** | **Medio** | Complejidad de implementación por fases |
| **R-049** | **Integración ITCS-Señalización** | **Técnico** | **Media** | **Alto** | Complejidad de preparación de interfaces |

### 📋 **RECOMENDACIONES PARA GESTIÓN DE RIESGOS:**
- **Análisis PMI requerido** para definir estrategias de mitigación
- **Plan de contingencia** para dependencias AT3
- **Protocolos de interoperabilidad** con FENOCO según UIC
- **Matriz de disponibilidad** para cumplimiento AT4
- **Gestión de PN** crítica para 146 pasos a nivel
