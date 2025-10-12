# EXTRACTOR AT4 - Telecomunicaciones
# Extrae ingredientes de sistemas TETRA, fibra optica, radio
# Version: 1.0 | Fecha: 10 Octubre 2025

Write-Host "EXTRACTOR AT4 - Telecomunicaciones" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

$archivoAT4 = "01. contrato en .md/FORMATEADO_APENDICE TECNICO 4.md"
$outputPath = "VIII. Documentos Maestros y Metodologia"

if (-not (Test-Path $archivoAT4)) {
    Write-Host "ERROR: No se encuentra $archivoAT4" -ForegroundColor Red
    exit 1
}

Write-Host "Leyendo AT4..." -ForegroundColor Yellow
$contenidoAT4 = Get-Content $archivoAT4 -Encoding UTF8 -Raw

Write-Host "Tamano del archivo: $([math]::Round((Get-Item $archivoAT4).Length / 1KB, 1)) KB" -ForegroundColor Gray

# Estructura para almacenar ingredientes extraidos
$ingredientesAT4 = @{
    tetra = @()
    fibra_optica = @()
    radio = @()
    redes = @()
    telecomunicaciones = @()
    antenas = @()
    estaciones_base = @()
    nodos = @()
    patrones_encontrados = @()
}

Write-Host ""
Write-Host "Buscando sistemas de telecomunicaciones..." -ForegroundColor Yellow

# Buscar TETRA
$patronTETRA = "TETRA"
$matchesTETRA = [regex]::Matches($contenidoAT4, $patronTETRA, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesTETRA) {
    $ingredientesAT4.tetra += $match.Value.Trim()
}
Write-Host "  Referencias TETRA: $($ingredientesAT4.tetra.Count)" -ForegroundColor Green

# Buscar Fibra Optica
$patronFibra = "Fibra Optica|Fibra"
$matchesFibra = [regex]::Matches($contenidoAT4, $patronFibra, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesFibra) {
    $ingredientesAT4.fibra_optica += $match.Value.Trim()
}
Write-Host "  Referencias Fibra Optica: $($ingredientesAT4.fibra_optica.Count)" -ForegroundColor Green

# Buscar Radio
$patronRadio = "Radio"
$matchesRadio = [regex]::Matches($contenidoAT4, $patronRadio, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesRadio) {
    $ingredientesAT4.radio += $match.Value.Trim()
}
Write-Host "  Referencias Radio: $($ingredientesAT4.radio.Count)" -ForegroundColor Green

# Buscar Redes
$patronRed = "Red"
$matchesRed = [regex]::Matches($contenidoAT4, $patronRed, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesRed) {
    $ingredientesAT4.redes += $match.Value.Trim()
}
Write-Host "  Referencias Redes: $($ingredientesAT4.redes.Count)" -ForegroundColor Green

# Buscar Telecomunicaciones generales
$patronTelecom = "Telecomunicacion"
$matchesTelecom = [regex]::Matches($contenidoAT4, $patronTelecom, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesTelecom) {
    $ingredientesAT4.telecomunicaciones += $match.Value.Trim()
}
Write-Host "  Referencias Telecomunicaciones: $($ingredientesAT4.telecomunicaciones.Count)" -ForegroundColor Green

# Buscar Antenas
$patronAntena = "Antena"
$matchesAntena = [regex]::Matches($contenidoAT4, $patronAntena, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesAntena) {
    $ingredientesAT4.antenas += $match.Value.Trim()
}
Write-Host "  Referencias Antenas: $($ingredientesAT4.antenas.Count)" -ForegroundColor Green

# Buscar Estaciones Base
$patronEstacionBase = "Estacion Base"
$matchesEstacionBase = [regex]::Matches($contenidoAT4, $patronEstacionBase, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesEstacionBase) {
    $ingredientesAT4.estaciones_base += $match.Value.Trim()
}
Write-Host "  Referencias Estaciones Base: $($ingredientesAT4.estaciones_base.Count)" -ForegroundColor Green

# Buscar Nodos
$patronNodo = "Nodo"
$matchesNodo = [regex]::Matches($contenidoAT4, $patronNodo, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesNodo) {
    $ingredientesAT4.nodos += $match.Value.Trim()
}
Write-Host "  Referencias Nodos: $($ingredientesAT4.nodos.Count)" -ForegroundColor Green

# Buscar sistemas de telecomunicaciones generales
$patronesSistemas = @(
    "Sistema de Telecomunicacion",
    "Red de Telecomunicacion",
    "Comunicacion",
    "Transmision"
)

foreach ($patron in $patronesSistemas) {
    $matches = [regex]::Matches($contenidoAT4, $patron, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    foreach ($match in $matches) {
        $ingredientesAT4.telecomunicaciones += $match.Value.Trim()
    }
}

# Mostrar detalles
Write-Host ""
Write-Host "DETALLE DE EXTRACCION:" -ForegroundColor Cyan

Write-Host ""
Write-Host "SISTEMAS TETRA ENCONTRADOS:" -ForegroundColor Yellow
foreach ($tetra in $ingredientesAT4.tetra | Select-Object -First 10) {
    Write-Host "  - $tetra" -ForegroundColor White
}

Write-Host ""
Write-Host "FIBRA OPTICA ENCONTRADA:" -ForegroundColor Yellow
foreach ($fibra in $ingredientesAT4.fibra_optica | Select-Object -First 10) {
    Write-Host "  - $fibra" -ForegroundColor White
}

Write-Host ""
Write-Host "ANTENAS ENCONTRADAS:" -ForegroundColor Yellow
foreach ($antena in $ingredientesAT4.antenas | Select-Object -First 10) {
    Write-Host "  - $antena" -ForegroundColor White
}

Write-Host ""
Write-Host "NODOS ENCONTRADOS:" -ForegroundColor Yellow
foreach ($nodo in $ingredientesAT4.nodos | Select-Object -First 10) {
    Write-Host "  - $nodo" -ForegroundColor White
}

# Guardar ingredientes extraidos
$ingredientesJson = $ingredientesAT4 | ConvertTo-Json -Depth 3
$outputFile = "$outputPath/INGREDIENTES_AT4_v1.0.json"
$ingredientesJson | Out-File -FilePath $outputFile -Encoding UTF8

Write-Host ""
Write-Host "RESUMEN FINAL AT4:" -ForegroundColor Green
Write-Host "  Referencias TETRA: $($ingredientesAT4.tetra.Count)" -ForegroundColor White
Write-Host "  Referencias Fibra Optica: $($ingredientesAT4.fibra_optica.Count)" -ForegroundColor White
Write-Host "  Referencias Radio: $($ingredientesAT4.radio.Count)" -ForegroundColor White
Write-Host "  Referencias Redes: $($ingredientesAT4.redes.Count)" -ForegroundColor White
Write-Host "  Referencias Telecomunicaciones: $($ingredientesAT4.telecomunicaciones.Count)" -ForegroundColor White
Write-Host "  Referencias Antenas: $($ingredientesAT4.antenas.Count)" -ForegroundColor White
Write-Host "  Referencias Estaciones Base: $($ingredientesAT4.estaciones_base.Count)" -ForegroundColor White
Write-Host "  Referencias Nodos: $($ingredientesAT4.nodos.Count)" -ForegroundColor White

Write-Host ""
Write-Host "Ingredientes AT4 guardados en: $outputFile" -ForegroundColor Green
Write-Host "Tamano: $([math]::Round((Get-Item $outputFile).Length / 1KB, 1)) KB" -ForegroundColor Gray

Write-Host ""
Write-Host "EXTRACTOR AT4 - COMPLETADO" -ForegroundColor Green
