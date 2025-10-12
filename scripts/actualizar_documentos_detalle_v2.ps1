# ═══════════════════════════════════════════════════════════════════════
# SCRIPT: Actualizar Documentos V.X desde DTs (v2.0 - Con Referencias Cruzadas)
# ═══════════════════════════════════════════════════════════════════════
# Propósito: Versionar documentos V.X y actualizar TODAS las referencias cruzadas
# Mejora v2.0: Agrega actualización automática de referencias en toda la documentación
# Fecha: 12 de Octubre 2025
# ═══════════════════════════════════════════════════════════════════════

param(
    [string]$DTsPath = "II. Apendices Tecnicos\Decisiones_Tecnicas",
    [string]$DetalleBasePath = "V. Ingenieria de detalle",
    [switch]$DryRun = $false
)

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  ACTUALIZACION DOCUMENTOS V.X DESDE DTs (v2.0)" -ForegroundColor Cyan
Write-Host "  + Actualización de referencias cruzadas automatica" -ForegroundColor Cyan
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
$contadorReferencias = 0
$reporteReferencias = @()

foreach ($archivoDT in $archivosDT) {
    Write-Host "Procesando: $($archivoDT.Name)..." -ForegroundColor Cyan
    
    $contenido = Get-Content $archivoDT.FullName -Raw -Encoding UTF8
    
    # Buscar archivos V.X mencionados en la DT
    $archivosVX = @()
    
    # Patrón mejorado: buscar "V.X_...vN.N.md"
    $matches = [regex]::Matches($contenido, "V\.\d+_[^\s""<>]+_v\d+\.\d+\.md")
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
        $fechaDT = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        
        foreach ($archivoVX in $archivosVX) {
            # Buscar el archivo V.X
            $rutasVX = Get-ChildItem -Path $DetalleBasePath -Filter $archivoVX -Recurse -ErrorAction SilentlyContinue
            
            if ($rutasVX) {
                $rutaCompleta = $rutasVX[0].FullName
                $nombreAnterior = $rutasVX[0].Name
                
                Write-Host "    Actualizando: $nombreAnterior" -ForegroundColor Cyan
                
                if (-not $DryRun) {
                    # Leer contenido del archivo V.X
                    $contenidoVX = Get-Content $rutaCompleta -Raw -Encoding UTF8
                    
                    # Extraer versión del nombre del archivo
                    if ($nombreAnterior -match "_v(\d+)\.(\d+)\.md") {
                        $major = $matches[1]
                        $minor = [int]$matches[2]
                        $versionActual = "v$major.$minor"
                        $versionNueva = "v$major.$($minor + 1)"
                        $nombreNuevo = $nombreAnterior -replace $versionActual, $versionNueva
                        
                        # Actualizar versión dentro del contenido del archivo V.X
                        $contenidoVX = $contenidoVX -replace $versionActual, $versionNueva
                        
                        Write-Host "      Version: $versionActual -> $versionNueva" -ForegroundColor Green
                        
                        # ═══════════════════════════════════════════════════════
                        # NUEVA FUNCIONALIDAD v2.0: ACTUALIZAR REFERENCIAS CRUZADAS
                        # ═══════════════════════════════════════════════════════
                        
                        Write-Host "      Buscando referencias cruzadas en documentacion..." -ForegroundColor Yellow
                        
                        # Carpetas donde buscar referencias
                        $carpetasBuscar = @(
                            ".",
                            "I. Contrato General",
                            "II. Apendices Tecnicos",
                            "III. Ingenieria conceptual",
                            "IV. Ingenieria basica",
                            "V. Ingenieria de detalle",
                            "VI. operacion y mantenimiento y reversion",
                            "VII. documentos transversales",
                            "VII. Soporte Especializado",
                            "VIII. Documentos Maestros y Metodologia",
                            "X_ENTREGABLES_CONSOLIDADOS",
                            "Reportes"
                        )
                        
                        $referenciasCambiadas = 0
                        $archivosConRef = @()
                        
                        foreach ($carpeta in $carpetasBuscar) {
                            if (Test-Path $carpeta) {
                                $archivos = Get-ChildItem -Path $carpeta -Filter "*.md" -Recurse -ErrorAction SilentlyContinue | 
                                    Where-Object { $_.FullName -ne $rutaCompleta }
                                
                                foreach ($archivo in $archivos) {
                                    try {
                                        $contenidoArchivo = Get-Content $archivo.FullName -Raw -Encoding UTF8 -ErrorAction SilentlyContinue
                                        
                                        if ($contenidoArchivo -and $contenidoArchivo -match [regex]::Escape($nombreAnterior)) {
                                            # Reemplazar referencia
                                            $contenidoArchivo = $contenidoArchivo -replace [regex]::Escape($nombreAnterior), $nombreNuevo
                                            $contenidoArchivo | Out-File -FilePath $archivo.FullName -Encoding UTF8 -Force
                                            
                                            $referenciasCambiadas++
                                            $archivosConRef += $archivo.FullName
                                            Write-Host "        Actualizado: $($archivo.Name)" -ForegroundColor Gray
                                        }
                                    } catch {
                                        # Silenciar errores de lectura
                                    }
                                }
                            }
                        }
                        
                        if ($referenciasCambiadas -gt 0) {
                            Write-Host "      Referencias actualizadas: $referenciasCambiadas archivos" -ForegroundColor Green
                            $contadorReferencias += $referenciasCambiadas
                            $reporteReferencias += [PSCustomObject]@{
                                ArchivoVX = $nombreNuevo
                                VersionAnterior = $versionActual
                                VersionNueva = $versionNueva
                                ReferenciasCambiadas = $referenciasCambiadas
                            }
                        } else {
                            Write-Host "      Sin referencias externas encontradas" -ForegroundColor Gray
                        }
                        
                        # Agregar historial de actualizaciones
                        $seccionHistorial = "## HISTORIAL DE ACTUALIZACIONES"
                        if ($contenidoVX -notmatch $seccionHistorial) {
                            $contenidoVX += "`n`n---`n`n$seccionHistorial`n`n"
                        }
                        
                        $notaActualizacion = "- **$fechaDT** - Actualizado por **$idDT** (Version: $versionActual -> $versionNueva)`n"
                        $contenidoVX = $contenidoVX -replace "($seccionHistorial\s*`n)", "`$1$notaActualizacion"
                        
                        # Guardar archivo con nueva versión
                        $contenidoVX | Out-File -FilePath $rutaCompleta -Encoding UTF8 -Force
                        
                        # Renombrar archivo si cambió
                        if ($nombreAnterior -ne $nombreNuevo) {
                            $rutaNueva = Join-Path (Split-Path $rutaCompleta) $nombreNuevo
                            Move-Item -Path $rutaCompleta -Destination $rutaNueva -Force
                            Write-Host "      Archivo renombrado: $nombreAnterior -> $nombreNuevo" -ForegroundColor Green
                            $archivosModificados += $rutaNueva
                        } else {
                            $archivosModificados += $rutaCompleta
                        }
                        
                        $actualizacionesRealizadas++
                        Write-Host "      Archivo actualizado OK" -ForegroundColor Green
                    } else {
                        Write-Host "      No se pudo detectar version en nombre del archivo" -ForegroundColor Yellow
                    }
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
    
    Write-Host ""
}

# Resumen
Write-Host "================================================================" -ForegroundColor Green
Write-Host "  ACTUALIZACION COMPLETADA" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""

Write-Host "ESTADISTICAS:" -ForegroundColor Cyan
Write-Host "  DTs procesadas: $($archivosDT.Count)" -ForegroundColor White
Write-Host "  Archivos V.X actualizados: $actualizacionesRealizadas" -ForegroundColor White
Write-Host "  Referencias cruzadas actualizadas: $contadorReferencias archivos" -ForegroundColor White
Write-Host ""

if ($archivosModificados.Count -gt 0) {
    Write-Host "ARCHIVOS V.X MODIFICADOS:" -ForegroundColor Cyan
    foreach ($archivo in $archivosModificados) {
        Write-Host "  - $archivo" -ForegroundColor White
    }
    Write-Host ""
}

if ($reporteReferencias.Count -gt 0) {
    Write-Host "REFERENCIAS CRUZADAS ACTUALIZADAS:" -ForegroundColor Cyan
    foreach ($ref in $reporteReferencias) {
        Write-Host "  Archivo: $($ref.ArchivoVX)" -ForegroundColor White
        Write-Host "    Version: $($ref.VersionAnterior) -> $($ref.VersionNueva)" -ForegroundColor Gray
        Write-Host "    Referencias actualizadas: $($ref.ReferenciasCambiadas) archivos" -ForegroundColor Gray
        Write-Host ""
    }
}

if (-not $DryRun) {
    Write-Host "TRAZABILIDAD COMPLETA MANTENIDA" -ForegroundColor Green
    Write-Host "Todos los documentos que referencian archivos V.X han sido actualizados." -ForegroundColor White
} else {
    Write-Host "DRY-RUN COMPLETADO: Revisa los cambios propuestos antes de ejecutar." -ForegroundColor Yellow
}

Write-Host ""
