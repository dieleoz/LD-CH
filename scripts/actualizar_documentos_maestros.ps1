# Script: Actualizar Documentos Maestros VIII/ desde DTs
# Propósito: Insertar filas en matrices técnicas cuando se ejecutan DTs

param(
    [string]$DTsPath = "II. Apendices Tecnicos\Decisiones_Tecnicas",
    [string]$MaestrosPath = "VIII. Documentos Maestros y Metodologia",
    [switch]$DryRun = $false
)

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  ACTUALIZACION DOCUMENTOS MAESTROS VIII/ DESDE DTs" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

if ($DryRun) {
    Write-Host "MODO DRY-RUN: No se aplicaran cambios reales" -ForegroundColor Yellow
    Write-Host ""
}

# Rutas de matrices
$criteriosMaestro = Join-Path $MaestrosPath "CRITERIOS_TECNICOS_MAESTRO_APP_La_Dorada_Chiriguaná_v1.0.md"
$matrizTrazabilidad = Join-Path $MaestrosPath "MATRIZ_TRAZABILIDAD_TECNICA_APP_La_Dorada_Chiriguaná_v1.0.md"
$matrizDependencias = Join-Path $MaestrosPath "Matrices_Dependencias\MATRIZ_DEPENDENCIAS_DOCUMENTALES_v1.0.md"

# Verificar archivos maestros
$archivosValidos = $true
foreach ($archivo in @($criteriosMaestro, $matrizTrazabilidad, $matrizDependencias)) {
    if (-not (Test-Path $archivo)) {
        Write-Host "ADVERTENCIA: No encontrado: $archivo" -ForegroundColor Yellow
        $archivosValidos = $false
    }
}

if (-not $archivosValidos) {
    Write-Host ""
    Write-Host "Algunos archivos maestros no existen. Continuando con los disponibles..." -ForegroundColor Yellow
    Write-Host ""
}

# Buscar DTs
Write-Host "Buscando Decisiones Tecnicas..." -ForegroundColor Yellow
$archivosDT = Get-ChildItem -Path $DTsPath -Filter "DT-*.md" | Where-Object { $_.Name -notmatch "EJEMPLO|PLANTILLA|TEMPLATE" }
Write-Host "DTs encontradas: $($archivosDT.Count)" -ForegroundColor Green
Write-Host ""

$actualizacionesRealizadas = 0
$matricesActualizadas = @()

