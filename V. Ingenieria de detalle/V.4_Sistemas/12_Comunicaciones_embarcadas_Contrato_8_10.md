# COMUNICACIONES EMBARCADAS - CONTRATO 8.10
## APP La Dorada - Chiriguaná

---

### INFORMACION DEL DOCUMENTO
- Fecha de actualización: 19 de septiembre de 2025
- Proyecto: APP La Dorada - ChiriguanÃ¡
- Contrato: Concesion No. 001 de 2025
- Responsable: Administrador Contractual EPC
- Tipo: Documento de Ingeniería de Detalle
- Categoria: Comunicaciones Embarcadas
- Numero: 8.10

---

### DESCRIPCION DEL DOCUMENTO

**12_Comunicaciones_embarcadas_Contrato_8_10**

Este documento de soporte contiene informacion tecnica, especificaciones y procedimientos relacionados con Ingenieria de Detalle para el proyecto APP La Dorada - ChiriguanÃ¡.

---

### CONTENIDO TECNICO

### 8.10 Comunicaciones Embarcadas - ESPECIFICACIONES TÉCNICAS DETALLADAS

**Basado en análisis del documento conceptual 32_Material_Rodante_Integrado:**

#### **ARQUITECTURA DE COMUNICACIONES EMBARCADAS**
- **Equipos a Bordo:** Radios TETRA, módems de fibra óptica, sistemas ITCS embarcados
- **Integración Multi-Modal:** Radio TETRA + Fibra Óptica + CTC para redundancia
- **Sistemas de Emergencia:** Comunicación directa con centro de control y servicios de emergencia
- **Localización GPS:** Posicionamiento en tiempo real para control de tráfico y seguridad

#### **ESPECIFICACIONES TÉCNICAS**
- **Radio TETRA Embarcado:** Terminales móviles con GPS integrado para locomotoras
- **Módems de Fibra:** Conectividad de alta velocidad para sistemas ITCS
- **Sistemas ITCS:** Control embarcado ETCS Level 2 hasta especificaciones AT3
- **Disponibilidad:** ≥ 99.5% para sistemas críticos según AT4

#### **INTEGRACIÓN CON SISTEMAS FERROVIARIOS**
- **CTC:** Comunicación bidireccional con centro de control de tráfico
- **Señalización:** Interfaces para control de enclavamientos desde material rodante
- **ITCS:** Sistemas de control embarcado para operación autónoma
- **Radio TETRA:** Comunicación de voz y datos con estaciones base
- **Fibra Óptica:** Backhaul de alta capacidad para sistemas embarcados

---

## RIESGOS IDENTIFICADOS PARA ANÁLISIS PMI

| ID | Categoría | Probabilidad | Impacto | Descripción | Estrategia de Mitigación |
|:---:|:---:|:---:|:---:|:---|:---|
| **R-140** | Técnico | Alta | Alto | Dependencia AT3 para especificaciones ITCS en comunicaciones embarcadas | Desarrollar sistemas embarcados basados en ETCS Level 2 hasta disponibilidad de AT3 |
| **R-141** | Técnico | Media | Alto | Fallo en interoperabilidad FENOCO por sistemas embarcados incompatibles | Establecer sistemas embarcados compatibles con sistemas FENOCO existentes |
| **R-142** | Contractual | Media | Alto | Incumplimiento de disponibilidad 99.5% en comunicaciones embarcadas según AT4 | Implementar sistemas de monitoreo para garantizar cumplimiento de disponibilidad |
| **R-143** | Operacional | Alta | Medio | Complejidad en gestión de sistemas embarcados con ITCS | Desarrollar protocolos de prueba específicos para ITCS y FENOCO |
| **R-144** | Técnico | Media | Medio | Integración de comunicaciones embarcadas con sistemas FENOCO existentes | Establecer procedimientos de fallback para sistemas embarcados ITCS y FENOCO |

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
- **Artículo 8.10 - Comunicaciones Embarcadas:** Especificaciones técnicas de equipos a bordo
- **Equipos embarcados:** Radios TETRA, módems de fibra óptica, sistemas ITCS
- **Integración multi-modal:** Radio TETRA + Fibra Óptica + CTC para redundancia
- **Sistemas de emergencia:** Comunicación directa con centro de control y servicios de emergencia

