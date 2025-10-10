# ═══════════════════════════════════════════════════════════════════════
# SCRIPT: Sincronizar Reporte Gerencial con Justificaciones
# ═══════════════════════════════════════════════════════════════════════
# Propósito: Extraer justificaciones técnicas de DTs y enriquecer
#            reporte_gerencial_data.js con contexto técnico completo
# ═══════════════════════════════════════════════════════════════════════

param(
    [string]$DTsPath = "II. Apendices Tecnicos\Decisiones_Tecnicas",
    [string]$WbsJsonPath = "IX. WBS y Planificacion\datos_wbs_TODOS_items.json",
    [string]$OutputJsonPath = "IX. WBS y Planificacion\reporte_gerencial_justificaciones.json"
)

Write-Host "`n================================================================" -ForegroundColor Cyan
Write-Host "  SINCRONIZACION REPORTE GERENCIAL CON JUSTIFICACIONES" -ForegroundColor Cyan
Write-Host "================================================================`n" -ForegroundColor Cyan

# Verificar carpeta de DTs
if (-not (Test-Path $DTsPath)) {
    Write-Host "ERROR: No se encontro carpeta DTs: $DTsPath" -ForegroundColor Red
    exit 1
}

# Leer WBS
Write-Host "Leyendo WBS..." -ForegroundColor Yellow
$wbsData = Get-Content $WbsJsonPath -Raw -Encoding UTF8 | ConvertFrom-Json
Write-Host "Items WBS: $($wbsData.items.Count)" -ForegroundColor Green

# Buscar archivos DT
Write-Host "`nBuscando Decisiones Tecnicas..." -ForegroundColor Yellow
$archivosDT = Get-ChildItem -Path $DTsPath -Filter "DT-*.md" | Where-Object { $_.Name -notmatch "EJEMPLO|PLANTILLA|TEMPLATE" }
Write-Host "Archivos DT encontrados: $($archivosDT.Count)" -ForegroundColor Green

# Almacenar justificaciones por item WBS
$justificaciones = @{}

# Procesar cada DT
foreach ($archivo in $archivosDT) {
    Write-Host "  Procesando: $($archivo.Name)..." -ForegroundColor Cyan
    
    $contenido = Get-Content $archivo.FullName -Raw -Encoding UTF8
    $lineas = $contenido -split "`n"
    
    # Extraer metadata básica
    $itemWbs = ""
    $tipoCambio = ""
    $especialista = ""
    
    foreach ($linea in $lineas) {
        if ($linea -match "\*\*Item WBS:\*\*\s*(.+)") {
            $itemWbs = $matches[1].Trim() -replace " -.*", ""
        }
        elseif ($linea -match "\*\*Tipo de cambio:\*\*\s*(.+)") {
            $tipoCambio = $matches[1].Trim()
        }
        elseif ($linea -match "\*\*Especialista:\*\*\s*(.+)") {
            $especialista = $matches[1].Trim()
        }
    }
    
    # Extraer secciones
    $observacion = ""
    $justificacion = ""
    $impacto = ""
    $riesgos = ""
    $criterio = ""
    
    $seccionActual = ""
    $contenidoSeccion = ""
    
    foreach ($linea in $lineas) {
        # Detectar cambios de seccion
        if ($linea -match "^## \d+\. (.+)") {
            # Guardar seccion anterior
            if ($seccionActual -eq "OBSERVACION DEL ESPECIALISTA") {
                $observacion = $contenidoSeccion.Trim()
            }
            elseif ($seccionActual -eq "JUSTIFICACION TECNICA") {
                $justificacion = $contenidoSeccion.Trim()
            }
            elseif ($seccionActual -eq "IMPACTO ESPERADO") {
                $impacto = $contenidoSeccion.Trim()
            }
            
            # Nueva seccion
            $seccionActual = $matches[1].Trim().ToUpper()
            $contenidoSeccion = ""
        }
        else {
            # Acumular contenido
            $contenidoSeccion += $linea + "`n"
        }
    }
    
    # Extraer valores economicos
    $ahorroTotal = ""
    $ahorroUSD = ""
    $cantidadAntes = ""
    $cantidadDespues = ""
    
    if ($contenido -match "Ahorro.*?([0-9.,]+)\s*COP") {
        $ahorroTotal = $matches[1]
    }
    if ($contenido -match "Ahorro USD.*?([0-9.,]+)\s*USD") {
        $ahorroUSD = $matches[1]
    }
    if ($contenido -match "Cantidad Actual.*?(\d+)") {
        $cantidadAntes = $matches[1]
    }
    if ($contenido -match "Cantidad.*?Propuesto.*?(\d+)") {
        $cantidadDespues = $matches[1]
    }
    
    # Extraer criterio tecnico (primera linea de justificacion)
    $criterio = ($justificacion -split "`n" | Where-Object { $_.Trim() -ne "" } | Select-Object -First 3) -join " "
    $criterio = $criterio -replace "\*\*", "" -replace "\|", "" -replace "^\s*#", ""
    $criterio = $criterio.Substring(0, [Math]::Min(200, $criterio.Length))
    
    # Almacenar datos
    if ($itemWbs -ne "") {
        $justificaciones[$itemWbs] = @{
            id_dt = $archivo.BaseName
            item_wbs = $itemWbs
            tipo_cambio = $tipoCambio
            especialista = $especialista
            observacion = ($observacion.Substring(0, [Math]::Min(300, $observacion.Length)))
            justificacion_tecnica = ($justificacion.Substring(0, [Math]::Min(500, $justificacion.Length)))
            criterio_diseno = $criterio
            impacto_economico = @{
                ahorro_cop = $ahorroTotal
                ahorro_usd = $ahorroUSD
                cantidad_antes = $cantidadAntes
                cantidad_despues = $cantidadDespues
            }
            riesgos_mitigados = @()
            supuestos = @()
        }
        
        Write-Host "    (+) Extraido: Item $itemWbs - $tipoCambio" -ForegroundColor Green
    }
}

