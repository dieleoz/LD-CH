# ================================================================
#  SERVIR INGENIERIA - De la Cocina (I-VI) al Plato (X/8_DOCUMENTOS_SERVIDOS)
# ================================================================

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  SERVIR INGENIERIA - CONSOLIDACION COCINA AL PLATO" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$ErrorActionPreference = "Continue"
$raiz = Get-Location

# ================================================================
# PASO 1: LEER DTs EJECUTADAS
# ================================================================

Write-Host "1/4 Leyendo Decisiones Tecnicas ejecutadas..." -ForegroundColor Yellow

$carpetaDTs = Join-Path $raiz "II. Apendices Tecnicos\Decisiones_Tecnicas"
$archivosDT = Get-ChildItem -Path $carpetaDTs -Filter "DT-*.md"

$contadorDTs = 0
foreach ($dt in $archivosDT) {
    $contenido = Get-Content $dt.FullName -Raw -Encoding UTF8
    if ($contenido -match '\[x\].*Ejecutado') {
        $contadorDTs++
    }
}

Write-Host "  DTs ejecutadas: $contadorDTs" -ForegroundColor Green
Write-Host ""

# ================================================================
# PASO 2: GENERAR DOCUMENTOS WORD (.docx)
# ================================================================

Write-Host "2/4 Generando documentos Word (.docx)..." -ForegroundColor Yellow

$carpetaWord = Join-Path $raiz "X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS\WORD"
if (-not (Test-Path $carpetaWord)) {
    New-Item -Path $carpetaWord -ItemType Directory -Force | Out-Null
}

$archivosGenerar = @(
    @{Origen="IV. Ingenieria básica\41. Interfaces_Sistemas_MEJORADO.md"; Destino="Interfaces_Sistemas_Actualizado.docx"},
    @{Origen="V. Ingenieria de detalle\V.2_Centro_Control_Trafico_CTC_v5.0.md"; Destino="CTC_v5_Actualizado.docx"},
    @{Origen="VII. Soporte Especializado\VII.2_Especificaciones\VII.2.4_Interfaces_CTC_ITCS_Protocolo_FFFIS.md"; Destino="Protocolo_FFFIS_Actualizado.docx"}
)

$contadorWord = 0
foreach ($arch in $archivosGenerar) {
    $rutaOrigen = Join-Path $raiz $arch.Origen
    $rutaDestino = Join-Path $carpetaWord $arch.Destino
    
    if (Test-Path $rutaOrigen) {
        Write-Host "  Generando: $($arch.Destino)" -ForegroundColor Cyan
        & pandoc $rutaOrigen -o $rutaDestino --toc --toc-depth=3 2>&1 | Out-Null
        
        if (Test-Path $rutaDestino) {
            $tamano = [math]::Round((Get-Item $rutaDestino).Length / 1KB, 1)
            Write-Host "    OK ($tamano KB)" -ForegroundColor Green
            $contadorWord++
        }
    }
}

Write-Host ""
Write-Host "  Documentos Word generados: $contadorWord" -ForegroundColor Green
Write-Host ""

# ================================================================
# PASO 3: GENERAR DOCUMENTOS HTML (.html)
# ================================================================

Write-Host "3/4 Generando documentos HTML (.html)..." -ForegroundColor Yellow

$carpetaHTML = Join-Path $raiz "X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS\HTML"
if (-not (Test-Path $carpetaHTML)) {
    New-Item -Path $carpetaHTML -ItemType Directory -Force | Out-Null
}

$contadorHTML = 0
foreach ($arch in $archivosGenerar) {
    $rutaOrigen = Join-Path $raiz $arch.Origen
    $nombreHTML = $arch.Destino -replace '\.docx$', '.html'
    $rutaDestino = Join-Path $carpetaHTML $nombreHTML
    
    if (Test-Path $rutaOrigen) {
        Write-Host "  Generando: $nombreHTML" -ForegroundColor Cyan
        & pandoc $rutaOrigen -o $rutaDestino --standalone --toc --toc-depth=3 2>&1 | Out-Null
        
        if (Test-Path $rutaDestino) {
            $tamano = [math]::Round((Get-Item $rutaDestino).Length / 1KB, 1)
            Write-Host "    OK ($tamano KB)" -ForegroundColor Green
            $contadorHTML++
        }
    }
}

Write-Host ""
Write-Host "  Documentos HTML generados: $contadorHTML" -ForegroundColor Green
Write-Host ""

# ================================================================
# PASO 4: GENERAR INDICE INTERACTIVO
# ================================================================

Write-Host "4/4 Generando indice HTML para cliente..." -ForegroundColor Yellow

$fechaActual = Get-Date -Format "d 'de' MMMM 'de' yyyy"
$horaActual = Get-Date -Format "HH:mm"

$rutaIndice = Join-Path $carpetaHTML "GESTION_EJECUTIVO_Cambios_y_Decisiones_Tecnicas.html"

# Copiar el template actualizado
Copy-Item -Path (Join-Path $raiz "Reportes\Cambios_Tecnicos\index.html") -Destination $rutaIndice -Force

Write-Host "  Indice HTML actualizado" -ForegroundColor Green
Write-Host ""

# ================================================================
# RESUMEN FINAL
# ================================================================

Write-Host "================================================================" -ForegroundColor Green
Write-Host "  INGENIERIA SERVIDA - DOCUMENTOS EN X/8_DOCUMENTOS_SERVIDOS/" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""

Write-Host "RESUMEN:" -ForegroundColor Cyan
Write-Host "  - DTs ejecutadas: $contadorDTs" -ForegroundColor White
Write-Host "  - Documentos Word: $contadorWord" -ForegroundColor White
Write-Host "  - Documentos HTML: $contadorHTML" -ForegroundColor White
Write-Host ""

Write-Host "UBICACION:" -ForegroundColor Cyan
Write-Host "  Word: X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS\WORD\" -ForegroundColor Yellow
Write-Host "  HTML: X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS\HTML\" -ForegroundColor Yellow
Write-Host ""

Write-Host "ABRIR INDICE:" -ForegroundColor Cyan
Write-Host "  $rutaIndice" -ForegroundColor Yellow
Write-Host ""

Write-Host "PLATOS SERVIDOS! Cliente puede descargar documentos" -ForegroundColor Green
Write-Host ""
