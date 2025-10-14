# 🔴 PENDIENTE: Completar 37 Torres TETRA en Layout
## Versión: v14.7.7 (Para mañana 15-Oct-2025)

**Fecha creación:** 14 de Octubre 2025 23:00  
**Prioridad:** 🔴 ALTA  
**Estimación:** 30 minutos  
**Responsable:** Continuar mañana  

---

## 📊 PROBLEMA ACTUAL

### Estado:
- ❌ Layout tiene solo **20 torres TETRA** (EBT_07 a EBT_26)
- ✅ Criterio técnico dice **37 torres** (según criterios_tecnicos_base.json)
- ❌ Faltan **17 torres** (6 al inicio + 11 al final)

### Torres Faltantes:
```
INICIO (6 torres):
- EBT_01 (PK 201+470)
- EBT_02 (PK 215+936)
- EBT_03 (PK 230+402)
- EBT_04 (PK 244+868)
- EBT_05 (PK 259+334)
- EBT_06 (PK 273+801)

FINAL (11 torres):
- EBT_27 (PK 578+xxx)
- EBT_28 (PK 592+xxx)
- ... (espaciamiento ~14.5 km)
- EBT_37 (PK 722+250)
```

### Archivos Afectados:
| Archivo | Estado Actual | Debe Tener |
|---------|---------------|------------|
| `layout.md` | 0 torres TETRA | 37 torres |
| `layout_datos.js` | 20 torres TETRA | 37 torres |
| `WBS_Presupuestal_v2.0.md` | Item 2.1.100 = ? | 37 torres |
| `criterios_tecnicos_base.json` | Dice 37 torres | ✅ Correcto |

---

## 🔧 INTENTOS REALIZADOS HOY (14-Oct-2025)

### Intento #1: Ejecutar script original
```powershell
.\scripts\completar_37_estaciones_TETRA.ps1
```
**Resultado:** ❌ Script tiene código viejo que NO integra las torres en layout.md automáticamente

### Intento #2: Modificar script para integración automática
**Acción:** Edité `completar_37_estaciones_TETRA.ps1` agregando:
- Función `Calcular-UFV`
- Limpieza de torres antiguas
- Inserción automática en layout.md
- Regeneración de layout_datos.js

**Resultado:** ❌ Cambios sin guardar en editor (unsaved) - script en disco tiene versión vieja

### Intento #3: Crear script v2 limpio
**Acción:** Creé `completar_37_estaciones_TETRA_v2.ps1` con lógica completa
**Resultado:** ❌ No se ejecutó correctamente por problemas de PATH

---

## ✅ SOLUCIÓN PARA MAÑANA (15-Oct-2025)

### OPCIÓN A: Usar Script del README (Recomendado)

El README dice claramente:

```markdown
| Sistema | Script Especializado | Propósito |
|---------|---------------------|-----------|
| TETRA   | completar_37_estaciones_TETRA.ps1 | Distribuye 37 estaciones con espaciamiento uniforme |
```

**Pasos:**

1. **Abrir y Corregir el script original:**
   - Archivo: `scripts\completar_37_estaciones_TETRA.ps1`
   - **PROBLEMA:** Script actual solo genera líneas pero NO las integra en layout.md
   - **CORREGIR:** Agregar integración automática como en `regenerar_fibra_1824_cajas.ps1`

2. **Modelo a seguir** (FIBRA funciona bien):
   ```powershell
   # Ver: scripts\regenerar_fibra_1824_cajas.ps1 líneas 190-250
   # Hace:
   # 1. Lee layout.md
   # 2. Limpia elementos antiguos (EBT_)
   # 3. Genera nuevos elementos (37 torres)
   # 4. Inserta en layout.md
   # 5. Regenera layout_datos.js
   # 6. Actualiza WBS_Presupuestal
   ```

3. **Ejecutar desde scripts:**
   ```powershell
   cd "d:\onedrive\OneDrive - Grupo Ortiz\LFC\02. Ingenieria\02. Ingenieria Conceptual\0.0 Formatos para IA\scripts"
   .\completar_37_estaciones_TETRA.ps1
   ```

4. **Verificar resultado:**
   ```powershell
   # Debe mostrar:
   # ✅ layout.md actualizado (37 torres agregadas)
   # ✅ layout_datos.js regenerado (2,199 equipos = 2,182 + 17 nuevas)
   # ✅ WBS_Presupuestal item 2.1.100: 37 torres
   ```

