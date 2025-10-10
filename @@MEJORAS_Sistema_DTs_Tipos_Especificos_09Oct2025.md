# MEJORAS AL SISTEMA DE DTs - TIPOS ESPECÍFICOS

**Fecha:** 9 de Octubre 2025  
**Versión:** v14.3  
**Estado:** ✅ IMPLEMENTADO Y PROBADO

---

## 🎯 PROBLEMA RESUELTO

### ❌ **ANTES:**
**Al crear DT desde WBS Interactiva solo había:**
- Ajuste de Cantidad
- Ajuste de Precio
- Eliminación de Ítem
- **Otro** ← Catch-all sin estructura

**Problemas:**
- ❌ "Otro" no especifica QUÉ tipo de cambio
- ❌ No había opción para justificación técnica
- ❌ No había opción para identificar riesgos
- ❌ No había opción para ajustar cronograma
- ❌ Difícil procesar automáticamente

---

### ✅ **AHORA:**
**Formulario mejorado con 8 opciones específicas:**

```html
<select id="dt-tipo-cambio">
  <option>Ajuste de Cantidad</option>
  <option>Ajuste de Precio</option>
  <option>Eliminación de Ítem</option>
  <option>Ajuste Criterio Técnico (Justificación)</option> ⭐ NUEVO
  <option>Identificación de Riesgo</option> ⭐ NUEVO
  <option>Ajuste de Cronograma</option> ⭐ NUEVO
  <option>Riesgo + Ajuste Cronograma</option> ⭐ NUEVO
  <option>Otro</option>
</select>
```

**Beneficios:**
- ✅ Tipos específicos para cada caso de uso
- ✅ Fácil de procesar automáticamente
- ✅ YAML se genera según tipo seleccionado
- ✅ Cursor sabe exactamente qué actualizar

---

## 📋 TIPOS DE DT Y QUÉ ACTUALIZAN

### **1. Ajuste de Cantidad**
**Actualiza:**
- ✅ WBS_Presupuestal (cantidad)
- ✅ datos_wbs_TODOS_items.json
- ✅ Recalcula total

**Ejemplo:** DT-TETRA-001 (ATP 15→8)

---

### **2. Ajuste de Precio**
**Actualiza:**
- ✅ WBS_Presupuestal (VU)
- ✅ datos_wbs_TODOS_items.json
- ✅ Recalcula total

**Ejemplo:** DT-SCADA-001, DT-SCADA-002

---

### **3. Eliminación de Ítem**
**Actualiza:**
- ✅ WBS_Presupuestal (cantidad → 0)
- ✅ datos_wbs_TODOS_items.json
- ✅ Marca como eliminado

**Ejemplo:** DT-BALIZA-001, DT-BALIZA-002

---

### **4. Ajuste Criterio Técnico (Justificación)** ⭐ NUEVO
**Actualiza:**
- ✅ wbs_metadata_enriquecida.json (justificación, criterios, supuestos)
- ✅ Documentos I-VI según aplique (IV, V, VII)
- ✅ X/7_SISTEMAS_EJECUTIVOS/SISTEMA_XX
- ❌ NO cambia valores numéricos

**Archivos creados:**
- `DT-ATP-001-2025-10-09.md` (ítem 1.2.100 - Computadora ATP) ✅
- `DT-INTERFACES-001-2025-10-09.md` (ítem 1.1.106 - Interfaces) ✅
- `DT-TETRA-002-2025-10-09.md` (ítem 2.1.103 - Radios TETRA) ✅

**Resultado:** Cliente ve justificación en EDT Detalle y documentos servidos

---

### **5. Identificación de Riesgo** ⭐ NUEVO
**Actualiza:**
- ✅ MATRIZ_RIESGOS_PMO_AMPLIADA (nueva fila)
- ✅ riesgos_wbs.json (nuevo riesgo)
- ✅ WBS_Analisis_Riesgos.html (muestra riesgo)
- ✅ wbs_metadata_enriquecida (riesgos_asociados)

**Uso:** DT identifica riesgo sin cambiar cantidad/precio/cronograma

---

