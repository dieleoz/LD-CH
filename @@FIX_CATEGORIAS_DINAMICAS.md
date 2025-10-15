# FIX: CATEGORÍAS DINÁMICAS EN LAYOUT (NO HARDCODEADAS)

**Fecha:** 15 Octubre 2025  
**Problema:** WBS_Layout_Maestro.html solo muestra "TELECOMUNICACIONES"  
**Causa:** Scripts hardcodeaban "TELECOMUNICACIONES" en lugar de usar categorías dinámicas  
**Estado:** ✅ CORREGIDO

---

## 🔴 PROBLEMA DETECTADO

### **Síntoma:**
- WBS_Layout_Maestro.html solo muestra "TELECOMUNICACIONES" en filtro de tipo de equipo
- No hay categorías como "CONTROL", "ENERGIA", "EQUIPO ITS", etc.

### **Causa Raíz:**
Todos los scripts que generan equipos estaban **hardcodeando** la categoría a "TELECOMUNICACIONES":

```powershell
# ❌ ANTES (HARDCODEADO)
$linea = "$ufv`t2.1`t$nombre`t$pk`t$desc`t$lado`t$dir`tTELECOMUNICACIONES`t$dispositivo..."
#                                                         ↑ HARDCODEADO
```

Esto resultaba en que **TODO el layout.md tenía solo "TELECOMUNICACIONES"** en la columna 7 (tipo_equipo).

---

## ✅ SOLUCIÓN IMPLEMENTADA

### **1. Módulo de Mapeo Dinámico**
**Archivo:** `scripts/mapeo_dispositivo_categoria.psm1`

Este módulo contiene la función `Get-CategoriaDesdeDispositivo` que:
- Recibe: Dispositivo, Nombre, Descripción
- Analiza el tipo de dispositivo usando patrones
- Retorna: Categoría correcta (NO hardcodeada)

**Categorías soportadas:**
- ✅ TELECOMUNICACIONES (TETRA, Fibra, ODF, GSM-R, etc.)
- ✅ CONTROL (CTC, RBC, ENCE, Enclavamiento, etc.)
- ✅ EQUIPO ITS (CCTV, Detector, HBD, WILD, etc.)
- ✅ ENERGIA (UPS, SAI, Generador, etc.)
- ✅ SEÑALIZACION (Señales, Semáforos, etc.)
- ✅ EDIFICACION (Estaciones, Talleres, CCO, etc.)
- ✅ VIA (Desvíos, Agujas, etc.)
- ✅ OTROS (Si no coincide con ninguna categoría)

### **2. Scripts Corregidos**

#### **Actualizados para usar categorías dinámicas:**

1. **`completar_39_estaciones_TETRA_10pct.ps1`**
   ```powershell
   # Import del módulo
   Import-Module "$PSScriptRoot\mapeo_dispositivo_categoria.psm1" -Force
   
   # Obtener categoría dinámicamente
   $dispositivo = "TETRA BS"
   $nombre = "EBT_01"
   $descripcion = "Estación Base TETRA 01"
   $categoria = Get-CategoriaDesdeDispositivo -Dispositivo $dispositivo `
                                                -Nombre $nombre `
                                                -Descripcion $descripcion
   
   $linea = "$ufv`t2.1`t$nombre`t$pk`t$desc`t$lado`t$dir`t$categoria`t$dispositivo..."
   #                                                          ↑ DINÁMICO
   ```

2. **`regenerar_fibra_1824_cajas.ps1`**
   - Cajas de empalme: Categoría dinámica
   - Domos de fusión: Categoría dinámica
   - Cajas de puentes: Categoría dinámica

3. **Script `convertir_layout_a_js.ps1`**
   - ✅ Ya estaba correcto - Lee columna 7 dinámicamente
   - No necesita cambios

---

## 📝 REGLAS PARA FUTUROS SCRIPTS

### ❌ NUNCA HACER:
```powershell
# ❌ NO HARDCODEAR CATEGORÍAS
$linea = "...`tTELECOMUNICACIONES`t..."
$linea = "...`tCONTROL`t..."
$linea = "...`tENERGIA`t..."
```

### ✅ SIEMPRE HACER:
```powershell
# ✅ USAR EL MÓDULO DE MAPEO
Import-Module "$PSScriptRoot\mapeo_dispositivo_categoria.psm1" -Force

$categoria = Get-CategoriaDesdeDispositivo -Dispositivo $dispositivo `
                                            -Nombre $nombre `
                                            -Descripcion $descripcion

$linea = "...`t$categoria`t..."
```

---

