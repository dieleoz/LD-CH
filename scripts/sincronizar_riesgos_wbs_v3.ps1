# ═══════════════════════════════════════════════════════════════════════
# SCRIPT: Sincronizar Riesgos WBS v3.0
# ═══════════════════════════════════════════════════════════════════════
# Propósito: Leer MATRIZ_RIESGOS_PMO_AMPLIADA y vincular riesgos a ítems WBS
#            Genera riesgos_wbs.json y riesgos_wbs.js con exposición calculada
# ═══════════════════════════════════════════════════════════════════════

param(
    [string]$MatrizPath = "VIII. Documentos Maestros y Metodologia\Matrices_Dependencias\MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md",
    [string]$WbsJsonPath = "IX. WBS y Planificacion\datos_wbs_TODOS_items.json",
    [string]$OutputJsonPath = "IX. WBS y Planificacion\riesgos_wbs.json"
)

Write-Host "`n================================================================" -ForegroundColor Cyan
Write-Host "  SINCRONIZACION RIESGOS WBS v3.0" -ForegroundColor Cyan
Write-Host "================================================================`n" -ForegroundColor Cyan

# Verificar archivos
if (-not (Test-Path $MatrizPath)) {
    Write-Host "ERROR: No se encontró MATRIZ_RIESGOS: $MatrizPath" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $WbsJsonPath)) {
    Write-Host "ERROR: No se encontró WBS JSON: $WbsJsonPath" -ForegroundColor Red
    exit 1
}

# Leer WBS para obtener ítems
Write-Host "Leyendo WBS..." -ForegroundColor Yellow
$wbsData = Get-Content $WbsJsonPath -Raw -Encoding UTF8 | ConvertFrom-Json
Write-Host "Ítems WBS: $($wbsData.items.Count)" -ForegroundColor Green

# Leer matriz de riesgos
Write-Host "`nLeyendo matriz de riesgos..." -ForegroundColor Yellow
$contenido = Get-Content $MatrizPath -Raw -Encoding UTF8
$lineas = $contenido -split "`n"
$riesgos = @()
$enTabla = $false

foreach ($linea in $lineas) {
    # Detectar inicio de tabla (acepta Origen_Decisión con o sin negritas)
    if ($linea -match "\|\s*ID\s*\|.*Origen") {
        $enTabla = $true
        continue
    }
    
    # Saltar separadores (líneas con | --- | --- |)
    if ($linea -match "^\|[\s\-:]+\|") {
        continue
    }
    
    # Parsear fila de riesgo (líneas que empiezan con | R-)
    if ($enTabla -and $linea -match "^\|\s*R-") {
        $campos = $linea -split "\|" | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" }
        
        if ($campos.Count -ge 10) {
            # Calcular exposición (Probabilidad × Impacto)
            $probNum = switch ($campos[3]) {
                "Muy Alta" { 0.9 }
                "Alta" { 0.7 }
                "Media" { 0.5 }
                "Baja" { 0.3 }
                "Muy Baja" { 0.1 }
                default { 0.5 }
            }
            
            $impactoTexto = $campos[4].Trim()
            $impNum = if ($impactoTexto -match "cr.tico|critico") { 1.0 }
                     elseif ($impactoTexto -match "alto") { 0.8 }
                     elseif ($impactoTexto -match "medio") { 0.5 }
                     elseif ($impactoTexto -match "bajo") { 0.3 }
                     else { 0.5 }
            
            $exposicion = [math]::Round($probNum * $impNum, 2)
            $nivelExposicion = if ($exposicion -ge 0.7) { "CRÍTICA" }
                              elseif ($exposicion -ge 0.5) { "ALTA" }
                              elseif ($exposicion -ge 0.3) { "MEDIA" }
                              else { "BAJA" }
            
            $riesgo = [PSCustomObject]@{
                id = $campos[0]
                categoria = $campos[1]
                descripcion = $campos[2]
                probabilidad = $campos[3]
                probabilidad_num = $probNum
                impacto = $campos[4]
                impacto_num = $impNum
                exposicion = $exposicion
                nivel_exposicion = $nivelExposicion
                estrategia = $campos[5]
                responsable = $campos[6]
                estado = $campos[7]
                fuente = $campos[8]
                origen_decision = if ($campos.Count -ge 10) { $campos[9] } else { "N/A" }
                hito_verificacion = if ($campos.Count -ge 11) { $campos[10] } else { "N/A" }
                items_wbs = @()  # Se llenará después
            }
            
            $riesgos += $riesgo
        }
    }
    
    # Detectar fin de tabla
    if ($enTabla -and $linea -match "^[^|]" -and $linea.Trim() -ne "") {
        $enTabla = $false
    }
}

Write-Host "Riesgos extraídos: $($riesgos.Count)" -ForegroundColor Green

# Vincular riesgos a ítems WBS (por palabras clave)
Write-Host "`nVinculando riesgos a ítems WBS..." -ForegroundColor Yellow
$vinculaciones = 0

