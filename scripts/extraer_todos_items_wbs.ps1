# SCRIPT: Extraer TODOS los ítems de WBS_Presupuestal_v2.0.md
# Genera JSON completo con todos los capítulos y subítems

Write-Host "Extrayendo TODOS los items de WBS..." -ForegroundColor Green

$wbsPath = "..\IX. WBS y Planificacion\WBS_Presupuestal_v2.0.md"
$outputPath = "..\IX. WBS y Planificacion\datos_wbs_TODOS_items.json"

# Leer archivo WBS
$contenido = Get-Content $wbsPath -Raw -Encoding UTF8

# Estructura base
$wbsData = @{
    proyecto = "APP La Dorada-Chiriguaná"
    version = "3.0"
    fecha_actualizacion = (Get-Date -Format "yyyy-MM-dd")
    total_capitulos = 6
    items = @()
}

# Parsear líneas
$lineas = $contenido -split "`n"
$capituloActual = ""
$subcapituloActual = ""

foreach ($linea in $lineas) {
    # Detectar capítulo
    if ($linea -match '### \*\*CAPÍTULO (\d+): (.+)\*\*') {
        $capituloActual = $matches[1]
        $descripcionCap = $matches[2]
        Write-Host "Capitulo $($capituloActual): $descripcionCap" -ForegroundColor Cyan
    }
    
    # Detectar subcapítulo
    if ($linea -match '#### \*\*(.+?)\s+\((\d+)') {
        $subcapituloActual = $matches[1]
        Write-Host "  Subcapítulo: $subcapituloActual" -ForegroundColor Gray
    }
    
    # Detectar ítem en tabla
    if ($linea -match '^\|\s*\*\*(\d+\.\d+\.\d+)\*\*\s*\|\s*(.+?)\s*\|\s*(.+?)\s*\|\s*\$?([\d,]+)\s*\|\s*\$?([\d,]+)') {
        $codigo = $matches[1]
        $descripcion = $matches[2] -replace '\*\*', '' -replace '^\s+|\s+$', ''
        $cantidad = $matches[3] -replace '\s+', ''
        $vu = $matches[4] -replace ',', ''
        $total = $matches[5] -replace ',', ''
        
        # Extraer capítulo del código (primer dígito)
        $capituloDelCodigo = $codigo.Split('.')[0]
        
        # Clasificar TIPO (SUMINISTRO/OBRA/SERVICIO) según descripción
        $tipoItem = "SUMINISTRO"  # Por defecto
        if ($descripcion -match "Mano de obra|instalación|Instalación|Cimentación|Cimentaciones|Obra civil|Construcción|Caseta|Cerramiento|Montaje|Vía de acceso|Sala de") {
            $tipoItem = "OBRA"
        }
        if ($descripcion -match "Servicio|Capacitación|Configuración|Pruebas|Soporte|Documentación") {
            $tipoItem = "SERVICIO"
        }
        
        # Inferir unidad desde cantidad y descripción
        $unidadItem = "UND"  # Por defecto
        if ($descripcion -match "Cable|fibra óptica" -and $descripcion -notmatch "rollo") {
            $unidadItem = "km"
        }
        elseif ($descripcion -match "rollo|Rollo") {
            $unidadItem = "ROLLO"
        }
        elseif ($descripcion -match "Global|GL|global") {
            $unidadItem = "GL"
        }
        elseif ($descripcion -match "m²|metro cuadrado") {
            $unidadItem = "m²"
        }
        
        $item = @{
            codigo = $codigo
            descripcion = $descripcion
            unidad = $unidadItem
            capitulo = $capituloDelCodigo
            subcapitulo = $subcapituloActual
            cantidad = $cantidad
            vu_cop = [int64]$vu
            total_cop = [int64]$total
            tipo = $tipoItem
            modificable = $true
            categoria = switch ($capituloDelCodigo) {
                "1" { "control" }
                "2" { "telecomunicaciones" }
                "3" { "seguridad" }
                "4" { "pasos_nivel" }
                "5" { "centro_control" }
                "6" { "material_rodante" }
                default { "otro" }
            }
        }
        
        $wbsData.items += $item
        Write-Host "    Item: $codigo - $descripcion" -ForegroundColor DarkGray
    }
}

# Agregar metadatos adicionales
$wbsData.items | ForEach-Object {
    $_.archivos_relacionados = @()
    $_.riesgos_asociados = @()
}

# Generar JSON
$json = $wbsData | ConvertTo-Json -Depth 10
$json | Out-File -FilePath $outputPath -Encoding UTF8 -Force

Write-Host "`n[OK] Extraccion completada" -ForegroundColor Green
Write-Host "Items extraidos: $($wbsData.items.Count)" -ForegroundColor White
Write-Host "Archivo generado: $outputPath" -ForegroundColor Cyan

# Mostrar resumen por capítulo
Write-Host "`nRESUMEN POR CAPITULO:" -ForegroundColor Yellow
1..6 | ForEach-Object {
    $cap = $_
    $count = ($wbsData.items | Where-Object { $_.capitulo -eq "$cap" } | Measure-Object).Count
    Write-Host "  Capitulo $cap : $count items" -ForegroundColor White
}

# Mostrar resumen por tipo
Write-Host "`nRESUMEN POR TIPO:" -ForegroundColor Yellow
$suministros = ($wbsData.items | Where-Object { $_.tipo -eq "SUMINISTRO" } | Measure-Object).Count
$obras = ($wbsData.items | Where-Object { $_.tipo -eq "OBRA" } | Measure-Object).Count
$servicios = ($wbsData.items | Where-Object { $_.tipo -eq "SERVICIO" } | Measure-Object).Count
Write-Host "  SUMINISTRO: $suministros items" -ForegroundColor White
Write-Host "  OBRA: $obras items" -ForegroundColor White
Write-Host "  SERVICIO: $servicios items" -ForegroundColor White

Write-Host "`nPresiona Enter para continuar..."
Read-Host

