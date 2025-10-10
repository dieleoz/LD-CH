﻿# SISTEMA TETRA INTEGRADO v4.0 - COMUNICACIONES DE MISIÓN CRÍTICA
## APP La Dorada - Chiriguaná

---

## 1. MARCO CONTRACTUAL

### 1.1 Base Legal
El Sistema de Radio TETRA es la red de comunicaciones de voz y datos de misión crítica del proyecto. Su diseño conceptual integra requisitos de:
- **AT1 (Alcance):** Define la necesidad de un "Sistema Base Troncal" y "Torres de telecomunicaciones" para garantizar la comunicación (Cap. I, Num. 1.3).
- **AT2 (Operación):** Establece la obligación de mantener comunicaciones ferroviarias 24/7 y la interoperabilidad con FENOCO (Cap. 3.2.2).
- **AT3 (Especificaciones):** Detalla los requisitos técnicos para el sistema de radio TETRA, incluyendo el cumplimiento de normas ETSI (Cap. 8.5).
- **AT7 (Gestión Predial):** Define la necesidad de adquirir predios para la instalación de las torres de comunicaciones (Cap. 3.1).
- **Cláusula 13.1 (Material Rodante):** Exige que las locomotoras estén equipadas con radios TETRA embarcados.

### 1.2 ⚠️ EVALUACIÓN DE DEPENDENCIAS DOCUMENTALES
Este documento es la base para todas las comunicaciones de voz operativas. Sin una red TETRA funcional, la operación segura del corredor es inviable.

- **Depende de:**
    - `AT1`, `AT2`, `AT3`, `AT7`: Fuentes primarias de requisitos.
    - `28_Sistema_FibraOptica_Integrado...md`: Define el backbone de fibra que servirá de backhaul para las estaciones base TETRA. **(Recién completado, desbloquea este documento)**.
- **Gobierna a:**
    - `V. Ingenieria de detalle/5_Radio_TETRA_Contrato_8_5.md`: El diseño de detalle se basa en los conceptos aquí definidos.
    - `39. PlanosPreliminares...md`: La ubicación de las torres se define a partir del estudio de cobertura conceptualizado aquí.
    - `32_Material_Rodante_Integrado...md`: Define las especificaciones de los equipos de radio que deben instalarse en las locomotoras.

---

## 2. INTEGRACIÓN CON DOCUMENTOS RELACIONADOS

### 2.1 Documentos Base (Completados ✅)
Este análisis se fundamenta en la estructura de trabajo ya aprobada y en el documento de Fibra Óptica recién finalizado.

| Documento | Aporte Clave |
|---|---|
| `22` a `25_...md` | Establecen la metodología, listado de sistemas, trazabilidad y WBS. |
| `28_Sistema_FibraOptica_Integrado...md` | Define la arquitectura del backbone de comunicaciones que conectará las estaciones base TETRA. |

### 2.2 Documentos Dependientes (Bloqueados 🔴)
El diseño detallado de la red TETRA no puede avanzar hasta que este concepto de integración sea validado.

| Documento | Dependencia |
|---|---|
| `V. Ingenieria de detalle/5_...md` | Requiere la arquitectura de red, el plan de frecuencias y las especificaciones de equipos. |
| `39. PlanosPreliminares...md` | Necesita los resultados del estudio de cobertura para definir la ubicación final de las torres. |

### 2.3 Interfaces Críticas
- **TETRA ↔ Fibra Óptica:** La red de fibra es el enlace de transporte (backhaul) entre las estaciones base y el controlador central en el CCO.
- **TETRA ↔ Gestión Predial (AT7):** El estudio de cobertura define la ubicación de las torres, lo que activa el proceso de adquisición de predios.
- **TETRA ↔ ANE (Agencia Nacional del Espectro):** Se requiere la gestión de permisos para el uso de frecuencias y la instalación de las estaciones base.
- **TETRA ↔ Material Rodante:** Los equipos de radio embarcados deben ser compatibles y estar integrados con la red.
- **TETRA ↔ ITCS:** Interfaz para comunicación con sistemas de control embarcados usando ETCS Level 2 hasta AT3.

---

## 3. OPTIMIZACIONES EPC ESPECÍFICAS