foreach ($riesgo in $riesgos) {
    $id = $riesgo.id
    $desc = $riesgo.descripcion
    
    # Buscar ítems WBS relacionados
    $itemsRelacionados = @()
    
    foreach ($item in $wbsData.items) {
        $codigo = $item.codigo
        $descripcionItem = $item.descripcion
        
        # Reglas de vinculación por palabras clave
        $coincide = $false
        
        # Fibra óptica
        if ($id -match "FIBRA" -and $descripcionItem -match "fibra|cable|caja|empalme|fusión") {
            $coincide = $true
        }
        # TETRA
        elseif ($id -match "TETRA" -and $descripcionItem -match "TETRA|torre|radio|estación") {
            $coincide = $true
        }
        # GSM-R
        elseif ($id -match "GSM" -and $descripcionItem -match "GSM|móvil|celular") {
            $coincide = $true
        }
        # CTC
        elseif ($id -match "CTC" -and $descripcionItem -match "CTC|control|tráfico|software") {
            $coincide = $true
        }
        # ATP/ETCS
        elseif ($id -match "ATP|ETCS" -and $descripcionItem -match "ATP|ETCS|embarcad|locomotora") {
            $coincide = $true
        }
        # SCADA
        elseif ($id -match "SCADA" -and $descripcionItem -match "SCADA|servidor|monitoreo") {
            $coincide = $true
        }
        # CCTV
        elseif ($id -match "CCTV|SEGURIDAD" -and $descripcionItem -match "cámara|CCTV|videovigilancia") {
            $coincide = $true
        }
        
        if ($coincide) {
            $itemsRelacionados += $codigo
        }
    }
    
    if ($itemsRelacionados.Count -gt 0) {
        $riesgo.items_wbs = $itemsRelacionados
        $vinculaciones += $itemsRelacionados.Count
    }
}

Write-Host "Vinculaciones creadas: $vinculaciones" -ForegroundColor Green

# Generar estructura JSON consolidada
Write-Host "`nGenerando JSON consolidado..." -ForegroundColor Yellow

$riesgosWbs = @{
    proyecto = "APP La Dorada-Chiriguaná"
    fecha_actualizacion = (Get-Date).ToString("yyyy-MM-dd")
    total_riesgos = $riesgos.Count
    riesgos_vinculados = ($riesgos | Where-Object { $_.items_wbs.Count -gt 0 }).Count
    riesgos = $riesgos | ForEach-Object {
        @{
            id = $_.id
            categoria = $_.categoria
            descripcion = $_.descripcion
            probabilidad = $_.probabilidad
            probabilidad_num = $_.probabilidad_num
            impacto = $_.impacto
            impacto_num = $_.impacto_num
            exposicion = $_.exposicion
            nivel_exposicion = $_.nivel_exposicion
            estrategia = $_.estrategia
            responsable = $_.responsable
            estado = $_.estado
            fuente = $_.fuente
            origen_decision = $_.origen_decision
            hito_verificacion = $_.hito_verificacion
            items_wbs = $_.items_wbs
        }
    }
    estadisticas = @{
        exposicion_critica = ($riesgos | Where-Object { $_.nivel_exposicion -eq "CRÍTICA" }).Count
        exposicion_alta = ($riesgos | Where-Object { $_.nivel_exposicion -eq "ALTA" }).Count
        exposicion_media = ($riesgos | Where-Object { $_.nivel_exposicion -eq "MEDIA" }).Count
        exposicion_baja = ($riesgos | Where-Object { $_.nivel_exposicion -eq "BAJA" }).Count
        por_estrategia = @{
            evitar = ($riesgos | Where-Object { $_.estrategia -eq "EVITAR" }).Count
            mitigar = ($riesgos | Where-Object { $_.estrategia -eq "MITIGAR" }).Count
            transferir = ($riesgos | Where-Object { $_.estrategia -eq "TRANSFERIR" }).Count
            aceptar = ($riesgos | Where-Object { $_.estrategia -eq "ACEPTAR" }).Count
            asumir = ($riesgos | Where-Object { $_.estrategia -eq "ASUMIR" }).Count
        }
    }
}

# Guardar JSON
$riesgosWbs | ConvertTo-Json -Depth 100 | Out-File $OutputJsonPath -Encoding UTF8
Write-Host "✅ JSON generado: $OutputJsonPath" -ForegroundColor Green

# Generar archivo .js
$jsPath = $OutputJsonPath -replace "\.json$", ".js"
$jsContent = "window.riesgosWbs = " + ($riesgosWbs | ConvertTo-Json -Depth 100 -Compress) + ";"
$jsContent | Out-File $jsPath -Encoding UTF8
Write-Host "✅ JS generado: $jsPath" -ForegroundColor Green

# Resumen
Write-Host "`n================================================================" -ForegroundColor Green
Write-Host "  SINCRONIZACIÓN COMPLETADA" -ForegroundColor Green
Write-Host "================================================================`n" -ForegroundColor Green

Write-Host "📊 ESTADÍSTICAS:" -ForegroundColor Cyan
Write-Host "  Total riesgos: $($riesgosWbs.total_riesgos)" -ForegroundColor White
Write-Host "  Riesgos vinculados a WBS: $($riesgosWbs.riesgos_vinculados)" -ForegroundColor White
Write-Host "  Exposición CRÍTICA: $($riesgosWbs.estadisticas.exposicion_critica)" -ForegroundColor Red
Write-Host "  Exposición ALTA: $($riesgosWbs.estadisticas.exposicion_alta)" -ForegroundColor Yellow
Write-Host "  Exposición MEDIA: $($riesgosWbs.estadisticas.exposicion_media)" -ForegroundColor Cyan
Write-Host "  Exposición BAJA: $($riesgosWbs.estadisticas.exposicion_baja)" -ForegroundColor Green
Write-Host ""
