# ================================================================
# SCRIPT: Completar 37 Estaciones TETRA (Solapamiento 20%)
# ================================================================
# Propósito: Volver layout a 37 torres TETRA (criterio definitivo)
# Fecha: 15 Octubre 2025
# DT: DT-TETRA-040-2025-10-15
# ================================================================

$ErrorActionPreference = "Stop"

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  GENERACIÓN LAYOUT - 37 TORRES TETRA (SOLAPAMIENTO 20%)" -ForegroundColor Cyan
Write-Host "================================================================`n" -ForegroundColor Cyan

# Importar módulo de preservación
Import-Module "$PSScriptRoot\modules\LayoutPreserver.psm1" -Force
Import-Module "$PSScriptRoot\mapeo_dispositivo_categoria.psm1" -Force

# ================================================================
# CONFIGURACIÓN
# ================================================================
$PKInicio = 201.470
$PKFin = 722.250
$LongitudTotal = $PKFin - $PKInicio  # 520.78 km

$NumeroTorres = 37
$Solapamiento = 0.20  # 20%
$EspaciamientoPromedio = $LongitudTotal / $NumeroTorres  # ~14.08 km

Write-Host "📊 PARÁMETROS:" -ForegroundColor Yellow
Write-Host "   Longitud total: $LongitudTotal km" -ForegroundColor White
Write-Host "   Número de torres: $NumeroTorres" -ForegroundColor White
Write-Host "   Solapamiento: $($Solapamiento * 100)%" -ForegroundColor White
Write-Host "   Espaciamiento promedio: $([math]::Round($EspaciamientoPromedio, 2)) km`n" -ForegroundColor White

# ================================================================
# PASO 1: CARGAR LAYOUT COMPLETO
# ================================================================
Write-Host "📂 PASO 1: Cargando layout completo..." -ForegroundColor Green
$layoutCompleto = Get-LayoutCompleto
$totalInicial = ($layoutCompleto | Where-Object { $_ -match "`t" -and $_ -match "^UFV" }).Count
Write-Host "   ✅ Layout cargado: $totalInicial equipos`n" -ForegroundColor Green

# ================================================================
# PASO 2: ELIMINAR SOLO TORRES TETRA ANTERIORES
# ================================================================
Write-Host "🗑️  PASO 2: Eliminando torres TETRA anteriores..." -ForegroundColor Yellow
$layoutSinTETRA = Remove-EquiposPorCategoria -Layout $layoutCompleto `
                                              -Categoria "TELECOMUNICACIONES" `
                                              -FiltroAdicional "TETRA BS"

$totalSinTETRA = ($layoutSinTETRA | Where-Object { $_ -match "`t" -and $_ -match "^UFV" }).Count
$eliminados = $totalInicial - $totalSinTETRA
Write-Host "   ✅ Torres TETRA eliminadas: $eliminados" -ForegroundColor Yellow
Write-Host "   ✅ Equipos restantes: $totalSinTETRA`n" -ForegroundColor Yellow

# ================================================================
# PASO 3: GENERAR 37 TORRES TETRA
# ================================================================
Write-Host "🏗️  PASO 3: Generando 37 torres TETRA..." -ForegroundColor Cyan

$nuevasTorres = @()
$ufvActual = 26  # Empezar en UFVF26