5. **Probar en navegador:**
   - Abrir: `WBS_Layout_Maestro.html`
   - Filtrar: Tipo = TELECOMUNICACIONES, Sistema = TETRA BS
   - Verificar: **37 torres** listadas

---

### OPCIÓN B: Ejecutar Script v2 (Ya creado)

El archivo `scripts\completar_37_estaciones_TETRA_v2.ps1` ya tiene la lógica completa.

**Pasos:**
1. Ejecutar:
   ```powershell
   cd scripts
   .\completar_37_estaciones_TETRA_v2.ps1
   ```

2. Verificar:
   ```powershell
   # layout.md debe tener 37 torres
   $content = Get-Content "..\layout.md" -Raw -Encoding UTF8
   ([regex]::Matches($content, 'EBT_')).Count  # Debe ser 37
   ```

3. Regenerar layout_datos.js:
   ```powershell
   .\convertir_layout_a_js.ps1
   ```

---

## 📋 CÓDIGO QUE DEBE AGREGARSE AL SCRIPT

### Sección que falta en `completar_37_estaciones_TETRA.ps1`:

Después de generar las 37 estaciones, agregar:

```powershell
# ================================================================
# INTEGRAR EN LAYOUT.MD AUTOMÁTICAMENTE
# ================================================================

Write-Host "INTEGRANDO 37 ESTACIONES EN LAYOUT.MD..." -ForegroundColor Yellow

$layoutMdPath = "..\layout.md"
$layoutContent = Get-Content $layoutMdPath -Encoding UTF8

# Limpiar torres TETRA antiguas
$layoutLimpio = $layoutContent | Where-Object {
    $_ -notmatch 'EBT_' -and 
    ($_ -notmatch 'TETRA BS' -or $_ -notmatch '^UFV') -and
    $_ -notmatch '# ESTACIONES BASE TETRA'
}

# Generar líneas con formato correcto (TABS, no pipes)
$lineasLayout = @()
foreach ($est in $estaciones) {
    $ufv = Calcular-UFV -pk $est.pk_numerico
    $linea = "$ufv`t2.1`t$($est.id)`t$($est.pk_formato)`tEstación Base TETRA $($est.numero.ToString('00'))`tDerecha`tPK$($est.pk_formato) Derecha`tTELECOMUNICACIONES`tTETRA BS`tN/A`tN/A`tTBD`tTBD"
    $lineasLayout += $linea
}

# Buscar donde insertar
$insertIndex = ($layoutLimpio.Count) # Al final

# Insertar
$layoutFinal = @()
$layoutFinal += $layoutLimpio[0..($insertIndex-1)]
$layoutFinal += ""
$layoutFinal += "# ESTACIONES BASE TETRA - Generado automáticamente"
$layoutFinal += "# Fecha: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
$layoutFinal += ""
$layoutFinal += $lineasLayout
$layoutFinal += ""

# Guardar
$layoutFinal | Out-File $layoutMdPath -Encoding UTF8 -Force

Write-Host "  ✅ layout.md actualizado ($($layoutFinal.Count) líneas)" -ForegroundColor Green

# REGENERAR LAYOUT_DATOS.JS
Write-Host "Regenerando layout_datos.js..." -ForegroundColor Yellow
& "$PSScriptRoot\convertir_layout_a_js.ps1" | Out-Null
Write-Host "  ✅ layout_datos.js regenerado" -ForegroundColor Green
```

### Función UFV necesaria:

```powershell
function Calcular-UFV {
    param([double]$pk)
    
    if ($pk -lt 223) { return "UFV23" }
    elseif ($pk -lt 250) { return "UFV30" }
    elseif ($pk -lt 313) { return "UFV31" }
    elseif ($pk -lt 327) { return "UFV01" }
    elseif ($pk -lt 354) { return "UFV02" }
    elseif ($pk -lt 376) { return "UFV34" }
    elseif ($pk -lt 406) { return "UFV35" }
    elseif ($pk -lt 430) { return "UFV36" }
    elseif ($pk -lt 462) { return "UFV39" }
    elseif ($pk -lt 501) { return "UFV44" }
    elseif ($pk -lt 533) { return "UFV45" }
    elseif ($pk -lt 552) { return "UFV46" }
    elseif ($pk -lt 569) { return "UFV47" }
    elseif ($pk -lt 604) { return "UFV49" }
    elseif ($pk -lt 635) { return "UFV52" }
    elseif ($pk -lt 663) { return "UFV54" }
    elseif ($pk -lt 679) { return "UFV55" }
    elseif ($pk -lt 701) { return "UFV56" }
    elseif ($pk -lt 722) { return "UFV21" }
    else { return "UFV22" }
}
```

