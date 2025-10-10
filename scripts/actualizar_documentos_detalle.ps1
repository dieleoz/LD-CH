# Script: Actualizar Documentos V.X desde DTs
# Propósito: Versionar documentos de ingeniería de detalle y agregar trazabilidad

param(
    [string]$DTsPath = "II. Apendices Tecnicos\Decisiones_Tecnicas",
    [string]$DetalleBasePath = "V. Ingenieria de detalle",
    [switch]$DryRun = $false
)

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  ACTUALIZACION DOCUMENTOS V.X DESDE DTs" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

if ($DryRun) {
    Write-Host "MODO DRY-RUN: No se aplicaran cambios reales" -ForegroundColor Yellow
    Write-Host ""
}

# Verificar carpeta DTs
if (-not (Test-Path $DTsPath)) {
    Write-Host "ERROR: Carpeta DTs no encontrada: $DTsPath" -ForegroundColor Red
    exit 1
}

# Buscar DTs
Write-Host "Buscando Decisiones Tecnicas..." -ForegroundColor Yellow
$archivosDT = Get-ChildItem -Path $DTsPath -Filter "DT-*.md" | Where-Object { $_.Name -notmatch "EJEMPLO|PLANTILLA|TEMPLATE" }
Write-Host "DTs encontradas: $($archivosDT.Count)" -ForegroundColor Green
Write-Host ""

$actualizacionesRealizadas = 0
$archivosModificados = @()

foreach ($archivoDT in $archivosDT) {
    Write-Host "Procesando: $($archivoDT.Name)..." -ForegroundColor Cyan
    
    $contenido = Get-Content $archivoDT.FullName -Raw -Encoding UTF8
    
    # Buscar archivos V.X mencionados en la DT
    $archivosVX = @()
    
    # Patrón simple: buscar "V.X_" en el contenido
    $matches = [regex]::Matches($contenido, "V\.\d+_[^\s""]+\.md")
    foreach ($match in $matches) {
        $archivoVX = $match.Value
        if ($archivosVX -notcontains $archivoVX) {
            $archivosVX += $archivoVX
        }
    }
    
    if ($archivosVX.Count -gt 0) {
        Write-Host "  Archivos V.X encontrados: $($archivosVX.Count)" -ForegroundColor Green
        
        # Extraer ID de la DT
        $idDT = $archivoDT.BaseName
        $fechaDT = Get-Date -Format "yyyy-MM-dd"
        
        foreach ($archivoVX in $archivosVX) {
            # Buscar el archivo V.X
            $rutasVX = Get-ChildItem -Path $DetalleBasePath -Filter $archivoVX -Recurse -ErrorAction SilentlyContinue
            
            if ($rutasVX) {
                $rutaCompleta = $rutasVX[0].FullName
                Write-Host "    Actualizando: $archivoVX" -ForegroundColor Cyan
                
                if (-not $DryRun) {
                    # Leer contenido
                    $contenidoVX = Get-Content $rutaCompleta -Raw -Encoding UTF8
                    
                    # Actualizar version (v1.0 -> v1.1, v2.0 -> v2.1, etc)
                    $versionActual = ""
                    if ($contenidoVX -match "v(\d+)\.(\d+)") {
                        $major = $matches[1]
                        $minor = [int]$matches[2]
                        $versionActual = "v$major.$minor"
                        $versionNueva = "v$major.$($minor + 1)"
                        
                        $contenidoVX = $contenidoVX -replace $versionActual, $versionNueva
                        Write-Host "      Version: $versionActual -> $versionNueva" -ForegroundColor Green
                    }
                    
                    # Agregar historial de actualizaciones
                    $seccionHistorial = "## HISTORIAL DE ACTUALIZACIONES"
                    if ($contenidoVX -notmatch $seccionHistorial) {
                        $contenidoVX += "`n`n---`n`n$seccionHistorial`n`n"
                    }
                    
                    $fechaHora = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
                    $notaActualizacion = "- $fechaHora Actualizado por $idDT`n"
                    
                    # Insertar nota después del encabezado de historial
                    $contenidoVX = $contenidoVX -replace "($seccionHistorial\s*`n)", "`$1$notaActualizacion"
                    
                    # Guardar archivo
                    $contenidoVX | Out-File -FilePath $rutaCompleta -Encoding UTF8 -Force
                    
                    $archivosModificados += $rutaCompleta
                    $actualizacionesRealizadas++
                    
                    Write-Host "      Archivo actualizado OK" -ForegroundColor Green
                } else {
                    Write-Host "      DRY-RUN: Se actualizaria $archivoVX" -ForegroundColor Yellow
                }
            } else {
                Write-Host "    Archivo no encontrado: $archivoVX" -ForegroundColor Yellow
            }
        }
    } else {
        Write-Host "  Sin archivos V.X detectados" -ForegroundColor Gray
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
Write-Host "  Archivos V.X actualizados: $actualizacionesRealizadas" -ForegroundColor White
Write-Host ""

if ($archivosModificados.Count -gt 0) {
    Write-Host "ARCHIVOS MODIFICADOS:" -ForegroundColor Cyan
    foreach ($archivo in $archivosModificados) {
        Write-Host "  - $archivo" -ForegroundColor White
    }
    Write-Host ""
}
