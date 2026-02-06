# SISTEMA 02: TELECOMUNICACIONES - Documento Master v1.0

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
| **I. Base Contractual** | AT5, AT7, AT1, AT3 | Enero 2025 | ✅ |
| **III. Ing. Conceptual** | 27, 27.1, 28, 23, 25.1 | Enero 2025 | ✅ |
| **IV. Ing. Básica** | IV.4, 37, 38, 39, 41 | Enero 2025 | ✅ |
| **V. Ing. Detalle** | V.3, V.X_TETRA, Contratos 8.4-8.6 | Enero 2025 | ✅ |
| **VI. Operación** | 6.3_Manual_OM_Telecom | Enero 2025 | ✅ |

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
- **AT1 (Alcance):** Sistemas de telecomunicaciones integrales con redundancia
- **AT3 (Especificaciones):** TETRA + TETRA + Fibra óptica según estándares
- **AT5 (Interferencias):** Gestión de interferencias y coordinación con ANE
- **AT7 (Predial):** Ubicación de 37 torres TETRA/TETRA colocalizadas
- **AT8 (Operaciones):** Procedimientos operacionales integrados

**Criterios de aceptación:**
- Sistema TETRA con 37 estaciones base
- Sistema TETRA con 37 estaciones colocalizadas
- Red de fibra óptica de 594 km con topología de anillo
- Redundancia de comunicaciones con respaldo satelital
- Disponibilidad 99.5% para TETRA y 99.5% para TETRA

**Indicadores de desempeño:**
- Cobertura TETRA: 100% del corredor
- Cobertura TETRA: 100% del corredor
- Disponibilidad fibra óptica: 99.5%
- Tiempo de respuesta: < 500ms
- Capacidad de datos: 1 Gbps por estación

---

## 2. INGENIERÍA CONCEPTUAL

