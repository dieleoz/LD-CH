# ================================================================
#  SCRIPT: Exportar Layout Maestro a Excel
# ================================================================
#
# PROPÓSITO:
#   Exporta LAYOUT_MAESTRO_EQUIPOS_v1.0.md a un archivo Excel (.xlsx)
#   con múltiples pestañas filtradas por sistema
#
# USO:
#   .\scripts\exportar_layout_excel.ps1
#   .\scripts\exportar_layout_excel.ps1 -ConExcel    # Requiere Excel instalado
#
# SALIDA:
#   X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS\
#     └── LAYOUT_MAESTRO_EQUIPOS_[FECHA].xlsx (si -ConExcel)
#     └── LAYOUT_MAESTRO_EQUIPOS_[FECHA].csv (por defecto)
#

param(
    [switch]$ConExcel = $false
)

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  EXPORTAR LAYOUT MAESTRO A EXCEL" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$layoutPath = "VIII. Documentos Maestros y Metodologia\LAYOUT_MAESTRO_EQUIPOS_v1.0.md"
$carpetaSalida = "X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS"
$fecha = Get-Date -Format "yyyy-MM-dd"

# Crear carpeta si no existe
if (-not (Test-Path $carpetaSalida)) {
    New-Item -Path $carpetaSalida -ItemType Directory -Force | Out-Null
}

# ================================================================
# FUNCIÓN: Parsear Layout Markdown
# ================================================================

function Parse-LayoutMarkdown {
    param([string]$FilePath)
    
    Write-Host "Leyendo layout maestro..." -ForegroundColor Yellow
    
    if (-not (Test-Path $FilePath)) {
        Write-Host "❌ ERROR: Archivo no encontrado: $FilePath" -ForegroundColor Red
        return @()
    }
    
    $contenido = Get-Content $FilePath -Raw -Encoding UTF8
    
    # Buscar tabla maestra
    $patron = '(?s)## 📍 TABLA MAESTRA - EQUIPOS POR PK.*?\n\n(\|.+?\|.+?\n\|[-:]+.*?\n)((?:\|.+?\n)+)'
    
    if ($contenido -match $patron) {
        $headerLine = $matches[1]
        $dataLines = $matches[2]
        
        # Extraer headers
        $headers = ($headerLine -split '\n')[0] -replace '^\||\|$', '' -split '\|' | ForEach-Object { $_.Trim() }
        
        Write-Host "Columnas encontradas: $($headers.Count)" -ForegroundColor Green
        Write-Host "  $($headers -join ', ')" -ForegroundColor Gray
        
        # Parsear filas
        $equipos = @()
        $rowLines = $dataLines -split '\n' | Where-Object { $_ -match '^\|' -and $_ -notmatch '^[\|\s\-:]+$' }
        
        foreach ($rowLine in $rowLines) {
            if (-not $rowLine) { continue }
            
            $valores = $rowLine -replace '^\||\|$', '' -split '\|' | ForEach-Object { $_.Trim() }
            
            if ($valores.Count -eq $headers.Count) {
                $obj = New-Object PSObject
                for ($i = 0; $i -lt $headers.Count; $i++) {
                    $obj | Add-Member -MemberType NoteProperty -Name $headers[$i] -Value $valores[$i]
                }
                $equipos += $obj
            }
        }
        
        Write-Host "Equipos parseados: $($equipos.Count)" -ForegroundColor Green
        return $equipos
    }
    else {
        Write-Host "❌ ERROR: No se pudo encontrar la tabla en el archivo" -ForegroundColor Red
        return @()
    }
}

# ================================================================
# OPCIÓN 1: Exportar como CSV (siempre funciona)
# ================================================================

Write-Host "Parseando layout..." -ForegroundColor Yellow
$equipos = Parse-LayoutMarkdown -FilePath $layoutPath

if ($equipos.Count -eq 0) {
    Write-Host "❌ No se pudieron cargar los equipos. Abortando." -ForegroundColor Red
    exit 1
}

$csvPath = Join-Path $carpetaSalida "LAYOUT_MAESTRO_EQUIPOS_$fecha.csv"

Write-Host "Exportando a CSV..." -ForegroundColor Yellow
$equipos | Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8

if (Test-Path $csvPath) {
    $tamano = [math]::Round((Get-Item $csvPath).Length / 1KB, 1)
    Write-Host "✅ CSV generado: $tamano KB" -ForegroundColor Green
    Write-Host "   Ubicación: $csvPath" -ForegroundColor White
}

# ================================================================
# OPCIÓN 2: Exportar como Excel .xlsx (si tiene Excel)
# ================================================================

