# COMBINADOR TODA LA COCINA - Completo
# Combina contratos + conceptual + basica + validaciones DTs
# Version: 1.0 | Fecha: 10 Octubre 2025

Write-Host "COMBINADOR TODA LA COCINA - Completo" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

$outputPath = "VIII. Documentos Maestros y Metodologia"

# Cargar TODA la cocina extraida
$cocinaFile = "$outputPath/TODA_LA_COCINA_COMPLETA_v1.0.json"
$recetaFile = "$outputPath/RECETA_COMBINADA_COMPLETA_v1.0.json"

if (-not (Test-Path $cocinaFile)) {
    Write-Host "ERROR: No se encuentra $cocinaFile" -ForegroundColor Red
    exit 1
}

Write-Host "Cargando TODA la cocina..." -ForegroundColor Yellow
$contenidoCocina = Get-Content $cocinaFile -Raw
$todaLaCocina = $contenidoCocina | ConvertFrom-Json

Write-Host "Tamano de cocina cargada: $([math]::Round((Get-Item $cocinaFile).Length / 1KB, 1)) KB" -ForegroundColor Gray

# Crear receta final completa
$recetaFinal = @{
    metadata = @{
        version = "1.0"
        fecha = "2025-10-10"
        descripcion = "RECETA FINAL COMPLETA - Toda la cocina combinada"
        total_archivos = $todaLaCocina.metadata.total_archivos
        tamano_total_kb = $todaLaCocina.metadata.tamano_total_kb
        fuentes = @("Contratos", "Ingenieria_Conceptual", "Ingenieria_Basica")
    }
    
    # INFRAESTRUCTURA FISICA (del contrato + conceptual + basica)
    infraestructura_fisica = @{
        ufvf = @()  # 56 UFVF del AT1
        uf = @()    # 3 UF del AT1
        puentes = @()  # del AT1 + conceptual
        estaciones = @()  # del AT1 + conceptual
        apartaderos = @()  # del AT1
        escuelas = @()  # del AT1
        pasos_nivel = @()  # del AT1
        edificaciones = @()  # del conceptual + basica
        alcantarillas = @()  # del AT8 + basica
        box_culverts = @()  # del AT8 + basica
        drenajes = @()  # del AT8 + basica
    }
    
    # SISTEMAS TECNICOS (del contrato + conceptual + basica)
    sistemas_tecnicos = @{
        control_senalizacion = @{
            ctc = @()  # del AT2 + conceptual
            etcs = @()  # del AT2 + conceptual
            rbc = @()  # del AT2 + conceptual
            atp = @()  # del AT2 + conceptual
            balizas = @()  # del AT2 + conceptual (virtual segun DTs)
            senalizacion = @()  # del AT2 + conceptual
            interlocking = @()  # del AT2 + conceptual
        }
        telecomunicaciones = @{
            tetra = @()  # del AT4 + conceptual
            fibra_optica = @()  # del AT4 + conceptual
            radio = @()  # del AT4 + conceptual
            redes = @()  # del AT4 + conceptual
            antenas = @()  # del AT4 + conceptual
            estaciones_base = @()  # del AT4 + conceptual
            nodos = @()  # del AT4 + conceptual
        }
        its_seguridad = @{
            cctv = @()  # del AT5 + conceptual
            hbd = @()  # del AT5 + conceptual
            seguridad = @()  # del AT5 + conceptual
            monitoreo = @()  # del AT5 + conceptual
            camaras = @()  # del AT5 + conceptual
            detectores = @()  # del AT5 + conceptual
            alarmas = @()  # del AT5 + conceptual
        }
        material_rodante = @{
            locomotoras = @()  # del AT6 + conceptual
            coches = @()  # del AT6 + conceptual
            vagones = @()  # del AT6 + conceptual
            vehiculos = @()  # del AT6 + conceptual
        }
    }
    
    # ESPECIFICACIONES TECNICAS (del conceptual + basica)
    especificaciones_tecnicas = @{
        normas = @()  # del conceptual
        tipologias = @()  # del conceptual + basica
        criterios = @()  # del conceptual
        metodos = @()  # del conceptual + basica
        interoperabilidad = @()  # del conceptual
        redundancia = @()  # del conceptual
        ciberseguridad = @()  # del conceptual
    }
    
    # CUMPLIMIENTO CONTRACTUAL (como se da cumplimiento)
    cumplimiento_contractual = @{
        trazabilidad = @()  # del conceptual
        sistemas_integrados = @()  # del conceptual
        estimaciones = @()  # del conceptual
        wbs = @()  # del conceptual
        memorias = @()  # del basica
        diagramas = @()  # del basica
        planos = @()  # del basica
        planes = @()  # del basica
    }
    
    # VALIDACIONES DTs (contra decisiones tecnicas)
    validaciones_dts = @{
        senalizacion_virtual = @{
            dt = "DT-CTC-001"
            estado = "VALIDADO"
            criterio = "NO balizas fisicas"
            accion = "Eliminar balizas Eurobalise"
        }
        tetra_37_estaciones = @{
            dt = "DT-TETRA-001"
            estado = "PENDIENTE_VALIDAR"
            criterio = "37 estaciones TETRA"
            accion = "Ajustar cantidad"
        }
        puentes_priorizados = @{
            dt = "DT-PUENTES-001"
            estado = "PENDIENTE_VALIDAR"
            criterio = "Solo Tabla 9 AT1"
            accion = "Validar contra AT1"
        }
    }
}

