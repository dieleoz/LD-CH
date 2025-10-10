# Script simple para convertir documentos ejecutivos
Write-Host "🔄 Convirtiendo documentos ejecutivos..." -ForegroundColor Green

# Crear directorio de salida
$outputDir = "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS\Salida"
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force
}

# Convertir un documento de prueba
$archivo = "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS\SISTEMA_02_Telecomunicaciones_EJECUTIVO.md"

if (Test-Path $archivo) {
    Write-Host "✅ Convirtiendo: SISTEMA_02_Telecomunicaciones_EJECUTIVO.md" -ForegroundColor Yellow
    
    # Convertir a HTML
    $htmlOutput = "$outputDir\SISTEMA_02_Telecomunicaciones_EJECUTIVO.html"
    pandoc $archivo -o $htmlOutput --standalone --css=<(echo "body{font-family:Arial,sans-serif;max-width:800px;margin:0 auto;padding:20px;}")
    
    # Convertir a Word
    $wordOutput = "$outputDir\SISTEMA_02_Telecomunicaciones_EJECUTIVO.docx"
    pandoc $archivo -o $wordOutput
    
    Write-Host "✅ HTML generado: $htmlOutput" -ForegroundColor Green
    Write-Host "✅ Word generado: $wordOutput" -ForegroundColor Green
    
    # Abrir los archivos generados
    Start-Process $htmlOutput
    Start-Process $wordOutput
} else {
    Write-Host "❌ Archivo no encontrado: $archivo" -ForegroundColor Red
}

Write-Host "✅ Conversión completada!" -ForegroundColor Green
