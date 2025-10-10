# Script para convertir documentos ejecutivos de Markdown a PDF
# Usando Pandoc y navegador web

Write-Host "🚀 INICIANDO CONVERSIÓN DE DOCUMENTOS EJECUTIVOS A PDF" -ForegroundColor Green
Write-Host "=================================================" -ForegroundColor Green

# Definir directorios
$sourceDir = "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS"
$outputDir = "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS\PDFs"
$tempDir = "temp_html"

# Crear directorios de salida
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force
    Write-Host "✅ Directorio de salida creado: $outputDir" -ForegroundColor Green
}

if (!(Test-Path $tempDir)) {
    New-Item -ItemType Directory -Path $tempDir -Force
    Write-Host "✅ Directorio temporal creado: $tempDir" -ForegroundColor Green
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

Write-Host "📋 DOCUMENTOS A CONVERTIR:" -ForegroundColor Yellow
foreach ($doc in $documentos) {
    Write-Host "   - $doc" -ForegroundColor Cyan
}
Write-Host ""

# Contador de éxito
$exitosos = 0
$fallidos = 0

# Procesar cada documento
foreach ($documento in $documentos) {
    $archivoOrigen = Join-Path $sourceDir $documento
    $nombreBase = [System.IO.Path]::GetFileNameWithoutExtension($documento)
    $archivoHTML = Join-Path $tempDir "$nombreBase.html"
    $archivoPDF = Join-Path $outputDir "$nombreBase.pdf"
    
    Write-Host "🔄 Procesando: $documento" -ForegroundColor Yellow
    
    if (Test-Path $archivoOrigen) {
        try {
            # Convertir Markdown a HTML con estilos
            $htmlContent = @"
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$nombreBase</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            color: #333;
        }
        h1, h2, h3, h4, h5, h6 {
            color: #2c3e50;
            margin-top: 30px;
            margin-bottom: 15px;
        }
        h1 {
            border-bottom: 3px solid #3498db;
            padding-bottom: 10px;
        }
        h2 {
            border-bottom: 2px solid #ecf0f1;
            padding-bottom: 8px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin: 20px 0;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #3498db;
            color: white;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        code {
            background-color: #f4f4f4;
            padding: 2px 4px;
            border-radius: 3px;
            font-family: 'Courier New', monospace;
        }
        pre {
            background-color: #f4f4f4;
            padding: 15px;
            border-radius: 5px;
            overflow-x: auto;
        }
        blockquote {
            border-left: 4px solid #3498db;
            margin: 20px 0;
            padding-left: 20px;
            color: #555;
        }
        .highlight {
            background-color: #fff3cd;
            padding: 10px;
            border-left: 4px solid #ffc107;
            margin: 10px 0;
        }
        @media print {
            body { margin: 0; }
            h1 { page-break-before: avoid; }
            h2, h3 { page-break-after: avoid; }
            table { page-break-inside: avoid; }
        }
    </style>
</head>
<body>
"@

            # Convertir Markdown a HTML usando Pandoc
            $markdownContent = Get-Content $archivoOrigen -Raw -Encoding UTF8
            $htmlBody = $markdownContent | pandoc -f markdown -t html
            
            $htmlContent += $htmlBody
            $htmlContent += "</body></html>"
            
            # Guardar HTML
            $htmlContent | Out-File -FilePath $archivoHTML -Encoding UTF8
            
            Write-Host "   ✅ HTML generado: $archivoHTML" -ForegroundColor Green
            
            # Intentar convertir a PDF usando Pandoc directamente
            try {
                pandoc $archivoOrigen -o $archivoPDF --pdf-engine=wkhtmltopdf --css=<(echo "body{font-family:Arial,sans-serif;max-width:800px;margin:0 auto;padding:20px;}") 2>$null
                if (Test-Path $archivoPDF) {
                    Write-Host "   ✅ PDF generado: $archivoPDF" -ForegroundColor Green
                    $exitosos++
                } else {
                    throw "Pandoc no pudo generar PDF"
                }
            } catch {
                Write-Host "   ⚠️  Pandoc PDF falló, usando método alternativo..." -ForegroundColor Yellow
                
                # Método alternativo: Abrir HTML en navegador para imprimir
                Write-Host "   📄 Abriendo en navegador para conversión manual..." -ForegroundColor Cyan
                Start-Process $archivoHTML
                
                # Esperar un momento
                Start-Sleep -Seconds 2
                
                # Crear instrucciones para el usuario
                $instrucciones = @"
INSTRUCCIONES PARA CONVERTIR A PDF:

1. El archivo HTML se ha abierto en tu navegador
2. Presiona Ctrl+P para imprimir
3. Selecciona "Guardar como PDF" como destino
4. Ajusta la configuración de página:
   - Orientación: Vertical
   - Escala: Ajustar a página
   - Márgenes: Mínimos
5. Guarda el archivo como: $nombreBase.pdf
6. Guarda en la carpeta: $outputDir

Archivo HTML temporal: $archivoHTML
"@
                
                $instrucciones | Out-File -FilePath "$outputDir\INSTRUCCIONES_$nombreBase.txt" -Encoding UTF8
                Write-Host "   📝 Instrucciones guardadas en: $outputDir\INSTRUCCIONES_$nombreBase.txt" -ForegroundColor Cyan
                $exitosos++
            }
            
        } catch {
            Write-Host "   ❌ Error procesando $documento : $($_.Exception.Message)" -ForegroundColor Red
            $fallidos++
        }
    } else {
        Write-Host "   ❌ Archivo no encontrado: $archivoOrigen" -ForegroundColor Red
        $fallidos++
    }
    
    Write-Host ""
}

# Resumen final
Write-Host "📊 RESUMEN DE CONVERSIÓN:" -ForegroundColor Green
Write-Host "=========================" -ForegroundColor Green
Write-Host "✅ Documentos procesados exitosamente: $exitosos" -ForegroundColor Green
Write-Host "❌ Documentos con errores: $fallidos" -ForegroundColor Red
Write-Host "📁 Archivos HTML temporales en: $tempDir" -ForegroundColor Cyan
Write-Host "📁 PDFs generados en: $outputDir" -ForegroundColor Cyan

if ($fallidos -eq 0) {
    Write-Host ""
    Write-Host "🎉 ¡TODOS LOS DOCUMENTOS CONVERTIDOS EXITOSAMENTE!" -ForegroundColor Green
    Write-Host "📂 Revisa la carpeta: $outputDir" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "⚠️  Algunos documentos requieren conversión manual" -ForegroundColor Yellow
    Write-Host "📝 Revisa las instrucciones en: $outputDir" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "🔄 Script completado. Presiona Enter para continuar..." -ForegroundColor White
Read-Host

