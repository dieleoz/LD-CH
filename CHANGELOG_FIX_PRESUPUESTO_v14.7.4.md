# CHANGELOG v14.7.4 - FIX PRESUPUESTO HTML
**Fecha:** 13 de Octubre 2025  
**Versión:** v14.7.4  
**Tipo:** 🔧 Fix Crítico  
**Estado:** ✅ COMPLETADO

---

## 🎯 PROBLEMA IDENTIFICADO

El presupuesto HTML (`WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguaná.html`) mostraba valores vacíos ("-") en todas las filas de la tabla.

### **CAUSA RAÍZ:**

1. **Datos incompletos en JSON:**
   - `datos_wbs_TODOS_items.json` solo contenía **123 ítems de nivel 3** (1.1.100, 1.2.100, etc.)
   - **Faltaban capítulos (nivel 1)** y **subcapítulos (nivel 2)**
   - HTML esperaba 3 niveles para renderizar correctamente

2. **Valores como strings en HTML:**
   - HTML convertía números a strings formateados: `item.vu_cop.toLocaleString('es-CO')`
   - Al intentar parsear de nuevo: `parseNumber("1.350.000")` → `NaN`
   - Resultado: valores vacíos en tabla

---

## ✅ SOLUCIÓN IMPLEMENTADA

### **FIX 1: Script extrae TODOS los niveles**

**Archivo modificado:** `scripts/extraer_todos_items_wbs.ps1`

**Cambios:**
1. ✅ Agregado código para detectar y guardar **capítulos (nivel 1)**
   - Busca líneas "**TOTAL CAPÍTULO X:**" en el WBS
   - Extrae descripción del capítulo dinámicamente
   - Agrega al array con `codigo: "1"`, `codigo: "2"`, etc.

2. ✅ Ya detectaba **subcapítulos (nivel 2)** correctamente
   - Formato: `#### **1.1 Sistema CTC Virtual**`

3. ✅ Ya detectaba **ítems (nivel 3)** correctamente
   - Formato: `| **1.1.100** | Descripción | Cant | VU | Total |`

**Resultado:**
- JSON ahora tiene **149 ítems totales**:
  - 6 capítulos (nivel 1)
  - 19 subcapítulos (nivel 2)
  - 124 ítems (nivel 3)

### **FIX 2: HTML mantiene valores como números**

**Archivo modificado:** `IX. WBS y Planificacion/WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguaná.html`

**Cambio líneas 454-455:**

**ANTES (incorrecto):**
```javascript
vu: item.vu_cop ? item.vu_cop.toLocaleString('es-CO') : "",  // ❌ String "1.350.000"
total: item.total_cop ? item.total_cop.toLocaleString('es-CO') : "",  // ❌ String
```

**DESPUÉS (correcto):**
```javascript
vu: item.vu_cop || 0,  // ✅ Número 1350000
total: item.total_cop || 0,  // ✅ Número
```

**Razón:** El formateo se hace **SOLO al renderizar** en la función `renderTable()`, NO al cargar los datos.

### **FIX 3: Cache-busting actualizado**

```html
<script src="datos_wbs_TODOS_items.js?v=20251013192528"></script>
```

---

## 🏗️ ARQUITECTURA FINAL (100% DINÁMICA)

