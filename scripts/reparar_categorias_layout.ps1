# ================================================================
# SCRIPT: Reparar Categorías en Layout (NO Regenerar)
# Fecha: 15 Octubre 2025
# Propósito: Actualizar columna 7 (tipo_equipo) con categorías dinámicas
#            SIN regenerar todo el layout (mantiene PKs, nombres, etc.)
# ================================================================

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  REPARANDO CATEGORÍAS EN LAYOUT.MD" -ForegroundColor Cyan
Write-Host "  Actualizando columna 7 (tipo_equipo) dinámicamente" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

# Importar módulo de mapeo
Import-Module "$PSScriptRoot\mapeo_dispositivo_categoria.psm1" -Force
Write-Host "✓ Módulo de mapeo cargado" -ForegroundColor Green
Write-Host ""

# ================================================================
# LEER LAYOUT.MD
# ================================================================

Write-Host "PASO 1: Leyendo layout.md..." -ForegroundColor Yellow

$layoutPath = "layout.md"
if (-not (Test-Path $layoutPath)) {
    Write-Host "  ❌ ERROR: No se encuentra layout.md" -ForegroundColor Red
    exit 1
}

$layoutContent = Get-Content $layoutPath -Encoding UTF8
Write-Host "  Total líneas: $($layoutContent.Count)" -ForegroundColor White
Write-Host ""

# ================================================================
# PROCESAR Y REPARAR LÍNEAS
# ================================================================

Write-Host "PASO 2: Reparando categorías..." -ForegroundColor Yellow

$lineasReparadas = @()
$equiposReparados = 0
$equiposOmitidos = 0
$categoriasAsignadas = @{}

foreach ($linea in $layoutContent) {
    # Si es comentario, línea vacía o header, mantener sin cambios
    if ($linea -match '^#' -or $linea -match '^[\s]*$' -or $linea -notmatch "`t") {
        $lineasReparadas += $linea
        $equiposOmitidos++
        continue
    }
    
    # Detectar si usa tabs
    if ($linea -match "`t") {
        $celdas = $linea -split "`t"
        
        # Validar que tenga al menos 9 columnas (incluyendo tipo_equipo)
        if ($celdas.Count -ge 9 -and $celdas[0] -match '^UFV') {
            # Extraer información del equipo
            $ufv = $celdas[0].Trim()
            $implementacion = $celdas[1].Trim()
            $nombre = $celdas[2].Trim()
            $pk = $celdas[3].Trim()
            $descripcion = $celdas[4].Trim()
            $ubicacion_lado = $celdas[5].Trim()
            $direccion = $celdas[6].Trim()
            $tipo_equipo_actual = $celdas[7].Trim()  # Columna 7 (probablemente "TELECOMUNICACIONES")
            $dispositivo = $celdas[8].Trim()
            
            # Obtener categoría correcta dinámicamente
            $categoria_nueva = Get-CategoriaDesdeDispositivo -Dispositivo $dispositivo -Nombre $nombre -Descripcion $descripcion
            
            # Contar categorías asignadas
            if (-not $categoriasAsignadas.ContainsKey($categoria_nueva)) {
                $categoriasAsignadas[$categoria_nueva] = 0
            }
            $categoriasAsignadas[$categoria_nueva]++
            
            # Reconstruir línea con nueva categoría
            $resto = $celdas[9..($celdas.Count-1)] -join "`t"
            $lineaNueva = "$ufv`t$implementacion`t$nombre`t$pk`t$descripcion`t$ubicacion_lado`t$direccion`t$categoria_nueva`t$dispositivo`t$resto"
            
            $lineasReparadas += $lineaNueva
            $equiposReparados++
            
        } else {
            # Línea no reconocida, mantener sin cambios
            $lineasReparadas += $linea
            $equiposOmitidos++
        }
    } else {
        # No tiene tabs, mantener sin cambios
        $lineasReparadas += $linea
        $equiposOmitidos++
    }
}

Write-Host "  Equipos reparados: $equiposReparados" -ForegroundColor Green
Write-Host "  Líneas sin cambios: $equiposOmitidos" -ForegroundColor Gray
Write-Host ""

# ================================================================
# MOSTRAR RESUMEN DE CATEGORÍAS
# ================================================================

Write-Host "CATEGORÍAS ASIGNADAS:" -ForegroundColor Cyan
Write-Host ""
$categoriasAsignadas.GetEnumerator() | Sort-Object Name | ForEach-Object {
    Write-Host "  ✓ $($_.Name): $($_.Value) equipos" -ForegroundColor White
}
Write-Host ""
Write-Host "Total categorías únicas: $($categoriasAsignadas.Count)" -ForegroundColor Yellow
Write-Host ""

# ================================================================
# GUARDAR LAYOUT REPARADO
# ================================================================

Write-Host "PASO 3: Guardando layout reparado..." -ForegroundColor Yellow

# Crear backup antes de sobrescribir
$backupPath = "layout_backup_$(Get-Date -Format 'yyyyMMdd_HHmmss').md"
Copy-Item $layoutPath $backupPath -Force
Write-Host "  ✓ Backup creado: $backupPath" -ForegroundColor Gray

# Guardar layout reparado
$lineasReparadas | Out-File $layoutPath -Encoding UTF8 -Force
Write-Host "  ✅ layout.md reparado ($($lineasReparadas.Count) líneas)" -ForegroundColor Green
Write-Host ""

# ================================================================
# REGENERAR LAYOUT_DATOS.JS
# ================================================================

Write-Host "PASO 4: Regenerando layout_datos.js..." -ForegroundColor Yellow

$scriptConvertir = "scripts\convertir_layout_a_js.ps1"
if (Test-Path $scriptConvertir) {
    & $scriptConvertir 2>&1 | Out-Null
    Write-Host "  ✅ layout_datos.js regenerado con categorías correctas" -ForegroundColor Green
} else {
    Write-Host "  ⚠️  Script convertir_layout_a_js.ps1 no encontrado" -ForegroundColor Yellow
}
Write-Host ""

# ================================================================
# RESUMEN
# ================================================================

Write-Host "================================================================" -ForegroundColor Green
Write-Host "  REPARACIÓN COMPLETADA" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "✅ Equipos reparados: $equiposReparados" -ForegroundColor White
Write-Host "✅ Categorías únicas: $($categoriasAsignadas.Count)" -ForegroundColor White
Write-Host "✅ layout.md actualizado" -ForegroundColor White
Write-Host "✅ layout_datos.js regenerado" -ForegroundColor White
Write-Host "✅ Backup creado: $backupPath" -ForegroundColor White
Write-Host ""
Write-Host "PRÓXIMO PASO:" -ForegroundColor Yellow
Write-Host "  Abrir WBS_Layout_Maestro.html y verificar filtros" -ForegroundColor White
Write-Host "  Ahora deberías ver múltiples categorías (no solo TELECOMUNICACIONES)" -ForegroundColor White
Write-Host ""

