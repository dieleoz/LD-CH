# ARQUITECTURA: PRESERVACIÓN DE CATEGORÍAS EN LAYOUT

**Fecha:** 15 Octubre 2025  
**Versión:** 1.0  
**Estado:** ✅ CRÍTICO - Implementación Obligatoria

---

## 🔴 PROBLEMA CRÍTICO

### **Qué estaba pasando:**

Cuando se ejecuta una DT de **TELECOMUNICACIONES** (ej: TETRA):

```
1. Script lee layout.md (que tiene 9 categorías, 2182 equipos)
2. Script elimina equipos TETRA antiguos ✅ CORRECTO
3. Script agrega nuevas torres TETRA ✅ CORRECTO
4. Script guarda layout.md
5. ❌ PROBLEMA: Solo guardaba TELECOMUNICACIONES, borrando:
   - CONTROL (14 equipos)
   - EDIFICACION (24 equipos)
   - ENERGIA (22 equipos)
   - EQUIPO ITS (75 equipos)
   - INFRAESTRUCTURA (11 equipos)
   - SEGURIDAD (11 equipos)
   - SEÑALIZACION (30 equipos)
   - VIA (13 equipos)
```

### **Impacto:**
- ❌ Perdida de 200+ equipos de otras categorías
- ❌ WBS_Layout_Maestro.html solo mostraba 1 categoría
- ❌ Inconsistencia con WBS Presupuestal
- ❌ Cliente no ve equipos de CONTROL, ITS, PAN, etc.

---

## ✅ ARQUITECTURA CORRECTA

### **Layout Maestro Completo:**

**Ubicación:** `backup_layout_pre_DT-LAYOUT-001_20251012_002606/layout_datos.js`

**Contenido:**
```
Total: 2182 equipos
- CONTROL: 14 equipos
- EDIFICACION: 24 equipos
- ENERGIA: 22 equipos
- EQUIPO ITS: 75 equipos
- INFRAESTRUCTURA: 11 equipos
- SEGURIDAD: 11 equipos
- SEÑALIZACION: 30 equipos
- TELECOMUNICACIONES: 1982 equipos
- VIA: 13 equipos
```

**Este es el MAESTRO - Nunca modificar directamente**

---

### **Flujo CORRECTO para DTs:**

```
┌──────────────────────────────────────────────────────┐
│ 1. CARGAR LAYOUT MAESTRO COMPLETO                   │
│    (Con TODAS las 9 categorías)                     │
└──────────────────────────────────────────────────────┘
                     ↓
┌──────────────────────────────────────────────────────┐
│ 2. ELIMINAR SOLO EQUIPOS DE CATEGORÍA AFECTADA      │
│    Ej: DT-TETRA → Elimina solo equipos "EBT_"      │
│    Mantiene: CONTROL, ITS, PAN, FIBRA, etc.        │
└──────────────────────────────────────────────────────┘
                     ↓
┌──────────────────────────────────────────────────────┐
│ 3. AGREGAR EQUIPOS NUEVOS DE LA CATEGORÍA           │
│    Ej: 42 torres TETRA nuevas                       │
└──────────────────────────────────────────────────────┘
                     ↓
┌──────────────────────────────────────────────────────┐
│ 4. VERIFICAR CATEGORÍAS NO AFECTADAS INTACTAS        │
│    CONTROL: 14 → 14 ✅                              │
│    EDIFICACION: 24 → 24 ✅                          │
│    etc...                                            │
└──────────────────────────────────────────────────────┘
                     ↓
┌──────────────────────────────────────────────────────┐
│ 5. GUARDAR LAYOUT COMPLETO                           │
│    Con backup automático                            │
└──────────────────────────────────────────────────────┘
                     ↓
┌──────────────────────────────────────────────────────┐
│ 6. REGENERAR layout_datos.js                         │
│    Con todas las categorías                         │
└──────────────────────────────────────────────────────┘
```

---

## 🔧 MÓDULO: LayoutPreserver.psm1

**Ubicación:** `scripts/modules/LayoutPreserver.psm1`

### **Funciones:**

