# SCRIPT: Generar Ficha Completa de Estación
# Fecha: 11 Octubre 2025
# Propósito: Crear ficha técnica completa de una estación con todo lo que hay que hacer

param(
    [Parameter(Mandatory=$false)]
    [string]$EstacionPK = "338+250"  # Por defecto Puerto Olaya
)

Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "  FICHA TECNICA COMPLETA DE ESTACION            " -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""

# Definir estaciones principales
$estaciones = @{
    "201+470" = @{
        nombre = "Mexico"
        tipo = "Terminal Sur"
        ufv = "UFV 23"
        tiene_taller = $false
        tiene_cco = $false
        tiene_rbc = $true
    }
    "250+133" = @{
        nombre = "Puerto Triunfo"
        tipo = "Estacion Principal"
        ufv = "UFV 30"
        tiene_taller = $false
        tiene_cco = $false
        tiene_rbc = $false
    }
    "282+154" = @{
        nombre = "La Argelia"
        tipo = "Estacion Principal"
        ufv = "UFV 31"
        tiene_taller = $false
        tiene_cco = $false
        tiene_rbc = $true
    }
    "338+250" = @{
        nombre = "Puerto Olaya"
        tipo = "Estacion Principal"
        ufv = "UFV 03"
        tiene_taller = $false
        tiene_cco = $false
        tiene_rbc = $false
    }
    "441+932" = @{
        nombre = "B/Bermejo"
        tipo = "CCO + Taller Pesado"
        ufv = "UFV 40/41"
        tiene_taller = $true
        tiene_cco = $true
        tiene_rbc = $true
    }
    "462+520" = @{
        nombre = "Garcia Cadena"
        tipo = "Estacion Principal"
        ufv = "UFV 44"
        tiene_taller = $false
        tiene_cco = $false
        tiene_rbc = $true
    }
    "516+490" = @{
        nombre = "San Rafael"
        tipo = "Estacion Principal"
        ufv = "UFV 46"
        tiene_taller = $false
        tiene_cco = $false
        tiene_rbc = $false
    }
    "569+800" = @{
        nombre = "Santa Lucia"
        tipo = "Estacion Principal"
        ufv = "UFV 49"
        tiene_taller = $false
        tiene_cco = $false
        tiene_rbc = $true
    }
    "604+265" = @{
        nombre = "Gamarra"
        tipo = "Estacion Principal"
        ufv = "UFV 52"
        tiene_taller = $false
        tiene_cco = $false
        tiene_rbc = $true
    }
    "635+991" = @{
        nombre = "La Gloria"
        tipo = "Estacion Principal"
        ufv = "UFV 54"
        tiene_taller = $false
        tiene_cco = $false
        tiene_rbc = $false
    }
    "722+250" = @{
        nombre = "Chiriguana"
        tipo = "Terminal Norte + Taller Liviano"
        ufv = "UFV 22"
        tiene_taller = $true
        tiene_cco = $false
        tiene_rbc = $false
    }
}

if (-not $estaciones.ContainsKey($EstacionPK)) {
    Write-Host "ERROR: Estacion PK $EstacionPK no encontrada" -ForegroundColor Red
    Write-Host "Estaciones disponibles:" -ForegroundColor Yellow
    $estaciones.Keys | Sort-Object | ForEach-Object { Write-Host "  - $_" -ForegroundColor White }
    exit 1
}

$estacion = $estaciones[$EstacionPK]

Write-Host "ESTACION: $($estacion.nombre)" -ForegroundColor Green
Write-Host "PK: $EstacionPK" -ForegroundColor White
Write-Host "Tipo: $($estacion.tipo)" -ForegroundColor White
Write-Host "UFV: $($estacion.ufv)" -ForegroundColor White
Write-Host ""

