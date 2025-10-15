# ================================================================
# MÓDULO: Layout Preserver - Preservar equipos de otras categorías
# Fecha: 15 Octubre 2025
# Propósito: Asegurar que scripts de DT NO borren equipos de otras categorías
# ================================================================

<#
.SYNOPSIS
Módulo para preservar equipos de categorías no afectadas al regenerar layout

.DESCRIPTION
Al ejecutar una DT que afecta una categoría específica (ej: TELECOMUNICACIONES),
este módulo asegura que equipos de otras categorías (CONTROL, ITS, etc.) 
NO sean eliminados accidentalmente.

.EXAMPLE
$layout = Get-LayoutCompleto
$layoutSinTetra = Remove-EquiposPorFiltro -Layout $layout -Filtro { $_ -match 'EBT_' }
$layoutNuevo = Add-EquiposNuevos -Layout $layoutSinTetra -Nuevos $nuevasTorres
Save-LayoutCompleto -Layout $layoutNuevo
#>

# ================================================================
# FUNCIÓN: Cargar Layout Completo
# ================================================================

function Get-LayoutCompleto {
    param(
        [string]$LayoutPath = "layout.md",
        [string]$BackupMaestro = "backup_layout_pre_DT-LAYOUT-001_20251012_002606/layout_datos.js"
    )
    
    Write-Host "  📂 Cargando layout completo..." -ForegroundColor Gray
    
    # Si layout.md no existe o está vacío, intentar cargar desde backup maestro
    if (-not (Test-Path $LayoutPath) -or (Get-Content $LayoutPath -Raw).Trim() -eq '') {
        Write-Host "  ⚠️  layout.md vacío o inexistente" -ForegroundColor Yellow
        
        if (Test-Path $BackupMaestro) {
            Write-Host "  ✓ Usando backup maestro: $BackupMaestro" -ForegroundColor Green
            # Convertir JSON a líneas layout.md
            # (Esto requeriría parsear el JSON y reconstruir el formato TSV)
            # Por ahora, retornar array vacío y advertir
            Write-Host "  ⚠️  Conversión JSON→MD no implementada, usando layout.md actual" -ForegroundColor Yellow
        }
    }
    
    $layoutContent = Get-Content $LayoutPath -Encoding UTF8
    Write-Host "  ✓ Layout cargado: $($layoutContent.Count) líneas" -ForegroundColor Green
    
    return $layoutContent
}

# ================================================================
# FUNCIÓN: Obtener Equipos por Categoría
# ================================================================

function Get-EquiposPorCategoria {
    param(
        [Parameter(Mandatory=$true)]
        [array]$Layout,
        
        [Parameter(Mandatory=$true)]
        [string]$Categoria
    )
    
    $equipos = @()
    
    foreach ($linea in $Layout) {
        if ($linea -match "`t" -and $linea -match "^UFV" -and $linea -notmatch "^#") {
            $celdas = $linea -split "`t"
            if ($celdas.Count -gt 7) {
                $cat = $celdas[7].Trim()
                if ($cat -eq $Categoria) {
                    $equipos += $linea
                }
            }
        }
    }
    
    return $equipos
}

# ================================================================
# FUNCIÓN: Remover Equipos de una Categoría
# ================================================================

function Remove-EquiposPorCategoria {
    param(
        [Parameter(Mandatory=$true)]
        [array]$Layout,
        
        [Parameter(Mandatory=$true)]
        [string]$Categoria,
        
        [Parameter(Mandatory=$false)]
        [string]$FiltroAdicional = ""  # Ej: "EBT_" para eliminar solo torres TETRA
    )
    
    $layoutLimpio = @()
    $equiposEliminados = 0
    
    foreach ($linea in $Layout) {
        $eliminar = $false
        
        # Si es línea de equipo (no comentario, no vacía)
        if ($linea -match "`t" -and $linea -match "^UFV" -and $linea -notmatch "^#") {
            $celdas = $linea -split "`t"
            if ($celdas.Count -gt 7) {
                $cat = $celdas[7].Trim()
                
                # Verificar si es de la categoría a eliminar
                if ($cat -eq $Categoria) {
                    # Si hay filtro adicional, verificar que coincida
                    if ($FiltroAdicional -ne "" -and $linea -match $FiltroAdicional) {
                        $eliminar = $true
                        $equiposEliminados++
                    } elseif ($FiltroAdicional -eq "") {
                        # Sin filtro adicional, eliminar toda la categoría
                        $eliminar = $true
                        $equiposEliminados++
                    }
                }
            }
        }
        
        # También eliminar comentarios relacionados con la regeneración
        if ($FiltroAdicional -ne "" -and $linea -match $FiltroAdicional -and $linea -match "^#") {
            $eliminar = $true
        }
        
        if (-not $eliminar) {
            $layoutLimpio += $linea
        }
    }
    
    Write-Host "  ✓ Equipos eliminados de categoría '$Categoria': $equiposEliminados" -ForegroundColor Gray
    
    return $layoutLimpio
}

