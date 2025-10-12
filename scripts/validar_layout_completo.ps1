# SCRIPT: Validación Completa del Layout
# Fecha: 11 Octubre 2025
# Propósito: Diagnosticar todos los problemas del sistema

Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "  VALIDACION COMPLETA DEL SISTEMA LAYOUT        " -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""

$errores = @()
$advertencias = @()
$ok = @()

# 1. Verificar archivos críticos
Write-Host "1. VERIFICANDO ARCHIVOS CRITICOS..." -ForegroundColor Yellow
Write-Host ""

$archivosCriticos = @(
    "layout.md",
    "IX. WBS y Planificacion/layout_datos.js",
    "IX. WBS y Planificacion/layout_datos.json",
    "IX. WBS y Planificacion/WBS_Layout_Maestro.html",
    "VIII. Documentos Maestros y Metodologia/LAYOUT_INTEGRAL_COMPLETO_v1.0.json"
)

foreach ($archivo in $archivosCriticos) {
    if (Test-Path $archivo) {
        $size = (Get-Item $archivo).Length
        Write-Host "  OK $archivo" -ForegroundColor Green
        Write-Host "    Tamano: $([math]::Round($size/1KB, 2)) KB" -ForegroundColor Gray
        $ok += "Archivo $archivo existe"
    } else {
        Write-Host "  ERROR $archivo - NO ENCONTRADO" -ForegroundColor Red
        $errores += "Archivo $archivo no existe"
    }
}

Write-Host ""

# 2. Validar contenido de layout.md
Write-Host "2. VALIDANDO CONTENIDO DE LAYOUT.MD..." -ForegroundColor Yellow
Write-Host ""

if (Test-Path "layout.md") {
    $layoutContent = Get-Content "layout.md" -Raw -Encoding UTF8
    
    # Contar elementos
    $lineasTabla = ($layoutContent -split "`n" | Where-Object { $_ -match '^\|' }).Count
    Write-Host "  Lineas de tabla: $lineasTabla" -ForegroundColor White
    
    # Buscar TETRA
    $tetraLineas = ($layoutContent -split "`n" | Where-Object { $_ -match 'TETRA|EBT' })
    $tetraCount = $tetraLineas.Count
    Write-Host "  Menciones TETRA/EBT: $tetraCount" -ForegroundColor White
    
    # Buscar estaciones específicas
    $ebt01 = $layoutContent -match 'EBT-01|EBT_01'
    $ebt26 = $layoutContent -match 'EBT-26|EBT_26'
    
    if ($ebt01) {
        Write-Host "  OK EBT-01 encontrada" -ForegroundColor Green
    } else {
        Write-Host "  ERROR EBT-01 NO encontrada" -ForegroundColor Red
        $errores += "EBT-01 no esta en layout.md"
    }
    
    if ($ebt26) {
        Write-Host "  OK EBT-26 encontrada" -ForegroundColor Green
    } else {
        Write-Host "  ERROR EBT-26 NO encontrada" -ForegroundColor Red
        $errores += "EBT-26 no esta en layout.md"
    }
    
    # Buscar balizas
    $balizasCount = ($layoutContent -split "`n" | Where-Object { $_ -match 'BALIZA|Baliza|Eurobalise' }).Count
    if ($balizasCount -gt 0) {
        Write-Host "  ADVERTENCIA Balizas encontradas: $balizasCount" -ForegroundColor Yellow
        $advertencias += "Hay $balizasCount balizas en layout.md (deberian ser 0 por senalizacion virtual)"
    } else {
        Write-Host "  OK Sin balizas (senalizacion virtual)" -ForegroundColor Green
        $ok += "Layout coherente con senalizacion virtual"
    }
}

Write-Host ""

# 3. Validar layout_datos.js
Write-Host "3. VALIDANDO LAYOUT_DATOS.JS..." -ForegroundColor Yellow
Write-Host ""

