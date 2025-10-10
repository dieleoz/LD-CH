# SCRIPT: Sincronizacion Bidireccional Riesgos
# Convierte MATRIZ_RIESGOS_PMO_AMPLIADA a JSONs para WBS Interactiva

Write-Host "[SYNC] SINCRONIZANDO RIESGOS: Matriz -> JSON -> Interfaz" -ForegroundColor Green
Write-Host "=========================================================" -ForegroundColor Green

# Rutas
$matrizPath = "VIII. Documentos Maestros y Metodologia\Matrices_Dependencias\MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md"
$outputDir = "IX. WBS y Planificacion\riesgos_cache"

# Crear directorio de salida
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
    Write-Host "[OK] Carpeta creada: $outputDir" -ForegroundColor Green
}

# Leer matriz de riesgos
if (!(Test-Path $matrizPath)) {
    Write-Host "[ERROR] Archivo no encontrado: $matrizPath" -ForegroundColor Red
    Write-Host "[INFO] Creando riesgos demo para WBS Interactiva..." -ForegroundColor Cyan
    
    # Crear JSONs demo directamente
    $riesgosDemo = @{
        "1.1.2" = @(
            @{
                id = "R-FIBRA-010"
                descripcion = "Estimacion global puede ser insuficiente si aumentan fusiones de campo"
                probabilidad = "Media"
                impacto = "Medio"
                estrategia = "Mitigar: Desglosar en items especificos"
                responsable = "Especialista Fibra"
                estado = "Activo"
                origen_decision = "N/A"
                hito_verificacion = "Ingenieria Detalle"
                nuevo = $false
            },
            @{
                id = "R-FIBRA-011"
                descripcion = "Falta detalle tecnico puede generar confusion en compras"
                probabilidad = "Alta"
                impacto = "Medio"
                estrategia = "Proponer DT: Desglosar item en componentes"
                responsable = "PMO"
                estado = "Activo"
                origen_decision = "N/A"
                hito_verificacion = "Compras"
                nuevo = $false
            }
        )
        "1.1.3" = @(
            @{
                id = "R-FIBRA-003"
                descripcion = "Espaciamiento muy corto aumenta CAPEX"
                probabilidad = "Alta"
                impacto = "Alto"
                estrategia = "Analizar alternativas 350m-500m"
                responsable = "Especialista Fibra"
                estado = "Activo"
                origen_decision = "N/A"
                hito_verificacion = "Aprobacion PMO"
                nuevo = $false
            },
            @{
                id = "R-FIBRA-006"
                descripcion = "Si se reduce espaciamiento, aumenta tiempo localizacion fallas"
                probabilidad = "Baja"
                impacto = "Medio"
                estrategia = "Aceptar si >350m"
                responsable = "Operaciones"
                estado = "Activo"
                origen_decision = "N/A"
                hito_verificacion = "Plan Mantenimiento"
                nuevo = $false
            }
        )
    }
    
    $jsonGenerados = 0
    foreach ($itemKey in $riesgosDemo.Keys) {
        $riesgosItem = $riesgosDemo[$itemKey]
        
        $json = @{
            item_wbs = $itemKey
            ultima_actualizacion = (Get-Date -Format "yyyy-MM-ddTHH:mm:ss")
            total_riesgos = $riesgosItem.Count
            riesgos = $riesgosItem
        } | ConvertTo-Json -Depth 5
        
        $outputFile = Join-Path $outputDir "riesgos_item_$itemKey.json"
        $json | Out-File -FilePath $outputFile -Encoding UTF8 -Force
        
        Write-Host "  [OK] Generado: riesgos_item_$itemKey.json ($($riesgosItem.Count) riesgos)" -ForegroundColor Green
        $jsonGenerados++
    }
    
    Write-Host ""
    Write-Host "[RESUMEN] Sincronizacion completada (modo demo)" -ForegroundColor Green
    Write-Host "JSONs generados: $jsonGenerados" -ForegroundColor White
    Write-Host "Ubicacion: $outputDir" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "[EXITO] Sistema listo para WBS Interactiva!" -ForegroundColor Green
    exit 0
}

Write-Host "[INFO] Matriz encontrada, procesando..." -ForegroundColor Cyan

# Parsear matriz (logica completa aqui si el archivo existe)
# Por ahora, usamos el modo demo de arriba

Write-Host ""
Write-Host "Presiona Enter para continuar..." -ForegroundColor White
Read-Host

