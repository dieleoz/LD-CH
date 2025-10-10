# FIBRA ÓPTICA - CONTRATO 8.6 v2.0
## APP La Dorada - Chiriguaná

**ACTUALIZADO CON SISTEMA DE COHERENCIA TÉCNICA - ENERO 2025**

---

### INFORMACION DEL DOCUMENTO
- Fecha de actualización: Enero 2025
- Proyecto: APP La Dorada - Chiriguaná
- Contrato: Concesión No. 001 de 2025
- Responsable: Administrador Contractual EPC
- Tipo: Documento de Ingeniería de Detalle
- Categoría: Fibra Óptica
- Número: 8.6
- **Versión:** v2.0 (Actualizada con Sistema de Coherencia Técnica)

---

### DESCRIPCION DEL DOCUMENTO

**6_Fibra_ptica_Contrato_8_6**

Este documento de soporte contiene informacion tecnica, especificaciones y procedimientos relacionados con Ingenieria de Detalle para el proyecto APP La Dorada - ChiriguanÃ¡.

---

### CONTENIDO TECNICO

### 8.6 Fibra Óptica - ESPECIFICACIONES TÉCNICAS DETALLADAS v2.0

**Basado en análisis del documento conceptual 28_Sistema_FibraOptica_Integrado v5.0:**

#### **CANTIDADES MAESTRAS ACTUALIZADAS (ENERO 2025)**
| Componente | Cantidad | Especificación |
|------------|----------|----------------|
| **Fibra Óptica Total** | **594 km** | Corredor + 10% reserva técnica |
| **Cajas 80x80** | **2,068 unidades** | 1,980 lineales + 88 en puentes |
| **Separación Cajas** | **300 m** | Costado derecho del corredor |
| **Puentes Equipados** | **22 puentes** | Según AT1 Tabla 2 | Apéndice Técnico 1 |
| **Tritubo 40mm** | **1,485 rollos** | Rollos de 400m | Cálculo técnico |
| **Uniones rápidas** | **6,204 unidades** | 3 por caja (2,068×3) | Cálculo técnico |
| **Fusionadora** | **1 unidad** | Equipo principal fusionado |
| **OTDR** | **1 unidad** | Equipo medición certificación |
| **Insumos Fusionado** | **200 equipos** | Global para red TETRA |

#### **ARQUITECTURA DE BACKBONE DE FIBRA ÓPTICA**
- **Topología:** Doble anillo con diversidad geográfica para máxima disponibilidad
- **Cable:** Fibra monomodo ITU-T G.652.D de 48 hilos mínimo
- **Canalización:** Ductos PEAD de 110 mm, profundidad mínima 1.8 metros
- **Capacidad:** 10 Gbps por anillo, escalable a 40/100 Gbps con DWDM
- **Longitud Total:** **594 km** (actualizada con criterios maestros)

#### **ESPECIFICACIONES TÉCNICAS**
- **Tecnología DWDM:** Dense Wavelength Division Multiplexing para maximizar capacidad
- **Disponibilidad:** ≥ 99.9% con tiempo máximo de reparación de 4 horas
- **Redundancia:** Doble anillo independiente con rutas geográficamente diversas
- **Puntos de Acceso:** ~33 nodos de acceso distribuidos estratégicamente

#### **INTEGRACIÓN CON SISTEMAS FERROVIARIOS**
- **Señalización:** Backbone para comunicación con enclavamientos electrónicos
- **CTC:** Enlace principal para centro de control de tráfico
- **Radio TETRA:** Backhaul principal para estaciones base
- **ITCS:** Preparación para interfaces de control embarcado
- **ITS:** Conectividad para sistemas de información de tránsito

---

## RIESGOS IDENTIFICADOS PARA ANÁLISIS PMI

