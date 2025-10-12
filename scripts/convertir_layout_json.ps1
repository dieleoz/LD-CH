# ================================================================
#  SCRIPT: Convertir Layout Maestro a JSON
# ================================================================

Write-Host "Convirtiendo Layout a JSON..." -ForegroundColor Cyan

$layoutPath = "VIII. Documentos Maestros y Metodologia\LAYOUT_MAESTRO_EQUIPOS_v1.0.md"
$jsonOutput = "IX. WBS y Planificacion\layout_data.json"

# Leer archivo
$contenido = Get-Content $layoutPath -Raw -Encoding UTF8

# Buscar tabla
$lineas = $contenido -split '\n'
$enTabla = $false
$headers = @()
$equipos = @()

foreach ($linea in $lineas) {
    # Detectar inicio de tabla
    if ($linea -match '## 📍 TABLA MAESTRA') {
        $enTabla = $true
        continue
    }
    
    # Si estamos en tabla y es fila de datos
    if ($enTabla -and $linea -match '^\|' -and $linea -notmatch '^[\|\s\-:]+$') {
        $columnas = ($linea -replace '^\||\|$', '' -split '\|') | ForEach-Object { $_.Trim() }
        
        if ($headers.Count -eq 0) {
            $headers = $columnas
            Write-Host "Headers: $($headers.Count) columnas" -ForegroundColor Green
        }
        elseif ($columnas.Count -eq $headers.Count) {
            $obj = @{}
            for ($i = 0; $i -lt $headers.Count; $i++) {
                $obj[$headers[$i]] = $columnas[$i]
            }
            $equipos += $obj
        }
    }
    
    # Salir si encontramos fin de tabla
    if ($enTabla -and $equipos.Count -gt 0 -and ($linea.Trim() -eq '' -or $linea -match '^##' -and $linea -notmatch 'TABLA MAESTRA')) {
        break
    }
}

Write-Host "Equipos encontrados: $($equipos.Count)" -ForegroundColor Green

# Convertir a JSON
$json = $equipos | ConvertTo-Json -Depth 5

# Guardar
$json | Out-File $jsonOutput -Encoding UTF8 -Force

Write-Host "JSON guardado: $jsonOutput" -ForegroundColor Green
Write-Host "Tamaño: $([math]::Round((Get-Item $jsonOutput).Length / 1KB, 1)) KB" -ForegroundColor White
Write-Host ""
Write-Host "LISTO! Ahora refresca WBS_Layout_Maestro.html" -ForegroundColor Green

