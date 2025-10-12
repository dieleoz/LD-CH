# VALIDADOR RECETAS vs DTs
# Valida las recetas combinadas contra las Decisiones Tecnicas
# Version: 1.0 | Fecha: 10 Octubre 2025

Write-Host "VALIDADOR RECETAS vs DTs" -ForegroundColor Cyan
Write-Host "=========================" -ForegroundColor Cyan
Write-Host ""

$outputPath = "VIII. Documentos Maestros y Metodologia"
$recetaFile = "$outputPath/RECETA_COMBINADA_COMPLETA_v1.0.json"
$dtsPath = "II. Apendices Tecnicos/Decisiones_Tecnicas"

if (-not (Test-Path $recetaFile)) {
    Write-Host "ERROR: No se encuentra $recetaFile" -ForegroundColor Red
    exit 1
}

Write-Host "Cargando receta combinada..." -ForegroundColor Yellow
$contenidoReceta = Get-Content $recetaFile -Raw
$receta = $contenidoReceta | ConvertFrom-Json

Write-Host "Tamano de receta: $([math]::Round((Get-Item $recetaFile).Length / 1KB, 1)) KB" -ForegroundColor Gray

# Buscar DTs disponibles
Write-Host ""
Write-Host "Buscando Decisiones Tecnicas..." -ForegroundColor Yellow

$dtsDisponibles = @()
if (Test-Path $dtsPath) {
    $dtsFiles = Get-ChildItem "$dtsPath/*.md" | Where-Object { $_.Name -match "DT-" }
    foreach ($dt in $dtsFiles) {
        $dtsDisponibles += $dt.Name
        Write-Host "  ENCONTRADA: $($dt.Name)" -ForegroundColor Green
    }
} else {
    Write-Host "  ERROR: Directorio DTs no encontrado" -ForegroundColor Red
}

Write-Host ""
Write-Host "Total DTs encontradas: $($dtsDisponibles.Count)" -ForegroundColor Cyan

# Definir validaciones conocidas basadas en DTs mencionadas
$validacionesDTs = @{
    "DT-CTC-001" = @{
        descripcion = "Señalización Virtual - Eliminar Balizas Físicas"
        criterio = "NO debe haber balizas físicas Eurobalise"
        elemento = "balizas_fisicas"
        valor_esperado = 0
        tipo = "ELIMINAR"
    }
    
    "DT-TETRA-001" = @{
        descripcion = "Estaciones TETRA - 37 estaciones"
        criterio = "Debe haber exactamente 37 estaciones TETRA"
        elemento = "estaciones_tetra"
        valor_esperado = 37
        tipo = "AJUSTAR"
    }
    
    "DT-RBC-001" = @{
        descripcion = "RBC ETCS - 5 centros"
        criterio = "Debe haber 5 Radio Block Centers"
        elemento = "rbc_etcs"
        valor_esperado = 5
        tipo = "AJUSTAR"
    }
    
    "DT-PUENTES-001" = @{
        descripcion = "Puentes Priorizados"
        criterio = "Solo puentes de Tabla 9 AT1"
        elemento = "puentes_validos"
        valor_esperado = "TABLA_9_AT1"
        tipo = "VALIDAR"
    }
}

Write-Host ""
Write-Host "VALIDACIONES DEFINIDAS:" -ForegroundColor Yellow
foreach ($dt in $validacionesDTs.Keys) {
    $info = $validacionesDTs[$dt]
    Write-Host "  $dt : $($info.descripcion)" -ForegroundColor White
}

# Crear estructura de validación
$resultadosValidacion = @{
    metadata = @{
        fecha_validacion = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        receta_validada = "RECETA_COMBINADA_COMPLETA_v1.0.json"
        dts_encontradas = $dtsDisponibles.Count
        validaciones_aplicadas = $validacionesDTs.Count
    }
    
    validaciones = @()
    
    resumen = @{
        total_validaciones = 0
        validaciones_ok = 0
        validaciones_error = 0
        validaciones_advertencia = 0
    }
}

Write-Host ""
Write-Host "EJECUTANDO VALIDACIONES..." -ForegroundColor Yellow

# Validación 1: Señalización Virtual (DT-CTC-001)
$validacion1 = @{
    dt = "DT-CTC-001"
    elemento = "balizas_fisicas"
    descripcion = "Verificar que NO hay balizas físicas (señalización virtual)"
    resultado = "PENDIENTE"
    detalle = ""
    accion = ""
}

# Buscar referencias a balizas en la receta
$referenciasBalizas = 0
if ($receta.sistemas_tecnicos.control_senalizacion) {
    foreach ($sistema in $receta.sistemas_tecnicos.control_senalizacion) {
        if ($sistema -match "baliza|eurobalise") {
            $referenciasBalizas++
        }
    }
}

if ($referenciasBalizas -eq 0) {
    $validacion1.resultado = "OK"
    $validacion1.detalle = "No se encontraron referencias a balizas físicas"
    $validacion1.accion = "Ninguna - Cumple con señalización virtual"
    $resultadosValidacion.resumen.validaciones_ok++
} else {
    $validacion1.resultado = "ERROR"
    $validacion1.detalle = "Se encontraron $referenciasBalizas referencias a balizas físicas"
    $validacion1.accion = "ELIMINAR todas las balizas físicas"
    $resultadosValidacion.resumen.validaciones_error++
}