Write-Host ""
Write-Host "Procesando infraestructura fisica..." -ForegroundColor Yellow

# Procesar infraestructura fisica desde conceptual
foreach ($archivo in $todaLaCocina.ingenieria_conceptual.archivos.GetEnumerator()) {
    $info = $archivo.Value
    $nombre = $archivo.Key
    
    # Extraer UFVF
    if ($info.palabras_clave -contains "UFVF") {
        $recetaFinal.infraestructura_fisica.ufvf += $nombre
    }
    
    # Extraer puentes
    if ($info.palabras_clave -contains "puente") {
        $recetaFinal.infraestructura_fisica.puentes += $nombre
    }
    
    # Extraer estaciones
    if ($info.palabras_clave -contains "estacion") {
        $recetaFinal.infraestructura_fisica.estaciones += $nombre
    }
}

Write-Host "  UFVF encontradas: $($recetaFinal.infraestructura_fisica.ufvf.Count)" -ForegroundColor Green
Write-Host "  Puentes encontrados: $($recetaFinal.infraestructura_fisica.puentes.Count)" -ForegroundColor Green
Write-Host "  Estaciones encontradas: $($recetaFinal.infraestructura_fisica.estaciones.Count)" -ForegroundColor Green

Write-Host ""
Write-Host "Procesando sistemas tecnicos..." -ForegroundColor Yellow

# Procesar sistemas tecnicos desde conceptual
foreach ($archivo in $todaLaCocina.ingenieria_conceptual.archivos.GetEnumerator()) {
    $info = $archivo.Value
    $nombre = $archivo.Key
    
    # Sistemas de control
    if ($info.palabras_clave -contains "CTC") {
        $recetaFinal.sistemas_tecnicos.control_senalizacion.ctc += $nombre
    }
    if ($info.palabras_clave -contains "ETCS") {
        $recetaFinal.sistemas_tecnicos.control_senalizacion.etcs += $nombre
    }
    if ($info.palabras_clave -contains "RBC") {
        $recetaFinal.sistemas_tecnicos.control_senalizacion.rbc += $nombre
    }
    if ($info.palabras_clave -contains "baliza") {
        $recetaFinal.sistemas_tecnicos.control_senalizacion.balizas += $nombre
    }
    
    # Telecomunicaciones
    if ($info.palabras_clave -contains "TETRA") {
        $recetaFinal.sistemas_tecnicos.telecomunicaciones.tetra += $nombre
    }
    if ($info.palabras_clave -contains "fibra") {
        $recetaFinal.sistemas_tecnicos.telecomunicaciones.fibra_optica += $nombre
    }
    
    # ITS y Seguridad
    if ($info.palabras_clave -contains "CCTV") {
        $recetaFinal.sistemas_tecnicos.its_seguridad.cctv += $nombre
    }
}

