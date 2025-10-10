# FILE WATCHER - WBS CAMBIOS
# Detecta cambios en WBS_Presupuestal y sincroniza automáticamente

Write-Host "`n================================================================" -ForegroundColor Green
Write-Host "        FILE WATCHER - WBS PRESUPUESTAL" -ForegroundColor Cyan
Write-Host "            Sincronización Automática" -ForegroundColor Cyan
Write-Host "================================================================`n" -ForegroundColor Green

# Obtener ruta del proyecto
$projectRoot = Split-Path -Parent $PSScriptRoot
$wbsPath = Join-Path $projectRoot "IX. WBS y Planificacion"

Write-Host "Configuración:" -ForegroundColor Yellow
Write-Host "  Carpeta vigilada: $wbsPath" -ForegroundColor White
Write-Host "  Archivo objetivo: WBS_Presupuestal_*.md" -ForegroundColor White
Write-Host "  Script sync: sincronizar_TODO.ps1`n" -ForegroundColor White

# Crear File Watcher
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $wbsPath
$watcher.Filter = "WBS_Presupuestal_*.md"
$watcher.IncludeSubdirectories = $false
$watcher.EnableRaisingEvents = $true

# Variable para evitar ejecuciones múltiples
$script:lastRun = [DateTime]::MinValue
$script:cooldownSeconds = 5

# Acción cuando se detecta cambio
$action = {
    param($source, $e)
    
    # Cooldown para evitar múltiples ejecuciones
    $now = Get-Date
    if (($now - $script:lastRun).TotalSeconds -lt $script:cooldownSeconds) {
        return
    }
    $script:lastRun = $now
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    
    Write-Host "`n================================================================" -ForegroundColor Yellow
    Write-Host "  CAMBIO DETECTADO EN WBS - $timestamp" -ForegroundColor Cyan
    Write-Host "================================================================" -ForegroundColor Yellow
    Write-Host "`nArchivo: $($e.Name)" -ForegroundColor White
    Write-Host "Tipo cambio: $($e.ChangeType)" -ForegroundColor White
    Write-Host "`nIniciando sincronización automática...`n" -ForegroundColor Cyan
    
    try {
        # Ejecutar script de sincronización
        $projectRoot = Split-Path -Parent $PSScriptRoot
        $syncScript = Join-Path $projectRoot "scripts\sincronizar_TODO.ps1"
        
        & $syncScript
        
        Write-Host "`n================================================================" -ForegroundColor Green
        Write-Host "  ✅ SINCRONIZACIÓN COMPLETADA AUTOMÁTICAMENTE" -ForegroundColor Green
        Write-Host "================================================================" -ForegroundColor Green
        Write-Host "`nInterfaces HTML actualizadas:" -ForegroundColor Yellow
        Write-Host "  - WBS_COMPLETA_TODO_Interactiva_v4.0.html" -ForegroundColor White
        Write-Host "  - WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguaná.html" -ForegroundColor White
        Write-Host "  - WBS_Reporte_Gerencial.html" -ForegroundColor White
        Write-Host "`nAcción requerida: Refresca el navegador (F5)`n" -ForegroundColor Cyan
        
    } catch {
        Write-Host "`n================================================================" -ForegroundColor Red
        Write-Host "  ❌ ERROR EN SINCRONIZACIÓN" -ForegroundColor Red
        Write-Host "================================================================" -ForegroundColor Red
        Write-Host "Error: $_" -ForegroundColor Red
        Write-Host "`nEjecuta manualmente:" -ForegroundColor Yellow
        Write-Host "  .\scripts\sincronizar_TODO.ps1`n" -ForegroundColor White
    }
}

# Registrar eventos
Register-ObjectEvent $watcher "Changed" -Action $action | Out-Null
Register-ObjectEvent $watcher "Created" -Action $action | Out-Null
Register-ObjectEvent $watcher "Renamed" -Action $action | Out-Null

Write-Host "================================================================" -ForegroundColor Green
Write-Host "  ✅ FILE WATCHER INICIADO Y ACTIVO" -ForegroundColor Green
Write-Host "================================================================`n" -ForegroundColor Green

Write-Host "Estado:" -ForegroundColor Yellow
Write-Host "  🟢 Vigilando cambios en WBS_Presupuestal" -ForegroundColor Green
Write-Host "  🔄 Sincronización automática activada" -ForegroundColor Green
Write-Host "  ⏱️  Cooldown: $cooldownSeconds segundos entre sincronizaciones`n" -ForegroundColor Gray

Write-Host "Instrucciones:" -ForegroundColor Cyan
Write-Host "  1. Modifica WBS_Presupuestal_v2.0.md" -ForegroundColor White
Write-Host "  2. Guarda el archivo (Ctrl+S)" -ForegroundColor White
Write-Host "  3. Watcher detecta y sincroniza automáticamente" -ForegroundColor White
Write-Host "  4. Refresca navegador (F5) para ver cambios`n" -ForegroundColor White

Write-Host "Para detener:" -ForegroundColor Yellow
Write-Host "  Presiona Ctrl+C en esta ventana`n" -ForegroundColor White

Write-Host "================================================================" -ForegroundColor Green
Write-Host "  Esperando cambios..." -ForegroundColor Gray
Write-Host "================================================================`n" -ForegroundColor Green

# Mantener el script corriendo
try {
    while ($true) {
        Start-Sleep -Seconds 1
    }
} finally {
    # Limpiar eventos al salir
    Write-Host "`n`nLimpiando eventos..." -ForegroundColor Yellow
    Get-EventSubscriber | Where-Object {$_.SourceObject -eq $watcher} | Unregister-Event
    $watcher.Dispose()
    Write-Host "File Watcher detenido.`n" -ForegroundColor Green
}

