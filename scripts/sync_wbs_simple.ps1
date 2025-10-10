# Script simple para sincronizar WBS desde Excel
# Lee el Excel "Costo proyecto.xlsx" y actualiza los archivos JSON/JS

Write-Host "`n==================================================================" -ForegroundColor Cyan
Write-Host "  SINCRONIZACION AUTOMATICA DESDE EXCEL" -ForegroundColor Cyan
Write-Host "==================================================================" -ForegroundColor Cyan

$excelPath = "X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS\Costo proyecto.xlsx"

if (-not (Test-Path $excelPath)) {
    Write-Host "`nERROR: No se encontro el archivo Excel" -ForegroundColor Red
    Write-Host "Ruta: $excelPath" -ForegroundColor Yellow
    exit 1
}

Write-Host "`nExcel encontrado: $excelPath" -ForegroundColor Green

# Verificar e instalar módulo ImportExcel si es necesario
if (-not (Get-Module -ListAvailable -Name ImportExcel)) {
    Write-Host "`nInstalando modulo ImportExcel..." -ForegroundColor Yellow
    try {
        Install-Module -Name ImportExcel -Force -Scope CurrentUser -AllowClobber
        Write-Host "Modulo instalado correctamente" -ForegroundColor Green
    } catch {
        Write-Host "ERROR: No se pudo instalar ImportExcel" -ForegroundColor Red
        Write-Host "Ejecuta: Install-Module ImportExcel -Scope CurrentUser" -ForegroundColor Yellow
        exit 1
    }
}

Import-Module ImportExcel

Write-Host "`nLeyendo datos del Excel..." -ForegroundColor Yellow

try {
    # Intentar leer diferentes hojas posibles
    $worksheets = Get-ExcelSheetInfo -Path $excelPath
    Write-Host "Hojas encontradas en el Excel:" -ForegroundColor Cyan
    $worksheets | ForEach-Object { Write-Host "  - $($_.Name)" -ForegroundColor White }
    
    # Intentar leer la primera hoja
    $sheetName = $worksheets[0].Name
    Write-Host "`nLeyendo hoja: $sheetName" -ForegroundColor Yellow
    
    $excelData = Import-Excel -Path $excelPath -WorksheetName $sheetName
    
    Write-Host "Filas leidas: $($excelData.Count)" -ForegroundColor Green
    
    # Mostrar las primeras 5 filas para entender la estructura
    Write-Host "`nEstructura del Excel (primeras 3 filas):" -ForegroundColor Cyan
    $excelData | Select-Object -First 3 | Format-Table | Out-String | Write-Host
    
} catch {
    Write-Host "ERROR al leer Excel: $_" -ForegroundColor Red
    exit 1
}

Write-Host "`nPara continuar la sincronizacion, necesito saber:" -ForegroundColor Yellow
Write-Host "1. Que columnas contienen: Item, Descripcion, Tipo, VU, Total" -ForegroundColor White
Write-Host "2. En que fila empiezan los datos (despues del header)" -ForegroundColor White
Write-Host "`nPor favor revisa la estructura mostrada arriba y ajusta el script." -ForegroundColor Yellow

