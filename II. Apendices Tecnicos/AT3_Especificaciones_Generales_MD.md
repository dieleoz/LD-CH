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

## ⚖️ VALIDACIÓN FORENSE - ADMINISTRADOR CONTRACTUAL EPC
**Documento:** AT3_Especificaciones_Generales_MD.md (v5.0)
**Dictamen:** 🚨 DEFINICIÓN TECNOLÓGICA CRÍTICA (DESBLOQUEANTE)

Este documento es el hito más importante para la ingeniería de sistemas. Resuelve la "Indefinición Tecnológica" histórica al elegir mandatoriamente el estándar **PTC (Positive Train Control)** bajo normativa **FRA/AREMA**, descartando (para esta versión) el estándar europeo ETCS que se mencionaba en iteraciones anteriores.

Su aplicación desbloquea la compra de material rodante y equipos de señalización, pero conlleva riesgos de integración si FENOCO opera bajo otro estándar.

---

### 📄 1. RESOLUCIÓN DE LA INDEFINICIÓN TECNOLÓGICA (EL "BLOCKER")

**A. La Decisión Normativa (PTC vs. ETCS)**
*   **Fuente MD (v5.0):** Sección 1 establece como Norma Rectora: **FRA 49 CFR Part 236 Subpart I**. Define explícitamente el sistema como PTC.
*   **Fuente PDF (Original):** El AT3 original es una "bolsa de normas" (AREMA, FRA, UIC, AAR) sin elegir arquitectura.
*   **⚖️ Análisis:** El MD toma una Decisión Técnica (DT) necesaria. Al elegir FRA/PTC, alineamos el proyecto con las locomotoras GR12/U10 (General Motors/GE), aunque nos aleja del estándar europeo (UIC).

**B. Arquitectura "Virtual Interlocking" (Optimización Punto 42)**
*   **Fuente MD:** Sección 2.2 elimina los enclavamientos físicos (ENCE) a favor de una lógica centralizada (CTC Virtual).
*   **Fuente PDF:** Menciona "Sistemas de mando y señalización" con normas para enclavamientos físicos (NAS 819).
*   **⚠️ Riesgo Contractual:** Eliminar el hardware físico es Ingeniería de Valor. Se requiere validar esta arquitectura con la Interventoría para evitar rechazo por "falta de equipamiento en sitio". Depende 100% de la fibra óptica.

---

### 🛡️ 2. GESTIÓN DE RIESGOS CRÍTICOS (PUNTO 42)

1.  **Ciberseguridad (NIST/IEC 62443):**
    *   **Fuente MD:** Exige nivel SL-3 para el CTC Virtual.
    *   **Justificación:** Obligatorio para la resiliencia (AT4) dada la centralización lógica.

2.  **Interoperabilidad FENOCO (R-314):**
    *   **Fuente MD:** Propone "Solución Doble Radio" y validación EPE.
    *   **Problema:** Si FENOCO usa un estándar diferente, nuestros trenes PTC no podrán entrar.
    *   **Estrategia:** Equipar locomotoras con Doble Tecnología o interfaces duales.

---

### 🚀 3. INSTRUCCIONES AL EQUIPO (ESTRATEGIA DE EJECUCIÓN)

**Para el Director de Ingeniería (Sistemas):**
*   **Diseño PTC:** Proceder con diseño funcional bajo norma **AREMA 2021** y lógica **FRA 49 CFR 236**. Descartar diseños preliminares ETCS (balizas europeas).
*   **Redundancia:** Diseñar anillo de fibra óptica con redundancia geográfica real y respaldo microondas para soportar el "CTC Virtual".

**Para el Equipo de Compras/Abastecimiento:**
*   **Equipos Embarcados:** Especificar "Must be compliant with FRA 49 CFR 236 PTC Onboard Apparatus" para las 15 locomotoras. No aceptar ofertas solo ETCS sin adaptador.

**Para el Gerente Contractual:**
*   **Socialización ANI:** Presentar formalmente la adopción del estándar FRA-PTC y obtener "No Objeción".

---

### ✅ VEREDICTO FINAL
**AT3_Especificaciones_Generales_MD.md (v5.0)** es técnicamente **APROBADO**.
*   **Estado:** VIGENTE PARA DISEÑO.
*   **Condición:** Requiere validación urgente de la "filosofía virtual" con la Interventoría.

⚠️ **ADVERTENCIA LEGAL:** La adopción del estándar PTC debe garantizar la interoperabilidad con FENOCO (Anexo VIII Consultoría y Cláusula 12.3). Si FENOCO opera bajo otro estándar, la responsabilidad por falta de acceso será del EPC salvo instrucción explícita de ANI.

