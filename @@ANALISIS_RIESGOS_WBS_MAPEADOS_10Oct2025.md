# ANÁLISIS: RIESGOS MAPEADOS EN WBS vs RESUMEN PMO
**Proyecto:** APP La Dorada - Chiriguaná  
**Fecha:** 10 de Octubre 2025  
**Responsable:** PMO / Gestión de Riesgos  

---

## 🔍 **DISCREPANCIA DETECTADA**

### **❌ RESUMEN PMO (@@RESUMEN_PMO_RIESGOS_REALES_VALIDADOS_09Oct2025.md):**
- **Total riesgos reportados:** 9 riesgos
- **Fecha:** 9 de Octubre 2025
- **Estado:** ⚠️ **DESACTUALIZADO**

### **✅ WBS DE RIESGOS (riesgos_wbs.json):**
- **Total riesgos mapeados:** **17 riesgos** ✅
- **Fecha actualización:** 9 de Octubre 2025
- **Estado:** ✅ **ACTUALIZADO Y COMPLETO**

### **✅ MATRIZ PMO AMPLIADA (MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md):**
- **Total riesgos documentados:** 15+ riesgos
- **Estado:** ✅ **ACTUALIZADO**

---

## 📊 **COMPARACIÓN DETALLADA**

### **RIESGOS QUE ESTÁN EN WBS PERO NO EN RESUMEN PMO:**

| ID | Descripción | Nivel Exposición | ¿En Resumen? | ¿En WBS? |
|:--:|:------------|:---------------:|:------------:|:--------:|
| **R-GES-004** | Desfase aprobación diseños vs Plan Obras | MEDIA | ❌ NO | ✅ SÍ |
| **R-CON-001** | Ambigüedad medición disponibilidad PAN 100% | MEDIA | ❌ NO | ✅ SÍ |
| **R-OPE-001** | Falla conmutación failover redundantes | MEDIA | ❌ NO | ✅ SÍ |
| **R-CAL-001** | Calidad materiales no cumple estándares | MEDIA | ❌ NO | ✅ SÍ |
| **R-ITCS-001** | Indefinición ITCS (BLOCKER-001) | CRÍTICA | ❌ NO | ✅ SÍ |
| **R-FENOCO-001** | Protocolos FENOCO (BLOCKER-002) | CRÍTICA | ❌ NO | ✅ SÍ |
| **R-PAN-001** | Cantidades PAN indefinidas (BLOCKER-003) | BAJA | ❌ NO | ✅ SÍ |
| **R-MR-001** | Cronograma MR indefinido (BLOCKER-004) | BAJA | ❌ NO | ✅ SÍ |

**Total faltantes en Resumen:** 8 riesgos

---

## ✅ **ESTADO REAL DE RIESGOS EN WBS (17 TOTAL)**

### **🔴 CRÍTICA (3 riesgos):**
| ID | Descripción | Items WBS | Fuente |
|:--:|:------------|:----------|:-------|
| **R-FIBRA-001** | Lead time crítico fibra 9m | 2.3.100, 2.3.103 | DT-FIBRA-003 |
| **R-ITCS-001** | Indefinición ITCS (ATP/ETCS L2/CBTC) | - | BLOCKER-001 |
| **R-FENOCO-001** | Protocolos propietarios FENOCO | - | BLOCKER-002 |

### **🟠 ALTA (2 riesgos):**
| ID | Descripción | Items WBS | Fuente |
|:--:|:------------|:----------|:-------|
| **R-AT3-01** | Dependencia AT3 para ITCS ETCS L2 | - | P42 / Docs ITCS |
| **R-IF-01** | Desalineación en interfaces (ICD) | - | 41. Interfaces |

### **🟡 MEDIA (9 riesgos):**
| ID | Descripción | Items WBS | Fuente |
|:--:|:------------|:----------|:-------|
| **R-INT-01** | Interoperabilidad FENOCO (UIC) | - | P42 / Interfaces |
| **R-AT4-01** | Cumplimiento disponibilidad AT4 | - | AT4 / P42 |
| **R-CYB-01** | Ciberseguridad IEC 62443 | - | VII.2.11 |
| **R-PERM-01** | Retrasos permisos ANE/ANLA | - | 40. Permisos |
| **R-FM-001** | Fuerza Mayor (huelgas, FENOCO) | - | Contrato |
| **R-GES-004** | Desfase aprobación diseños | - | A.1 Análisis |
| **R-CON-001** | Ambigüedad medición PAN 100% | - | A.2 Análisis |
| **R-OPE-001** | Falla conmutación failover | - | A.2 Análisis |
| **R-CAL-001** | Calidad materiales/mano obra | - | A.3 Análisis |