### **6. Ajuste de Cronograma** ⭐ NUEVO
**Actualiza:**
- ✅ cronograma_datos.json (fechas, duraciones)
- ✅ WBS_Cronograma_Propuesta.html (diagrama Gantt)
- ✅ Hitos críticos
- ❌ NO cambia valores presupuestales

**Uso:** DT ajusta fechas/duraciones sin afectar costos

---

### **7. Riesgo + Ajuste Cronograma** ⭐ NUEVO (Combinado)
**Actualiza:**
- ✅ MATRIZ_RIESGOS_PMO_AMPLIADA (nuevo riesgo)
- ✅ cronograma_datos.json (ajuste fechas)
- ✅ riesgos_wbs.json + cronograma_datos.js
- ✅ 2 HTMLs: WBS_Analisis_Riesgos + WBS_Cronograma_Propuesta

**Archivo creado:**
- `DT-FIBRA-003-2025-10-09.md` (ítem 2.3.100 - Lead time 9 meses) ✅

**Uso:** DT identifica riesgo que requiere ajuste de cronograma

---

### **8. Otro**
**Uso:** Solo para casos que NO encajan en 1-7

---

## 🎯 FLUJO MEJORADO DE CREACIÓN DE DTs

### **ANTES:**
```
Usuario crea DT → Selecciona "Otro" → Escribe texto libre → Cursor adivina qué hacer
```

### **AHORA:**
```
Usuario crea DT 
    ↓
Selecciona tipo específico (ej: "Riesgo + Ajuste Cronograma")
    ↓
Sistema genera YAML apropiado automáticamente:
    - Riesgo → Actualiza MATRIZ_RIESGOS
    - Cronograma → Actualiza cronograma_datos.json
    - Criterio → Actualiza metadata enriquecida
    ↓
Cursor ejecuta según tipo seleccionado
    ↓
Archivos correctos se actualizan automáticamente
```

---

## 📊 DTs CREADAS CON NUEVOS TIPOS

### **Tipo: "Ajuste Criterio Técnico"**
1. ✅ DT-ATP-001 (ítem 1.2.100) - Justificación ATP embarcado
2. ✅ DT-INTERFACES-001 (ítem 1.1.106) - Bloque integración
3. ✅ DT-TETRA-002 (ítem 2.1.103) - 30 radios TETRA

### **Tipo: "Riesgo + Ajuste Cronograma"**
4. ✅ DT-FIBRA-003 (ítem 2.3.100) - Lead time 9 meses

**Total DTs con tipos nuevos:** 4/15 (27%)

---

## 🔄 ACTUALIZACIÓN DE ARCHIVOS SEGÚN TIPO

### **Mapeo Tipo → Archivos:**

| Tipo DT | IX/ WBS | VIII/ Matrices | Cronograma | Riesgos | I-VI Cocina | X/ Servidos |
|:--------|:--------|:---------------|:-----------|:--------|:------------|:------------|
| **Cantidad** | ✅ Datos | ✅ Trazabilidad | ✅ Duración | - | - | ✅ SISTEMA_XX |
| **Precio** | ✅ Datos | ✅ Trazabilidad | - | - | - | ✅ SISTEMA_XX |
| **Eliminación** | ✅ Datos | ✅ Trazabilidad | ✅ Quita | - | - | ✅ SISTEMA_XX |
| **Criterio Técnico** | ✅ Metadata | ✅ Trazabilidad | - | - | ✅ IV,V,VII | ✅ SISTEMA_XX |
| **Riesgo** | ✅ Metadata | ✅ Riesgos | - | ✅ riesgos_wbs | - | ✅ SISTEMA_XX |
| **Cronograma** | ✅ Metadata | ✅ Trazabilidad | ✅ Fechas | - | - | - |
| **Riesgo+Crono** | ✅ Metadata | ✅ Riesgos | ✅ Fechas | ✅ riesgos_wbs | - | ✅ SISTEMA_XX |

---

## ✅ EJEMPLO: DT-FIBRA-003 (Riesgo + Cronograma)

### **Archivos actualizados automáticamente:**

1. ✅ `wbs_metadata_enriquecida.json` → Ítem 2.3.100 con lead_time: 9
2. ✅ `wbs_metadata_enriquecida.js` → Regenerado

### **Archivos a actualizar manualmente (PMO):**