# KIT ESTANDAR DE EQUIPOS
$kitEquipos = @(
    @{ categoria = "Edificacion"; equipo = "Estacion Clase A"; cantidad = 1; costo_m = 4500 },
    @{ categoria = "Energia"; equipo = "Subestacion MT/BT"; cantidad = 1; costo_m = 1500 },
    @{ categoria = "Energia"; equipo = "UPS 30kVA"; cantidad = 1; costo_m = 80 },
    @{ categoria = "Energia"; equipo = "Generador 200kVA"; cantidad = 1; costo_m = 150 },
    @{ categoria = "Control"; equipo = "Puesto CTC Local"; cantidad = 1; costo_m = 500 },
    @{ categoria = "Telecomunicaciones"; equipo = "Estacion Base TETRA"; cantidad = 1; costo_m = 300 },
    @{ categoria = "Telecomunicaciones"; equipo = "Nodo Fibra Optica ODF 48"; cantidad = 1; costo_m = 50 },
    @{ categoria = "Telecomunicaciones"; equipo = "Switch Distribucion L2/L3"; cantidad = 1; costo_m = 30 },
    @{ categoria = "Seguridad ITS"; equipo = "Camara CCTV Entrada (PTZ)"; cantidad = 1; costo_m = 25 },
    @{ categoria = "Seguridad ITS"; equipo = "Camaras CCTV Andenes (Fijas)"; cantidad = 2; costo_m = 15 },
    @{ categoria = "Senalizacion"; equipo = "Senales LED Entrada/Salida"; cantidad = 2; costo_m = 40 },
    @{ categoria = "Senalizacion"; equipo = "Balizas ETCS"; cantidad = 3; costo_m = 15 },
    @{ categoria = "Via"; equipo = "Desvios Motorizados"; cantidad = 2; costo_m = 80 }
)

# Si tiene RBC, agregar
if ($estacion.tiene_rbc) {
    $kitEquipos += @{ categoria = "Control"; equipo = "RBC ETCS Level 2"; cantidad = 1; costo_m = 800 }
}

# Si tiene CCO, agregar equipos adicionales
if ($estacion.tiene_cco) {
    $kitEquipos += @{ categoria = "Control"; equipo = "Centro Control Maestro (CCO)"; cantidad = 1; costo_m = 2000 }
    $kitEquipos += @{ categoria = "Edificacion"; equipo = "Edificio CCO (adicional)"; cantidad = 1; costo_m = 3000 }
}

# Si tiene taller, agregar
if ($estacion.tiene_taller) {
    $kitEquipos += @{ categoria = "Edificacion"; equipo = "Taller Mantenimiento"; cantidad = 1; costo_m = 5000 }
    $kitEquipos += @{ categoria = "Mecanica"; equipo = "Equipos Taller"; cantidad = 1; costo_m = 1000 }
}

Write-Host "KIT DE EQUIPOS ($($kitEquipos.Count) items):" -ForegroundColor Cyan
Write-Host ""

$costoTotal = 0
foreach ($item in $kitEquipos) {
    $costoItem = $item.cantidad * $item.costo_m
    $costoTotal += $costoItem
    Write-Host "  $($item.categoria) - $($item.equipo)" -ForegroundColor White
    Write-Host "    Cantidad: $($item.cantidad) | Costo: $($costoItem)M COP" -ForegroundColor Gray
}

Write-Host ""
Write-Host "COSTO TOTAL EQUIPOS: $($costoTotal)M COP" -ForegroundColor Green
Write-Host ""

# TAREAS A EJECUTAR (5 fases)
Write-Host "TAREAS A EJECUTAR (5 FASES):" -ForegroundColor Cyan
Write-Host ""

