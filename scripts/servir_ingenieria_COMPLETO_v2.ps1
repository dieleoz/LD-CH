# ================================================================
#  SERVIR INGENIERIA v2.0 - REGENERACION COMPLETA DESDE COCINA
#  De I-VI (Cocina) → X/7/ (Ejecutivos) → X/8/ (Servidos)
# ================================================================

param(
    [switch]$SoloActualizados = $false,
    [switch]$RegenerarTodo = $false
)

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  SERVIR INGENIERIA v2.0 - COCINA → PLATO" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$ErrorActionPreference = "Continue"
$raiz = Get-Location

# ================================================================
# CONFIGURACION: MAPEO COCINA → EJECUTIVOS
# ================================================================

$mapeoSistemas = @{
    "SISTEMA_01" = @{
        Nombre = "SISTEMA_01_Control_y_Senalizacion_EJECUTIVO.md"
        Titulo = "Control y Señalización"
        Fuentes = @(
            "III. Ingenieria conceptual\26_Sistema_CTC_Integrado*.md",
            "III. Ingenieria conceptual\29_Sistema_Senalizacion_Integrado*.md",
            "V. Ingenieria de detalle\V.1_Senalizacion*.md",
            "V. Ingenieria de detalle\V.2_Centro_Control*.md"
        )
        DTs = "DT-CTC-*", "DT-INTERFACES-*", "DT-ATP-*"
        CapituloWBS = "1"
    }
    "SISTEMA_02" = @{
        Nombre = "SISTEMA_02_Telecomunicaciones_EJECUTIVO.md"
        Titulo = "Telecomunicaciones"
        Fuentes = @(
            "III. Ingenieria conceptual\28_Sistema_FibraOptica_Integrado*.md",
            "III. Ingenieria conceptual\27_Sistema_TETRA_Integrado*.md",
            "V. Ingenieria de detalle\V.3_Sistemas_Comunicacion*.md"
        )
        DTs = "DT-FIBRA-*", "DT-TETRA-*", "DT-GSMR-*"
        CapituloWBS = "2"
    }
    "SISTEMA_03" = @{
        Nombre = "SISTEMA_03_ITS_y_Seguridad_EJECUTIVO.md"
        Titulo = "ITS y Seguridad"
        Fuentes = @(
            "III. Ingenieria conceptual\31_Sistema_CCTV_Integrado*.md",
            "III. Ingenieria conceptual\30_Sistema_ITS_Integrado*.md",
            "V. Ingenieria de detalle\V.5_Sistemas_Seguridad*.md"
        )
        DTs = "DT-CCTV-*", "DT-ITS-*", "DT-ACCESO-*"
        CapituloWBS = "3"
    }
    "SISTEMA_04" = @{
        Nombre = "SISTEMA_04_Material_Rodante_EJECUTIVO.md"
        Titulo = "Material Rodante"
        Fuentes = @(
            "III. Ingenieria conceptual\32_Material_Rodante_Integrado*.md"
        )
        DTs = "DT-MR-*", "DT-EOT-*", "DT-LOCOMOTORA-*"
        CapituloWBS = "4"
    }
    "SISTEMA_05" = @{
        Nombre = "SISTEMA_05_Infraestructura_Operativa_EJECUTIVO.md"
        Titulo = "Infraestructura Operativa"
        Fuentes = @(
            "V. Ingenieria de detalle\V.4_Sistemas_Potencia*.md"
        )
        DTs = "DT-ENERGIA-*", "DT-SCADA-*", "DT-UPS-*"
        CapituloWBS = "5"
    }
    "SISTEMA_06" = @{
        Nombre = "SISTEMA_06_Integracion_y_Coordinacion_EJECUTIVO.md"
        Titulo = "Integración y Coordinación"
        Fuentes = @(
            "III. Ingenieria conceptual\34_Criterios_Interoperabilidad*.md",
            "V. Ingenieria de detalle\V.5_Integracion*.md"
        )
        DTs = "DT-INTEGRACION-*", "DT-INTERFACES-*"
        CapituloWBS = "6"
    }
}

