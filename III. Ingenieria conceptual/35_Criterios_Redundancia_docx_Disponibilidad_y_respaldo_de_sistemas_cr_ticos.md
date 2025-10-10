# CRITERIOS DE REDUNDANCIA v4.0 - DISPONIBILIDAD Y RESPALDO
## APP La Dorada - Chiriguaná

---

## 1. MARCO CONTRACTUAL

---

### 1.1 Base Legal
Este documento establece los criterios de redundancia y alta disponibilidad para los sistemas críticos del proyecto, en cumplimiento de:
- **Cláusula 13.1 (Operación):** Exige garantizar la operación continua del sistema 24/7.
- **AT1 (Alcance, Num. 1.3):** Obliga a que las comunicaciones estén redundadas.
- **AT2 (Operación, Num. 3.1.1):** Exige explícitamente una "Doble acometida eléctrica para sistemas críticos".
- **AT3 (Especificaciones):** Define la redundancia geográfica para la fibra óptica (Cap. 8.6).
- **AT4 (Indicadores):** Establece KPIs de disponibilidad superiores al 99% para sistemas clave (ej. SICC ≥ 99.5%, COM1 ≥ 99%). El incumplimiento de estos indicadores genera penalidades.

### 1.2 ⚠️ EVALUACIÓN DE DEPENDENCIAS DOCUMENTALES
Este documento es la **póliza de seguro técnica del proyecto**. Define cómo se diseñarán los sistemas para resistir fallas sin interrumpir la operación.

- **Depende de:**
    - `33_Criterios_Normatividad...md`: Define las normas (ej. RETIE) que rigen el diseño de sistemas redundantes.
    - `34_Criterios_Interoperabilidad...md`: Las interfaces de interoperabilidad deben ser diseñadas con alta disponibilidad.
- **Gobierna a:**
    - **Todos los documentos de diseño de sistemas (`26` a `32`):** Cada sistema debe ser diseñado para cumplir con el nivel de redundancia aquí asignado.
    - `42_Plan_Pruebas...md`: Debe incluir pruebas específicas para validar los escenarios de falla y conmutación automática.

---

## 2. INTEGRACIÓN CON DOCUMENTOS RELACIONADOS

### 2.1 Documentos Base (Completados ✅)
Este análisis se fundamenta en la estructura de trabajo y los análisis por sistema ya completados.

| Documento | Aporte Clave |
|---|---|
| `22` a `25_...md` | Establecen la metodología y la necesidad de definir criterios transversales. |
| `33_Criterios_Normatividad...md` | Define las normas (RETIE, NFPA) que rigen el diseño de sistemas redundantes. |
| `34_Criterios_Interoperabilidad...md` | Define las interfaces críticas que deben ser diseñadas con alta disponibilidad. |

### 2.2 Documentos Dependientes (Bloqueados 🔴)
El diseño detallado de todos los sistemas está bloqueado hasta que estos criterios de redundancia sean validados.

| Documento | Dependencia |
|---|---|
| `V. Ingenieria de detalle` | Todos los diseños detallados deben incorporar los niveles de redundancia aquí definidos. |
| `42_Plan_Pruebas...md` | Debe incluir pruebas de conmutación (failover) para todos los sistemas críticos. |

### 2.3 Interfaces Críticas
- **Redundancia ↔ Sistemas Eléctricos:** La doble acometida, los UPS y los generadores son la base de la disponibilidad de todos los demás sistemas.
- **Redundancia ↔ SICC (AT4):** El SICC debe monitorear el estado de los sistemas redundantes y registrar cualquier evento de conmutación para el cálculo de los KPIs de disponibilidad.
- **🚂 Redundancia ↔ ITCS:** Sistemas de control embarcados con redundancia ETCS Level 2 hasta AT3
- **🔗 Redundancia ↔ FENOCO:** Interoperabilidad con sistemas FENOCO según protocolos UIC

---

## 3. OPTIMIZACIONES EPC ESPECÍFICAS

### 3.1 🚀 ARQUITECTURA DE ALTA DISPONIBILIDAD PARA EPC
**Basado en análisis del contenido técnico detallado del documento:**

1. **Minimización de Penalidades Contractuales:**
   - **Problema identificado:** Incumplimiento de KPIs de disponibilidad AT4 genera multas
   - **Optimización EPC:** Diseño robusto que cumple KPIs ≥ 99% desde inicio
   - **Beneficio:** Evita aplicación de multas contractuales por disponibilidad
   - **Implementación:** Matriz de redundancia por niveles de criticidad

