# ================================================================
#  SERVIR INGENIERIA COMPLETO - Wrapper para servir.ps1
#  Proposito: Ejecutar el proceso completo de "servir" todos los
#             documentos ejecutivos.
# ================================================================

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  INICIANDO SERVICIO COMPLETO DE INGENIERIA..." -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

try {
    # Llama al script principal 'servir.ps1' con el parametro -Todo
    & "$PSScriptRoot\servir.ps1" -Todo
    
    Write-Host ""
    Write-Host "================================================================" -ForegroundColor Green
    Write-Host "  SERVICIO COMPLETO FINALIZADO EXITOSAMENTE" -ForegroundColor Green
    Write-Host "================================================================" -ForegroundColor Green
    Write-Host ""
}
catch {
    Write-Host "ERROR: No se pudo ejecutar 'servir.ps1'. Asegurate de que el archivo existe y tienes permisos." -ForegroundColor Red
    Write-Host "Ruta esperada: $PSScriptRoot\servir.ps1" -ForegroundColor Yellow
}