### 2.1 Visión General del Sistema
**Consolidado de documentos III/**

El Sistema de Telecomunicaciones implementa una **arquitectura redundante** basada en:
- **TETRA:** Radio digital troncalizado para operaciones ferroviarias
- **TETRA:** Comunicaciones de datos críticos para ATP
- **Fibra Óptica:** Backbone de alta capacidad para todos los sistemas
- **Colocalización:** TETRA y TETRA en las mismas 37 torres
- **Redundancia:** Sistemas de respaldo y respaldo satelital

### 2.2 Arquitectura Conceptual
**Diagramas y descripciones de III/**

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   CCO/CTC       │    │   Fibra Óptica  │    │   Redundancia   │
│   Control       │◄──►│   594 km        │◄──►│   Satelital     │
│   Central       │    │   Backbone      │    │   Respaldo      │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         │                       │                       │
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   TETRA Network │    │   TETRA Network │    │   ANE/FENOCO    │
│   37 Stations   │    │   37 Stations   │    │   Coordination  │
│   (Colocated)   │    │   (Colocated)   │    │   Spectrum      │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         │                       │                       │
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Locomotives   │    │   Material      │    │   EOT Devices   │
│   TETRA+TETRA   │    │   Rodante       │    │   TETRA Radio   │
│   Embarcados    │    │   Comms         │    │   Integration   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### 2.3 Criterios de Diseño Iniciales
**Criterios establecidos en fase conceptual**

- **Redundancia Dual:** TETRA + TETRA para máxima confiabilidad
- **Colocalización:** Mismas torres para optimización de costos
- **Fibra Óptica:** Backbone de alta capacidad para todos los sistemas
- **Cobertura 100%:** Garantizada en todo el corredor ferroviario
- **Interoperabilidad:** Compatible con FENOCO y estándares UIC

### 2.4 Alternativas Evaluadas
**Análisis de alternativas**

| Alternativa | Descripción | Decisión | Justificación |
|:------------|:------------|:---------|:--------------|
| **Solo TETRA** | Sistema único TETRA | ❌ Rechazada | Falta redundancia crítica |
| **TETRA + TETRA** | Sistemas redundantes | ✅ Seleccionada | Redundancia y especialización |
| **Solo TETRA** | Sistema único TETRA | ❌ Rechazada | Limitaciones operacionales |
| **Fibra + Radio** | Híbrido fibra/radio | ✅ Seleccionada | Óptimo costo/beneficio |

---

## 3. INGENIERÍA BÁSICA

### 3.1 Diseño Básico
**Consolidado de documentos IV/**

**Sistema TETRA:**
- **37 Estaciones Base:** Ubicadas estratégicamente en el corredor
- **Altura Torres:** 40m estándar para cobertura óptima
- **Radios Embarcados:** 30 unidades en locomotoras
- **Radios Portátiles:** 80 unidades para personal
- **Consolas Despacho:** 3 unidades en CCO

**Sistema TETRA:**
- **37 Estaciones Base:** Colocalizadas con TETRA
- **Redundancia:** Sistema de respaldo automático
- **Capacidad:** 1 Gbps por estación
- **Interfaces:** CTC, ATP, Material Rodante

**Fibra Óptica:**
- **594 km:** Red de anillo redundante
- **2,068 Cajas:** Empalme 80x80 cada 300m
- **1,485 Rollos:** Tritubo 40mm
- **6,204 Uniones:** Rápidas para instalación

### 3.2 Especificaciones Básicas
**Especificaciones técnicas de IV/**

| Componente | Especificación | Cantidad | Ubicación |
|:-----------|:---------------|:---------|:----------|
| **TETRA** | Radio digital troncalizado | 37 estaciones | Torres colocalizadas |
| **TETRA** | Red de datos críticos | 37 estaciones | Torres colocalizadas |
| **Fibra Óptica** | Backbone de alta capacidad | 594 km | Corredor ferroviario |
| **Torres** | Estructuras 40m altura | 37 torres | Ubicaciones estratégicas |
| **Radios Embarcados** | TETRA + TETRA | 30 unidades | Locomotoras |

### 3.3 Memorias de Cálculo
**Cálculos y dimensionamientos de IV/**

**Cálculo de Cobertura TETRA:**
- Radio de cobertura: 15 km por estación
- Solapamiento: 20% entre estaciones
- Cobertura total: 100% del corredor
- **Cobertura TETRA:** Idéntica a TETRA (colocalización)

**Cálculo de Capacidad Fibra Óptica:**
- Capacidad por fibra: 100 Gbps
- Redundancia: Anillo doble
- Capacidad total: 200 Gbps
- **Utilización máxima:** 50% para crecimiento futuro

### 3.4 Interfaces Identificadas
**Interfaces con otros sistemas/especialidades**

| Sistema | Tipo Interface | Criticidad | Responsable |
|:--------|:---------------|:-----------|:------------|
| **CTC** | Comunicaciones críticas | Alta | Sistemas de Control |
| **ATP** | Datos de seguridad | Crítica | Sistemas de Control |
| **Material Rodante** | Comunicaciones embarcadas | Alta | Mecánica |
| **EOT** | Telemetría | Media | Mecánica |
| **CCTV** | Transmisión video | Media | ITS y Seguridad |

---

## 4. INGENIERÍA DE DETALLE

### 4.1 Diseño Detallado
**Consolidado de documentos V/**

**V.3 - Sistemas de Comunicación Detalle v5.0:**
- Arquitectura de red redundante
- Especificaciones técnicas completas
- Procedimientos de instalación
- Pruebas de integración
- Manuales de operación

**V.X - Sistema TETRA Detalle v5.0:**
- 37 estaciones TETRA colocalizadas
- Interfaces con CTC y ATP
- Protocolos de comunicación
- Sistemas de redundancia
- Procedimientos de mantenimiento

**Contratos 8.4-8.6:**
- Especificaciones contractuales detalladas
- Criterios de aceptación
- Procedimientos de prueba
- Garantías y soporte

### 4.2 Planos y Esquemas
**Referencia a planos si existen**

- **Planos de Ubicación:** 37 torres TETRA/TETRA
- **Planos de Fibra Óptica:** Recorrido 594 km
- **Esquemas de Red:** Topología de anillo
- **Planos de Instalación:** Equipos y cableado

### 4.3 Especificaciones de Compra
**Especificaciones para adquisición**

**Hardware TETRA:**
- Estaciones base con redundancia N+1
- Antenas de alta ganancia
- Sistemas de alimentación UPS
- Equipos de climatización

**Hardware TETRA:**
- Estaciones base colocalizadas
- Sistemas de control centralizado
- Interfaces de red
- Sistemas de monitoreo

**Hardware Fibra Óptica:**
- Cable de fibra óptica monomodo
- Cajas de empalme 80x80
- Tritubo 40mm
- Uniones rápidas

### 4.4 Procedimientos de Instalación
**Procedimientos constructivos/instalación**

1. **Preparación de Sitios**
   - Construcción de torres
   - Preparación de cimientos
   - Instalación de alimentación

2. **Instalación de Equipos**
   - Montaje de estaciones base
   - Instalación de antenas
   - Configuración de equipos

3. **Instalación de Fibra Óptica**
   - Tendido de cable
   - Instalación de cajas de empalme
   - Pruebas de continuidad

4. **Pruebas y Comisionamiento**
   - Pruebas de cobertura
   - Pruebas de capacidad
   - Pruebas de integración

---

## 5. ESPECIFICACIONES TÉCNICAS FINALES

### 5.1 Especificaciones Funcionales
**Requerimientos funcionales consolidados**

**TETRA:**
- Comunicación voz y datos en tiempo real
- Cobertura 100% del corredor ferroviario
- Capacidad para 500 usuarios simultáneos
- Interfaces con CTC y sistemas embarcados
- Funciones de prioridad y emergencia

**TETRA:**
- Comunicación de datos críticos para ATP
- Latencia < 500ms para aplicaciones críticas
- Capacidad 1 Gbps por estación
- Interfaces con CTC y ATP embarcado
- Redundancia automática

**Fibra Óptica:**
- Capacidad 100 Gbps por fibra
- Redundancia de anillo
- Monitoreo continuo de la red
- Protección contra fallos
- Escalabilidad para crecimiento futuro

### 5.2 Especificaciones de Desempeño
**Criterios de desempeño y KPIs**

| Parámetro | Especificación | Método de Medición |
|:----------|:---------------|:-------------------|
| **Disponibilidad TETRA** | 99.5% | Monitoreo continuo |
| **Disponibilidad TETRA** | 99.5% | Monitoreo continuo |
| **Disponibilidad Fibra** | 99.5% | Monitoreo continuo |
| **Cobertura TETRA** | 100% | Mediciones de campo |
| **Cobertura TETRA** | 100% | Mediciones de campo |
| **Latencia TETRA** | < 500ms | Pruebas de red |
| **Capacidad Fibra** | 100 Gbps | Pruebas de throughput |

### 5.3 Especificaciones de Calidad
**Estándares y normativa aplicable**

- **UIC 751-4:** Comunicaciones ferroviarias
- **UIC 751-5:** TETRA para ferrocarriles
- **IEC 61334:** Sistemas de telecomunicaciones
- **ITU-T G.652:** Fibra óptica monomodo
- **ETSI EN 300 392:** TETRA
- **ETSI EN 301 515:** TETRA

### 5.4 Pruebas y Comisionamiento
**FAT, SAT, procedimientos de prueba**

**FAT (Factory Acceptance Test):**
- Pruebas de funcionalidad TETRA
- Pruebas de funcionalidad TETRA
- Pruebas de capacidad fibra óptica
- Pruebas de integración

**SAT (Site Acceptance Test):**
- Pruebas de cobertura TETRA
- Pruebas de cobertura TETRA
- Pruebas de continuidad fibra
- Pruebas de integración con CTC

---

## 6. PROCEDIMIENTOS OPERACIONALES

### 6.1 Procedimientos Normales
**Operación en condiciones normales**

**Inicio de Operación Diaria:**
1. Verificación del estado de redes TETRA/TETRA
2. Monitoreo de la red de fibra óptica
3. Verificación de cobertura
4. Activación de sistemas de respaldo

**Operación Normal:**
1. Monitoreo continuo de las redes
2. Gestión de tráfico de comunicaciones
3. Registro de eventos y alarmas
4. Comunicación con operadores

### 6.2 Procedimientos de Emergencia
**Operación en condiciones anormales**

**Fallo de Red TETRA:**
1. Activación automática de TETRA
2. Notificación a operadores
3. Procedimientos de respaldo
4. Recuperación del sistema principal

**Fallo de Fibra Óptica:**
1. Activación de anillo de respaldo
2. Ruteo automático de tráfico
3. Notificación de fallo
4. Procedimientos de reparación

### 6.3 Mantenimiento Preventivo
**Plan de mantenimiento según AT10**

**Diario:**
- Verificación de alarmas
- Revisión de logs
- Pruebas de conectividad

**Semanal:**
- Limpieza de equipos
- Verificación de respaldos
- Pruebas de cobertura

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
| **CTC** | Comunicaciones críticas | Crítica | Sistemas de Control | ✅ |
| **ATP** | Datos de seguridad | Crítica | Sistemas de Control | ✅ |
| **Material Rodante** | Comunicaciones embarcadas | Alta | Mecánica | ✅ |
| **EOT** | Telemetría | Media | Mecánica | ✅ |
| **CCTV** | Transmisión video | Media | ITS y Seguridad | ✅ |
| **FENOCO** | Interoperabilidad | Alta | Coordinación Externa | ✅ |
| **ANE** | Gestión de espectro | Alta | Coordinación Externa | ✅ |

### 7.2 Descripción Detallada de Interfaces

**Interface TETRA-CTC:**
- Protocolo: TETRA Data Protocol
- Función: Comunicación voz y datos con CTC
- Redundancia: Sistema redundante con 37 estaciones

**Interface TETRA-ATP:**
- Protocolo: TETRA Data Protocol
- Función: Comunicación de datos críticos
- Redundancia: Red redundante con respaldo automático

**Interface Fibra Óptica-Backbone:**
- Protocolo: Ethernet/IP
- Función: Transporte de datos de todos los sistemas
- Redundancia: Anillo doble con protección automática

---

## 8. MATRICES DE CONTROL Y SEGUIMIENTO

### 8.1 Matriz de Cumplimiento Contractual
**Tracking de obligaciones vs. entregables**

| Obligación Contractual | Entregable | Estado | Fecha |
|:----------------------|:-----------|:-------|:------|
| **AT1 - Telecomunicaciones** | TETRA + TETRA + Fibra | ✅ | Enero 2025 |
| **AT3 - Especificaciones** | Especificaciones técnicas | ✅ | Enero 2025 |
| **AT5 - Interferencias** | Gestión de espectro | ✅ | Enero 2025 |
| **AT7 - Predial** | 37 torres ubicadas | ✅ | Enero 2025 |
| **AT8 - Operaciones** | Manuales OM | ✅ | Enero 2025 |

### 8.2 Matriz de Riesgos Específicos
**Riesgos identificados para este sistema**

| Riesgo | Probabilidad | Impacto | Mitigación | Responsable |
|:-------|:-------------|:---------|:-----------|:------------|
| **Fallo TETRA** | Media | Alto | Redundancia TETRA | Telecomunicaciones |
| **Fallo TETRA** | Baja | Crítico | Redundancia TETRA | Telecomunicaciones |
| **Fallo Fibra** | Baja | Alto | Anillo de respaldo | Telecomunicaciones |
| **Interferencias** | Media | Medio | Coordinación ANE | Telecomunicaciones |

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
- AT3 - Especificaciones Generales
- AT5 - Interferencias de Redes
- AT7 - Gestión Predial
- AT8 - Operaciones

### 9.2 Documentos Técnicos
**III. Ingeniería Conceptual:**
- 27. Sistema TETRA Integrado v5.0
- 27.1. Estimación Cantidades TETRA v5.0
- 28. Sistema Fibra Óptica Integrado
- 23. Listado Maestro de Sistemas v5.0
- 25.1. WBS Completa Especialidades v5.0

**IV. Ingeniería Básica:**
- IV.4. Especificaciones Básicas Sistemas v5.0
- 37. Memorias de Diseño Básico v5.0
- 38. Diagramas de Arquitectura CTC-Telecom
- 39. Planos Preliminares Torres y Fibra
- 41. Interfaces de Sistemas

**V. Ingeniería Detalle:**
- V.3. Sistemas de Comunicación Detalle v5.0
- V.X. Sistema TETRA Detalle v5.0
- Contratos 8.4, 8.5, 8.6 (Telecomunicaciones)

### 9.3 Normativa Aplicable
- UIC 751-4 - Comunicaciones ferroviarias
- UIC 751-5 - TETRA para ferrocarriles
- IEC 61334 - Sistemas de telecomunicaciones
- ITU-T G.652 - Fibra óptica monomodo
- ETSI EN 300 392 - TETRA
- ETSI EN 301 515 - TETRA

### 9.4 Documentos Externos
- Información de FENOCO (interoperabilidad)
- Especificaciones de ANE (gestión de espectro)
- Manuales de equipos TETRA/TETRA
- Estándares UIC aplicables

---

## 📊 ÚLTIMA SINCRONIZACIÓN CON FUENTES

**Fecha de esta versión:** Enero 2025

| Carpeta Fuente | Documentos Sincronizados | Última Modificación | Estado |
|:---------------|:------------------------|:-------------------|:-------|
| I/ Contractual | AT1, AT3, AT5, AT7, AT8 | Enero 2025 | ✅ Inmutable |
| III/ Conceptual | Doc 27, 27.1, 28, 23, 25.1 | Enero 2025 | ✅ Sincronizado |
| IV/ Básica | IV.4, 37, 38, 39, 41 | Enero 2025 | ✅ Sincronizado |
| V/ Detalle | V.3, V.X_TETRA, Contratos 8.4-8.6 | Enero 2025 | ✅ Sincronizado |
| VI/ Operación | 6.3_Manual_OM_Telecom | Enero 2025 | ✅ Sincronizado |

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


<!-- Sincronizado con V.3_Sistemas_Comunicacion_Detalle_v5.0.md el 2025-10-09 09:41:43 -->
- V.3_Sistemas_Comunicacion_Detalle_v5.0.md sincronizado el 2025-10-09 09:41:43


<!-- Sincronizado con V.X_Sistema_TETRA_Detalle_v5.0.md el 2025-10-09 09:41:43 -->
- V.X_Sistema_TETRA_Detalle_v5.0.md sincronizado el 2025-10-09 09:41:43


<!-- Sincronizado con V.3_Sistemas_Comunicacion_Detalle_v5.0.md el 2025-10-09 09:43:00 -->
- V.3_Sistemas_Comunicacion_Detalle_v5.0.md sincronizado el 2025-10-09 09:43:00


<!-- Sincronizado con V.X_Sistema_TETRA_Detalle_v5.0.md el 2025-10-09 09:43:00 -->
- V.X_Sistema_TETRA_Detalle_v5.0.md sincronizado el 2025-10-09 09:43:00


<!-- Sincronizado con V.3_Sistemas_Comunicacion_Detalle_v5.0.md el 2025-10-09 10:04:05 -->
- V.3_Sistemas_Comunicacion_Detalle_v5.0.md sincronizado el 2025-10-09 10:04:05


<!-- Sincronizado con V.X_Sistema_TETRA_Detalle_v5.0.md el 2025-10-09 10:04:05 -->
- V.X_Sistema_TETRA_Detalle_v5.0.md sincronizado el 2025-10-09 10:04:05


<!-- Sincronizado con V.3_Sistemas_Comunicacion_Detalle_v5.0.md el 2025-10-09 10:07:14 -->
- V.3_Sistemas_Comunicacion_Detalle_v5.0.md sincronizado el 2025-10-09 10:07:14


<!-- Sincronizado con V.X_Sistema_TETRA_Detalle_v5.0.md el 2025-10-09 10:07:14 -->
- V.X_Sistema_TETRA_Detalle_v5.0.md sincronizado el 2025-10-09 10:07:14


<!-- Sincronizado con V.3_Sistemas_Comunicacion_Detalle_v5.0.md el 2025-10-09 10:46:06 -->
- V.3_Sistemas_Comunicacion_Detalle_v5.0.md sincronizado el 2025-10-09 10:46:06


<!-- Sincronizado con V.X_Sistema_TETRA_Detalle_v5.0.md el 2025-10-09 10:46:07 -->
- V.X_Sistema_TETRA_Detalle_v5.0.md sincronizado el 2025-10-09 10:46:07