#### 1. `Get-LayoutCompleto`
Carga layout.md completo, con fallback a backup maestro si está vacío.

#### 2. `Get-EquiposPorCategoria`
Obtiene solo equipos de una categoría específica.

#### 3. `Remove-EquiposPorCategoria`
Elimina equipos de UNA categoría, preservando el resto.

```powershell
# Ejemplo: Eliminar solo torres TETRA
$layoutSinTetra = Remove-EquiposPorCategoria -Layout $layout `
                                              -Categoria "TELECOMUNICACIONES" `
                                              -FiltroAdicional "EBT_"
# Resultado: Layout sin TETRA pero con CONTROL, ITS, FIBRA, etc. intactos
```

#### 4. `Add-EquiposNuevos`
Agrega equipos nuevos en el punto correcto del layout.

#### 5. `Save-LayoutCompleto`
Guarda layout con backup automático.

#### 6. `Test-CategoriasIntactas`
Verifica que categorías no afectadas permanezcan intactas.

---

## 📝 CÓMO USAR EN SCRIPTS DE DT

### **ANTES (INCORRECTO):**

```powershell
# ❌ ESTO BORRA TODAS LAS CATEGORÍAS
$layoutContent = Get-Content "layout.md" -Encoding UTF8

$layoutLimpio = $layoutContent | Where-Object {
    $_ -notmatch 'EBT_'  # Solo elimina TETRA
}

# Agregar nuevas torres
$layoutFinal = $layoutLimpio + $nuevasTorres

# Guardar
$layoutFinal | Out-File "layout.md" -Force

# ❌ PROBLEMA: Si layout.md estaba incompleto, se pierde info
```

---

### **AHORA (CORRECTO):**

```powershell
# ✅ USAR MÓDULO LayoutPreserver
Import-Module "$PSScriptRoot\modules\LayoutPreserver.psm1" -Force

# 1. Cargar layout completo (con todas las categorías)
$layoutCompleto = Get-LayoutCompleto

# 2. Eliminar SOLO equipos TETRA antiguos (preservar CONTROL, ITS, etc.)
$layoutSinTetra = Remove-EquiposPorCategoria -Layout $layoutCompleto `
                                              -Categoria "TELECOMUNICACIONES" `
                                              -FiltroAdicional "EBT_"

# 3. Agregar nuevas torres TETRA
$layoutFinal = Add-EquiposNuevos -Layout $layoutSinTetra `
                                  -EquiposNuevos $nuevasTorres

# 4. Verificar que otras categorías están intactas
$intactas = Test-CategoriasIntactas -LayoutOriginal $layoutCompleto `
                                     -LayoutNuevo $layoutFinal `
                                     -CategoriaModificada "TELECOMUNICACIONES"

if (-not $intactas) {
    Write-Host "❌ ERROR: Se perdieron equipos de otras categorías" -ForegroundColor Red
    exit 1
}