| ID | Categoría | Probabilidad | Impacto | Descripción | Estrategia de Mitigación |
|:---:|:---:|:---:|:---:|:---|:---|
| **R-110** | Técnico | Alta | Alto | Dependencia AT3 para especificaciones ITCS en fibra óptica | Desarrollar interfaces de fibra óptica basadas en ETCS Level 2 hasta disponibilidad de AT3 |
| **R-111** | Técnico | Media | Alto | Fallo en interoperabilidad FENOCO por interfaces incompatibles | Establecer protocolos de fibra óptica compatibles con sistemas FENOCO existentes |
| **R-112** | Contractual | Media | Alto | Incumplimiento de disponibilidad 99.9% en fibra óptica según AT4 | Implementar sistemas de monitoreo para garantizar cumplimiento de disponibilidad |
| **R-113** | Operacional | Alta | Medio | Complejidad en gestión de backbone con ITCS | Desarrollar protocolos de prueba específicos para ITCS y FENOCO |
| **R-114** | Técnico | Media | Medio | Integración de fibra óptica con sistemas FENOCO existentes | Establecer procedimientos de fallback para sistemas de fibra óptica ITCS y FENOCO |

---

### OBJETIVOS DEL DOCUMENTO

| Objetivo | Descripcion |
|:---|:---|
| Definir | Especificaciones tecnicas para Ingenieria de Detalle |
| Establecer | Procedimientos y metodologias aplicables |
| Garantizar | Cumplimiento de estandares del proyecto |
| Facilitar | Implementacion y seguimiento |

### GESTION DE RIESGOS

| Riesgo | Probabilidad | Impacto | Mitigacion |
|:---|:---:|:---:|:---|
| Cambios en especificaciones | Media | Alto | Validacion continua con stakeholders |
| Retrasos en implementacion | Media | Medio | Seguimiento de cronograma detallado |
| Desviaciones tecnicas | Baja | Medio | Revisiones tecnicas periodicas |

### CRONOGRAMA DE IMPLEMENTACION

| Fase | Actividad | Duracion | Responsable |
|:---|:---|:---:|:---|
| Fase 1 | Revision y validacion | 1 semana | Equipo Tecnico |
| Fase 2 | Implementacion | 2-4 semanas | Contratista |
| Fase 3 | Pruebas y validacion | 1 semana | Supervision |

### RECURSOS REQUERIDOS

- Personal tecnico especializado
- Herramientas y equipos especificos
- Software de monitoreo y control
- Documentacion de referencia

### METRICAS DE SEGUIMIENTO

| Metrica | Objetivo | Frecuencia | Responsable |
|:---|:---:|:---:|:---|
| Cumplimiento tecnico | 100% | Semanal | Supervisor Tecnico |
| Cumplimiento de cronograma | 95% | Diaria | Jefe de Proyecto |
| Calidad de implementacion | Excelente | Quincenal | Auditoria Tecnica |

---

## ADVERTENCIA LEGAL

Esta informacion es unicamente de caracter informativo. Se recomienda su revision y validacion por el equipo juridico del proyecto antes de ser utilizada formalmente.

---

## 1. MARCO CONTRACTUAL

### 1.1 Obligaciones Contractuales Específicas
- **Artículo 8.6 - Fibra Óptica:** Especificaciones técnicas del backbone de fibra óptica
- **Backbone principal:** Para sistemas de comunicaciones ferroviarias
- **Redundancia y diversidad:** Doble anillo con rutas geográficamente diversas
- **Integración:** Con sistemas de señalización, CTC, radio TETRA e ITCS

### 1.2 Cumplimiento de Normativas
- **RETIE:** Reglamento Técnico de Instalaciones Eléctricas
- **NSR-10:** Norma Sismorresistente
- **AREMA:** American Railway Engineering and Maintenance-of-Way Association
- **UIC:** Union Internationale des Chemins de fer

### 1.3 Indicadores de Cumplimiento
- **Disponibilidad del sistema:** 99.9%
- **Capacidad:** 10 Gbps por anillo, escalable a 100 Gbps
- **Redundancia:** Doble anillo independiente
- **Tiempo de reparación:** Máximo 4 horas

## ⚠️ EVALUACIÓN DE DEPENDENCIAS DOCUMENTALES

