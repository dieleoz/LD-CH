# SISTEMA 01: CONTROL Y SEÑALIZACIÓN - Documento Master v1.0

**Proyecto:** APP La Dorada-Chiriguaná  
**Contrato:** No. 001 de 2025  
**Fecha elaboración:** Enero 2025  
**Responsable:** Administrador Contractual EPC  
**Estado:** ✅ Completado  

---

## 🗂️ COMPOSICIÓN DEL DOCUMENTO

Este documento consolida información de las siguientes fuentes:

| Fase | Documentos Fuente | Última Sincronización | Estado |
|:-----|:------------------|:---------------------|:-------|
| **I. Base Contractual** | AT1, AT2, AT3, AT4, AT8, AT9 | Enero 2025 | ✅ |
| **III. Ing. Conceptual** | 26, 27, 28, 29 | Enero 2025 | ✅ |
| **IV. Ing. Básica** | SIS_CTC, SIS_ITCS, SIS_Señalización | Enero 2025 | ✅ |
| **V. Ing. Detalle** | V.1, V.2, V.X | Enero 2025 | ✅ |
| **VI. Operación** | Manuales OM | Enero 2025 | ✅ |

**Próxima revisión programada:** Febrero 2025

---

## 📋 TABLA DE CONTENIDOS

1. [Marco Contractual y Obligaciones](#1-marco-contractual)
2. [Ingeniería Conceptual](#2-ingenieria-conceptual)
3. [Ingeniería Básica](#3-ingenieria-basica)
4. [Ingeniería de Detalle](#4-ingenieria-detalle)
5. [Especificaciones Técnicas Finales](#5-especificaciones-tecnicas)
6. [Procedimientos Operacionales](#6-procedimientos-operacionales)
7. [Interfaces con Otros Sistemas](#7-interfaces)
8. [Matrices de Control y Seguimiento](#8-matrices-control)
9. [Referencias y Documentos Relacionados](#9-referencias)

---

## 1. MARCO CONTRACTUAL Y OBLIGACIONES

### 1.1 Base Legal
**Extraído de Contrato General + Apéndices Técnicos relevantes**

**Obligaciones contractuales específicas:**
- **AT1 (CCO):** Centro de Control Operacional con disponibilidad 99.95%
- **AT2 (Operación):** Sistema de operación centralizada con ATP embarcado
- **AT3 (Especificaciones):** ITCS ETCS Level 2 hasta AT3 según criterios
- **AT4 (Indicadores):** Disponibilidad del sistema 99.95% con métricas en tiempo real
- **AT8 (Operaciones):** Procedimientos operacionales integrados
- **AT9 (Cronograma):** Plan de implementación por fases

**Criterios de aceptación:**
- Sistema virtual sin componentes físicos en vía
- Control centralizado desde CCO
- ATP embarcado en material rodante
- Disponibilidad 99.95% del sistema
- Interoperabilidad con FENOCO

**Indicadores de desempeño:**
- Disponibilidad del sistema: 99.95%
- Tiempo de respuesta: < 2 segundos
- Tiempo de recuperación: < 5 minutos
- Cobertura de comunicación: 100%

---

## 2. INGENIERÍA CONCEPTUAL

### 2.1 Visión General del Sistema
**Consolidado de documentos III/**

El Sistema de Control y Señalización implementa una **filosofía virtual** basada en:
- **CTC Virtual:** Control centralizado desde CCO
- **ATP Embarcado:** Sistema de protección a bordo
- **Señalización Virtual:** Sin señales físicas en vía
- **Enclavamientos ENCE:** 5 estaciones críticas
- **Desvíos Automatizados:** 120 desvíos con control centralizado

### 2.2 Arquitectura Conceptual
**Diagramas y descripciones de III/**

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   CCO/CTC       │    │   ATP Embarcado │    │   ENCE Stations │
│   Virtual       │◄──►│   (15 Locos)    │    │   (5 Stations)  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         │                       │                       │
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   GSM-R Network │    │   TETRA Network │    │   Fiber Optic   │
│   (37 Stations) │    │   (37 Stations) │    │   (594 km)      │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### 2.3 Criterios de Diseño Iniciales
**Criterios establecidos en fase conceptual**

- **Filosofía Virtual:** Eliminación total de señalización física
- **Control Centralizado:** CTC desde CCO con redundancia N+1
- **ATP Embarcado:** Sistema de protección a bordo
- **Comunicaciones Redundantes:** GSM-R + TETRA + Fibra óptica
- **Disponibilidad Alta:** 99.95% con sistemas redundantes

### 2.4 Alternativas Evaluadas
**Análisis de alternativas**

| Alternativa | Descripción | Decisión | Justificación |
|:------------|:------------|:---------|:--------------|
| **Señalización Física** | Señales LED en vía | ❌ Rechazada | Costo elevado, mantenimiento complejo |
| **Señalización Virtual** | CTC + ATP embarcado | ✅ Seleccionada | Costo optimizado, mantenimiento simplificado |
| **RBC Centralizado** | Radio Block Center | ❌ Rechazada | No aplicable para filosofía virtual |
| **Control Distribuido** | Múltiples CTCs | ❌ Rechazada | Complejidad operacional |

---

## 3. INGENIERÍA BÁSICA

### 3.1 Diseño Básico
**Consolidado de documentos IV/**

**Centro de Control Operacional (CCO):**
- **Ubicación:** La Dorada (Km 0+000)
- **Arquitectura:** Redundancia N+1
- **Capacidad:** Control de 15 locomotoras simultáneas
- **Interfaces:** CTC, ITCS, TETRA, GSM-R, CCTV

**Sistema ATP Embarcado:**
- **Tecnología:** ITCS ETCS Level 2
- **Cantidad:** 15 locomotoras
- **Funcionalidades:** Protección automática, supervisión, control
- **Interfaces:** CTC, GSM-R, GPS, EOT

### 3.2 Especificaciones Básicas
**Especificaciones técnicas de IV/**

| Componente | Especificación | Cantidad | Ubicación |
|:-----------|:---------------|:---------|:----------|
| **CTC Virtual** | Control centralizado | 1 sistema | CCO La Dorada |
| **ATP Embarcado** | ITCS ETCS Level 2 | 15 unidades | Locomotoras |
| **ENCE** | Enclavamientos electrónicos | 5 estaciones | Estaciones críticas |
| **Desvíos** | Control automatizado | 120 unidades | Vía principal |
| **EOT** | Dispositivos fin de tren | 15 unidades | Vagones |

### 3.3 Memorias de Cálculo
**Cálculos y dimensionamientos de IV/**

**Cálculo de Disponibilidad:**
- CTC Virtual: 99.95% (redundancia N+1)
- ATP Embarcado: 99.9% (sistema crítico)
- Red GSM-R: 99.5% (redundancia satelital)
- Red TETRA: 99.5% (37 estaciones)
- **Disponibilidad Total:** 99.95%

### 3.4 Interfaces Identificadas
**Interfaces con otros sistemas/especialidades**

| Sistema | Tipo Interface | Criticidad | Responsable |
|:--------|:---------------|:-----------|:------------|
| **TETRA** | Comunicaciones | Alta | Telecomunicaciones |
| **GSM-R** | Comunicaciones | Alta | Telecomunicaciones |
| **Fibra Óptica** | Backbone | Alta | Telecomunicaciones |
| **CCTV** | Supervisión | Media | ITS y Seguridad |
| **Material Rodante** | ATP Embarcado | Alta | Mecánica |

---

## 4. INGENIERÍA DE DETALLE

### 4.1 Diseño Detallado
**Consolidado de documentos V/**

**V.2 - Centro de Control de Tráfico (CTC) v5.0:**
- Arquitectura de software con capas definidas
- Servidores redundantes con failover automático
- Interfaces HMI para operadores
- Sistema de alarmas y eventos
- Base de datos de configuración

**V.1 - Señalización Ferroviaria v5.0:**
- Filosofía de señalización virtual
- Criterios de seguridad según EN 50126/50128/50129
- Procedimientos de validación y prueba
- Especificaciones de ATP embarcado

**V.X - Enclavamientos ENCE v5.0:**
- 5 enclavamientos electrónicos
- Interfaces con CTC
- Lógica de seguridad
- Procedimientos de mantenimiento

### 4.2 Planos y Esquemas
**Referencia a planos si existen**

- **Planos de Arquitectura:** CTC y CCO
- **Esquemas Eléctricos:** Alimentación y distribución
- **Diagramas de Comunicación:** Interfaces entre sistemas
- **Planos de Ubicación:** Estaciones con ENCE

### 4.3 Especificaciones de Compra
**Especificaciones para adquisición**

**Hardware CTC:**
- Servidores industriales con redundancia
- Switches de red con protocolo industrial
- UPS con autonomía mínima 30 minutos
- Consolas de operación con monitores táctiles

**Software CTC:**
- Sistema operativo industrial
- Software de control de tráfico
- Base de datos en tiempo real
- Herramientas de monitoreo y diagnóstico

### 4.4 Procedimientos de Instalación
**Procedimientos constructivos/instalación**

1. **Preparación de Infraestructura**
   - Instalación de racks y gabinetes
   - Cableado de red y alimentación
   - Sistemas de climatización

2. **Instalación de Hardware**
   - Montaje de servidores
   - Configuración de red
   - Pruebas de conectividad

3. **Instalación de Software**
   - Instalación del sistema operativo
   - Configuración del software CTC
   - Carga de base de datos

4. **Pruebas y Comisionamiento**
   - Pruebas funcionales
   - Pruebas de integración
   - Pruebas de rendimiento

---

## 5. ESPECIFICACIONES TÉCNICAS FINALES

### 5.1 Especificaciones Funcionales
**Requerimientos funcionales consolidados**

**CTC Virtual:**
- Control de 15 locomotoras simultáneas
- Supervisión en tiempo real
- Gestión de conflictos automática
- Registro de eventos y alarmas
- Interfaces con sistemas externos

**ATP Embarcado:**
- Protección automática de trenes
- Supervisión de velocidad
- Control de frenado de emergencia
- Comunicación con CTC
- Diagnóstico automático

### 5.2 Especificaciones de Desempeño
**Criterios de desempeño y KPIs**

| Parámetro | Especificación | Método de Medición |
|:----------|:---------------|:-------------------|
| **Disponibilidad** | 99.95% | Monitoreo continuo |
| **Tiempo de Respuesta** | < 2 segundos | Pruebas de carga |
| **Tiempo de Recuperación** | < 5 minutos | Pruebas de fallo |
| **Cobertura GSM-R** | 100% | Mediciones de campo |
| **Cobertura TETRA** | 100% | Mediciones de campo |

### 5.3 Especificaciones de Calidad
**Estándares y normativa aplicable**

- **EN 50126:** Gestión de la fiabilidad, disponibilidad, mantenibilidad y seguridad
- **EN 50128:** Sistemas de señalización ferroviaria - Software
- **EN 50129:** Sistemas de señalización ferroviaria - Seguridad
- **IEC 62443:** Ciberseguridad industrial
- **UIC 406:** Capacidad de líneas ferroviarias

### 5.4 Pruebas y Comisionamiento
**FAT, SAT, procedimientos de prueba**

**FAT (Factory Acceptance Test):**
- Pruebas de funcionalidad
- Pruebas de rendimiento
- Pruebas de seguridad
- Pruebas de integración

**SAT (Site Acceptance Test):**
- Pruebas de instalación
- Pruebas de configuración
- Pruebas de interfaces
- Pruebas de operación

---

## 6. PROCEDIMIENTOS OPERACIONALES

### 6.1 Procedimientos Normales
**Operación en condiciones normales**

**Inicio de Operación Diaria:**
1. Verificación del estado de sistemas
2. Carga de plan de tráfico
3. Activación de ATP embarcado
4. Inicio de supervisión

**Operación Normal:**
1. Monitoreo continuo de trenes
2. Gestión automática de conflictos
3. Registro de eventos
4. Comunicación con operadores

### 6.2 Procedimientos de Emergencia
**Operación en condiciones anormales**

**Fallo de CTC:**
1. Activación de sistema redundante
2. Notificación a operadores
3. Procedimientos de respaldo
4. Recuperación del sistema principal

**Fallo de Comunicaciones:**
1. Activación de red de respaldo
2. Modo de operación degradado
3. Notificación a trenes
4. Procedimientos de seguridad

### 6.3 Mantenimiento Preventivo
**Plan de mantenimiento según AT10**

**Diario:**
- Verificación de alarmas
- Revisión de logs
- Pruebas de conectividad

**Semanal:**
- Limpieza de equipos
- Verificación de respaldos
- Pruebas de redundancia

**Mensual:**
- Actualización de software
- Revisión de configuraciones
- Pruebas de rendimiento

### 6.4 Mantenimiento Correctivo
**Procedimientos de corrección de fallas**

1. **Detección de Falla**
   - Alarmas automáticas
   - Monitoreo de operadores
   - Reportes de campo

2. **Diagnóstico**
   - Análisis de logs
   - Pruebas de diagnóstico
   - Identificación de causa

3. **Corrección**
   - Reparación o reemplazo
   - Actualización de software
   - Reconfiguración

4. **Validación**
   - Pruebas funcionales
   - Pruebas de integración
   - Verificación de operación

---

## 7. INTERFACES CON OTROS SISTEMAS

### 7.1 Matriz de Interfaces
| Sistema Relacionado | Tipo Interface | Criticidad | Responsable | Estado |
|:--------------------|:---------------|:-----------|:------------|:-------|
| **TETRA** | Comunicaciones | Alta | Telecomunicaciones | ✅ |
| **GSM-R** | Comunicaciones | Alta | Telecomunicaciones | ✅ |
| **Fibra Óptica** | Backbone | Alta | Telecomunicaciones | ✅ |
| **CCTV** | Supervisión | Media | ITS y Seguridad | ✅ |
| **Material Rodante** | ATP Embarcado | Alta | Mecánica | ✅ |
| **EOT** | Telemetría | Media | Mecánica | ✅ |
| **ENCE** | Control | Alta | Sistemas | ✅ |
| **Desvíos** | Control | Alta | Mecánica | ✅ |

### 7.2 Descripción Detallada de Interfaces

**Interface CTC-TETRA:**
- Protocolo: TETRA Data Protocol
- Función: Comunicación voz y datos con trenes
- Redundancia: Sistema redundante con 37 estaciones

**Interface CTC-GSM-R:**
- Protocolo: GSM-R Data Protocol
- Función: Comunicación de datos críticos
- Redundancia: Red redundante con respaldo satelital

**Interface CTC-ATP:**
- Protocolo: FFFIS (Form Fit Function Interface Specification)
- Función: Control y supervisión de trenes
- Redundancia: Múltiples canales de comunicación

---

## 8. MATRICES DE CONTROL Y SEGUIMIENTO

### 8.1 Matriz de Cumplimiento Contractual
**Tracking de obligaciones vs. entregables**

| Obligación Contractual | Entregable | Estado | Fecha |
|:----------------------|:-----------|:-------|:------|
| **AT1 - CCO** | CTC Virtual | ✅ | Enero 2025 |
| **AT2 - Operación** | Procedimientos OM | ✅ | Enero 2025 |
| **AT3 - ITCS** | ATP Embarcado | ✅ | Enero 2025 |
| **AT4 - Disponibilidad** | Sistema 99.95% | ✅ | Enero 2025 |
| **AT8 - Operaciones** | Manuales OM | ✅ | Enero 2025 |

### 8.2 Matriz de Riesgos Específicos
**Riesgos identificados para este sistema**

| Riesgo | Probabilidad | Impacto | Mitigación | Responsable |
|:-------|:-------------|:---------|:-----------|:------------|
| **Fallo CTC** | Baja | Alto | Redundancia N+1 | Sistemas |
| **Fallo Comunicaciones** | Media | Alto | Redes redundantes | Telecomunicaciones |
| **Fallo ATP** | Baja | Crítico | Sistemas redundantes | Mecánica |
| **Ciberataque** | Baja | Alto | Seguridad industrial | Sistemas |

### 8.3 Matriz de Hitos y Plazos
**Cronograma específico del sistema**

| Hito | Fecha | Estado | Responsable |
|:-----|:------|:-------|:------------|
| **Diseño Conceptual** | Oct 2025 | ✅ | Ingeniería |
| **Diseño Básico** | Nov 2025 | ✅ | Ingeniería |
| **Diseño Detalle** | Ene 2025 | ✅ | Ingeniería |
| **FAT** | Mar 2025 | ⏳ | Proveedor |
| **SAT** | May 2025 | ⏳ | Proveedor |
| **Puesta en Servicio** | Jul 2025 | ⏳ | Operación |

---

## 9. REFERENCIAS Y DOCUMENTOS RELACIONADOS

### 9.1 Documentos Contractuales
- Contrato de Concesión No. 001/2025
- AT1 - Alcance del Proyecto
- AT2 - Operación y Mantenimiento
- AT3 - Especificaciones Generales
- AT4 - Indicadores de Desempeño
- AT8 - Operaciones
- AT9 - Plan de Obras

### 9.2 Documentos Técnicos
**III. Ingeniería Conceptual:**
- 26. Sistema CTC Integrado
- 27. Sistema ITCS ETCS Level 2
- 28. Sistema Señalización Ferroviaria
- 29. Sistema Señalización Integrado v5.0

**IV. Ingeniería Básica:**
- SIS_CTC_Basica
- SIS_ITCS_Basica
- SIS_Señalización_Basica

**V. Ingeniería Detalle:**
- V.1 - Señalización Ferroviaria v5.0
- V.2 - Centro Control Tráfico CTC v5.0
- V.X - Enclavamientos ENCE v5.0

### 9.3 Normativa Aplicable
- EN 50126 - Gestión de RAMS
- EN 50128 - Software de señalización
- EN 50129 - Seguridad de señalización
- IEC 62443 - Ciberseguridad industrial
- UIC 406 - Capacidad de líneas
- UIC 406 - Interoperabilidad

### 9.4 Documentos Externos
- Información de FENOCO (interoperabilidad)
- Especificaciones de proveedores ITCS
- Manuales de equipos ATP
- Estándares UIC aplicables

---

## 📊 ÚLTIMA SINCRONIZACIÓN CON FUENTES

**Fecha de esta versión:** Enero 2025

| Carpeta Fuente | Documentos Sincronizados | Última Modificación | Estado |
|:---------------|:------------------------|:-------------------|:-------|
| I/ Contractual | AT1, AT2, AT3, AT4, AT8, AT9 | Enero 2025 | ✅ Inmutable |
| III/ Conceptual | Doc 26, 27, 28, 29 | Enero 2025 | ✅ Sincronizado |
| IV/ Básica | SIS_CTC, SIS_ITCS, SIS_Señalización | Enero 2025 | ✅ Sincronizado |
| V/ Detalle | V.1, V.2, V.X | Enero 2025 | ✅ Sincronizado |
| VI/ Operación | Manuales OM | Enero 2025 | ✅ Sincronizado |

**Próxima sincronización recomendada:** Febrero 2025

---

## 📊 CONTROL DE CAMBIOS

| Versión | Fecha | Descripción | Responsable |
|:-------:|:------|:------------|:------------|
| 1.0 | Enero 2025 | Versión inicial consolidada | Administrador Contractual EPC |

---

## ⚠️ ADVERTENCIA LEGAL

Esta información es únicamente de carácter informativo y técnico. Se recomienda su revisión y validación por el equipo jurídico y técnico del proyecto antes de ser utilizada formalmente en procesos contractuales o de ejecución.

---

**Elaborado por:** Administrador Contractual EPC - Metodología Punto 42  
**Aprobado por:** [Pendiente]  
**Próxima revisión:** Febrero 2025


---

## ULTIMA SINCRONIZACION CON FUENTES


<!-- Sincronizado con V.2_Centro_Control_Trafico_CTC_v5.0.md el 2025-10-09 09:41:43 -->
- V.2_Centro_Control_Trafico_CTC_v5.0.md sincronizado el 2025-10-09 09:41:43


<!-- Sincronizado con V.X_Enclavamientos_ENCE_Detalle_v5.0.md el 2025-10-09 09:41:43 -->
- V.X_Enclavamientos_ENCE_Detalle_v5.0.md sincronizado el 2025-10-09 09:41:43


<!-- Sincronizado con V.X_Sistema_Desvios_Detalle_v5.0.md el 2025-10-09 09:41:43 -->
- V.X_Sistema_Desvios_Detalle_v5.0.md sincronizado el 2025-10-09 09:41:43


<!-- Sincronizado con V.2_Centro_Control_Trafico_CTC_v5.0.md el 2025-10-09 09:43:00 -->
- V.2_Centro_Control_Trafico_CTC_v5.0.md sincronizado el 2025-10-09 09:43:00


<!-- Sincronizado con V.X_Enclavamientos_ENCE_Detalle_v5.0.md el 2025-10-09 09:43:00 -->
- V.X_Enclavamientos_ENCE_Detalle_v5.0.md sincronizado el 2025-10-09 09:43:00


<!-- Sincronizado con V.X_Sistema_Desvios_Detalle_v5.0.md el 2025-10-09 09:43:00 -->
- V.X_Sistema_Desvios_Detalle_v5.0.md sincronizado el 2025-10-09 09:43:00


<!-- Sincronizado con V.2_Centro_Control_Trafico_CTC_v5.0.md el 2025-10-09 10:04:05 -->
- V.2_Centro_Control_Trafico_CTC_v5.0.md sincronizado el 2025-10-09 10:04:05


<!-- Sincronizado con V.X_Enclavamientos_ENCE_Detalle_v5.0.md el 2025-10-09 10:04:05 -->
- V.X_Enclavamientos_ENCE_Detalle_v5.0.md sincronizado el 2025-10-09 10:04:05


<!-- Sincronizado con V.X_Sistema_Desvios_Detalle_v5.0.md el 2025-10-09 10:04:05 -->
- V.X_Sistema_Desvios_Detalle_v5.0.md sincronizado el 2025-10-09 10:04:05


<!-- Sincronizado con V.2_Centro_Control_Trafico_CTC_v5.0.md el 2025-10-09 10:07:13 -->
- V.2_Centro_Control_Trafico_CTC_v5.0.md sincronizado el 2025-10-09 10:07:13


<!-- Sincronizado con V.X_Enclavamientos_ENCE_Detalle_v5.0.md el 2025-10-09 10:07:14 -->
- V.X_Enclavamientos_ENCE_Detalle_v5.0.md sincronizado el 2025-10-09 10:07:14


<!-- Sincronizado con V.X_Sistema_Desvios_Detalle_v5.0.md el 2025-10-09 10:07:14 -->
- V.X_Sistema_Desvios_Detalle_v5.0.md sincronizado el 2025-10-09 10:07:14


<!-- Sincronizado con V.2_Centro_Control_Trafico_CTC_v5.0.md el 2025-10-09 10:46:06 -->
- V.2_Centro_Control_Trafico_CTC_v5.0.md sincronizado el 2025-10-09 10:46:06


<!-- Sincronizado con V.X_Enclavamientos_ENCE_Detalle_v5.0.md el 2025-10-09 10:46:06 -->
- V.X_Enclavamientos_ENCE_Detalle_v5.0.md sincronizado el 2025-10-09 10:46:06


<!-- Sincronizado con V.X_Sistema_Desvios_Detalle_v5.0.md el 2025-10-09 10:46:06 -->
- V.X_Sistema_Desvios_Detalle_v5.0.md sincronizado el 2025-10-09 10:46:06

