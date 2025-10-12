# EXTRACTOR AT5 - ITS y Seguridad
# Extrae ingredientes de sistemas CCTV, HBD, seguridad
# Version: 1.0 | Fecha: 10 Octubre 2025

Write-Host "EXTRACTOR AT5 - ITS y Seguridad" -ForegroundColor Cyan
Write-Host "=================================" -ForegroundColor Cyan
Write-Host ""

$archivoAT5 = "01. contrato en .md/FORMATEADO_APENDICE TECNICO 5.md"
$outputPath = "VIII. Documentos Maestros y Metodologia"

if (-not (Test-Path $archivoAT5)) {
    Write-Host "ERROR: No se encuentra $archivoAT5" -ForegroundColor Red
    exit 1
}

Write-Host "Leyendo AT5..." -ForegroundColor Yellow
$contenidoAT5 = Get-Content $archivoAT5 -Encoding UTF8 -Raw

Write-Host "Tamano del archivo: $([math]::Round((Get-Item $archivoAT5).Length / 1KB, 1)) KB" -ForegroundColor Gray

# Estructura para almacenar ingredientes extraidos
$ingredientesAT5 = @{
    cctv = @()
    hbd = @()
    seguridad = @()
    monitoreo = @()
    camaras = @()
    detectores = @()
    alarmas = @()
    sistemas_its = @()
    patrones_encontrados = @()
}

Write-Host ""
Write-Host "Buscando sistemas ITS y seguridad..." -ForegroundColor Yellow

# Buscar CCTV
$patronCCTV = "CCTV"
$matchesCCTV = [regex]::Matches($contenidoAT5, $patronCCTV, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesCCTV) {
    $ingredientesAT5.cctv += $match.Value.Trim()
}
Write-Host "  Referencias CCTV: $($ingredientesAT5.cctv.Count)" -ForegroundColor Green

# Buscar HBD
$patronHBD = "HBD"
$matchesHBD = [regex]::Matches($contenidoAT5, $patronHBD, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesHBD) {
    $ingredientesAT5.hbd += $match.Value.Trim()
}
Write-Host "  Referencias HBD: $($ingredientesAT5.hbd.Count)" -ForegroundColor Green

# Buscar Camaras
$patronCamara = "Camara"
$matchesCamara = [regex]::Matches($contenidoAT5, $patronCamara, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesCamara) {
    $ingredientesAT5.camaras += $match.Value.Trim()
}
Write-Host "  Referencias Camaras: $($ingredientesAT5.camaras.Count)" -ForegroundColor Green

# Buscar Seguridad
$patronSeguridad = "Seguridad"
$matchesSeguridad = [regex]::Matches($contenidoAT5, $patronSeguridad, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesSeguridad) {
    $ingredientesAT5.seguridad += $match.Value.Trim()
}
Write-Host "  Referencias Seguridad: $($ingredientesAT5.seguridad.Count)" -ForegroundColor Green

# Buscar Monitoreo
$patronMonitoreo = "Monitoreo"
$matchesMonitoreo = [regex]::Matches($contenidoAT5, $patronMonitoreo, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesMonitoreo) {
    $ingredientesAT5.monitoreo += $match.Value.Trim()
}
Write-Host "  Referencias Monitoreo: $($ingredientesAT5.monitoreo.Count)" -ForegroundColor Green

# Buscar Detectores
$patronDetector = "Detector"
$matchesDetector = [regex]::Matches($contenidoAT5, $patronDetector, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesDetector) {
    $ingredientesAT5.detectores += $match.Value.Trim()
}
Write-Host "  Referencias Detectores: $($ingredientesAT5.detectores.Count)" -ForegroundColor Green

# Buscar Alarmas
$patronAlarma = "Alarma"
$matchesAlarma = [regex]::Matches($contenidoAT5, $patronAlarma, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesAlarma) {
    $ingredientesAT5.alarmas += $match.Value.Trim()
}
Write-Host "  Referencias Alarmas: $($ingredientesAT5.alarmas.Count)" -ForegroundColor Green

# Buscar sistemas ITS generales
$patronesSistemas = @(
    "Sistema ITS",
    "ITS",
    "Sistema de Seguridad",
    "Sistema de Monitoreo",
    "Vigilancia"
)

foreach ($patron in $patronesSistemas) {
    $matches = [regex]::Matches($contenidoAT5, $patron, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    foreach ($match in $matches) {
        $ingredientesAT5.sistemas_its += $match.Value.Trim()
    }
}
Write-Host "  Sistemas ITS generales: $($ingredientesAT5.sistemas_its.Count)" -ForegroundColor Green

# Mostrar detalles
Write-Host ""
Write-Host "DETALLE DE EXTRACCION:" -ForegroundColor Cyan

Write-Host ""
Write-Host "SISTEMAS CCTV ENCONTRADOS:" -ForegroundColor Yellow
foreach ($cctv in $ingredientesAT5.cctv | Select-Object -First 10) {
    Write-Host "  - $cctv" -ForegroundColor White
}

Write-Host ""
Write-Host "CAMARAS ENCONTRADAS:" -ForegroundColor Yellow
foreach ($camara in $ingredientesAT5.camaras | Select-Object -First 10) {
    Write-Host "  - $camara" -ForegroundColor White
}

Write-Host ""
Write-Host "SISTEMAS HBD ENCONTRADOS:" -ForegroundColor Yellow
foreach ($hbd in $ingredientesAT5.hbd | Select-Object -First 10) {
    Write-Host "  - $hbd" -ForegroundColor White
}

Write-Host ""
Write-Host "SISTEMAS ITS ENCONTRADOS:" -ForegroundColor Yellow
foreach ($its in $ingredientesAT5.sistemas_its | Select-Object -First 10) {
    Write-Host "  - $its" -ForegroundColor White
}

# Guardar ingredientes extraidos
$ingredientesJson = $ingredientesAT5 | ConvertTo-Json -Depth 3
$outputFile = "$outputPath/INGREDIENTES_AT5_v1.0.json"
$ingredientesJson | Out-File -FilePath $outputFile -Encoding UTF8

Write-Host ""
Write-Host "RESUMEN FINAL AT5:" -ForegroundColor Green
Write-Host "  Referencias CCTV: $($ingredientesAT5.cctv.Count)" -ForegroundColor White
Write-Host "  Referencias HBD: $($ingredientesAT5.hbd.Count)" -ForegroundColor White
Write-Host "  Referencias Camaras: $($ingredientesAT5.camaras.Count)" -ForegroundColor White
Write-Host "  Referencias Seguridad: $($ingredientesAT5.seguridad.Count)" -ForegroundColor White
Write-Host "  Referencias Monitoreo: $($ingredientesAT5.monitoreo.Count)" -ForegroundColor White
Write-Host "  Referencias Detectores: $($ingredientesAT5.detectores.Count)" -ForegroundColor White
Write-Host "  Referencias Alarmas: $($ingredientesAT5.alarmas.Count)" -ForegroundColor White
Write-Host "  Sistemas ITS generales: $($ingredientesAT5.sistemas_its.Count)" -ForegroundColor White

Write-Host ""
Write-Host "Ingredientes AT5 guardados en: $outputFile" -ForegroundColor Green
Write-Host "Tamano: $([math]::Round((Get-Item $outputFile).Length / 1KB, 1)) KB" -ForegroundColor Gray

Write-Host ""
Write-Host "EXTRACTOR AT5 - COMPLETADO" -ForegroundColor Green
