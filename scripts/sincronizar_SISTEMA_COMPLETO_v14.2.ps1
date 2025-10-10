# Script Maestro: Sincronización Completa Sistema v14.2
# Propósito: Ejecutar todos los scripts de sincronización en secuencia
# Flujo: DTs -> Cronograma -> Riesgos -> Reporte -> V.X -> VIII/ -> Carpeta X

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  SINCRONIZACION SISTEMA COMPLETO v14.2" -ForegroundColor Cyan
Write-Host "  Flujo: DTs -> 7 NIVELES DE DOCUMENTACION" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$inicio = Get-Date

# 0. Ajustar cronograma desde DTs (NUEVO v14.4)
Write-Host "0/7 Ajustando CRONOGRAMA desde DTs..." -ForegroundColor Yellow
& ".\scripts\ajustar_cronograma_desde_DT.ps1"
Write-Host ""

# 1. Cronograma dinámico
Write-Host "1/7 Sincronizando CRONOGRAMA..." -ForegroundColor Yellow
& ".\scripts\sincronizar_cronograma.ps1"
Write-Host ""

# 2. Riesgos vinculados a WBS
Write-Host "2/7 Sincronizando RIESGOS WBS..." -ForegroundColor Yellow
& ".\scripts\sincronizar_riesgos_wbs_v3.ps1"
Write-Host ""

# 3. Reporte Gerencial con justificaciones
Write-Host "3/7 Sincronizando REPORTE GERENCIAL..." -ForegroundColor Yellow
& ".\scripts\sincronizar_reporte_gerencial.ps1"
Write-Host ""

# 4. Actualización documentos V.X
Write-Host "4/7 Actualizando DOCUMENTOS V.X..." -ForegroundColor Yellow
& ".\scripts\actualizar_documentos_detalle.ps1"
Write-Host ""

# 5. Actualización documentos maestros VIII/
Write-Host "5/7 Actualizando DOCUMENTOS MAESTROS VIII/..." -ForegroundColor Yellow
& ".\scripts\actualizar_documentos_maestros.ps1"
Write-Host ""

# 6. Consolidación a Carpeta X
Write-Host "6/7 Consolidando a CARPETA X..." -ForegroundColor Yellow
& ".\scripts\consolidar_para_carpeta_x.ps1"
Write-Host ""

$fin = Get-Date
$duracion = ($fin - $inicio).TotalSeconds

# Resumen final
Write-Host "================================================================" -ForegroundColor Green
Write-Host "  SINCRONIZACION COMPLETA FINALIZADA" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""

Write-Host "RESUMEN DE EJECUCION:" -ForegroundColor Cyan
Write-Host "  Tiempo total: $([math]::Round($duracion, 2)) segundos" -ForegroundColor White
Write-Host ""

Write-Host "NIVELES ACTUALIZADOS:" -ForegroundColor Cyan
Write-Host "  [1] IX. WBS y Planificacion - Cronograma/Riesgos/Reporte" -ForegroundColor Green
Write-Host "  [2] V. Ingenieria de detalle - Documentos V.X versionados" -ForegroundColor Green
Write-Host "  [3] III. Ingenieria conceptual - (Si aplica por DTs)" -ForegroundColor Yellow
Write-Host "  [4] VIII. Documentos Maestros - Matrices actualizadas" -ForegroundColor Green
Write-Host "  [5] X. Entregables Consolidados - Masters sincronizados" -ForegroundColor Green
Write-Host "  [6] Indices y navegacion - Referencias actualizadas" -ForegroundColor Yellow
Write-Host ""

Write-Host "ARCHIVOS GENERADOS:" -ForegroundColor Cyan
Write-Host "  - cronograma_datos.json / .js" -ForegroundColor White
Write-Host "  - riesgos_wbs.json / .js" -ForegroundColor White
Write-Host "  - reporte_gerencial_justificaciones.json" -ForegroundColor White
Write-Host "  - reporte_gerencial_data.js" -ForegroundColor White
Write-Host ""

Write-Host "Interfaces HTML actualizadas y listas para uso" -ForegroundColor Green
Write-Host "Abrir: IX. WBS y Planificacion\WBS_Menu_Principal.html" -ForegroundColor Cyan
Write-Host ""

