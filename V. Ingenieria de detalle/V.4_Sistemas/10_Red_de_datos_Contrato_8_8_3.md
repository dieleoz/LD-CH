# RED DE DATOS - CONTRATO 8.8.3
## APP La Dorada - Chiriguaná

---

### INFORMACION DEL DOCUMENTO
- Fecha de actualización: 19 de septiembre de 2025
- Proyecto: APP La Dorada - ChiriguanÃ¡
- Contrato: Concesion No. 001 de 2025
- Responsable: Administrador Contractual EPC
- Tipo: Documento de Ingeniería de Detalle
- Categoria: Red de Datos
- Numero: 8.8.3

---

### DESCRIPCION DEL DOCUMENTO

**10_Red_de_datos_Contrato_8_8_3**

Este documento de soporte contiene informacion tecnica, especificaciones y procedimientos relacionados con Ingenieria de Detalle para el proyecto APP La Dorada - ChiriguanÃ¡.

---

### CONTENIDO TECNICO

### 8.8.3 Red de Datos - ESPECIFICACIONES TÉCNICAS DETALLADAS

**Basado en análisis del documento conceptual 28_Sistema_FibraOptica_Integrado:**

#### **ARQUITECTURA DE RED DE DATOS FERROVIARIA**
- **Topología LAN/WAN:** Red de datos para operación ferroviaria con servidores, switches y redundancia
- **Backbone Principal:** Fibra óptica como medio principal de transmisión de datos
- **Redundancia N+1:** Switches y servidores con redundancia para máxima disponibilidad
- **Seguridad:** Firewalls, VPN y sistemas de ciberseguridad integrados

#### **ESPECIFICACIONES TÉCNICAS**
- **Tecnología:** Ethernet Gigabit/10 Gigabit con protocolos estándar IEEE 802.3
- **Switches:** Equipos de conmutación de alta disponibilidad con redundancia
- **Servidores:** Servidores de aplicación y base de datos con clustering
- **Disponibilidad:** ≥ 99.9% para sistemas críticos según AT4

#### **INTEGRACIÓN CON SISTEMAS FERROVIARIOS**
- **CTC:** Red de datos para centro de control de tráfico
- **Señalización:** Conectividad para enclavamientos electrónicos
- **ITCS:** Red de datos para sistemas de control embarcado
- **Radio TETRA:** Backhaul de datos para estaciones base
- **Fibra Óptica:** Medio de transmisión principal para red de datos
- **Sistemas de Seguridad:** Integración con CCTV, interfonía y sistemas de alarma

---

## RIESGOS IDENTIFICADOS PARA ANÁLISIS PMI

| ID | Categoría | Probabilidad | Impacto | Descripción | Estrategia de Mitigación |
|:---:|:---:|:---:|:---:|:---|:---|
| **R-130** | Técnico | Alta | Alto | Dependencia AT3 para especificaciones ITCS en red de datos | Desarrollar red de datos basada en ETCS Level 2 hasta disponibilidad de AT3 |
| **R-131** | Técnico | Media | Alto | Fallo en interoperabilidad FENOCO por red de datos incompatibles | Establecer red de datos compatible con sistemas FENOCO existentes |
| **R-132** | Contractual | Media | Alto | Incumplimiento de disponibilidad 99.9% en red de datos según AT4 | Implementar sistemas de monitoreo para garantizar cumplimiento de disponibilidad |
| **R-133** | Operacional | Alta | Medio | Complejidad en gestión de red de datos con ITCS | Desarrollar protocolos de prueba específicos para ITCS y FENOCO |
| **R-134** | Técnico | Media | Medio | Integración de red de datos con sistemas FENOCO existentes | Establecer procedimientos de fallback para red de datos ITCS y FENOCO |

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
- **Artículo 8.8.3 - Red de Datos:** LAN/WAN para operación ferroviaria, servidores, switches y redundancia
- **Topología LAN/WAN:** Red de datos para operación ferroviaria con servidores, switches y redundancia
- **Backbone principal:** Fibra óptica como medio principal de transmisión de datos
- **Seguridad:** Firewalls, VPN y sistemas de ciberseguridad integrados

### 1.2 Cumplimiento de Normativas
- **RETIE:** Reglamento Técnico de Instalaciones Eléctricas
- **NSR-10:** Norma Sismorresistente
- **AREMA:** American Railway Engineering and Maintenance-of-Way Association
- **UIC:** Union Internationale des Chemins de fer
- **IEEE 802.3:** Estándares de Ethernet

### 1.3 Indicadores de Cumplimiento
- **Disponibilidad del sistema:** 99.9% para sistemas críticos
- **Capacidad:** Gigabit/10 Gigabit Ethernet
- **Redundancia:** N+1 para switches y servidores
- **Seguridad:** Firewalls, VPN y ciberseguridad integrados

**📅 Estado del documento:** ✅ Completado - 19 de septiembre de 2025  
**📋 Versión:** 4.1  
**👨‍💼 Responsable:** Administrador Contractual EPC  
**📅 Próxima actualización:** 19 de octubre de 2025

---

## ACTUALIZACIÓN v4.1 - REVISIÓN METODOLOGÍA PUNTO 42

### **MEJORAS IMPLEMENTADAS:**
1. **Interfaces Críticas ITCS:** Red de datos para sistemas de control embarcado ETCS Level 2 hasta AT3
2. **Interfaces Críticas FENOCO:** Interoperabilidad con sistemas FENOCO según protocolos UIC
3. **Integración con Sistemas Ferroviarios ITCS:** Red de datos para sistemas de control embarcado
4. **Integración con Sistemas Ferroviarios FENOCO:** Interoperabilidad con sistemas FENOCO
5. **Disponibilidad AT4:** Cumplimiento de disponibilidad 99.9% según indicadores contractuales

### **VACÍOS IDENTIFICADOS Y CORREGIDOS:**
1. **Falta de interfaces ITCS:** Agregada red de datos específica para sistemas de control embarcado ETCS Level 2
2. **Ausencia de interoperabilidad FENOCO:** Integrada interoperabilidad con sistemas FENOCO
3. **Falta de criterios AT4:** Agregado cumplimiento de disponibilidad 99.9%

### ⚠️ **RIESGOS IDENTIFICADOS PARA ANÁLISIS PMI:**

| ID | Categoría | Probabilidad | Impacto | Descripción |
|:---:|:---:|:---:|:---:|:---|
| R-130 | Técnico | Alta | Alto | Dependencia AT3 para especificaciones ITCS en red de datos |
| R-131 | Técnico | Media | Alto | Fallo en interoperabilidad FENOCO por red de datos incompatibles |
| R-132 | Contractual | Media | Alto | Incumplimiento de disponibilidad 99.9% en red de datos según AT4 |
| R-133 | Operacional | Alta | Medio | Complejidad en gestión de red de datos con ITCS |
| R-134 | Técnico | Media | Medio | Integración de red de datos con sistemas FENOCO existentes |

### **RECOMENDACIONES PARA GESTIÓN DE RIESGOS:**
1. **Estrategia ITCS:** Desarrollar red de datos basada en ETCS Level 2 hasta disponibilidad de AT3
2. **Coordinación FENOCO:** Establecer red de datos compatible con sistemas FENOCO existentes
3. **Monitoreo AT4:** Implementar sistemas de monitoreo para garantizar cumplimiento de disponibilidad 99.9%
4. **Pruebas de Red de Datos:** Desarrollar protocolos de prueba específicos para ITCS y FENOCO
5. **Plan de Contingencia:** Establecer procedimientos de fallback para red de datos ITCS y FENOCO