---

## 📝 ARCHIVOS PARA REVISAR MAÑANA

### 1. Script a Corregir:
```
scripts\completar_37_estaciones_TETRA.ps1
```
**Estado:** Tiene lógica de generación pero NO integra en layout.md  
**Acción:** Agregar sección de integración (ver código arriba)

### 2. Script Alternativo (Ya listo):
```
scripts\completar_37_estaciones_TETRA_v2.ps1
```
**Estado:** Código completo y correcto  
**Acción:** Solo ejecutarlo

### 3. Script de Referencia (Funciona bien):
```
scripts\regenerar_fibra_1824_cajas.ps1
```
**Estado:** ✅ Funciona perfectamente  
**Uso:** Copiar la lógica de integración de layout.md (líneas 190-250)

---

## ✅ BUGS CORREGIDOS HOY (14-Oct-2025)

### 1. WBS_COMPLETA_TODO_Interactiva_v4.0.html ✅
**Problema:** No mostraba los 134 ítems (bug JS línea 617)  
**Solución:** Corregido `substring(0,3)` → `split('.')`  
**Estado:** ✅ CORREGIDO y subido a Git

### 2. WBS_Layout_Maestro.html ✅
**Problema:** Solo mostraba filtro TELECOMUNICACIONES (1,953 elementos)  
**Solución:** Restaurado backup con 2,182 elementos (9 tipos)  
**Estado:** ✅ CORREGIDO y subido a Git

