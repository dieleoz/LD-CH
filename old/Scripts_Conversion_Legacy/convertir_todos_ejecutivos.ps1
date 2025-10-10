# Script para convertir todos los documentos ejecutivos a Word y HTML
Write-Host "🚀 CONVIRTIENDO TODOS LOS DOCUMENTOS EJECUTIVOS" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green

# Crear directorio de salida
$outputDir = "Documentos_Ejecutivos_Convertidos"
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force
    Write-Host "✅ Directorio creado: $outputDir" -ForegroundColor Green
}

# Lista de documentos ejecutivos
$documentos = @(
    "SISTEMA_01_Control_y_Senalizacion_EJECUTIVO.md",
    "SISTEMA_02_Telecomunicaciones_EJECUTIVO.md", 
    "SISTEMA_03_ITS_y_Seguridad_EJECUTIVO.md",
    "SISTEMA_04_Material_Rodante_EJECUTIVO.md",
    "SISTEMA_05_Infraestructura_Operativa_EJECUTIVO.md",
    "SISTEMA_06_Integracion_y_Coordinacion_EJECUTIVO.md",
    "ESPECIALIDAD_01_Ingenieria_Civil_EJECUTIVO.md",
    "ESPECIALIDAD_02_Ingenieria_Electrica_EJECUTIVO.md",
    "ESPECIALIDAD_03_Ingenieria_Mecanica_EJECUTIVO.md",
    "ESPECIALIDAD_04_Ingenieria_Sistemas_EJECUTIVO.md",
    "ESPECIALIDAD_05_Ingenieria_Ambiental_EJECUTIVO.md",
    "GESTION_EJECUTIVO_Alcance_y_Objetivos.md",
    "GESTION_EJECUTIVO_Cronograma_y_Recursos.md"
)

$exitosos = 0
$fallidos = 0

Write-Host "📋 Procesando $($documentos.Count) documentos..." -ForegroundColor Yellow
Write-Host ""

foreach ($documento in $documentos) {
    $archivoOrigen = "X_ENTREGABLES_CONSOLIDADOS/7_SISTEMAS_EJECUTIVOS/$documento"
    $nombreBase = [System.IO.Path]::GetFileNameWithoutExtension($documento)
    
    Write-Host "🔄 Procesando: $documento" -ForegroundColor Cyan
    
    if (Test-Path $archivoOrigen) {
        try {
            # Convertir a Word
            $wordOutput = "$outputDir/$nombreBase.docx"
            pandoc $archivoOrigen -o $wordOutput
            
            # Convertir a HTML
            $htmlOutput = "$outputDir/$nombreBase.html"
            pandoc $archivoOrigen -o $htmlOutput --standalone
            
            Write-Host "   ✅ Word: $nombreBase.docx" -ForegroundColor Green
            Write-Host "   ✅ HTML: $nombreBase.html" -ForegroundColor Green
            $exitosos++
            
        } catch {
            Write-Host "   ❌ Error: $($_.Exception.Message)" -ForegroundColor Red
            $fallidos++
        }
    } else {
        Write-Host "   ❌ Archivo no encontrado" -ForegroundColor Red
        $fallidos++
    }
    Write-Host ""
}

# Resumen final
Write-Host "📊 RESUMEN DE CONVERSIÓN:" -ForegroundColor Green
Write-Host "=========================" -ForegroundColor Green
Write-Host "✅ Documentos procesados exitosamente: $exitosos" -ForegroundColor Green
Write-Host "❌ Documentos con errores: $fallidos" -ForegroundColor Red
Write-Host "📁 Archivos guardados en: $outputDir" -ForegroundColor Cyan

if ($exitosos -gt 0) {
    Write-Host ""
    Write-Host "🎉 ¡CONVERSIÓN COMPLETADA!" -ForegroundColor Green
    Write-Host "📂 Revisa la carpeta: $outputDir" -ForegroundColor Cyan
    
    # Abrir la carpeta de resultados
    Start-Process $outputDir
}

Write-Host ""
Write-Host "Presiona Enter para continuar..." -ForegroundColor White
Read-Host

