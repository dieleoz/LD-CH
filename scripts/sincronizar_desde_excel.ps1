# ═══════════════════════════════════════════════════════════════════════
# SCRIPT: Sincronizar WBS desde Excel (Fuente de Verdad)
# ═══════════════════════════════════════════════════════════════════════
# Propósito: Leer el Excel "Costo proyecto.xlsx" y actualizar automáticamente
#            todos los archivos JSON/JS/MD para que coincidan EXACTAMENTE.
# ═══════════════════════════════════════════════════════════════════════

param(
    [string]$ExcelPath = "X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS\Costo proyecto.xlsx"
)

Write-Host "`n╔═══════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  🔄 SINCRONIZACIÓN AUTOMÁTICA DESDE EXCEL (FUENTE DE VERDAD)         ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan

# Verificar que el Excel existe
if (-not (Test-Path $ExcelPath)) {
    Write-Host "❌ ERROR: No se encontró el archivo Excel: $ExcelPath" -ForegroundColor Red
    exit 1
}

Write-Host "📂 Archivo Excel encontrado: $ExcelPath" -ForegroundColor Green

# Cargar módulo para leer Excel (requiere ImportExcel)
if (-not (Get-Module -ListAvailable -Name ImportExcel)) {
    Write-Host "⚠️  Instalando módulo ImportExcel..." -ForegroundColor Yellow
    Install-Module -Name ImportExcel -Force -Scope CurrentUser -AllowClobber
}

Import-Module ImportExcel

Write-Host "`n📊 Leyendo datos del Excel..." -ForegroundColor Yellow

# Leer la hoja principal del Excel
try {
    $excelData = Import-Excel -Path $ExcelPath -WorksheetName "WBS" -NoHeader
    
    if (-not $excelData) {
        Write-Host "⚠️  No se encontró hoja 'WBS', intentando leer la primera hoja..." -ForegroundColor Yellow
        $excelData = Import-Excel -Path $ExcelPath -NoHeader
    }
    
    Write-Host "✅ Excel leído correctamente: $($excelData.Count) filas" -ForegroundColor Green
    
} catch {
    Write-Host "❌ ERROR al leer el Excel: $_" -ForegroundColor Red
    exit 1
}

# Parsear los datos del Excel
Write-Host "`n🔍 Parseando datos del Excel..." -ForegroundColor Yellow

$wbsItems = @()
$totalProyecto = 0

foreach ($row in $excelData) {
    # Buscar filas que contengan ítems WBS (formato: X.X.XXX)
    if ($row.P1 -match '^\d+\.\d+\.\d+$') {
        $item = [PSCustomObject]@{
            codigo = $row.P1
            descripcion = $row.P2
            tipo = $row.P3
            unidad = $row.P4
            cantidad = [decimal]$row.P5
            vu_cop = [decimal]$row.P6 -replace '[^\d.]', ''
            total_cop = [decimal]$row.P7 -replace '[^\d.]', ''
        }
        $wbsItems += $item
        $totalProyecto += $item.total_cop
    }
}

Write-Host "✅ Parseados $($wbsItems.Count) ítems del WBS" -ForegroundColor Green
Write-Host "💰 Total proyecto (Excel): $([math]::Round($totalProyecto, 2).ToString('N0')) COP" -ForegroundColor Cyan

# Mostrar resumen de ítems críticos
Write-Host "`n📋 ÍTEMS CRÍTICOS DETECTADOS:" -ForegroundColor Yellow
$wbsItems | Where-Object { $_.codigo -in @('1.1.103', '5.3.100', '5.3.101', '5.3.103') } | ForEach-Object {
    Write-Host "  • $($_.codigo) - $($_.descripcion): $([math]::Round($_.total_cop, 2).ToString('N0')) COP" -ForegroundColor White
}

# Actualizar archivos JSON/JS
Write-Host "`n🔧 Actualizando archivos de datos..." -ForegroundColor Yellow

# 1. Actualizar datos_wbs_TODOS_items.json
Write-Host "  📝 Actualizando datos_wbs_TODOS_items.json..." -ForegroundColor Cyan