### 3.1 Arquitectura de Red para Proyectos EPC
Se propone una arquitectura de red TETRA que garantiza la cobertura, resiliencia y eficiencia requeridas por el contrato:
- **Arquitectura Basada en Sitios:** Se estima la necesidad de **33 sitios de repetición** a lo largo de los 540 km del corredor para garantizar una cobertura del 100% con un nivel de señal mínimo de -95 dBm, considerando la topografía de la zona.
- **Redundancia N+1:** El controlador central del sistema TETRA (ubicado en el CCO) y los sitios de repetición en ubicaciones críticas (ej. Barrancabermeja, La Dorada) contarán con redundancia N+1 en sus componentes clave (controladores, fuentes de poder) para asegurar la continuidad del servicio y cumplir con la disponibilidad 99.5% según AT4.
- **Backhaul por Fibra Óptica:** Cada estación base TETRA se conectará al controlador central a través de la red de fibra óptica de doble anillo, garantizando un enlace de alta capacidad y baja latencia. Se preverán enlaces de microondas como respaldo en los 5 sitios más críticos.

### 3.2 Estrategia de Gestión de Sitios (AT7) y Permisos (ANE)
La implementación de la red TETRA depende críticamente de la disponibilidad de los sitios para las torres. Se propone una estrategia por fases:
- **Fase 1 - Estudio de Propagación (Mes 1-3):** Realizar un estudio de radiofrecuencia detallado para definir las ubicaciones óptimas de las 33 torres, minimizando la cantidad de sitios y maximizando la cobertura.
- **Fase 2 - Gestión Integrada (Mes 4-12):** Con las ubicaciones definidas, iniciar simultáneamente:
    - **Gestión Predial (AT7):** El equipo de gestión predial comenzará la adquisición de los terrenos para las torres.
    - **Gestión de Permisos (ANE):** El equipo regulatorio iniciará el trámite de asignación de frecuencias y permisos de instalación ante la ANE.

---

## 4. MATRIZ DE CONTROL Y SEGUIMIENTO (REQUISITOS TETRA)

### 4.1 Requisitos Consolidados del Sistema TETRA
La siguiente matriz integra los requisitos de los diferentes apéndices en funcionalidades concretas del sistema.

| Requisito Contractual | Fuente | Funcionalidad TETRA Asociada | Estado AT3/AT4 |
|---|---|---|:---:|
| **Sistema Base Troncal y Torres** | AT1, Cap. I | Diseño de una red de ~33 sitios para garantizar 100% de cobertura en el corredor. | ✅ Definido |
| **Comunicaciones Ferroviarias 24/7** | AT2, Cap. 3.2.2 | Implementación de grupos de llamada para operación, mantenimiento y emergencias. | ✅ Definido |
| **Especificaciones de Radio (ETSI)** | AT3, Cap. 8.5 | Selección de equipos (estaciones base, terminales) que cumplan con los estándares ETSI EN 300 392. | ⚠️ Condicionado |
| **Adquisición de Predios para Torres** | AT7, Cap. 3.1 | Plan de adquisición de los ~33 predios necesarios, coordinado con el estudio de cobertura. | ✅ Definido |
| **Interoperabilidad con FENOCO** | AT1, AT2 | Diseño de un plan de roaming o interconexión de redes para garantizar la comunicación en la frontera de Chiriguaná.<br>- **Protocolos UIC para interoperabilidad** | ✅ Definido |
| **Equipos Embarcados en Locomotoras** | Cl. 13.1 | Especificación de radios móviles TETRA con GPS integrado para cada locomotora.<br>- **Interfaz ITCS ETCS Level 2 hasta AT3** | ✅ Definido |
| **Disponibilidad del Servicio (COM1)** | AT4 | Diseño de una red con redundancia N+1 para cumplir con los indicadores de disponibilidad.<br>- **Disponibilidad 99.5% según AT4** | 🔴 Bloqueado |

### 4.2 Indicadores de Riesgo por Bloqueo AT3/AT4
- **🟢 Verde (Proceder):** Estudio de propagación, planificación de sitios, inicio de gestión predial (AT7) y de permisos (ANE).
- **🟡 Amarillo (Diseño Modular):** Diseño de la arquitectura de red y plan de grupos. Se puede avanzar, pero la selección final de equipos depende de AT3.
- **🔴 Rojo (Bloqueado):** Adquisición de equipos de radio específicos (depende de AT3). Cálculo y reporte de indicadores de disponibilidad (depende de AT4).

