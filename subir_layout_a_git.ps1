# Script para subir el layout_datos.js completo a Git

Write-Host "`n>>> SUBIENDO LAYOUT COMPLETO A GIT`n" -ForegroundColor Cyan

# Verificar que el archivo existe
$targetFile = "IX. WBS y Planificacion\layout_datos.js"
if (-not (Test-Path $targetFile)) {
    Write-Host "ERROR: El archivo $targetFile no existe" -ForegroundColor Red
    exit 1
}

# Mostrar información del archivo
$fileSize = (Get-Item $targetFile).Length
$fileSizeKB = [math]::Round($fileSize / 1KB, 2)
Write-Host "Archivo: $targetFile" -ForegroundColor White
Write-Host "Tamaño: $fileSizeKB KB" -ForegroundColor White
Write-Host ""

# Git add
Write-Host "1. Agregando archivo al staging..." -ForegroundColor Yellow
git add "IX. WBS y Planificacion/layout_datos.js"
if ($LASTEXITCODE -eq 0) {
    Write-Host "   OK - Archivo agregado" -ForegroundColor Green
} else {
    Write-Host "   ERROR al agregar archivo" -ForegroundColor Red
    exit 1
}

# Git commit
Write-Host "`n2. Creando commit..." -ForegroundColor Yellow
git commit -m "Fix: Restaurar layout_datos.js completo con todos los tipos de equipos" -m "Restaurado desde backup con 1953 elementos completos" -m "Incluye todos los tipos: TELECOMUNICACIONES CONTROL EQUIPO_ITS ENERGIA SENALIZACION EDIFICACION VIA SEGURIDAD INFRAESTRUCTURA" -m "Corrige issue donde solo aparecia TELECOMUNICACIONES en dropdown" -m "Archivo validado en local: todos los filtros funcionan correctamente"

if ($LASTEXITCODE -eq 0) {
    Write-Host "   OK - Commit creado" -ForegroundColor Green
} else {
    Write-Host "   AVISO - Puede que no haya cambios o ya este commiteado" -ForegroundColor Yellow
}

# Git push
Write-Host "`n3. Subiendo a GitHub..." -ForegroundColor Yellow
git push
if ($LASTEXITCODE -eq 0) {
    Write-Host "   OK - Cambios subidos a GitHub" -ForegroundColor Green
    Write-Host "`nGitHub Pages se actualizara en 2-3 minutos" -ForegroundColor Cyan
    Write-Host "URL: https://dieleoz.github.io/LD-CH/IX.%20WBS%20y%20Planificacion/WBS_Layout_Maestro.html" -ForegroundColor White
    Write-Host "`nRECUERDA: Hacer Ctrl + Shift + R para forzar recarga sin cache`n" -ForegroundColor Magenta
} else {
    Write-Host "   ERROR al subir cambios" -ForegroundColor Red
    Write-Host "   Verifica tu conexion a internet y permisos de GitHub" -ForegroundColor Yellow
    exit 1
}

Write-Host "`n>>> PROCESO COMPLETADO`n" -ForegroundColor Green
