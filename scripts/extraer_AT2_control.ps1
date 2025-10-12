# EXTRACTOR AT2 - Control y Senalizacion
# Extrae ingredientes de sistemas CTC, ETCS, senalizacion
# Version: 1.0 | Fecha: 10 Octubre 2025

Write-Host "EXTRACTOR AT2 - Control y Senalizacion" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$archivoAT2 = "01. contrato en .md/FORMATEADO_APENDICE TECNICO 2.md"
$outputPath = "VIII. Documentos Maestros y Metodologia"

if (-not (Test-Path $archivoAT2)) {
    Write-Host "ERROR: No se encuentra $archivoAT2" -ForegroundColor Red
    exit 1
}

Write-Host "Leyendo AT2..." -ForegroundColor Yellow
$contenidoAT2 = Get-Content $archivoAT2 -Encoding UTF8 -Raw

Write-Host "Tamano del archivo: $([math]::Round((Get-Item $archivoAT2).Length / 1KB, 1)) KB" -ForegroundColor Gray

# Estructura para almacenar ingredientes extraidos
$ingredientesAT2 = @{
    ctc = @()
    etcs = @()
    senalizacion = @()
    interlocking = @()
    balizas = @()
    rbc = @()
    atp = @()
    sistemas_control = @()
    patrones_encontrados = @()
}

Write-Host ""
Write-Host "Buscando sistemas de control y senalizacion..." -ForegroundColor Yellow

# Buscar CTC
$patronCTC = "CTC"
$matchesCTC = [regex]::Matches($contenidoAT2, $patronCTC, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesCTC) {
    $ingredientesAT2.ctc += $match.Value.Trim()
}
Write-Host "  Referencias CTC: $($ingredientesAT2.ctc.Count)" -ForegroundColor Green

# Buscar ETCS
$patronETCS = "ETCS"
$matchesETCS = [regex]::Matches($contenidoAT2, $patronETCS, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesETCS) {
    $ingredientesAT2.etcs += $match.Value.Trim()
}
Write-Host "  Referencias ETCS: $($ingredientesAT2.etcs.Count)" -ForegroundColor Green

# Buscar RBC
$patronRBC = "RBC"
$matchesRBC = [regex]::Matches($contenidoAT2, $patronRBC, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesRBC) {
    $ingredientesAT2.rbc += $match.Value.Trim()
}
Write-Host "  Referencias RBC: $($ingredientesAT2.rbc.Count)" -ForegroundColor Green

# Buscar ATP
$patronATP = "ATP"
$matchesATP = [regex]::Matches($contenidoAT2, $patronATP, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesATP) {
    $ingredientesAT2.atp += $match.Value.Trim()
}
Write-Host "  Referencias ATP: $($ingredientesAT2.atp.Count)" -ForegroundColor Green

# Buscar Balizas
$patronBaliza = "Baliza"
$matchesBaliza = [regex]::Matches($contenidoAT2, $patronBaliza, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesBaliza) {
    $ingredientesAT2.balizas += $match.Value.Trim()
}
Write-Host "  Referencias Balizas: $($ingredientesAT2.balizas.Count)" -ForegroundColor Green

# Buscar Eurobalise
$patronEurobalise = "Eurobalise"
$matchesEurobalise = [regex]::Matches($contenidoAT2, $patronEurobalise, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesEurobalise) {
    $ingredientesAT2.balizas += $match.Value.Trim()
}
Write-Host "  Referencias Eurobalise: $($matchesEurobalise.Count)" -ForegroundColor Green

# Buscar Senalizacion
$patronSenal = "Senal"
$matchesSenal = [regex]::Matches($contenidoAT2, $patronSenal, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesSenal) {
    $ingredientesAT2.senalizacion += $match.Value.Trim()
}
Write-Host "  Referencias Senalizacion: $($ingredientesAT2.senalizacion.Count)" -ForegroundColor Green

# Buscar Interlocking
$patronInterlocking = "Interlocking"
$matchesInterlocking = [regex]::Matches($contenidoAT2, $patronInterlocking, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesInterlocking) {
    $ingredientesAT2.interlocking += $match.Value.Trim()
}
Write-Host "  Referencias Interlocking: $($ingredientesAT2.interlocking.Count)" -ForegroundColor Green

# Buscar sistemas de control generales
$patronesSistemas = @(
    "Sistema de Control",
    "Control de Trafico",
    "Control Automatico",
    "Sistema de Senalizacion"
)

foreach ($patron in $patronesSistemas) {
    $matches = [regex]::Matches($contenidoAT2, $patron, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    foreach ($match in $matches) {
        $ingredientesAT2.sistemas_control += $match.Value.Trim()
    }
}
Write-Host "  Sistemas de control generales: $($ingredientesAT2.sistemas_control.Count)" -ForegroundColor Green

# Mostrar detalles
Write-Host ""
Write-Host "DETALLE DE EXTRACCION:" -ForegroundColor Cyan

Write-Host ""
Write-Host "SISTEMAS DE CONTROL ENCONTRADOS:" -ForegroundColor Yellow
foreach ($sistema in $ingredientesAT2.sistemas_control | Select-Object -First 10) {
    Write-Host "  - $sistema" -ForegroundColor White
}

Write-Host ""
Write-Host "BALIZAS/EUROBALISE ENCONTRADAS:" -ForegroundColor Yellow
foreach ($baliza in $ingredientesAT2.balizas | Select-Object -First 10) {
    Write-Host "  - $baliza" -ForegroundColor White
}

# Guardar ingredientes extraidos
$ingredientesJson = $ingredientesAT2 | ConvertTo-Json -Depth 3
$outputFile = "$outputPath/INGREDIENTES_AT2_v1.0.json"
$ingredientesJson | Out-File -FilePath $outputFile -Encoding UTF8

Write-Host ""
Write-Host "RESUMEN FINAL AT2:" -ForegroundColor Green
Write-Host "  Referencias CTC: $($ingredientesAT2.ctc.Count)" -ForegroundColor White
Write-Host "  Referencias ETCS: $($ingredientesAT2.etcs.Count)" -ForegroundColor White
Write-Host "  Referencias RBC: $($ingredientesAT2.rbc.Count)" -ForegroundColor White
Write-Host "  Referencias ATP: $($ingredientesAT2.atp.Count)" -ForegroundColor White
Write-Host "  Referencias Balizas: $($ingredientesAT2.balizas.Count)" -ForegroundColor White
Write-Host "  Referencias Senalizacion: $($ingredientesAT2.senalizacion.Count)" -ForegroundColor White
Write-Host "  Referencias Interlocking: $($ingredientesAT2.interlocking.Count)" -ForegroundColor White
Write-Host "  Sistemas de control: $($ingredientesAT2.sistemas_control.Count)" -ForegroundColor White

Write-Host ""
Write-Host "Ingredientes AT2 guardados en: $outputFile" -ForegroundColor Green
Write-Host "Tamano: $([math]::Round((Get-Item $outputFile).Length / 1KB, 1)) KB" -ForegroundColor Gray

Write-Host ""
Write-Host "EXTRACTOR AT2 - COMPLETADO" -ForegroundColor Green
