# ================================================================
# SCRIPT: Validador de Subsistemas en DTs (v2.1)
# Fecha: 15 Octubre 2025
# Proposito: Validar estructura YAML modular en archivos DT
# ================================================================

param(
    [Parameter(Mandatory=$true)]
    [string]$DtFile,  # Ruta al archivo DT-*.md
    
    [Parameter(Mandatory=$false)]
    [switch]$Verbose  # Mostrar detalles adicionales
)

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  VALIDADOR DE SUBSISTEMAS DT v2.1" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

# Verificar que archivo existe
if (-not (Test-Path $DtFile)) {
    Write-Host "❌ ERROR: Archivo no encontrado: $DtFile" -ForegroundColor Red
    exit 1
}

Write-Host "📄 Archivo: $DtFile" -ForegroundColor White
Write-Host ""

# Leer contenido
$contenido = Get-Content $DtFile -Raw -Encoding UTF8

# Extraer bloque YAML
if ($contenido -match '## 10\..*?```yaml\s+(.*?)\s+```'s) {
    $yamlContent = $Matches[1]
    Write-Host "✓ Bloque YAML encontrado" -ForegroundColor Green
    
    if ($Verbose) {
        Write-Host ""
        Write-Host "YAML Content (primeras 500 caracteres):" -ForegroundColor Gray
        Write-Host $yamlContent.Substring(0, [Math]::Min(500, $yamlContent.Length)) -ForegroundColor Gray
        Write-Host "..." -ForegroundColor Gray
        Write-Host ""
    }
} else {
    Write-Host "❌ ERROR: No se encontró bloque YAML en sección 10" -ForegroundColor Red
    exit 1
}

# ================================================================
# VALIDACIÓN 1: Modo Modular Activado
# ================================================================

Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray
Write-Host "VALIDACIÓN 1: Modo Modular" -ForegroundColor Yellow
Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray

if ($yamlContent -match 'ejecucion_modular:\s+activado:\s+true') {
    Write-Host "  ✓ Ejecución modular ACTIVADA" -ForegroundColor Green
    $esModular = $true
} else {
    Write-Host "  ⚠️  Ejecución modular NO activada (DT clásica)" -ForegroundColor Yellow
    $esModular = $false
}

if (-not $esModular) {
    Write-Host ""
    Write-Host "Esta DT usa formato clásico (no modular)." -ForegroundColor Yellow
    Write-Host "No hay subsistemas que validar." -ForegroundColor Yellow
    exit 0
}

Write-Host ""

# ================================================================
# VALIDACIÓN 2: Metadata
# ================================================================

Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray
Write-Host "VALIDACIÓN 2: Metadata" -ForegroundColor Yellow
Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray

$metadata = @{}

# Extraer ID
if ($yamlContent -match 'id:\s+"([^"]+)"') {
    $metadata['id'] = $Matches[1]
    Write-Host "  ✓ ID: $($metadata['id'])" -ForegroundColor Green
} else {
    Write-Host "  ❌ ERROR: ID no encontrado" -ForegroundColor Red
}

# Extraer fecha
if ($yamlContent -match 'fecha:\s+"([^"]+)"') {
    $metadata['fecha'] = $Matches[1]
    Write-Host "  ✓ Fecha: $($metadata['fecha'])" -ForegroundColor Green
} else {
    Write-Host "  ⚠️  Advertencia: Fecha no encontrada" -ForegroundColor Yellow
}

# Extraer item_wbs
if ($yamlContent -match 'item_wbs:\s+"([^"]+)"') {
    $metadata['item_wbs'] = $Matches[1]
    Write-Host "  ✓ Item WBS: $($metadata['item_wbs'])" -ForegroundColor Green
} else {
    Write-Host "  ⚠️  Advertencia: Item WBS no encontrado" -ForegroundColor Yellow
}

Write-Host ""

