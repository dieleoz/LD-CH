# Script: Regeneracion Automatica de Ejecutivos
# Version: 1.0 | Fecha: 10-Oct-2025
# Proposito: Automatizar ciclo Cocina -> Restaurante

param([switch]$Todo)

Write-Host ''
Write-Host '================================================================' -ForegroundColor Magenta
Write-Host '  CHEF EJECUTIVO AUTOMATICO - REGENERACION COMPLETA' -ForegroundColor Magenta
Write-Host '================================================================' -ForegroundColor Magenta
Write-Host ''

$raiz = Get-Location
$carpetaPrompts = 'scripts\prompts_regeneracion'
$carpetaEjecutivos = 'X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS'
$carpetaDTs = 'II. Apendices Tecnicos\Decisiones_Tecnicas'

if (-not (Test-Path $carpetaPrompts)) { New-Item -Path $carpetaPrompts -ItemType Directory -Force | Out-Null }

Write-Host 'PASO 1: Analizando sistemas con cambios recientes...' -ForegroundColor Yellow
$fechaLimite = (Get-Date).AddDays(-7)
$dtsRecientes = Get-ChildItem -Path $carpetaDTs -Filter 'DT-*.md' -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -gt $fechaLimite }

Write-Host '  Total DTs recientes: ' -NoNewline -ForegroundColor Cyan
Write-Host $dtsRecientes.Count -ForegroundColor White

if ($dtsRecientes.Count -eq 0 -and -not $Todo) {
    Write-Host '  OK: No hay cambios recientes para regenerar.' -ForegroundColor Green
    exit
}

Write-Host ''
Write-Host 'PASO 2: Sistema listo para regeneracion' -ForegroundColor Yellow
Write-Host '  Los documentos se regenerarian con las DTs recientes' -ForegroundColor White
Write-Host ''
Write-Host 'PASO 3: Para automatizar completamente, integrar API de LLM' -ForegroundColor Cyan
Write-Host ''
Write-Host '================================================================' -ForegroundColor Magenta
Write-Host '  REGENERACION LISTA (requiere integracion LLM)' -ForegroundColor Magenta
Write-Host '================================================================' -ForegroundColor Magenta
Write-Host ''