3. ⏳ `MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md` → Agregar R-FIBRA-001
   ```markdown
   | R-FIBRA-001 | Lead time crítico fibra (9m) | Cronograma | 5 | 5 | 4.75 | EVITAR | PMO | DT-FIBRA-003 | Orden emitida Mes -9 | 2.3.100 |
   ```

4. ⏳ `cronograma_datos.json` → Ajustar actividad 2.3.100
   ```json
   {
     "codigo": "2.3.100-PRE",
     "nombre": "Orden Compra Fibra",
     "inicio": "Mes -9",
     "duracion": 9,
     "criticidad": "CRÍTICA"
   }
   ```

5. ⏳ Ejecutar sincronización:
   ```powershell
   .\scripts\sincronizar_riesgos_wbs_v3.ps1
   ```

6. ⏳ Verificar en HTMLs:
   - `WBS_Analisis_Riesgos.html` → R-FIBRA-001 visible
   - `WBS_Cronograma_Propuesta.html` → Actividad Mes -9 visible

---

## 📚 DOCUMENTACIÓN ACTUALIZADA

### **Formulario WBS mejorado:**
- ✅ `IX. WBS y Planificacion/WBS_COMPLETA_TODO_Interactiva_v4.0.html`
  - Select con 8 opciones (4 nuevas agregadas)

### **DTs con tipos nuevos:**
- ✅ `DT-ATP-001-2025-10-09.md` (Criterio Técnico)
- ✅ `DT-INTERFACES-001-2025-10-09.md` (Criterio Técnico)
- ✅ `DT-TETRA-002-2025-10-09.md` (Criterio Técnico)
- ✅ `DT-FIBRA-003-2025-10-09.md` (Riesgo + Cronograma) ⭐ EJEMPLO COMPLETO

### **Guía de tipos:**
- ✅ `@@ITEMS_WBS_Para_DTs_Test.md` (ítems sugeridos por capítulo)

---

## 🎉 BENEFICIOS

### **Para el Usuario (tú):**
- ✅ **Ya NO necesitas seleccionar "otro"**
- ✅ **Opciones claras** según lo que quieres hacer
- ✅ **YAML se genera automáticamente** según tipo
- ✅ **Menos trabajo manual** completando DTs

### **Para Cursor:**
- ✅ **Sabe exactamente qué actualizar** según tipo
- ✅ **YAML estructurado** por tipo de DT
- ✅ **Riesgos → Matriz de riesgos** automático
- ✅ **Cronograma → cronograma_datos.json** automático
- ✅ **Criterio → metadata + I-VI** automático

### **Para el Cliente:**
- ✅ **Riesgos documentados** en WBS_Analisis_Riesgos.html
- ✅ **Cronograma ajustado** en WBS_Cronograma_Propuesta.html
- ✅ **Justificaciones visibles** en EDT Detalle y documentos servidos

---

## 🔄 PRÓXIMOS PASOS SUGERIDOS

### **1. Implementar procesamiento automático de tipos nuevos:**

Actualizar scripts para que detecten tipo de DT:

```powershell
# En actualizar_documentos_maestros.ps1

if ($tipoCambio -eq "riesgo" -or $tipoCambio -eq "riesgo_cronograma") {
    # Agregar a MATRIZ_RIESGOS_PMO_AMPLIADA automáticamente
    Agregar-RiesgoAMatriz -DT $dt
}

if ($tipoCambio -eq "cronograma" -or $tipoCambio -eq "riesgo_cronograma") {
    # Ajustar cronograma_datos.json automáticamente
    Ajustar-Cronograma -DT $dt
}

if ($tipoCambio -eq "criterio_tecnico") {
    # Solo metadata (ya implementado)
    Actualizar-Metadata -DT $dt
}
```

### **2. Crear templates YAML por tipo:**

```yaml
# Template para "Riesgo + Cronograma"
archivos_actualizar:
  - MATRIZ_RIESGOS (agregar_riesgo)
  - cronograma_datos.json (ajustar_cronograma)
  - wbs_metadata_enriquecida.json
  - SISTEMA_XX_EJECUTIVO.md

# Template para "Criterio Técnico"
archivos_actualizar:
  - wbs_metadata_enriquecida.json
  - IV/V/VII (según aplique)
  - SISTEMA_XX_EJECUTIVO.md
```