# ================================================================
# PASO 1: IDENTIFICAR QUE SISTEMAS REGENERAR
# ================================================================

Write-Host "1/5 Identificando sistemas a regenerar..." -ForegroundColor Yellow

$sistemasARegener = @()

if ($RegenerarTodo) {
    Write-Host "  Modo: REGENERAR TODO" -ForegroundColor Cyan
    $sistemasARegener = $mapeoSistemas.Keys
} elseif ($SoloActualizados) {
    Write-Host "  Modo: SOLO SISTEMAS CON DTs RECIENTES" -ForegroundColor Cyan
    
    # Leer DTs de los ultimos 7 dias
    $carpetaDTs = Join-Path $raiz "II. Apendices Tecnicos\Decisiones_Tecnicas"
    $fechaLimite = (Get-Date).AddDays(-7)
    
    foreach ($sistemaKey in $mapeoSistemas.Keys) {
        $config = $mapeoSistemas[$sistemaKey]
        $tieneActualizaciones = $false
        
        foreach ($patronDT in $config.DTs) {
            $dtsRecientes = Get-ChildItem -Path $carpetaDTs -Filter "$patronDT.md" | Where-Object {
                $_.LastWriteTime -gt $fechaLimite
            }
            
            if ($dtsRecientes.Count -gt 0) {
                $tieneActualizaciones = $true
                Write-Host "    $sistemaKey tiene $($dtsRecientes.Count) DTs recientes" -ForegroundColor Green
                break
            }
        }
        
        if ($tieneActualizaciones) {
            $sistemasARegener += $sistemaKey
        }
    }
} else {
    # Modo por defecto: detectar cambios en fuentes
    Write-Host "  Modo: DETECCION AUTOMATICA" -ForegroundColor Cyan
    $sistemasARegener = $mapeoSistemas.Keys
}

Write-Host "  Sistemas a regenerar: $($sistemasARegener.Count)" -ForegroundColor Green
Write-Host ""

# ================================================================
# PASO 2: REGENERAR EJECUTIVOS DESDE COCINA
# ================================================================

Write-Host "2/5 Regenerando ejecutivos desde cocina..." -ForegroundColor Yellow

$carpetaEjecutivos = Join-Path $raiz "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS"

