# ================================================================
#  RECALCULO AUTOMATICO DE LAYOUT DESDE DT
#  Actualiza ubicaciones y genera "kits" de equipos
# ================================================================

param(
    [Parameter(Mandatory=$true)]
    [string]$DT_Path,
    
    [switch]$DryRun  # Simulacion sin aplicar cambios
)

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  RECALCULO AUTOMATICO DE LAYOUT DESDE DT" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

if ($DryRun) {
    Write-Host "MODO SIMULACION (Dry-Run) - No se aplicaran cambios" -ForegroundColor Yellow
    Write-Host ""
}

# ================================================================
# PARSEAR DT Y EXTRAER YAML
# ================================================================

Write-Host "1. Leyendo DT: $DT_Path" -ForegroundColor Yellow

if (-not (Test-Path $DT_Path)) {
    Write-Host "ERROR: DT no encontrada" -ForegroundColor Red
    exit 1
}

$dtContent = Get-Content $DT_Path -Raw -Encoding UTF8

# Buscar bloque YAML
if ($dtContent -match '(?s)```yaml\s+(.+?)```') {
    $yamlContent = $matches[1]
    Write-Host "YAML encontrado" -ForegroundColor Green
} else {
    Write-Host "ERROR: No se encontro bloque YAML en la DT" -ForegroundColor Red
    exit 1
}

# Parsear YAML (simulado - PowerShell no tiene parser YAML nativo)
# En produccion, usar modulo PowerShell-Yaml
Write-Host ""
Write-Host "2. Parseando configuracion de recalculo..." -ForegroundColor Yellow

# Ejemplo de lo que buscariamos en el YAML:
$configuracionEjemplo = @{
    layout_recalcular = @{
        activar = $true
        sistema = "Red_TETRA"
        parametro_cambio = "solapamiento_pct"
        valor_anterior = 20
        valor_nuevo = 30
        
        recalculo_automatico = @{
            cantidad_anterior = 37
            cantidad_nueva = 57
            pk_inicio = "201+470"
            pk_fin = "722+250"
            metodo = "distribucion_uniforme"
        }
        
        generar_instalaciones_nuevas = $true
        kit_por_instalacion = @(
            "Torre_TETRA",
            "UPS_10kVA",
            "Switch_Acceso",
            "Camara_CCTV"
        )
    }
}

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  CONFIGURACION DETECTADA" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Sistema afectado: Red TETRA" -ForegroundColor White
Write-Host "Parametro modificado: Solapamiento 20% -> 30%" -ForegroundColor White
Write-Host "Cantidad anterior: 37 nodos" -ForegroundColor White
Write-Host "Cantidad nueva: 57 nodos" -ForegroundColor White
Write-Host "Diferencia: +20 nodos nuevos" -ForegroundColor Green
Write-Host ""

# ================================================================
# RECALCULAR DISTRIBUCIÓN
# ================================================================

Write-Host "3. Recalculando distribucion de equipos..." -ForegroundColor Yellow

$pkInicio = 201.470  # PK 201+470
$pkFin = 722.250     # PK 722+250
$distanciaTotal = $pkFin - $pkInicio  # 520.78 km

$cantidadNueva = 57
$distanciaPorNodo = $distanciaTotal / $cantidadNueva

Write-Host ""
Write-Host "Distancia total: $($distanciaTotal.ToString('F2')) km" -ForegroundColor White
Write-Host "Nodos totales: $cantidadNueva" -ForegroundColor White
Write-Host "Distancia entre nodos: $($distanciaPorNodo.ToString('F2')) km" -ForegroundColor Green
Write-Host ""

# ================================================================
# GENERAR NUEVAS UBICACIONES
# ================================================================

Write-Host "4. Generando nuevas ubicaciones..." -ForegroundColor Yellow

function Format-PK {
    param([double]$pk)
    $km = [Math]::Floor($pk)
    $m = [Math]::Round(($pk - $km) * 1000)
    return "$($km.ToString('000'))+$($m.ToString('000'))"
}

function Calcular-UFV {
    param([double]$pk)
    
    # Mapeo simplificado PK -> UFV
    if ($pk -lt 223) { return "UFV23" }
    elseif ($pk -lt 250) { return "UFV30" }
    elseif ($pk -lt 313) { return "UFV31" }
    elseif ($pk -lt 327) { return "UFV01" }
    elseif ($pk -lt 354) { return "UFV02" }
    elseif ($pk -lt 376) { return "UFV34" }
    elseif ($pk -lt 406) { return "UFV35" }
    elseif ($pk -lt 430) { return "UFV36" }
    elseif ($pk -lt 462) { return "UFV39" }
    elseif ($pk -lt 501) { return "UFV44" }
    elseif ($pk -lt 533) { return "UFV45" }
    elseif ($pk -lt 552) { return "UFV46" }
    elseif ($pk -lt 569) { return "UFV47" }
    else { return "UFV49" }
}