# ================================================================
# VALIDACIÓN 3: Subsistemas
# ================================================================

Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray
Write-Host "VALIDACIÓN 3: Subsistemas" -ForegroundColor Yellow
Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray

# Contar subsistemas (buscamos "- id:")
$subsistemas = [regex]::Matches($yamlContent, '- id:\s+"([^"]+)"')
$numSubsistemas = $subsistemas.Count

if ($numSubsistemas -eq 0) {
    Write-Host "  ❌ ERROR: No se encontraron subsistemas" -ForegroundColor Red
    Write-Host "     Una DT modular debe tener al menos 1 subsistema" -ForegroundColor Red
    exit 1
}

Write-Host "  ✓ Total subsistemas encontrados: $numSubsistemas" -ForegroundColor Green
Write-Host ""

# Validar cada subsistema
$errores = 0
$advertencias = 0
$subsistemaCriticoCount = 0

for ($i = 0; $i -lt $numSubsistemas; $i++) {
    $subsistemaId = $subsistemas[$i].Groups[1].Value
    Write-Host "  SUBSISTEMA $(($i+1))/$numSubsistemas : $subsistemaId" -ForegroundColor Cyan
    
    # Buscar bloque completo del subsistema
    $pattern = "- id:\s+`"$subsistemaId`"[\s\S]*?(?=(- id:|estrategia_ejecucion:|$))"
    if ($yamlContent -match $pattern) {
        $bloqueSubsistema = $Matches[0]
        
        # Validar campos obligatorios
        $camposObligatorios = @{
            'nombre' = 'nombre:\s+"([^"]+)"'
            'orden' = 'orden:\s+(\d+)'
            'critico' = 'critico:\s+(true|false)'
            'archivos' = 'archivos:'
            'resultado_esperado' = 'resultado_esperado:\s+"([^"]+)"'
        }
        
        foreach ($campo in $camposObligatorios.Keys) {
            if ($bloqueSubsistema -match $camposObligatorios[$campo]) {
                if ($Verbose) {
                    $valor = if ($Matches.Count -gt 1) { $Matches[1] } else { "presente" }
                    Write-Host "    ✓ $campo : $valor" -ForegroundColor Gray
                }
            } else {
                Write-Host "    ❌ ERROR: Campo obligatorio '$campo' no encontrado" -ForegroundColor Red
                $errores++
            }
        }
        
        # Verificar si es crítico
        if ($bloqueSubsistema -match 'critico:\s+true') {
            $subsistemaCriticoCount++
        }
        
        # Validar rollback
        if ($bloqueSubsistema -match 'rollback:') {
            if ($bloqueSubsistema -match 'posible:\s+(true|false)') {
                if ($Verbose) {
                    Write-Host "    ✓ Rollback configurado" -ForegroundColor Gray
                }
            } else {
                Write-Host "    ⚠️  Advertencia: Rollback sin campo 'posible'" -ForegroundColor Yellow
                $advertencias++
            }
        } else {
            Write-Host "    ⚠️  Advertencia: Rollback no configurado" -ForegroundColor Yellow
            $advertencias++
        }
        
        # Validar dependencias
        if ($bloqueSubsistema -match 'dependencias:\s+\[(.*?)\]') {
            $deps = $Matches[1]
            if ($deps.Trim() -ne '') {
                if ($Verbose) {
                    Write-Host "    ✓ Dependencias: $deps" -ForegroundColor Gray
                }
            }
        }
        
    } else {
        Write-Host "    ❌ ERROR: No se pudo extraer bloque completo del subsistema" -ForegroundColor Red
        $errores++
    }
    
    Write-Host ""
}

Write-Host "  Subsistemas críticos: $subsistemaCriticoCount / $numSubsistemas" -ForegroundColor White
Write-Host ""

# ================================================================
# VALIDACIÓN 4: Estrategia de Ejecución
# ================================================================

Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray
Write-Host "VALIDACIÓN 4: Estrategia de Ejecución" -ForegroundColor Yellow
Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray

if ($yamlContent -match 'estrategia_ejecucion:') {
    Write-Host "  ✓ Estrategia de ejecución definida" -ForegroundColor Green
    
    # Validar confirmación
    if ($yamlContent -match 'entre_subsistemas:\s+true') {
        Write-Host "  ✓ Confirmación entre subsistemas: ACTIVADA" -ForegroundColor Green
    } else {
        Write-Host "  ⚠️  Advertencia: Confirmación entre subsistemas no activada" -ForegroundColor Yellow
        $advertencias++
    }
    
    # Validar manejo de errores
    if ($yamlContent -match 'manejo_errores:') {
        Write-Host "  ✓ Manejo de errores configurado" -ForegroundColor Green
    } else {
        Write-Host "  ⚠️  Advertencia: Manejo de errores no configurado" -ForegroundColor Yellow
        $advertencias++
    }
    
} else {
    Write-Host "  ❌ ERROR: Estrategia de ejecución no definida" -ForegroundColor Red
    $errores++
}

Write-Host ""

# ================================================================
# RESUMEN FINAL
# ================================================================

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  RESUMEN DE VALIDACIÓN" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Archivo DT:" -ForegroundColor White
Write-Host "  $DtFile" -ForegroundColor Gray
Write-Host ""

Write-Host "Metadata:" -ForegroundColor White
Write-Host "  ID: $($metadata['id'])" -ForegroundColor Gray
if ($metadata['fecha']) {
    Write-Host "  Fecha: $($metadata['fecha'])" -ForegroundColor Gray
}
if ($metadata['item_wbs']) {
    Write-Host "  Item WBS: $($metadata['item_wbs'])" -ForegroundColor Gray
}
Write-Host ""

Write-Host "Subsistemas:" -ForegroundColor White
Write-Host "  Total: $numSubsistemas" -ForegroundColor Gray
Write-Host "  Críticos: $subsistemaCriticoCount" -ForegroundColor Gray
Write-Host "  Opcionales: $($numSubsistemas - $subsistemaCriticoCount)" -ForegroundColor Gray
Write-Host ""

Write-Host "Validación:" -ForegroundColor White
if ($errores -eq 0 -and $advertencias -eq 0) {
    Write-Host "  ✅ PERFECTO - Sin errores ni advertencias" -ForegroundColor Green
} elseif ($errores -eq 0) {
    Write-Host "  ⚠️  OK CON ADVERTENCIAS - $advertencias advertencia(s)" -ForegroundColor Yellow
} else {
    Write-Host "  ❌ ERRORES ENCONTRADOS - $errores error(es), $advertencias advertencia(s)" -ForegroundColor Red
}
Write-Host ""

# ================================================================
# RECOMENDACIONES
# ================================================================

if ($errores -gt 0 -or $advertencias -gt 0) {
    Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray
    Write-Host "RECOMENDACIONES:" -ForegroundColor Yellow
    Write-Host "──────────────────────────────────────────────────" -ForegroundColor Gray
    
    if ($errores -gt 0) {
        Write-Host "  • Corregir los $errores error(es) antes de ejecutar la DT" -ForegroundColor Red
    }
    
    if ($advertencias -gt 0) {
        Write-Host "  • Revisar las $advertencias advertencia(s)" -ForegroundColor Yellow
        Write-Host "    - Las advertencias no impiden ejecución pero pueden causar problemas" -ForegroundColor Yellow
    }
    
    Write-Host ""
}

# Exit code
if ($errores -gt 0) {
    Write-Host "Estado: ❌ NO VÁLIDO (hay errores)" -ForegroundColor Red
    exit 1
} elseif ($advertencias -gt 0) {
    Write-Host "Estado: ⚠️  VÁLIDO CON ADVERTENCIAS" -ForegroundColor Yellow
    exit 0
} else {
    Write-Host "Estado: ✅ VÁLIDO" -ForegroundColor Green
    exit 0
}

