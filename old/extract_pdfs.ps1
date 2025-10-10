# Script PowerShell para extracción de PDFs
# Proyecto APP La Dorada - Chiriguaná

param(
    [string]$PdfPath = ".",
    [string]$OutputPath = "extracted_contracts"
)

Write-Host "========================================" -ForegroundColor Green
Write-Host "EXTRACTOR DE CONTRATOS PDF" -ForegroundColor Green
Write-Host "Proyecto APP La Dorada - Chiriguaná" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

# Crear directorio de salida
New-Item -ItemType Directory -Force -Path $OutputPath | Out-Null

# Buscar archivos PDF
$pdfFiles = Get-ChildItem -Path $PdfPath -Filter "*.pdf" -Recurse

if ($pdfFiles.Count -eq 0) {
    Write-Host "No se encontraron archivos PDF en: $PdfPath" -ForegroundColor Red
    exit 1
}

Write-Host "Encontrados $($pdfFiles.Count) archivos PDF:" -ForegroundColor Yellow
foreach ($file in $pdfFiles) {
    Write-Host "  - $($file.Name)" -ForegroundColor Cyan
}

# Verificar si Python está disponible
try {
    $pythonVersion = python --version 2>&1
    Write-Host "Python detectado: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Python no está instalado o no está en PATH" -ForegroundColor Red
    Write-Host "Instala Python desde: https://python.org" -ForegroundColor Yellow
    exit 1
}

# Instalar dependencias si es necesario
Write-Host "`nVerificando dependencias..." -ForegroundColor Yellow
$packages = @("PyPDF2", "pdfplumber", "PyMuPDF")
foreach ($package in $packages) {
    try {
        python -c "import $package" 2>$null
        Write-Host "  ✓ $package instalado" -ForegroundColor Green
    } catch {
        Write-Host "  ✗ $package no encontrado, instalando..." -ForegroundColor Yellow
        pip install $package
    }
}

# Procesar cada PDF
foreach ($pdfFile in $pdfFiles) {
    Write-Host "`nProcesando: $($pdfFile.Name)" -ForegroundColor Cyan
    
    $outputFile = Join-Path $OutputPath "$($pdfFile.BaseName).txt"
    
    # Crear script temporal para procesar este PDF
    $tempScript = @"
import PyPDF2
import pdfplumber
import sys

def extract_pdf(pdf_path, output_path):
    try:
        # Método 1: PyPDF2
        with open(pdf_path, 'rb') as file:
            reader = PyPDF2.PdfReader(file)
            text = ""
            for page in reader.pages:
                text += page.extract_text() + "\n"
        
        # Método 2: pdfplumber (más preciso)
        with pdfplumber.open(pdf_path) as pdf:
            pdfplumber_text = ""
            for page in pdf.pages:
                page_text = page.extract_text()
                if page_text:
                    pdfplumber_text += page_text + "\n"
        
        # Usar el mejor resultado
        final_text = pdfplumber_text if len(pdfplumber_text) > len(text) else text
        
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(final_text)
        
        return True
    except Exception as e:
        print(f"Error: {e}")
        return False

if extract_pdf(r"$($pdfFile.FullName)", r"$outputFile"):
    print("✓ Extracción exitosa")
else:
    print("✗ Error en extracción")
"@
    
    $tempScript | Out-File -FilePath "temp_extract.py" -Encoding UTF8
    python temp_extract.py
    Remove-Item "temp_extract.py" -ErrorAction SilentlyContinue
}

Write-Host "`n========================================" -ForegroundColor Green
Write-Host "EXTRACCIÓN COMPLETADA" -ForegroundColor Green
Write-Host "Resultados guardados en: $OutputPath" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

# Mostrar archivos generados
$extractedFiles = Get-ChildItem -Path $OutputPath -Filter "*.txt"
Write-Host "`nArchivos generados:" -ForegroundColor Yellow
foreach ($file in $extractedFiles) {
    $size = [math]::Round($file.Length / 1KB, 2)
    Write-Host "  - $($file.Name) ($size KB)" -ForegroundColor Cyan
}
