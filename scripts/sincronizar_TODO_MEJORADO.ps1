# ========================================
# SINCRONIZACIÓN COMPLETA WBS v2.0
# ========================================
# Actualiza TODOS los archivos del sistema:
# - Datos WBS (JSON + JS)
# - Metadata enriquecida (JSON + JS)
# - Todas las interfaces HTML
# ========================================

Write-Host "`n🔄 SINCRONIZACIÓN COMPLETA INICIADA`n" -ForegroundColor Cyan

$rutaBase = "D:\one drive grupo ortiz 2025\OneDrive - Grupo Ortiz\LFC\02. Ingenieria\02. Ingenieria Conceptual\0.0 Formatos para IA"
cd $rutaBase

# ========================================
# PASO 1: Leer WBS Presupuestal (Fuente de verdad)
# ========================================
Write-Host "📖 PASO 1: Leyendo WBS_Presupuestal_v2.0.md..." -ForegroundColor Yellow

$wbsPath = "IX. WBS y Planificacion\WBS_Presupuestal_v2.0.md"
if (!(Test-Path $wbsPath)) {
    Write-Host "❌ ERROR: No se encuentra $wbsPath" -ForegroundColor Red
    exit 1
}

$contenido = Get-Content $wbsPath -Raw
Write-Host "✅ Archivo leído: $(($contenido.Length / 1024).ToString('N0')) KB`n" -ForegroundColor Green

# ========================================
# PASO 2: Parsear items WBS
# ========================================
Write-Host "🔍 PASO 2: Parseando ítems de la WBS..." -ForegroundColor Yellow

$items = @()
# Regex pattern para extraer items de tabla WBS
$patron = '(?m)^\|\s*(\d+\.\d+\.\d+)\s*\|\s*([^|]+?)\s*\|\s*([^|]+?)\s*\|\s*([^|]+?)\s*\|\s*([0-9,.]+)\s*\|\s*\$([0-9,.]+)\s*\|\s*\$([0-9,.]+)\s*\|'

$matches = [regex]::Matches($contenido, $patron)
foreach ($match in $matches) {
    $vuStr = $match.Groups[6].Value.Trim() -replace ',', '' -replace '\.', ''
    $totalStr = $match.Groups[7].Value.Trim() -replace ',', '' -replace '\.', ''
    
    $items += [PSCustomObject]@{
        codigo = $match.Groups[1].Value.Trim()
        descripcion = $match.Groups[2].Value.Trim()
        tipo = $match.Groups[3].Value.Trim().ToUpper()
        unidad = $match.Groups[4].Value.Trim()
        cantidad = $match.Groups[5].Value.Trim() -replace ',', ''
        vu_cop = [long]$vuStr
        total_cop = [long]$totalStr
    }
}

Write-Host "✅ Parseados $($items.Count) ítems de la WBS`n" -ForegroundColor Green

# ========================================
# PASO 3: Generar datos_wbs_TODOS_items.json
# ========================================
Write-Host "💾 PASO 3: Generando datos_wbs_TODOS_items.json..." -ForegroundColor Yellow

$wbsData = @{
    version = "3.0"
    fecha_actualizacion = Get-Date -Format "yyyy-MM-dd"
    total_capitulos = 6
    items = @($items | ForEach-Object {
        @{
            codigo = $_.codigo
            descripcion = $_.descripcion
            tipo = $_.tipo
            unidad = $_.unidad
            cantidad = $_.cantidad
            vu_cop = $_.vu_cop
            total_cop = $_.total_cop
            capitulo = $_.codigo.Split('.')[0]
            modificable = $true
            categoria = switch ($_.codigo.Split('.')[0]) {
                "1" { "control" }
                "2" { "telecomunicaciones" }
                "3" { "its_seguridad" }
                "4" { "pasos_nivel" }
                "5" { "cco" }
                "6" { "material_rodante" }
            }
            archivos_relacionados = @()
            riesgos_asociados = @()
        }
    })
}

$jsonPath = "IX. WBS y Planificacion\datos_wbs_TODOS_items.json"
$wbsData | ConvertTo-Json -Depth 10 | Set-Content $jsonPath -Encoding UTF8
Write-Host "✅ Creado: $jsonPath ($($items.Count) items)`n" -ForegroundColor Green

# ========================================
# PASO 4: Generar datos_wbs_TODOS_items.js
# ========================================
Write-Host "💾 PASO 4: Generando datos_wbs_TODOS_items.js..." -ForegroundColor Yellow

$jsContent = @"
// WBS Datos Completos - Generado automaticamente
// Fecha: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
// Total items: $($items.Count)

window.datos_wbs = $(ConvertTo-Json $wbsData -Depth 10 -Compress);

console.log('WBS Datos cargados:', window.datos_wbs.items.length, 'items');
console.log('Fecha actualizacion:', window.datos_wbs.fecha_actualizacion);
"@

$jsPath = "IX. WBS y Planificacion\datos_wbs_TODOS_items.js"
Set-Content $jsPath $jsContent -Encoding UTF8
Write-Host "✅ Creado: $jsPath`n" -ForegroundColor Green

