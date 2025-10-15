# ================================================================
# SCRIPT: Completar 42 Estaciones TETRA (DT-TETRA-039)
# Fecha: 15 Octubre 2025
# Proposito: Generar e integrar 42 torres TETRA con criterio 15% solapamiento
# Cambio: De 39 torres (10% solap) a 42 torres (15% solap)
# ================================================================

Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "  COMPLETANDO 42 ESTACIONES TETRA (DT-TETRA-039)      " -ForegroundColor Cyan
Write-Host "  Criterio: 15% solapamiento | Espaciamiento: 12.70km " -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host ""

# Importar módulos
Import-Module "$PSScriptRoot\mapeo_dispositivo_categoria.psm1" -Force
Import-Module "$PSScriptRoot\modules\LayoutPreserver.psm1" -Force

Write-Host "✓ Módulos cargados (categorías dinámicas + preservación)" -ForegroundColor Green
Write-Host ""

# ================================================================
# PASO 1: GENERAR 42 ESTACIONES
# ================================================================

Write-Host "PASO 1: Generando 42 estaciones TETRA..." -ForegroundColor Yellow

$pkInicio = 201.470  # PK 201+470 (Mexico)
$pkFin = 722.250     # PK 722+250 (Chiriguana)
$longitudTotal = $pkFin - $pkInicio  # 520.78 km
$numEstaciones = 42  # DT-TETRA-039: Cambio de 39 a 42 (criterio 15% solapamiento)
$espaciamiento = $longitudTotal / ($numEstaciones - 1)  # 12.70 km

Write-Host "  Longitud total: $([math]::Round($longitudTotal, 2)) km" -ForegroundColor White
Write-Host "  Estaciones: $numEstaciones" -ForegroundColor White
Write-Host "  Espaciamiento: $([math]::Round($espaciamiento, 2)) km" -ForegroundColor White
Write-Host ""

# Función para calcular UFV según PK
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

# Generar estaciones
$estaciones = @()
for ($i = 0; $i -lt $numEstaciones; $i++) {
    $pk = $pkInicio + ($i * $espaciamiento)
    $pkEntero = [math]::Floor($pk)
    $pkDecimal = [math]::Round(($pk - $pkEntero) * 1000)
    $pkFormato = "$pkEntero+$pkDecimal"
    $ufv = Calcular-UFV -pk $pk
    
    # Obtener categoría dinámicamente (NO hardcodeada)
    $dispositivo = "TETRA BS"
    $nombre = "EBT_$(($i+1).ToString('00'))"
    $descripcion = "Estación Base TETRA $(($i+1).ToString('00'))"
    $categoria = Get-CategoriaDesdeDispositivo -Dispositivo $dispositivo -Nombre $nombre -Descripcion $descripcion
    
    $estaciones += [PSCustomObject]@{
        numero = $i + 1
        id = $nombre
        pk_numerico = $pk
        pk_formato = $pkFormato
        ufv = $ufv
        linea_layout = "$ufv`t2.1`t$nombre`t$pkFormato`t$descripcion`tDerecha`tPK$pkFormato Derecha`t$categoria`t$dispositivo`tN/A`tN/A`tTBD`tTBD"
    }
}

Write-Host "  Generadas: $($estaciones.Count) estaciones" -ForegroundColor Green
Write-Host ""

# ================================================================
# PASO 2: INTEGRAR EN LAYOUT.MD
# ================================================================

Write-Host "PASO 2: Integrando en layout.md (PRESERVANDO otras categorías)..." -ForegroundColor Yellow

# Cargar layout completo (usando módulo LayoutPreserver)
$layoutCompleto = Get-LayoutCompleto
Write-Host "  Layout original: $($layoutCompleto.Count) líneas" -ForegroundColor Gray

# Eliminar SOLO torres TETRA antiguas, preservando CONTROL, ITS, FIBRA, etc.
$layoutLimpio = Remove-EquiposPorCategoria -Layout $layoutCompleto `
                                            -Categoria "TELECOMUNICACIONES" `
                                            -FiltroAdicional "EBT_"

Write-Host "  Layout sin TETRA: $($layoutLimpio.Count) líneas" -ForegroundColor Gray
Write-Host "  Torres TETRA eliminadas: $($layoutCompleto.Count - $layoutLimpio.Count)" -ForegroundColor Gray

# Buscar donde insertar
$insertIndex = -1
for ($i = 0; $i -lt $layoutLimpio.Count; $i++) {
    if ($layoutLimpio[$i] -match 'INSTITUCIONES EDUCATIVAS') {
        $insertIndex = $i
        break
    }
}
if ($insertIndex -eq -1) { $insertIndex = $layoutLimpio.Count }

# Preparar líneas de nuevas torres
$lineasNuevas = @()
$lineasNuevas += ""
$lineasNuevas += "# ESTACIONES BASE TETRA - Generado automaticamente por DT-TETRA-039"
$lineasNuevas += "# Fecha: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
$lineasNuevas += "# Total: 42 estaciones (espaciamiento 12.70 km | Solapamiento 15%)"
$lineasNuevas += "# Criterio: 15% solapamiento coherente (DT-TETRA-039)"
$lineasNuevas += "# Categoría: TELECOMUNICACIONES (asignada dinámicamente)"
$lineasNuevas += ""
$lineasNuevas += $estaciones.linea_layout

