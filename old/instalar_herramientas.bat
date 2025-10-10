@echo off
echo ========================================
echo INSTALACIÓN DE HERRAMIENTAS PDF
echo Proyecto APP La Dorada - Chiriguaná
echo ========================================

echo.
echo 1. Instalando Python...
echo Descarga Python desde: https://python.org/downloads/
echo Marca la opción "Add Python to PATH" durante la instalación
echo.
pause

echo.
echo 2. Instalando dependencias de Python...
pip install PyPDF2 pdfplumber PyMuPDF pytesseract opencv-python pillow

echo.
echo 3. Instalando Tesseract OCR...
echo Descarga desde: https://github.com/UB-Mannheim/tesseract/wiki
echo Instala en: C:\Program Files\Tesseract-OCR\
echo.
pause

echo.
echo 4. Verificando instalación...
python --version
pip list | findstr PyPDF2
pip list | findstr pdfplumber

echo.
echo ========================================
echo INSTALACIÓN COMPLETADA
echo ========================================
echo Ahora puedes ejecutar: batch_convert_pdfs.bat
echo.
pause
