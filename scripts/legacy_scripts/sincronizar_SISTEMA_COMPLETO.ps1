# SCRIPT MAESTRO: Sincronizacion COMPLETA del Sistema
# WBS + Riesgos + Cronograma + Reporte Gerencial

Write-Host "`n================================================================" -ForegroundColor Cyan
Write-Host "   SINCRONIZACION COMPLETA - Sistema WBS Integrado" -ForegroundColor Green
Write-Host "================================================================`n" -ForegroundColor Cyan

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectRoot = Split-Path -Parent $scriptDir

# PASO 1: WBS (Operativa <-> Presupuestal)
Write-Host "[1/4] Sincronizando WBS..." -ForegroundColor Yellow
& "$scriptDir\sincronizar_TODO.ps1"

# PASO 2: Riesgos (Matriz -> HTML)
Write-Host "`n[2/4] Sincronizando Riesgos..." -ForegroundColor Yellow
& "$scriptDir\sincronizar_riesgos_a_html.ps1"

# PASO 3: Reporte Gerencial (Pareto + Ruta Critica)
Write-Host "`n[3/4] Generando Reporte Gerencial..." -ForegroundColor Yellow
& "$scriptDir\generar_reporte_gerencial.ps1"

# PASO 4: Duraciones a JS
Write-Host "`n[4/4] Generando datos de cronograma..." -ForegroundColor Yellow
$json = Get-Content "$projectRoot\IX. WBS y Planificacion\duraciones_cronograma.json" -Raw
"const duracionesCronograma = " + $json + ";" | Out-File -FilePath "$projectRoot\IX. WBS y Planificacion\duraciones_cronograma.js" -Encoding UTF8
Write-Host "  [OK] duraciones_cronograma.js generado" -ForegroundColor Green

# RESUMEN FINAL
Write-Host "`n================================================================" -ForegroundColor Cyan
Write-Host "           SINCRONIZACION COMPLETA EXITOSA" -ForegroundColor Green
Write-Host "================================================================`n" -ForegroundColor Cyan

Write-Host "ARCHIVOS ACTUALIZADOS:" -ForegroundColor Yellow
Write-Host "  [OK] datos_wbs_TODOS_items.js (WBS Operativa)" -ForegroundColor Green
Write-Host "  [OK] wbs_presupuestal_datos.js (WBS Presupuestal)" -ForegroundColor Green
Write-Host "  [OK] riesgos_proyecto.js (Analisis Riesgos)" -ForegroundColor Green
Write-Host "  [OK] reporte_gerencial_data.js (Reporte Gerencial)" -ForegroundColor Green
Write-Host "  [OK] duraciones_cronograma.js (Cronograma)`n" -ForegroundColor Green

Write-Host "INTERFACES WEB ACTUALIZADAS (Recargar Ctrl+F5):" -ForegroundColor Yellow
Write-Host "  1. WBS_COMPLETA_TODO_Interactiva_v4.0.html" -ForegroundColor White
Write-Host "  2. WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguana.html" -ForegroundColor White
Write-Host "  3. WBS_Reporte_Gerencial.html" -ForegroundColor White
Write-Host "  4. WBS_Cronograma_Propuesta.html" -ForegroundColor White
Write-Host "  5. WBS_Analisis_Riesgos.html`n" -ForegroundColor White

Write-Host "================================================================`n" -ForegroundColor Cyan