if ($ConExcel) {
    Write-Host ""
    Write-Host "Generando Excel con pestañas..." -ForegroundColor Yellow
    
    try {
        $excel = New-Object -ComObject Excel.Application
        $excel.Visible = $false
        $excel.DisplayAlerts = $false
        
        $workbook = $excel.Workbooks.Add()
        
        # Hoja 1: MASTER (todos los equipos)
        Write-Host "  Creando hoja: MASTER_LAYOUT..." -ForegroundColor Cyan
        $worksheet1 = $workbook.Worksheets.Item(1)
        $worksheet1.Name = "MASTER_LAYOUT"
        
        # Headers
        $headers = $equipos[0].PSObject.Properties.Name
        for ($i = 0; $i -lt $headers.Count; $i++) {
            $worksheet1.Cells.Item(1, $i + 1) = $headers[$i]
            $worksheet1.Cells.Item(1, $i + 1).Font.Bold = $true
            $worksheet1.Cells.Item(1, $i + 1).Interior.Color = 49407  # Azul
            $worksheet1.Cells.Item(1, $i + 1).Font.Color = 16777215  # Blanco
        }
        
        # Datos
        $fila = 2
        foreach ($equipo in $equipos) {
            for ($i = 0; $i -lt $headers.Count; $i++) {
                $worksheet1.Cells.Item($fila, $i + 1) = $equipo.($headers[$i])
            }
            $fila++
        }
        
        $worksheet1.UsedRange.Columns.AutoFit() | Out-Null
        
        # Hojas adicionales por tipo de equipo
        $tipos = $equipos | Group-Object -Property 'Tipo_Equipo'
        
        foreach ($tipo in $tipos) {
            $nombreHoja = $tipo.Name -replace '[\\\/\[\]\*\?\:]', '_'
            if ($nombreHoja.Length > 31) { $nombreHoja = $nombreHoja.Substring(0, 31) }
            
            Write-Host "  Creando hoja: $nombreHoja ($($ tipo.Count) equipos)..." -ForegroundColor Cyan
            
            $worksheet = $workbook.Worksheets.Add()
            $worksheet.Name = $nombreHoja
            
            # Headers
            for ($i = 0; $i -lt $headers.Count; $i++) {
                $worksheet.Cells.Item(1, $i + 1) = $headers[$i]
                $worksheet.Cells.Item(1, $i + 1).Font.Bold = $true
                $worksheet.Cells.Item(1, $i + 1).Interior.Color = 5296274  # Verde
                $worksheet.Cells.Item(1, $i + 1).Font.Color = 16777215
            }
            
            # Datos filtrados
            $fila = 2
            foreach ($equipo in $tipo.Group) {
                for ($i = 0; $i -lt $headers.Count; $i++) {
                    $worksheet.Cells.Item($fila, $i + 1) = $equipo.($headers[$i])
                }
                $fila++
            }
            
            $worksheet.UsedRange.Columns.AutoFit() | Out-Null
        }
        
        # Guardar Excel
        $excelPath = Join-Path $carpetaSalida "LAYOUT_MAESTRO_EQUIPOS_$fecha.xlsx"
        $workbook.SaveAs($excelPath)
        $workbook.Close()
        $excel.Quit()
        
        [System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
        [System.GC]::Collect()
        [System.GC]::WaitForPendingFinalizers()
        
        if (Test-Path $excelPath) {
            $tamano = [math]::Round((Get-Item $excelPath).Length / 1KB, 1)
            Write-Host "✅ Excel generado: $tamano KB" -ForegroundColor Green
            Write-Host "   Ubicación: $excelPath" -ForegroundColor White
            Write-Host "   Pestañas: MASTER + $($tipos.Count) tipos de equipo" -ForegroundColor White
        }
        
    } catch {
        Write-Host "❌ ERROR generando Excel: $($_.Exception.Message)" -ForegroundColor Red
        Write-Host "   Asegúrate de tener Excel instalado o usa solo CSV" -ForegroundColor Yellow
    }
}

# ================================================================
# RESUMEN
# ================================================================

Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host "  LAYOUT EXPORTADO" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Equipos exportados: $($equipos.Count)" -ForegroundColor White
Write-Host "Ubicación: $carpetaSalida" -ForegroundColor White
Write-Host ""

if ($ConExcel) {
    Write-Host "ARCHIVOS GENERADOS:" -ForegroundColor Cyan
    Write-Host "  CSV: LAYOUT_MAESTRO_EQUIPOS_$fecha.csv" -ForegroundColor White
    Write-Host "  Excel: LAYOUT_MAESTRO_EQUIPOS_$fecha.xlsx" -ForegroundColor White
    Write-Host ""
    Write-Host "ABRIR EXCEL:" -ForegroundColor Magenta
    Write-Host "  start `"$carpetaSalida\LAYOUT_MAESTRO_EQUIPOS_$fecha.xlsx`"" -ForegroundColor Yellow
} else {
    Write-Host "ARCHIVO GENERADO:" -ForegroundColor Cyan
    Write-Host "  CSV: LAYOUT_MAESTRO_EQUIPOS_$fecha.csv" -ForegroundColor White
    Write-Host ""
    Write-Host "ABRIR EN EXCEL:" -ForegroundColor Magenta
    Write-Host "  start `"$csvPath`"" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "💡 TIP: Usa -ConExcel para generar .xlsx con pestañas" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "LAYOUT LISTO PARA USAR!" -ForegroundColor Green
Write-Host ""

