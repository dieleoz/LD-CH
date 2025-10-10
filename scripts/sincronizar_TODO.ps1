# SCRIPT MAESTRO: Sincronizacion Completa
# Ejecuta todos los pasos de sincronizacion en secuencia

Write-Host "`n======================================================" -ForegroundColor Cyan
Write-Host "  SINCRONIZACION COMPLETA: WBS Operativa <-> Presupuestal" -ForegroundColor Green
Write-Host "======================================================`n" -ForegroundColor Cyan

# Obtener ubicación del script
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectRoot = Split-Path -Parent $scriptDir

# PASO 1: Extraer desde fuente maestra
Write-Host "[1/3] Extrayendo items desde WBS_Presupuestal_v2.0.md..." -ForegroundColor Yellow
& "$scriptDir\extraer_todos_items_wbs.ps1"

Write-Host "`n[OK] Paso 1 completado`n" -ForegroundColor Green

# PASO 2: Sincronizar con WBS Presupuestal
Write-Host "[2/3] Sincronizando con WBS Presupuestal..." -ForegroundColor Yellow
& "$scriptDir\sincronizar_wbs_presupuestal_con_operativa.ps1"

Write-Host "`n[OK] Paso 2 completado`n" -ForegroundColor Green

# PASO 3: Convertir a JS para evitar CORS
Write-Host "[3/3] Generando archivos JS..." -ForegroundColor Yellow

$json = Get-Content "$projectRoot\IX. WBS y Planificacion\datos_wbs_TODOS_items.json" -Raw
"const wbsDataGlobal = " + $json + ";" | Out-File -FilePath "$projectRoot\IX. WBS y Planificacion\datos_wbs_TODOS_items.js" -Encoding UTF8

Write-Host "  [OK] datos_wbs_TODOS_items.js generado" -ForegroundColor Green

# RESUMEN FINAL
Write-Host "`n======================================================" -ForegroundColor Cyan
Write-Host "           SINCRONIZACION COMPLETADA" -ForegroundColor Green
Write-Host "======================================================`n" -ForegroundColor Cyan

$jsonOp = Get-Content "$projectRoot\IX. WBS y Planificacion\datos_wbs_TODOS_items.json" -Raw | ConvertFrom-Json
Write-Host "Items sincronizados: $($jsonOp.items.Count)" -ForegroundColor White

Write-Host "`nAmbas WBS ahora usan LA MISMA FUENTE DE DATOS:" -ForegroundColor Cyan
Write-Host "  - WBS Operativa -> datos_wbs_TODOS_items.js" -ForegroundColor Gray
Write-Host "  - WBS Presupuestal -> wbs_presupuestal_datos.js`n" -ForegroundColor Gray

Write-Host "Si cambias cantidades en WBS Operativa:" -ForegroundColor Yellow
Write-Host "  1. Se genera DT" -ForegroundColor Gray
Write-Host "  2. Cursor ejecuta DT" -ForegroundColor Gray
Write-Host "  3. Actualiza WBS_Presupuestal_v2.0.md" -ForegroundColor Gray
Write-Host "  4. Ejecutas este script nuevamente" -ForegroundColor Gray
Write-Host "  5. Ambas WBS se sincronizan automaticamente`n" -ForegroundColor Gray

Write-Host "======================================================`n" -ForegroundColor Cyan