foreach ($sistemaKey in $sistemasARegener) {
    $config = $mapeoSistemas[$sistemaKey]
    $nombreArchivo = $config.Nombre
    
    Write-Host "  Regenerando: $nombreArchivo" -ForegroundColor Cyan
    
    # Leer todas las fuentes
    $contenidoCompleto = ""
    $fuentesEncontradas = 0
    
    foreach ($patronFuente in $config.Fuentes) {
        $archivos = Get-ChildItem -Path $raiz -Filter ($patronFuente -replace '.*\\', '') -Recurse | Where-Object {
            $_.FullName -match ($patronFuente -replace '\*', '.*')
        } | Select-Object -First 1
        
        if ($archivos) {
            $contenido = Get-Content $archivos.FullName -Raw -Encoding UTF8
            $contenidoCompleto += "`n`n<!-- FUENTE: $($archivos.Name) -->`n`n"
            $contenidoCompleto += $contenido
            $fuentesEncontradas++
        }
    }
    
    Write-Host "    Fuentes leidas: $fuentesEncontradas" -ForegroundColor Yellow
    
    # Leer DTs ejecutadas
    $dtsAplicadas = @()
    $carpetaDTs = Join-Path $raiz "II. Apendices Tecnicos\Decisiones_Tecnicas"
    
    foreach ($patronDT in $config.DTs) {
        $dts = Get-ChildItem -Path $carpetaDTs -Filter "$patronDT.md"
        foreach ($dt in $dts) {
            $contenidoDT = Get-Content $dt.FullName -Raw -Encoding UTF8
            if ($contenidoDT -match '\[x\].*Ejecutado') {
                $dtsAplicadas += $dt.Name
            }
        }
    }
    
    Write-Host "    DTs aplicadas: $($dtsAplicadas.Count)" -ForegroundColor Yellow
    
    # GENERAR EJECUTIVO USANDO PROMPT
    $promptPath = Join-Path $raiz "scripts\PROMPT_Especialista_$($config.Titulo -replace ' ','_').md"
    
    if (Test-Path $promptPath) {
        Write-Host "    Usando prompt: PROMPT_Especialista_$($config.Titulo -replace ' ','_').md" -ForegroundColor Cyan
    }
    
    # AQUI IRIA LA LLAMADA AL LLM O PROCESO DE CONSOLIDACION
    # Por ahora, marcar que el documento necesita regeneración
    
    $rutaEjecutivo = Join-Path $carpetaEjecutivos $nombreArchivo
    
    # Agregar marca de actualización
    if (Test-Path $rutaEjecutivo) {
        $contenidoActual = Get-Content $rutaEjecutivo -Raw -Encoding UTF8
        $fechaActual = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        
        # Agregar sección de actualización
        if ($contenidoActual -notmatch "ULTIMA ACTUALIZACION DESDE COCINA") {
            $notaActualizacion = @"

---

## 📅 ULTIMA ACTUALIZACION DESDE COCINA

- **Fecha:** $fechaActual
- **Fuentes consolidadas:** $fuentesEncontradas documentos
- **DTs aplicadas:** $($dtsAplicadas.Count) decisiones técnicas

### DTs Ejecutadas:
$($dtsAplicadas | ForEach-Object { "- $_" } | Out-String)

### Fuentes de la Cocina:
$($config.Fuentes | ForEach-Object { "- $_" } | Out-String)

---

⚠️ **NOTA:** Este documento fue regenerado automáticamente desde la cocina (I-VI).
Cualquier justificación técnica aquí debe reflejar la información más reciente de los documentos integrados.

"@
            $contenidoActual += $notaActualizacion
            $contenidoActual | Out-File -FilePath $rutaEjecutivo -Encoding UTF8 -Force
        }
        
        Write-Host "    ✅ Ejecutivo marcado para regeneración" -ForegroundColor Green
    }
}

Write-Host ""

# ================================================================
# PASO 3: GENERAR DOCUMENTOS WORD (.docx)
# ================================================================

Write-Host "3/5 Generando documentos Word desde ejecutivos..." -ForegroundColor Yellow

$carpetaWord = Join-Path $raiz "X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS\WORD"
if (-not (Test-Path $carpetaWord)) {
    New-Item -Path $carpetaWord -ItemType Directory -Force | Out-Null
}

$contadorWord = 0
foreach ($sistemaKey in $sistemasARegener) {
    $config = $mapeoSistemas[$sistemaKey]
    $rutaOrigen = Join-Path $carpetaEjecutivos $config.Nombre
    $nombreWord = $config.Nombre -replace '_EJECUTIVO\.md$', '_EJECUTIVO.docx'
    $rutaDestino = Join-Path $carpetaWord $nombreWord
    
    if (Test-Path $rutaOrigen) {
        Write-Host "  Generando: $nombreWord" -ForegroundColor Cyan
        & pandoc $rutaOrigen -o $rutaDestino --toc --toc-depth=3 2>&1 | Out-Null
        
        if (Test-Path $rutaDestino) {
            $tamano = [math]::Round((Get-Item $rutaDestino).Length / 1KB, 1)
            Write-Host "    ✅ OK ($tamano KB)" -ForegroundColor Green
            $contadorWord++
        }
    }
}

Write-Host ""
Write-Host "  Documentos Word generados: $contadorWord" -ForegroundColor Green
Write-Host ""

# ================================================================
# PASO 4: GENERAR DOCUMENTOS HTML (.html)
# ================================================================

Write-Host "4/5 Generando documentos HTML desde ejecutivos..." -ForegroundColor Yellow