# Enriquecer con datos de WBS
Write-Host "`nEnriqueciendo con datos WBS..." -ForegroundColor Yellow

$reporteGerencial = @{
    proyecto = "APP La Dorada-Chiriguaná"
    fecha_actualizacion = (Get-Date).ToString("yyyy-MM-dd")
    total_items = $wbsData.items.Count
    items_con_justificacion = $justificaciones.Count
    items_pareto_80 = @()
    items = @()
}

# Calcular Pareto 80/20
$itemsOrdenados = $wbsData.items | Sort-Object -Property { [double]($_.total_cop -replace "[^\d.]", "") } -Descending
$totalGeneral = ($wbsData.items | ForEach-Object { [double]($_.total_cop -replace "[^\d.]", "") } | Measure-Object -Sum).Sum
$acumulado = 0
$umbral80 = $totalGeneral * 0.8

foreach ($item in $itemsOrdenados) {
    $valorItem = [double]($item.total_cop -replace "[^\d.]", "")
    $acumulado += $valorItem
    
    $itemData = @{
        codigo = $item.codigo
        descripcion = $item.descripcion
        cantidad = $item.cantidad
        valor_unitario = $item.valor_unitario_cop
        valor_total_cop = $item.total_cop
        tipo = $item.tipo
        porcentaje_total = [math]::Round(($valorItem / $totalGeneral) * 100, 2)
        es_pareto_80 = ($acumulado -le $umbral80)
    }
    
    # Agregar justificacion si existe
    if ($justificaciones.ContainsKey($item.codigo)) {
        $itemData.justificacion = $justificaciones[$item.codigo]
    }
    
    $reporteGerencial.items += $itemData
    
    if ($acumulado -le $umbral80) {
        $reporteGerencial.items_pareto_80 += $item.codigo
    }
}

# Guardar JSON
$reporteGerencial | ConvertTo-Json -Depth 100 | Out-File $OutputJsonPath -Encoding UTF8
Write-Host "JSON generado: $OutputJsonPath" -ForegroundColor Green

# Generar archivo .js
$jsPath = $OutputJsonPath -replace "\.json$", ".js"
$jsPath = "IX. WBS y Planificacion\reporte_gerencial_data.js"
$jsContent = "window.reporteGerencialData = " + ($reporteGerencial | ConvertTo-Json -Depth 100 -Compress) + ";"
$jsContent | Out-File $jsPath -Encoding UTF8
Write-Host "JS generado: $jsPath" -ForegroundColor Green

# Resumen
Write-Host "`n================================================================" -ForegroundColor Green
Write-Host "  SINCRONIZACION COMPLETADA" -ForegroundColor Green
Write-Host "================================================================`n" -ForegroundColor Green

Write-Host "ESTADISTICAS:" -ForegroundColor Cyan
Write-Host "  Total items WBS: $($reporteGerencial.total_items)" -ForegroundColor White
Write-Host "  Items con justificacion: $($reporteGerencial.items_con_justificacion)" -ForegroundColor White
Write-Host "  Items Pareto 80%: $($reporteGerencial.items_pareto_80.Count)" -ForegroundColor White
Write-Host ""

