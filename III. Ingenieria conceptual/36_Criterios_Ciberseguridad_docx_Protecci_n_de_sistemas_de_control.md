# CRITERIOS DE CIBERSEGURIDAD v7.0 - PHASE 7
**Estado: ✅ APROBADO (PHASE 7)**
## APP La Dorada - Chiriguaná

---

## 1. MARCO CONTRACTUAL

---

### 1.1 Base Legal
Este documento establece los criterios de ciberseguridad para la protección de los sistemas de control, en cumplimiento de:
- **AT1 (Alcance, UF2-CCO):** Exige "minimizar el riesgo a intrusiones no autorizadas a los sistemas y su operación".
- **AT2 (Operación, Num. 3.1.8):** Requiere que los sistemas de información tengan "características de seguridad de la información" garantizando "confidencialidad e integridad".
- **AT4 (Indicadores, Cap. 5.4):** Obliga a tener "medidas y protocolos de seguridad suficientes" y "logs de auditoría" trazables.
- **Apéndices Financieros:** Definen "Acto Cibernético" como una exclusión del seguro, lo que obliga al Concesionario a implementar medidas preventivas robustas para evitar pérdidas no cubiertas.

### 1.2 ⚠️ EVALUACIÓN DE DEPENDENCIAS DOCUMENTALES
Este documento es el **escudo digital del proyecto**. Define cómo se protegerán los sistemas vitales de control contra amenazas internas y externas.

- **Depende de:**
    - `33_Criterios_Normatividad...md`: Define las normas base (IEC 62443, NIST).
    - `35_Criterios_Redundancia...md`: Los sistemas de ciberseguridad (firewalls, SIEM) deben ser redundantes.
- **Gobierna a:**
    - **Todos los documentos de diseño de sistemas (`26` a `32`):** Cada sistema debe ser diseñado e implementado siguiendo los controles de seguridad aquí definidos.
    - `42_Plan_Pruebas...md`: Debe incluir pruebas de penetración (pentesting) y validación de controles de seguridad.

---

## 2. INTEGRACIÓN CON DOCUMENTOS RELACIONADOS

### 2.1 Documentos Base (Completados ✅)
Este análisis se fundamenta en la estructura de trabajo y los análisis por sistema ya completados.

| Documento | Aporte Clave |
|---|---|
| `22` a `25_...md` | Establecen la metodología y la necesidad de definir criterios transversales. |
| `33_Criterios_Normatividad...md` | Define las normas base (IEC 62443, NIST) para el diseño de la seguridad. |
| `35_Criterios_Redundancia...md` | Define los sistemas críticos que requieren protección y la necesidad de que los sistemas de seguridad sean redundantes. |

### 2.2 Documentos Dependientes (Bloqueados 🔴)
El diseño detallado de la seguridad de cada sistema está bloqueado hasta que estos criterios sean validados.

| Documento | Dependencia |
|---|---|
| `V. Ingenieria de detalle` | Todos los diseños detallados deben incorporar los controles de ciberseguridad aquí definidos. |
| `42_Plan_Pruebas...md` | Debe incluir pruebas de seguridad, como análisis de vulnerabilidades y pentesting. |

### 2.3 Interfaces Críticas
- **Ciberseguridad ↔ Red de Datos:** La segmentación de la red es el principal control de ciberseguridad.
- **Ciberseguridad ↔ SICC (AT4):** El SICC debe estar protegido, y a su vez, el sistema de monitoreo de seguridad (SIEM) debe reportar al SICC.
- **Ciberseguridad ↔ Interoperabilidad (FENOCO/ANI):** Las interfaces externas son los principales vectores de ataque y deben ser protegidas con firewalls y VPNs.
- **🚂 Ciberseguridad ↔ ITCS:** Protección de sistemas de control embarcados ETCS Level 2 hasta AT3
- **🔗 Ciberseguridad ↔ FENOCO:** Seguridad en interfaces de interoperabilidad según protocolos UIC

---

## 3. OPTIMIZACIONES EPC ESPECÍFICAS

### 3.1 🚀 ARQUITECTURA DE "DEFENSA EN PROFUNDIDAD" PARA EPC
**Basado en análisis del contenido técnico detallado del documento:**

1. **Reducción de Responsabilidad Contractual:**
   - **Problema identificado:** Actos cibernéticos excluidos del seguro (Apéndices Financieros)
   - **Optimización EPC:** Aplicación de mejores prácticas internacionales (IEC 62443, NIST)
   - **Beneficio:** Limitación de responsabilidad del contratista en caso de incidente
   - **Implementación:** Arquitectura segmentada con múltiples capas de seguridad

2. **Cumplimiento de Requisitos Contractuales:**
   - **Problema identificado:** Obligaciones genéricas ("minimizar riesgos", "garantizar seguridad")
   - **Optimización EPC:** Traducción a controles técnicos específicos y auditables
   - **Beneficio:** Cumplimiento demostrable de AT1, AT2, AT4
   - **Implementación:** Matriz de controles por sistema crítico

