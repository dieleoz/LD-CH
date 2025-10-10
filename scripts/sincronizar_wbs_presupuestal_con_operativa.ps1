# SCRIPT: Sincronizar WBS Presupuestal con WBS Operativa
# Actualiza la WBS Presupuestal para usar los mismos datos que la Operativa

Write-Host "Sincronizando WBS Presupuestal con Operativa..." -ForegroundColor Green

# Leer datos de la WBS Operativa (fuente de verdad)
$jsonPath = "..\IX. WBS y Planificacion\datos_wbs_TODOS_items.json"
$jsPath = "..\IX. WBS y Planificacion\wbs_presupuestal_datos.js"
$wbsData = Get-Content $jsonPath -Raw | ConvertFrom-Json

Write-Host "Items cargados: $($wbsData.items.Count)" -ForegroundColor Cyan

# Mapear items a estructura presupuestal
$itemsPresupuestal = @()

foreach ($item in $wbsData.items) {
    # Crear item para WBS Presupuestal
    # NOTA: tipo, unidad ya vienen en el JSON base (fuente de verdad)
    $itemPresupuestal = @{
        nivel = $item.nivel
        item = $item.codigo
        descripcion = $item.descripcion
        unidad = $item.unidad
        cantidad = $item.cantidad
        vu = [string]$item.vu_cop
        total = [string]$item.total_cop
        tipo = $item.tipo
    }
    
    $itemsPresupuestal += $itemPresupuestal
}

# Generar archivo JS para WBS Presupuestal
$jsContent = "const wbsDataPresupuestal = " + ($itemsPresupuestal | ConvertTo-Json -Depth 10) + ";"
$jsContent | Out-File -FilePath $jsPath -Encoding UTF8

Write-Host "`n[OK] Sincronizacion completada" -ForegroundColor Green
Write-Host "Archivo generado: $jsPath" -ForegroundColor Cyan
Write-Host "Items sincronizados: $($itemsPresupuestal.Count)" -ForegroundColor White

# Resumen por tipo
Write-Host "`nRESUMEN POR TIPO:" -ForegroundColor Yellow
$suministros = ($itemsPresupuestal | Where-Object { $_.tipo -eq "SUMINISTRO" }).Count
$obras = ($itemsPresupuestal | Where-Object { $_.tipo -eq "OBRA" }).Count
$servicios = ($itemsPresupuestal | Where-Object { $_.tipo -eq "SERVICIO" }).Count

Write-Host "  SUMINISTROS: $suministros items" -ForegroundColor White
Write-Host "  OBRAS: $obras items" -ForegroundColor White
Write-Host "  SERVICIOS: $servicios items" -ForegroundColor White

Write-Host "`nProximo paso:" -ForegroundColor Cyan
Write-Host "  Actualizar WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguana.html" -ForegroundColor Gray
Write-Host "  para que cargue desde wbs_presupuestal_datos.js" -ForegroundColor Gray

Write-Host "`nPresiona Enter para continuar..."
Read-Host