for ($i = 1; $i -le $NumeroTorres; $i++) {
    # Calcular PK con distribución uniforme
    $pk = $PKInicio + ($i - 1) * $EspaciamientoPromedio
    
    # Formatear PK
    $pkEntero = [math]::Floor($pk)
    $pkDecimal = [int][math]::Round(($pk - $pkEntero) * 1000)
    if ($pkDecimal -ge 1000) { $pkEntero++; $pkDecimal = 0 }
    $pkFormateado = "PK{0:000}+{1:000}" -f $pkEntero, $pkDecimal
    
    # ID de torre
    $torreID = "EBT_{0:D2}" -f $i
    
    # Obtener categoría dinámica
    $categoria = Get-CategoriaDesdeDispositivo -Dispositivo "TETRA BS" `
                                                -Nombre "Estación Base TETRA" `
                                                -Descripcion "Torre autosoportada 30m"
    
    # Crear línea de equipo
    $linea = "UFVF{0:D2}`t{1}`t{2}`tEstación Base TETRA`tTorre autosoportada 30m`tETSI 300-396`tTransceptor dual banda 380-400 MHz, potencia 25W`t{3}`tTETRA BS" -f `
        $ufvActual, $pkFormateado, $torreID, $categoria
    
    $nuevasTorres += $linea
    
    # Avanzar UFV cada ~20 torres (cambio de zona)
    if ($i % 20 -eq 0 -and $i -lt $NumeroTorres) {
        $ufvActual++
    }
}

Write-Host "   ✅ Generadas $($nuevasTorres.Count) torres TETRA`n" -ForegroundColor Cyan

# ================================================================
# PASO 4: AGREGAR NUEVAS TORRES
# ================================================================
Write-Host "➕ PASO 4: Agregando nuevas torres al layout..." -ForegroundColor Magenta
$layoutFinal = Add-EquiposNuevos -Layout $layoutSinTETRA -EquiposNuevos $nuevasTorres
$totalFinal = ($layoutFinal | Where-Object { $_ -match "`t" -and $_ -match "^UFV" }).Count
Write-Host "   ✅ Layout final: $totalFinal equipos`n" -ForegroundColor Magenta

# ================================================================
# PASO 5: VERIFICAR PRESERVACIÓN
# ================================================================
Write-Host "🔍 PASO 5: Verificando preservación de categorías..." -ForegroundColor Yellow

$intactas = Test-CategoriasIntactas -LayoutOriginal $layoutCompleto `
                                     -LayoutNuevo $layoutFinal `
                                     -CategoriaModificada "TELECOMUNICACIONES"

if (-not $intactas) {
    Write-Host "`n❌ ERROR: Categorías no preservadas correctamente" -ForegroundColor Red
    exit 1
}

Write-Host "`n✅ Todas las categorías NO afectadas preservadas`n" -ForegroundColor Green

# ================================================================
# PASO 6: GUARDAR LAYOUT
# ================================================================
Write-Host "💾 PASO 6: Guardando layout completo..." -ForegroundColor Green
Save-LayoutCompleto -Layout $layoutFinal -CrearBackup

# ================================================================
# PASO 7: REGENERAR LAYOUT_DATOS.JS
# ================================================================
Write-Host "`n🔄 PASO 7: Regenerando layout_datos.js..." -ForegroundColor Cyan
& "$PSScriptRoot\convertir_layout_a_js.ps1"

# ================================================================
# RESUMEN FINAL
# ================================================================
Write-Host "`n================================================================" -ForegroundColor Green
Write-Host "  ✅ LAYOUT ACTUALIZADO EXITOSAMENTE" -ForegroundColor Green
Write-Host "================================================================`n" -ForegroundColor Green

Write-Host "📊 RESUMEN:" -ForegroundColor Yellow
Write-Host "   Equipos iniciales: $totalInicial" -ForegroundColor White
Write-Host "   Torres TETRA eliminadas: $eliminados" -ForegroundColor White
Write-Host "   Torres TETRA nuevas: $($nuevasTorres.Count)" -ForegroundColor White
Write-Host "   Equipos finales: $totalFinal" -ForegroundColor White
Write-Host "   Diferencia neta: $($totalFinal - $totalInicial)" -ForegroundColor White

Write-Host "`n✅ Layout guardado con backup automático" -ForegroundColor Green
Write-Host "✅ layout_datos.js regenerado" -ForegroundColor Green
Write-Host "`n🎯 Siguiente paso: Validar WBS y verificar layout completo`n" -ForegroundColor Cyan

