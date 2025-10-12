# ================================================================
#  VALIDACION: Layout vs Decisiones Tecnicas
#  Detecta inconsistencias entre layout.md y DTs ejecutadas
# ================================================================

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  VALIDACION DE LAYOUT vs DECISIONES TECNICAS" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

# ================================================================
# ESTADO ESPERADO SEGUN DTs EJECUTADAS
# ================================================================

$estadoEsperado = @{
    "Estaciones_Ferroviarias" = 26
    "Torres_TETRA" = 37
    "RBC_ETCS" = 5
    "Balizas_Eurobalise" = 0  # DT-CTC-001: Filosofia virtual
    "ATP_Embarcado" = 8  # DT-TETRA-001: Reducido de 15
    "Puentes_Prioritarios" = 4
    "Subestaciones_Electricas" = 11
    "CTC_Puestos" = 11
}

Write-Host "Estado esperado segun DTs:" -ForegroundColor Yellow
$estadoEsperado.GetEnumerator() | Sort-Object Name | ForEach-Object {
    Write-Host "  $($_.Key): $($_.Value)" -ForegroundColor White
}
Write-Host ""

# ================================================================
# LEER Y ANALIZAR LAYOUT.MD ACTUAL
# ================================================================

Write-Host "Analizando layout.md actual..." -ForegroundColor Yellow

$layoutActual = Get-Content "layout.md" -Encoding UTF8
$filasLayout = $layoutActual | Select-Object -Skip 238 | Where-Object { $_ -match '^\| UFV' }

Write-Host "Filas totales en layout: $($filasLayout.Count)" -ForegroundColor Green
Write-Host ""

# Contar por dispositivo
$equiposReales = @{}

foreach ($fila in $filasLayout) {
    $columnas = ($fila -replace '^\||\|$', '' -split '\|') | ForEach-Object { $_.Trim() }
    
    if ($columnas.Count -ge 9) {
        $dispositivo = $columnas[8]  # Columna "Dispositivo"
        
        if (-not $equiposReales.ContainsKey($dispositivo)) {
            $equiposReales[$dispositivo] = 0
        }
        $equiposReales[$dispositivo]++
    }
}

Write-Host "Top 15 dispositivos encontrados:" -ForegroundColor Yellow
$equiposReales.GetEnumerator() | Sort-Object Value -Descending | Select-Object -First 15 | ForEach-Object {
    Write-Host "  $($_.Key): $($_.Value)" -ForegroundColor White
}
Write-Host ""

# ================================================================
# DETECTAR INCONSISTENCIAS
# ================================================================

Write-Host "================================================================" -ForegroundColor Red
Write-Host "  REPORTE DE INCONSISTENCIAS" -ForegroundColor Red
Write-Host "================================================================" -ForegroundColor Red
Write-Host ""

$inconsistencias = @()

# Validar Balizas
$balizasEnLayout = if ($equiposReales.ContainsKey("Eurobalise")) { $equiposReales["Eurobalise"] } else { 0 }
if ($balizasEnLayout -gt 0) {
    $inconsistencias += @{
        Equipo = "Balizas Eurobalise"
        Esperado = 0
        Real = $balizasEnLayout
        Problema = "Filosofia VIRTUAL segun DT-CTC-001 - Balizas NO deberian estar"
        Accion = "ELIMINAR $balizasEnLayout filas de balizas"
        Critico = $true
    }
}

# Validar TETRA
$tetraEnLayout = if ($equiposReales.ContainsKey("TETRA BS")) { $equiposReales["TETRA BS"] } else { 0 }
if ($tetraEnLayout -ne 37) {
    $inconsistencias += @{
        Equipo = "Estaciones TETRA"
        Esperado = 37
        Real = $tetraEnLayout
        Problema = "Cantidad no coincide con DT-TETRA-001"
        Accion = "Ajustar a 37 estaciones"
        Critico = $false
    }
}

# Validar Estaciones
$estacionesEnLayout = ($equiposReales.GetEnumerator() | Where-Object { $_.Key -like "*Estacion*" -or $_.Key -like "*Apeadero*" }).Count
if ($estacionesEnLayout -ne 26) {
    Write-Host "ADVERTENCIA: Cantidad de estaciones puede no ser exacta" -ForegroundColor Yellow
    Write-Host "  (Revision manual recomendada)" -ForegroundColor Gray
}