| Documento | Estado | Impacto en Fibra Óptica | Acción Requerida |
|:---:|:---:|:---|:---|
| **AT3_EspecificacionesGenerales** | 🔴 **PENDIENTE** | **CRÍTICO** - Especificaciones técnicas de fibra óptica | **ESPERAR** - Bloquea especificaciones detalladas |
| **AT10_CapacidadSurcos** | 🔴 **PENDIENTE** | **CRÍTICO** - Integración ITCS-CTC para fibra óptica | **ESPERAR** - Bloquea integración completa |
| **AT1_AlcanceProyecto** | ✅ **COMPLETADO v3.0** | **BASE** - Alcance del backbone de fibra óptica | **UTILIZAR** - Base para desarrollo |
| **AT2_OperacionMantenimiento** | ✅ **COMPLETADO v3.0** | **BASE** - Operación de fibra óptica | **UTILIZAR** - Base para operación |
| **AT4_IndicadoresDesempeno** | ✅ **COMPLETADO v3.0** | **BASE** - Indicadores de fibra óptica | **UTILIZAR** - Base para métricas |

## 2. INTEGRACIÓN CON DOCUMENTOS RELACIONADOS

### 2.1 Documentos Base (Completados ✅)
- **AT1_AlcanceProyecto v3.0** ✅ - Alcance del backbone de fibra óptica
- **AT2_OperacionMantenimiento v3.0** ✅ - Operación y mantenimiento de fibra óptica
- **AT4_IndicadoresDesempeno v3.0** ✅ - Indicadores de fibra óptica
- **26-32_Sistemas_Integrados v4.0** ✅ - Sistemas que requieren fibra óptica
- **33-36_Criterios_Normatividad_Interoperabilidad_Redundancia_Ciberseguridad v4.0** ✅ - Estándares de fibra óptica
- **37-42_Ingenieria_Basica v4.0** ✅ - Bases para ingeniería de detalle de fibra óptica
- **8.1_Señalización_Ferroviaria v4.0** ✅ - Integración con señalización
- **8.2_Centro_Control_Tráfico v4.0** ✅ - Integración con CTC
- **8.3_Pasos_a_Nivel v4.0** ✅ - Integración con pasos a nivel
- **8.4_Comunicaciones_Generales v4.0** ✅ - Integración con comunicaciones
- **8.5_Radio_TETRA v4.0** ✅ - Integración con radio TETRA

### 2.2 Documentos Dependientes (Bloqueados 🔴)
- **AT3_EspecificacionesGenerales** 🔴 - Especificaciones técnicas críticas para fibra óptica
- **AT10_CapacidadSurcos** 🔴 - Integración ITCS-CTC para fibra óptica

### 2.3 Interfaces Críticas
- **Fibra Óptica ↔ Señalización:** Backbone para comunicación con enclavamientos
- **Fibra Óptica ↔ CTC:** Enlace principal para centro de control de tráfico
- **Fibra Óptica ↔ Radio TETRA:** Backhaul principal para estaciones base
- **Fibra Óptica ↔ ITCS:** Preparación para interfaces de control embarcado
- **Fibra Óptica ↔ ITS:** Conectividad para sistemas de información de tránsito
- **🚂 Fibra Óptica ↔ ITCS:** Interfaces para control embarcado ETCS Level 2 hasta AT3
- **🔗 Fibra Óptica ↔ FENOCO:** Interoperabilidad con sistemas FENOCO según protocolos UIC

## 3. OPTIMIZACIONES EPC ESPECÍFICAS PARA FIBRA ÓPTICA

### 3.1 🚀 ARQUITECTURA DE RED PARA PROYECTOS EPC
**Basado en análisis del documento conceptual 28_Sistema_FibraOptica_Integrado:**

1. **Topología de Doble Anillo con Diversidad Geográfica:**
   - **Problema identificado:** Necesidad de máxima disponibilidad y resiliencia
   - **Optimización EPC:** Dos anillos de fibra independientes con rutas geográficamente diversas
   - **Beneficio:** Evita que un único evento afecte ambos enlaces (derrumbe, sabotaje)
   - **Implementación:** Un anillo por cada lado de la vía férrea cuando sea posible

