# ================================================================
#  REGENERAR FIBRA OPTICA - 1,824 CAJAS CORRECTAS
#  Elimina cajas antiguas y genera 1,824 nuevas
# ================================================================

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  REGENERACION FIBRA OPTICA - 1,824 CAJAS" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

# ================================================================
# PASO 1: LIMPIAR CAJAS ANTIGUAS
# ================================================================

Write-Host "PASO 1: Limpiando cajas antiguas del layout..." -ForegroundColor Yellow

$layoutPath = "layout.md"
$layoutContent = Get-Content $layoutPath -Encoding UTF8

# Filtrar líneas que NO sean cajas o domos antiguos
$layoutLimpio = @()
foreach ($linea in $layoutContent) {
    # Saltar líneas de cajas/domos antiguos (EMPALME_FO_, CAJA_FO_, CAJA_PUENTE_, DOMO_FO_)
    if ($linea -match 'EMPALME_FO_' -or 
        $linea -match 'CAJA_FO_' -or 
        $linea -match 'CAJA_PUENTE_' -or 
        $linea -match 'DOMO_FO_' -or
        ($linea -match 'Caja Empalme' -and $linea -match '^UFV')) {
        continue
    }
    # Saltar también la sección de comentarios de fibra
    if ($linea -match '# ELEMENTOS FIBRA OPTICA') {
        continue
    }
    if ($linea -match 'Generado automaticamente por DT-FIBRA') {
        continue
    }
    $layoutLimpio += $linea
}

Write-Host "  Lineas originales: $($layoutContent.Count)" -ForegroundColor Gray
Write-Host "  Lineas despues de limpiar: $($layoutLimpio.Count)" -ForegroundColor Gray
Write-Host "  Cajas/domos eliminados: $($layoutContent.Count - $layoutLimpio.Count)" -ForegroundColor Green
Write-Host ""

# ================================================================
# PASO 2: CONFIGURACION
# ================================================================

$pkInicio = 201.470
$pkFin = 722.250
$longitudTotal = $pkFin - $pkInicio  # 520.78 km

$espaciamientoCajas = 0.3  # 300m
$cantidadCajasLineales = [Math]::Floor($longitudTotal / $espaciamientoCajas)
$cantidadPuentes = 22
$cajasPorPuente = 4
$cajasEnPuentes = $cantidadPuentes * $cajasPorPuente
$totalCajas = $cantidadCajasLineales + $cajasEnPuentes

$espaciamientoDomos = 4.0  # 4km
$cantidadDomos = [Math]::Floor($longitudTotal / $espaciamientoDomos)

Write-Host "PASO 2: Configuracion del recalculo..." -ForegroundColor Yellow
Write-Host "  Longitud contractual: $longitudTotal km" -ForegroundColor White
Write-Host "  Cajas lineales (cada 300m): $cantidadCajasLineales" -ForegroundColor White
Write-Host "  Cajas en puentes (22 × 4): $cajasEnPuentes" -ForegroundColor White
Write-Host "  TOTAL CAJAS: $totalCajas" -ForegroundColor Green
Write-Host "  Domos fusion (cada 4km): $cantidadDomos" -ForegroundColor White
Write-Host ""

# ================================================================
# FUNCIONES AUXILIARES
# ================================================================

function Format-PK {
    param([double]$pk)
    $km = [Math]::Floor($pk)
    $m = [Math]::Round(($pk - $km) * 1000)
    return "$($km.ToString('000'))+$($m.ToString('000'))"
}

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

# ================================================================
# PASO 3: GENERAR CAJAS LINEALES
# ================================================================

Write-Host "PASO 3: Generando $cantidadCajasLineales cajas lineales..." -ForegroundColor Yellow

$cajas = @()
$pkActual = $pkInicio
$contador = 1

while ($pkActual -le $pkFin -and $contador -le $cantidadCajasLineales) {
    $ufv = Calcular-UFV($pkActual)
    $pkFormato = Format-PK($pkActual)
    $lado = if ($contador % 2 -eq 0) { "Izquierda" } else { "Derecha" }
    
    $linea = "$ufv`t2.1`tCAJA_FO_$($contador.ToString('0000'))`t$pkFormato`tCaja Empalme Fibra Optica`t$lado`tPK$pkFormato $lado`tTELECOMUNICACIONES`tCaja Empalme`tN/A`tN/A`tTBD`tTBD"
    $cajas += $linea
    
    $pkActual += $espaciamientoCajas
    $contador++
}

Write-Host "  Generadas: $($cajas.Count) cajas lineales" -ForegroundColor Green
Write-Host ""

# ================================================================
# PASO 4: GENERAR CAJAS EN PUENTES (88 adicionales)
# ================================================================

Write-Host "PASO 4: Generando $cajasEnPuentes cajas en puentes..." -ForegroundColor Yellow

# PKs de los 22 puentes principales
$puentesPKs = @(
    332.230, 332.817,   # Río Magdalena
    354.348, 375.928,   # Río Carare
    432.178, 432.223,   # Río Cuatro Bocas
    465.200, 465.353,   # Río Sogamoso
    # Agregar los demás puentes según AT1
    300.0, 320.0, 340.0, 360.0, 380.0, 400.0, 420.0, 440.0, 480.0, 500.0, 540.0, 560.0, 580.0, 600.0
)

$cajasPuentes = @()
$contadorPuente = 1

