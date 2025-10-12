# SCRIPT: Convertir layout.md a JSON
# Fecha: 11 Octubre 2025
# Propósito: Generar JSON para el HTML del layout

Write-Host "Convirtiendo layout.md a JSON..." -ForegroundColor Cyan

$layoutMD = Get-Content "layout.md" -Raw -Encoding UTF8
$equipos = @()

$lineas = $layoutMD -split "`n"

foreach ($linea in $lineas) {
    $celdas = $linea -split '\|' | ForEach-Object { $_.Trim() } | Where-Object { $_ }
    
    if ($celdas.Count -ge 5 -and 
        $linea -notmatch 'UFV.*Tipo.*Equipo' -and 
        $linea -notmatch '^[-|]+$' -and 
        $celdas[0] -ne '') {
        
        $equipos += @{
            ufv = $celdas[0]
            pk = $celdas[1]
            tipo = $celdas[2]
            dispositivo = $celdas[3]
            nombre = $celdas[4]
            descripcion = if ($celdas.Count -gt 5) { $celdas[5] } else { '' }
            ubicacion = if ($celdas.Count -gt 6) { $celdas[6] } else { '' }
        }
    }
}

Write-Host "Total equipos encontrados: $($equipos.Count)" -ForegroundColor Green

$equipos | ConvertTo-Json -Depth 5 | Out-File "IX. WBS y Planificacion/layout_datos.json" -Encoding UTF8

Write-Host "Archivo generado: IX. WBS y Planificacion/layout_datos.json" -ForegroundColor Green

