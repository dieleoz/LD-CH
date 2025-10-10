# SCRIPT: Generar Reporte Gerencial Dinámico
# Análisis Pareto + Riesgos Críticos + Ruta Crítica + Cambios Sustanciales

Write-Host "`nGenerando Reporte Gerencial Ejecutivo..." -ForegroundColor Green

# Cargar datos
$wbsJSON = Get-Content "IX. WBS y Planificacion\datos_wbs_TODOS_items.json" -Raw | ConvertFrom-Json
$cronogramaJSON = Get-Content "IX. WBS y Planificacion\duraciones_cronograma.json" -Raw | ConvertFrom-Json
$matrizRiesgos = "VIII. Documentos Maestros y Metodologia\Matrices_Dependencias\MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md"

Write-Host "[1/5] Analisis Pareto (80/20)..." -ForegroundColor Cyan

# Ordenar por costo total (descendente)
$itemsOrdenados = $wbsJSON.items | Where-Object { $_.total_cop -gt 0 } | Sort-Object total_cop -Descending

$totalPresupuesto = ($itemsOrdenados | Measure-Object -Property total_cop -Sum).Sum
$acumulado = 0
$itemsPareto = @()

foreach ($item in $itemsOrdenados) {
    $acumulado += $item.total_cop
    $porcentajeAcumulado = ($acumulado / $totalPresupuesto) * 100
    
    if ($porcentajeAcumulado -le 80) {
        $itemsPareto += [PSCustomObject]@{
            codigo = $item.codigo
            descripcion = $item.descripcion
            total_cop = $item.total_cop
            porcentaje = ($item.total_cop / $totalPresupuesto) * 100
            porcentaje_acumulado = $porcentajeAcumulado
            es_ruta_critica = $cronogramaJSON.duraciones.PSObject.Properties.Name -contains $item.codigo -and $cronogramaJSON.duraciones."$($item.codigo)".es_ruta_critica
            tiene_duracion = $cronogramaJSON.duraciones.PSObject.Properties.Name -contains $item.codigo
        }
    }
}

Write-Host "  Items Pareto (80% costo): $($itemsPareto.Count) de $($itemsOrdenados.Count)" -ForegroundColor Green

Write-Host "`n[2/5] Identificando Ruta Critica..." -ForegroundColor Cyan

$itemsRutaCritica = @()
foreach ($prop in $cronogramaJSON.duraciones.PSObject.Properties) {
    $duracion = $prop.Value
    if ($duracion.es_ruta_critica) {
        $itemWBS = $wbsJSON.items | Where-Object { $_.codigo -eq $prop.Name }
        $itemsRutaCritica += [PSCustomObject]@{
            codigo = $prop.Name
            nombre = $duracion.nombre
            duracion_meses = $duracion.duracion_meses
            total_cop = $itemWBS.total_cop
            razon = $duracion.ruta_critica_detalle
            puede_acelerarse = $duracion.puede_acelerarse
        }
    }
}

Write-Host "  Items Ruta Critica: $($itemsRutaCritica.Count)" -ForegroundColor Green

Write-Host "`n[3/5] Detectando Cambios Sustanciales (>10%)..." -ForegroundColor Cyan

# Aquí se compararía con versión anterior
# Por ahora, identificamos ítems con alto impacto potencial
$cambiosSustanciales = @()

Write-Host "`n[4/5] Extrayendo Riesgos Criticos/Altos..." -ForegroundColor Cyan

$riesgosCriticos = @()
if (Test-Path $matrizRiesgos) {
    $contenido = Get-Content $matrizRiesgos -Raw -Encoding UTF8
    $lineas = $contenido -split "`n"
    
    foreach ($linea in $lineas) {
        if ($linea -match '^\|\s*R-' -and ($linea -match 'Alto.*Alto|Crítico|Alta.*Crítico')) {
            $campos = $linea -split '\|' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
            if ($campos.Count -ge 3) {
                $riesgosCriticos += [PSCustomObject]@{
                    id = $campos[0]
                    descripcion = $campos[2]
                    nivel = if ($linea -match 'Crítico') { "CRÍTICO" } else { "ALTO" }
                }
            }
        }
    }
}

Write-Host "  Riesgos Criticos/Altos: $($riesgosCriticos.Count)" -ForegroundColor $(if ($riesgosCriticos.Count -gt 0) { "Red" } else { "Green" })