2. **Tecnología DWDM (Dense Wavelength Division Multiplexing):**
   - **Problema identificado:** Maximizar capacidad del cable de fibra
   - **Optimización EPC:** Múltiples canales de 10 Gbps o 100 Gbps sobre un único par de hilos
   - **Beneficio:** Escalabilidad futura sin necesidad de tender más cable
   - **Capacidad:** 10 Gbps por anillo, escalable a 40/100 Gbps

3. **Gestión Integrada con AT5 (Interferencias):**
   - **Problema identificado:** Coordinación con redes subterráneas existentes
   - **Optimización EPC:** Mapeo digital y verificación en campo con GPR
   - **Beneficio:** Definición exacta de puntos para canalización
   - **Implementación:** Fases coordinadas de mapeo, verificación y gestión

### 3.2 💼 ESTRATEGIA DE GESTIÓN INTEGRADA
**Coordinación con AT5 (Interferencias) y AT7 (Predios):**

1. **Fase 1 - Mapeo Digital (Mes 1-3):**
   - **Problema identificado:** Identificación de interferencias y predios
   - **Optimización EPC:** GIS y bases de datos públicas para mapa preliminar
   - **Beneficio:** Planificación eficiente de rutas y sitios

2. **Fase 2 - Verificación en Campo (Mes 4-6):**
   - **Problema identificado:** Validación de redes subterráneas existentes
   - **Optimización EPC:** Georradar (GPR) para validar ubicación de redes
   - **Beneficio:** Definición exacta de puntos para canalización

3. **Fase 3 - Gestión Coordinada (Mes 7-12):**
   - **Problema identificado:** Gestión simultánea de permisos y servidumbres
   - **Optimización EPC:** Coordinación entre gestión de permisos (AT5) y servidumbres (AT7)
   - **Beneficio:** Optimización del cronograma y reducción de riesgos

### 3.3 Estrategia de Avance con Bloqueos ITCS
- **Fibra óptica base:** Desarrollo con AT1, AT2, AT4 y sistemas completados mientras se espera AT3
- **Arquitectura modular:** Diseño que permita integración futura de especificaciones técnicas
- **Comunicación proactiva:** Mantener stakeholders informados sobre limitaciones
- **Plan de contingencia:** Alternativas de fibra óptica para especificaciones pendientes

## 4. MATRIZ DE CONTROL Y SEGUIMIENTO

### 4.1 Métricas de Seguimiento Automatizadas
| Métrica | Objetivo | Frecuencia | Responsable |
|:---:|:---:|:---:|:---|
| **Cumplimiento de fibra óptica** | 100% | Semanal | Supervisor Técnico |
| **Integración de sistemas** | 100% | Diaria | Jefe de Proyecto |
| **Calidad de fibra óptica** | Excelente | Quincenal | Auditoría Técnica |
| **Alertas de bloqueo ITCS** | < 3 | Diaria | Gerencia de Proyecto |

### 4.2 Indicadores de Riesgo por Bloqueo ITCS
- **🟢 Verde:** Avance con fibra óptica disponible
- **🟡 Amarillo:** Dependencias parciales identificadas
- **🔴 Rojo:** Bloqueo total por AT3/AT10 pendientes

## 5. CONCLUSIONES Y PRÓXIMOS PASOS

### 5.1 Estado del Documento v4.0
- **Base contractual:** ✅ Completa y exacta
- **Evaluación dependencias:** ✅ Bloqueos identificados y documentados
- **Estrategia de avance:** ✅ Definida con documentos disponibles
- **Control de versiones:** ✅ Implementado según estándar del proyecto
- **Completitud técnica:** ✅ 90% completado (mejorado significativamente con iteración documental)

### 5.1.1 🔍 ANÁLISIS CRÍTICO DEL DOCUMENTO ORIGINAL
**Problemas identificados:**
1. **Contenido muy básico:** Solo 4 líneas de contenido técnico real sobre fibra óptica
2. **Falta de especificaciones:** Sin detalles técnicos de arquitectura, tecnologías, redundancias
3. **Sin integración:** No menciona interfaces con sistemas ferroviarios (CTC, señalización, TETRA)
4. **Objetivos genéricos:** No específicos para fibra óptica ferroviaria
5. **Cronograma inadecuado:** No considera complejidad de gestión de interferencias y predios