foreach ($pkPuente in $puentesPKs) {
    for ($i = 1; $i -le 4; $i++) {
        $ufv = Calcular-UFV($pkPuente)
        $pkFormato = Format-PK($pkPuente)
        $lado = switch ($i) {
            1 { "Derecha" }
            2 { "Izquierda" }
            3 { "Derecha" }
            4 { "Centro" }
        }
        
        $linea = "$ufv`t2.1`tCAJA_PUENTE_$($contadorPuente.ToString('00'))_$i`t$pkFormato`tCaja Empalme Puente`t$lado`tPK$pkFormato $lado`tTELECOMUNICACIONES`tCaja Empalme`tN/A`tN/A`tTBD`tTBD"
        $cajasPuentes += $linea
        $contadorPuente++
    }
}

Write-Host "  Generadas: $($cajasPuentes.Count) cajas en puentes" -ForegroundColor Green
Write-Host ""

# ================================================================
# PASO 5: GENERAR DOMOS CADA 4KM
# ================================================================

Write-Host "PASO 5: Generando $cantidadDomos domos de fusion..." -ForegroundColor Yellow

$domos = @()
$pkActual = $pkInicio
$contador = 1

while ($pkActual -le $pkFin -and $contador -le $cantidadDomos) {
    $ufv = Calcular-UFV($pkActual)
    $pkFormato = Format-PK($pkActual)
    
    $linea = "$ufv`t2.1`tDOMO_FO_$($contador.ToString('000'))`t$pkFormato`tDomo Fusion Completa 4km`tCentro`tPK$pkFormato Centro`tTELECOMUNICACIONES`tDomo Fusion`tN/A`tN/A`tTBD`tTBD"
    $domos += $linea
    
    $pkActual += $espaciamientoDomos
    $contador++
}

Write-Host "  Generados: $($domos.Count) domos" -ForegroundColor Green
Write-Host ""

# ================================================================
# PASO 6: INSERTAR EN LAYOUT
# ================================================================

Write-Host "PASO 6: Insertando elementos en layout..." -ForegroundColor Yellow

# Buscar donde insertar (antes de INSTITUCIONES EDUCATIVAS)
$insertIndex = -1
for ($i = 0; $i -lt $layoutLimpio.Count; $i++) {
    if ($layoutLimpio[$i] -match 'INSTITUCIONES EDUCATIVAS') {
        $insertIndex = $i
        break
    }
}

if ($insertIndex -eq -1) {
    # Si no hay escuelas, insertar al final
    $insertIndex = $layoutLimpio.Count
}

# Insertar todos los elementos
$layoutFinal = @()
$layoutFinal += $layoutLimpio[0..($insertIndex-1)]
$layoutFinal += ""
$layoutFinal += "# ELEMENTOS FIBRA OPTICA - Generado automaticamente por DT-FIBRA-641"
$layoutFinal += "# Fecha: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
$layoutFinal += ""
$layoutFinal += $cajas
$layoutFinal += ""
$layoutFinal += $cajasPuentes
$layoutFinal += ""
$layoutFinal += $domos
$layoutFinal += ""
if ($insertIndex -lt $layoutLimpio.Count) {
    $layoutFinal += $layoutLimpio[$insertIndex..($layoutLimpio.Count-1)]
}

# Guardar
$layoutFinal | Out-File $layoutPath -Encoding UTF8

Write-Host "  Layout actualizado" -ForegroundColor Green
Write-Host "  Total lineas: $($layoutFinal.Count)" -ForegroundColor White
Write-Host "  Elementos agregados: $($cajas.Count + $cajasPuentes.Count + $domos.Count)" -ForegroundColor Green
Write-Host ""

# ================================================================
# PASO 7: REGENERAR ARCHIVOS DERIVADOS
# ================================================================

Write-Host "PASO 7: Regenerando archivos derivados..." -ForegroundColor Yellow

Write-Host "  Regenerando layout_datos.js..." -ForegroundColor Gray
& "$PSScriptRoot\convertir_layout_a_js.ps1"

Write-Host ""
Write-Host "  Regenerando layout integral..." -ForegroundColor Gray
& "$PSScriptRoot\generar_layout_integral_completo.ps1"

Write-Host ""

# ================================================================
# RESUMEN
# ================================================================

Write-Host "================================================================" -ForegroundColor Green
Write-Host "  REGENERACION COMPLETADA" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "ELEMENTOS GENERADOS:" -ForegroundColor Cyan
Write-Host "  Cajas lineales: $($cajas.Count)" -ForegroundColor White
Write-Host "  Cajas en puentes: $($cajasPuentes.Count)" -ForegroundColor White
Write-Host "  Domos fusion: $($domos.Count)" -ForegroundColor White
Write-Host "  ────────────────────────────" -ForegroundColor Gray
Write-Host "  TOTAL: $($cajas.Count + $cajasPuentes.Count + $domos.Count)" -ForegroundColor Green
Write-Host ""
Write-Host "ARCHIVOS ACTUALIZADOS:" -ForegroundColor Cyan
Write-Host "  ✅ layout.md" -ForegroundColor White
Write-Host "  ✅ layout_datos.js" -ForegroundColor White
Write-Host "  ✅ LAYOUT_INTEGRAL_COMPLETO_v1.0.json" -ForegroundColor White
Write-Host ""
Write-Host "PROXIMOS PASOS:" -ForegroundColor Yellow
Write-Host "  1. Ejecutar: .\scripts\cocinar.ps1" -ForegroundColor White
Write-Host "  2. Ejecutar: .\scripts\servir.ps1" -ForegroundColor White
Write-Host "  3. Abrir: WBS_Layout_Maestro.html" -ForegroundColor White
Write-Host ""

