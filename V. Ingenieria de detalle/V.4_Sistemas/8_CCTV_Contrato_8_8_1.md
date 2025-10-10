# CCTV - CONTRATO 8.8.1
## APP La Dorada - Chiriguaná

---

### INFORMACION DEL DOCUMENTO
- Fecha de actualización: 19 de septiembre de 2025
- Proyecto: APP La Dorada - Chiriguaná
- Contrato: Concesión No. 001 de 2025
- Responsable: Administrador Contractual EPC
- Tipo: Documento de Ingeniería de Detalle
- Categoria: CCTV
- Numero: 8.8.1

---

### DESCRIPCION DEL DOCUMENTO

**8_CCTV_Contrato_8_8_1**

Este documento de soporte contiene informacion tecnica, especificaciones y procedimientos relacionados con Ingenieria de Detalle para el proyecto APP La Dorada - Chiriguaná.

---

### CONTENIDO TECNICO

### 8.8.1 CCTV - ESPECIFICACIONES TÉCNICAS DETALLADAS

**Basado en análisis del documento conceptual 31_Sistema_CCTV_Integrado:**

#### **ARQUITECTURA DE SISTEMA DE VIDEOVIGILANCIA**
- **Cámaras IP:** Sistema de videovigilancia de alta resolución para monitoreo en tiempo real
- **Red de Transmisión:** Fibra óptica como medio principal para transmisión de video
- **Centro de Monitoreo:** Sala de control integrada con CTC para supervisión centralizada
- **Almacenamiento:** Sistemas de grabación y almacenamiento de video con redundancia

#### **ESPECIFICACIONES TÉCNICAS**
- **Resolución:** Cámaras IP de alta definición (1080p/4K) según ubicación crítica
- **Cobertura:** 100% de instalaciones críticas (CTC, pasos a nivel, estaciones técnicas)
- **Grabación:** Almacenamiento mínimo de 30 días con capacidad de expansión
- **Disponibilidad:** ≥ 99.9% para sistemas críticos según AT4

#### **INTEGRACIÓN CON SISTEMAS FERROVIARIOS**
- **CTC:** Monitoreo visual integrado con centro de control de tráfico
- **Pasos a Nivel:** Videovigilancia en los 146 pasos a nivel para seguridad operacional
- **Estaciones Técnicas:** Monitoreo de salas técnicas y equipos críticos
- **Edificios Operativos:** Videovigilancia en oficinas, talleres y centros de operación
- **Sistemas de Seguridad:** Integración con interfonía, alarma y sistemas contra incendio

---

## RIESGOS IDENTIFICADOS PARA ANÁLISIS PMI

| ID | Categoría | Probabilidad | Impacto | Descripción | Estrategia de Mitigación |
|:---:|:---:|:---:|:---:|:---|:---|
| **R-135** | Técnico | Alta | Alto | Dependencia AT3 para especificaciones ITCS en sistema CCTV | Desarrollar sistema CCTV basado en ETCS Level 2 hasta disponibilidad de AT3 |
| **R-136** | Técnico | Media | Alto | Fallo en interoperabilidad FENOCO por sistema CCTV incompatible | Establecer sistema CCTV compatible con sistemas FENOCO existentes |
| **R-137** | Contractual | Media | Alto | Incumplimiento de disponibilidad 99.9% en sistema CCTV según AT4 | Implementar sistemas de monitoreo para garantizar cumplimiento de disponibilidad |
| **R-138** | Operacional | Alta | Medio | Complejidad en gestión de sistema CCTV con ITCS | Desarrollar protocolos de prueba específicos para ITCS y FENOCO |
| **R-139** | Técnico | Media | Medio | Integración de sistema CCTV con sistemas FENOCO existentes | Establecer procedimientos de fallback para sistema CCTV ITCS y FENOCO |

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
- **Artículo 8.8.1 - CCTV:** Sistema de videovigilancia para seguridad operacional
- **Cámaras IP:** Sistema de videovigilancia de alta resolución para monitoreo en tiempo real
- **Red de transmisión:** Fibra óptica como medio principal para transmisión de video
- **Integración:** Con sistemas de seguridad y operación ferroviaria

