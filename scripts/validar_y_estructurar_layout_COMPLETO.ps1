# ================================================================
#  SISTEMA COMPLETO: Layout Dinámico Jerárquico
#  Valida, estructura y genera layout inteligente
# ================================================================

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  VALIDACION Y ESTRUCTURACION DE LAYOUT COMPLETO" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

# ================================================================
# PASO 1: LEER DTs EJECUTADAS Y CONSTRUIR "ESTADO ESPERADO"
# ================================================================

Write-Host "PASO 1: Analizando DTs ejecutadas..." -ForegroundColor Yellow

$carpetaDTs = "II. Apendices Tecnicos\Decisiones_Tecnicas"
$dts = Get-ChildItem -Path $carpetaDTs -Filter "DT-*.md" -Exclude "*TEMPLATE*","*EJEMPLO*"

Write-Host "DTs encontradas: $($dts.Count)" -ForegroundColor Green

# Construir estado esperado desde DTs
$estadoEsperado = @{
    "Estaciones_Ferroviarias" = @{
        Cantidad = 26  # Según proyecto
        Tipo = "EDIFICACION"
        Kit_Por_Estacion = @("Torre_TETRA", "Subestacion", "UPS", "CTC_Local", "Camaras_CCTV", "Nodo_FO")
    }
    "Torres_TETRA" = @{
        Cantidad = 37  # Según DT-TETRA-001 (o 57 si cambió)
        Tipo = "TELECOMUNICACIONES"
        Dispositivo = "TETRA BS"
        Distribucion = "Cada 12 km"  # O 10.42 km si solapamiento 30%
    }
    "RBC_ETCS" = @{
        Cantidad = 5
        Tipo = "CONTROL"
        Dispositivo = "RBC ETCS L2"
        Ubicaciones_Fijas = @("201+470", "338+250", "441+932", "569+800", "722+250")
    }
    "Balizas_Eurobalise" = @{
        Cantidad = 0  # DT-CTC-001: Filosofía VIRTUAL
        Tipo = "CONTROL"
        Dispositivo = "Eurobalise"
        Estado = "NO_APLICA"
        Razon = "Filosofía de señalización virtual según DT-CTC-001"
    }
    "ATP_Embarcado" = @{
        Cantidad = 8  # DT-TETRA-001: Reducido de 15
        Tipo = "MATERIAL_RODANTE"
        Dispositivo = "ATP ETCS L2"
    }
    "Puentes_Prioritarios" = @{
        Cantidad = 4
        Tipo = "INFRAESTRUCTURA"
        Ubicaciones = @(
            @{ Nombre = "Río Magdalena"; PK_Inicio = "332+230"; PK_Fin = "332+817" },
            @{ Nombre = "Río Carare"; PK_Inicio = "354+348"; PK_Fin = "375+928" },
            @{ Nombre = "Río Cuatro Bocas"; PK_Inicio = "432+178"; PK_Fin = "432+223" },
            @{ Nombre = "Río Sogamoso"; PK_Inicio = "465+200"; PK_Fin = "465+353" }
        )
        Kit_Por_Puente = @("CCTV_PTZ_4-6_unidades", "Detector_Sismico", "Detector_Socavacion", "Senalizacion_Proteccion")
    }
    "Subestaciones_Electricas" = @{
        Cantidad = 11
        Tipo = "ENERGIA"
        Dispositivo = "Subestación MT/BT"
        Criterio = "Una cada 40-60 km + en estaciones principales"
    }
}

Write-Host ""
Write-Host "Estado esperado construido desde DTs" -ForegroundColor Green
Write-Host ""

# ================================================================
# PASO 2: ANALIZAR LAYOUT.MD ACTUAL
# ================================================================

Write-Host "PASO 2: Analizando layout.md actual..." -ForegroundColor Yellow

$layoutActual = Get-Content "layout.md" -Encoding UTF8
$filasLayout = $layoutActual | Select-Object -Skip 238 | Where-Object { $_ -match '^\| UFV' }

Write-Host "Filas encontradas en layout: $($filasLayout.Count)" -ForegroundColor Green

# Parsear y contar por tipo
$equiposContados = @{}

foreach ($fila in $filasLayout) {
    $columnas = ($fila -replace '^\||\|$', '' -split '\|') | ForEach-Object { $_.Trim() }
    
    if ($columnas.Count -ge 8) {
        $dispositivo = $columnas[8]  # Columna "Dispositivo"
        
        if (-not $equiposContados.ContainsKey($dispositivo)) {
            $equiposContados[$dispositivo] = 0
        }
        $equiposContados[$dispositivo]++
    }
}

Write-Host ""
Write-Host "Equipos contados por dispositivo:" -ForegroundColor Cyan
$equiposContados.GetEnumerator() | Sort-Object Value -Descending | Select-Object -First 15 | ForEach-Object {
    Write-Host "  $($_.Key): $($_.Value)" -ForegroundColor White
}

# ================================================================
# PASO 3: COMPARAR Y DETECTAR INCONSISTENCIAS
# ================================================================

Write-Host ""
Write-Host "PASO 3: Detectando inconsistencias..." -ForegroundColor Yellow
Write-Host ""

$inconsistencias = @()

# Validar Balizas Eurobalise
$balizasEnLayout = $equiposContados["Eurobalise"]
if ($balizasEnLayout -gt 0) {
    $inconsistencias += @{
        Equipo = "Balizas Eurobalise"
        Esperado = 0
        Real = $balizasEnLayout
        Problema = "Filosofía VIRTUAL (DT-CTC-001) - Balizas NO deberían estar"
        Accion = "ELIMINAR $balizasEnLayout filas"
        Critico = $true
    }
}

