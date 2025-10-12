# EXTRACTOR AT1 - Infraestructura Ferrea
# Extrae puentes, estaciones, apartaderos, pasos a nivel, escuelas, UFVF, UF
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

Write-Host "Extrayendo ingredientes de AT1..." -ForegroundColor Yellow

# Estructura para almacenar ingredientes extraídos
$ingredientesAT1 = @{
    puentes = @()
    estaciones = @()
    apartaderos = @()
    pasos_nivel = @()
    escuelas = @()
    ufvf = @()
    uf = @()
    tablas_encontradas = @()
}

# Buscar tablas específicas mencionadas en la descripción
$tablas = @(
    "Tabla 2: Listado de Puentes",
    "Tabla 4: Listado de Apartaderos", 
    "Tabla 5: Listado de Estaciones",
    "Tabla 9: Puentes Priorizados",
    "Tabla 10:",
    "Tabla 11:",
    "Tabla 18:",
    "Tabla 21:",
    "Tabla 22:",
    "Tabla 23:",
    "Tabla 24:"
)

Write-Host ""
Write-Host "Buscando tablas en AT1..." -ForegroundColor Cyan

foreach ($tabla in $tablas) {
    if ($contenidoAT1 -match [regex]::Escape($tabla)) {
        Write-Host "  ENCONTRADA: $tabla" -ForegroundColor Green
        $ingredientesAT1.tablas_encontradas += $tabla
    } else {
        Write-Host "  NO ENCONTRADA: $tabla" -ForegroundColor Red
    }
}

# Buscar secciones clave
$secciones = @(
    "Capítulo III – Infraestructura Férrea",
    "Capítulo IV – Infraestructura Férrea Proyectada",
    "UFVF 1 a UFVF 53",
    "UF 1: Taller Pesado",
    "UF 2: Taller Liviano", 
    "UF 3: Edificio Administrativo",
    "Instituciones Educativas",
    "Pasos a Nivel"
)

Write-Host ""
Write-Host "Buscando secciones clave..." -ForegroundColor Cyan

foreach ($seccion in $secciones) {
    if ($contenidoAT1 -match [regex]::Escape($seccion)) {
        Write-Host "  ENCONTRADA: $seccion" -ForegroundColor Green
    } else {
        Write-Host "  NO ENCONTRADA: $seccion" -ForegroundColor Red
    }
}

# Buscar UFVF (Unidades Funcionales de Via Ferrea)
Write-Host ""
Write-Host "Extrayendo UFVF..." -ForegroundColor Cyan

$patronesUFVF = @(
    "UFVF \d+",
    "Unidad Funcional de Via Ferrea \d+",
    "UFVF\d+"
)

foreach ($patron in $patronesUFVF) {
    $matches = [regex]::Matches($contenidoAT1, $patron, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    foreach ($match in $matches) {
        if ($ingredientesAT1.ufvf -notcontains $match.Value) {
            $ingredientesAT1.ufvf += $match.Value
        }
    }
}

# Buscar UF (Unidades Funcionales)
Write-Host ""
Write-Host "Extrayendo UF..." -ForegroundColor Cyan

$patronesUF = @(
    "UF 1:",
    "UF 2:", 
    "UF 3:",
    "Unidad Funcional \d+"
)

foreach ($patron in $patronesUF) {
    $matches = [regex]::Matches($contenidoAT1, $patron, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    foreach ($match in $matches) {
        if ($ingredientesAT1.uf -notcontains $match.Value) {
            $ingredientesAT1.uf += $match.Value
        }
    }
}

# Buscar referencias a puentes
Write-Host ""
Write-Host "Extrayendo referencias a puentes..." -ForegroundColor Cyan

$patronesPuentes = @(
    "Puente\s+\w+",
    "Viaducto\s+\w+",
    "Puente\s+Priorizado"
)

foreach ($patron in $patronesPuentes) {
    $matches = [regex]::Matches($contenidoAT1, $patron, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    foreach ($match in $matches) {
        if ($ingredientesAT1.puentes -notcontains $match.Value) {
            $ingredientesAT1.puentes += $match.Value
        }
    }
}

# Buscar referencias a estaciones
Write-Host ""
Write-Host "Extrayendo referencias a estaciones..." -ForegroundColor Cyan

$patronesEstaciones = @(
    "Estacion\s+\w+",
    "Estacion\s+Principal",
    "Estacion\s+Menor",
    "Apeadero"
)

foreach ($patron in $patronesEstaciones) {
    $matches = [regex]::Matches($contenidoAT1, $patron, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    foreach ($match in $matches) {
        if ($ingredientesAT1.estaciones -notcontains $match.Value) {
            $ingredientesAT1.estaciones += $match.Value
        }
    }
}

# Mostrar resultados
Write-Host ""
Write-Host "RESULTADOS DE EXTRACCION AT1:" -ForegroundColor Green
Write-Host "  Tablas encontradas: $($ingredientesAT1.tablas_encontradas.Count)" -ForegroundColor White
Write-Host "  UFVF encontradas: $($ingredientesAT1.ufvf.Count)" -ForegroundColor White
Write-Host "  UF encontradas: $($ingredientesAT1.uf.Count)" -ForegroundColor White
Write-Host "  Puentes encontrados: $($ingredientesAT1.puentes.Count)" -ForegroundColor White
Write-Host "  Estaciones encontradas: $($ingredientesAT1.estaciones.Count)" -ForegroundColor White

Write-Host ""
Write-Host "DETALLE UFVF:" -ForegroundColor Cyan
foreach ($ufvf in $ingredientesAT1.ufvf) {
    Write-Host "  - $ufvf" -ForegroundColor White
}

Write-Host ""
Write-Host "DETALLE UF:" -ForegroundColor Cyan
foreach ($uf in $ingredientesAT1.uf) {
    Write-Host "  - $uf" -ForegroundColor White
}

# Guardar ingredientes extraídos
$ingredientesJson = $ingredientesAT1 | ConvertTo-Json -Depth 3
$outputFile = "$outputPath/INGREDIENTES_AT1_v1.0.json"
$ingredientesJson | Out-File -FilePath $outputFile -Encoding UTF8

Write-Host ""
Write-Host "Ingredientes AT1 guardados en: $outputFile" -ForegroundColor Green
Write-Host "Tamano: $([math]::Round((Get-Item $outputFile).Length / 1KB, 1)) KB" -ForegroundColor Gray

Write-Host ""
Write-Host "EXTRACTOR AT1 - COMPLETADO" -ForegroundColor Green