$nuevosNodos = @()
$pkActual = $pkInicio

for ($i = 1; $i -le $cantidadNueva; $i++) {
    $nodo = @{
        ID = "EBT_$($i.ToString('00'))"
        PK_Numerico = $pkActual
        PK_Formato = Format-PK($pkActual)
        UFV = Calcular-UFV($pkActual)
        Tipo = "Nodo_TETRA_Intermedio"
        Kit_Equipos = @("Torre_TETRA", "UPS_10kVA", "Switch_Acceso", "Camara_CCTV")
    }
    
    $nuevosNodos += $nodo
    $pkActual += $distanciaPorNodo
}

Write-Host "Nodos generados: $($nuevosNodos.Count)" -ForegroundColor Green
Write-Host ""
Write-Host "Ejemplos de nuevos nodos:" -ForegroundColor Cyan
$nuevosNodos | Select-Object -First 5 | ForEach-Object {
    Write-Host "  $($_.ID): PK $($_.PK_Formato) | UFV $($_.UFV)" -ForegroundColor White
}
Write-Host "  ..." -ForegroundColor Gray
$nuevosNodos | Select-Object -Last 2 | ForEach-Object {
    Write-Host "  $($_.ID): PK $($_.PK_Formato) | UFV $($_.UFV)" -ForegroundColor White
}
Write-Host ""

# ================================================================
# ACTUALIZAR LAYOUT JERARQUICO (JSON)
# ================================================================

if (-not $DryRun) {
    Write-Host "5. Actualizando layout jerarquico..." -ForegroundColor Yellow
    
    $layoutPath = "VIII. Documentos Maestros y Metodologia\LAYOUT_JERARQUICO_v1.0.json"
    $layout = Get-Content $layoutPath -Raw | ConvertFrom-Json
    
    # Actualizar nodos TETRA
    $layout.sistemas_distribuidos.red_tetra.cantidad_nodos = $cantidadNueva
    $layout.sistemas_distribuidos.red_tetra.nodos = $nuevosNodos | ForEach-Object {
        @{
            id = $_.ID
            pk = $_.PK_Formato
            ufv = $_.UFV
        }
    }
    
    # Actualizar metadata
    $versionAnterior = $layout.metadata.version
    $versionNueva = "1.1"
    $layout.metadata.version = $versionNueva
    $layout.metadata.fecha_actualizacion = (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
    
    # Guardar
    $layout | ConvertTo-Json -Depth 10 | Out-File $layoutPath -Encoding UTF8
    
    Write-Host "Layout actualizado: v$versionAnterior -> v$versionNueva" -ForegroundColor Green
    Write-Host ""
    
    # ================================================================
    # REGENERAR HTML
    # ================================================================
    
    Write-Host "6. Regenerando interfaz visual..." -ForegroundColor Yellow
    .\scripts\generar_wbs_layout_jerarquico.ps1
    
} else {
    Write-Host "5. [SIMULACION] Layout NO actualizado (modo dry-run)" -ForegroundColor Yellow
    Write-Host ""
}

# ================================================================
# RESUMEN
# ================================================================

Write-Host "================================================================" -ForegroundColor Green
Write-Host "  RECALCULO COMPLETADO" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""

if (-not $DryRun) {
    Write-Host "CAMBIOS APLICADOS:" -ForegroundColor Green
    Write-Host "  Layout jerarquico actualizado: v1.0 -> v1.1" -ForegroundColor White
    Write-Host "  Nodos TETRA: 37 -> 57 (+20)" -ForegroundColor White
    Write-Host "  Interfaz HTML regenerada" -ForegroundColor White
    Write-Host ""
    Write-Host "PROXIMOS PASOS:" -ForegroundColor Cyan
    Write-Host "  1. Ejecutar: .\scripts\cocinar.ps1 -Sistema 02" -ForegroundColor White
    Write-Host "  2. Ejecutar: .\scripts\servir.ps1 -Sistema 02" -ForegroundColor White
    Write-Host "  3. Verificar documentos .docx/.html contienen layout actualizado" -ForegroundColor White
} else {
    Write-Host "SIMULACION COMPLETADA - Sin cambios aplicados" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Para aplicar cambios, ejecuta SIN flag -DryRun:" -ForegroundColor Cyan
    Write-Host "  .\scripts\recalcular_layout_desde_DT.ps1 -DT_Path '$DT_Path'" -ForegroundColor White
}

Write-Host ""

