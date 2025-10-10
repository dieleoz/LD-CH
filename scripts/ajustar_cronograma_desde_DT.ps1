# ═══════════════════════════════════════════════════════════════════════
# SCRIPT: Ajustar Cronograma desde Decisiones Técnicas
# ═══════════════════════════════════════════════════════════════════════

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  AJUSTE DE CRONOGRAMA DESDE DECISIONES TÉCNICAS" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

# Rutas
$rutaDTs = "II. Apendices Tecnicos\Decisiones_Tecnicas"
$rutaCronograma = "IX. WBS y Planificacion\cronograma_datos.json"
$rutaCronogramaJS = "IX. WBS y Planificacion\cronograma_datos.js"

# Leer cronograma
Write-Host "Leyendo cronograma actual..." -ForegroundColor Yellow
$cronograma = Get-Content $rutaCronograma -Raw -Encoding UTF8 | ConvertFrom-Json

# Buscar DTs tipo cronograma
Write-Host "Buscando DTs tipo cronograma..." -ForegroundColor Yellow
$dtsFiles = Get-ChildItem -Path $rutaDTs -Filter "DT-*.md"

$actividadesAgregadas = 0

foreach ($dtFile in $dtsFiles) {
    $contenido = Get-Content $dtFile.FullName -Raw -Encoding UTF8
    
    # Detectar tipo
    if ($contenido -match 'tipo_cambio:\s*"(riesgo_cronograma|cronograma)"') {
        Write-Host ""
        Write-Host "Procesando: $($dtFile.Name)" -ForegroundColor Cyan
        
        # Extraer datos manualmente línea por línea desde YAML
        $lines = $contenido -split "`n"
        $enYaml = $false
        $enCambiosCrono = $false
        
        $codigo = ""
        $nombre = ""
        $duracion = 0
        $inicio = ""
        $itemWBS = ""
        
        for ($i = 0; $i -lt $lines.Count; $i++) {
            $line = $lines[$i]
            
            if ($line -match '```yaml') { $enYaml = $true }
            if ($line -match '```' -and $enYaml -and $line -notmatch 'yaml') { $enYaml = $false }
            
            if ($enYaml) {
                if ($line -match 'item_wbs:\s*"(.+)"') { $itemWBS = $matches[1] }
                if ($line -match 'cambios_cronograma:') { $enCambiosCrono = $true }
                
                if ($enCambiosCrono) {
                    if ($line -match 'codigo:\s*"(.+)"') { $codigo = $matches[1] }
                    if ($line -match 'nombre:\s*"(.+)"') { $nombre = $matches[1] }
                    if ($line -match 'duracion_meses:\s*(\d+)') { $duracion = [int]$matches[1] }
                    if ($line -match 'inicio:\s*"(.+)"') { $inicio = $matches[1] }
                }
            }
        }
        
        # Si encontramos datos, agregar actividad
        if ($codigo -and $nombre) {
            # Verificar si ya existe
            $existe = $cronograma.actividades | Where-Object { $_.codigo -eq $codigo }
            
            if (-not $existe) {
                Write-Host "   [OK] Agregando: $nombre ($codigo)" -ForegroundColor Green
                
                $nuevaActividad = @{
                    codigo = $codigo
                    nombre = $nombre
                    inicio = $inicio
                    duracion_meses = $duracion
                    tipo = "ADQUISICION"
                    criticidad = "CRÍTICA"
                    dt_origen = ($dtFile.Name -replace '.md','')
                }
                
                $cronograma.actividades = @($cronograma.actividades) + $nuevaActividad
                $actividadesAgregadas++
            } else {
                Write-Host "   [SKIP] Ya existe: $codigo" -ForegroundColor Yellow
            }
        }
    }
}

# Guardar si hay cambios
if ($actividadesAgregadas -gt 0) {
    Write-Host ""
    Write-Host "Guardando cronograma..." -ForegroundColor Yellow
    $cronograma | ConvertTo-Json -Depth 20 | Set-Content $rutaCronograma -Encoding UTF8
    Write-Host "[OK] JSON guardado" -ForegroundColor Green
    
    # Regenerar JS
    $fecha = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $jsContent = @"
// Datos de cronograma generados automáticamente
// Fecha: $fecha
// Fuente: cronograma_datos.json

window.cronogramaData = $($cronograma | ConvertTo-Json -Depth 20 -Compress);
"@
    
    $jsContent | Set-Content $rutaCronogramaJS -Encoding UTF8
    Write-Host "[OK] JS generado" -ForegroundColor Green
}

# Resumen
Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host "  AJUSTE COMPLETADO" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Actividades agregadas: $actividadesAgregadas" -ForegroundColor Cyan
Write-Host "Total actividades: $($cronograma.actividades.Count)" -ForegroundColor Cyan
Write-Host ""

if ($actividadesAgregadas -gt 0) {
    Write-Host "[OK] Cronograma actualizado" -ForegroundColor Green
    Write-Host "Recarga WBS_Cronograma_Propuesta.html (Ctrl+F5)" -ForegroundColor Cyan
}
Write-Host ""
