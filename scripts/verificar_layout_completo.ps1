# ================================================================
# SCRIPT: Verificar Layout Completo
# Propósito: Verificar que layout_datos.js tenga todas las categorías
# ================================================================

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  VERIFICACIÓN LAYOUT COMPLETO" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$layoutDatosPath = "IX. WBS y Planificacion/layout_datos.js"

if (-not (Test-Path $layoutDatosPath)) {
    Write-Host "❌ ERROR: layout_datos.js no encontrado" -ForegroundColor Red
    exit 1
}

Write-Host "Leyendo layout_datos.js..." -ForegroundColor Yellow
$content = Get-Content $layoutDatosPath -Raw

# Contar equipos totales
$total = ([regex]::Matches($content, '"nombre":"')).Count
Write-Host "  Total equipos: $total" -ForegroundColor White
Write-Host ""

# Contar por categoría
$categorias = @{}
[regex]::Matches($content, '"tipo_equipo":"([^"]+)"') | ForEach-Object {
    $cat = $_.Groups[1].Value
    if (-not $categorias.ContainsKey($cat)) {
        $categorias[$cat] = 0
    }
    $categorias[$cat]++
}

Write-Host "Categorías encontradas:" -ForegroundColor Cyan
Write-Host ""
$categorias.GetEnumerator() | Sort-Object Name | ForEach-Object {
    Write-Host "  ✓ $($_.Name): $($_.Value) equipos" -ForegroundColor White
}
Write-Host ""
Write-Host "Total categorías: $($categorias.Count)" -ForegroundColor Yellow
Write-Host ""

# Verificar que sea el layout completo
if ($total -ge 2100 -and $categorias.Count -ge 8) {
    Write-Host "✅ LAYOUT COMPLETO VERIFICADO" -ForegroundColor Green
    Write-Host "   - Equipos: $total (esperado ~2182)" -ForegroundColor Green
    Write-Host "   - Categorías: $($categorias.Count) (esperado 9)" -ForegroundColor Green
} elseif ($total -lt 2000) {
    Write-Host "❌ LAYOUT INCOMPLETO" -ForegroundColor Red
    Write-Host "   - Solo tiene $total equipos (esperado ~2182)" -ForegroundColor Red
    Write-Host "   - Faltan aproximadamente $(2182 - $total) equipos" -ForegroundColor Red
} else {
    Write-Host "⚠️  LAYOUT PARCIAL" -ForegroundColor Yellow
    Write-Host "   - Tiene $total equipos" -ForegroundColor Yellow
    Write-Host "   - Categorías: $($categorias.Count)" -ForegroundColor Yellow
}

