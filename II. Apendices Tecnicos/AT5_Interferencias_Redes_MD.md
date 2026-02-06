# APÉNDICE TÉCNICO 5 - INTERFERENCIAS DE REDES (v5.0)
## APP La Dorada - Chiriguaná

**Fecha de actualización:** 06 de febrero de 2026  
**Proyecto:** APP La Dorada - Chiriguaná  
**Contrato:** Concesión No. 001 de 2025  
**Apéndice:** AT5 - Interferencias de Redes  
**Estado:** ✅ **v5.0 - COHERENCIA TÉCNICA VERIFICADA**

---

## ⚖️ VALIDACIÓN FORENSE CRUZADA FINAL (06-Feb-2026)
**Auditor:** Administrador Contractual EPC
**Dictamen:** 🚨 **DICTAMEN DE VALIDACIÓN: ESTRATEGIA DUAL (PROTECCIÓN DE ALCANCE)**

He realizado la validación forense del AT5 contrastando el **PDF Oficial [Source 277-294]** con la Metodología Punto 42. Se establece una **Estrategia Dual** obligatoria para evitar el "Scope Creep" contractual.

### 📄 1. ANÁLISIS DE BRECHAS: MD (v5.0) vs. PDF ORIGINAL
| Requisito Técnico | Apéndice 5 (PDF Oficial) | Versión MEJORADO (MD v5.0) |
| :--- | :--- | :--- |
| **Definición Interferencia** | Amenaza integridad física o servicio. | Física + **EMI (Electromagnética)**. |
| **Profundidad bajo riel** | Mínimo 1.80 m (Sección 4.1). | 1.80 m + **Blindaje EMI**. |
| **Hidrocarburos** | API 1102 / NIO-0901. | API 1102 + QRA (Riesgo). |
| **Ciberseguridad** | No mencionada. | **NIST / IEC 62443 SL-3**. |

### 🛡️ 2. LA ESTRATEGIA DUAL (REGLA DE ORO)
1.  **Terceros (External):** La negociación con empresas de servicios públicos (ESP) se rige **estrictamente por el PDF**. Solo se exige cumplimiento físico (Profundidad, Distancia). No se exige blindaje EMI a terceros para evitar cobros por mejora tecnológica.
2.  **Activos EPC (Internal):** Para la red propia de fibra y energía del PTC, se exige el **estándar MD v5.0**. Inmunidad EMI, Ciberseguridad industrial y Redundancia N+1 son obligatorios para proteger el indicador AT4 (99.95%).

### 🚀 3. INSTRUCCIONES REFORZADAS AL EQUIPO
*   **Inventario Enriquecido:** El inventario de redes (Sección 3.2.2 PDF) debe incluir obligatoriamente el campo **"Nivel de Tensión (kV) / Amperaje"**. Sin este dato, el equipo de sistemas no puede diseñar el blindaje EMI necesario.
*   **Gestión de Silencios (Día 30):** Si una ESP no responde en 30 días, se debe radicar comunicación a la ANI/Interventoría activando la **Sección 16.5 (Evento Eximente)** para proteger el cronograma.
*   **Inmunidad de Diseño:** No confiar en que la ESP moverá su red por ruido eléctrico. El diseño de sistemas debe ser inmune per se (Fibra ADSS/Dieléctrica).

### ✅ VEREDICTO FINAL
**Estado:** **APROBADO COMO BASE TÉCNICA DE GESTIÓNDE RIESGOS.**

---

⚠️ **ADVERTENCIA LEGAL**
> **📋 Esta información es únicamente de carácter informativo. Se recomienda su revisión y validación por el equipo jurídico del proyecto antes de ser utilizada formalmente.**

---

*Nota: Este documento refleja la decisión técnica experta v5.0 y protege al EPC contra reclamaciones de alcance por traslados no previstos.*
