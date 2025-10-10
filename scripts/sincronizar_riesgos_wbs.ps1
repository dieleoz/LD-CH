# SCRIPT: Sincronización Bidireccional Riesgos
# Convierte MATRIZ_RIESGOS_PMO_AMPLIADA a JSONs para WBS Interactiva

Write-Host "🔄 SINCRONIZANDO RIESGOS: Matriz → JSON → Interfaz" -ForegroundColor Green
Write-Host "======================================================" -ForegroundColor Green

# Rutas
$matrizPath = "VIII. Documentos Maestros y Metodologia\Matrices_Dependencias\MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md"
$outputDir = "IX. WBS y Planificacion\riesgos_cache"

# Crear directorio de salida
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
    Write-Host "✅ Carpeta creada: $outputDir" -ForegroundColor Green
}

# Leer matriz de riesgos
if (!(Test-Path $matrizPath)) {
    Write-Host "❌ Archivo no encontrado: $matrizPath" -ForegroundColor Red
    exit 1
}

$contenido = Get-Content $matrizPath -Raw -Encoding UTF8
Write-Host "📖 Leyendo matriz de riesgos..." -ForegroundColor Cyan

# Parsear tabla Markdown (simplificado - extraer filas)
$lineas = $contenido -split "`n"
$riesgos = @()
$enTabla = $false

foreach ($linea in $lineas) {
    # Detectar inicio de tabla
    if ($linea -match '\|\s*ID\s*\|.*Origen_Decisión') {
        $enTabla = $true
        continue
    }
    
    # Saltar separadores
    if ($linea -match '^\|[\s\-:]+\|') {
        continue
    }
    
    # Parsear fila de riesgo
    if ($enTabla -and $linea -match '^\|\s*R-') {
        $campos = $linea -split '\|' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
        
        if ($campos.Count -ge 11) {
            $riesgo = [PSCustomObject]@{
                ID = $campos[0]
                Categoria = $campos[1]
                Descripcion = $campos[2]
                Probabilidad = $campos[3]
                Impacto = $campos[4]
                Estrategia = $campos[5]
                Responsable = $campos[6]
                Estado = $campos[7]
                Fuente = $campos[8]
                Origen_Decision = $campos[9]
                Hito_Verificacion = $campos[10]
            }
            
            $riesgos += $riesgo
        }
    }
    
    # Detectar fin de tabla
    if ($enTabla -and $linea -match '^[^|]' -and $linea.Trim() -ne '') {
        $enTabla = $false
    }
}

Write-Host "✅ Riesgos extraídos: $($riesgos.Count)" -ForegroundColor Green

# Agrupar riesgos por ítem WBS (basado en contexto y origen)
$itemsWBS = @{
    "2-3-103" = @()  # Cajas fibra
    "1-1-2" = @()    # Empalmes
    "2-1-100" = @()  # TETRA
    "2-2-100" = @()  # GSM-R
}

foreach ($riesgo in $riesgos) {
    # Clasificar riesgo por ítem WBS según ID o descripción
    $id = $riesgo.ID
    
    if ($id -match 'FIBRA' -and $riesgo.Descripcion -match 'caja|empalme|300m|500m') {
        $itemsWBS["2-3-103"] += $riesgo
    }
    elseif ($id -match 'FIBRA' -and $riesgo.Descripcion -match 'conector|fusión|empalme' -and $riesgo.Descripcion -notmatch 'caja') {
        $itemsWBS["1-1-2"] += $riesgo
    }
    elseif ($id -match 'TETRA') {
        $itemsWBS["2-1-100"] += $riesgo
    }
    elseif ($id -match 'GSM') {
        $itemsWBS["2-2-100"] += $riesgo
    }
}

# Generar JSONs por ítem
$jsonGenerados = 0

foreach ($itemKey in $itemsWBS.Keys) {
    $riesgosItem = $itemsWBS[$itemKey]
    
    if ($riesgosItem.Count -gt 0) {
        $json = @{
            item_wbs = $itemKey.Replace('-', '.')
            ultima_actualizacion = (Get-Date -Format "yyyy-MM-ddTHH:mm:ss")
            total_riesgos = $riesgosItem.Count
            riesgos = $riesgosItem | ForEach-Object {
                @{
                    id = $_.ID
                    descripcion = $_.Descripcion
                    probabilidad = $_.Probabilidad
                    impacto = $_.Impacto
                    estrategia = $_.Estrategia
                    responsable = $_.Responsable
                    estado = $_.Estado
                    origen_decision = $_.Origen_Decision
                    hito_verificacion = $_.Hito_Verificacion
                    nuevo = $false  # Se marca en true si es reciente (< 24h)
                }
            }
        } | ConvertTo-Json -Depth 5
        
        $outputFile = Join-Path $outputDir "riesgos_item_$itemKey.json"
        $json | Out-File -FilePath $outputFile -Encoding UTF8 -Force
        
        Write-Host "  [OK] Generado: riesgos_item_$itemKey.json ($($riesgosItem.Count) riesgos)" -ForegroundColor Green
        $jsonGenerados++
    }
}

# Resumen
Write-Host "" 
Write-Host "📊 RESUMEN DE SINCRONIZACIÓN:" -ForegroundColor Green
Write-Host "============================" -ForegroundColor Green
Write-Host "Riesgos totales procesados: $($riesgos.Count)" -ForegroundColor White
Write-Host "JSONs generados: $jsonGenerados" -ForegroundColor White
Write-Host "Ubicación: $outputDir" -ForegroundColor Cyan

if ($jsonGenerados -gt 0) {
    Write-Host ""
    Write-Host "🎉 ¡SINCRONIZACIÓN COMPLETADA!" -ForegroundColor Green
    Write-Host "Los riesgos se actualizarán en WBS Interactiva automáticamente" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "⚠️  No se generaron JSONs. Verifica la matriz de riesgos." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Presiona Enter para continuar..." -ForegroundColor White
Read-Host

