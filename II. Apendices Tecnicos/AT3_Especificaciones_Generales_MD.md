# APÉNDICE TÉCNICO 3 - ESPECIFICACIONES GENERALES (v5.0)
## APP La Dorada - Chiriguaná

**Fecha de actualización:** 06 de febrero de 2026  
**Proyecto:** APP La Dorada - Chiriguaná  
**Contrato:** Concesión No. 001 de 2025  
**Apéndice:** AT3 - Especificaciones Generales  
**Estado:** ✅ **v5.0 - COHERENCIA TÉCNICA VERIFICADA**

---

## ⚖️ VALIDACIÓN FORENSE CRUZADA FINAL (06-Feb-2026)
**Auditor:** Administrador Contractual EPC
**Dictamen:** 🚨 **DICTAMEN DE DEFINICIÓN TECNOLÓGICA (FRA/PTC MANDATORIO)**

Este documento es la pieza clave que resuelve la "Indefinición Tecnológica" histórica. El AT3 Original (PDF) es una "bolsa de normas" genérica (AREMA, FRA, UIC) que no definía arquitectura. Esta versión v5.0 toma la Decisión Técnica (DT) mandatoria pro-PTC.

### 📉 1. RESOLUCIÓN DEL CONFLICTO NORMATIVO (FRA vs. UIC)
Se jerarquiza la normativa para evitar conflictos durante el diseño de detalle de Ardanuy:

| Elemento | Fuente PDF Original (AT3) | Requisito AT1 (Alcance) | Decisión v5.0 (Punto 42) |
| :--- | :--- | :--- | :--- |
| **Norma Rectora** | Genérica (AREMA, UIC, FRA). | FRA 49 CFR Part 236 Sub. I. | **FRA 236 MANDATORIO.** |
| **Lógica Control** | No definida. | PTC (Positive Train Control). | **PTC / I-ETMS.** |
| **Enclavamientos** | Normas ADIF (NAS 819). | Cantonamiento Virtual. | **Virtual Interlocking.** |
| **Ciberseguridad** | Referencia general. | No explicada. | **NIST / IEC 62443 SL-3.** |

### 🔍 2. LA ESTRATEGIA "VIRTUAL INTERLOCKING"
Se confirma la eliminación de enclavamientos físicos (ENCE) en estaciones a favor de una lógica de control centralizada en el CCO. 
*   **Justificación:** El requisito de "Cantonamiento Virtual" del AT1 (Tabla 17) prevalece sobre las referencias normativas físicas del AT3 original.
*   **Riesgo:** Requiere "No Objeción" de Interventoría para evitar glosas por "faltantes de obra".

### 🔗 3. INTEROPERABILIDAD FENOCO (DOBLE RADIO)
Para cumplir con la interoperabilidad obligatoria (Cl. 12.3), se especifica:
*   **Configuración:** Doble radio de datos y voz en cada locomotora.
*   **Protocolo:** Gateway API en CCO para intercambio de Mensajes de Autorización de Movimiento (MA).

### 🚀 INSTRUCCIONES REFORZADAS AL EQUIPO
1.  **Alineación Ardanuy:** Instrucción inmediata de basar el diseño Fase III en **FRA 49 CFR Part 236** y no en lógica UIC/ETCS.
2.  **Especificación Loco (Compras):** Las 15 locomotoras deben venir con **On-Board Unit (OBU)** compatible con PTC/FRA. Prohibido comprar estándar europeo puro sin adaptador certificado.
3.  **Hold Point Señalización:** Congelar cualquier diseño de postes, señales laterales o redes de cobre asociadas a señales físicas.

### ✅ VEREDICTO FINAL
**Estado:** **APROBADO PARA DISEÑO Y COMPRAS DE TECNOLOGÍA.**
Este documento desbloquea el proyecto al definir la arquitectura digital única.

---

⚠️ **ADVERTENCIA LEGAL**
> **📋 Esta información es únicamente de carácter informativo. Se recomienda su revisión y validación por el equipo jurídico del proyecto antes de ser utilizada formalmente.**

---

*Nota: Este documento refleja la decisión técnica experta v5.0 y reemplaza cualquier listado normativo previo que contradiga la arquitectura PTC.*