foreach ($archivoDT in $archivosDT) {
    Write-Host "Procesando: $($archivoDT.Name)..." -ForegroundColor Cyan
    
    $contenido = Get-Content $archivoDT.FullName -Raw -Encoding UTF8
    
    # Extraer metadata de la DT
    $idDT = $archivoDT.BaseName
    $sistema = ""
    $itemWBS = ""
    $tipoCambio = ""
    
    # Extraer sistema del ID (ej: DT-FIBRA-001 -> FIBRA)
    if ($idDT -match "DT-([A-Z]+)-") {
        $sistema = $matches[1]
    }
    
    # Extraer item WBS (buscar patron numerico)
    if ($contenido -match "(\d+\.\d+\.\d+)\s*-") {
        $itemWBS = $matches[1]
    }
    
    # Extraer tipo de cambio (buscar después de "cambio:")
    if ($contenido -match "cambio:\*\*\s*([^\r\n]+)") {
        $tipoCambio = $matches[1].Trim()
    }
    
    if ($sistema -and $itemWBS) {
        Write-Host "  Sistema: $sistema | Item WBS: $itemWBS | Tipo: $tipoCambio" -ForegroundColor Green
        
        # 1. Actualizar MATRIZ_DEPENDENCIAS_DOCUMENTALES
        if (Test-Path $matrizDependencias) {
            $contenidoDep = Get-Content $matrizDependencias -Raw -Encoding UTF8
            
            # Verificar si ya existe una entrada para esta DT
            if ($contenidoDep -notmatch $idDT) {
                if (-not $DryRun) {
                    # Buscar la tabla y agregar nueva fila
                    $nuevaFila = "| $sistema | $idDT | Item WBS $itemWBS | $tipoCambio |"
                    
                    # Insertar antes de la primera línea vacía después de la tabla
                    $lineas = $contenidoDep -split "`n"
                    $enTabla = $false
                    $indiceInsercion = -1
                    
                    for ($i = 0; $i -lt $lineas.Count; $i++) {
                        if ($lineas[$i] -match "^\| Sistema") {
                            $enTabla = $true
                        }
                        elseif ($enTabla -and $lineas[$i].Trim() -eq "") {
                            $indiceInsercion = $i
                            break
                        }
                    }
                    
                    if ($indiceInsercion -gt 0) {
                        $lineas = @($lineas[0..($indiceInsercion-1)]) + $nuevaFila + @($lineas[$indiceInsercion..($lineas.Count-1)])
                        $contenidoDep = $lineas -join "`n"
                        $contenidoDep | Out-File -FilePath $matrizDependencias -Encoding UTF8 -Force
                        
                        Write-Host "    MATRIZ_DEPENDENCIAS actualizada" -ForegroundColor Green
                        if ($matricesActualizadas -notcontains "DEPENDENCIAS") {
                            $matricesActualizadas += "DEPENDENCIAS"
                        }
                        $actualizacionesRealizadas++
                    }
                } else {
                    Write-Host "    DRY-RUN: Se agregaria a MATRIZ_DEPENDENCIAS" -ForegroundColor Yellow
                }
            } else {
                Write-Host "    DT ya existe en MATRIZ_DEPENDENCIAS" -ForegroundColor Gray
            }
        }
        
        # 2. Actualizar MATRIZ_TRAZABILIDAD_TECNICA
        if (Test-Path $matrizTrazabilidad) {
            $contenidoTraz = Get-Content $matrizTrazabilidad -Raw -Encoding UTF8
            
            if ($contenidoTraz -notmatch $idDT) {
                if (-not $DryRun) {
                    # Agregar enlace DT -> Documentos
                    $fechaActual = Get-Date -Format "yyyy-MM-dd"
                    $nuevaEntrada = "`n### $idDT - $sistema`n- **Fecha:** $fechaActual`n- **Item WBS:** $itemWBS`n- **Tipo:** $tipoCambio`n- **Documentos afectados:** Ver MATRIZ_DEPENDENCIAS`n"
                    
                    $contenidoTraz += $nuevaEntrada
                    $contenidoTraz | Out-File -FilePath $matrizTrazabilidad -Encoding UTF8 -Force
                    
                    Write-Host "    MATRIZ_TRAZABILIDAD actualizada" -ForegroundColor Green
                    if ($matricesActualizadas -notcontains "TRAZABILIDAD") {
                        $matricesActualizadas += "TRAZABILIDAD"
                    }
                    $actualizacionesRealizadas++
                } else {
                    Write-Host "    DRY-RUN: Se agregaria a MATRIZ_TRAZABILIDAD" -ForegroundColor Yellow
                }
            } else {
                Write-Host "    DT ya existe en MATRIZ_TRAZABILIDAD" -ForegroundColor Gray
            }
        }
        
    } else {
        Write-Host "  Sin metadata suficiente para actualizar matrices" -ForegroundColor Gray
    }
}

# Resumen
Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host "  ACTUALIZACION COMPLETADA" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""

Write-Host "ESTADISTICAS:" -ForegroundColor Cyan
Write-Host "  DTs procesadas: $($archivosDT.Count)" -ForegroundColor White
Write-Host "  Actualizaciones realizadas: $actualizacionesRealizadas" -ForegroundColor White
Write-Host "  Matrices actualizadas: $($matricesActualizadas.Count)" -ForegroundColor White

if ($matricesActualizadas.Count -gt 0) {
    Write-Host ""
    Write-Host "MATRICES MODIFICADAS:" -ForegroundColor Cyan
    foreach ($matriz in $matricesActualizadas) {
        Write-Host "  - $matriz" -ForegroundColor White
    }
}

Write-Host ""