# ========================================
# PASO 5: Actualizar metadata enriquecida
# ========================================
Write-Host "🔧 PASO 5: Actualizando metadata enriquecida..." -ForegroundColor Yellow

$metadataPath = "IX. WBS y Planificacion\wbs_metadata_enriquecida.json"
if (Test-Path $metadataPath) {
    $metadata = Get-Content $metadataPath | ConvertFrom-Json
    
    # Agregar items faltantes con plantilla
    foreach ($item in $items) {
        if (-not $metadata.items.PSObject.Properties[$item.codigo]) {
            $metadata.items | Add-Member -NotePropertyName $item.codigo -NotePropertyValue $metadata.plantilla_nuevo_item
        }
    }
    
    # Guardar metadata actualizada
    $metadata | ConvertTo-Json -Depth 10 | Set-Content $metadataPath -Encoding UTF8
    Write-Host "✅ Metadata actualizada con $($items.Count) items`n" -ForegroundColor Green
    
    # Regenerar JS de metadata
    $metadataJS = @"
// Metadata Enriquecida WBS - Actualizada automaticamente
// Fecha: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")

window.metadata_enriquecida = $(ConvertTo-Json $metadata -Depth 10 -Compress);

console.log('Metadata enriquecida cargada:', Object.keys(window.metadata_enriquecida.items).length, 'items con informacion completa');
"@
    
    $metadataJSPath = "IX. WBS y Planificacion\wbs_metadata_enriquecida.js"
    Set-Content $metadataJSPath $metadataJS -Encoding UTF8
    Write-Host "✅ Metadata JS regenerada`n" -ForegroundColor Green
}

# ========================================
# PASO 6: Actualizar wbs_presupuestal_datos.js (legacy)
# ========================================
Write-Host "💾 PASO 6: Actualizando wbs_presupuestal_datos.js (legacy)..." -ForegroundColor Yellow

$legacyItems = @($items | ForEach-Object {
    @{
        item = $_.codigo
        descripcion = $_.descripcion
        tipo = $_.tipo
        unidad = $_.unidad
        cantidad = $_.cantidad
        vu = $_.vu_cop
        total = $_.total_cop
    }
})

$legacyJS = @"
// WBS Presupuestal Datos - Formato Legacy
// Generado: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")

const wbsData = $(ConvertTo-Json $legacyItems -Compress);

console.log('WBS Legacy cargado:', wbsData.length, 'items');
"@

$legacyPath = "IX. WBS y Planificacion\wbs_presupuestal_datos.js"
Set-Content $legacyPath $legacyJS -Encoding UTF8
Write-Host "✅ Legacy JS actualizado`n" -ForegroundColor Green

# ========================================
# PASO 7: Cache bust para interfaces HTML
# ========================================
Write-Host "🔄 PASO 7: Actualizando referencias en HTML (cache bust)..." -ForegroundColor Yellow

$timestamp = Get-Date -Format "yyyyMMddHHmmss"
$htmlFiles = @(
    "IX. WBS y Planificacion\WBS_COMPLETA_TODO_Interactiva_v4.0.html",
    "IX. WBS y Planificacion\WBS_EDT_Detalle.html",
    "IX. WBS y Planificacion\WBS_Reporte_Gerencial.html",
    "IX. WBS y Planificacion\WBS_Cronograma_Propuesta.html",
    "IX. WBS y Planificacion\WBS_Analisis_Riesgos.html",
    "IX. WBS y Planificacion\WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguaná.html"
)

$count = 0
foreach ($htmlFile in $htmlFiles) {
    if (Test-Path $htmlFile) {
        $html = Get-Content $htmlFile -Raw
        
        # Agregar timestamp a archivos JS si no existe
        if ($html -notmatch '\?v=') {
            $html = $html -replace '(datos_wbs_TODOS_items\.js)', "`$1?v=$timestamp"
            $html = $html -replace '(wbs_metadata_enriquecida\.js)', "`$1?v=$timestamp"
            $html = $html -replace '(wbs_presupuestal_datos\.js)', "`$1?v=$timestamp"
            
            Set-Content $htmlFile $html -Encoding UTF8
            $count++
        }
    }
}

Write-Host "✅ $count archivos HTML actualizados con cache bust`n" -ForegroundColor Green

# ========================================
# RESUMEN FINAL
# ========================================
Write-Host "`n═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "✅ SINCRONIZACIÓN COMPLETA EXITOSA`n" -ForegroundColor Green
Write-Host "📊 ARCHIVOS ACTUALIZADOS:" -ForegroundColor Yellow
Write-Host "  ✅ datos_wbs_TODOS_items.json ($($items.Count) items)"
Write-Host "  ✅ datos_wbs_TODOS_items.js"
Write-Host "  ✅ wbs_metadata_enriquecida.json"
Write-Host "  ✅ wbs_metadata_enriquecida.js"
Write-Host "  ✅ wbs_presupuestal_datos.js (legacy)"
Write-Host "  ✅ $count interfaces HTML con cache bust`n"
Write-Host "🎯 PRÓXIMO PASO:" -ForegroundColor Cyan
Write-Host "  Recarga las interfaces HTML (Ctrl+F5) para ver cambios`n"
Write-Host "═══════════════════════════════════════════════════════════`n" -ForegroundColor Cyan