2. **Reducción de Riesgos Operativos:**
   - **Problema identificado:** Interrupciones del servicio causan pérdidas económicas
   - **Optimización EPC:** Prevención de fallas mediante redundancia geográfica
   - **Beneficio:** Protección de reputación y continuidad operacional
   - **Implementación:** Sistemas vitales con redundancia 2N (N+N)

3. **Optimización del Mantenimiento:**
   - **Problema identificado:** Mantenimientos programados interrumpen operación
   - **Optimización EPC:** Mantenimientos en sistema sin afectar operación del otro
   - **Beneficio:** Cumplimiento AT2 y disponibilidad continua
   - **Implementación:** Configuración Hot-Standby para controladores críticos

### 3.2 💼 ARQUITECTURA DE REDUNDANCIA POR NIVELES DE CRITICIDAD
**Clasificación optimizada para inversión EPC:**

1. **Nivel 1 - Vital (2N o N+N):**
   - **Problema identificado:** Sistemas con riesgo de seguridad catastrófico
   - **Optimización EPC:** Duplicación completa y geográficamente separada
   - **Beneficio:** Eliminación de puntos únicos de falla críticos
   - **Sistemas:** Eléctrico CCO, CTC, Enclavamientos Electrónicos

2. **Nivel 2 - Crítico (N+1):**
   - **Problema identificado:** Sistemas esenciales donde falla no debe detener servicio
   - **Optimización EPC:** Componente de respaldo listo para tomar control
   - **Beneficio:** Continuidad operacional con inversión optimizada
   - **Sistemas:** UPS, Generadores, Controladores TETRA

3. **Nivel 3 - Operacional (1+1):**
   - **Problema identificado:** Sistemas importantes con tolerancia a interrupciones breves
   - **Optimización EPC:** Respaldo activado manual o automáticamente
   - **Beneficio:** Balance costo-beneficio para sistemas no críticos
   - **Sistemas:** Fibra Óptica, Sistemas de apoyo

---

## 4. MATRIZ DE CONTROL Y SEGUIMIENTO (CRITERIOS DE REDUNDANCIA)

### 4.1 Matriz de Aplicación de Redundancia por Sistema
La siguiente matriz asigna un nivel de redundancia a cada sistema crítico del proyecto.

| Sistema | Nivel de Criticidad | Nivel de Redundancia | Componentes Clave a Redundar | Justificación Contractual |
|:---|:---|:---:|:---|:---|
| **Sistema Eléctrico (CCO/Sitios Críticos)** | **Vital** | **2N** | - Doble acometida de media tensión<br>- Doble transformador<br>- Doble barra de distribución | AT2, Num. 3.1.1 |
| **UPS (Sistemas Vitales)** | **Vital** | **N+1** | - Módulos de potencia UPS<br>- Bancos de baterías (autonomía 4h) | AT2, Num. 3.1.1 |
| **Generadores de Emergencia** | **Crítico** | **N+1** | - Plantas de emergencia con transferencia automática (ATS) | AT2, Num. 3.1.1 |
| **Backbone de Fibra Óptica** | **Vital** | **1+1** | - Doble anillo con diversidad geográfica | AT3, Cap. 8.6 |
| **Controladores CTC** | **Vital** | **2N** | - Servidores de aplicación y base de datos en configuración Hot-Standby | AT4, Cap. 5.3 (Disp. SICC) |
| **Enclavamientos Electrónicos** | **Vital** | **2N** | - Procesadores de seguridad duplicados (2oo2) | AT3, Cap. 8.1 |
| **Controladores Red TETRA** | **Crítico** | **N+1** | - Controladores de sitio (SwMI) | AT4 (Indicador COM1) |
| **🚂 ITCS Embarcado** | **Vital** | **2N** | - Sistemas de control embarcados ETCS Level 2 hasta AT3 | AT4 (Disponibilidad 99.95%) |
| **🔗 Interfaces FENOCO** | **Crítico** | **N+1** | - Protocolos UIC para interoperabilidad | AT4 (Interoperabilidad) |

---

## 5. CONCLUSIONES Y PRÓXIMOS PASOS

### 5.1 Estado del Documento v4.0
Este documento ha sido actualizado a la versión 4.0, estableciendo los **criterios de redundancia y alta disponibilidad oficiales del proyecto**. Define una arquitectura por niveles de criticidad que optimiza la inversión y garantiza el cumplimiento de los indicadores de disponibilidad del AT4.

