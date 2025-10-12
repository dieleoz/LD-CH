# EXTRACTOR TODA LA COCINA - Completo
# Lee TODOS los archivos de III. Ingenieria conceptual + IV. Ingenieria basica
# Version: 1.0 | Fecha: 10 Octubre 2025

Write-Host "EXTRACTOR TODA LA COCINA - Completo" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

$conceptualPath = "III. Ingenieria conceptual"
$basicaPath = "IV. Ingenieria básica"
$outputPath = "VIII. Documentos Maestros y Metodologia"

# Verificar directorios
if (-not (Test-Path $conceptualPath)) {
    Write-Host "ERROR: No se encuentra $conceptualPath" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $basicaPath)) {
    Write-Host "ERROR: No se encuentra $basicaPath" -ForegroundColor Red
    exit 1
}

Write-Host "Analizando TODA la cocina..." -ForegroundColor Yellow

# Crear estructura completa
$todaLaCocina = @{
    metadata = @{
        version = "1.0"
        fecha = "2025-10-10"
        descripcion = "TODA la cocina: Conceptual + Basica + Contratos"
        total_archivos = 0
        archivos_analizados = 0
        tamano_total_kb = 0
    }
    
    ingenieria_conceptual = @{
        archivos = @{}
        tamano_total_kb = 0
        categorias = @{
            trazabilidad = @()
            sistemas_integrados = @()
            criterios = @()
            itcs = @()
            wbs = @()
            otros = @()
        }
    }
    
    ingenieria_basica = @{
        archivos = @{}
        tamano_total_kb = 0
        categorias = @{
            especificaciones = @()
            memorias = @()
            diagramas = @()
            planes = @()
            otros = @()
        }
    }
    
    contratos = @{
        archivos = @{}
        tamano_total_kb = 0
        categorias = @{
            contrato_general = @()
            apendices_tecnicos = @()
        }
    }
}

# Analizar TODOS los archivos de Ingenieria Conceptual
Write-Host ""
Write-Host "ANALIZANDO III. INGENIERIA CONCEPTUAL..." -ForegroundColor Cyan

$archivosConceptual = Get-ChildItem "$conceptualPath/*.md" -Recurse
Write-Host "Archivos encontrados en Conceptual: $($archivosConceptual.Count)" -ForegroundColor White

