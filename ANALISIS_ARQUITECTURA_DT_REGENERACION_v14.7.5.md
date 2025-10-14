# 🔍 ANÁLISIS ARQUITECTURA: Flujo DT → Regeneración WBS

**Fecha:** 14 de Octubre 2025  
**Pregunta crítica del usuario:** *"Si creo un DT con cajas a 400m, ¿qué pasa con la WBS? ¿No estás hardcodeando y creando un problema que la próxima DT va a romper?"*

---

## ❓ **LA PREGUNTA CLAVE**

**Ejemplo:** Usuario crea `DT-FIBRA-XXX` cambiando cajas de **300m → 400m**

**¿Qué debería pasar?**
1. Script lee la DT
2. Recalcula: 520.78 km ÷ 400m = **1,302 cajas** (antes 1,735)
3. Actualiza `WBS_Presupuestal_v2.0.md`
4. **Regenera `datos_wbs_TODOS_items.js`** ← ❓ ¿Esto pasa?
5. WBS_COMPLETA_TODO_Interactiva_v4.0.html carga los nuevos datos

**Si el paso 4 no pasa → El fix es TEMPORAL y se romperá**

---

## 🔍 **ANÁLISIS DEL FLUJO ACTUAL**

### **PASO 1: Flujo de ejecución DT (Desde `.cursorrules` y `cocinar.ps1`)**

```
1. Usuario crea: DT-FIBRA-XXX.md (cajas 400m)
   ↓
2. Guarda en: II. Apendices Tecnicos/Decisiones_Tecnicas/
   ↓
3. PMO ejecuta: .\scripts\servir_ingenieria_completo.ps1 -Sistema 02
   ↓
4. cocinar.ps1 detecta: impacto_layout: true
   ↓
5. Ejecuta script especializado: regenerar_fibra_1824_cajas.ps1
   ↓
6. Script regenera:
   - layout.md ✅
   - layout_datos.js ✅
   - PERO... ¿datos_wbs_TODOS_items.js? ❓
```

### **PASO 2: ¿Quién regenera `datos_wbs_TODOS_items.js`?**

**Scripts encontrados que regeneran el archivo:**

| Script | Qué hace | Cuándo se ejecuta |
|:-------|:---------|:------------------|
| `extraer_todos_items_wbs.ps1` | Lee `WBS_Presupuestal_v2.0.md` → Genera JSON | ❓ Manual? |
| `sincronizar_TODO.ps1` (legacy) | JSON → Convierte a JS | ❓ Manual? |
| `sincronizar_desde_excel.ps1` | Desde Excel → Actualiza JS | ❓ No en flujo DT |

**🔴 PROBLEMA DETECTADO:**
```
scripts/regenerar_fibra_1824_cajas.ps1:
  ✅ Actualiza layout.md
  ✅ Actualiza layout_datos.js
  ❌ NO actualiza WBS_Presupuestal_v2.0.md
  ❌ NO ejecuta extraer_todos_items_wbs.ps1
  ❌ NO regenera datos_wbs_TODOS_items.js
```

---

## 🔴 **DIAGNÓSTICO: HAY UN GAP ARQUITECTÓNICO**

### **El flujo ACTUAL (incompleto):**

```
DT-FIBRA (cajas 400m)
  ↓
regenerar_fibra_1824_cajas.ps1
  ├─ ✅ Actualiza: layout.md (1,302 cajas)
  ├─ ✅ Actualiza: layout_datos.js
  └─ ❌ FALTA: Actualizar WBS_Presupuestal_v2.0.md
           ↓
        ❌ FALTA: Ejecutar extraer_todos_items_wbs.ps1
           ↓
        ❌ FALTA: Regenerar datos_wbs_TODOS_items.js
```

**Consecuencia:**
- Layout muestra 1,302 cajas ✅
- WBS sigue mostrando 1,735 cajas ❌
- **INCONSISTENCIA ENTRE LAYOUT Y WBS**

### **El flujo CORRECTO (debería ser):**

```
DT-FIBRA (cajas 400m)
  ↓
1. regenerar_fibra_1824_cajas.ps1
   ├─ Recalcula cantidades: 520.78÷400 = 1,302
   ├─ Actualiza layout.md
   ├─ Actualiza layout_datos.js
   └─ 🆕 Actualiza WBS_Presupuestal_v2.0.md item 2.3.103
       ↓
2. 🆕 extraer_todos_items_wbs.ps1 (AUTO)
   ├─ Lee WBS_Presupuestal_v2.0.md actualizado
   ├─ Extrae 159 ítems (con cantidad nueva: 1,302)
   ├─ Genera datos_wbs_TODOS_items.json
   └─ Convierte a datos_wbs_TODOS_items.js
       ↓
3. Todas las interfaces cargan datos nuevos ✅
```

---

## ✅ **SOLUCIÓN PROPUESTA**

### **Opción A: Fix Estructural (Recomendado)**

Modificar `regenerar_fibra_1824_cajas.ps1` para que:

1. **Actualice WBS_Presupuestal_v2.0.md:**
   ```powershell
   # Buscar línea del item 2.3.103
   $wbsContent = Get-Content "WBS_Presupuestal_v2.0.md" -Raw
   $wbsContent -replace '(\| \*\*2\.3\.103\*\* \|[^\|]+\| )\d+([ \|])', "`${1}$cantidadNueva`${2}"
   Set-Content "WBS_Presupuestal_v2.0.md" -Value $wbsContent
   ```