# Validar RBC
$rbcEnLayout = if ($equiposReales.ContainsKey("RBC ETCS L2")) { $equiposReales["RBC ETCS L2"] } else { 0 }
if ($rbcEnLayout -ne 5) {
    $inconsistencias += @{
        Equipo = "RBC ETCS"
        Esperado = 5
        Real = $rbcEnLayout
        Problema = "Deberian ser 5 RBC segun diseno"
        Accion = "Verificar cantidad de RBC"
        Critico = $false
    }
}

# Mostrar inconsistencias
if ($inconsistencias.Count -eq 0) {
    Write-Host "RESULTADO: NO SE ENCONTRARON INCONSISTENCIAS CRITICAS" -ForegroundColor Green
    Write-Host ""
} else {
    Write-Host "ENCONTRADAS $($inconsistencias.Count) INCONSISTENCIAS:" -ForegroundColor Red
    Write-Host ""
    
    foreach ($inc in $inconsistencias) {
        if ($inc.Critico) {
            Write-Host "CRITICO: $($inc.Equipo)" -ForegroundColor Red
        } else {
            Write-Host "ADVERTENCIA: $($inc.Equipo)" -ForegroundColor Yellow
        }
        Write-Host "  Esperado (DTs): $($inc.Esperado)" -ForegroundColor Gray
        Write-Host "  Real (layout): $($inc.Real)" -ForegroundColor Gray
        Write-Host "  Problema: $($inc.Problema)" -ForegroundColor White
        Write-Host "  Accion: $($inc.Accion)" -ForegroundColor Cyan
        Write-Host ""
    }
}

# ================================================================
# ESTRUCTURA RECOMENDADA
# ================================================================

Write-Host "================================================================" -ForegroundColor Green
Write-Host "  ESTRUCTURA RECOMENDADA DEL PROYECTO" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""

Write-Host "EDIFICACIONES (26 estaciones):" -ForegroundColor Cyan
Write-Host "  Cada estacion principal incluye:" -ForegroundColor White
Write-Host "    - Edificio estacion" -ForegroundColor Gray
Write-Host "    - Torre TETRA" -ForegroundColor Gray
Write-Host "    - Subestacion electrica" -ForegroundColor Gray
Write-Host "    - UPS" -ForegroundColor Gray
Write-Host "    - CTC Local" -ForegroundColor Gray
Write-Host "    - Camaras CCTV (3-5 unidades)" -ForegroundColor Gray
Write-Host "    - Nodo Fibra Optica" -ForegroundColor Gray
Write-Host "    - Desvios motorizados" -ForegroundColor Gray
Write-Host ""

Write-Host "INFRAESTRUCTURA (4 puentes prioritarios):" -ForegroundColor Cyan
Write-Host "  1. Rio Magdalena (PK 332+230 a 332+817)" -ForegroundColor White
Write-Host "  2. Rio Carare (PK 354+348 a 375+928)" -ForegroundColor White
Write-Host "  3. Rio Cuatro Bocas (PK 432+178 a 432+223)" -ForegroundColor White
Write-Host "  4. Rio Sogamoso (PK 465+200 a 465+353)" -ForegroundColor White
Write-Host ""
Write-Host "  Cada puente incluye:" -ForegroundColor White
Write-Host "    - Camaras CCTV PTZ (4-6 unidades)" -ForegroundColor Gray
Write-Host "    - Detectores sismicos" -ForegroundColor Gray
Write-Host "    - Detectores socavacion" -ForegroundColor Gray
Write-Host "    - Senalizacion proteccion" -ForegroundColor Gray
Write-Host ""

Write-Host "SISTEMAS DISTRIBUIDOS:" -ForegroundColor Cyan
Write-Host "  - Red TETRA: 37 nodos cada ~12 km" -ForegroundColor White
Write-Host "  - Red Fibra Optica: ~40 empalmes cada ~10 km" -ForegroundColor White
Write-Host "  - Sistema Electrico: 11 subestaciones" -ForegroundColor White
Write-Host "  - Sistema ETCS: 5 RBC + 0 balizas (virtual)" -ForegroundColor White
Write-Host ""

Write-Host "================================================================" -ForegroundColor Green
Write-Host "  SIGUIENTE PASO: Crear estructura jerarquica (JSON)" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Ejecuta: .\scripts\crear_layout_jerarquico.ps1" -ForegroundColor Yellow
Write-Host ""

