# APÉNDICE TÉCNICO 3 - ESPECIFICACIONES GENERALES (MD V5.0)
## APP La Dorada - Chiriguaná

**Fecha de actualización:** 05 de febrero de 2026  
**Proyecto:** APP La Dorada - Chiriguaná  
**Contrato:** Concesión No. 001 de 2025  
**Apéndice:** AT3 - Especificaciones Generales  
**Estado:** 🚨 **ACTUALIZACIÓN CRÍTICA - NORMATIVA FRA/AREMA (PTC) MANDATORIA**

---

## INFORMACIÓN DEL DOCUMENTO

| Campo | Valor |
|-------|-------|
| **Fecha de actualización** | 05 de febrero de 2026 |
| **Responsable** | Administrador Contractual EPC / Especialista EPE |
| **Estado** | ✅ Certificado v5.0 (Punto 42) |
| **Norma Rectora** | FRA 49 CFR Part 236 Subpart I |

---

## 1. JERARQUÍA NORMATIVA APLICABLE (EPE DECISIÓN)

Conforme a la **Tabla 17 del AT1**, se establece que el sistema de protección será de tipo **PTC (Positive Train Control)**, bajo los estándares de la **FRA (Federal Railroad Administration)**.

1.  **Nivel 1 (Mandatorio):** FRA 49 CFR Part 236 Subpart I (Lógica del Sistema).
2.  **Nivel 2 (Diseño):** AREMA 2021 o superior (Manual for Railway Engineering).
3.  **Nivel 3 (Hardware):** EN 50126/128/129 (SIL-4) para componentes físicos.
4.  **Ciberseguridad:** NIST Framework & IEC 62443 (SL-3).

---

## 2. SISTEMA DE PROTECCIÓN Y SEÑALIZACIÓN (PTC)

### **2.1 Filosofía del Sistema**
El sistema funcionará bajo la lógica de **Cantonamiento Virtual** configurado como PTC (equivalente a ETCS Level 2), permitiendo la supervisión continua del tren a través de la red TETRA/LTE.

-   **Supervisión de Conducción:** Control automático de velocidad y frenado de emergencia.
-   **Hardware de Vía:** Balizas pasivas únicamente para recalibración de posición (Odometría). No se utilizan señales físicas laterales.
-   **Hardware Embarcado:** Unidades de computación SIL-4 con interfaz DMI (Driver Machine Interface) compatible con estándares AAR.

### **2.2 Especificación de Enclavamientos (Virtual Interlocking)**
Siguiendo la decisión de **CTC Virtual**, se eliminan los enclavamientos físicos (ENCE) en estaciones.
-   **Control:** Centralizado en el CCO mediante lógica de RBC (Radio Block Center).
-   **Ejecución:** PLCs de seguridad en campo para control de motores de aguja, integrados vía fibra óptica redundante.

---

## 3. CTC (CONTROL DE TRÁFICO CENTRALIZADO) VIRTUAL

-   **Arquitectura:** Redundancia N+1 con servidores en sitios geográficamente distintos.
-   **Interfaz SICC:** Integración total con el AT4 para el reporte de métricas de disponibilidad del 99.95% en tiempo real.
-   **Funcionalidad:** Gestión automática de surcos ferroviarios (AT10) y supervisión de la lógica PTC.

---

## 4. TELECOMUNICACIONES Y RADIO TETRA (INTEROPERABILIDAD)

### **4.1 Configuración de Doble Radio (Locomotoras)**
Para garantizar la interoperabilidad con la red **FENOCO**, cada locomotora contará con **4 radios TETRA**:
-   **2 Radios de Voz:** (1 LD-CH + 1 FENOCO).
-   **2 Radios de Datos:** (1 LD-CH + 1 FENOCO para PTC).

### **4.2 Procedimiento "Stop & Switch" (Chiriguaná)**
1.  **Parada:** Obligatoria en el punto de frontera.
2.  **Conmutación:** Apagado manual del sistema LD-CH y encendido del sistema FENOCO.
3.  **Handoff:** Validación de autorización de movimiento con el CCO de FENOCO.

---

## 5. CIBERSEGURIDAD Y DISPONIBILIDAD (PUNTO 42)

-   **Disponibilidad Contractual:** Todos los sistemas críticos (PTC, CTC, TETRA) deben garantizar una **Disponibilidad ≥ 99.95%**.
-   **Estándares de Seguridad:** Implementación de zonas y conductos según **IEC 62443-3-3**.
-   **Encriptación:** Todas las comunicaciones tren-tierra deberán estar cifradas mediante protocolos industriales robustos para evitar ataques de inyección de mensajes.

---

## 6. GESTIÓN DE RIESGOS TÉCNICOS (MATRIZ PMI)

| ID | Riesgo | Prob | Impacto | Mitigación |
|:---|:---|:---:|:---:|:---|
| R-313 | Dependencia AT3 para ITCS | Alta | Alto | Adoptar estándares FRA 49 CFR 236 inmediatamente. |
| R-314 | Interoperabilidad FENOCO | Media | Alto | Solución Doble Radio validada por EPE. |
| R-316 | Brecha Ciberseguridad | Media | Alto | Implementación IEC 62443 desde el diseño conceptual. |

---

## 7. CONFORMIDAD Y APROBACIÓN
Este documento ha sido refinado con base en la **Respuesta al Cuestionario de Requerimientos EPE (11 Dic 2025)** y certifica la alineación técnica con el Contrato de Concesión No. 001 de 2025.

---
**Firma de Validación:**
*Especialista EPE (Sistemas de Control)*
*Administrador Contractual EPC*
