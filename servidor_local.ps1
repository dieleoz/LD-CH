# Servidor Local Simple para WBS Interactivo
# Uso: .\servidor_local.ps1
# Luego abre: http://localhost:8080

Write-Host "🚀 Iniciando servidor local en puerto 8080..." -ForegroundColor Green
Write-Host ""
Write-Host "📂 Ruta base: $PSScriptRoot" -ForegroundColor Cyan
Write-Host ""
Write-Host "🌐 Abre en tu navegador:" -ForegroundColor Yellow
Write-Host "   http://localhost:8080/IX.%20WBS%20y%20Planificacion/WBS_Layout_Maestro.html" -ForegroundColor White
Write-Host ""
Write-Host "⏹️  Para detener: Presiona Ctrl+C" -ForegroundColor Red
Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host ""

# Usar el servidor HTTP simple de Python (viene preinstalado en Windows 10+)
try {
    # Intentar con Python 3
    python -m http.server 8080 2>$null
} catch {
    try {
        # Intentar con Python 2
        python -m SimpleHTTPServer 8080
    } catch {
        Write-Host "❌ Error: Python no está instalado" -ForegroundColor Red
        Write-Host ""
        Write-Host "Alternativas:" -ForegroundColor Yellow
        Write-Host "1. Instalar Python desde: https://www.python.org/downloads/" -ForegroundColor White
        Write-Host "2. Usar Node.js: npx http-server -p 8080" -ForegroundColor White
        Write-Host "3. Usar extensión Live Server en VS Code" -ForegroundColor White
        Read-Host "Presiona Enter para salir"
    }
}