```
┌─────────────────────────────────────────────────────────────────┐
│  🎯 FUENTE ÚNICA DE VERDAD                                      │
│  WBS_Presupuestal_v2.0.md (Markdown - modificado por DTs)      │
│  ├─ Nivel 1: ### **CAPÍTULO 1: CONTROL...**                    │
│  ├─ Nivel 2: #### **1.1 Sistema CTC Virtual**                  │
│  └─ Nivel 3: | **1.1.100** | Servidores | 2 | $180M | $360M | │
└──────────────────────┬──────────────────────────────────────────┘
                       │
                       │ DT modifica cantidades/costos aquí
                       ↓
┌─────────────────────────────────────────────────────────────────┐
│  📜 SCRIPT EXTRACTOR (ahora extrae 3 niveles)                  │
│  scripts/extraer_todos_items_wbs.ps1                           │
│  ├─ Detecta capítulos (busca "TOTAL CAPÍTULO X:")              │
│  ├─ Detecta subcapítulos (busca "#### **X.Y ...")              │
│  └─ Detecta ítems (busca "| **X.Y.ZZZ** | ...")                │
└──────────────────────┬──────────────────────────────────────────┘
                       │
                       ↓
┌─────────────────────────────────────────────────────────────────┐
│  📦 DATOS INTERMEDIOS (149 ítems totales)                       │
│  datos_wbs_TODOS_items.json                                    │
│  {                                                              │
│    items: [                                                     │
│      {codigo:"1", nivel:1, total_cop:0},        // Capítulo    │
│      {codigo:"1.1", nivel:2, total_cop:0},      // Subcapítulo │
│      {codigo:"1.1.100", nivel:3, total_cop:360000000},  // Ítem│
│      ...                                                        │
│    ]                                                            │
│  }                                                              │
└──────────────────────┬──────────────────────────────────────────┘
                       │
                       ↓
┌─────────────────────────────────────────────────────────────────┐
│  🌐 DATOS PARA BROWSER                                          │
│  datos_wbs_TODOS_items.js                                      │
│  window.datos_wbs = { items: [...] }                           │
└──────────────────────┬──────────────────────────────────────────┘
                       │
                       ↓
┌─────────────────────────────────────────────────────────────────┐
│  🎨 INTERFAZ VISUAL (100% dinámica, 0% hardcode)               │
│  WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguaná.html            │
│  ├─ Carga window.datos_wbs.items (149 ítems)                   │
│  ├─ Mantiene valores como números (NO strings)                 │
│  ├─ renderTable() detecta nivel y renderiza correctamente      │
│  └─ Formatea SOLO al mostrar en HTML                           │
└─────────────────────────────────────────────────────────────────┘
```

---

## 📋 EJEMPLO: CAMBIAR CAJAS 300m → 500m

### **Cuando generes DT-FIBRA-042:**

```yaml
archivos_actualizar:
  - file: "IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md"
    seccion: "Item 2.3.103"
    cambios:
      - campo: "cantidad"
        buscar: "1,823"
        reemplazar: "1,042"  # 520.78km ÷ 0.5km
      - campo: "total"
        buscar: "$2,461,050,000"
        reemplazar: "$1,406,700,000"  # 1,042 × $1,350,000
```

### **CURSOR ejecuta automáticamente:**

1. ✅ Modifica `WBS_Presupuestal_v2.0.md` (search_replace en líneas específicas)
2. ✅ Ejecuta `scripts/extraer_todos_items_wbs.ps1` (regenera JSON con 149 ítems)
3. ✅ Convierte a JS: `datos_wbs_TODOS_items.js`
4. ✅ HTML carga automáticamente y muestra nuevos valores

### **Propagación en 6 niveles:**

```
NIVEL 1: IX. WBS y Planificación ✅
├─ WBS_Presupuestal_v2.0.md (modificado por DT)
├─ datos_wbs_TODOS_items.json (regenerado por script)
└─ datos_wbs_TODOS_items.js (convertido automáticamente)

NIVEL 2: V. Ingeniería Detalle ⚠️ (si aplica)
└─ scripts/actualizar_documentos_detalle.ps1

NIVEL 3: III. Ingeniería Conceptual ⚠️ (si aplica)
└─ 28_Sistema_FibraOptica_Integrado.md

NIVEL 4: VIII. Documentos Maestros ✅
└─ scripts/actualizar_documentos_maestros.ps1

NIVEL 5: X. Entregables ⚠️ (manual)
└─ scripts/cocinar.ps1 + servir.ps1

NIVEL 6: Índices ✅
└─ Indice_Maestro_Consolidado_v1.0.md
```

---

## 🎯 VENTAJAS DE LA ARQUITECTURA

