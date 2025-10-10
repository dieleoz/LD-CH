# ================================================================
#  FUNCION: servir()
#  Sirve documentos ejecutivos a Word/HTML
# ================================================================
#
# USO:
#   .\scripts\servir.ps1                     # Sirve solo sistemas actualizados
#   .\scripts\servir.ps1 -Todo               # Sirve todos los documentos
#   .\scripts\servir.ps1 -Sistema 02         # Sirve solo SISTEMA_02
#

param(
    [switch]$Todo = $false,
    [string]$Sistema = ""
)

Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host "  SERVIR - De Ejecutivos (.md) a Platos (.docx/.html)" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""

$raiz = Get-Location
$carpetaEjecutivos = "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS"
$carpetaWord = "X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS\WORD"
$carpetaHTML = "X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS\HTML"

# Crear carpetas si no existen
if (-not (Test-Path $carpetaWord)) { New-Item -Path $carpetaWord -ItemType Directory -Force | Out-Null }
if (-not (Test-Path $carpetaHTML)) { New-Item -Path $carpetaHTML -ItemType Directory -Force | Out-Null }

# ================================================================
# IDENTIFICAR QUE SERVIR
# ================================================================

$ejecutivos = @()

if ($Sistema -ne "") {
    Write-Host "Modo: SERVIR SOLO SISTEMA_$Sistema" -ForegroundColor Yellow
    $ejecutivos = Get-ChildItem -Path $carpetaEjecutivos -Filter "SISTEMA_$Sistema`_*.md" -ErrorAction SilentlyContinue
} elseif ($Todo) {
    Write-Host "Modo: SERVIR TODO" -ForegroundColor Yellow
    $ejecutivos = Get-ChildItem -Path $carpetaEjecutivos -Filter "*.md"
} else {
    Write-Host "Modo: SERVIR SOLO ACTUALIZADOS (ultimos 7 dias)" -ForegroundColor Yellow
    $fechaLimite = (Get-Date).AddDays(-7)
    $ejecutivos = Get-ChildItem -Path $carpetaEjecutivos -Filter "*.md" | Where-Object {
        $_.LastWriteTime -gt $fechaLimite
    }
}

Write-Host "Documentos a servir: $($ejecutivos.Count)" -ForegroundColor Green
Write-Host ""

# ================================================================
# SERVIR CADA DOCUMENTO
# ================================================================

$wordGen = 0
$htmlGen = 0

foreach ($ej in $ejecutivos) {
    $nombre = $ej.BaseName
    Write-Host "Sirviendo: $nombre" -ForegroundColor Cyan
    
    $wordPath = Join-Path $carpetaWord "$nombre.docx"
    $htmlPath = Join-Path $carpetaHTML "$nombre.html"
    
    # Generar Word
    pandoc $ej.FullName -o $wordPath --toc --toc-depth=3 2>&1 | Out-Null
    if (Test-Path $wordPath) {
        $tamWord = [math]::Round((Get-Item $wordPath).Length / 1KB, 1)
        Write-Host "  Word: $tamWord KB" -ForegroundColor Green
        $wordGen++
    }
    
    # Generar HTML
    pandoc $ej.FullName -o $htmlPath --standalone --toc --toc-depth=3 2>&1 | Out-Null
    if (Test-Path $htmlPath) {
        $tamHTML = [math]::Round((Get-Item $htmlPath).Length / 1KB, 1)
        Write-Host "  HTML: $tamHTML KB" -ForegroundColor Green
        $htmlGen++
    }
    
    Write-Host ""
}

# ================================================================
# RESUMEN
# ================================================================

Write-Host "================================================================" -ForegroundColor Green
Write-Host "  PLATOS SERVIDOS" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Documentos servidos:" -ForegroundColor Cyan
Write-Host "  Word: $wordGen platos" -ForegroundColor White
Write-Host "  HTML: $htmlGen platos" -ForegroundColor White
Write-Host "  Total: $($wordGen + $htmlGen) archivos" -ForegroundColor Yellow
Write-Host ""
Write-Host "UBICACION:" -ForegroundColor Cyan
Write-Host "  Word: $carpetaWord" -ForegroundColor White
Write-Host "  HTML: $carpetaHTML" -ForegroundColor White
Write-Host ""
Write-Host "ABRIR MENU:" -ForegroundColor Magenta
Write-Host "  file:///$($(Join-Path $raiz 'X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS\HTML\INDICE_Documentos_Servidos.html') -replace '\\','/')" -ForegroundColor Yellow
Write-Host ""
Write-Host "PLATOS SERVIDOS Y LISTOS PARA CLIENTE!" -ForegroundColor Green
Write-Host ""