Write-Host "  CTC encontrados: $($recetaFinal.sistemas_tecnicos.control_senalizacion.ctc.Count)" -ForegroundColor Green
Write-Host "  TETRA encontrados: $($recetaFinal.sistemas_tecnicos.telecomunicaciones.tetra.Count)" -ForegroundColor Green
Write-Host "  CCTV encontrados: $($recetaFinal.sistemas_tecnicos.its_seguridad.cctv.Count)" -ForegroundColor Green

Write-Host ""
Write-Host "Procesando especificaciones tecnicas..." -ForegroundColor Yellow

# Procesar especificaciones desde conceptual
foreach ($archivo in $todaLaCocina.ingenieria_conceptual.categorias.criterios) {
    $recetaFinal.especificaciones_tecnicas.criterios += $archivo
}

foreach ($archivo in $todaLaCocina.ingenieria_conceptual.categorias.itcs) {
    $recetaFinal.especificaciones_tecnicas.criterios += $archivo
}

Write-Host "  Criterios encontrados: $($recetaFinal.especificaciones_tecnicas.criterios.Count)" -ForegroundColor Green

Write-Host ""
Write-Host "Procesando cumplimiento contractual..." -ForegroundColor Yellow

# Procesar cumplimiento desde conceptual
foreach ($archivo in $todaLaCocina.ingenieria_conceptual.categorias.trazabilidad) {
    $recetaFinal.cumplimiento_contractual.trazabilidad += $archivo
}

foreach ($archivo in $todaLaCocina.ingenieria_conceptual.categorias.sistemas_integrados) {
    $recetaFinal.cumplimiento_contractual.sistemas_integrados += $archivo
}

foreach ($archivo in $todaLaCocina.ingenieria_conceptual.categorias.wbs) {
    $recetaFinal.cumplimiento_contractual.wbs += $archivo
}

# Procesar cumplimiento desde basica
foreach ($archivo in $todaLaCocina.ingenieria_basica.categorias.especificaciones) {
    $recetaFinal.cumplimiento_contractual.memorias += $archivo
}

foreach ($archivo in $todaLaCocina.ingenieria_basica.categorias.diagramas) {
    $recetaFinal.cumplimiento_contractual.diagramas += $archivo
}

foreach ($archivo in $todaLaCocina.ingenieria_basica.categorias.planes) {
    $recetaFinal.cumplimiento_contractual.planes += $archivo
}

Write-Host "  Trazabilidad: $($recetaFinal.cumplimiento_contractual.trazabilidad.Count)" -ForegroundColor Green
Write-Host "  Sistemas integrados: $($recetaFinal.cumplimiento_contractual.sistemas_integrados.Count)" -ForegroundColor Green
Write-Host "  Memorias: $($recetaFinal.cumplimiento_contractual.memorias.Count)" -ForegroundColor Green
Write-Host "  Diagramas: $($recetaFinal.cumplimiento_contractual.diagramas.Count)" -ForegroundColor Green
Write-Host "  Planes: $($recetaFinal.cumplimiento_contractual.planes.Count)" -ForegroundColor Green

Write-Host ""
Write-Host "Aplicando validaciones DTs..." -ForegroundColor Yellow

# Aplicar validaciones DTs
if ($recetaFinal.sistemas_tecnicos.control_senalizacion.balizas.Count -eq 0) {
    $recetaFinal.validaciones_dts.senalizacion_virtual.estado = "CUMPLIDO"
    $recetaFinal.validaciones_dts.senalizacion_virtual.accion = "OK - No hay balizas fisicas"
} else {
    $recetaFinal.validaciones_dts.senalizacion_virtual.estado = "ERROR"
    $recetaFinal.validaciones_dts.senalizacion_virtual.accion = "ELIMINAR $($recetaFinal.sistemas_tecnicos.control_senalizacion.balizas.Count) referencias a balizas"
}

if ($recetaFinal.sistemas_tecnicos.telecomunicaciones.tetra.Count -eq 37) {
    $recetaFinal.validaciones_dts.tetra_37_estaciones.estado = "CUMPLIDO"
    $recetaFinal.validaciones_dts.tetra_37_estaciones.accion = "OK - Cantidad correcta"
} else {
    $recetaFinal.validaciones_dts.tetra_37_estaciones.estado = "AJUSTAR"
    $recetaFinal.validaciones_dts.tetra_37_estaciones.accion = "Ajustar a 37 estaciones (actual: $($recetaFinal.sistemas_tecnicos.telecomunicaciones.tetra.Count))"
}

Write-Host "  Senalizacion virtual: $($recetaFinal.validaciones_dts.senalizacion_virtual.estado)" -ForegroundColor $(if($recetaFinal.validaciones_dts.senalizacion_virtual.estado -eq "CUMPLIDO") {"Green"} else {"Red"})
Write-Host "  TETRA 37 estaciones: $($recetaFinal.validaciones_dts.tetra_37_estaciones.estado)" -ForegroundColor $(if($recetaFinal.validaciones_dts.tetra_37_estaciones.estado -eq "CUMPLIDO") {"Green"} else {"Yellow"})

# Mostrar resumen final
Write-Host ""
Write-Host "RESUMEN FINAL DE TODA LA COCINA COMBINADA:" -ForegroundColor Green
Write-Host "  Total archivos procesados: $($recetaFinal.metadata.total_archivos)" -ForegroundColor White
Write-Host "  Tamano total: $($recetaFinal.metadata.tamano_total_kb) KB" -ForegroundColor White

Write-Host ""
Write-Host "INFRAESTRUCTURA FISICA:" -ForegroundColor Cyan
Write-Host "  UFVF: $($recetaFinal.infraestructura_fisica.ufvf.Count)" -ForegroundColor White
Write-Host "  Puentes: $($recetaFinal.infraestructura_fisica.puentes.Count)" -ForegroundColor White
Write-Host "  Estaciones: $($recetaFinal.infraestructura_fisica.estaciones.Count)" -ForegroundColor White

Write-Host ""
Write-Host "SISTEMAS TECNICOS:" -ForegroundColor Cyan
Write-Host "  CTC: $($recetaFinal.sistemas_tecnicos.control_senalizacion.ctc.Count)" -ForegroundColor White
Write-Host "  TETRA: $($recetaFinal.sistemas_tecnicos.telecomunicaciones.tetra.Count)" -ForegroundColor White
Write-Host "  CCTV: $($recetaFinal.sistemas_tecnicos.its_seguridad.cctv.Count)" -ForegroundColor White

Write-Host ""
Write-Host "CUMPLIMIENTO CONTRACTUAL:" -ForegroundColor Cyan
Write-Host "  Trazabilidad: $($recetaFinal.cumplimiento_contractual.trazabilidad.Count)" -ForegroundColor White
Write-Host "  Sistemas integrados: $($recetaFinal.cumplimiento_contractual.sistemas_integrados.Count)" -ForegroundColor White
Write-Host "  Memorias: $($recetaFinal.cumplimiento_contractual.memorias.Count)" -ForegroundColor White
Write-Host "  Diagramas: $($recetaFinal.cumplimiento_contractual.diagramas.Count)" -ForegroundColor White

Write-Host ""
Write-Host "VALIDACIONES DTs:" -ForegroundColor Cyan
Write-Host "  Senalizacion virtual: $($recetaFinal.validaciones_dts.senalizacion_virtual.estado)" -ForegroundColor $(if($recetaFinal.validaciones_dts.senalizacion_virtual.estado -eq "CUMPLIDO") {"Green"} else {"Red"})
Write-Host "  TETRA 37 estaciones: $($recetaFinal.validaciones_dts.tetra_37_estaciones.estado)" -ForegroundColor $(if($recetaFinal.validaciones_dts.tetra_37_estaciones.estado -eq "CUMPLIDO") {"Green"} else {"Yellow"})

# Guardar receta final
$recetaJson = $recetaFinal | ConvertTo-Json -Depth 5
$outputFile = "$outputPath/RECETA_FINAL_COMPLETA_v1.0.json"
$recetaJson | Out-File -FilePath $outputFile -Encoding UTF8

Write-Host ""
Write-Host "RECETA FINAL guardada en: $outputFile" -ForegroundColor Green
Write-Host "Tamano: $([math]::Round((Get-Item $outputFile).Length / 1KB, 1)) KB" -ForegroundColor Gray

Write-Host ""
Write-Host "COMBINADOR TODA LA COCINA - COMPLETADO" -ForegroundColor Green
Write-Host "   Listo para generar layout integral completo" -ForegroundColor Gray