### ✅ **100% Dinámica, 0% Hardcode:**
- Cambios SOLO en `WBS_Presupuestal_v2.0.md`
- Todo lo demás se regenera automáticamente
- HTML nunca se modifica

### ✅ **Escalable:**
- Agregar capítulo 7: Solo editar WBS.md, script lo detecta automáticamente
- Cambiar cantidades: DT modifica 1 archivo, sistema propaga a 6 niveles

### ✅ **Mantenible:**
- Una sola fuente de verdad
- Scripts claros y documentados
- Trazabilidad completa

---

## 📋 ARCHIVOS MODIFICADOS

| Archivo | Cambio | Líneas |
|:--------|:-------|:------:|
| `scripts/extraer_todos_items_wbs.ps1` | Extrae 3 niveles (no solo nivel 3) | +60 |
| `IX.../WBS_Presupuesto_SCC...html` | Mantiene números puros (no strings) | 2 |
| `IX.../datos_wbs_TODOS_items.json` | 149 ítems (antes 123) | Auto |
| `IX.../datos_wbs_TODOS_items.js` | window.datos_wbs con 149 ítems | Auto |

---

## 🧪 VALIDACIÓN

### **Prueba 1: Verificar JSON**
```powershell
$data = Get-Content 'IX. WBS y Planificacion\datos_wbs_TODOS_items.json' -Raw | ConvertFrom-Json
$data.items.Count  # Debe ser 149
```
✅ **RESULTADO:** 149 ítems

### **Prueba 2: Verificar niveles**
```powershell
$n1 = ($data.items | Where-Object { $_.codigo -match '^[1-6]$' }).Count
$n2 = ($data.items | Where-Object { $_.codigo -match '^\d+\.\d+$' }).Count  
$n3 = ($data.items | Where-Object { $_.codigo -match '^\d+\.\d+\.\d+$' }).Count
```
✅ **RESULTADO:** 6 + 19 + 124 = 149

### **Prueba 3: Verificar valores numéricos**
```powershell
$data.items | Where-Object { $_.codigo -eq "1.1.100" } | Select-Object total_cop
```
✅ **RESULTADO:** 360000000 (número puro, no string)

### **Prueba 4: Abrir HTML**
```
Abrir: IX. WBS y Planificacion/WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguaná.html
Ctrl+Shift+F5 (limpiar cache)
```
✅ **RESULTADO:** Tabla muestra todos los valores correctamente formateados

---

## 📝 NOTAS TÉCNICAS

### **Por qué NO se hardcodean los capítulos en el script:**
Los capítulos se detectan **dinámicamente** buscando las líneas `**TOTAL CAPÍTULO X:**` en el WBS. Esto significa que:

- ✅ Si agregas capítulo 7 al WBS, el script lo detecta automáticamente
- ✅ Si cambias el nombre de un capítulo, se actualiza automáticamente  
- ✅ Los nombres se extraen del archivo fuente, no del código del script

### **Por qué SÍ se hardcodea la categoría:**
```powershell
categoria = switch ($capNum) {
    "1" { "control" }
    "2" { "telecomunicaciones" }
    ...
}
```
La categoría es una **clasificación interna** que no cambia. Es metadata técnica fija.

---

## 🚀 PRÓXIMOS PASOS

Ahora que el sistema está 100% dinámico, cuando hagas una DT:

1. **Especialista modifica:** `WBS_Presupuestal_v2.0.md` (via DT)
2. **Cursor ejecuta:** `.\scripts\extraer_todos_items_wbs.ps1`  
3. **Sistema regenera:** JSON → JS → HTML carga automáticamente
4. **Usuario ve cambios:** Al refrescar el navegador

**COMANDO ÚNICO para sincronizar TODO:**
```powershell
.\scripts\sincronizar_SISTEMA_COMPLETO_v14.3.ps1
```

---

**Responsable:** AI Assistant  
**Aprobado por:** Usuario  
**Estado:** ✅ Sistema 100% operativo y dinámico