2. **Ejecutar regeneración automática:**
   ```powershell
   # Al final del script regenerar_fibra_1824_cajas.ps1
   & "$PSScriptRoot\extraer_todos_items_wbs.ps1"
   ```

### **Opción B: Sincronización Post-DT (Alternativa)**

Agregar en `cocinar.ps1` después de ejecutar scripts especializados:

```powershell
# Después de línea 127
Write-Host "  Regenerando WBS..." -ForegroundColor Gray
& "$PSScriptRoot\extraer_todos_items_wbs.ps1" 2>&1 | Out-Null
Write-Host "  WBS regenerado" -ForegroundColor Green
```

### **Opción C: Script Unificado (Más limpio)**

Crear `actualizar_WBS_desde_DT.ps1`:

```powershell
# Actualizar_WBS_desde_DT.ps1
param(
    [string]$ItemWBS,      # ej: "2.3.103"
    [string]$NuevaCantidad # ej: "1302"
)

# 1. Actualizar WBS_Presupuestal_v2.0.md
# 2. Regenerar datos_wbs_TODOS_items.json
# 3. Convertir a .js con ambos nombres (wbsDataGlobal + datos_wbs)
```

---

## 🎯 **RESPUESTA A LA PREGUNTA**

### **¿El fix actual es temporal?**

**SÍ Y NO:**

✅ **Fix de nombres de variables es ESTRUCTURAL:**
- Exportar `window.wbsDataGlobal = window.datos_wbs = {...}` es correcto
- Resuelve compatibilidad entre todas las interfaces
- **NO se romperá** con futuras DTs

❌ **PERO hay un GAP en el flujo de regeneración:**
- Scripts de DTs (como `regenerar_fibra_1824_cajas.ps1`) **NO actualizan WBS_Presupuestal_v2.0.md**
- Por ende, **NO se ejecuta** `extraer_todos_items_wbs.ps1`
- **Resultado:** Layout y WBS quedan DESINCRONIZADOS

### **¿Qué pasa si ejecutas DT-FIBRA (cajas 400m) HOY?**

**Resultado ACTUAL (con el gap):**
```
Layout: 1,302 cajas ✅ (actualizado)
WBS:    1,735 cajas ❌ (sin actualizar)
```

**Resultado ESPERADO (con fix completo):**
```
Layout: 1,302 cajas ✅
WBS:    1,302 cajas ✅
```

---

## 📋 **RECOMENDACIÓN ACCIÓN INMEDIATA**

### **PRIORIDAD ALTA:**

1. **Modificar `regenerar_fibra_1824_cajas.ps1`:**
   - Agregar actualización de `WBS_Presupuestal_v2.0.md`
   - Llamar `extraer_todos_items_wbs.ps1` al final

2. **Crear script unificado `sync_wbs_post_dt.ps1`:**
   - Que se llame automáticamente después de cualquier script especializado
   - Garantice regeneración de `datos_wbs_TODOS_items.js`

3. **Documentar convención:**
   - Todos los scripts especializados deben actualizar WBS_Presupuestal_v2.0.md
   - O llamar script de sincronización al final

---

## 🔄 **FLUJO IDEAL COMPLETO (v14.7.6)**

```
1. Usuario crea DT-FIBRA (cajas 400m)
   ↓
2. PMO ejecuta: servir_ingenieria_completo.ps1 -Sistema 02
   ↓
3. cocinar.ps1 detecta impacto_layout: true
   ↓
4. Ejecuta: regenerar_fibra_1824_cajas.ps1
   ├─ Recalcula: 1,302 cajas
   ├─ Actualiza layout.md
   ├─ Actualiza layout_datos.js
   ├─ 🆕 Actualiza WBS_Presupuestal_v2.0.md (item 2.3.103 → 1,302)
   └─ 🆕 Ejecuta extraer_todos_items_wbs.ps1
       ├─ Lee WBS actualizado
       ├─ Genera datos_wbs_TODOS_items.json (159 ítems)
       └─ Genera datos_wbs_TODOS_items.js con:
           window.wbsDataGlobal = window.datos_wbs = {...}
   ↓
5. Consolida ingeniería (cocinar)
   ↓
6. Genera entregables (servir)
   ↓
7. TODAS las interfaces cargan datos correctos:
   ├─ WBS_COMPLETA_TODO_Interactiva_v4.0.html → 1,302 ✅
   ├─ WBS_Layout_Maestro.html → 1,302 ✅
   └─ WBS_Presupuesto_SCC_APP... → 1,302 ✅
```

---

## ✅ **CONCLUSIÓN**

| Aspecto | Estado | Acción |
|:--------|:-------|:-------|
| **Fix nombres variables** | ✅ Correcto | Mantener como está |
| **Flujo regeneración** | ❌ Incompleto | Requiere mejora |
| **Gap WBS ↔ Layout** | 🔴 Crítico | Fix en v14.7.6 |
| **Hardcoding** | 🟡 Parcial | Datos vienen de WBS, pero falta auto-regeneración |

**El fix de hoy resolvió el problema de carga inmediato, pero IDENTIFICAMOS un gap arquitectónico más profundo que debe resolverse.**

---

**Próximo paso sugerido:** Implementar Opción A o B para cerrar el ciclo de regeneración completo.