### 1.2 Cumplimiento de Normativas
- **RETIE:** Reglamento Técnico de Instalaciones Eléctricas
- **NSR-10:** Norma Sismorresistente
- **AREMA:** American Railway Engineering and Maintenance-of-Way Association
- **UIC:** Union Internationale des Chemins de fer
- **IEC 62676:** Estándares internacionales para sistemas de videovigilancia

### 1.3 Indicadores de Cumplimiento
- **Disponibilidad del sistema:** 99.9% para sistemas críticos
- **Resolución de video:** 1080p/4K según ubicación crítica
- **Cobertura:** 100% de instalaciones críticas
- **Almacenamiento:** Mínimo 30 días de grabación

**📅 Estado del documento:** ✅ Completado - 19 de septiembre de 2025  
**📋 Versión:** 4.1  
**👨‍💼 Responsable:** Administrador Contractual EPC  
**📅 Próxima actualización:** 19 de octubre de 2025

---

## ACTUALIZACIÓN v4.1 - REVISIÓN METODOLOGÍA PUNTO 42

### **MEJORAS IMPLEMENTADAS:**
1. **Interfaces Críticas ITCS:** Sistema CCTV para control embarcado ETCS Level 2 hasta AT3
2. **Interfaces Críticas FENOCO:** Interoperabilidad con sistemas FENOCO según protocolos UIC
3. **Integración con Sistemas Ferroviarios ITCS:** Sistema CCTV para control embarcado
4. **Integración con Sistemas Ferroviarios FENOCO:** Interoperabilidad con sistemas FENOCO
5. **Disponibilidad AT4:** Cumplimiento de disponibilidad 99.9% según indicadores contractuales

### **VACÍOS IDENTIFICADOS Y CORREGIDOS:**
1. **Falta de interfaces ITCS:** Agregado sistema CCTV específico para control embarcado ETCS Level 2
2. **Ausencia de interoperabilidad FENOCO:** Integrada interoperabilidad con sistemas FENOCO
3. **Falta de criterios AT4:** Agregado cumplimiento de disponibilidad 99.9%

### ⚠️ **RIESGOS IDENTIFICADOS PARA ANÁLISIS PMI:**

| ID | Categoría | Probabilidad | Impacto | Descripción |
|:---:|:---:|:---:|:---:|:---|
| R-135 | Técnico | Alta | Alto | Dependencia AT3 para especificaciones ITCS en sistema CCTV |
| R-136 | Técnico | Media | Alto | Fallo en interoperabilidad FENOCO por sistema CCTV incompatible |
| R-137 | Contractual | Media | Alto | Incumplimiento de disponibilidad 99.9% en sistema CCTV según AT4 |
| R-138 | Operacional | Alta | Medio | Complejidad en gestión de sistema CCTV con ITCS |
| R-139 | Técnico | Media | Medio | Integración de sistema CCTV con sistemas FENOCO existentes |

### **RECOMENDACIONES PARA GESTIÓN DE RIESGOS:**
1. **Estrategia ITCS:** Desarrollar sistema CCTV basado en ETCS Level 2 hasta disponibilidad de AT3
2. **Coordinación FENOCO:** Establecer sistema CCTV compatible con sistemas FENOCO existentes
3. **Monitoreo AT4:** Implementar sistemas de monitoreo para garantizar cumplimiento de disponibilidad 99.9%
4. **Pruebas de Sistema CCTV:** Desarrollar protocolos de prueba específicos para ITCS y FENOCO
5. **Plan de Contingencia:** Establecer procedimientos de fallback para sistema CCTV ITCS y FENOCO
