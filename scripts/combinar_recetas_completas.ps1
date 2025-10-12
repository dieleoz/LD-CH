# COMBINADOR DE RECETAS COMPLETAS
# Combina todos los ingredientes extraídos de AT1-AT10
# Version: 1.0 | Fecha: 10 Octubre 2025

Write-Host "COMBINADOR DE RECETAS COMPLETAS" -ForegroundColor Cyan
Write-Host "=================================" -ForegroundColor Cyan
Write-Host ""

$outputPath = "VIII. Documentos Maestros y Metodologia"

# Verificar que existen todos los archivos de ingredientes
$archivosIngredientes = @(
    "$outputPath/INGREDIENTES_AT1_v1.0.json",
    "$outputPath/INGREDIENTES_AT2_v1.0.json", 
    "$outputPath/INGREDIENTES_AT4_v1.0.json",
    "$outputPath/INGREDIENTES_AT5_v1.0.json"
)

Write-Host "Verificando ingredientes extraidos..." -ForegroundColor Yellow
$ingredientesDisponibles = @()

foreach ($archivo in $archivosIngredientes) {
    if (Test-Path $archivo) {
        $nombre = Split-Path $archivo -Leaf
        $size = [math]::Round((Get-Item $archivo).Length / 1KB, 1)
        Write-Host "  OK $nombre ($size KB)" -ForegroundColor Green
        $ingredientesDisponibles += $archivo
    } else {
        Write-Host "  ERROR $archivo - NO ENCONTRADO" -ForegroundColor Red
    }
}

