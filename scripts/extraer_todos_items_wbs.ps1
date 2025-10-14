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

# Parsear línea por línea para TODOS los niveles (capítulos, subcapítulos, ítems)
Write-Host "`nExtrayendo TODOS los niveles secuencialmente..." -ForegroundColor Yellow
$lineas = $contenido -split "`n"
$capituloActual = ""
$subcapituloActual = ""

foreach ($linea in $lineas) {
    # Detectar capítulo (NIVEL 1)
    if ($linea -match '^### \*\*CAP.?TULO (\d+):\s*(.+?)\*\*') {
        $capNum = $matches[1]
        $desc = $matches[2] -replace '\*', '' -replace '^\s+|\s+$', ''
        
        Write-Host "  Capítulo $capNum`: $desc" -ForegroundColor Yellow
        
        $cat = switch ($capNum) {
            "1" { "control" }
            "2" { "telecomunicaciones" }
            "3" { "seguridad" }
            "4" { "pasos_nivel" }
            "5" { "centro_control" }
            "6" { "material_rodante" }
            default { "otro" }
        }
        
        $itemCapitulo = @{
            codigo = $capNum
            descripcion = $desc
            unidad = ""
            capitulo = $capNum
            subcapitulo = ""
            cantidad = ""
            vu_cop = [int64]0
            total_cop = [int64]0
            tipo = ""
            modificable = $false
            categoria = $cat
            archivos_relacionados = @()
            riesgos_asociados = @()
        }
        $wbsData.items += $itemCapitulo
        $capituloActual = $capNum
        continue
    }
    
    # Detectar subcapítulo (NIVEL 2)
    if ($linea -match '#### \*\*(\d+\.\d+)\s+(.+?)(?:\s+\(|\*\*)') {
        $subcapituloActual = $matches[1]
        $descripcionSub = $matches[2].Trim()
        Write-Host "  Subcapítulo: $subcapituloActual - $descripcionSub" -ForegroundColor Gray
        
        # AGREGAR SUBCAPÍTULO AL ARRAY (NIVEL 2)
        $capituloDelSub = $subcapituloActual.Split('.')[0]
        $itemSubcapitulo = @{
            codigo = $subcapituloActual
            descripcion = $descripcionSub
            unidad = ""
            capitulo = $capituloDelSub
            subcapitulo = $subcapituloActual
            cantidad = ""
            vu_cop = [int64]0
            total_cop = [int64]0
            tipo = ""
            modificable = $false
            categoria = switch ($capituloDelSub) {
                "1" { "control" }
                "2" { "telecomunicaciones" }
                "3" { "seguridad" }
                "4" { "pasos_nivel" }
                "5" { "centro_control" }
                "6" { "material_rodante" }
                default { "otro" }
            }
            archivos_relacionados = @()
            riesgos_asociados = @()
        }
        $wbsData.items += $itemSubcapitulo
    }
    
    # Detectar ítem en tabla (NIVEL 3) - Incluye ítems con "-" en cantidad/VU
    if ($linea -match '^\|\s*\*\*(\d+\.\d+\.\d+)\*\*\s*\|\s*(.+?)\s*\|\s*(.+?)\s*\|\s*(.+?)\s*\|\s*\$?([\d,]+)') {
        $codigo = $matches[1]
        $descripcion = $matches[2] -replace '\*\*', '' -replace '^\s+|\s+$', ''
        $cantidad = $matches[3] -replace '\s+', ''
        $vu_raw = $matches[4] -replace '\s+', '' -replace '\$', '' -replace ',', ''  # ← QUITAR $ y comas
        $total = $matches[5] -replace ',', '' -replace '\$', ''  # ← QUITAR $ y comas
        
        # Si VU es "-", poner 0
        $vu = if ($vu_raw -eq '-' -or $vu_raw -eq '') {
            0
        } else {
            try { [int64]$vu_raw } catch { 0 }
        }
        
        # Si cantidad es "-", dejar como string vacío
        if ($cantidad -eq '-') {
            $cantidad = ''
        }
        
        # Convertir total a Int64 con manejo de errores
        try {
            $totalInt64 = [int64]$total
        } catch {
            Write-Host "      ⚠️ Error convirtiendo total '$total' para item $codigo" -ForegroundColor Yellow
            $totalInt64 = 0
        }
        
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
            vu_cop = $vu  # Ya es Int64 o 0
            total_cop = $totalInt64  # Ya es Int64
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
            archivos_relacionados = @()
            riesgos_asociados = @()
        }
        
        $wbsData.items += $item
        Write-Host "    Item: $codigo - $descripcion" -ForegroundColor DarkGray
    }
}

# Agregar metadatos adicionales
$wbsData.items | ForEach-Object {
    if (-not $_.archivos_relacionados) { $_.archivos_relacionados = @() }
    if (-not $_.riesgos_asociados) { $_.riesgos_asociados = @() }
}

# DEBUG: Verificar niveles antes de guardar
Write-Host "`nDEBUG - Verificando niveles en array:" -ForegroundColor Magenta
$nivel1 = ($wbsData.items | Where-Object { $_.codigo -match '^[1-6]$' } | Measure-Object).Count
$nivel2 = ($wbsData.items | Where-Object { $_.codigo -match '^\d+\.\d+$' } | Measure-Object).Count
$nivel3 = ($wbsData.items | Where-Object { $_.codigo -match '^\d+\.\d+\.\d+$' } | Measure-Object).Count
Write-Host "  Nivel 1 (Capítulos): $nivel1" -ForegroundColor $(if($nivel1 -eq 6){"Green"}else{"Red"})
Write-Host "  Nivel 2 (Subcapítulos): $nivel2" -ForegroundColor White
Write-Host "  Nivel 3 (Ítems): $nivel3" -ForegroundColor White
Write-Host "  TOTAL: $($wbsData.items.Count)" -ForegroundColor Cyan

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