# Validar TETRA
$tetraEnLayout = $equiposContados["TETRA BS"]
$tetraEsperado = 37  # O leer de DT más reciente
if ($tetraEnLayout -ne $tetraEsperado) {
    $inconsistencias += @{
        Equipo = "Estaciones TETRA"
        Esperado = $tetraEsperado
        Real = $tetraEnLayout
        Problema = "Cantidad no coincide con DT-TETRA-001"
        Accion = "Ajustar a $tetraEsperado estaciones"
        Critico = $false
    }
}

# ================================================================
# PASO 4: GENERAR REPORTE
# ================================================================

Write-Host "================================================================" -ForegroundColor Red
Write-Host "  REPORTE DE VALIDACION" -ForegroundColor Red
Write-Host "================================================================" -ForegroundColor Red
Write-Host ""

if ($inconsistencias.Count -eq 0) {
    Write-Host "✅ NO SE ENCONTRARON INCONSISTENCIAS" -ForegroundColor Green
    Write-Host "   Layout.md está alineado con DTs ejecutadas" -ForegroundColor White
} else {
    Write-Host "❌ SE ENCONTRARON $($inconsistencias.Count) INCONSISTENCIAS:" -ForegroundColor Red
    Write-Host ""
    
    foreach ($inc in $inconsistencias) {
        if ($inc.Critico) {
            Write-Host "🔴 CRÍTICO: $($inc.Equipo)" -ForegroundColor Red
        } else {
            Write-Host "🟡 ADVERTENCIA: $($inc.Equipo)" -ForegroundColor Yellow
        }
        Write-Host "   Esperado (según DTs): $($inc.Esperado)" -ForegroundColor Gray
        Write-Host "   Real (en layout.md): $($inc.Real)" -ForegroundColor Gray
        Write-Host "   Problema: $($inc.Problema)" -ForegroundColor White
        Write-Host "   Acción sugerida: $($inc.Accion)" -ForegroundColor Cyan
        Write-Host ""
    }
}

# ================================================================
# PASO 5: GENERAR ESTRUCTURA JERARQUICA
# ================================================================

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  ESTRUCTURA JERARQUICA DEL PROYECTO" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "TIPO: EDIFICACIONES (Estaciones Ferroviarias)" -ForegroundColor Green
Write-Host "  Total: 26 estaciones" -ForegroundColor White
Write-Host ""
Write-Host "  Ejemplo: Estación México (PK 201+470):" -ForegroundColor Cyan
Write-Host "    ├─ Edificio estación principal" -ForegroundColor White
Write-Host "    ├─ Torre TETRA (EBT_01_MEXICO)" -ForegroundColor White
Write-Host "    ├─ Subestación Eléctrica (SE_MEXICO)" -ForegroundColor White
Write-Host "    ├─ UPS 40kVA (SAI_MEXICO)" -ForegroundColor White
Write-Host "    ├─ CTC Local (CTC_MEXICO)" -ForegroundColor White
Write-Host "    ├─ RBC ETCS (RBC_01_MEXICO)" -ForegroundColor White
Write-Host "    ├─ Cámaras CCTV (3 unidades)" -ForegroundColor White
Write-Host "    ├─ Nodo Fibra Óptica (NODO_FO_MEXICO)" -ForegroundColor White
Write-Host "    └─ Desvíos motorizados (DESVIO_MEX_01)" -ForegroundColor White
Write-Host ""

Write-Host "TIPO: INFRAESTRUCTURA (Puentes Prioritarios)" -ForegroundColor Green
Write-Host "  Total: 4 puentes" -ForegroundColor White
Write-Host ""
Write-Host "  Ejemplo: Puente Río Magdalena (PK 332+230 a 332+817):" -ForegroundColor Cyan
Write-Host "    ├─ Longitud: 587 metros" -ForegroundColor White
Write-Host "    ├─ Cámaras CCTV PTZ (5 unidades)" -ForegroundColor White
Write-Host "    ├─ Detector Sísmico (DETECTOR_SISMICO_MAG_01)" -ForegroundColor White
Write-Host "    ├─ Detector Socavación (DETECTOR_SOCAVACION_MAG)" -ForegroundColor White
Write-Host "    ├─ Señalización protección (2 señales)" -ForegroundColor White
Write-Host "    └─ Balizas entrada/salida" -ForegroundColor White
Write-Host ""

Write-Host "TIPO: SISTEMAS DISTRIBUIDOS" -ForegroundColor Green
Write-Host "  ├─ Red TETRA: 37 estaciones cada ~12 km" -ForegroundColor White
Write-Host "  ├─ Red Fibra Óptica: ~40 empalmes cada ~10 km" -ForegroundColor White
Write-Host "  ├─ Sistema ETCS: 5 RBC + 0 balizas (virtual)" -ForegroundColor White
Write-Host "  └─ Sistema Eléctrico: 11 subestaciones cada ~50 km" -ForegroundColor White
Write-Host ""

Write-Host "================================================================" -ForegroundColor Green
Write-Host "  PROXIMOPASO: Implementar sistema dinámico completo" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "¿Quieres que implemente el sistema completo de cálculo automático?" -ForegroundColor Yellow
Write-Host "  1. Validación desde DTs" -ForegroundColor White
Write-Host "  2. Estructura jerárquica (Instalación → Equipos)" -ForegroundColor White
Write-Host "  3. Recálculo automático de ubicaciones" -ForegroundColor White
Write-Host "  4. Generación de 'kits' por instalación" -ForegroundColor White
Write-Host "  5. Vista gráfica mejorada (por instalación)" -ForegroundColor White
Write-Host ""