3. **Facilitación de Operación Segura:**
   - **Problema identificado:** Mantenimientos en red IT pueden afectar red OT
   - **Optimización EPC:** Segmentación que permite mantenimientos independientes
   - **Beneficio:** Continuidad operacional sin comprometer seguridad
   - **Implementación:** Modelo Purdue con zonas de confianza decrecientes

### 3.2 💼 ARQUITECTURA DE SEGURIDAD POR ZONAS (MODELO PURDUE)
**Segmentación optimizada para sistemas de control ferroviario:**

1. **Zona de Control (Nivel 0/1):**
   - **Problema identificado:** Sensores y actuadores vulnerables a ataques directos
   - **Optimización EPC:** Máxima restricción, sin conexión a redes superiores
   - **Beneficio:** Protección absoluta de sistemas críticos de seguridad
   - **Sistemas:** Sensores, actuadores, enclavamientos

2. **Zona de Supervisión (Nivel 2):**
   - **Problema identificado:** Sistemas SCADA y HMI expuestos a amenazas
   - **Optimización EPC:** Aislamiento de red corporativa
   - **Beneficio:** Protección de sistemas de supervisión operacional
   - **Sistemas:** SCADA, HMI del CTC

3. **Zona de Operaciones (Nivel 3):**
   - **Problema identificado:** Servidores de aplicaciones críticas vulnerables
   - **Optimización EPC:** Segmentación controlada con acceso restringido
   - **Beneficio:** Balance entre seguridad y funcionalidad operacional
   - **Sistemas:** Servidores CTC, TETRA, bases de datos operativas

4. **DMZ Industrial (Nivel 3.5):**
   - **Problema identificado:** Intercambio de datos OT-IT requiere seguridad
   - **Optimización EPC:** Zona desmilitarizada como intermediario seguro
   - **Beneficio:** Protección de interfaces críticas con sistemas externos
   - **Sistemas:** Servidores de replicación SICC, interfaces ANI/FENOCO

5. **Zona Corporativa (Nivel 4/5):**
   - **Problema identificado:** Red IT y acceso internet con mayor exposición
   - **Optimización EPC:** Separación completa de sistemas operacionales
   - **Beneficio:** Protección de sistemas críticos de amenazas corporativas
   - **Sistemas:** Red IT, SICC, acceso a internet

---

## 4. MATRIZ DE CONTROL Y SEGUIMIENTO (CRITERIOS DE CIBERSEGURIDAD)

### 4.1 Matriz de Aplicación de Controles por Sistema
La siguiente matriz asigna los controles de ciberseguridad clave a cada sistema crítico del proyecto.

| Control de Ciberseguridad | Sistemas Afectados | Justificación Contractual | Estándar de Referencia |
|:---|:---|:---|:---|
| **Segmentación de Red (OT/IT)** | Todos los sistemas de control | AT1 (Minimizar intrusiones), AT2 (Seguridad de la información) | IEC 62443-3-2 |
| **Firewalls Industriales (NGFW)** | Perímetro OT, DMZ, accesos remotos | AT1 (Minimizar intrusiones) | IEC 62443-3-3 |
| **Autenticación Multifactor (MFA)** | Acceso a CTC, SCADA, servidores | AT4 (Acceso restringido) | NIST SP 800-63B |
| **Monitoreo de Seguridad (SIEM)** | Todos los sistemas críticos | AT4 (Logs de auditoría) | NIST SP 800-92 |
| **Hardening de Sistemas** | Servidores, HMI, estaciones de trabajo | AT2 (Integridad de la información) | CIS Benchmarks |
| **Gestión de Accesos Remotos** | Soporte de proveedores | AT4 (Acceso restringido) | IEC 62443-2-4 |
| **Plan de Respuesta a Incidentes** | Todos los sistemas | AT2 (Continuidad del servicio) | NIST SP 800-61 |
| **🚂 Protección ITCS Embarcado** | Sistemas de control embarcados | AT4 (Disponibilidad 99.5%) | IEC 62443-3-3 |
| **🔗 Seguridad Interfaces FENOCO** | Interfaces de interoperabilidad | AT4 (Interoperabilidad) | UIC 556 |

---

## 5. CONCLUSIONES Y PRÓXIMOS PASOS

### 5.1 Estado del Documento v4.0
Este documento ha sido actualizado a la versión 4.0, estableciendo los **criterios de ciberseguridad oficiales del proyecto**. Define una arquitectura de "Defensa en Profundidad" basada en estándares internacionales (IEC 62443) y traduce las obligaciones contractuales en controles técnicos específicos y auditables.

