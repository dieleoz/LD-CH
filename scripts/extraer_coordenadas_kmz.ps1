# Script para extraer coordenadas del archivo KML del proyecto
# Uso: .\extraer_coordenadas_kmz.ps1

$kmzPath = "X_ENTREGABLES_CONSOLIDADOS\5_INDICES_NAVEGACION\Sistema Ferreo LD-CH_Via.kmz"
$outputPath = "coordenadas_reales_kml.json"

Write-Host "📂 Extrayendo coordenadas del KMZ..." -ForegroundColor Cyan

# Descomprimir KMZ
$tempDir = "temp_kmz_extract"
if (Test-Path $tempDir) { Remove-Item $tempDir -Recurse -Force }
New-Item -ItemType Directory -Path $tempDir | Out-Null

# Copiar y renombrar a zip para descomprimir
$file = Get-Item $kmzPath
Copy-Item $file.FullName "temp_kmz.zip"
Expand-Archive -Path "temp_kmz.zip" -DestinationPath $tempDir -Force

# Leer KML
$kmlContent = Get-Content "$tempDir\doc.kml"

$coords = @()
$currentName = ""
$currentCoords = ""

foreach ($line in $kmlContent) {
    # Buscar nombre
    if ($line -match '&lt;name&gt;(\d+)&lt;/name&gt;') {
        $currentName = $matches[1]
    }
    
    # Buscar coordenadas
    if ($line -match '&lt;coordinates&gt;([-\d.]+),([-\d.]+)') {
        $lng = $matches[1]
        $lat = $matches[2]
        
        if ($currentName -and $lng -and $lat) {
            $coords += [PSCustomObject]@{
                PK = [int]$currentName
                Longitud = [double]$lng
                Latitud = [double]$lat
            }
        }
    }
}

# Exportar a JSON
$coords | ConvertTo-Json | Out-File $outputPath -Encoding UTF8

Write-Host "✅ Extraídas $($coords.Count) coordenadas" -ForegroundColor Green
Write-Host "📄 Guardadas en: $outputPath" -ForegroundColor Cyan

# Mostrar primeras 5
$coords | Select-Object -First 5 | Format-Table -AutoSize

# Limpiar
Remove-Item $tempDir -Recurse -Force
Remove-Item "temp_kmz.zip" -Force

Write-Host "✅ Proceso completado" -ForegroundColor Green