$jsonPath = "IX. WBS y Planificacion\datos_wbs_TODOS_items.json"
if (Test-Path $jsonPath) {
    $jsonContent = Get-Content $jsonPath -Raw -Encoding UTF8 | ConvertFrom-Json
    
    $actualizados = 0
    foreach ($excelItem in $wbsItems) {
        # Buscar el item en el JSON
        $jsonItem = $jsonContent.sistema_wbs.capitulos | ForEach-Object { $_.items } | Where-Object { $_.codigo -eq $excelItem.codigo }
        
        if ($jsonItem) {
            if ($jsonItem.vu_cop -ne $excelItem.vu_cop -or $jsonItem.total_cop -ne $excelItem.total_cop) {
                Write-Host "    🔄 Actualizando $($excelItem.codigo): $($jsonItem.total_cop) → $($excelItem.total_cop)" -ForegroundColor Yellow
                $jsonItem.vu_cop = $excelItem.vu_cop
                $jsonItem.total_cop = $excelItem.total_cop
                $actualizados++
            }
        }
    }
    
    # Guardar JSON actualizado
    $jsonContent | ConvertTo-Json -Depth 100 | Out-File $jsonPath -Encoding UTF8
    Write-Host "    ✅ Actualizados $actualizados ítems en JSON" -ForegroundColor Green
}

# 2. Actualizar datos_wbs_TODOS_items.js
Write-Host "  📝 Actualizando datos_wbs_TODOS_items.js..." -ForegroundColor Cyan
$jsPath = "IX. WBS y Planificacion\datos_wbs_TODOS_items.js"
if (Test-Path $jsPath) {
    Copy-Item $jsonPath "$jsPath.tmp"
    $jsContent = "window.datos_wbs = " + (Get-Content $jsonPath -Raw -Encoding UTF8) + ";"
    $jsContent | Out-File $jsPath -Encoding UTF8
    Remove-Item "$jsPath.tmp" -ErrorAction SilentlyContinue
    Write-Host "    ✅ Archivo JS actualizado" -ForegroundColor Green
}

# 3. Actualizar wbs_presupuestal_datos.js
Write-Host "  📝 Actualizando wbs_presupuestal_datos.js..." -ForegroundColor Cyan
$wbsPresupuestalPath = "IX. WBS y Planificacion\wbs_presupuestal_datos.js"
if (Test-Path $wbsPresupuestalPath) {
    $presupuestalData = @()
    foreach ($item in $wbsItems) {
        $presupuestalData += @{
            tipo = $item.tipo
            item = $item.codigo
            vu = $item.vu_cop.ToString()
            cantidad = $item.cantidad.ToString()
            total = $item.total_cop.ToString()
            descripcion = $item.descripcion
            unidad = $item.unidad
        }
    }
    
    $presupuestalJs = "window.wbsData = " + ($presupuestalData | ConvertTo-Json -Compress) + ";"
    $presupuestalJs | Out-File $wbsPresupuestalPath -Encoding UTF8
    Write-Host "    ✅ Archivo wbs_presupuestal_datos.js actualizado" -ForegroundColor Green
}

# 4. Incrementar versión del HTML para forzar recarga
Write-Host "`n🔄 Actualizando versión del HTML..." -ForegroundColor Yellow
$htmlPath = "IX. WBS y Planificacion\WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguaná.html"
if (Test-Path $htmlPath) {
    $htmlContent = Get-Content $htmlPath -Raw -Encoding UTF8
    
    # Detectar versión actual
    if ($htmlContent -match 'Versión (\d+\.\d+)') {
        $versionActual = [decimal]$matches[1]
        $versionNueva = $versionActual + 0.1
        $htmlContent = $htmlContent -replace "Versión $versionActual", "Versión $versionNueva"
        $htmlContent | Out-File $htmlPath -Encoding UTF8
        Write-Host "  ✅ HTML actualizado: v$versionActual → v$versionNueva" -ForegroundColor Green
    }
}

Write-Host "`n╔═══════════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║  ✅ SINCRONIZACIÓN COMPLETADA EXITOSAMENTE                           ║" -ForegroundColor Green
Write-Host "╚═══════════════════════════════════════════════════════════════════════╝`n" -ForegroundColor Green

Write-Host "📋 RESUMEN:" -ForegroundColor Cyan
Write-Host "  • Ítems sincronizados: $($wbsItems.Count)" -ForegroundColor White
Write-Host "  • Total proyecto: $([math]::Round($totalProyecto, 2).ToString('N0')) COP" -ForegroundColor White
Write-Host "  • Archivos actualizados: 4" -ForegroundColor White
Write-Host "`n🎯 PRÓXIMOS PASOS:" -ForegroundColor Yellow
Write-Host "  1. Recarga el HTML con Ctrl+F5" -ForegroundColor White
Write-Host "  2. Verifica que el total coincida con el Excel" -ForegroundColor White
Write-Host "  3. Genera el Excel desde Ver Acta de Obra" -ForegroundColor White
Write-Host ""

