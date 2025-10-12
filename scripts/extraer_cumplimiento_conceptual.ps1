# EXTRACTOR CUMPLIMIENTO - Ingenieria Conceptual
# Extrae como se da cumplimiento a los ATs del contrato
# Version: 1.0 | Fecha: 10 Octubre 2025

Write-Host "EXTRACTOR CUMPLIMIENTO - Ingenieria Conceptual" -ForegroundColor Cyan
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$conceptualPath = "III. Ingenieria conceptual"
$outputPath = "VIII. Documentos Maestros y Metodologia"

if (-not (Test-Path $conceptualPath)) {
    Write-Host "ERROR: No se encuentra $conceptualPath" -ForegroundColor Red
    exit 1
}

Write-Host "Analizando documentos de cumplimiento..." -ForegroundColor Yellow

# Archivos clave de cumplimiento
$archivosCumplimiento = @{
    "Sistema_CTC_Integrado" = "26. Sistem_CTC_Int  AT1(CCO) + AT2(op) + AT3(esp) + AT4(ind) + AT9(cro).md"
    "Sistema_TETRA_Integrado" = "27_Sistema_TETRA_Integrado_v5.0.md"
    "Sistema_Senalizacion_Integrado" = "29_Sistema_Senalizacion_Integrado_v5.0.md"
    "Sistema_CCTV_Integrado" = "31_Sistema_CCTV_Integrado_docx_AT1_AT3_AT8_social_AT4_indicadores.md"
    "Sistema_FibraOptica_Integrado" = "28_Sistema_FibraOptica_Integrado_docx_AT1_AT3_AT5_interferencias_AT7_predios.md"
    "Material_Rodante_Integrado" = "32_Material_Rodante_Integrado_v5.0.md"
    "WBS_Completa_Especialidades" = "25.1_WBS_COMPLETA_ESPECIALIDADES_v5.0.md"
    "Matriz_Trazabilidad_Contractual" = "24_Matriz_TrazabilidadContractual_xlsx_Jerarqu_a_documental_aplicada_a_ingenier_a.md"
}

Write-Host ""
Write-Host "ARCHIVOS DE CUMPLIMIENTO IDENTIFICADOS:" -ForegroundColor Cyan

$cumplimientoEncontrado = @{
    metadata = @{
        version = "1.0"
        fecha = "2025-10-10"
        descripcion = "Cumplimiento de ATs en Ingenieria Conceptual"
        total_documentos = 0
        documentos_analizados = 0
    }
    
    cumplimiento_por_sistema = @{}
    
    trazabilidad_contractual = @{
        AT1 = @()
        AT2 = @()
        AT3 = @()
        AT4 = @()
        AT5 = @()
        AT6 = @()
        AT7 = @()
        AT8 = @()
        AT9 = @()
        AT10 = @()
    }
    
    sistemas_integrados = @{}
}

foreach ($sistema in $archivosCumplimiento.Keys) {
    $archivo = $archivosCumplimiento[$sistema]
    $rutaCompleta = "$conceptualPath/$archivo"
    
    if (Test-Path $rutaCompleta) {
        $size = [math]::Round((Get-Item $rutaCompleta).Length / 1KB, 1)
        Write-Host "  OK $sistema ($size KB)" -ForegroundColor Green
        
        $cumplimientoEncontrado.metadata.documentos_analizados++
        
        # Analizar contenido del archivo
        $contenido = Get-Content $rutaCompleta -Encoding UTF8 -Raw
        
        # Extraer referencias a ATs
        $referenciasATs = @()
        for ($i = 1; $i -le 10; $i++) {
            $patron = "AT$i"
            $matches = [regex]::Matches($contenido, $patron, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
            if ($matches.Count -gt 0) {
                $referenciasATs += "AT$i"
                $cumplimientoEncontrado.trazabilidad_contractual."AT$i" += $sistema
            }
        }
        
        $cumplimientoEncontrado.sistemas_integrados[$sistema] = @{
            archivo = $archivo
            tamano_kb = $size
            referencias_ATs = $referenciasATs
            cumplimiento = "INTEGRADO"
        }
        
    } else {
        Write-Host "  ERROR $sistema - NO ENCONTRADO" -ForegroundColor Red
    }
    
    $cumplimientoEncontrado.metadata.total_documentos++
}

Write-Host ""
Write-Host "ANALISIS DE TRAZABILIDAD CONTRACTUAL:" -ForegroundColor Cyan

foreach ($at in $cumplimientoEncontrado.trazabilidad_contractual.Keys) {
    $sistemas = $cumplimientoEncontrado.trazabilidad_contractual[$at]
    if ($sistemas.Count -gt 0) {
        Write-Host "  $at : $($sistemas.Count) sistemas" -ForegroundColor Green
        foreach ($sistema in $sistemas) {
            Write-Host "    - $sistema" -ForegroundColor White
        }
    } else {
        Write-Host "  $at : Sin cumplimiento identificado" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "SISTEMAS INTEGRADOS ENCONTRADOS:" -ForegroundColor Cyan

foreach ($sistema in $cumplimientoEncontrado.sistemas_integrados.Keys) {
    $info = $cumplimientoEncontrado.sistemas_integrados[$sistema]
    Write-Host "  $sistema :" -ForegroundColor Yellow
    Write-Host "    Archivo: $($info.archivo)" -ForegroundColor White
    Write-Host "    Tamano: $($info.tamano_kb) KB" -ForegroundColor White
    Write-Host "    ATs referenciados: $($info.referencias_ATs -join ', ')" -ForegroundColor White
    Write-Host "    Estado: $($info.cumplimiento)" -ForegroundColor Green
}

# Buscar documentos adicionales de cumplimiento
Write-Host ""
Write-Host "BUSCANDO DOCUMENTOS ADICIONALES..." -ForegroundColor Yellow

$archivosAdicionales = Get-ChildItem "$conceptualPath/*.md" | Where-Object { 
    $_.Name -match "(Integrado|Trazabilidad|Cumplimiento|AT[0-9])" 
}

Write-Host "Documentos adicionales encontrados: $($archivosAdicionales.Count)" -ForegroundColor Cyan

foreach ($archivo in $archivosAdicionales) {
    $size = [math]::Round($archivo.Length / 1KB, 1)
    Write-Host "  - $($archivo.Name) ($size KB)" -ForegroundColor White
}

# Guardar cumplimiento encontrado
$cumplimientoJson = $cumplimientoEncontrado | ConvertTo-Json -Depth 4
$outputFile = "$outputPath/CUMPLIMIENTO_CONCEPTUAL_v1.0.json"
$cumplimientoJson | Out-File -FilePath $outputFile -Encoding UTF8

Write-Host ""
Write-Host "RESUMEN FINAL:" -ForegroundColor Green
Write-Host "  Total documentos: $($cumplimientoEncontrado.metadata.total_documentos)" -ForegroundColor White
Write-Host "  Documentos analizados: $($cumplimientoEncontrado.metadata.documentos_analizados)" -ForegroundColor White
Write-Host "  Sistemas integrados: $($cumplimientoEncontrado.sistemas_integrados.Count)" -ForegroundColor White
Write-Host "  Documentos adicionales: $($archivosAdicionales.Count)" -ForegroundColor White

Write-Host ""
Write-Host "Cumplimiento guardado en: $outputFile" -ForegroundColor Green
Write-Host "Tamano: $([math]::Round((Get-Item $outputFile).Length / 1KB, 1)) KB" -ForegroundColor Gray

Write-Host ""
Write-Host "EXTRACTOR CUMPLIMIENTO CONCEPTUAL - COMPLETADO" -ForegroundColor Green
