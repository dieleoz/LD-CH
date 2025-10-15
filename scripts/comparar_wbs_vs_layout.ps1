# ================================================================
# SCRIPT: Comparar WBS vs Layout - Detectar Faltantes
# Fecha: 15 Octubre 2025
# Propósito: Identificar equipos en WBS que NO están en layout
# ================================================================

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  COMPARACIÓN WBS vs LAYOUT" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

# Leer WBS
$wbsPath = "IX. WBS y Planificacion\WBS_Presupuestal_v2.0.md"
$wbsContent = Get-Content $wbsPath -Raw -Encoding UTF8

# Leer Layout
$layoutPath = "layout.md"
$layoutContent = Get-Content $layoutPath -Encoding UTF8

# ================================================================
# EXTRAER ITEMS DEL WBS POR CAPÍTULO
# ================================================================

Write-Host "CAPÍTULO 1: CONTROL Y SEÑALIZACION" -ForegroundColor Yellow
Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray

# CTC Virtual
if ($wbsContent -match '\*\*1\.1\.100\*\*[^\|]+\|\s*UND\s*\|\s*(\d+)') {
    $ctcVirtual = [int]$Matches[1]
    Write-Host "  CTC Virtual: $ctcVirtual unidades" -ForegroundColor White
    
    $enLayout = ($layoutContent | Where-Object { $_ -match 'CTC' }).Count
    Write-Host "  En layout: $enLayout" -ForegroundColor $(if ($enLayout -eq 0) { "Red" } else { "Green" })
}

# ATP Embarcado
if ($wbsContent -match '\*\*1\.2\.100\*\*[^\|]+\|\s*UND\s*\|\s*(\d+)') {
    $atp = [int]$Matches[1]
    Write-Host "  ATP Embarcado: $atp unidades" -ForegroundColor White
}

# Enclavamientos ENCE
if ($wbsContent -match '\*\*1\.3\.100\*\*[^\|]+\|\s*UND\s*\|\s*(\d+)') {
    $ence = [int]$Matches[1]
    Write-Host "  ENCE: $ence unidades" -ForegroundColor White
    
    $enLayout = ($layoutContent | Where-Object { $_ -match 'ENCE' }).Count
    Write-Host "  En layout: $enLayout" -ForegroundColor $(if ($enLayout -eq 0) { "Red" } else { "Green" })
}

# Desvíos
$desviosPatron = '\*\*1\.4\.100\*\*[^\|]+\|\s*UND\s*\|\s*(\d+)'
if ($wbsContent -match $desviosPatron) {
    $desvios = [int]$Matches[1]
    Write-Host "  Desvíos motorizados: $desvios unidades" -ForegroundColor White
    
    $enLayout = ($layoutContent | Where-Object { $_ -match 'Desv' }).Count
    Write-Host "  En layout: $enLayout" -ForegroundColor $(if ($enLayout -eq 0) { "Red" } else { "Green" })
}

Write-Host ""

# ================================================================
# CAPÍTULO 2: TELECOMUNICACIONES
# ================================================================

Write-Host "CAPÍTULO 2: TELECOMUNICACIONES" -ForegroundColor Yellow
Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray

# TETRA
if ($wbsContent -match '\*\*2\.1\.100\*\*[^\|]+\|\s*UND\s*\|\s*(\d+)') {
    $tetra = [int]$Matches[1]
    Write-Host "  TETRA Torres: $tetra unidades" -ForegroundColor White
    
    $enLayout = ($layoutContent | Where-Object { $_ -match 'EBT_' }).Count
    Write-Host "  En layout: $enLayout" -ForegroundColor $(if ($enLayout -eq $tetra) { "Green" } else { "Red" })
}

# GSM-R
if ($wbsContent -match '\*\*2\.2\.100\*\*[^\|]+\|\s*UND\s*\|\s*(\d+)') {
    $gsmr = [int]$Matches[1]
    Write-Host "  GSM-R: $gsmr unidades" -ForegroundColor White
    
    $enLayout = ($layoutContent | Where-Object { $_ -match 'GSM' }).Count
    Write-Host "  En layout: $enLayout" -ForegroundColor $(if ($enLayout -eq 0) { "Red" } else { "Green" })
}

# Fibra - Cajas empalme
if ($wbsContent -match '\*\*2\.3\.100\*\*[^\|]+\|\s*UND\s*\|\s*(\d+)') {
    $cajasFibra = [int]$Matches[1]
    Write-Host "  Cajas Fibra: $cajasFibra unidades" -ForegroundColor White
    
    $enLayout = ($layoutContent | Where-Object { $_ -match 'CAJA_FO_' }).Count
    Write-Host "  En layout: $enLayout" -ForegroundColor $(if ($enLayout -gt 0) { "Green" } else { "Red" })
}

Write-Host ""

# ================================================================
# CAPÍTULO 3: SISTEMAS ITS
# ================================================================

Write-Host "CAPÍTULO 3: SISTEMAS ITS Y SEGURIDAD" -ForegroundColor Yellow
Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray

# CCTV
if ($wbsContent -match '\*\*3\.1\.100\*\*[^\|]+\|\s*UND\s*\|\s*(\d+)') {
    $cctv = [int]$Matches[1]
    Write-Host "  CCTV Cámaras: $cctv unidades" -ForegroundColor White
    
    $enLayout = ($layoutContent | Where-Object { $_ -match 'CCTV|CAM' }).Count
    Write-Host "  En layout: $enLayout" -ForegroundColor $(if ($enLayout -eq 0) { "Red" } else { "Green" })
}

Write-Host ""

# ================================================================
# CAPÍTULO 4: PASOS A NIVEL
# ================================================================

Write-Host "CAPÍTULO 4: PASOS A NIVEL" -ForegroundColor Yellow
Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray

# PAN Tipo C
if ($wbsContent -match '\*\*4\.1\.100\*\*[^\|]+\|\s*UND\s*\|\s*(\d+)') {
    $panC = [int]$Matches[1]
    Write-Host "  PAN Tipo C: $panC unidades" -ForegroundColor White
    
    $enLayout = ($layoutContent | Where-Object { $_ -match 'PAN.*C|PN_C' }).Count
    Write-Host "  En layout: $enLayout" -ForegroundColor $(if ($enLayout -eq 0) { "Red" } else { "Green" })
}

Write-Host ""

# ================================================================
# RESUMEN
# ================================================================

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  RESUMEN" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$totalLineasLayout = ($layoutContent | Where-Object { $_ -match "`t" -and $_ -match '^UFV' }).Count
Write-Host "Total equipos en layout.md: $totalLineasLayout" -ForegroundColor White
Write-Host ""

Write-Host "⚠️  PROBLEMA DETECTADO:" -ForegroundColor Red
Write-Host "  Los scripts de DT están BORRANDO equipos de otros capítulos" -ForegroundColor Red
Write-Host "  al regenerar layout.md" -ForegroundColor Red
Write-Host ""