foreach ($archivo in $archivosConceptual) {
    $nombre = $archivo.Name
    $tamano = [math]::Round($archivo.Length / 1KB, 1)
    $rutaRelativa = $archivo.FullName.Replace((Get-Location).Path + "\", "")
    
    Write-Host "  Analizando: $nombre ($tamano KB)" -ForegroundColor Green
    
    # Leer contenido
    $contenido = Get-Content $archivo.FullName -Encoding UTF8 -Raw
    
    # Categorizar archivo
    $categoria = "otros"
    if ($nombre -match "(trazabilidad|relacion|apendice)") {
        $categoria = "trazabilidad"
    } elseif ($nombre -match "(integrado|sistema)") {
        $categoria = "sistemas_integrados"
    } elseif ($nombre -match "(criterio|normatividad|interoperabilidad|redundancia|ciberseguridad)") {
        $categoria = "criterios"
    } elseif ($nombre -match "(ITCS|itcs)") {
        $categoria = "itcs"
    } elseif ($nombre -match "(WBS|wbs)") {
        $categoria = "wbs"
    }
    
    # Extraer referencias a ATs
    $referenciasATs = @()
    for ($i = 1; $i -le 10; $i++) {
        $patron = "AT$i"
        $matches = [regex]::Matches($contenido, $patron, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        if ($matches.Count -gt 0) {
            $referenciasATs += "AT$i"
        }
    }
    
    # Extraer palabras clave importantes
    $palabrasClave = @()
    $patronesClave = @("TETRA", "CTC", "CCTV", "ETCS", "RBC", "ATP", "baliza", "fibra", "puente", "estacion")
    foreach ($patron in $patronesClave) {
        $matches = [regex]::Matches($contenido, $patron, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        if ($matches.Count -gt 0) {
            $palabrasClave += $patron
        }
    }
    
    # Guardar información del archivo
    $todaLaCocina.ingenieria_conceptual.archivos[$nombre] = @{
        ruta = $rutaRelativa
        tamano_kb = $tamano
        categoria = $categoria
        referencias_ATs = $referenciasATs
        palabras_clave = $palabrasClave
        lineas = $contenido.Split("`n").Count
        caracteres = $contenido.Length
    }
    
    $todaLaCocina.ingenieria_conceptual.categorias.$categoria += $nombre
    $todaLaCocina.ingenieria_conceptual.tamano_total_kb += $tamano
    $todaLaCocina.metadata.archivos_analizados++
    $todaLaCocina.metadata.tamano_total_kb += $tamano
}

# Analizar TODOS los archivos de Ingenieria Basica
Write-Host ""
Write-Host "ANALIZANDO IV. INGENIERIA BASICA..." -ForegroundColor Cyan

$archivosBasica = Get-ChildItem "$basicaPath/*.md" -Recurse
Write-Host "Archivos encontrados en Basica: $($archivosBasica.Count)" -ForegroundColor White

foreach ($archivo in $archivosBasica) {
    $nombre = $archivo.Name
    $tamano = [math]::Round($archivo.Length / 1KB, 1)
    $rutaRelativa = $archivo.FullName.Replace((Get-Location).Path + "\", "")
    
    Write-Host "  Analizando: $nombre ($tamano KB)" -ForegroundColor Green
    
    # Leer contenido
    $contenido = Get-Content $archivo.FullName -Encoding UTF8 -Raw
    
    # Categorizar archivo
    $categoria = "otros"
    if ($nombre -match "(especificacion|basica)") {
        $categoria = "especificaciones"
    } elseif ($nombre -match "(memoria|diseno)") {
        $categoria = "memorias"
    } elseif ($nombre -match "(diagrama|arquitectura)") {
        $categoria = "diagramas"
    } elseif ($nombre -match "(plan|gestion|pruebas)") {
        $categoria = "planes"
    }
    
    # Extraer referencias a ATs
    $referenciasATs = @()
    for ($i = 1; $i -le 10; $i++) {
        $patron = "AT$i"
        $matches = [regex]::Matches($contenido, $patron, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        if ($matches.Count -gt 0) {
            $referenciasATs += "AT$i"
        }
    }
    
    # Extraer palabras clave importantes
    $palabrasClave = @()
    foreach ($patron in $patronesClave) {
        $matches = [regex]::Matches($contenido, $patron, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        if ($matches.Count -gt 0) {
            $palabrasClave += $patron
        }
    }
    
    # Guardar información del archivo
    $todaLaCocina.ingenieria_basica.archivos[$nombre] = @{
        ruta = $rutaRelativa
        tamano_kb = $tamano
        categoria = $categoria
        referencias_ATs = $referenciasATs
        palabras_clave = $palabrasClave
        lineas = $contenido.Split("`n").Count
        caracteres = $contenido.Length
    }
    
    $todaLaCocina.ingenieria_basica.categorias.$categoria += $nombre
    $todaLaCocina.ingenieria_basica.tamano_total_kb += $tamano
    $todaLaCocina.metadata.archivos_analizados++
    $todaLaCocina.metadata.tamano_total_kb += $tamano
}

# Analizar archivos de Contratos
Write-Host ""
Write-Host "ANALIZANDO CONTRATOS..." -ForegroundColor Cyan

$contratosPath = "01. contrato en .md"
if (Test-Path $contratosPath) {
    $archivosContratos = Get-ChildItem "$contratosPath/*.md"
    Write-Host "Archivos encontrados en Contratos: $($archivosContratos.Count)" -ForegroundColor White
    
    foreach ($archivo in $archivosContratos) {
        $nombre = $archivo.Name
        $tamano = [math]::Round($archivo.Length / 1KB, 1)
        
        $categoria = "apendices_tecnicos"
        if ($nombre -match "CONTRATO.*CONCESION") {
            $categoria = "contrato_general"
        }
        
        $todaLaCocina.contratos.archivos[$nombre] = @{
            tamano_kb = $tamano
            categoria = $categoria
        }
        
        $todaLaCocina.contratos.categorias.$categoria += $nombre
        $todaLaCocina.contratos.tamano_total_kb += $tamano
        $todaLaCocina.metadata.archivos_analizados++
        $todaLaCocina.metadata.tamano_total_kb += $tamano
    }
}

$todaLaCocina.metadata.total_archivos = $todaLaCocina.metadata.archivos_analizados

# Mostrar resumen completo
Write-Host ""
Write-Host "RESUMEN COMPLETO DE TODA LA COCINA:" -ForegroundColor Green
Write-Host "  Total archivos analizados: $($todaLaCocina.metadata.total_archivos)" -ForegroundColor White
Write-Host "  Tamano total: $($todaLaCocina.metadata.tamano_total_kb) KB" -ForegroundColor White

Write-Host ""
Write-Host "INGENIERIA CONCEPTUAL:" -ForegroundColor Cyan
Write-Host "  Archivos: $($todaLaCocina.ingenieria_conceptual.archivos.Count)" -ForegroundColor White
Write-Host "  Tamano: $($todaLaCocina.ingenieria_conceptual.tamano_total_kb) KB" -ForegroundColor White
Write-Host "  Trazabilidad: $($todaLaCocina.ingenieria_conceptual.categorias.trazabilidad.Count)" -ForegroundColor White
Write-Host "  Sistemas Integrados: $($todaLaCocina.ingenieria_conceptual.categorias.sistemas_integrados.Count)" -ForegroundColor White
Write-Host "  Criterios: $($todaLaCocina.ingenieria_conceptual.categorias.criterios.Count)" -ForegroundColor White
Write-Host "  ITCS: $($todaLaCocina.ingenieria_conceptual.categorias.itcs.Count)" -ForegroundColor White

Write-Host ""
Write-Host "INGENIERIA BASICA:" -ForegroundColor Cyan
Write-Host "  Archivos: $($todaLaCocina.ingenieria_basica.archivos.Count)" -ForegroundColor White
Write-Host "  Tamano: $($todaLaCocina.ingenieria_basica.tamano_total_kb) KB" -ForegroundColor White
Write-Host "  Especificaciones: $($todaLaCocina.ingenieria_basica.categorias.especificaciones.Count)" -ForegroundColor White
Write-Host "  Memorias: $($todaLaCocina.ingenieria_basica.categorias.memorias.Count)" -ForegroundColor White
Write-Host "  Diagramas: $($todaLaCocina.ingenieria_basica.categorias.diagramas.Count)" -ForegroundColor White
Write-Host "  Planes: $($todaLaCocina.ingenieria_basica.categorias.planes.Count)" -ForegroundColor White

Write-Host ""
Write-Host "CONTRATOS:" -ForegroundColor Cyan
Write-Host "  Archivos: $($todaLaCocina.contratos.archivos.Count)" -ForegroundColor White
Write-Host "  Tamano: $($todaLaCocina.contratos.tamano_total_kb) KB" -ForegroundColor White

# Guardar toda la cocina
$cocinaJson = $todaLaCocina | ConvertTo-Json -Depth 5
$outputFile = "$outputPath/TODA_LA_COCINA_COMPLETA_v1.0.json"
$cocinaJson | Out-File -FilePath $outputFile -Encoding UTF8

Write-Host ""
Write-Host "TODA LA COCINA guardada en: $outputFile" -ForegroundColor Green
Write-Host "Tamano: $([math]::Round((Get-Item $outputFile).Length / 1KB, 1)) KB" -ForegroundColor Gray

Write-Host ""
Write-Host "EXTRACTOR TODA LA COCINA - COMPLETADO" -ForegroundColor Green
