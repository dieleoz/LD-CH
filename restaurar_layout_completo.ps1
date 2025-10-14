# Script para restaurar el archivo layout_datos.js completo desde el backup

Write-Host "`n🔄 RESTAURANDO LAYOUT COMPLETO DESDE BACKUP`n" -ForegroundColor Cyan

$backupFile = "backup_layout_pre_DT-LAYOUT-001_20251012_002606\layout_datos.js"
$targetFile = "IX. WBS y Planificacion\layout_datos.js"

if (Test-Path $backupFile) {
    Copy-Item $backupFile -Destination $targetFile -Force
    Write-Host "✅ Archivo restaurado exitosamente" -ForegroundColor Green
    Write-Host "📊 Verificando..." -ForegroundColor Yellow
    
    $lines = (Get-Content $targetFile | Measure-Object -Line).Lines
    Write-Host "   Líneas en archivo: $lines" -ForegroundColor Cyan
    
    Write-Host "`n🌐 Ahora abre en tu navegador:" -ForegroundColor Yellow
    Write-Host "   http://localhost:8080/IX.%20WBS%20y%20Planificacion/WBS_Layout_Maestro.html" -ForegroundColor White
    Write-Host "`n⚠️  Recuerda hacer Ctrl + Shift + R para forzar recarga sin caché`n" -ForegroundColor Magenta
} else {
    Write-Host "❌ No se encontró el archivo de backup" -ForegroundColor Red
}

