# SCRIPT: Convertir layout.md a JavaScript
# Fecha: 11 Octubre 2025
# Propósito: Generar archivo JS (sin problemas CORS)

Write-Host "Convirtiendo layout.md a JavaScript..." -ForegroundColor Cyan

$layoutMD = Get-Content "layout.md" -Raw -Encoding UTF8
$equipos = @()

$lineas = $layoutMD -split "`n"

$lineNumber = 0
foreach ($linea in $lineas) {
    $lineNumber++
    
    # Mostrar progreso cada 500 líneas
    if ($lineNumber % 500 -eq 0) {
        Write-Host "  Procesando línea $lineNumber..." -ForegroundColor Gray
    }
    
    # Saltar líneas vacías, headers y separadores
    if ($linea -match '^[\s]*$' -or 
        $linea -match 'UFImplementacionNombre' -or
        $linea -match 'LAYOUT GENERAL' -or
        $linea -match 'CONTROL DE VERSIONES' -or
        $linea -match 'INSTITUCIONES EDUCATIVAS' -or
        $linea -match '^[-|:\s]+$' -or
        $linea -match '^#') {
        continue
    }
    
    # Detectar si usa tabs o pipes
    $separador = if ($linea -match '\t') { '\t' } else { '\|' }
    $celdas = $linea -split $separador | ForEach-Object { $_.Trim() } | Where-Object { $_ }
    
    # Validar que tenga al menos 8 columnas y que sea un equipo válido
    if ($celdas.Count -ge 8 -and $celdas[0] -match '^UFV' -and $celdas[2] -and $celdas[2] -ne 'Nombre') {
        
        # Debug: mostrar primera caja encontrada
        if ($celdas[2] -match 'EMPALME_FO_0001') {
            Write-Host "  ✅ Encontrada caja EMPALME_FO_0001 en línea $lineNumber" -ForegroundColor Green
        }
        
        $equipos += @{
            ufv = $celdas[0]
            implementacion = if ($celdas.Count -gt 1) { $celdas[1] } else { '' }
            nombre = if ($celdas.Count -gt 2) { $celdas[2] } else { '' }
            pk = if ($celdas.Count -gt 3) { $celdas[3] } else { '' }
            descripcion = if ($celdas.Count -gt 4) { $celdas[4] } else { '' }
            ubicacion_lado = if ($celdas.Count -gt 5) { $celdas[5] } else { '' }
            direccion = if ($celdas.Count -gt 6) { $celdas[6] } else { '' }
            tipo_equipo = if ($celdas.Count -gt 7) { $celdas[7] } else { '' }
            dispositivo = if ($celdas.Count -gt 8) { $celdas[8] } else { '' }
        }
    }
}

Write-Host "Total equipos encontrados: $($equipos.Count)" -ForegroundColor Green

# Verificar si EMPALME_FO_0001 está en el array
$cajaTest = $equipos | Where-Object { $_.nombre -eq 'EMPALME_FO_0001' }
if ($cajaTest) {
    Write-Host "  ✅ Verificado: EMPALME_FO_0001 está en el array" -ForegroundColor Green
} else {
    Write-Host "  ❌ ERROR: EMPALME_FO_0001 NO está en el array" -ForegroundColor Red
}

# Generar archivo JavaScript
Write-Host ""
Write-Host "Convirtiendo a JSON..." -ForegroundColor Yellow
$jsonData = $equipos | ConvertTo-Json -Depth 5 -Compress
Write-Host "  JSON generado: $($jsonData.Length) caracteres" -ForegroundColor Gray

# Verificar si EMPALME_FO_0001 está en el JSON
if ($jsonData -match 'EMPALME_FO_0001') {
    Write-Host "  ✅ Verificado: EMPALME_FO_0001 está en el JSON" -ForegroundColor Green
} else {
    Write-Host "  ❌ ERROR: EMPALME_FO_0001 NO está en el JSON" -ForegroundColor Red
}

$jsContent = "// Datos del Layout - Generado automaticamente`nconst LAYOUT_DATOS = $jsonData;"

$jsContent | Out-File "IX. WBS y Planificacion/layout_datos.js" -Encoding UTF8

Write-Host ""
Write-Host "Archivo generado: IX. WBS y Planificacion/layout_datos.js" -ForegroundColor Green
Write-Host "Total elementos: $($equipos.Count)" -ForegroundColor Cyan