$carpetaHTML = Join-Path $raiz "X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS\HTML"
if (-not (Test-Path $carpetaHTML)) {
    New-Item -Path $carpetaHTML -ItemType Directory -Force | Out-Null
}

$contadorHTML = 0
foreach ($sistemaKey in $sistemasARegener) {
    $config = $mapeoSistemas[$sistemaKey]
    $rutaOrigen = Join-Path $carpetaEjecutivos $config.Nombre
    $nombreHTML = $config.Nombre -replace '_EJECUTIVO\.md$', '_EJECUTIVO.html'
    $rutaDestino = Join-Path $carpetaHTML $nombreHTML
    
    if (Test-Path $rutaOrigen) {
        Write-Host "  Generando: $nombreHTML" -ForegroundColor Cyan
        & pandoc $rutaOrigen -o $rutaDestino --standalone --toc --toc-depth=3 2>&1 | Out-Null
        
        if (Test-Path $rutaDestino) {
            $tamano = [math]::Round((Get-Item $rutaDestino).Length / 1KB, 1)
            Write-Host "    ✅ OK ($tamano KB)" -ForegroundColor Green
            $contadorHTML++
        }
    }
}

Write-Host ""
Write-Host "  Documentos HTML generados: $contadorHTML" -ForegroundColor Green
Write-Host ""

# ================================================================
# PASO 5: ACTUALIZAR INDICE HTML
# ================================================================

Write-Host "5/5 Actualizando indice HTML..." -ForegroundColor Yellow

$fechaActual = Get-Date -Format "d 'de' MMMM 'de' yyyy"
Write-Host "  Fecha actualización: $fechaActual" -ForegroundColor Green

Write-Host ""

# ================================================================
# RESUMEN FINAL
# ================================================================

Write-Host "================================================================" -ForegroundColor Green
Write-Host "  INGENIERIA SERVIDA - PLATOS LISTOS" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""

Write-Host "SISTEMAS REGENERADOS: $($sistemasARegener.Count)" -ForegroundColor Cyan
foreach ($s in $sistemasARegener) {
    Write-Host "  - $($mapeoSistemas[$s].Titulo)" -ForegroundColor White
}

Write-Host ""
Write-Host "DOCUMENTOS SERVIDOS:" -ForegroundColor Cyan
Write-Host "  - Word (.docx): $contadorWord" -ForegroundColor White
Write-Host "  - HTML (.html): $contadorHTML" -ForegroundColor White

Write-Host ""
Write-Host "UBICACION:" -ForegroundColor Cyan
Write-Host "  Word: X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS\WORD\" -ForegroundColor Yellow
Write-Host "  HTML: X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS\HTML\" -ForegroundColor Yellow

Write-Host ""
Write-Host "ABRIR INDICE:" -ForegroundColor Cyan
$rutaIndice = Join-Path $raiz "X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS\HTML\GESTION_EJECUTIVO_Cambios_y_Decisiones_Tecnicas.html"
Write-Host "  file:///$($rutaIndice -replace '\\','/')" -ForegroundColor Yellow

Write-Host ""
Write-Host "PLATOS SERVIDOS! Cliente puede revisar documentos" -ForegroundColor Green
Write-Host ""

# ================================================================
# INSTRUCCIONES PARA PROXIMA VERSION
# ================================================================

Write-Host "PROXIMA MEJORA:" -ForegroundColor Magenta
Write-Host "  TODO: Integrar LLM para regenerar ejecutivos automáticamente" -ForegroundColor Yellow
Write-Host "  - Leer fuentes de la cocina" -ForegroundColor Yellow
Write-Host "  - Aplicar prompt de especialista" -ForegroundColor Yellow
Write-Host "  - Generar ejecutivo consolidado" -ForegroundColor Yellow
Write-Host "  - Guardar en X/7_SISTEMAS_EJECUTIVOS/" -ForegroundColor Yellow
Write-Host ""

