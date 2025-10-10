# Script: Consolidar V.X aprobados a Carpeta X
# Propósito: Exportar documentos V.X de ingeniería de detalle a entregables consolidados

param(
    [string]$DetalleBasePath = "V. Ingenieria de detalle",
    [string]$CarpetaXPath = "X_ENTREGABLES_CONSOLIDADOS",
    [switch]$DryRun = $false
)

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  CONSOLIDACION V.X -> CARPETA X" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

if ($DryRun) {
    Write-Host "MODO DRY-RUN: No se aplicaran cambios reales" -ForegroundColor Yellow
    Write-Host ""
}

# Verificar carpeta X
if (-not (Test-Path $CarpetaXPath)) {
    Write-Host "ADVERTENCIA: Carpeta X no encontrada: $CarpetaXPath" -ForegroundColor Yellow
    Write-Host "Se omitira consolidacion a Carpeta X" -ForegroundColor Yellow
    exit 0
}

# Buscar archivos V.X
Write-Host "Buscando documentos V.X..." -ForegroundColor Yellow
$archivosVX = Get-ChildItem -Path $DetalleBasePath -Filter "V.*_*.md" -Recurse | Where-Object { $_.Name -match "v\d+\.\d+" }
Write-Host "Documentos V.X encontrados: $($archivosVX.Count)" -ForegroundColor Green
Write-Host ""

$consolidaciones = 0
$archivosMaster = @()

# Mapeo de V.X a sistemas master
$mapeoSistemas = @{
    "V.1_Senalizacion" = "SISTEMA_01_Control_y_Senalizacion_Master.md"
    "V.1_Senalizacion_Ferroviaria" = "SISTEMA_01_Control_y_Senalizacion_Master.md"
    "V.2_Centro_Control" = "SISTEMA_01_Control_y_Senalizacion_Master.md"
    "V.2_CTC" = "SISTEMA_01_Control_y_Senalizacion_Master.md"
    "V.3_Sistemas_Comunicacion" = "SISTEMA_02_Telecomunicaciones_Master.md"
    "V.4_Sistemas_Potencia" = "SISTEMA_05_Infraestructura_Operativa_Master.md"
    "V.5_Sistemas_Seguridad" = "SISTEMA_03_ITS_y_Seguridad_Master.md"
    "V.X_Enclavamientos" = "SISTEMA_01_Control_y_Senalizacion_Master.md"
    "V.X_Sistema_Desvios" = "SISTEMA_01_Control_y_Senalizacion_Master.md"
    "V.X_Sistema_EOT" = "SISTEMA_04_Material_Rodante_Master.md"
    "V.X_Sistema_GSM" = "SISTEMA_02_Telecomunicaciones_Master.md"
}

foreach ($archivoVX in $archivosVX) {
    Write-Host "Procesando: $($archivoVX.Name)..." -ForegroundColor Cyan
    
    # Identificar sistema master correspondiente
    $sistemaKey = ""
    foreach ($key in $mapeoSistemas.Keys) {
        if ($archivoVX.Name -match $key) {
            $sistemaKey = $key
            break
        }
    }
    
    if ($sistemaKey) {
        $archivoMaster = $mapeoSistemas[$sistemaKey]
        $rutaMaster = Join-Path $CarpetaXPath "1_SISTEMAS_TECNICOS\$archivoMaster"
        
        Write-Host "  -> Sistema Master: $archivoMaster" -ForegroundColor Green
        
        if (Test-Path $rutaMaster) {
            if (-not $DryRun) {
                # Leer contenido V.X
                $contenidoVX = Get-Content $archivoVX.FullName -Raw -Encoding UTF8
                
                # Leer Master actual
                $contenidoMaster = Get-Content $rutaMaster -Raw -Encoding UTF8
                
                # Agregar nota de sincronización al Master
                $fechaActual = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
                $notaSync = "`n<!-- Sincronizado con $($archivoVX.Name) el $fechaActual -->`n"
                
                # Buscar seccion de sincronizacion o crearla
                if ($contenidoMaster -notmatch "ULTIMA SINCRONIZACION CON FUENTES") {
                    $contenidoMaster += "`n`n---`n`n## ULTIMA SINCRONIZACION CON FUENTES`n`n"
                }
                
                $contenidoMaster += $notaSync
                $contenidoMaster += "- $($archivoVX.Name) sincronizado el $fechaActual`n"
                
                # Guardar Master actualizado
                $contenidoMaster | Out-File -FilePath $rutaMaster -Encoding UTF8 -Force
                
                Write-Host "    Master actualizado" -ForegroundColor Green
                $archivosMaster += $rutaMaster
                $consolidaciones++
            } else {
                Write-Host "    DRY-RUN: Se consolidaria a $archivoMaster" -ForegroundColor Yellow
            }
        } else {
            Write-Host "    Master no encontrado: $archivoMaster" -ForegroundColor Yellow
        }
    } else {
        Write-Host "  Sin mapeo a sistema master" -ForegroundColor Gray
    }
}

# Resumen
Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host "  CONSOLIDACION COMPLETADA" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""

Write-Host "ESTADISTICAS:" -ForegroundColor Cyan
Write-Host "  Documentos V.X procesados: $($archivosVX.Count)" -ForegroundColor White
Write-Host "  Consolidaciones realizadas: $consolidaciones" -ForegroundColor White
Write-Host "  Archivos Master actualizados: $($archivosMaster.Count)" -ForegroundColor White

if ($archivosMaster.Count -gt 0) {
    Write-Host ""
    Write-Host "ARCHIVOS MASTER ACTUALIZADOS:" -ForegroundColor Cyan
    foreach ($archivo in $archivosMaster) {
        Write-Host "  - $archivo" -ForegroundColor White
    }
}

Write-Host ""