# 5. Guardar con backup
Save-LayoutCompleto -Layout $layoutFinal -CrearBackup
```

---

## 🚨 REGLAS OBLIGATORIAS

### **Para TODOS los scripts de DT que modifican layout:**

#### ❌ NUNCA HACER:
1. ❌ Leer layout.md y asumir que está completo
2. ❌ Eliminar líneas sin verificar categoría
3. ❌ Guardar layout sin verificar que otras categorías están intactas
4. ❌ Regenerar layout_datos.js sin tener layout.md completo

#### ✅ SIEMPRE HACER:
1. ✅ Importar módulo `LayoutPreserver.psm1`
2. ✅ Cargar layout completo (con fallback a backup maestro)
3. ✅ Eliminar SOLO equipos de categoría afectada
4. ✅ Verificar categorías no afectadas con `Test-CategoriasIntactas`
5. ✅ Crear backup antes de guardar
6. ✅ Regenerar layout_datos.js después

---

## 📋 SCRIPTS QUE DEBEN ACTUALIZARSE

### **Críticos (afectan layout):**

1. ✅ `completar_42_estaciones_TETRA_15pct.ps1` - ✅ **ACTUALIZADO** (15-Oct-2025)
2. ⏳ `regenerar_fibra_1824_cajas.ps1` - PENDIENTE ACTUALIZAR
3. ❌ `completar_37_estaciones_TETRA_v2.ps1` - LEGACY (no usar)
4. ✅ Cualquier script futuro que modifique layout - Usar módulo LayoutPreserver

### **No afectan layout:**
- `convertir_layout_a_js.ps1` - Solo lee, no modifica
- `validar_wbs_cantidades_totales.ps1` - Solo valida
- `reparar_categorias_layout.ps1` - Actualiza categorías pero preserva equipos
- `regenerar_layout_md_desde_js.ps1` - Reconstruye layout.md desde JS completo

---

## 🎯 PRÓXIMOS PASOS

### **COMPLETADO (15-Oct-2025):**

1. ✅ Backup restaurado (2182 equipos con 9 categorías)
2. ✅ Actualizar `completar_42_estaciones_TETRA_15pct.ps1` para usar módulo
3. ✅ Script `regenerar_layout_md_desde_js.ps1` creado
4. ✅ Módulo `LayoutPreserver.psm1` implementado y probado
5. ✅ DT-TETRA-039 ejecutada exitosamente con preservación

### **PENDIENTE:**

6. ⏳ Actualizar `regenerar_fibra_1824_cajas.ps1` para usar módulo
7. ⏳ Actualizar `.cursorrules` con reglas de preservación
8. ⏳ Crear guía rápida para desarrolladores

### **DOCUMENTACIÓN:**

9. ✅ ARCHITECTURE.md actualizado con flujo de preservación
10. ✅ README.md actualizado con nueva arquitectura
11. ✅ Roadmap actualizado con v14.7.6

---

## 📊 VERIFICACIÓN

### **Después de ejecutar DT, verificar:**

```powershell
# Ver categorías en layout actual
$layout = Get-Content "layout.md" -Encoding UTF8
$categorias = @{}
foreach ($linea in $layout) {
    if ($linea -match "`t" -and $linea -match "^UFV") {
        $celdas = $linea -split "`t"
        if ($celdas.Count -gt 7) {
            $cat = $celdas[7].Trim()
            if (-not $categorias.ContainsKey($cat)) { $categorias[$cat] = 0 }
            $categorias[$cat]++
        }
    }
}
$categorias.GetEnumerator() | Sort-Object Name

# RESULTADO ESPERADO: 9 categorías
```

**Si solo muestra 1 categoría → ❌ PROBLEMA**  
**Si muestra 9 categorías → ✅ CORRECTO**

---

## ✅ VERIFICACIÓN EXITOSA (15-Oct-2025)

### **Ejecución DT-TETRA-039:**
- Script: `completar_42_estaciones_TETRA_15pct.ps1`
- Resultado: ✅ **EXITOSO**
- Equipos TETRA: 39 → 42 (+3)
- Categorías preservadas: 8/8 (100%)
- WBS validado: 0 errores
- Tiempo: ~45 segundos

### **Categorías Preservadas:**
```
✅ CONTROL: 14 equipos (intacto)
✅ EDIFICACION: 24 equipos (intacto)
✅ ENERGIA: 22 equipos (intacto)
✅ EQUIPO ITS: 75 equipos (intacto)
✅ INFRAESTRUCTURA: 11 equipos (intacto)
✅ SEGURIDAD: 11 equipos (intacto)
✅ SEÑALIZACION: 30 equipos (intacto)
✅ VIA: 13 equipos (intacto)
```

### **Layout Final:**
- Total equipos: 2204 (vs 2182 inicial)
- TELECOMUNICACIONES: 2004 (+22 torres TETRA)
- Otras categorías: 200 (preservadas)

---

**CRÍTICO:** Este módulo es OBLIGATORIO para cualquier script que modifique layout.md

---

**Responsable:** Sistema WBS Interactivo  
**Fecha Creación:** 15 Octubre 2025  
**Última Actualización:** 15 Octubre 2025  
**Estado:** ✅ **IMPLEMENTADO Y VALIDADO**  
**Prioridad:** 🔴 CRÍTICA


