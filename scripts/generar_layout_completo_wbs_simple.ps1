# Script simple para generar layout completo
Write-Host "Generando layout completo..." -ForegroundColor Green

$dir = 'IX. WBS y Planificacion'

# Leer archivos
Write-Host "Leyendo archivos..." -ForegroundColor Cyan
$wbsData = Get-Content "$dir\datos_wbs_TODOS_items.json" | ConvertFrom-Json
$coordenadasKML = Get-Content "$dir\coordenadas_kml.json" | ConvertFrom-Json  
$layoutActual = Get-Content "$dir\layout_datos.json" | ConvertFrom-Json

Write-Host "Layout actual: $($layoutActual.Count) elementos"
Write-Host "Coordenadas KML: $($coordenadasKML.Count) puntos"

# Generar nuevos equipos
$nuevosEquipos = @()
foreach ($item in $wbsData.items) {
    if ($item.cantidad -and $item.tipo -eq 'SUMINISTRO') {
        $tipoEquipo = switch ($item.categoria) {
            'control' { 'CONTROL' }
            'telecomunicaciones' { 'TELECOMUNICACIONES' }
            'seguridad' { 'SEGURIDAD' }
            'energia' { 'ENERGIA' }
            'pasos_nivel' { 'PASOS_NIVEL' }
            'via' { 'VIA' }
            'edificacion' { 'EDIFICACION' }
            default { 'OTROS' }
        }
        
        $pkBase = switch ($item.capitulo) {
            '1' { 300 }
            '2' { 400 }
            '3' { 500 }
            '4' { 550 }
            '5' { 441 }
            default { 350 }
        }
        
        $pk = "$pkBase+000"
        
        # Buscar coordenadas
        if ($pk -match '(\d+)\+') {
            $pkNum = [int]$matches[1]
            $coord = $coordenadasKML | Where-Object { $_.PK -eq $pkNum }
            
            if ($coord) {
                $equipo = @{
                    pk = $pk
                    nombre = $item.codigo
                    ubicacion_lado = 'Centro'
                    dispositivo = $item.descripcion
                    implementacion = '2.1'
                    descripcion = "Item WBS: $($item.codigo)"
                    tipo_equipo = $tipoEquipo
                    direccion = "PK$pk Centro"
                    latitud = $coord.latitud
                    longitud = $coord.longitud
                }
                $nuevosEquipos += $equipo
            }
        }
    }
}

Write-Host "Nuevos equipos: $($nuevosEquipos.Count)" -ForegroundColor Yellow

# Combinar
$layoutCompleto = $layoutActual + $nuevosEquipos
Write-Host "Total: $($layoutCompleto.Count) elementos" -ForegroundColor Green

# Guardar
$outputJson = "$dir\layout_datos_completo.json"
$layoutCompleto | ConvertTo-Json -Depth 10 | Set-Content $outputJson -Encoding UTF8
Write-Host "Guardado: $outputJson" -ForegroundColor Green

$jsonString = $layoutCompleto | ConvertTo-Json -Depth 10 -Compress
$jsContent = "const LAYOUT_DATOS = $jsonString;"
$outputJs = "$dir\layout_datos_completo.js"
$jsContent | Set-Content $outputJs -Encoding UTF8
Write-Host "Guardado: $outputJs" -ForegroundColor Green

Write-Host "`nCompletado!" -ForegroundColor Green