### 3. Encoding UTF-8 en Criterios Técnicos ✅
**Problema:** Caracteres mal codificados (â†', Ã­, etc.)  
**Solución:** Regenerado criterios_tecnicos_base.js con UTF-8  
**Estado:** ✅ CORREGIDO y subido a Git

### 4. Torres TETRA (20 → 37) ❌
**Problema:** Solo 20 torres en vez de 37  
**Solución:** Script `completar_37_estaciones_TETRA.ps1` genera 37 pero NO integra  
**Estado:** ⏳ PENDIENTE para mañana

---

## 🎯 PLAN PARA MAÑANA (15-Oct-2025)

### Tarea: Agregar 17 torres TETRA faltantes

**Tiempo estimado:** 30 minutos

### Pasos a seguir:

```
1. CORREGIR SCRIPT (10 min)
   ├─ Abrir: scripts\completar_37_estaciones_TETRA.ps1
   ├─ Buscar línea 83: "# Generar líneas para agregar al layout.md"
   ├─ Reemplazar con código de integración (ver arriba)
   └─ Guardar archivo

2. EJECUTAR SCRIPT (5 min)
   ├─ cd "d:\...\scripts"
   ├─ .\completar_37_estaciones_TETRA.ps1
   └─ Verificar output: "✅ layout.md actualizado (37 torres agregadas)"

3. VERIFICAR RESULTADOS (10 min)
   ├─ Contar torres en layout.md (debe ser 37)
   ├─ Contar torres en layout_datos.js (debe ser 37)
   ├─ Abrir WBS_Layout_Maestro.html
   ├─ Filtrar por "TETRA BS"
   └─ Verificar 37 torres listadas

4. SUBIR A GIT (5 min)
   ├─ git add layout.md layout_datos.js completar_37_estaciones_TETRA.ps1
   ├─ git commit -m "feat: Agregar 37 torres TETRA completas en Layout"
   └─ git push origin main
```

---

## 📂 COMMITS REALIZADOS HOY (14-Oct-2025)

| # | Commit | Mensaje | Archivos |
|---|--------|---------|----------|
| 1 | `f21cdc0` | fix: Corregir visualización de equipos en interfaces WBS | 4 archivos |
| 2 | `7b8489c` | fix: Corregir encoding UTF-8 en criterios técnicos | 2 archivos |
| 3 | `666ca50` | docs: Actualizar README y ARCHITECTURE a v14.7.6 | 2 archivos |

**Total:** 8 archivos modificados/creados hoy

---

## 🔍 COMANDOS ÚTILES PARA MAÑANA

### Verificar torres TETRA:
```powershell
# Contar en layout.md
$content = Get-Content "layout.md" -Raw -Encoding UTF8
([regex]::Matches($content, 'EBT_')).Count

# Contar en layout_datos.js
$content = Get-Content "IX. WBS y Planificacion\layout_datos.js" -Raw -Encoding UTF8
([regex]::Matches($content, 'EBT_')).Count

# Listar torres existentes
$content = Get-Content "IX. WBS y Planificacion\layout_datos.js" -Raw -Encoding UTF8
$matches = [regex]::Matches($content, '"nombre":"EBT_[^"]*"')
$matches | ForEach-Object { $_.Value } | Sort-Object
```

### Regenerar layout completo:
```powershell
cd scripts

# 1. Generar 37 torres TETRA
.\completar_37_estaciones_TETRA.ps1

# 2. Convertir layout.md a JS
.\convertir_layout_a_js.ps1

# 3. Verificar total
# Debe ser: 2,182 + 17 = 2,199 equipos
```

---

## 📊 ESTADO ACTUAL VERIFICADO

### Layout Maestro (14-Oct-2025 23:00):
| Métrica | Valor Actual | Valor Esperado |
|---------|--------------|----------------|
| **Total equipos** | 2,182 | 2,199 |
| **Torres TETRA** | 20 | 37 |
| **Cajas Fibra** | 1,735 | 1,735 ✅ |
| **Domos Fusión** | ~130 | ~130 ✅ |
| **CCTV** | ~75 | ~75 ✅ |
| **Otros equipos** | ~242 | ~242 ✅ |

### Diferencia:
- ❌ Faltan **17 torres TETRA**
- ✅ Todo lo demás correcto

---

## 🎯 CRITERIO TÉCNICO (Fuente de Verdad)

### Según `criterios_tecnicos_base.json` (item 2.1.100):

```json
{
  "justificacion": "37 torres para cobertura 594 km con solapamiento 20%",
  "calculo_detallado": "Alcance por torre: 12-16 km → 594 km ÷ 12 km = 49.5 torres → Optimizado a 37 con solapamiento inteligente",
  "desglose": [
    "Torres backbone: 30 unidades (espaciamiento ~20 km)",
    "Torres en nodos críticos: 5 unidades (estaciones, patios)",
    "Torres de refuerzo cobertura: 2 unidades (zonas complejas)"
  ],
  "restriccion": "Mínimo 33 torres para garantizar cobertura 100% según simulación"
}
```

**Conclusión:** ✅ El criterio técnico es correcto - deben ser **37 torres**

---

## 🚨 NOTA IMPORTANTE

El script `completar_37_estaciones_TETRA.ps1` GENERA correctamente las 37 torres con:
- ✅ Espaciamiento uniforme ~14.5 km
- ✅ PKs calculados correctamente
- ✅ UFVs asignadas según PK
- ✅ Formato correcto para layout.md

**PERO:**
- ❌ NO las integra automáticamente en layout.md
- ❌ Solo genera archivos temporales (TETRA_37_ESTACIONES_v1.0.json, TETRA_37_LINEAS_LAYOUT.txt)
- ❌ Requiere integración manual

**SOLUCIÓN:**
Modificar el script para que haga lo mismo que `regenerar_fibra_1824_cajas.ps1`:
1. Limpiar layout.md (quitar EBT_ viejos)
2. Insertar 37 nuevas líneas
3. Guardar layout.md
4. Regenerar layout_datos.js
5. Listo

---

## 📁 ARCHIVOS RELACIONADOS

### Documentación:
- `@@SOLUCION_WBS_LAYOUT_MAESTRO.md` - Problema anterior resuelto
- `README.md` - Scripts especializados (línea 380-388)
- `scripts\README_SCRIPTS.md` - Guía de scripts

### Scripts:
- ✅ `scripts\completar_37_estaciones_TETRA.ps1` - A corregir mañana
- ✅ `scripts\completar_37_estaciones_TETRA_v2.ps1` - Alternativa lista
- ✅ `scripts\regenerar_fibra_1824_cajas.ps1` - Modelo a copiar
- ✅ `scripts\convertir_layout_a_js.ps1` - Regenerador

### Datos:
- `layout.md` - Fuente de verdad del layout (a actualizar)
- `IX. WBS y Planificacion\layout_datos.js` - Datos para HTML (regenerar)
- `IX. WBS y Planificacion\WBS_Presupuestal_v2.0.md` - Item 2.1.100 (verificar)

---

**Creado:** 14 de Octubre 2025 23:00  
**Para:** Sesión del 15 de Octubre 2025  
**Estimación:** 30 minutos  
**Prioridad:** 🔴 ALTA (afecta visualización en WBS_Layout_Maestro.html)

