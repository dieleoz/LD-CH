# ================================================================
#  cocinar_v2.ps1 - VERSION MODULAR
#  Regenera documentos ejecutivos desde la cocina (I-VI)
# ================================================================
# Version: 2.0 (Modular)
# Fecha: 12 de Octubre 2025
# Cambios: Extraido a modulos reutilizables
# ================================================================

param(
    [switch]$Todo = $false,
    [string]$Sistema = "",
    [switch]$ConLogs = $false
)

# Importar modulos
Import-Module "$PSScriptRoot\modules\SistemaMapper.psm1" -Force
Import-Module "$PSScriptRoot\modules\DTDetector.psm1" -Force
Import-Module "$PSScriptRoot\modules\LayoutExecutor.psm1" -Force
Import-Module "$PSScriptRoot\modules\Consolidator.psm1" -Force

if ($ConLogs) {
    Import-Module "$PSScriptRoot\modules\Logger.psm1" -Force
    $log = Start-ActionLog -Accion "COCINAR" -Parametros @{
        todo = $Todo
        sistema = $Sistema
        con_logs = $ConLogs
    }
}

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  COCINAR v2.0 (MODULAR) - Regenerar desde Cocina (I-VI)" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$raiz = Get-Location

# PASO 1: OBTENER MAPEO DE SISTEMAS
$mapeoSistemas = Get-SistemaMapping

# PASO 2: IDENTIFICAR QUE COCINAR
$sistemasACocinar = @()

if ($Sistema -ne "") {
    Write-Host "Modo: COCINAR SOLO SISTEMA_$Sistema" -ForegroundColor Yellow
    $sistemasACocinar = @($Sistema)
} elseif ($Todo) {
    Write-Host "Modo: COCINAR TODO" -ForegroundColor Yellow
    $sistemasACocinar = $mapeoSistemas.Keys
} else {
    Write-Host "Modo: DETECTAR DTs RECIENTES (ultimos 7 dias)" -ForegroundColor Yellow
    
    $dtsRecientes = Get-DTsRecientes -DiasAtras 7
    
    if ($dtsRecientes.Count -gt 0) {
        Write-Host "  DTs recientes encontradas: $($dtsRecientes.Count)" -ForegroundColor Green
        $sistemasACocinar = $mapeoSistemas.Keys
    }
}

if ($sistemasACocinar.Count -eq 0) {
    Write-Host ""
    Write-Host "No hay sistemas para cocinar (sin DTs recientes)" -ForegroundColor Yellow
    Write-Host "Usa -Todo para cocinar todos de todas formas" -ForegroundColor Yellow
    Write-Host ""
    
    if ($ConLogs) {
        Complete-ActionLog -LogContext $log -Exitoso $true -Mensaje "Sin DTs recientes"
    }
    exit 0
}

Write-Host ""
Write-Host "Sistemas a cocinar: $($sistemasACocinar.Count)" -ForegroundColor Green
Write-Host ""

# PASO 3: PRE-COCINA - EJECUTAR SCRIPTS DE LAYOUT
Write-Host "PRE-COCINA: Verificando DTs con impacto en layout..." -ForegroundColor Yellow
Write-Host ""

$dtsLayout = Get-DTsConImpactoLayout -DiasAtras 7

if ($dtsLayout) {
    Write-Host "  Encontradas $($dtsLayout.Count) DTs con impacto en layout:" -ForegroundColor Green
    
    foreach ($dt in $dtsLayout) {
        Write-Host "    - $($dt.Archivo.Name)" -ForegroundColor White
        
        $ejecutado = Invoke-LayoutScript -Sistema $dt.Sistema -ScriptsPath $PSScriptRoot
        
        if ($ConLogs -and $ejecutado) {
            Add-ProcessedFile -LogContext $log -Archivo $dt.Archivo.Name -Estado "DT_EJECUTADA"
        }
    }
    Write-Host ""
} else {
    Write-Host "  No hay DTs con impacto en layout" -ForegroundColor Gray
    Write-Host ""
}

# PASO 4: COCINAR CADA SISTEMA
$cocinados = 0

foreach ($cap in $sistemasACocinar) {
    $config = $mapeoSistemas[$cap]
    
    Write-Host "Cocinando SISTEMA_$cap..." -ForegroundColor Cyan
    
    $resultado = New-SistemaEjecutivo -CapituloSistema $cap -ConfigSistema $config -RutaRaiz $raiz
    
    if ($resultado.Exitoso) {
        Write-Host "    Fuentes cocina: $($resultado.FuentesEncontradas)" -ForegroundColor Green
        Write-Host "    DTs Cap. $cap`: $($resultado.DTsEncontradas)" -ForegroundColor Green
        Write-Host "    Cocinado OK" -ForegroundColor Green
        
        $cocinados++
        
        if ($ConLogs) {
            Add-ModifiedFile -LogContext $log -Archivo $resultado.Ruta -TipoCambio "COCINADO"
            Add-LogMetric -LogContext $log -Nombre "sistema_$cap`_fuentes" -Valor $resultado.FuentesEncontradas
            Add-LogMetric -LogContext $log -Nombre "sistema_$cap`_dts" -Valor $resultado.DTsEncontradas
        }
    } else {
        Write-Host "    $($resultado.Mensaje)" -ForegroundColor Yellow
        
        if ($ConLogs) {
            Add-LogWarning -LogContext $log -Mensaje "SISTEMA_$cap`: $($resultado.Mensaje)"
        }
    }
    
    Write-Host ""
}

# PASO 5: RESUMEN
Write-Host "================================================================" -ForegroundColor Green
Write-Host "  COCINA COMPLETADA" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Sistemas cocinados: $cocinados" -ForegroundColor White
Write-Host ""
Write-Host "PROXIMO PASO:" -ForegroundColor Yellow
Write-Host "  Ejecuta: .\scripts\servir.ps1" -ForegroundColor Cyan
Write-Host "  Para servir los platos a Word/HTML" -ForegroundColor White
Write-Host ""

if ($ConLogs) {
    Add-LogMetric -LogContext $log -Nombre "sistemas_cocinados" -Valor $cocinados
    $resumen = Complete-ActionLog -LogContext $log -Exitoso $true -Mensaje "Cocina completada: $cocinados sistemas"
    
    Write-Host "Log generado: $($resumen.LogPath)" -ForegroundColor Green
    Write-Host "Duracion: $($resumen.DuracionSegundos)s" -ForegroundColor White
    Write-Host ""
}