### **🟢 BAJA (3 riesgos):**
| ID | Descripción | Items WBS | Fuente |
|:--:|:------------|:----------|:-------|
| **R-PAN-001** | Cantidades PAN indefinidas | - | BLOCKER-003 |
| **R-MR-001** | Cronograma MR indefinido | - | BLOCKER-004 |
| **R-FIBRA-006** | Ahorro CAPEX no realizado | 2.3.100, 2.3.103 | DT-FIBRA-001 |

---

## 📈 **ESTADÍSTICAS WBS DE RIESGOS**

```json
{
    "total_riesgos": 17,
    "riesgos_vinculados_wbs": 2,
    "exposicion_critica": 3,
    "exposicion_alta": 2,
    "exposicion_media": 9,
    "exposicion_baja": 3
}
```

### **Distribución HTML (WBS_Analisis_Riesgos.html):**
- ✅ **5 Altos** (3 CRÍTICA + 2 ALTA)
- ✅ **9 Medios**
- ✅ **3 Bajos**
- **TOTAL: 17 riesgos** ✅

---

## 🔗 **RIESGOS VINCULADOS A ITEMS WBS**

**Solo 2 riesgos** tienen vinculación directa a ítems WBS específicos:

| Riesgo | Items WBS | Descripción |
|:------:|:----------|:------------|
| **R-FIBRA-001** | 2.3.100, 2.3.103 | Lead time crítico fibra 9m |
| **R-FIBRA-006** | 2.3.100, 2.3.103 | Ahorro CAPEX no realizado |

**Items WBS afectados:**
- **2.3.100:** Fibra óptica monomodo G.652D
- **2.3.103:** Cajas de empalme 80x80 cm

---

## 🎯 **CAMPOS CLAVE EN MATRIZ PMO AMPLIADA**

Cada riesgo incluye:

| Campo | Descripción | Ejemplo |
|:------|:------------|:--------|
| **ID** | Identificador único | R-FIBRA-001 |
| **Categoría** | Tipo de riesgo | Técnico/Contractual/Gestión |
| **Nivel Exposición** | Criticidad | CRÍTICA/ALTA/MEDIA/BAJA |
| **Items WBS** | Vinculación WBS | ["2.3.100", "2.3.103"] |
| **Origen_Decisión** | DT que generó riesgo | DT-FIBRA-003 |
| **Hito_Verificación** | Cuándo se verifica | H-FIBRA-005 |
| **Estrategia** | Cómo se maneja | EVITAR/MITIGAR/ACEPTAR |

---

## ⚠️ **PROBLEMA IDENTIFICADO: ENCODING**

**Líneas 133 y 253 de riesgos_wbs.json:**

```json
"nivel_exposicion": "CRÃTICA"  // ❌ INCORRECTO (con Ã)
```

**Debería ser:**
```json
"nivel_exposicion": "CRÍTICA"  // ✅ CORRECTO (con Í)
```

**Impacto:** HTML puede no mostrar correctamente riesgos CRÍTICOS.

**Solución aplicada en v14.6:**
```javascript
r.nivel_exposicion === 'CRITICA' || r.nivel_exposicion === 'CRÍTICA'
```

---

## ✅ **CONCLUSIÓN**

### **ESTADO REAL:**
- ✅ **SÍ, los riesgos ESTÁN mapeados** en WBS de Riesgos
- ✅ **17 riesgos totales** (no solo 9)
- ✅ **WBS actualizada al 9-Oct-2025**
- ✅ **HTML muestra correctamente** 5 Altos + 9 Medios + 3 Bajos = 17 total

### **PROBLEMA:**
- ⚠️ **Resumen PMO desactualizado** (muestra solo 9 de 17)
- ⚠️ Faltaban 8 riesgos en el resumen (incluidos los 4 BLOCKERS)

### **ACCIÓN REQUERIDA:**
1. ✅ **Actualizar Resumen PMO** con los 17 riesgos reales
2. ✅ **Corregir encoding** CRÃTICA → CRÍTICA en JSON
3. ✅ **Validar HTML** muestra todos los riesgos correctamente

---

## 📁 **ARCHIVOS VALIDADOS:**

| Archivo | Riesgos | Estado |
|:--------|:-------:|:------:|
| `IX/riesgos_wbs.json` | 17 | ✅ COMPLETO |
| `IX/riesgos_wbs.js` | 17 | ✅ COMPLETO |
| `VIII/MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md` | 15+ | ✅ COMPLETO |
| `IX/WBS_Analisis_Riesgos.html` | 17 | ✅ COMPLETO |
| `@@RESUMEN_PMO_RIESGOS_REALES_VALIDADOS_09Oct2025.md` | 9 | ❌ DESACTUALIZADO |

---

**Recomendación:** Usar `riesgos_wbs.json` como fuente única de verdad (17 riesgos).

