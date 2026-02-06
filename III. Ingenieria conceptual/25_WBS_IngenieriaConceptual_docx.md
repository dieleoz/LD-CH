# WBS INGENIERÍA CONCEPTUAL v7.0 - PHASE 7
## APP La Dorada - Chiriguaná

---

## 1. MARCO CONTRACTUAL

### 1.1 Base Legal
Esta Estructura de Desglose de Trabajo (WBS, por sus siglas en inglés) se desarrolla en cumplimiento de la **Cláusula 8.1 (Estudios y Diseños)**. Su objetivo es organizar en paquetes de trabajo manejables todas las actividades de la Ingeniería Conceptual, asegurando que cada sistema definido en el `23_ListadoMaestro_Sistemas...md` y trazado en la `24_Matriz_TrazabilidadContractual...md` sea analizado y diseñado de forma estructurada.

### 1.2 ⚠️ EVALUACIÓN DE DEPENDENCIAS DOCUMENTALES
Este documento es el **plan de ejecución** de la Ingeniería Conceptual. Consolida los documentos base y define la secuencia de trabajo para los análisis por sistema.

- **Depende de:**
    - `22_HojaRuta_Conceptual...md`: Define la metodología general.
    - `23_ListadoMaestro_Sistemas...md`: Proporciona la lista de sistemas a desglosar.
    - `24_Matriz_TrazabilidadContractual...md`: Asegura que cada paquete de trabajo tiene una base contractual.
- **Gobierna a:**
    - `26` a `36_...md`: Todos los documentos de análisis por sistema y criterios de diseño se organizan y ejecutan según esta WBS.

---

## 2. INTEGRACIÓN CON DOCUMENTOS RELACIONADOS

### 2.1 Documentos Base (Completados ✅)
Esta WBS se construye sobre la base de los documentos fundacionales de la fase, ya completados.

| Documento | Aporte Clave |
|---|---|
| `22_HojaRuta_Conceptual...md` | Establece las fases y la necesidad de una WBS. |
| `23_ListadoMaestro_Sistemas...md` | Proporciona el "qué" (la lista de sistemas). |
| `24_Matriz_TrazabilidadContractual...md` | Proporciona el "porqué" (la base contractual de cada sistema). |

### 2.2 Documentos Dependientes (Bloqueados 🔴)
El desarrollo de los análisis por sistema está bloqueado hasta que esta WBS sea aprobada, ya que organiza el orden y alcance de dicho trabajo.

| Documento | Dependencia |
|---|---|
| `26` a `32_Sistema_*_Integrado...md` | Se ejecutan siguiendo los paquetes de trabajo definidos en esta WBS. |
| `33` a `36_Criterios_*...md` | Se aplican transversalmente a los paquetes de trabajo aquí definidos. |

### 2.3 Interfaces Críticas
- **Interfaz con Planificación y Control:** Esta WBS es el insumo principal para el cronograma detallado de la Ingeniería Conceptual y la asignación de recursos.
- **Interfaz con Gestión de Riesgos:** Permite identificar y asignar riesgos a paquetes de trabajo específicos, facilitando su seguimiento y mitigación.

---

## 3. OPTIMIZACIONES EPC ESPECÍFICAS

### 3.1 Arquitectura para Proyectos EPC
Esta WBS está diseñada como una herramienta de gestión para un contratista EPC, permitiendo:
- **Planificación de Recursos:** Asignar equipos de ingeniería especializados (Control, Telecom, etc.) a paquetes de trabajo específicos.
- **Control de Avance:** Medir el progreso de la ingeniería conceptual de forma granular, paquete por paquete, en lugar de como un todo monolítico.
- **Gestión de Dependencias:** Visualizar claramente las dependencias entre paquetes de trabajo (ej. el diseño de TETRA depende del plan de sitios de torres).

---

## 4. MATRIZ DE CONTROL Y SEGUIMIENTO (WBS)

A continuación, se presenta la Estructura de Desglose de Trabajo para la Ingeniería Conceptual.