if (Test-Path "IX. WBS y Planificacion/layout_datos.js") {
    $jsContent = Get-Content "IX. WBS y Planificacion/layout_datos.js" -Raw -Encoding UTF8
    
    # Verificar que tenga la variable LAYOUT_DATOS
    if ($jsContent -match 'const LAYOUT_DATOS') {
        Write-Host "  OK Variable LAYOUT_DATOS definida" -ForegroundColor Green
        $ok += "layout_datos.js tiene estructura correcta"
    } else {
        Write-Host "  ERROR Variable LAYOUT_DATOS NO definida" -ForegroundColor Red
        $errores += "layout_datos.js sin variable LAYOUT_DATOS"
    }
    
    # Contar elementos en el array
    $matches = $jsContent | Select-String -Pattern '\{' -AllMatches
    $elementosJS = $matches.Matches.Count
    Write-Host "  Elementos aproximados: $elementosJS" -ForegroundColor White
    
    # Buscar TETRA en JS
    $tetraJS = ($jsContent | Select-String -Pattern 'TETRA|EBT' -AllMatches).Matches.Count
    Write-Host "  Menciones TETRA en JS: $tetraJS" -ForegroundColor White
    
    if ($tetraJS -lt 37) {
        Write-Host "  ⚠ Se esperaban 37 TETRA, solo hay $tetraJS" -ForegroundColor Yellow
        $advertencias += "Faltan estaciones TETRA: esperadas 37, encontradas $tetraJS"
    }
}

Write-Host ""

# 4. Validar HTML
Write-Host "4. VALIDANDO WBS_LAYOUT_MAESTRO.HTML..." -ForegroundColor Yellow
Write-Host ""

if (Test-Path "IX. WBS y Planificacion/WBS_Layout_Maestro.html") {
    $htmlContent = Get-Content "IX. WBS y Planificacion/WBS_Layout_Maestro.html" -Raw -Encoding UTF8
    
    # Verificar que cargue layout_datos.js
    if ($htmlContent -match 'layout_datos.js') {
        Write-Host "  OK HTML incluye layout_datos.js" -ForegroundColor Green
        $ok += "HTML correctamente vinculado a datos"
    } else {
        Write-Host "  ERROR HTML NO incluye layout_datos.js" -ForegroundColor Red
        $errores += "HTML no carga layout_datos.js"
    }
    
    # Verificar funciones críticas
    $funciones = @('loadData', 'applyFilters', 'loadSummary', 'loadEstaciones')
    foreach ($func in $funciones) {
        $pattern = "function $func"
        if ($htmlContent -match $pattern) {
            Write-Host "  OK Funcion $func existe" -ForegroundColor Green
        } else {
            Write-Host "  ERROR Funcion $func NO existe" -ForegroundColor Red
            $errores += "Funcion $func falta en HTML"
        }
    }
}

Write-Host ""

# 5. Validar criterios técnicos
Write-Host "5. VALIDANDO CRITERIOS TECNICOS..." -ForegroundColor Yellow
Write-Host ""

# Buscar en documentos de ingeniería conceptual
$criterioTETRA = Get-ChildItem "III. Ingenieria conceptual" -Filter "*TETRA*.md" -Recurse | Select-Object -First 1

if ($criterioTETRA) {
    Write-Host "  OK Documento TETRA encontrado: $($criterioTETRA.Name)" -ForegroundColor Green
    $contenidoCriterio = Get-Content $criterioTETRA.FullName -Raw -Encoding UTF8
    
    if ($contenidoCriterio -match '37') {
        Write-Host "  OK Mencion de 37 estaciones en criterio" -ForegroundColor Green
        $ok += "Criterio tecnico menciona 37 estaciones"
    } else {
        Write-Host "  ADVERTENCIA No se encontro mencion de 37 estaciones" -ForegroundColor Yellow
    }
}

Write-Host ""

# 6. Resumen de validación
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "  RESUMEN DE VALIDACION                         " -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "OK CORRECTO: $($ok.Count)" -ForegroundColor Green
foreach ($item in $ok) {
    Write-Host "  - $item" -ForegroundColor White
}

Write-Host ""
Write-Host "ADVERTENCIA: $($advertencias.Count)" -ForegroundColor Yellow
foreach ($item in $advertencias) {
    Write-Host "  - $item" -ForegroundColor White
}

Write-Host ""
Write-Host "ERROR: $($errores.Count)" -ForegroundColor Red
foreach ($item in $errores) {
    Write-Host "  - $item" -ForegroundColor White
}

Write-Host ""
Write-Host "=================================================" -ForegroundColor Cyan

# Crear reporte
$reporte = @{
    fecha = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    ok = $ok
    advertencias = $advertencias
    errores = $errores
    estado = if ($errores.Count -eq 0) { "FUNCIONAL" } else { "CON ERRORES" }
}

$reporte | ConvertTo-Json -Depth 5 | Out-File "VIII. Documentos Maestros y Metodologia/VALIDACION_LAYOUT_v1.0.json" -Encoding UTF8

Write-Host ""
Write-Host "Reporte guardado: VIII/VALIDACION_LAYOUT_v1.0.json" -ForegroundColor Green
Write-Host ""

