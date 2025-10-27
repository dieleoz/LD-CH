# Script para generar layout completo incluyendo TODOS los equipos de la WBS
# PANs, Generadores, ODF, Subestaciones, Señales, etc.

Write-Host "Generando layout completo con todos los equipos de la WBS..." -ForegroundColor Green

# Definir directorio
$dirWBS = 'IX. WBS y Planificacion'

# Leer datos WBS
$wbsPath = Join-Path $dirWBS "datos_wbs_TODOS_items.json"
$wbsData = Get-Content $wbsPath | ConvertFrom-Json

# Leer coordenadas KML
$coordenadasKMLPath = Join-Path $dirWBS "coordenadas_kml.json"
$coordenadasKML = Get-Content $coordenadasKMLPath | ConvertFrom-Json

# Leer layout actual para mantener datos existentes
$layoutPath = Join-Path $dirWBS "layout_datos.json"
$layoutActual = Get-Content $layoutPath | ConvertFrom-Json

Write-Host "✓ Layout actual: $($layoutActual.Count) elementos" -ForegroundColor Cyan
Write-Host "✓ Coordenadas KML: $($coordenadasKML.Count) puntos" -ForegroundColor Cyan

# Función para obtener coordenadas por PK
function Get-CoordenadasPorPK {
    param([string]$pk)
    
    # Extraer número del PK (ej: "338+250" -> 338)
    if ($pk -match '(\d+)\+') {
        $pkNum = [int]$matches[1]
        $coordenada = $coordenadasKML | Where-Object { $_.PK -eq $pkNum }
        
        if ($coordenada) {
            return @{
                latitud = $coordenada.latitud
                longitud = $coordenada.longitud
            }
        }
    }
    
    return $null
}

# Función para agregar equipos de la WBS al layout
function Add-WBSItemsToLayout {
    param([array]$wbsItems)
    
    $nuevosEquipos = @()
    
    foreach ($item in $wbsItems) {
        # Solo procesar ítems con cantidad y que sean materiales reales
        if ($item.cantidad -and $item.cantidad -ne '' -and $item.tipo -eq 'SUMINISTRO') {
            
            # Mapear categoría de WBS a tipo de equipo
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
            
            # Generar PK aproximado según capítulo
            $pkBase = switch ($item.capitulo) {
                '1' { 300 }  # Cap 1 - Zona inicial
                '2' { 400 }  # Cap 2 - Zona media
                '3' { 500 }  # Cap 3 - Zona alta
                '4' { 550 }  # Cap 4 - PANs
                '5' { 441 }  # Cap 5 - CCO
                default { 350 }
            }
            
            $pk = "$pkBase+000"
            
            # Obtener coordenadas
            $coord = Get-CoordenadasPorPK -pk $pk
            
            $equipo = @{
                pk = $pk
                nombre = $item.codigo
                ubicacion_lado = 'Centro'
                dispositivo = $item.descripcion
                implementacion = "2.1"
                descripcion = "Item WBS: $($item.codigo) - $($item.descripcion)"
                tipo_equipo = $tipoEquipo
                direccion = "PK$pk Centro"
                cantidad_wbs = $item.cantidad
                vu_cop = $item.vu_cop
                total_cop = $item.total_cop
            }
            
            if ($coord) {
                $equipo.latitud = $coord.latitud
                $equipo.longitud = $coord.longitud
            }
            
            $nuevosEquipos += $equipo
        }
    }
    
    return $nuevosEquipos
}

# Agregar equipos de la WBS
Write-Host "Agregando equipos de la WBS..." -ForegroundColor Yellow
$nuevosEquipos = Add-WBSItemsToLayout -wbsItems $wbsData.items

Write-Host "✓ Nuevos equipos generados: $($nuevosEquipos.Count)" -ForegroundColor Cyan

# Combinar layout actual con nuevos equipos
$layoutCompleto = $layoutActual + $nuevosEquipos

Write-Host "✓ Layout completo: $($layoutCompleto.Count) elementos totales" -ForegroundColor Green

# Guardar como JSON
$outputJsonPath = Join-Path $dirWBS "layout_datos_completo.json"
$layoutCompleto | ConvertTo-Json -Depth 10 | Set-Content $outputJsonPath -Encoding UTF8
Write-Host "✓ Guardado: $outputJsonPath" -ForegroundColor Green

# Generar JS también
$jsonString = $layoutCompleto | ConvertTo-Json -Depth 10 -Compress
$jsContent = "const LAYOUT_DATOS = $jsonString;"
$outputJsPath = Join-Path $dirWBS "layout_datos_completo.js"
$jsContent | Set-Content $outputJsPath -Encoding UTF8
Write-Host "✓ Guardado: $outputJsPath" -ForegroundColor Green

Write-Host "`n✅ Layout completo generado exitosamente!" -ForegroundColor Green