# ================================================================
# FUNCIÓN: Agregar Equipos Nuevos
# ================================================================

function Add-EquiposNuevos {
    param(
        [Parameter(Mandatory=$true)]
        [array]$Layout,
        
        [Parameter(Mandatory=$true)]
        [array]$EquiposNuevos,
        
        [Parameter(Mandatory=$false)]
        [string]$PuntoInsercion = "INSTITUCIONES EDUCATIVAS"  # Dónde insertar
    )
    
    # Buscar punto de inserción
    $insertIndex = -1
    for ($i = 0; $i -lt $Layout.Count; $i++) {
        if ($Layout[$i] -match $PuntoInsercion) {
            $insertIndex = $i
            break
        }
    }
    
    if ($insertIndex -eq -1) {
        $insertIndex = $Layout.Count
    }
    
    # Construir layout final
    $layoutFinal = @()
    $layoutFinal += $Layout[0..($insertIndex-1)]
    $layoutFinal += $EquiposNuevos
    $layoutFinal += ""
    if ($insertIndex -lt $Layout.Count) {
        $layoutFinal += $Layout[$insertIndex..($Layout.Count-1)]
    }
    
    Write-Host "  ✓ Equipos nuevos agregados: $($EquiposNuevos.Count)" -ForegroundColor Green
    
    return $layoutFinal
}

# ================================================================
# FUNCIÓN: Guardar Layout Completo
# ================================================================

function Save-LayoutCompleto {
    param(
        [Parameter(Mandatory=$true)]
        [array]$Layout,
        
        [Parameter(Mandatory=$false)]
        [string]$LayoutPath = "layout.md",
        
        [Parameter(Mandatory=$false)]
        [switch]$CrearBackup
    )
    
    if ($CrearBackup) {
        $backupPath = "layout_backup_$(Get-Date -Format 'yyyyMMdd_HHmmss').md"
        if (Test-Path $LayoutPath) {
            Copy-Item $LayoutPath $backupPath -Force
            Write-Host "  ✓ Backup creado: $backupPath" -ForegroundColor Gray
        }
    }
    
    $Layout | Out-File $LayoutPath -Encoding UTF8 -Force
    Write-Host "  ✅ Layout guardado: $LayoutPath ($($Layout.Count) líneas)" -ForegroundColor Green
}

# ================================================================
# FUNCIÓN: Verificar Categorías Intactas
# ================================================================

function Test-CategoriasIntactas {
    param(
        [Parameter(Mandatory=$true)]
        [array]$LayoutOriginal,
        
        [Parameter(Mandatory=$true)]
        [array]$LayoutNuevo,
        
        [Parameter(Mandatory=$true)]
        [string]$CategoriaModificada
    )
    
    Write-Host "  🔍 Verificando que otras categorías permanezcan intactas..." -ForegroundColor Gray
    
    # Contar equipos por categoría en ambos layouts
    $categoriasOriginal = @{}
    $categoriasNuevo = @{}
    
    foreach ($linea in $LayoutOriginal) {
        if ($linea -match "`t" -and $linea -match "^UFV") {
            $celdas = $linea -split "`t"
            if ($celdas.Count -gt 7) {
                $cat = $celdas[7].Trim()
                if (-not $categoriasOriginal.ContainsKey($cat)) {
                    $categoriasOriginal[$cat] = 0
                }
                $categoriasOriginal[$cat]++
            }
        }
    }
    
    foreach ($linea in $LayoutNuevo) {
        if ($linea -match "`t" -and $linea -match "^UFV") {
            $celdas = $linea -split "`t"
            if ($celdas.Count -gt 7) {
                $cat = $celdas[7].Trim()
                if (-not $categoriasNuevo.ContainsKey($cat)) {
                    $categoriasNuevo[$cat] = 0
                }
                $categoriasNuevo[$cat]++
            }
        }
    }
    
    # Verificar que categorías no modificadas tengan mismo conteo
    $todasIntactas = $true
    
    foreach ($cat in $categoriasOriginal.Keys) {
        if ($cat -ne $CategoriaModificada) {
            $countOriginal = $categoriasOriginal[$cat]
            $countNuevo = if ($categoriasNuevo.ContainsKey($cat)) { $categoriasNuevo[$cat] } else { 0 }
            
            if ($countOriginal -ne $countNuevo) {
                Write-Host "    ❌ ERROR: Categoría '$cat' cambió de $countOriginal a $countNuevo equipos" -ForegroundColor Red
                $todasIntactas = $false
            } else {
                Write-Host "    ✓ $cat : $countOriginal equipos (intacto)" -ForegroundColor Green
            }
        }
    }
    
    return $todasIntactas
}

# Exportar funciones
Export-ModuleMember -Function Get-LayoutCompleto, Get-EquiposPorCategoria, Remove-EquiposPorCategoria, Add-EquiposNuevos, Save-LayoutCompleto, Test-CategoriasIntactas

