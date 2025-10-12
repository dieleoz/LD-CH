# EXTRACTOR AT1 - Infraestructura Ferrea (Version Simple)
# Extrae ingredientes basicos del AT1
# Version: 1.0 | Fecha: 10 Octubre 2025

Write-Host "EXTRACTOR AT1 - Infraestructura Ferrea" -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan
Write-Host ""

$archivoAT1 = "01. contrato en .md/FORMATEADO_APENDICE TECNICO 1.md"
$outputPath = "VIII. Documentos Maestros y Metodologia"

if (-not (Test-Path $archivoAT1)) {
    Write-Host "ERROR: No se encuentra $archivoAT1" -ForegroundColor Red
    exit 1
}

Write-Host "Leyendo AT1..." -ForegroundColor Yellow
$contenidoAT1 = Get-Content $archivoAT1 -Encoding UTF8 -Raw

Write-Host "Tamano del archivo: $([math]::Round((Get-Item $archivoAT1).Length / 1KB, 1)) KB" -ForegroundColor Gray

# Estructura para almacenar ingredientes extraidos
$ingredientesAT1 = @{
    tablas = @()
    ufvf = @()
    uf = @()
    puentes = @()
    estaciones = @()
    apartaderos = @()
    escuelas = @()
    pasos_nivel = @()
    patrones_encontrados = @()
}

Write-Host ""
Write-Host "Buscando patrones basicos..." -ForegroundColor Yellow

# Buscar tablas
$patronTabla = "Tabla \d+:"
$matchesTabla = [regex]::Matches($contenidoAT1, $patronTabla, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesTabla) {
    $ingredientesAT1.tablas += $match.Value
}
Write-Host "  Tablas encontradas: $($ingredientesAT1.tablas.Count)" -ForegroundColor Green

# Buscar UFVF
$patronUFVF = "UFVF\s*\d+"
$matchesUFVF = [regex]::Matches($contenidoAT1, $patronUFVF, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesUFVF) {
    $ingredientesAT1.ufvf += $match.Value.Trim()
}
Write-Host "  UFVF encontradas: $($ingredientesAT1.ufvf.Count)" -ForegroundColor Green

# Buscar UF
$patronUF = "UF\s*\d+:"
$matchesUF = [regex]::Matches($contenidoAT1, $patronUF, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesUF) {
    $ingredientesAT1.uf += $match.Value.Trim()
}
Write-Host "  UF encontradas: $($ingredientesAT1.uf.Count)" -ForegroundColor Green

# Buscar referencias a puentes
$patronPuente = "Puente\s+\w+"
$matchesPuente = [regex]::Matches($contenidoAT1, $patronPuente, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesPuente) {
    $ingredientesAT1.puentes += $match.Value.Trim()
}
Write-Host "  Puentes encontrados: $($ingredientesAT1.puentes.Count)" -ForegroundColor Green

# Buscar referencias a estaciones
$patronEstacion = "Estacion\s+\w+"
$matchesEstacion = [regex]::Matches($contenidoAT1, $patronEstacion, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesEstacion) {
    $ingredientesAT1.estaciones += $match.Value.Trim()
}
Write-Host "  Estaciones encontradas: $($ingredientesAT1.estaciones.Count)" -ForegroundColor Green

# Buscar apartaderos
$patronApartadero = "Apartadero\s+\w+"
$matchesApartadero = [regex]::Matches($contenidoAT1, $patronApartadero, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesApartadero) {
    $ingredientesAT1.apartaderos += $match.Value.Trim()
}
Write-Host "  Apartaderos encontrados: $($ingredientesAT1.apartaderos.Count)" -ForegroundColor Green

# Buscar escuelas
$patronEscuela = "Escuela\s+\w+"
$matchesEscuela = [regex]::Matches($contenidoAT1, $patronEscuela, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesEscuela) {
    $ingredientesAT1.escuelas += $match.Value.Trim()
}
Write-Host "  Escuelas encontradas: $($ingredientesAT1.escuelas.Count)" -ForegroundColor Green

# Buscar pasos a nivel
$patronPasoNivel = "Paso\s+a\s+Nivel"
$matchesPasoNivel = [regex]::Matches($contenidoAT1, $patronPasoNivel, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
foreach ($match in $matchesPasoNivel) {
    $ingredientesAT1.pasos_nivel += $match.Value.Trim()
}
Write-Host "  Pasos a nivel encontrados: $($ingredientesAT1.pasos_nivel.Count)" -ForegroundColor Green

# Mostrar detalles
Write-Host ""
Write-Host "DETALLE DE EXTRACCION:" -ForegroundColor Cyan

Write-Host ""
Write-Host "TABLAS (primeras 10):" -ForegroundColor Yellow
foreach ($tabla in $ingredientesAT1.tablas | Select-Object -First 10) {
    Write-Host "  - $tabla" -ForegroundColor White
}

Write-Host ""
Write-Host "UFVF (primeras 10):" -ForegroundColor Yellow
foreach ($ufvf in $ingredientesAT1.ufvf | Select-Object -First 10) {
    Write-Host "  - $ufvf" -ForegroundColor White
}

Write-Host ""
Write-Host "UF:" -ForegroundColor Yellow
foreach ($uf in $ingredientesAT1.uf) {
    Write-Host "  - $uf" -ForegroundColor White
}

Write-Host ""
Write-Host "PUENTES (primeros 10):" -ForegroundColor Yellow
foreach ($puente in $ingredientesAT1.puentes | Select-Object -First 10) {
    Write-Host "  - $puente" -ForegroundColor White
}

Write-Host ""
Write-Host "ESTACIONES (primeras 10):" -ForegroundColor Yellow
foreach ($estacion in $ingredientesAT1.estaciones | Select-Object -First 10) {
    Write-Host "  - $estacion" -ForegroundColor White
}

# Guardar ingredientes extraidos
$ingredientesJson = $ingredientesAT1 | ConvertTo-Json -Depth 3
$outputFile = "$outputPath/INGREDIENTES_AT1_v1.0.json"
$ingredientesJson | Out-File -FilePath $outputFile -Encoding UTF8

Write-Host ""
Write-Host "RESUMEN FINAL:" -ForegroundColor Green
Write-Host "  Total tablas: $($ingredientesAT1.tablas.Count)" -ForegroundColor White
Write-Host "  Total UFVF: $($ingredientesAT1.ufvf.Count)" -ForegroundColor White
Write-Host "  Total UF: $($ingredientesAT1.uf.Count)" -ForegroundColor White
Write-Host "  Total puentes: $($ingredientesAT1.puentes.Count)" -ForegroundColor White
Write-Host "  Total estaciones: $($ingredientesAT1.estaciones.Count)" -ForegroundColor White
Write-Host "  Total apartaderos: $($ingredientesAT1.apartaderos.Count)" -ForegroundColor White
Write-Host "  Total escuelas: $($ingredientesAT1.escuelas.Count)" -ForegroundColor White
Write-Host "  Total pasos a nivel: $($ingredientesAT1.pasos_nivel.Count)" -ForegroundColor White

Write-Host ""
Write-Host "Ingredientes AT1 guardados en: $outputFile" -ForegroundColor Green
Write-Host "Tamano: $([math]::Round((Get-Item $outputFile).Length / 1KB, 1)) KB" -ForegroundColor Gray

Write-Host ""
Write-Host "EXTRACTOR AT1 - COMPLETADO" -ForegroundColor Green