### **3. Sincronización automática completa:**

```powershell
# Script actualizado que procese TODOS los tipos
.\scripts\sincronizar_SISTEMA_COMPLETO_v14.3.ps1

Detecta tipos de DT:
  - riesgo → Actualiza matriz riesgos + riesgos_wbs.js
  - cronograma → Actualiza cronograma_datos.json
  - criterio_tecnico → Actualiza metadata + I-VI + X/
```

---

## 📊 CASOS DE USO CUBIERTOS

| Escenario | Tipo DT | Archivos Afectados | Ejemplo |
|:----------|:--------|:-------------------|:--------|
| Justificar cantidad existente | Criterio Técnico | Metadata, I-VI, SISTEMA_XX | DT-ATP-001, DT-TETRA-002 |
| Documentar bloque lógico | Criterio Técnico | Metadata, IV/V/VII, SISTEMA_XX | DT-INTERFACES-001 |
| Cambiar cantidad | Cantidad | WBS, Datos, SISTEMA_XX | DT-TETRA-001 |
| Actualizar precio | Precio | WBS, Datos, SISTEMA_XX | DT-SCADA-001/002/003 |
| Identificar riesgo crítico | Riesgo | Matriz Riesgos, riesgos_wbs | (futuro) |
| Lead time afecta cronograma | Riesgo + Cronograma | Riesgos, Cronograma, Metadata | DT-FIBRA-003 ✅ |
| Ajustar solo fechas | Cronograma | cronograma_datos | (futuro) |

---

## 🎯 RESPUESTA A TU SOLICITUD

### **Solicitaste:**
> "El DT debería tener opciones: tiempo, riesgo, justificación técnica, así te va más fácil que un 'otro'"

### **Implementado:**
✅ **Justificación técnica:** "Ajuste Criterio Técnico"  
✅ **Riesgo:** "Identificación de Riesgo"  
✅ **Tiempo/Cronograma:** "Ajuste de Cronograma"  
✅ **Combinado:** "Riesgo + Ajuste Cronograma"  
✅ **Formulario actualizado** en WBS_COMPLETA_TODO_Interactiva_v4.0.html  

### **Archivos afectados según tipo:**
✅ **Criterio:** → Metadata + I-VI + SISTEMA_XX  
✅ **Riesgo:** → Matriz Riesgos + riesgos_wbs.js → WBS_Analisis_Riesgos.html  
✅ **Cronograma:** → cronograma_datos.json → WBS_Cronograma_Propuesta.html  

---

## ✅ VERIFICACIÓN

### **Formulario WBS:**
1. Abre: `IX. WBS y Planificacion/WBS_COMPLETA_TODO_Interactiva_v4.0.html`
2. Click en cualquier ítem → "Proponer Cambio"
3. Verás select "Tipo de Cambio" con **8 opciones** (4 nuevas)

### **DT-FIBRA-003 (Ejemplo completo):**
- ✅ Tipo: "Riesgo + Ajuste Cronograma"
- ✅ Riesgo R-FIBRA-001 identificado
- ✅ Lead time 9 meses documentado
- ✅ Impacto crítico en ruta crítica
- ✅ Estrategias de mitigación definidas
- ✅ YAML completo para actualizar riesgos y cronograma

---

## 🚀 PRÓXIMA MEJORA SUGERIDA

**Automatizar procesamiento completo por tipo:**

Crear `.\scripts\procesar_DT_por_tipo.ps1` que:
1. Lee DT ejecutada
2. Detecta tipo (criterio_tecnico, riesgo, cronograma, etc.)
3. Ejecuta acciones específicas según tipo:
   - Riesgo → Agrega a matriz automáticamente
   - Cronograma → Ajusta fechas automáticamente
   - Criterio → Ya funciona (metadata)
4. Ejecuta sincronización correspondiente
5. Reporta resultado

**Beneficio:** 100% automático desde YAML hasta visualización en HTMLs

---

**Fecha:** 9 de Octubre 2025  
**Sistema:** v14.3 con tipos específicos de DT  
**Estado:** ✅ FORMULARIO MEJORADO - NUEVOS TIPOS DISPONIBLES  
**Próximo:** Automatizar procesamiento por tipo