if ($ingredientesDisponibles.Count -eq 0) {
    Write-Host ""
    Write-Host "ERROR: No se encontraron ingredientes" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Combinando ingredientes..." -ForegroundColor Yellow

# Cargar ingredientes de cada AT
$ingredientesAT1 = @{}
$ingredientesAT2 = @{}
$ingredientesAT4 = @{}
$ingredientesAT5 = @{}

if (Test-Path "$outputPath/INGREDIENTES_AT1_v1.0.json") {
    $contenidoAT1 = Get-Content "$outputPath/INGREDIENTES_AT1_v1.0.json" -Raw
    $ingredientesAT1 = $contenidoAT1 | ConvertFrom-Json
    Write-Host "  AT1 cargado: $($ingredientesAT1.ufvf.Count) UFVF, $($ingredientesAT1.puentes.Count) puentes" -ForegroundColor Green
}

if (Test-Path "$outputPath/INGREDIENTES_AT2_v1.0.json") {
    $contenidoAT2 = Get-Content "$outputPath/INGREDIENTES_AT2_v1.0.json" -Raw
    $ingredientesAT2 = $contenidoAT2 | ConvertFrom-Json
    Write-Host "  AT2 cargado: $($ingredientesAT2.ctc.Count) CTC, $($ingredientesAT2.sistemas_control.Count) sistemas" -ForegroundColor Green
}

if (Test-Path "$outputPath/INGREDIENTES_AT4_v1.0.json") {
    $contenidoAT4 = Get-Content "$outputPath/INGREDIENTES_AT4_v1.0.json" -Raw
    $ingredientesAT4 = $contenidoAT4 | ConvertFrom-Json
    Write-Host "  AT4 cargado: $($ingredientesAT4.redes.Count) redes, $($ingredientesAT4.telecomunicaciones.Count) telecomunicaciones" -ForegroundColor Green
}

if (Test-Path "$outputPath/INGREDIENTES_AT5_v1.0.json") {
    $contenidoAT5 = Get-Content "$outputPath/INGREDIENTES_AT5_v1.0.json" -Raw
    $ingredientesAT5 = $contenidoAT5 | ConvertFrom-Json
    Write-Host "  AT5 cargado: $($ingredientesAT5.seguridad.Count) seguridad, $($ingredientesAT5.sistemas_its.Count) ITS" -ForegroundColor Green
}

# Crear receta combinada completa
$recetaCombinada = @{
    metadata = @{
        version = "1.0"
        fecha = "2025-10-10"
        descripcion = "Receta combinada de todos los ATs del contrato"
        total_ingredientes = 0
    }
    
    infraestructura_fisica = @{
        ufvf = @()
        uf = @()
        puentes = @()
        estaciones = @()
        apartaderos = @()
        escuelas = @()
        pasos_nivel = @()
    }
    
    sistemas_tecnicos = @{
        control_senalizacion = @()
        telecomunicaciones = @()
        its_seguridad = @()
        material_rodante = @()
    }
    
    especificaciones = @{
        normas = @()
        tipologias = @()
        criterios = @()
        metodos = @()
    }
    
    cronograma = @{
        fases = @()
        hitos = @()
        dependencias = @()
    }
    
    operacion = @{
        mantenimiento = @()
        procedimientos = @()
        reversion = @()
    }
}

# Combinar ingredientes de AT1 (Infraestructura)
if ($ingredientesAT1.ufvf) {
    $recetaCombinada.infraestructura_fisica.ufvf = $ingredientesAT1.ufvf
}
if ($ingredientesAT1.uf) {
    $recetaCombinada.infraestructura_fisica.uf = $ingredientesAT1.uf
}
if ($ingredientesAT1.puentes) {
    $recetaCombinada.infraestructura_fisica.puentes = $ingredientesAT1.puentes
}
if ($ingredientesAT1.estaciones) {
    $recetaCombinada.infraestructura_fisica.estaciones = $ingredientesAT1.estaciones
}
if ($ingredientesAT1.apartaderos) {
    $recetaCombinada.infraestructura_fisica.apartaderos = $ingredientesAT1.apartaderos
}
if ($ingredientesAT1.escuelas) {
    $recetaCombinada.infraestructura_fisica.escuelas = $ingredientesAT1.escuelas
}
if ($ingredientesAT1.pasos_nivel) {
    $recetaCombinada.infraestructura_fisica.pasos_nivel = $ingredientesAT1.pasos_nivel
}

# Combinar ingredientes de AT2 (Control y Señalización)
if ($ingredientesAT2.ctc) {
    $recetaCombinada.sistemas_tecnicos.control_senalizacion += $ingredientesAT2.ctc
}
if ($ingredientesAT2.sistemas_control) {
    $recetaCombinada.sistemas_tecnicos.control_senalizacion += $ingredientesAT2.sistemas_control
}

# Combinar ingredientes de AT4 (Telecomunicaciones)
if ($ingredientesAT4.redes) {
    $recetaCombinada.sistemas_tecnicos.telecomunicaciones += $ingredientesAT4.redes
}
if ($ingredientesAT4.telecomunicaciones) {
    $recetaCombinada.sistemas_tecnicos.telecomunicaciones += $ingredientesAT4.telecomunicaciones
}

# Combinar ingredientes de AT5 (ITS y Seguridad)
if ($ingredientesAT5.seguridad) {
    $recetaCombinada.sistemas_tecnicos.its_seguridad += $ingredientesAT5.seguridad
}
if ($ingredientesAT5.sistemas_its) {
    $recetaCombinada.sistemas_tecnicos.its_seguridad += $ingredientesAT5.sistemas_its
}

# Calcular total de ingredientes
$totalIngredientes = 0
$totalIngredientes += $recetaCombinada.infraestructura_fisica.ufvf.Count
$totalIngredientes += $recetaCombinada.infraestructura_fisica.uf.Count
$totalIngredientes += $recetaCombinada.infraestructura_fisica.puentes.Count
$totalIngredientes += $recetaCombinada.infraestructura_fisica.estaciones.Count
$totalIngredientes += $recetaCombinada.infraestructura_fisica.apartaderos.Count
$totalIngredientes += $recetaCombinada.infraestructura_fisica.escuelas.Count
$totalIngredientes += $recetaCombinada.infraestructura_fisica.pasos_nivel.Count
$totalIngredientes += $recetaCombinada.sistemas_tecnicos.control_senalizacion.Count
$totalIngredientes += $recetaCombinada.sistemas_tecnicos.telecomunicaciones.Count
$totalIngredientes += $recetaCombinada.sistemas_tecnicos.its_seguridad.Count

$recetaCombinada.metadata.total_ingredientes = $totalIngredientes

# Mostrar resumen de combinación
Write-Host ""
Write-Host "RESUMEN DE COMBINACION:" -ForegroundColor Green
Write-Host "  INFRAESTRUCTURA FISICA:" -ForegroundColor Cyan
Write-Host "    - UFVF: $($recetaCombinada.infraestructura_fisica.ufvf.Count)" -ForegroundColor White
Write-Host "    - UF: $($recetaCombinada.infraestructura_fisica.uf.Count)" -ForegroundColor White
Write-Host "    - Puentes: $($recetaCombinada.infraestructura_fisica.puentes.Count)" -ForegroundColor White
Write-Host "    - Estaciones: $($recetaCombinada.infraestructura_fisica.estaciones.Count)" -ForegroundColor White
Write-Host "    - Apartaderos: $($recetaCombinada.infraestructura_fisica.apartaderos.Count)" -ForegroundColor White
Write-Host "    - Escuelas: $($recetaCombinada.infraestructura_fisica.escuelas.Count)" -ForegroundColor White
Write-Host "    - Pasos a nivel: $($recetaCombinada.infraestructura_fisica.pasos_nivel.Count)" -ForegroundColor White

Write-Host ""
Write-Host "  SISTEMAS TECNICOS:" -ForegroundColor Cyan
Write-Host "    - Control y Señalización: $($recetaCombinada.sistemas_tecnicos.control_senalizacion.Count)" -ForegroundColor White
Write-Host "    - Telecomunicaciones: $($recetaCombinada.sistemas_tecnicos.telecomunicaciones.Count)" -ForegroundColor White
Write-Host "    - ITS y Seguridad: $($recetaCombinada.sistemas_tecnicos.its_seguridad.Count)" -ForegroundColor White

Write-Host ""
Write-Host "  TOTAL INGREDIENTES: $totalIngredientes" -ForegroundColor Green

# Guardar receta combinada
$recetaJson = $recetaCombinada | ConvertTo-Json -Depth 4
$outputFile = "$outputPath/RECETA_COMBINADA_COMPLETA_v1.0.json"
$recetaJson | Out-File -FilePath $outputFile -Encoding UTF8

Write-Host ""
Write-Host "Receta combinada guardada en: $outputFile" -ForegroundColor Green
Write-Host "Tamano: $([math]::Round((Get-Item $outputFile).Length / 1KB, 1)) KB" -ForegroundColor Gray

Write-Host ""
Write-Host "COMBINADOR DE RECETAS - COMPLETADO" -ForegroundColor Green
Write-Host "   Listo para validar contra DTs y generar layout integral" -ForegroundColor Gray