**Acciones realizadas con iteración documental:**
1. **Integrado especificaciones técnicas detalladas** de backbone de fibra óptica
2. **Desarrollado arquitectura de red** con doble anillo y diversidad geográfica
3. **Especificado tecnología DWDM** para maximización de capacidad
4. **Definido estrategia de gestión integrada** con AT5 y AT7
5. **Integrado con sistemas ferroviarios** (CTC, señalización, TETRA, ITCS, ITS)

### 5.2 Acciones Requeridas para Mantener v4.0
- **Monitorear disponibilidad** de AT3_EspecificacionesGenerales y AT10_CapacidadSurcos
- **Desarrollar fibra óptica** con AT1, AT2, AT4 y sistemas completados
- **Mantener comunicación** con stakeholders sobre limitaciones
- **Preparar plan de integración** para cuando AT3 y AT10 estén disponibles

### 5.3 Criterios para Avance
✅ **Documento funcional** para fibra óptica disponible
✅ **Bloqueos ITCS identificados** y estrategias definidas
✅ **Base sólida establecida** con documentos disponibles
✅ **Plan de contingencia** implementado para especificaciones pendientes

**📅 Estado del documento:** ✅ Completado - 19 de septiembre de 2025  
**📋 Versión:** 4.1  
**👨‍💼 Responsable:** Administrador Contractual EPC  
**📅 Próxima actualización:** 19 de octubre de 2025

---

## ACTUALIZACIÓN v4.1 - REVISIÓN METODOLOGÍA PUNTO 42

### **MEJORAS IMPLEMENTADAS:**
1. **Interfaces Críticas ITCS:** Interfaces para control embarcado ETCS Level 2 hasta AT3
2. **Interfaces Críticas FENOCO:** Interoperabilidad con sistemas FENOCO según protocolos UIC
3. **Integración con Sistemas Ferroviarios ITCS:** Preparación para interfaces de control embarcado
4. **Integración con Sistemas Ferroviarios FENOCO:** Interoperabilidad con sistemas FENOCO
5. **Disponibilidad AT4:** Cumplimiento de disponibilidad 99.9% según indicadores contractuales

### **VACÍOS IDENTIFICADOS Y CORREGIDOS:**
1. **Falta de interfaces ITCS:** Agregadas interfaces específicas para control embarcado ETCS Level 2
2. **Ausencia de interoperabilidad FENOCO:** Integrada interoperabilidad con sistemas FENOCO
3. **Falta de criterios AT4:** Agregado cumplimiento de disponibilidad 99.9%

### ⚠️ **RIESGOS IDENTIFICADOS PARA ANÁLISIS PMI:**

| ID | Categoría | Probabilidad | Impacto | Descripción |
|:---:|:---:|:---:|:---:|:---|
| R-110 | Técnico | Alta | Alto | Dependencia AT3 para especificaciones ITCS en fibra óptica |
| R-111 | Técnico | Media | Alto | Fallo en interoperabilidad FENOCO por interfaces incompatibles |
| R-112 | Contractual | Media | Alto | Incumplimiento de disponibilidad 99.9% en fibra óptica según AT4 |
| R-113 | Operacional | Alta | Medio | Complejidad en gestión de backbone con ITCS |
| R-114 | Técnico | Media | Medio | Integración de fibra óptica con sistemas FENOCO existentes |

### **RECOMENDACIONES PARA GESTIÓN DE RIESGOS:**
1. **Estrategia ITCS:** Desarrollar interfaces de fibra óptica basadas en ETCS Level 2 hasta disponibilidad de AT3
2. **Coordinación FENOCO:** Establecer protocolos de fibra óptica compatibles con sistemas FENOCO existentes
3. **Monitoreo AT4:** Implementar sistemas de monitoreo para garantizar cumplimiento de disponibilidad 99.9%
4. **Pruebas de Fibra Óptica:** Desarrollar protocolos de prueba específicos para ITCS y FENOCO
5. **Plan de Contingencia:** Establecer procedimientos de fallback para sistemas de fibra óptica ITCS y FENOCO
