# SCRIPT: Extracción Detallada de Escuelas del AT1
# Fecha: 11 Octubre 2025
# Propósito: Extraer información completa de escuelas (PK, UFV, nombres)

Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "  EXTRACCION DETALLADA DE ESCUELAS - AT1        " -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""

# Rutas
$at1Path = "II. Apendices Tecnicos/13. AT3_Especificaciones_Generales_MEJORADO.md"
$at1Alt = "01. contrato en .md/FORMATEADO_APENDICE TECNICO 1.md"
$outputPath = "VIII. Documentos Maestros y Metodologia"

# Intentar ambas rutas
$archivo = $null
if (Test-Path $at1Path) {
    $archivo = $at1Path
    Write-Host "Archivo encontrado: $at1Path" -ForegroundColor Green
} elseif (Test-Path $at1Alt) {
    $archivo = $at1Alt
    Write-Host "Archivo encontrado: $at1Alt" -ForegroundColor Green
} else {
    Write-Host "ERROR: No se encontro el AT1" -ForegroundColor Red
    exit 1
}

Write-Host "Leyendo archivo..." -ForegroundColor Yellow
$contenido = Get-Content $archivo -Raw -Encoding UTF8

# Resultado
$resultado = @{
    escuelas_encontradas = @()
    total_escuelas = 0
    archivo_fuente = $archivo
    fecha_extraccion = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
}

Write-Host ""
Write-Host "Buscando menciones de 'escuela' en el archivo..." -ForegroundColor Yellow

# Buscar todas las líneas que contienen "escuela"
$lineas = $contenido -split "`n"
$lineNumber = 0

foreach ($linea in $lineas) {
    $lineNumber++
    
    if ($linea -match "escuela|Escuela") {
        Write-Host "  Linea $lineNumber`: $($linea.Trim())" -ForegroundColor White
        
        # Extraer contexto (líneas antes y después)
        $contextoInicio = [Math]::Max(0, $lineNumber - 3)
        $contextoFin = [Math]::Min($lineas.Count - 1, $lineNumber + 3)
        
        $contexto = @()
        for ($i = $contextoInicio; $i -le $contextoFin; $i++) {
            if ($i -ge 0 -and $i -lt $lineas.Count) {
                $contexto += $lineas[$i]
            }
        }
        
        $resultado.escuelas_encontradas += @{
            linea_numero = $lineNumber
            linea_texto = $linea.Trim()
            contexto = $contexto -join "`n"
        }
    }
}

$resultado.total_escuelas = $resultado.escuelas_encontradas.Count

Write-Host ""
Write-Host "Total de menciones encontradas: $($resultado.total_escuelas)" -ForegroundColor Green

# Guardar resultado
$jsonPath = "$outputPath/ESCUELAS_DETALLADAS_AT1_v1.0.json"
$resultado | ConvertTo-Json -Depth 10 | Out-File $jsonPath -Encoding UTF8

Write-Host ""
Write-Host "Archivo guardado: $jsonPath" -ForegroundColor Green
Write-Host ""
Write-Host "EXTRACCION COMPLETADA" -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan

