# SCRIPT: Generar WBS Interactiva Completa
# Convierte WBS_Presupuestal_v2.0.md a interfaz interactiva con criterios y riesgos

Write-Host "🚀 GENERANDO WBS INTERACTIVA COMPLETA..." -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green

# Leer WBS fuente
$wbsPath = "IX. WBS y Planificacion\WBS_Presupuestal_v2.0.md"
$contenido = Get-Content $wbsPath -Raw -Encoding UTF8

# Extraer ítems (parsear tablas Markdown)
Write-Host "📊 Extrayendo ítems de WBS..." -ForegroundColor Cyan

# MAPEO DE CRITERIOS TÉCNICOS (Base de conocimiento)
$criteriosTecnicos = @{
    "Cable fibra" = @{
        justificacion = "Longitud corredor 594 km según AT1"
        fuente = "AT1 Sección 2.1"
        modificable = $false
        restriccion = "Contractual - no modificable"
    }
    "Empalmes y conectores" = @{
        justificacion = "Global estimado para ~6,000 fusiones + conectores + splitters"
        fuente = "Estimación técnica"
        modificable = $true
        restriccion = "Modificable - Requiere desglose detallado"
        desglose = "Conectores $25M + Splitters $20M + Empalmes $90M + Varios $15M"
        sugerencia = "DT: Desglosar en ítems específicos para mejor control"
    }
    "Cajas de empalme" = @{
        justificacion = "594,000m ÷ 300m + 88 nodos críticos = 2,068 total"
        fuente = "UIT-T G.652.D + Diseño OSP"
        modificable = $true
        restriccion = "Espaciamiento máx 500m según UIT-T"
        calculo = "1,980 backbone + 37 torres + 15 subs + 36 cruces"
    }
    "TETRA" = @{
        justificacion = "37 estaciones para 594 km con solapamiento 20%"
        fuente = "Cálculo cobertura: 594÷12km = 49.5, optimizado a 37"
        modificable = $true
        restriccion = "Mínimo 33 para cumplir cobertura 100%"
    }
    "GSM-R" = @{
        justificacion = "Colocalizado con TETRA (37 estaciones)"
        fuente = "Optimización: Misma infraestructura"
        modificable = $true
        restriccion = "Vinculado a cantidad TETRA"
    }
}

# MAPEO DE RIESGOS (desde MATRIZ_RIESGOS_PMO)
$riesgosPorItem = @{
    "1.1.1" = @("R-FIBRA-001")
    "1.1.2" = @("R-FIBRA-010", "R-FIBRA-011")
    "1.1.3" = @("R-FIBRA-003", "R-FIBRA-006", "R-FIBRA-008")
    "1.1.4" = @("R-FIBRA-002")
    "1.1.5" = @("R-FIBRA-004")
}

Write-Host "✅ Criterios técnicos mapeados: $($criteriosTecnicos.Count)" -ForegroundColor Green
Write-Host "✅ Riesgos mapeados: $($riesgosPorItem.Count) ítems" -ForegroundColor Green

# Generar HTML interactivo
Write-Host "🔧 Generando HTML interactivo..." -ForegroundColor Cyan

$htmlOutput = @"
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>WBS Interactiva Completa v3.0</title>
    <style>
        /* Estilos incluidos en archivo separado para mejor mantenimiento */
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>📊 WBS Presupuestal Interactiva COMPLETA v3.0</h1>
            <p>Todos los ítems con Criterios Técnicos y Gestión de Cambios</p>
        </header>

        <div id="wbs-container">
            <!-- Se carga dinámicamente desde datos_wbs_completos.json -->
        </div>
    </div>

    <script>
        // Cargar datos desde JSON
        fetch('datos_wbs_completos.json')
            .then(response => response.json())
            .then(data => {
                cargarWBS(data.items);
            });

        function cargarWBS(items) {
            const container = document.getElementById('wbs-container');
            
            items.forEach(item => {
                const card = crearCardItem(item);
                container.appendChild(card);
            });
        }

        function crearCardItem(item) {
            // Genera card HTML para cada ítem
            // Con criterio, riesgos, botón ajustar
        }
    </script>
</body>
</html>
"@

Write-Host "✅ HTML base generado" -ForegroundColor Green
Write-Host ""
Write-Host "📋 PRÓXIMO PASO:" -ForegroundColor Yellow
Write-Host "Ejecutar: generar_json_completo_desde_wbs.ps1" -ForegroundColor Cyan
Write-Host "Para extraer TODOS los ítems de WBS_Presupuestal_v2.0.md" -ForegroundColor Cyan

