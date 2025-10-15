# ================================================================
# SCRIPT: Regenerar layout.md desde layout_datos.js
# Fecha: 15 Octubre 2025
# Propósito: Reconstruir layout.md desde layout_datos.js (JSON → TSV)
# ================================================================

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  REGENERANDO layout.md DESDE layout_datos.js" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$layoutDatosPath = "IX. WBS y Planificacion/layout_datos.js"
$layoutMdPath = "layout.md"

# Leer layout_datos.js
if (-not (Test-Path $layoutDatosPath)) {
    Write-Host "❌ ERROR: layout_datos.js no encontrado" -ForegroundColor Red
    exit 1
}

Write-Host "PASO 1: Leyendo layout_datos.js..." -ForegroundColor Yellow
$content = Get-Content $layoutDatosPath -Raw

# Extraer JSON (está en formato: const LAYOUT_DATOS = [...];)
if ($content -match 'const LAYOUT_DATOS = (\[.*\]);') {
    $jsonData = $Matches[1]
    $equipos = $jsonData | ConvertFrom-Json
    Write-Host "  ✓ Equipos extraídos: $($equipos.Count)" -ForegroundColor Green
} else {
    Write-Host "❌ ERROR: No se pudo extraer JSON de layout_datos.js" -ForegroundColor Red
    exit 1
}

Write-Host ""

# Crear backup de layout.md actual
if (Test-Path $layoutMdPath) {
    $backupPath = "layout_backup_$(Get-Date -Format 'yyyyMMdd_HHmmss').md"
    Copy-Item $layoutMdPath $backupPath -Force
    Write-Host "  ✓ Backup creado: $backupPath" -ForegroundColor Gray
}

Write-Host "PASO 2: Generando layout.md..." -ForegroundColor Yellow

# Construir líneas del layout
$lineasLayout = @()
$lineasLayout += ""
$lineasLayout += "# LAYOUT COMPLETO - Regenerado desde layout_datos.js"
$lineasLayout += "# Fecha: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
$lineasLayout += "# Total equipos: $($equipos.Count)"
$lineasLayout += ""

# Agrupar por categoría para organización
$porCategoria = @{}
foreach ($equipo in $equipos) {
    $cat = if ($equipo.tipo_equipo) { $equipo.tipo_equipo } else { "OTROS" }
    if (-not $porCategoria.ContainsKey($cat)) {
        $porCategoria[$cat] = @()
    }
    $porCategoria[$cat] += $equipo
}

# Generar líneas por categoría
foreach ($categoria in ($porCategoria.Keys | Sort-Object)) {
    $lineasLayout += ""
    $lineasLayout += "# CATEGORÍA: $categoria ($($porCategoria[$categoria].Count) equipos)"
    $lineasLayout += ""
    
    foreach ($equipo in $porCategoria[$categoria]) {
        # Reconstruir formato TSV
        $ufv = if ($equipo.ufv) { $equipo.ufv } else { "" }
        $impl = if ($equipo.implementacion) { $equipo.implementacion } else { "" }
        $nombre = if ($equipo.nombre) { $equipo.nombre } else { "" }
        $pk = if ($equipo.pk) { $equipo.pk } else { "" }
        $desc = if ($equipo.descripcion) { $equipo.descripcion } else { "" }
        $lado = if ($equipo.ubicacion_lado) { $equipo.ubicacion_lado } else { "" }
        $dir = if ($equipo.direccion) { $equipo.direccion } else { "" }
        $tipo = if ($equipo.tipo_equipo) { $equipo.tipo_equipo } else { "" }
        $disp = if ($equipo.dispositivo) { $equipo.dispositivo } else { "" }
        
        $linea = "$ufv`t$impl`t$nombre`t$pk`t$desc`t$lado`t$dir`t$tipo`t$disp`tN/A`tN/A`tTBD`tTBD"
        $lineasLayout += $linea
    }
}

# Agregar sección final
$lineasLayout += ""
$lineasLayout += "# INSTITUCIONES EDUCATIVAS"
$lineasLayout += "# (Por definir según AT1)"
$lineasLayout += ""

# Guardar
$lineasLayout | Out-File $layoutMdPath -Encoding UTF8 -Force

Write-Host "  ✅ layout.md regenerado: $($lineasLayout.Count) líneas" -ForegroundColor Green
Write-Host ""

# Resumen por categoría
Write-Host "Resumen por categoría:" -ForegroundColor Cyan
foreach ($cat in ($porCategoria.Keys | Sort-Object)) {
    Write-Host "  ✓ $cat : $($porCategoria[$cat].Count) equipos" -ForegroundColor White
}
Write-Host ""
Write-Host "Total equipos: $($equipos.Count)" -ForegroundColor Yellow
Write-Host ""
Write-Host "✅ layout.md completo regenerado exitosamente" -ForegroundColor Green