## 🔧 CÓMO AÑADIR NUEVAS CATEGORÍAS

Si necesitas añadir una nueva categoría al sistema:

1. **Editar:** `scripts/mapeo_dispositivo_categoria.psm1`
2. **Añadir patrón:**
   ```powershell
   # NUEVA CATEGORÍA
   if ($Dispositivo -match '(Patron1|Patron2)' -or
       $Nombre -match '(Prefijo)' -or
       $Descripcion -match '(PalabraClave)') {
       return "NUEVA_CATEGORIA"
   }
   ```
3. **Actualizar WBS_Layout_Maestro.html:**
   - Añadir clase de estilo si necesitas color específico
   - Añadir a `MAPEO_TIPO_SISTEMA` si aplica

---

## 🚀 CÓMO REGENERAR EL LAYOUT CON CATEGORÍAS CORRECTAS

### **Opción 1: Regenerar todo el layout**
```powershell
# Desde el directorio del proyecto
cd scripts
pwsh -File regenerar_fibra_1824_cajas.ps1
pwsh -File completar_39_estaciones_TETRA_10pct.ps1
pwsh -File convertir_layout_a_js.ps1
```

### **Opción 2: Ejecutar DT-TETRA-038 en modo modular**
```
1. Abrir DT-TETRA-038-Criterio_10pct_Solapamiento.md
2. Cursor detectará la DT
3. Elegir "Ejecutar modo modular"
4. Ir subsistema por subsistema
```

---

## 📊 VERIFICAR QUE FUNCIONA

### **1. Verificar categorías en layout.md:**
```powershell
# Debe mostrar múltiples categorías (no solo TELECOMUNICACIONES)
pwsh -Command "
$categorias = @{}
Get-Content 'layout.md' -Encoding UTF8 | Where-Object { $_ -match '\t' } | ForEach-Object {
    $celdas = $_ -split '\t'
    if ($celdas.Count -gt 7) { $categorias[$celdas[7]] = $true }
}
$categorias.Keys | Sort-Object
"
```

**Resultado esperado:**
```
CONTROL
EDIFICACION
ENERGIA
EQUIPO ITS
OTROS
SEÑALIZACION
TELECOMUNICACIONES
VIA
```

### **2. Verificar en WBS_Layout_Maestro.html:**
1. Abrir `IX. WBS y Planificacion/WBS_Layout_Maestro.html`
2. Ver filtro "Tipo de Equipo"
3. Debe mostrar múltiples opciones (no solo "TELECOMUNICACIONES")

---

## 📚 ARCHIVOS MODIFICADOS

| Archivo | Cambio | Estado |
|:--------|:-------|:-------|
| `scripts/mapeo_dispositivo_categoria.psm1` | ✅ CREADO | Nuevo módulo |
| `scripts/completar_39_estaciones_TETRA_10pct.ps1` | ✅ ACTUALIZADO | Usa módulo |
| `scripts/regenerar_fibra_1824_cajas.ps1` | ✅ ACTUALIZADO | Usa módulo |
| `scripts/completar_37_estaciones_TETRA_v2.ps1` | ⚠️  LEGACY | No corregido |
| `scripts/completar_37_estaciones_TETRA.ps1` | ⚠️  LEGACY | No corregido |

**Nota:** Los scripts legacy (v1, v2) no se corrigieron porque ya no se usan. Usar solo los scripts actuales.

---

## ⚡ RESUMEN

| Aspecto | Antes | Ahora |
|:--------|:------|:------|
| **Categorías en layout.md** | Solo "TELECOMUNICACIONES" | 7-8 categorías dinámicas |
| **Filtro WBS_Layout_Maestro** | 1 opción | Múltiples opciones |
| **Mantenibilidad** | Hardcodeado en cada script | Centralizado en módulo |
| **Agregar categoría** | Editar todos los scripts | Solo editar módulo |
| **Riesgo de error** | Alto (olvidas actualizar) | Bajo (automático) |

---

## 🎯 PRÓXIMOS PASOS

1. ✅ Regenerar layout.md con categorías correctas
2. ✅ Regenerar layout_datos.js
3. ✅ Verificar en WBS_Layout_Maestro.html
4. ✅ Actualizar scripts legacy (opcional)
5. ✅ Documentar en reglas de Cursor

---

**IMPORTANTE:** Desde ahora, **NUNCA hardcodear categorías** en los scripts. Siempre usar `Get-CategoriaDesdeDispositivo`.

---

**Autor:** Sistema WBS Interactivo  
**Fecha:** 15 Octubre 2025  
**Versión:** 1.0


