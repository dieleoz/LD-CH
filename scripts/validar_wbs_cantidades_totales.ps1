# ================================================================
# SCRIPT: Validador de Cantidades y Totales WBS
# Fecha: 15 Octubre 2025
# Propósito: Validar coherencia de cantidades, VU y totales en WBS
# ================================================================

param(
    [Parameter(Mandatory=$false)]
    [string]$WbsFile = "IX. WBS y Planificacion\WBS_Presupuestal_v2.0.md",
    
    [Parameter(Mandatory=$false)]
    [string[]]$ItemsValidar,  # Array de códigos de items a validar (opcional)
    
    [Parameter(Mandatory=$false)]
    [string]$Sistema,  # Validar solo un sistema (ej: "TETRA")
    
    [Parameter(Mandatory=$false)]
    [double]$ToleranciaPercent = 0.01,  # Tolerancia 0.01% para redondeos
    
    [Parameter(Mandatory=$false)]
    [switch]$Detallado  # Mostrar detalles de cada validación
)

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  VALIDADOR DE WBS - Cantidades y Totales" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

# Verificar archivo existe
if (-not (Test-Path $WbsFile)) {
    Write-Host "❌ ERROR: Archivo WBS no encontrado: $WbsFile" -ForegroundColor Red
    exit 1
}

Write-Host "📄 Archivo WBS: $WbsFile" -ForegroundColor White
Write-Host "🔍 Tolerancia: $ToleranciaPercent%" -ForegroundColor White
if ($Sistema) {
    Write-Host "🎯 Sistema: $Sistema" -ForegroundColor White
}
Write-Host ""

# Leer contenido
$contenido = Get-Content $WbsFile -Raw -Encoding UTF8

# ================================================================
# FUNCIÓN: Limpiar números (remover $, comas, espacios)
# ================================================================

function Limpiar-Numero {
    param([string]$valor)
    
    if ([string]::IsNullOrWhiteSpace($valor) -or $valor -eq '-') {
        return 0
    }
    
    # Remover $, comas, espacios
    $limpio = $valor -replace '[\$,\s]', ''
    
    # Convertir a double
    try {
        return [double]$limpio
    } catch {
        return 0
    }
}

# ================================================================
# FUNCIÓN: Formatear número a COP
# ================================================================

function Formatear-COP {
    param([double]$valor)
    return '$' + $valor.ToString('N0')
}

# ================================================================
# EXTRAER ITEMS DEL WBS
# ================================================================

Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray
Write-Host "EXTRAYENDO ITEMS DEL WBS..." -ForegroundColor Yellow
Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray

$items = @()
$erroresEncontrados = 0
$advertenciasEncontradas = 0

# Patrón para líneas de items (formato tabla Markdown)
# | **2.1.100** | Torres autosoportadas | 39 | $180,000,000 | $7,020,000,000 |
$patronItem = '\|\s*\*\*(\d+\.\d+\.\d+)\*\*\s*\|\s*([^\|]+?)\s*\|\s*([^\|]+?)\s*\|\s*([^\|]+?)\s*\|\s*([^\|]+?)\s*\|'

$matches = [regex]::Matches($contenido, $patronItem)

Write-Host "  Items encontrados: $($matches.Count)" -ForegroundColor White
Write-Host ""

foreach ($match in $matches) {
    $codigo = $match.Groups[1].Value.Trim()
    $descripcion = $match.Groups[2].Value.Trim()
    $cantidadStr = $match.Groups[3].Value.Trim()
    $vuStr = $match.Groups[4].Value.Trim()
    $totalStr = $match.Groups[5].Value.Trim()
    
    # Limpiar números
    $cantidad = Limpiar-Numero $cantidadStr
    $vu = Limpiar-Numero $vuStr
    $total = Limpiar-Numero $totalStr
    
    # Filtrar por items específicos si se especificaron
    if ($ItemsValidar -and $codigo -notin $ItemsValidar) {
        continue
    }
    
    # Filtrar por sistema si se especificó
    if ($Sistema -and $descripcion -notlike "*$Sistema*") {
        continue
    }
    
    $items += [PSCustomObject]@{
        Codigo = $codigo
        Descripcion = $descripcion
        Cantidad = $cantidad
        VU = $vu
        Total = $total
        CantidadStr = $cantidadStr
        VUStr = $vuStr
        TotalStr = $totalStr
    }
}

if ($items.Count -eq 0) {
    Write-Host "⚠️  No se encontraron items para validar" -ForegroundColor Yellow
    exit 0
}

Write-Host "  Items a validar: $($items.Count)" -ForegroundColor Green
Write-Host ""

# ================================================================
# VALIDAR CADA ITEM
# ================================================================

Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray
Write-Host "VALIDANDO ITEMS..." -ForegroundColor Yellow
Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray
Write-Host ""