$tareas = @(
    @{
        fase = "FASE 1: INGENIERIA"
        duracion = "12 meses"
        tareas = @(
            "Levantamiento topografico (2 semanas)",
            "Estudio geotecnico (2 semanas)",
            "Levantamiento predial (2 semanas)",
            "Diseno arquitectonico (4 semanas)",
            "Diseno estructural (4 semanas)",
            "Diseno electrico (3 semanas)",
            "Diseno hidrosanitario (2 semanas)",
            "Diseno sistemas ferroviarios (4 semanas)",
            "Modelo BIM LOD 300 (8 semanas)",
            "Planos constructivos (8 semanas)",
            "Especificaciones tecnicas (4 semanas)"
        )
    },
    @{
        fase = "FASE 2: OBRA CIVIL"
        duracion = "24 meses"
        tareas = @(
            "Cerramiento provisional (1 semana)",
            "Campamento temporal (1 semana)",
            "Demoliciones si aplica (2 semanas)",
            "Excavaciones (2 semanas)",
            "Fundaciones (4 semanas)",
            "Estructura metalica/concreto (8 semanas)",
            "Losa de entrepiso (2 semanas)",
            "Cubierta (3 semanas)",
            "Mamposteria (4 semanas)",
            "Enchapes y pisos (3 semanas)",
            "Carpinteria metalica (2 semanas)",
            "Pintura (2 semanas)"
        )
    },
    @{
        fase = "FASE 3: INSTALACIONES"
        duracion = "12 meses"
        tareas = @(
            "Acometida MT (2 semanas)",
            "Subestacion MT/BT (3 semanas)",
            "Canalizacion electrica (4 semanas)",
            "Cableado de potencia (3 semanas)",
            "Tableros y protecciones (2 semanas)",
            "UPS + Generador (2 semanas)",
            "Red agua potable (2 semanas)",
            "Red sanitaria (2 semanas)",
            "Red contra incendio (2 semanas)",
            "Aparatos sanitarios (1 semana)"
        )
    },
    @{
        fase = "FASE 4: SISTEMAS FERROVIARIOS"
        duracion = "14 meses"
        tareas = @(
            "Cuarto tecnico CTC (2 semanas)",
            "Instalacion puesto CTC (2 semanas)",
            "RBC si aplica (3 semanas)",
            "Cableado de control (3 semanas)",
            "Configuracion software (2 semanas)",
            "Torre TETRA si aplica (3 semanas)",
            "Estacion Base TETRA (2 semanas)",
            "Nodo Fibra Optica (2 semanas)",
            "Empalmes fibra (1 semana)",
            "Switch de red (1 semana)",
            "Pruebas de comunicacion (2 semanas)",
            "Postes para camaras (1 semana)",
            "Instalacion camaras CCTV (2 semanas)",
            "Cableado de datos (2 semanas)",
            "Grabadores NVR (1 semana)",
            "Integracion con CTC (2 semanas)",
            "Senales LED (2 semanas)",
            "Balizas ETCS (2 semanas)",
            "Desvios motorizados (3 semanas)"
        )
    },
    @{
        fase = "FASE 5: PRUEBAS Y PUESTA"
        duracion = "4 meses"
        tareas = @(
            "Pruebas FAT (Factory) (2 semanas)",
            "Pruebas SAT (Site) (2 semanas)",
            "Pruebas electricas (1 semana)",
            "Pruebas CTC (1 semana)",
            "Pruebas TETRA (1 semana)",
            "Pruebas CCTV (1 semana)",
            "Pruebas End-to-End (2 semanas)",
            "Capacitacion personal (2 semanas)",
            "Ajustes finales (1 semana)",
            "Documentacion as-built (2 semanas)",
            "Acta de Recibo Provisional (1 dia)",
            "Puesta en operacion (1 semana)"
        )
    }
)

foreach ($grupo in $tareas) {
    Write-Host "$($grupo.fase) ($($grupo.duracion))" -ForegroundColor Yellow
    foreach ($tarea in $grupo.tareas) {
        Write-Host "  - $tarea" -ForegroundColor White
    }
    Write-Host ""
}

$totalTareas = ($tareas | ForEach-Object { $_.tareas.Count } | Measure-Object -Sum).Sum
Write-Host "TOTAL TAREAS: $totalTareas" -ForegroundColor Green
Write-Host ""

# GENERAR ARCHIVO JSON
$fichaCompleta = @{
    estacion = @{
        nombre = $estacion.nombre
        pk = $EstacionPK
        tipo = $estacion.tipo
        ufv = $estacion.ufv
        tiene_taller = $estacion.tiene_taller
        tiene_cco = $estacion.tiene_cco
        tiene_rbc = $estacion.tiene_rbc
    }
    kit_equipos = $kitEquipos
    costo_total_equipos_millones = $costoTotal
    tareas = $tareas
    total_tareas = $totalTareas
    duracion_total = "48 meses"
    personal_pico = "40-50 personas"
    horas_hombre = 213000
}

$outputPath = "VIII. Documentos Maestros y Metodologia"
$jsonFile = "$outputPath/FICHA_ESTACION_$($estacion.nombre.Replace(' ','_'))_$($EstacionPK.Replace('+','')).json"

$fichaCompleta | ConvertTo-Json -Depth 10 | Out-File $jsonFile -Encoding UTF8

Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "FICHA COMPLETA GENERADA" -ForegroundColor Green
Write-Host "Archivo: $jsonFile" -ForegroundColor White
Write-Host "=================================================" -ForegroundColor Cyan

