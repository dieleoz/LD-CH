# SCRIPT: Completar 37 Estaciones TETRA
# Fecha: 11 Octubre 2025
# Base: Criterio tecnico - 37 estaciones, espaciamiento 12 km

Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "  COMPLETANDO 37 ESTACIONES TETRA               " -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""

# Parametros del corredor
$pkInicio = 201.470  # PK 201+470 (Mexico)
$pkFin = 722.250     # PK 722+250 (Chiriguana)
$longitudTotal = $pkFin - $pkInicio  # 520.78 km
$numEstaciones = 37
$espaciamiento = $longitudTotal / ($numEstaciones - 1)  # 14.08 km aprox

Write-Host "PARAMETROS:" -ForegroundColor Yellow
Write-Host "  PK Inicio: $pkInicio" -ForegroundColor White
Write-Host "  PK Fin: $pkFin" -ForegroundColor White
Write-Host "  Longitud total: $([math]::Round($longitudTotal, 2)) km" -ForegroundColor White
Write-Host "  Estaciones TETRA: $numEstaciones" -ForegroundColor White
Write-Host "  Espaciamiento: $([math]::Round($espaciamiento, 2)) km" -ForegroundColor White
Write-Host ""

# Generar las 37 estaciones
$estaciones = @()

for ($i = 0; $i -lt $numEstaciones; $i++) {
    $pk = $pkInicio + ($i * $espaciamiento)
    $pkEntero = [math]::Floor($pk)
    $pkDecimal = [math]::Round(($pk - $pkEntero) * 1000)
    $pkFormato = "$pkEntero+$pkDecimal"
    
    $estaciones += @{
        numero = $i + 1
        id = "EBT_$(($i+1).ToString('00'))"
        pk_numerico = $pk
        pk_formato = $pkFormato
        nombre = "Estacion Base TETRA $(($i+1).ToString('00'))"
        ubicacion = "PK$pkFormato Derecha"
    }
}

Write-Host "ESTACIONES TETRA GENERADAS:" -ForegroundColor Cyan
Write-Host ""

# Mostrar primeras 10
for ($i = 0; $i -lt 10; $i++) {
    $est = $estaciones[$i]
    Write-Host "  $($est.numero). $($est.id) - PK $($est.pk_formato)" -ForegroundColor White
}
Write-Host "  ..." -ForegroundColor Gray

# Mostrar últimas 3
for ($i = 34; $i -lt 37; $i++) {
    $est = $estaciones[$i]
    Write-Host "  $($est.numero). $($est.id) - PK $($est.pk_formato)" -ForegroundColor White
}

Write-Host ""
Write-Host "Total estaciones generadas: $($estaciones.Count)" -ForegroundColor Green
Write-Host ""

# Guardar a JSON
$salida = @{
    parametros = @{
        pk_inicio = $pkInicio
        pk_fin = $pkFin
        longitud_km = $longitudTotal
        num_estaciones = $numEstaciones
        espaciamiento_km = $espaciamiento
    }
    estaciones = $estaciones
    fecha_generacion = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
}

$jsonPath = "VIII. Documentos Maestros y Metodologia/TETRA_37_ESTACIONES_v1.0.json"
$salida | ConvertTo-Json -Depth 5 | Out-File $jsonPath -Encoding UTF8

Write-Host "Archivo generado: $jsonPath" -ForegroundColor Green
Write-Host ""

# Generar líneas para agregar al layout.md
Write-Host "GENERANDO LINEAS PARA LAYOUT.MD..." -ForegroundColor Yellow
Write-Host ""

$lineasLayout = @()
foreach ($est in $estaciones) {
    $linea = "| TBD | 2.1/2.2 | $($est.id) | $($est.pk_formato) | $($est.nombre) | Derecha | $($est.ubicacion) | TELECOMUNICACIONES | TETRA BS | TBD | TIPO 5 | TBD | TBD |"
    $lineasLayout += $linea
}

$layoutPath = "VIII. Documentos Maestros y Metodologia/TETRA_37_LINEAS_LAYOUT.txt"
$lineasLayout -join "`n" | Out-File $layoutPath -Encoding UTF8

Write-Host "Lineas para layout generadas: $layoutPath" -ForegroundColor Green
Write-Host "  Total lineas: $($lineasLayout.Count)" -ForegroundColor White
Write-Host ""

Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "  37 ESTACIONES TETRA COMPLETADAS               " -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""
# ================================================================
# PASO ADICIONAL: SINCRONIZAR WBS PRESUPUESTAL (NUEVO v14.7.6)
# ================================================================

Write-Host "Sincronizando WBS Presupuestal..." -ForegroundColor Yellow

$totalEstaciones = 37
Write-Host "  Total estaciones TETRA: $totalEstaciones" -ForegroundColor Cyan

# Actualizar WBS_Presupuestal_v2.0.md item 2.1.100 (Torres autosoportadas)
$wbsPath = "..\IX. WBS y Planificacion\WBS_Presupuestal_v2.0.md"
if (Test-Path $wbsPath) {
    $wbsContent = Get-Content $wbsPath -Raw -Encoding UTF8
    
    # Actualizar cantidad de torres TETRA (item 2.1.100)
    $wbsContent = $wbsContent -replace '(\| \*\*2\.1\.100\*\* \| Torre[^\|]+\| UND \| )(\d+)([ \|])', "`${1}$totalEstaciones`${3}"
    
    $wbsContent | Out-File -FilePath $wbsPath -Encoding UTF8 -Force
    Write-Host "  ✅ WBS_Presupuestal_v2.0.md actualizado" -ForegroundColor Green
    Write-Host "     Item 2.1.100: $totalEstaciones torres" -ForegroundColor Gray
}

Write-Host ""

# Regenerar datos WBS para interfaces HTML
Write-Host "Regenerando datos_wbs_TODOS_items.js..." -ForegroundColor Yellow
Write-Host "  Ejecutando extraer_todos_items_wbs.ps1..." -ForegroundColor Gray

& "$PSScriptRoot\extraer_todos_items_wbs.ps1" 2>&1 | Out-String | ForEach-Object {
    if ($_ -match "Items extraidos|Archivo generado|JS regenerado") {
        Write-Host "  $_" -ForegroundColor Gray
    }
}

Write-Host "  ✅ datos_wbs_TODOS_items.js regenerado" -ForegroundColor Green
Write-Host ""

Write-Host "SIGUIENTE PASO:" -ForegroundColor Yellow
Write-Host "  1. Revisa: $jsonPath" -ForegroundColor White
Write-Host "  2. Revisa: $layoutPath" -ForegroundColor White
Write-Host "  3. Integra las lineas en layout.md si corresponde" -ForegroundColor White
Write-Host "  4. Ejecutar: .\scripts\cocinar.ps1 -Sistema 02" -ForegroundColor White
Write-Host "  5. Ejecutar: .\scripts\servir.ps1 -Sistema 02" -ForegroundColor White
Write-Host ""

