@echo off
REM Script para conversión masiva de PDFs a texto
REM Proyecto APP La Dorada - Chiriguaná

echo ========================================
echo CONVERSOR MASIVO DE CONTRATOS PDF
echo Proyecto APP La Dorada - Chiriguaná
echo ========================================

REM Crear directorio de salida
mkdir extracted_contracts 2>nul

REM Verificar si Python está instalado
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python no está instalado
    echo Por favor instala Python desde https://python.org
    pause
    exit /b 1
)

REM Instalar dependencias si es necesario
echo Instalando dependencias de Python...
pip install PyPDF2 pdfplumber PyMuPDF

REM Ejecutar script de extracción
echo.
echo Ejecutando extracción de contratos...
python extract_contracts.py

REM Verificar resultados
if exist "extracted_contracts" (
    echo.
    echo ========================================
    echo EXTRACCIÓN COMPLETADA EXITOSAMENTE
    echo ========================================
    echo Resultados guardados en: extracted_contracts\
    echo.
    dir extracted_contracts
) else (
    echo ERROR: No se pudieron extraer los contratos
)

pause