| WBS ID | Paquete de Trabajo | Entregables Clave | Documento de Análisis Asociado |
|:---|:---|:---|:---|
| **1.0** | **Sistemas de Control y Señalización** | | |
| 1.1 | Centro de Control de Tráfico (CTC) | - Arquitectura funcional del CTC<br>- Definición de interfaces con enclavamientos y SICC<br>- Requisitos de hardware/software para CCO<br>- **Disponibilidad 99.5% según AT4** | `26. Sistem_CTC_Int...md` |
| 1.2 | Señalización Ferroviaria y Enclavamientos | - Filosofía de señalización (bloques, cantones)<br>- Criterios para enclavamientos electrónicos (CBI)<br>- Especificaciones para detectores de vía | `29_Sistema_Senalizacion_Integrado...md` |
| 1.3 | Capacidad y Gestión de Surcos | - Modelo de simulación de capacidad (UIC-405)<br>- Reglas de negocio para asignación de surcos<br>- Protocolo de interoperabilidad con FENOCO<br>- **ITCS ETCS Level 2 hasta AT3** | `20. AT10_CapacidadSurcos...md` |
| **2.0** | **Sistemas de Telecomunicaciones** | | |
| 2.1 | Red de Fibra Óptica (Backbone) | - Diseño de topología de anillo redundante<br>- Especificaciones de cable y equipos de transmisión (DWDM)<br>- Plan de gestión de interferencias (AT5) | `28_Sistema_FibraOptica_Integrado...md` |
| 2.2 | Sistema de Radio TETRA | - Estudio de cobertura de radio<br>- Plan de sitios para estaciones base (coord. con AT7)<br>- Especificaciones de equipos embarcados y portátiles<br>- **Disponibilidad 99.5% según AT4**<br>- **Interoperabilidad FENOCO UIC** | `27_Sistema_TETRA_Integrado...md` |
| **3.0** | **Sistemas ITS y Seguridad** | | |
| 3.1 | Sistemas Inteligentes de Transporte (ITS) | - Arquitectura de sistemas ITS (paneles, sensores)<br>- Plan de integración con indicadores de desempeño (AT4)<br>- Criterios de gestión ambiental (AT6) | `30_Sistema_ITS_Integrado...md` |
| 3.2 | Sistema de Videovigilancia (CCTV) | - Plan de cobertura de cámaras (estaciones, P.N., CCO)<br>- Especificaciones de VMS y almacenamiento<br>- Criterios de integración con gestión social (AT8) | `31_Sistema_CCTV_Integrado...md` |
| **4.0** | **Material Rodante y Equipos** | | |
| 4.1 | Material Rodante y Equipos Embarcados | - Especificaciones funcionales de locomotoras y vagones<br>- Requisitos de equipos embarcados (ITCS, TETRA, GPS)<br>- Plan de Puesta a Punto y Mantenimiento (AT2)<br>- **ITCS ETCS Level 2 hasta AT3**<br>- **Disponibilidad 99.5% según AT4** | `32_Material_Rodante_Integrado...md` |
| **5.0** | **Criterios de Diseño Transversales** | | |
| 5.1 | Normatividad y Estándares | - Matriz de normatividad aplicable (AREMA, UIC, RETIE, etc.)<br>- Análisis de brechas normativas | `33_Criterios_Normatividad...md` |
| 5.2 | Interoperabilidad | - Estrategia de interoperabilidad con FENOCO<br>- Definición de interfaces técnicas y operativas<br>- **Protocolos UIC para FENOCO** | `34_Criterios_Interoperabilidad...md` |
| 5.3 | Redundancia y Disponibilidad | - Criterios de redundancia para sistemas críticos (N+1)<br>- Cálculo de disponibilidad por sistema<br>- **Criterios AT4: CTC 99.5%, TETRA 99.5%, ITCS 99.5%** | `35_Criterios_Redundancia...md` |
| 5.4 | Ciberseguridad | - Política de ciberseguridad para sistemas de control (OT)<br>- Arquitectura de red segura (segmentación, firewalls) | `36_Criterios_Ciberseguridad...md` |
| **6.0** | **Sistemas Eléctricos y de Potencia** | | |
| 6.1 | Sistema de Alimentación Principal y Respaldo | - Diseño de doble acometida eléctrica<br>- Diagramas unifilares generales<br>- Especificaciones de tableros y transformadores<br>- Cumplimiento RETIE | `V. Ingenieria de detalle/7_Instalaciones_el_ctricas_Contrato_8_7.md` |
| 6.2 | Sistemas de Potencia Ininterrumpida (UPS) | - Cálculo de cargas críticas (CTC, CCO, Telecom)<br>- Especificaciones de UPS (N+1)<br>- Plan de autonomía de baterías (mín. 4 horas) | `35_Criterios_Redundancia...md` |
| 6.3 | Sistemas de Generación de Emergencia | - Dimensionamiento de plantas de emergencia<br>- Diseño de transferencia automática (ATS)<br>- Plan de almacenamiento de combustible | `35_Criterios_Redundancia...md` |
| 6.4 | Puesta a Tierra y Protección contra Rayos | - Diseño de malla de puesta a tierra (talleres, CCO, torres)<br>- Especificaciones de sistema de apantallamiento<br>- Cumplimiento NTC 2050 y RETIE | `V. Ingenieria de detalle/7_Instalaciones_el_ctricas_Contrato_8_7.md` |

