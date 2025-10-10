# SCRIPT: Sincronizar MATRIZ_RIESGOS_PMO con WBS_Analisis_Riesgos.html
# Convierte Markdown a JSON/JS para carga dinámica

Write-Host "`nSincronizando Matriz de Riesgos con interfaz HTML..." -ForegroundColor Green

$matrizPath = "VIII. Documentos Maestros y Metodologia\Matrices_Dependencias\MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md"
$outputJS = "IX. WBS y Planificacion\riesgos_proyecto.js"

# Verificar que matriz existe
if (!(Test-Path $matrizPath)) {
    Write-Host "[ERROR] Matriz no encontrada: $matrizPath" -ForegroundColor Red
    Write-Host "[INFO] Creando matriz con riesgos demo..." -ForegroundColor Cyan
    
    # Crear matriz demo
    $matrizDemo = @"
# MATRIZ DE RIESGOS PMO AMPLIADA v1.0

| ID | Categoría | Descripción | Probabilidad | Impacto | Estrategia | Responsable | Estado | Fuente | Origen_Decisión | Hito_Verificación | Vinculación_Contractual | Fecha | Acción_Requerida |
|----|-----------|-------------|--------------|---------|------------|-------------|--------|--------|-----------------|-------------------|------------------------|-------|------------------|
| R-FIBRA-003 | Técnico | Espaciamiento 300m aumenta CAPEX | Alta | Alto | Mitigar: Analizar alternativas 350m-400m | Especialista Fibra | Activo | Inicial | N/A | Ingeniería Detalle | AT1-Sección-2.1 | 2025-10-07 | ANALIZAR |
| R-TETRA-001 | Técnico | Cantidad torres insuficiente genera zonas sin cobertura | Media | Alto | Mitigar: Validar con estudio propagación | Especialista TETRA | Activo | Inicial | N/A | Pruebas Cobertura | AT1-Sección-3.1 | 2025-10-07 | VALIDAR |
"@
    
    New-Item -Path (Split-Path $matrizPath -Parent) -ItemType Directory -Force | Out-Null
    $matrizDemo | Out-File -FilePath $matrizPath -Encoding UTF8 -Force
    Write-Host "[OK] Matriz demo creada" -ForegroundColor Green
}

# Leer matriz
$contenido = Get-Content $matrizPath -Raw -Encoding UTF8
$lineas = $contenido -split "`n"

# Parsear tabla
$riesgos = @()
$enTabla = $false

foreach ($linea in $lineas) {
    # Detectar inicio tabla
    if ($linea -match '^\|\s*ID\s*\|.*Vinculación_Contractual') {
        $enTabla = $true
        continue
    }
    
    # Saltar separadores
    if ($linea -match '^\|[\s\-:]+\|') {
        continue
    }
    
    # Parsear fila de riesgo
    if ($enTabla -and $linea -match '^\|\s*R-') {
        $campos = $linea -split '\|' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
        
        if ($campos.Count -ge 8) {
            # Calcular nivel de riesgo
            $prob = $campos[3]
            $imp = $campos[4]
            $nivel = "MEDIO"
            
            if ($prob -eq "Alta" -and ($imp -eq "Alto" -or $imp -eq "Crítico" -or $imp -eq "Critico")) {
                $nivel = "CRITICO"
            }
            elseif ($prob -eq "Alta" -or $imp -eq "Alto") {
                $nivel = "ALTO"
            }
            elseif ($prob -eq "Baja" -and $imp -eq "Bajo") {
                $nivel = "BAJO"
            }
            
            $riesgo = [PSCustomObject]@{
                id = $campos[0]
                categoria = $campos[1]
                descripcion = $campos[2]
                probabilidad = $campos[3]
                impacto = $campos[4]
                nivel_riesgo = $nivel
                estrategia = $campos[5]
                responsable = $campos[6]
                estado = $campos[7]
                fuente = if ($campos.Count -gt 8) { $campos[8] } else { "Inicial" }
                origen_decision = if ($campos.Count -gt 9) { $campos[9] } else { "N/A" }
                hito_verificacion = if ($campos.Count -gt 10) { $campos[10] } else { "N/A" }
                vinculacion_contractual = if ($campos.Count -gt 11) { $campos[11] } else { "N/A" }
                fecha_identificacion = if ($campos.Count -gt 12) { $campos[12] } else { (Get-Date -Format "yyyy-MM-dd") }
                accion_requerida = if ($campos.Count -gt 13) { $campos[13] } else { "REVISAR" }
            }
            
            $riesgos += $riesgo
        }
    }
    
    # Detectar fin de tabla
    if ($enTabla -and $linea -match '^[^|]' -and $linea.Trim() -ne '') {
        $enTabla = $false
    }
}

Write-Host "[OK] Riesgos parseados: $($riesgos.Count)" -ForegroundColor Green

# Generar estadísticas
$criticos = ($riesgos | Where-Object { $_.nivel_riesgo -eq "CRITICO" }).Count
$altos = ($riesgos | Where-Object { $_.nivel_riesgo -eq "ALTO" }).Count
$medios = ($riesgos | Where-Object { $_.nivel_riesgo -eq "MEDIO" }).Count
$bajos = ($riesgos | Where-Object { $_.nivel_riesgo -eq "BAJO" }).Count

Write-Host "`nESTADISTICAS:" -ForegroundColor Yellow
Write-Host "  CRITICOS: $criticos" -ForegroundColor Red
Write-Host "  ALTOS: $altos" -ForegroundColor Yellow
Write-Host "  MEDIOS: $medios" -ForegroundColor Cyan
Write-Host "  BAJOS: $bajos" -ForegroundColor Green

# Por estrategia
$evitados = ($riesgos | Where-Object { $_.estrategia -match "Evitar" }).Count
$mitigados = ($riesgos | Where-Object { $_.estrategia -match "Mitigar" }).Count
$aceptados = ($riesgos | Where-Object { $_.estrategia -match "Aceptar" }).Count
$asumidos = ($riesgos | Where-Object { $_.estrategia -match "Asumir" }).Count

Write-Host "`nPOR ESTRATEGIA:" -ForegroundColor Yellow
Write-Host "  EVITAR: $evitados" -ForegroundColor Red
Write-Host "  MITIGAR: $mitigados" -ForegroundColor Yellow
Write-Host "  ACEPTAR: $aceptados" -ForegroundColor Green
Write-Host "  ASUMIR: $asumidos" -ForegroundColor Cyan

# Generar JS
$jsContent = @"
// Riesgos del Proyecto - Generado automáticamente desde MATRIZ_RIESGOS_PMO_AMPLIADA
// Fecha: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
// Total: $($riesgos.Count) riesgos

const riesgosProyecto = $($riesgos | ConvertTo-Json -Depth 5);

// Estadísticas
const estadisticasRiesgos = {
    total: $($riesgos.Count),
    criticos: $criticos,
    altos: $altos,
    medios: $medios,
    bajos: $bajos,
    evitados: $evitados,
    mitigados: $mitigados,
    aceptados: $aceptados,
    asumidos: $asumidos,
    fecha_actualizacion: "$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")"
};
"@

$jsContent | Out-File -FilePath $outputJS -Encoding UTF8

Write-Host "`n[OK] Archivo JS generado: $outputJS" -ForegroundColor Green
Write-Host "[INFO] Recarga WBS_Analisis_Riesgos.html para ver cambios" -ForegroundColor Cyan
Write-Host "`nPresiona Enter para continuar..."
Read-Host