### 1.2 Cumplimiento de Normativas
- **RETIE:** Reglamento Técnico de Instalaciones Eléctricas
- **NSR-10:** Norma Sismorresistente
- **AREMA:** American Railway Engineering and Maintenance-of-Way Association
- **UIC:** Union Internationale des Chemins de fer
- **ETSI:** European Telecommunications Standards Institute

### 1.3 Indicadores de Cumplimiento
- **Disponibilidad del sistema:** 99.5% para sistemas críticos
- **Tiempo de respuesta:** < 1 segundo para comunicaciones críticas
- **Cobertura GPS:** 100% del corredor ferroviario
- **Redundancia:** Múltiples medios de comunicación

**📅 Estado del documento:** ✅ Completado - 19 de septiembre de 2025  
**📋 Versión:** 4.1  
**👨‍💼 Responsable:** Administrador Contractual EPC  
**📅 Próxima actualización:** 19 de octubre de 2025

---

## ACTUALIZACIÓN v4.1 - REVISIÓN METODOLOGÍA PUNTO 42

### **MEJORAS IMPLEMENTADAS:**
1. **Interfaces Críticas ITCS:** Sistemas de control embarcado ETCS Level 2 hasta AT3
2. **Interfaces Críticas FENOCO:** Interoperabilidad con sistemas FENOCO según protocolos UIC
3. **Integración con Sistemas Ferroviarios ITCS:** Sistemas de control embarcado
4. **Integración con Sistemas Ferroviarios FENOCO:** Interoperabilidad con sistemas FENOCO
5. **Disponibilidad AT4:** Cumplimiento de disponibilidad 99.5% según indicadores contractuales

### **VACÍOS IDENTIFICADOS Y CORREGIDOS:**
1. **Falta de interfaces ITCS:** Agregados sistemas de control embarcado específicos ETCS Level 2
2. **Ausencia de interoperabilidad FENOCO:** Integrada interoperabilidad con sistemas FENOCO
3. **Falta de criterios AT4:** Agregado cumplimiento de disponibilidad 99.5%

### ⚠️ **RIESGOS IDENTIFICADOS PARA ANÁLISIS PMI:**

| ID | Categoría | Probabilidad | Impacto | Descripción |
|:---:|:---:|:---:|:---:|:---|
| R-140 | Técnico | Alta | Alto | Dependencia AT3 para especificaciones ITCS en comunicaciones embarcadas |
| R-141 | Técnico | Media | Alto | Fallo en interoperabilidad FENOCO por sistemas embarcados incompatibles |
| R-142 | Contractual | Media | Alto | Incumplimiento de disponibilidad 99.5% en comunicaciones embarcadas según AT4 |
| R-143 | Operacional | Alta | Medio | Complejidad en gestión de sistemas embarcados con ITCS |
| R-144 | Técnico | Media | Medio | Integración de comunicaciones embarcadas con sistemas FENOCO existentes |

### **RECOMENDACIONES PARA GESTIÓN DE RIESGOS:**
1. **Estrategia ITCS:** Desarrollar sistemas embarcados basados en ETCS Level 2 hasta disponibilidad de AT3
2. **Coordinación FENOCO:** Establecer sistemas embarcados compatibles con sistemas FENOCO existentes
3. **Monitoreo AT4:** Implementar sistemas de monitoreo para garantizar cumplimiento de disponibilidad 99.5%
4. **Pruebas de Comunicaciones Embarcadas:** Desarrollar protocolos de prueba específicos para ITCS y FENOCO
5. **Plan de Contingencia:** Establecer procedimientos de fallback para sistemas embarcados ITCS y FENOCO