$resultadosValidacion.validaciones += $validacion1
$resultadosValidacion.resumen.total_validaciones++

Write-Host "  ✓ DT-CTC-001: $($validacion1.resultado) - $($validacion1.detalle)" -ForegroundColor $(if($validacion1.resultado -eq "OK") {"Green"} else {"Red"})

# Validación 2: Estaciones TETRA (DT-TETRA-001)
$validacion2 = @{
    dt = "DT-TETRA-001"
    elemento = "estaciones_tetra"
    descripcion = "Verificar cantidad de estaciones TETRA"
    resultado = "PENDIENTE"
    detalle = ""
    accion = ""
}

# Buscar referencias a TETRA en la receta
$referenciasTETRA = 0
if ($receta.sistemas_tecnicos.telecomunicaciones) {
    foreach ($sistema in $receta.sistemas_tecnicos.telecomunicaciones) {
        if ($sistema -match "tetra") {
            $referenciasTETRA++
        }
    }
}

if ($referenciasTETRA -eq 37) {
    $validacion2.resultado = "OK"
    $validacion2.detalle = "Se encontraron exactamente 37 referencias TETRA"
    $validacion2.accion = "Ninguna - Cantidad correcta"
    $resultadosValidacion.resumen.validaciones_ok++
} elseif ($referenciasTETRA -lt 37) {
    $validacion2.resultado = "ADVERTENCIA"
    $validacion2.detalle = "Se encontraron solo $referenciasTETRA referencias TETRA (esperado: 37)"
    $validacion2.accion = "AGREGAR estaciones TETRA faltantes"
    $resultadosValidacion.resumen.validaciones_advertencia++
} else {
    $validacion2.resultado = "ADVERTENCIA"
    $validacion2.detalle = "Se encontraron $referenciasTETRA referencias TETRA (esperado: 37)"
    $validacion2.accion = "VERIFICAR cantidad de estaciones TETRA"
    $resultadosValidacion.resumen.validaciones_advertencia++
}

$resultadosValidacion.validaciones += $validacion2
$resultadosValidacion.resumen.total_validaciones++

Write-Host "  ✓ DT-TETRA-001: $($validacion2.resultado) - $($validacion2.detalle)" -ForegroundColor $(if($validacion2.resultado -eq "OK") {"Green"} elseif($validacion2.resultado -eq "ADVERTENCIA") {"Yellow"} else {"Red"})

# Validación 3: Puentes (DT-PUENTES-001)
$validacion3 = @{
    dt = "DT-PUENTES-001"
    elemento = "puentes_validos"
    descripcion = "Verificar que los puentes son de Tabla 9 AT1"
    resultado = "PENDIENTE"
    detalle = ""
    accion = ""
}

$puentesEncontrados = 0
if ($receta.infraestructura_fisica.puentes) {
    $puentesEncontrados = $receta.infraestructura_fisica.puentes.Count
}

if ($puentesEncontrados -gt 0) {
    $validacion3.resultado = "ADVERTENCIA"
    $validacion3.detalle = "Se encontraron $puentesEncontrados puentes - Verificar que sean de Tabla 9 AT1"
    $validacion3.accion = "VALIDAR contra Tabla 9 AT1"
    $resultadosValidacion.resumen.validaciones_advertencia++
} else {
    $validacion3.resultado = "ADVERTENCIA"
    $validacion3.detalle = "No se encontraron puentes en la receta"
    $validacion3.accion = "VERIFICAR extracción de puentes del AT1"
    $resultadosValidacion.resumen.validaciones_advertencia++
}

$resultadosValidacion.validaciones += $validacion3
$resultadosValidacion.resumen.total_validaciones++

Write-Host "  ✓ DT-PUENTES-001: $($validacion3.resultado) - $($validacion3.detalle)" -ForegroundColor $(if($validacion3.resultado -eq "OK") {"Green"} elseif($validacion3.resultado -eq "ADVERTENCIA") {"Yellow"} else {"Red"})

# Mostrar resumen de validación
Write-Host ""
Write-Host "RESUMEN DE VALIDACION:" -ForegroundColor Green
Write-Host "  Total validaciones: $($resultadosValidacion.resumen.total_validaciones)" -ForegroundColor White
Write-Host "  Validaciones OK: $($resultadosValidacion.resumen.validaciones_ok)" -ForegroundColor Green
Write-Host "  Validaciones ERROR: $($resultadosValidacion.resumen.validaciones_error)" -ForegroundColor Red
Write-Host "  Validaciones ADVERTENCIA: $($resultadosValidacion.resumen.validaciones_advertencia)" -ForegroundColor Yellow

# Guardar resultados de validación
$validacionJson = $resultadosValidacion | ConvertTo-Json -Depth 4
$outputFile = "$outputPath/VALIDACION_RECETAS_vs_DTs_v1.0.json"
$validacionJson | Out-File -FilePath $outputFile -Encoding UTF8

Write-Host ""
Write-Host "Resultados de validación guardados en: $outputFile" -ForegroundColor Green
Write-Host "Tamano: $([math]::Round((Get-Item $outputFile).Length / 1KB, 1)) KB" -ForegroundColor Gray

Write-Host ""
Write-Host "VALIDADOR RECETAS vs DTs - COMPLETADO" -ForegroundColor Green