---

## 5. CONCLUSIONES Y PRÓXIMOS PASOS

### 5.1 Estado del Documento v4.0
Este documento ha sido actualizado a la versión 4.0 y se establece como la **Estructura de Desglose de Trabajo oficial** para la Ingeniería Conceptual. Organiza el proyecto en paquetes de trabajo lógicos y define los entregables clave para cada uno.

### 5.2 Acciones Requeridas para Mantener v4.0
- **Seguimiento del Plan:** El avance de la ingeniería debe seguir la secuencia y los paquetes de trabajo definidos en esta WBS.
- **Control de Cambios:** Cualquier modificación al alcance de un paquete de trabajo debe ser gestionada a través de un proceso formal de control de cambios.

### 5.3 Criterios para Avance
Con la aprobación de esta WBS, se da por finalizada la fase de "Documentos Base" de la Ingeniería Conceptual. El equipo de ingeniería puede ahora proceder con el **análisis detallado de cada sistema**, comenzando por el paquete de trabajo 1.1 (Sistema CTC) y siguiendo el orden establecido.

---

**Estado del documento:** ✅ Completado - 27 de enero de 2025
**Versión:** 4.1
**Responsable:** Administrador Contractual EPC
**Próxima actualización:** 27 de febrero de 2025

---

## 🔄 **ACTUALIZACIÓN v4.1 - REVISIÓN METODOLOGÍA PUNTO 42**

### ✅ **MEJORAS IMPLEMENTADAS:**

1. **🚂 ITCS Especificado:** ETCS Level 2 como estándar hasta AT3 en paquetes críticos
2. **🔗 Interoperabilidad FENOCO:** Criterios UIC especificados en paquetes relevantes
3. **📊 Criterios de Disponibilidad AT4:** Integrados por paquete (CTC 99.5%, TETRA 99.5%, ITCS 99.5%)
4. **🎯 WBS Actualizada:** Refleja mejoras implementadas en documentos individuales

### 🎯 **VACÍOS IDENTIFICADOS Y CORREGIDOS:**
- ✅ **ITCS:** Estrategia de avance con ETCS Level 2 especificada
- ✅ **FENOCO:** Criterios de interoperabilidad según estándares UIC
- ✅ **AT4:** Criterios de disponibilidad integrados por paquete
- ✅ **Consistencia:** WBS alineada con documentos individuales mejorados

### ⚠️ **RIESGOS IDENTIFICADOS PARA ANÁLISIS PMI:**

| **ID** | **Riesgo** | **Categoría** | **Probabilidad** | **Impacto** | **Descripción** |
|:---:|:---|:---:|:---:|:---|:---|
| **R-025** | **Dependencia AT3 en WBS** | **Técnico** | **Alta** | **Alto** | ITCS pendiente de AT3, paquetes afectados |
| **R-026** | **Interoperabilidad FENOCO** | **Técnico** | **Media** | **Alto** | Compatibilidad con sistemas existentes FENOCO |
| **R-027** | **Disponibilidad 99.5%** | **Contractual** | **Media** | **Alto** | Cumplimiento AT4 requiere redundancia crítica |
| **R-028** | **Gestión de paquetes WBS** | **Gestión** | **Media** | **Medio** | Complejidad de seguimiento de paquetes |
| **R-029** | **Integración entre paquetes** | **Técnico** | **Media** | **Alto** | Complejidad de integración CTC-ITCS-TETRA |

### 📋 **RECOMENDACIONES PARA GESTIÓN DE RIESGOS:**
- **Análisis PMI requerido** para definir estrategias de mitigación
- **Plan de contingencia** para dependencias AT3
- **Protocolos de interoperabilidad** con FENOCO
- **Matriz de disponibilidad** para cumplimiento AT4
- **Gestión de paquetes** crítica para seguimiento WBS