### 5.1.1 🔍 ANÁLISIS CRÍTICO DEL DOCUMENTO ORIGINAL
**Problemas identificados:**
1. **Contenido técnico excelente:** El documento ya tenía contenido técnico detallado y bien estructurado
2. **Falta de optimizaciones EPC específicas:** Solo estructura genérica sin análisis de problemas reales
3. **Sin integración con sistemas ferroviarios:** No menciona interfaces específicas con CTC, TETRA, SICC
4. **Optimizaciones genéricas:** No específicas para ciberseguridad ferroviaria
5. **Sin estrategia de responsabilidad:** Falta análisis detallado de exclusión de seguros por actos cibernéticos

**Acciones realizadas con iteración documental:**
1. **Mantenido contenido técnico excelente** del documento original
2. **Desarrollado optimizaciones EPC específicas** basadas en problemas reales de ciberseguridad
3. **Especificado reducción de responsabilidad** contractual por exclusión de seguros
4. **Definido arquitectura por zonas** con Modelo Purdue optimizado para EPC
5. **Integrado con sistemas ferroviarios** (CTC, TETRA, SICC, ANI, FENOCO)

### 5.2 Acciones Requeridas para Mantener v4.0
- **Desarrollo de Políticas:** Se deben desarrollar las políticas y procedimientos detallados para cada uno de los controles definidos (ej. Política de Gestión de Accesos, Plan de Respuesta a Incidentes).
- **Análisis de Riesgos Continuo:** El análisis de riesgos de ciberseguridad debe ser un proceso continuo durante todo el ciclo de vida del proyecto.

### 5.3 Criterios para Avance
La aprobación de estos criterios de ciberseguridad **completa el Bloque de Trabajo 5.0 (Criterios de Diseño Transversales)**. Esto permite:
- **Finalizar la Ingeniería Conceptual:** Todos los análisis por sistema y los criterios transversales están definidos.
- **Iniciar la Ingeniería Básica:** El equipo de ingeniería tiene ahora un marco técnico completo (normatividad, interoperabilidad, redundancia y ciberseguridad) para comenzar a desarrollar los diseños básicos, como los diagramas de arquitectura (`38...`) y los planos preliminares (`39...`).

---

**Estado del documento:** ✅ Completado - 27 de enero de 2025
**Versión:** 4.1
**Responsable:** Administrador Contractual EPC
**Próxima actualización:** 27 de febrero de 2025

---

## ACTUALIZACIÓN v4.1 - REVISIÓN METODOLOGÍA PUNTO 42

### **MEJORAS IMPLEMENTADAS:**
1. **Interfaces Críticas ITCS:** Protección de sistemas de control embarcados ETCS Level 2 hasta AT3
2. **Interfaces Críticas FENOCO:** Seguridad en interfaces de interoperabilidad según protocolos UIC
3. **Matriz de Controles ITCS:** Protección ITCS Embarcado con estándar IEC 62443-3-3
4. **Matriz de Controles FENOCO:** Seguridad Interfaces FENOCO con estándar UIC 556

### **VACÍOS IDENTIFICADOS Y CORREGIDOS:**
1. **Falta de protección ITCS:** Agregada protección específica para sistemas de control embarcados
2. **Ausencia de seguridad FENOCO:** Integrada seguridad en interfaces de interoperabilidad
3. **Matriz incompleta:** Agregados controles específicos para ITCS y FENOCO

### ⚠️ **RIESGOS IDENTIFICADOS PARA ANÁLISIS PMI:**

| ID | Categoría | Probabilidad | Impacto | Descripción |
|:---:|:---:|:---:|:---:|:---|
| R-080 | Técnico | Alta | Alto | Vulnerabilidades en sistemas ITCS por dependencia AT3 |
| R-081 | Técnico | Media | Alto | Ataques a interfaces FENOCO por falta de protocolos UIC |
| R-082 | Contractual | Media | Alto | Incumplimiento de disponibilidad 99.5% por incidentes de seguridad |
| R-083 | Operacional | Alta | Medio | Complejidad en gestión de seguridad ITCS y FENOCO |
| R-084 | Técnico | Media | Medio | Integración de controles de seguridad con sistemas FENOCO existentes |

### **RECOMENDACIONES PARA GESTIÓN DE RIESGOS:**
1. **Estrategia ITCS:** Implementar controles de seguridad basados en ETCS Level 2 hasta disponibilidad de AT3
2. **Coordinación FENOCO:** Establecer protocolos de seguridad compatibles con sistemas FENOCO existentes
3. **Monitoreo AT4:** Implementar SIEM para garantizar cumplimiento de disponibilidad 99.5%
4. **Pruebas de Seguridad:** Desarrollar protocolos de pentesting específicos para ITCS y FENOCO
5. **Plan de Contingencia:** Establecer procedimientos de respuesta a incidentes para sistemas ITCS y FENOCO
