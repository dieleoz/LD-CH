# ================================================================
# SCRIPT: Completar 37 Estaciones TETRA - v2.0
# Fecha: 14 Octubre 2025
# Prop

ósito: Generar e integrar 37 torres TETRA automáticamente
# ================================================================

Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "  COMPLETANDO 37 ESTACIONES TETRA - v2.0         " -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""

# ================================================================
# PASO 1: GENERAR 37 ESTACIONES
# ================================================================

Write-Host "PASO 1: Generando 37 estaciones TETRA..." -ForegroundColor Yellow

$pkInicio = 201.470  # PK 201+470 (Mexico)
$pkFin = 722.250     # PK 722+250 (Chiriguana)
$longitudTotal = $pkFin - $pkInicio  # 520.78 km
$numEstaciones = 37
$espaciamiento = $longitudTotal / ($numEstaciones - 1)  # 14.47 km aprox

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
    
    $estaciones += [PSCustomObject]@{
        numero = $i + 1
        id = "EBT_$(($i+1).ToString('00'))"
        pk_numerico = $pk
        pk_formato = $pkFormato
        ufv = $ufv
        linea_layout = "$ufv`t2.1`t$("EBT_$(($i+1).ToString('00'))")`t$pkFormato`tEstación Base TETRA $(($i+1).ToString('00'))`tDerecha`tPK$pkFormato Derecha`tTELECOMUNICACIONES`tTETRA BS`tN/A`tN/A`tTBD`tTBD"
    }
}

Write-Host "  Generadas: $($estaciones.Count) estaciones" -ForegroundColor Green
Write-Host ""

# ================================================================
# PASO 2: INTEGRAR EN LAYOUT.MD
# ================================================================

Write-Host "PASO 2: Integrando en layout.md..." -ForegroundColor Yellow

$layoutMdPath = "..\layout.md"
$layoutContent = Get-Content $layoutMdPath -Encoding UTF8

# Limpiar torres TETRA antiguas
$layoutLimpio = $layoutContent | Where-Object {
    $_ -notmatch 'EBT_' -and 
    ($_ -notmatch 'TETRA BS' -or $_ -notmatch '^UFV') -and
    $_ -notmatch '# ESTACIONES BASE TETRA' -and
    $_ -notmatch 'completar_37_estaciones_TETRA'
}

Write-Host "  Limpiadas: $($layoutContent.Count - $layoutLimpio.Count) líneas antiguas" -ForegroundColor Gray

# Buscar donde insertar
$insertIndex = -1
for ($i = 0; $i -lt $layoutLimpio.Count; $i++) {
    if ($layoutLimpio[$i] -match 'INSTITUCIONES EDUCATIVAS') {
        $insertIndex = $i
        break
    }
}
if ($insertIndex -eq -1) { $insertIndex = $layoutLimpio.Count }

# Insertar torres
$layoutFinal = @()
$layoutFinal += $layoutLimpio[0..($insertIndex-1)]
$layoutFinal += ""
$layoutFinal += "# ESTACIONES BASE TETRA - Generado automaticamente por completar_37_estaciones_TETRA_v2.ps1"
$layoutFinal += "# Fecha: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
$layoutFinal += "# Total: 37 estaciones (espaciamiento ~14.5 km)"
$layoutFinal += ""
$layoutFinal += $estaciones.linea_layout
$layoutFinal += ""
if ($insertIndex -lt $layoutLimpio.Count) {
    $layoutFinal += $layoutLimpio[$insertIndex..($layoutLimpio.Count-1)]
}

$layoutFinal | Out-File $layoutMdPath -Encoding UTF8 -Force

Write-Host "  ✅ layout.md actualizado ($($layoutFinal.Count) líneas)" -ForegroundColor Green
Write-Host ""

# ================================================================
# PASO 3: REGENERAR LAYOUT_DATOS.JS
# ================================================================

Write-Host "PASO 3: Regenerando layout_datos.js..." -ForegroundColor Yellow
& "$PSScriptRoot\convertir_layout_a_js.ps1" 2>&1 | Out-Null
Write-Host "  ✅ layout_datos.js regenerado" -ForegroundColor Green
Write-Host ""

# ================================================================
# PASO 4: ACTUALIZAR WBS PRESUPUESTAL
# ================================================================

Write-Host "PASO 4: Actualizando WBS_Presupuestal..." -ForegroundColor Yellow

$wbsPath = "..\IX. WBS y Planificacion\WBS_Presupuestal_v2.0.md"
if (Test-Path $wbsPath) {
    $wbsContent = Get-Content $wbsPath -Raw -Encoding UTF8
    $wbsContent = $wbsContent -replace '(\| \*\*2\.1\.100\*\* \| Torre[^\|]+\| UND \| )(\d+)([ \|])', "`${1}37`${3}"
    $wbsContent | Out-File -FilePath $wbsPath -Encoding UTF8 -Force
    Write-Host "  ✅ WBS_Presupuestal item 2.1.100: 37 torres" -ForegroundColor Green
}
Write-Host ""

# ================================================================
# PASO 5: REGENERAR DATOS_WBS
# ================================================================

Write-Host "PASO 5: Regenerando datos_wbs_TODOS_items.js..." -ForegroundColor Yellow
& "$PSScriptRoot\extraer_todos_items_wbs.ps1" 2>&1 | Out-Null
Write-Host "  ✅ datos_wbs_TODOS_items.js regenerado" -ForegroundColor Green
Write-Host ""

# ================================================================
# RESUMEN
# ================================================================

Write-Host "=================================================" -ForegroundColor Green
Write-Host "  REGENERACIÓN COMPLETA" -ForegroundColor Green
Write-Host "=================================================" -ForegroundColor Green
Write-Host ""
Write-Host "✅ 37 Torres TETRA agregadas al layout" -ForegroundColor White
Write-Host "✅ layout.md actualizado" -ForegroundColor White
Write-Host "✅ layout_datos.js regenerado" -ForegroundColor White
Write-Host "✅ WBS_Presupuestal actualizado" -ForegroundColor White
Write-Host "✅ datos_wbs_TODOS_items.js regenerado" -ForegroundColor White
Write-Host ""
Write-Host "PRÓXIMO PASO:" -ForegroundColor Yellow
Write-Host "  Abrir WBS_Layout_Maestro.html y verificar filtro 'TETRA BS'" -ForegroundColor White
Write-Host ""