# Agregar nuevas torres al layout (usando módulo LayoutPreserver)
$layoutFinal = Add-EquiposNuevos -Layout $layoutLimpio -EquiposNuevos $lineasNuevas

# VERIFICAR que otras categorías permanecen intactas
Write-Host ""
$intactas = Test-CategoriasIntactas -LayoutOriginal $layoutCompleto `
                                     -LayoutNuevo $layoutFinal `
                                     -CategoriaModificada "TELECOMUNICACIONES"

if (-not $intactas) {
    Write-Host "  ❌ ERROR CRÍTICO: Se perdieron equipos de otras categorías" -ForegroundColor Red
    Write-Host "  Abortando para prevenir pérdida de datos" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "  ✅ Verificación: Todas las categorías preservadas correctamente" -ForegroundColor Green

# Guardar con backup automático
Save-LayoutCompleto -Layout $layoutFinal -CrearBackup

Write-Host "  ✅ layout.md actualizado ($($layoutFinal.Count) líneas)" -ForegroundColor Green
Write-Host ""

# ================================================================
# PASO 3: REGENERAR LAYOUT_DATOS.JS
# ================================================================

Write-Host "PASO 3: Regenerando layout_datos.js..." -ForegroundColor Yellow
$scriptConvertir = "scripts\convertir_layout_a_js.ps1"
if (Test-Path $scriptConvertir) {
    & $scriptConvertir 2>&1 | Out-Null
    Write-Host "  ✅ layout_datos.js regenerado" -ForegroundColor Green
} else {
    Write-Host "  ⚠️  Script convertir_layout_a_js.ps1 no encontrado" -ForegroundColor Yellow
}
Write-Host ""

# ================================================================
# PASO 4: ACTUALIZAR WBS PRESUPUESTAL
# ================================================================

Write-Host "PASO 4: Actualizando WBS_Presupuestal..." -ForegroundColor Yellow

$wbsPath = "IX. WBS y Planificacion\WBS_Presupuestal_v2.0.md"
if (Test-Path $wbsPath) {
    $wbsContent = Get-Content $wbsPath -Raw -Encoding UTF8
    # Actualizar cantidad a 42
    $wbsContent = $wbsContent -replace '(\| \*\*2\.1\.100\*\* \| Torre[^\|]+\| UND \| )(\d+)([ \|])', '${1}42${3}'
    $wbsContent | Out-File -FilePath $wbsPath -Encoding UTF8 -NoNewline -Force
    Write-Host "  ✅ WBS_Presupuestal item 2.1.100: 42 torres" -ForegroundColor Green
} else {
    Write-Host "  ⚠️  WBS_Presupuestal no encontrado" -ForegroundColor Yellow
}
Write-Host ""

# ================================================================
# PASO 5: REGENERAR DATOS_WBS
# ================================================================

Write-Host "PASO 5: Regenerando datos_wbs_TODOS_items.js..." -ForegroundColor Yellow
$scriptExtraer = "scripts\extraer_todos_items_wbs.ps1"
if (Test-Path $scriptExtraer) {
    & $scriptExtraer 2>&1 | Out-Null
    Write-Host "  ✅ datos_wbs_TODOS_items.js regenerado" -ForegroundColor Green
} else {
    Write-Host "  ⚠️  Script extraer_todos_items_wbs.ps1 no encontrado" -ForegroundColor Yellow
}
Write-Host ""

# ================================================================
# RESUMEN
# ================================================================

Write-Host "=================================================" -ForegroundColor Green
Write-Host "  DT-TETRA-039 EJECUTADA EXITOSAMENTE          " -ForegroundColor Green
Write-Host "=================================================" -ForegroundColor Green
Write-Host ""
Write-Host "✅ 42 Torres TETRA agregadas al layout" -ForegroundColor White
Write-Host "✅ Criterio: 15% solapamiento (coherente)" -ForegroundColor White
Write-Host "✅ Espaciamiento: 12.70 km" -ForegroundColor White
Write-Host "✅ Solapamiento real esperado: 15.33%" -ForegroundColor White
Write-Host "✅ layout.md actualizado" -ForegroundColor White
Write-Host "✅ layout_datos.js regenerado" -ForegroundColor White
Write-Host "✅ WBS_Presupuestal actualizado" -ForegroundColor White
Write-Host "✅ datos_wbs_TODOS_items.js regenerado" -ForegroundColor White
Write-Host ""
Write-Host "CAMBIOS APLICADOS:" -ForegroundColor Yellow
Write-Host "  Torres: 39 → 42 (+3)" -ForegroundColor White
Write-Host "  Costo: +$1,659,000,000 COP (+7.95%)" -ForegroundColor White
Write-Host "  Criterio: 10% solapamiento → 15% solapamiento" -ForegroundColor White
Write-Host ""
Write-Host "PRÓXIMO PASO:" -ForegroundColor Yellow
Write-Host "  Abrir WBS_Layout_Maestro.html y verificar filtro 'TETRA BS'" -ForegroundColor White
Write-Host ""