Write-Host "`n[5/5] Generando Reporte Gerencial..." -ForegroundColor Cyan

$reporteGerencial = @{
    fecha_generacion = (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
    pareto_items = $itemsPareto | Select-Object -First 10
    ruta_critica = $itemsRutaCritica
    riesgos_criticos = $riesgosCriticos
    cambios_sustanciales = $cambiosSustanciales
    recomendaciones_gerencia = @(
        @{
            prioridad = "ALTA"
            tema = "Ruta Critica - Fibra Optica"
            descripcion = "Item 2.3.100 (Fibra) define plazo total: 49 meses. NO puede acelerarse."
            accion = "Enfocar recursos en cumplimiento estricto de cronograma fibra"
        },
        @{
            prioridad = "ALTA"
            tema = "Aceleracion TETRA - Radioenlaces"
            descripcion = "TETRA puede acelerarse de 18 a 12 meses usando radioenlaces temporales. Permite operacion anticipada."
            accion = "Aprobar fast-tracking: Radioenlaces + 50M COP, Ahorro 6 meses"
        },
        @{
            prioridad = "MEDIA"
            tema = "Analisis Pareto"
            descripcion = "$($itemsPareto.Count) items representan 80% del presupuesto. Enfocar supervision en estos."
            accion = "Asignar PMO senior a items Pareto"
        }
    )
    alertas_gerenciales = @()
}

# Agregar alertas por riesgos críticos
if ($riesgosCriticos.Count -gt 0) {
    $reporteGerencial.alertas_gerenciales += @{
        tipo = "RIESGO"
        nivel = "CRÍTICO"
        cantidad = $riesgosCriticos.Count
        mensaje = "$($riesgosCriticos.Count) riesgos CRÍTICOS requieren atención inmediata"
    }
}

# Generar JS
$jsContent = "const reporteGerencialData = " + ($reporteGerencial | ConvertTo-Json -Depth 10) + ";"
$jsPath = "IX. WBS y Planificacion\reporte_gerencial_data.js"
$jsContent | Out-File -FilePath $jsPath -Encoding UTF8

Write-Host "`n[OK] Reporte Gerencial generado" -ForegroundColor Green
Write-Host "Archivo: $jsPath" -ForegroundColor Cyan

# ================================================================
# CACHE BUSTING EN HTML
# ================================================================

$htmlPath = "IX. WBS y Planificacion\WBS_Reporte_Gerencial.html"
if (Test-Path $htmlPath) {
    $htmlContent = Get-Content $htmlPath -Raw -Encoding UTF8
    $timestamp = (Get-Date).Ticks
    
    # Reemplazar la versión en la etiqueta del script usando grupos de captura para mayor robustez
    $newHtmlContent = $htmlContent -replace '(<script\s+src="reporte_gerencial_data\.js)\?v=[\d\.]*("></script>)', "`$1?v=$timestamp`$2"
    
    if ($htmlContent -ne $newHtmlContent) {
        $newHtmlContent | Out-File $htmlPath -Encoding UTF8
        Write-Host "OK Cache-busting aplicado: WBS_Reporte_Gerencial.html (v=$timestamp)" -ForegroundColor Cyan
    }
}

# Resumen
Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "         RESUMEN PARA GERENCIA" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "`nPARETO (80% del presupuesto):" -ForegroundColor Yellow
Write-Host "  Items criticos: $($itemsPareto.Count)" -ForegroundColor White

Write-Host "`nRUTA CRITICA:" -ForegroundColor Yellow
$itemsRutaCritica | ForEach-Object {
    Write-Host "  [$($_.codigo)] $($_.nombre): $($_.duracion_meses) meses" -ForegroundColor White
}

Write-Host "`nRIESGOS ALTOS/CRITICOS:" -ForegroundColor Red
Write-Host "  Total: $($riesgosCriticos.Count)" -ForegroundColor White

Write-Host "`nRECOMENDACIONES:" -ForegroundColor Green
$reporteGerencial.recomendaciones_gerencia | ForEach-Object {
    Write-Host "  [$($_.prioridad)] $($_.tema)" -ForegroundColor $(if ($_.prioridad -eq "ALTA") { "Red" } else { "Yellow" })
}

Write-Host "`n========================================`n" -ForegroundColor Cyan

Write-Host "Recarga WBS_Reporte_Gerencial.html para ver cambios" -ForegroundColor Cyan
Write-Host "`nPresiona Enter para continuar..."
Read-Host

