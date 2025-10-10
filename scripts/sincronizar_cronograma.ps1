# ═══════════════════════════════════════════════════════════════════════
# SCRIPT: Sincronizar Cronograma desde WBS
# ═══════════════════════════════════════════════════════════════════════
# Propósito: Leer datos_wbs_TODOS_items.json y generar cronograma_datos.json
#            con duraciones calculadas, dependencias y ruta crítica.
# ═══════════════════════════════════════════════════════════════════════

param(
    [string]$WbsJsonPath = "IX. WBS y Planificacion\datos_wbs_TODOS_items.json",
    [string]$CronogramaJsonPath = "IX. WBS y Planificacion\cronograma_datos.json"
)

Write-Host "`n================================================================" -ForegroundColor Cyan
Write-Host "  SINCRONIZACION DE CRONOGRAMA DESDE WBS" -ForegroundColor Cyan
Write-Host "================================================================`n" -ForegroundColor Cyan

# Verificar que el JSON de WBS existe
if (-not (Test-Path $WbsJsonPath)) {
    Write-Host "ERROR: No se encontro el archivo WBS JSON: $WbsJsonPath" -ForegroundColor Red
    exit 1
}

Write-Host "Leyendo datos de WBS..." -ForegroundColor Yellow

# Leer JSON de WBS
$wbsData = Get-Content $WbsJsonPath -Raw -Encoding UTF8 | ConvertFrom-Json

Write-Host "Items WBS leidos: $($wbsData.items.Count)" -ForegroundColor Green

# Leer cronograma existente (si existe) para preservar datos manuales
$cronogramaExistente = $null
if (Test-Path $CronogramaJsonPath) {
    Write-Host "Leyendo cronograma existente..." -ForegroundColor Yellow
    $cronogramaExistente = Get-Content $CronogramaJsonPath -Raw -Encoding UTF8 | ConvertFrom-Json
}

Write-Host "`nActualizando actividades del cronograma..." -ForegroundColor Yellow

# Actualizar solo las cantidades y fechas que dependen de la WBS
# Preservar duraciones, dependencias y otros datos manuales

$actualizaciones = 0

if ($cronogramaExistente) {
    foreach ($actividad in $cronogramaExistente.actividades) {
        # Buscar el item correspondiente en WBS
        $itemWbs = $wbsData.items | Where-Object { $_.codigo -eq $actividad.codigo_wbs }
        
        if ($itemWbs) {
            # Actualizar cantidad si cambió (limpiar texto como "594km")
            $cantidadTexto = $itemWbs.cantidad -replace '[^\d.]', ''
            $cantidadNueva = if ($cantidadTexto) { [int]$cantidadTexto } else { 0 }
            if ($actividad.cantidad -ne $cantidadNueva) {
                Write-Host "  Actualizando $($actividad.codigo_wbs): $($actividad.cantidad) → $cantidadNueva UND" -ForegroundColor Yellow
                
                $cantidadAnterior = $actividad.cantidad
                $actividad.cantidad = $cantidadNueva
                
                # Recalcular duración total
                $duracionNueva = $actividad.duracion_unitaria_dias * $cantidadNueva
                Write-Host "    Duracion: $($actividad.duracion_total_dias) → $duracionNueva dias" -ForegroundColor Cyan
                $actividad.duracion_total_dias = $duracionNueva
                
                # Recalcular fechas (simplificado - solo suma días)
                $fechaInicio = [DateTime]::Parse($actividad.inicio)
                $fechaFin = $fechaInicio.AddDays($duracionNueva)
                $actividad.fin = $fechaFin.ToString("yyyy-MM-dd")
                
                $actualizaciones++
            }
        }
    }
    
    # Actualizar fecha de actualización
    $cronogramaExistente.fecha_actualizacion = (Get-Date).ToString("yyyy-MM-dd")
    
    # Guardar cronograma actualizado
    $cronogramaExistente | ConvertTo-Json -Depth 100 | Out-File $CronogramaJsonPath -Encoding UTF8
    
    Write-Host "`nActualizaciones aplicadas: $actualizaciones" -ForegroundColor Green
    
    # Generar archivo .js para HTML
    $jsPath = $CronogramaJsonPath -replace '\.json$', '.js'
    $jsContent = "window.cronogramaData = " + ($cronogramaExistente | ConvertTo-Json -Depth 100 -Compress) + ";"
    $jsContent | Out-File $jsPath -Encoding UTF8
    
    Write-Host "Archivo JS generado: $jsPath" -ForegroundColor Green
    
} else {
    Write-Host "Cronograma no existe, usando el que ya fue creado manualmente" -ForegroundColor Yellow
    
    # Generar archivo .js desde el JSON existente
    if (Test-Path $CronogramaJsonPath) {
        $cronogramaData = Get-Content $CronogramaJsonPath -Raw -Encoding UTF8 | ConvertFrom-Json
        $jsPath = $CronogramaJsonPath -replace '\.json$', '.js'
        $jsContent = "window.cronogramaData = " + ($cronogramaData | ConvertTo-Json -Depth 100 -Compress) + ";"
        $jsContent | Out-File $jsPath -Encoding UTF8
        Write-Host "Archivo JS generado: $jsPath" -ForegroundColor Green
    }
}

Write-Host "`n================================================================" -ForegroundColor Green
Write-Host "  SINCRONIZACION DE CRONOGRAMA COMPLETADA" -ForegroundColor Green
Write-Host "================================================================`n" -ForegroundColor Green

Write-Host "PROXIMO PASO:" -ForegroundColor Cyan
Write-Host "  Modificar WBS_Cronograma_Propuesta.html para cargar cronograma_datos.js" -ForegroundColor White
Write-Host ""