foreach ($item in $items) {
    if ($Detallado) {
        Write-Host "  [$($item.Codigo)] $($item.Descripcion)" -ForegroundColor Cyan
    }
    
    # Calcular total esperado
    $totalEsperado = $item.Cantidad * $item.VU
    
    # Calcular diferencia
    $diferencia = [Math]::Abs($item.Total - $totalEsperado)
    $diferenciaPercent = if ($totalEsperado -gt 0) { 
        ($diferencia / $totalEsperado) * 100 
    } else { 
        0 
    }
    
    # Validar
    if ($diferenciaPercent -gt $ToleranciaPercent) {
        Write-Host "  ❌ ERROR en $($item.Codigo): $($item.Descripcion)" -ForegroundColor Red
        Write-Host "     Cantidad: $($item.Cantidad)" -ForegroundColor Gray
        Write-Host "     VU: $(Formatear-COP $item.VU)" -ForegroundColor Gray
        Write-Host "     Total esperado: $(Formatear-COP $totalEsperado)" -ForegroundColor Yellow
        Write-Host "     Total en archivo: $(Formatear-COP $item.Total)" -ForegroundColor Red
        Write-Host "     Diferencia: $(Formatear-COP $diferencia) ($([Math]::Round($diferenciaPercent, 2))%)" -ForegroundColor Red
        Write-Host ""
        $erroresEncontrados++
    } else {
        if ($Detallado) {
            Write-Host "    ✓ Cantidad: $($item.Cantidad)" -ForegroundColor Gray
            Write-Host "    ✓ VU: $(Formatear-COP $item.VU)" -ForegroundColor Gray
            Write-Host "    ✓ Total: $(Formatear-COP $item.Total) ✅" -ForegroundColor Green
            Write-Host ""
        }
    }
    
    # Validar que cantidad no sea 0 (advertencia)
    if ($item.Cantidad -eq 0 -and $item.CantidadStr -ne '-') {
        Write-Host "  ⚠️  ADVERTENCIA en $($item.Codigo): Cantidad es 0" -ForegroundColor Yellow
        $advertenciasEncontradas++
    }
}

# ================================================================
# VALIDAR SUBTOTALES (si existe)
# ================================================================

Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray
Write-Host "VALIDANDO SUBTOTALES..." -ForegroundColor Yellow
Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray
Write-Host ""

# Buscar subtotales en formato: | **SUBTOTAL TETRA** | | | | **$20,859,300,000** |
$patronSubtotal = '\|\s*\*\*SUBTOTAL\s+([^\*]+)\*\*\s*\|[^\|]*\|[^\|]*\|[^\|]*\|\s*\*\*([^\*]+)\*\*\s*\|'
$subtotales = [regex]::Matches($contenido, $patronSubtotal)

if ($subtotales.Count -eq 0) {
    Write-Host "  ℹ️  No se encontraron subtotales para validar" -ForegroundColor Gray
} else {
    foreach ($subtotalMatch in $subtotales) {
        $nombreSistema = $subtotalMatch.Groups[1].Value.Trim()
        $subtotalStr = $subtotalMatch.Groups[2].Value.Trim()
        $subtotal = Limpiar-Numero $subtotalStr
        
        # Filtrar por sistema si se especificó
        if ($Sistema -and $nombreSistema -ne $Sistema) {
            continue
        }
        
        Write-Host "  SUBTOTAL $nombreSistema" -ForegroundColor Cyan
        Write-Host "    Valor en archivo: $(Formatear-COP $subtotal)" -ForegroundColor White
        
        # Calcular subtotal sumando items del sistema
        # (Esto es una aproximación - idealmente deberíamos saber qué items pertenecen al subtotal)
        # Por ahora, si hay un sistema filtrado, sumar solo esos items
        if ($Sistema) {
            $sumaCalculada = ($items | Where-Object { $_.Descripcion -like "*$Sistema*" } | Measure-Object -Property Total -Sum).Sum
            
            $diferenciaSubtotal = [Math]::Abs($subtotal - $sumaCalculada)
            $diferenciaSubtotalPercent = if ($subtotal -gt 0) { 
                ($diferenciaSubtotal / $subtotal) * 100 
            } else { 
                0 
            }
            
            if ($diferenciaSubtotalPercent -gt $ToleranciaPercent) {
                Write-Host "    ❌ ERROR: Subtotal no coincide" -ForegroundColor Red
                Write-Host "       Calculado: $(Formatear-COP $sumaCalculada)" -ForegroundColor Yellow
                Write-Host "       En archivo: $(Formatear-COP $subtotal)" -ForegroundColor Red
                Write-Host "       Diferencia: $(Formatear-COP $diferenciaSubtotal) ($([Math]::Round($diferenciaSubtotalPercent, 2))%)" -ForegroundColor Red
                $erroresEncontrados++
            } else {
                Write-Host "    ✅ Subtotal CORRECTO" -ForegroundColor Green
            }
        } else {
            Write-Host "    ℹ️  Validación de subtotal omitida (especifica -Sistema para validar)" -ForegroundColor Gray
        }
        
        Write-Host ""
    }
}

# ================================================================
# RESUMEN FINAL
# ================================================================

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  RESUMEN DE VALIDACIÓN" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Items validados: $($items.Count)" -ForegroundColor White
Write-Host "Errores encontrados: $erroresEncontrados" -ForegroundColor $(if ($erroresEncontrados -eq 0) { "Green" } else { "Red" })
Write-Host "Advertencias: $advertenciasEncontradas" -ForegroundColor $(if ($advertenciasEncontradas -eq 0) { "Green" } else { "Yellow" })
Write-Host ""

if ($erroresEncontrados -eq 0 -and $advertenciasEncontradas -eq 0) {
    Write-Host "✅ VALIDACIÓN EXITOSA - Todos los totales son coherentes" -ForegroundColor Green
    exit 0
} elseif ($erroresEncontrados -eq 0) {
    Write-Host "⚠️  VALIDACIÓN OK CON ADVERTENCIAS" -ForegroundColor Yellow
    exit 0
} else {
    Write-Host "❌ VALIDACIÓN FALLIDA - Hay errores en los totales" -ForegroundColor Red
    Write-Host ""
    Write-Host "RECOMENDACIONES:" -ForegroundColor Yellow
    Write-Host "  1. Revisar los items marcados con ❌" -ForegroundColor White
    Write-Host "  2. Verificar cálculos: Total = Cantidad × VU" -ForegroundColor White
    Write-Host "  3. Corregir totales en WBS_Presupuestal_v2.0.md" -ForegroundColor White
    Write-Host ""
    exit 1
}

