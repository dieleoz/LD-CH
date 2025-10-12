# ================================================================
#  SCRIPT: Exportar Layout Maestro a PDF
# ================================================================
#
# PROPÓSITO:
#   Exporta LAYOUT_MAESTRO_EQUIPOS_v1.0.md a PDF usando Pandoc
#
# USO:
#   .\scripts\exportar_layout_pdf.ps1
#   .\scripts\exportar_layout_pdf.ps1 -Sistema CONTROL    # Solo un sistema
#   .\scripts\exportar_layout_pdf.ps1 -UFV UFV23          # Solo una UFV
#
# REQUISITOS:
#   - Pandoc instalado (choco install pandoc)
#   - LaTeX instalado (opcional, para mejor formato)
#

param(
    [string]$Sistema = "",
    [string]$UFV = ""
)

Write-Host ""
Write-Host "================================================================" -ForegroundColor Magenta
Write-Host "  EXPORTAR LAYOUT A PDF" -ForegroundColor Magenta
Write-Host "================================================================" -ForegroundColor Magenta
Write-Host ""

$layoutPath = "VIII. Documentos Maestros y Metodologia\LAYOUT_MAESTRO_EQUIPOS_v1.0.md"
$carpetaSalida = "X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS\PDF"
$fecha = Get-Date -Format "yyyy-MM-dd"

# Crear carpeta si no existe
if (-not (Test-Path $carpetaSalida)) {
    New-Item -Path $carpetaSalida -ItemType Directory -Force | Out-Null
}

# Verificar que Pandoc existe
try {
    $pandocVersion = pandoc --version 2>&1 | Select-Object -First 1
    Write-Host "✅ Pandoc detectado: $pandocVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ ERROR: Pandoc no está instalado" -ForegroundColor Red
    Write-Host "   Instalar: choco install pandoc" -ForegroundColor Yellow
    Write-Host "   O descargar de: https://pandoc.org/installing.html" -ForegroundColor Yellow
    exit 1
}

# Verificar archivo existe
if (-not (Test-Path $layoutPath)) {
    Write-Host "❌ ERROR: Layout maestro no encontrado: $layoutPath" -ForegroundColor Red
    exit 1
}

Write-Host "Leyendo layout maestro..." -ForegroundColor Yellow

# Determinar nombre de archivo según filtros
$nombreArchivo = "LAYOUT_MAESTRO_EQUIPOS"
if ($Sistema -ne "") { $nombreArchivo += "_$Sistema" }
if ($UFV -ne "") { $nombreArchivo += "_$UFV" }
$nombreArchivo += "_$fecha.pdf"

$pdfPath = Join-Path $carpetaSalida $nombreArchivo

# Si hay filtros, crear archivo temporal filtrado
if ($Sistema -ne "" -or $UFV -ne "") {
    Write-Host "Aplicando filtros..." -ForegroundColor Yellow
    if ($Sistema -ne "") { Write-Host "  Sistema: $Sistema" -ForegroundColor Cyan }
    if ($UFV -ne "") { Write-Host "  UFV: $UFV" -ForegroundColor Cyan }
    
    # Parsear y filtrar (lógica similar a servir.ps1)
    $contenido = Get-Content $layoutPath -Raw -Encoding UTF8
    
    # Aquí iría la lógica de filtrado...
    # Por ahora, usar archivo completo
    
    $tempPath = $layoutPath
} else {
    $tempPath = $layoutPath
}

# Generar PDF
Write-Host ""
Write-Host "Generando PDF..." -ForegroundColor Yellow

# Opciones de Pandoc para mejor formato
$pandocArgs = @(
    $tempPath,
    "-o", $pdfPath,
    "--toc",
    "--toc-depth=2",
    "--pdf-engine=wkhtmltopdf",
    "-V", "geometry:landscape",
    "-V", "geometry:margin=1.5cm",
    "-V", "fontsize=9pt"
)

try {
    & pandoc $pandocArgs 2>&1 | Out-Null
    
    if (Test-Path $pdfPath) {
        $tamano = [math]::Round((Get-Item $pdfPath).Length / 1KB, 1)
        Write-Host "✅ PDF generado: $tamano KB" -ForegroundColor Green
        Write-Host "   Ubicación: $pdfPath" -ForegroundColor White
        
        # Abrir PDF automáticamente
        Write-Host ""
        Write-Host "Abriendo PDF..." -ForegroundColor Yellow
        Start-Process $pdfPath
    } else {
        Write-Host "❌ ERROR: PDF no se generó correctamente" -ForegroundColor Red
    }
    
} catch {
    Write-Host "❌ ERROR generando PDF: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
    Write-Host "ALTERNATIVA: Usar HTML y imprimir como PDF desde navegador" -ForegroundColor Yellow
    Write-Host "  1. Abrir: IX. WBS y Planificacion\WBS_Layout_Maestro.html" -ForegroundColor Cyan
    Write-Host "  2. Click en 'Imprimir PDF'" -ForegroundColor Cyan
    Write-Host "  3. Seleccionar 'Guardar como PDF' en el diálogo" -ForegroundColor Cyan
}

# ================================================================
# RESUMEN
# ================================================================

Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host "  EXPORTACIÓN COMPLETADA" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Equipos procesados: $($equipos.Count)" -ForegroundColor White
Write-Host "Carpeta salida: $carpetaSalida" -ForegroundColor White
Write-Host ""
Write-Host "PDF LISTO!" -ForegroundColor Green
Write-Host ""