---

## 5. CONCLUSIONES Y PRÓXIMOS PASOS

### 5.1 Estado del Documento v4.0
Este documento ha sido actualizado a la versión 4.0, estableciendo un **plan conceptual integrado para el sistema de radio TETRA**. Define la arquitectura de cobertura, integra los requisitos de 4 apéndices técnicos (AT1, AT2, AT3, AT7) y la Cláusula 13.1, y establece una estrategia clara para gestionar los riesgos asociados a la adquisición de predios y la obtención de permisos.

### 5.2 Acciones Requeridas para Mantener v4.0
- **Ejecución del Estudio de Propagación:** Es el siguiente paso crítico para confirmar el número y la ubicación exacta de los sitios de repetición.
- **Inicio de Trámites:** El equipo regulatorio debe iniciar las consultas con la ANE para la asignación de frecuencias.

### 5.3 Criterios para Avance
La aprobación de este documento conceptual permite:
- **Desbloquear el Paquete de Trabajo 3.0 (Sistemas ITS y Seguridad):** Al definir la red de comunicaciones que soportará sistemas como CCTV y alarmas remotas.
- **Iniciar el Diseño Básico de la Red TETRA:** Incluyendo la elaboración de los planos de ubicación de torres (`39. PlanosPreliminares...md`).
- **Avanzar en el Diseño del Material Rodante:** Al tener claras las especificaciones de los equipos de radio embarcados.

---

**Estado del documento:** ✅ Completado - 27 de enero de 2025
**Versión:** 4.1
**Responsable:** Administrador Contractual EPC
**Próxima actualización:** 27 de febrero de 2025

---

## 🔄 **ACTUALIZACIÓN v4.1 - REVISIÓN METODOLOGÍA PUNTO 42**

### ✅ **MEJORAS IMPLEMENTADAS:**

1. **🚂 ITCS ETCS Level 2:** Interfaz especificada para comunicación con sistemas de control embarcados
2. **🔗 Interoperabilidad FENOCO:** Protocolos UIC especificados para interoperabilidad
3. **📊 Criterios de Disponibilidad AT4:** 99.5% especificado para sistema TETRA
4. **🎯 Matriz de Requisitos:** Actualizada con criterios ITCS, FENOCO y AT4

### 🎯 **VACÍOS IDENTIFICADOS Y CORREGIDOS:**
- ✅ **ITCS:** Interfaz ETCS Level 2 especificada para equipos embarcados
- ✅ **FENOCO:** Protocolos UIC para interoperabilidad en frontera Chiriguaná
- ✅ **AT4:** Criterios de disponibilidad 99.5% para sistema TETRA
- ✅ **Interfaces:** Especificación de interfaz TETRA-ITCS

### ⚠️ **RIESGOS IDENTIFICADOS PARA ANÁLISIS PMI:**

| **ID** | **Riesgo** | **Categoría** | **Probabilidad** | **Impacto** | **Descripción** |
|:---:|:---|:---:|:---:|:---|:---|
| **R-035** | **Dependencia AT3 para equipos** | **Técnico** | **Alta** | **Alto** | Especificaciones de radio pendientes de AT3 |
| **R-036** | **Interoperabilidad FENOCO** | **Técnico** | **Media** | **Alto** | Coordinación TETRA-FENOCO requiere protocolos UIC |
| **R-037** | **Disponibilidad 99.5%** | **Contractual** | **Media** | **Alto** | Cumplimiento AT4 requiere redundancia crítica |
| **R-038** | **Gestión de 33 sitios** | **Gestión** | **Media** | **Medio** | Complejidad de adquisición de predios y permisos |
| **R-039** | **Integración TETRA-ITCS** | **Técnico** | **Media** | **Alto** | Complejidad de interfaz con sistemas de control |

### 📋 **RECOMENDACIONES PARA GESTIÓN DE RIESGOS:**
- **Análisis PMI requerido** para definir estrategias de mitigación
- **Plan de contingencia** para dependencias AT3
- **Protocolos de interoperabilidad** con FENOCO según UIC
- **Matriz de disponibilidad** para cumplimiento AT4
- **Gestión de sitios** crítica para 33 torres TETRA