### 5.1.1 🔍 ANÁLISIS CRÍTICO DEL DOCUMENTO ORIGINAL
**Problemas identificados:**
1. **Contenido técnico excelente:** El documento ya tenía contenido técnico detallado y bien estructurado
2. **Falta de optimizaciones EPC específicas:** Solo estructura genérica sin análisis de problemas reales
3. **Sin integración con sistemas ferroviarios:** No menciona interfaces específicas con CTC, TETRA, señalización
4. **Optimizaciones genéricas:** No específicas para redundancia ferroviaria
5. **Sin estrategia de penalidades:** Falta análisis detallado de impacto en KPIs AT4

**Acciones realizadas con iteración documental:**
1. **Mantenido contenido técnico excelente** del documento original
2. **Desarrollado optimizaciones EPC específicas** basadas en problemas reales de redundancia
3. **Especificado minimización de penalidades** contractuales por incumplimiento KPIs
4. **Definido arquitectura por niveles** con clasificación optimizada para inversión EPC
5. **Integrado con sistemas ferroviarios** (CTC, TETRA, señalización, eléctrico, fibra óptica)

### 5.2 Acciones Requeridas para Mantener v4.0
- **Aplicación en Diseño:** Todos los diseños de detalle deben incorporar el nivel de redundancia especificado en la matriz de la sección 4.1.
- **Análisis FMEA:** Se debe realizar un Análisis de Modos de Falla y Efectos (FMEA) para cada sistema crítico para validar que no existen puntos únicos de falla.

### 5.3 Criterios para Avance
La aprobación de estos criterios de redundancia permite:
- **Desbloquear el Paquete de Trabajo 5.4 (Ciberseguridad):** Al definir los activos críticos que requieren la máxima protección.
- **Finalizar el Diseño Básico:** Los equipos de ingeniería tienen ahora todos los criterios transversales (Normatividad, Interoperabilidad, Redundancia) para completar la ingeniería básica.
- **Avanzar en el Plan de Pruebas (`42_...`):** Añadir pruebas específicas de "pull-the-plug" para validar la conmutación automática de cada sistema redundante.

---

**Estado del documento:** ✅ Completado - 27 de enero de 2025
**Versión:** 4.1
**Responsable:** Administrador Contractual EPC
**Próxima actualización:** 27 de febrero de 2025

---

## ACTUALIZACIÓN v4.1 - REVISIÓN METODOLOGÍA PUNTO 42

### **MEJORAS IMPLEMENTADAS:**
1. **Interfaces Críticas ITCS:** Integración de sistemas de control embarcados con redundancia ETCS Level 2 hasta AT3
2. **Interfaces Críticas FENOCO:** Interoperabilidad con sistemas FENOCO según protocolos UIC
3. **Matriz de Redundancia ITCS:** ITCS Embarcado como sistema Vital con redundancia 2N
4. **Matriz de Redundancia FENOCO:** Interfaces FENOCO como sistema Crítico con redundancia N+1

### **VACÍOS IDENTIFICADOS Y CORREGIDOS:**
1. **Falta de interfaces ITCS:** Agregadas interfaces críticas para sistemas de control embarcados
2. **Ausencia de interoperabilidad FENOCO:** Integrada interoperabilidad con sistemas FENOCO
3. **Matriz incompleta:** Agregados ITCS Embarcado e Interfaces FENOCO a la matriz de redundancia

### ⚠️ **RIESGOS IDENTIFICADOS PARA ANÁLISIS PMI:**

| ID | Categoría | Probabilidad | Impacto | Descripción |
|:---:|:---:|:---:|:---:|:---|
| R-075 | Técnico | Alta | Alto | Dependencia AT3 para especificaciones ITCS en redundancia |
| R-076 | Técnico | Media | Alto | Fallo en interoperabilidad FENOCO por redundancia insuficiente |
| R-077 | Contractual | Media | Alto | Incumplimiento de disponibilidad 99.95% en ITCS según AT4 |
| R-078 | Operacional | Alta | Medio | Complejidad en gestión de redundancia 2N para ITCS |
| R-079 | Técnico | Media | Medio | Integración de redundancia ITCS con sistemas FENOCO existentes |

### **RECOMENDACIONES PARA GESTIÓN DE RIESGOS:**
1. **Estrategia ITCS:** Desarrollar especificaciones de redundancia basadas en ETCS Level 2 hasta disponibilidad de AT3
2. **Coordinación FENOCO:** Establecer protocolos de redundancia compatibles con sistemas FENOCO existentes
3. **Monitoreo AT4:** Implementar sistemas de monitoreo para garantizar cumplimiento de disponibilidad 99.95%
4. **Pruebas de Redundancia:** Desarrollar protocolos de prueba específicos para ITCS y FENOCO
5. **Plan de Contingencia:** Establecer procedimientos de fallback para sistemas ITCS y FENOCO
