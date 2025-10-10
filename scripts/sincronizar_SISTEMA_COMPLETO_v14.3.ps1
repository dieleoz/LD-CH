# SCRIPT MAESTRO: SINCRONIZACION COMPLETA DEL SISTEMA WBS
# Version: 14.3 | Fecha: 10 de Octubre 2025
# Proposito: Ejecutar sincronizacion completa de todas las interfaces WBS
#            con cache-busting automatico aplicado

param(
    [switch]$SoloRiesgos,
    [switch]$SoloReporte,
    [switch]$SoloCronograma
)

$ErrorActionPreference = "Continue"

Write-Host ""
Write-Host "================================================================" -ForegroundColor Magenta
Write-Host "   SINCRONIZACION MAESTRA - SISTEMA WBS COMPLETO v14.3" -ForegroundColor Magenta
Write-Host "================================================================" -ForegroundColor Magenta
Write-Host ""

$inicio = Get-Date

# PASO 1: ANALISIS DE RIESGOS WBS
if (-not $SoloReporte -and -not $SoloCronograma) {
    Write-Host "[1/3] SINCRONIZANDO ANALISIS DE RIESGOS..." -ForegroundColor Cyan
    Write-Host "----------------------------------------------------------------" -ForegroundColor DarkGray
    
    try {
        & "$PSScriptRoot\sincronizar_riesgos_wbs_v3.ps1"
        Write-Host "OK Riesgos sincronizados exitosamente" -ForegroundColor Green
    } catch {
        Write-Host "ERROR al sincronizar riesgos: $_" -ForegroundColor Red
    }
    
    Write-Host ""
}

# PASO 2: REPORTE GERENCIAL
if (-not $SoloRiesgos -and -not $SoloCronograma) {
    Write-Host "[2/3] GENERANDO REPORTE GERENCIAL..." -ForegroundColor Cyan
    Write-Host "----------------------------------------------------------------" -ForegroundColor DarkGray
    
    try {
        $null = echo "" | & "$PSScriptRoot\generar_reporte_gerencial.ps1" 2>&1
        Write-Host "OK Reporte Gerencial generado exitosamente" -ForegroundColor Green
    } catch {
        Write-Host "ERROR al generar reporte gerencial: $_" -ForegroundColor Red
    }
    
    Write-Host ""
}

# PASO 3: CRONOGRAMA DE TRABAJO
if (-not $SoloRiesgos -and -not $SoloReporte) {
    Write-Host "[3/3] SINCRONIZANDO CRONOGRAMA..." -ForegroundColor Cyan
    Write-Host "----------------------------------------------------------------" -ForegroundColor DarkGray
    
    try {
        & "$PSScriptRoot\sincronizar_cronograma.ps1"
        Write-Host "OK Cronograma sincronizado exitosamente" -ForegroundColor Green
    } catch {
        Write-Host "ERROR al sincronizar cronograma: $_" -ForegroundColor Red
    }
    
    Write-Host ""
}

# RESUMEN FINAL
$fin = Get-Date
$duracion = ($fin - $inicio).TotalSeconds

Write-Host "================================================================" -ForegroundColor Green
Write-Host "   SINCRONIZACION MAESTRA COMPLETADA" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "INTERFACES ACTUALIZADAS (con cache-busting automatico):" -ForegroundColor Cyan
Write-Host ""

if (-not $SoloReporte -and -not $SoloCronograma) {
    Write-Host "  OK WBS_Analisis_Riesgos.html" -ForegroundColor White
    Write-Host "     Archivo: riesgos_wbs.js" -ForegroundColor DarkGray
}

if (-not $SoloRiesgos -and -not $SoloCronograma) {
    Write-Host "  OK WBS_Reporte_Gerencial.html" -ForegroundColor White
    Write-Host "     Archivo: reporte_gerencial_data.js" -ForegroundColor DarkGray
}

if (-not $SoloRiesgos -and -not $SoloReporte) {
    Write-Host "  OK WBS_Cronograma_Propuesta.html" -ForegroundColor White
    Write-Host "     Archivo: cronograma_datos.js" -ForegroundColor DarkGray
}

Write-Host ""
Write-Host "Tiempo total: $([Math]::Round($duracion, 2)) segundos" -ForegroundColor Yellow
Write-Host ""
Write-Host "PROXIMO PASO:" -ForegroundColor Cyan
Write-Host "  Abrir WBS_Menu_Principal.html y navegar a las interfaces" -ForegroundColor White
Write-Host "  Los datos se cargaran automaticamente (cache-busting activado)" -ForegroundColor White
Write-Host ""
