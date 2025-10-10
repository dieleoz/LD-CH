# ================================================================
#  REGENERAR TODOS LOS EJECUTIVOS DESDE COCINA
#  Ciclo de Mejora: Plato Anterior + Recetas (DTs) + Ingredientes (Cocina) → Plato Mejorado
# ================================================================

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  COCINERO ESPECIALISTA - REGENERACION COMPLETA" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$raiz = Get-Location
$fechaActual = Get-Date -Format "dd/MM/yyyy HH:mm"

# ================================================================
# MAPEO: SISTEMAS → FUENTES EN COCINA
# ================================================================

$mapeoSistemas = @{
    "SISTEMA_01_Control_y_Senalizacion" = @{
        Fuentes = @(
            "III. Ingenieria conceptual\26_Sistema_CTC_Integrado*.md",
            "III. Ingenieria conceptual\29_Sistema_Senalizacion_Integrado*.md"
        )
        DTs = "DT-CTC-*", "DT-INTERFACES-*", "DT-ATP-*", "DT-ENCE-*"
        CapituloWBS = "1"
        Descripcion = "CTC Virtual + ATP/ITCS + ENCE + Desvios"
    }
    "SISTEMA_02_Telecomunicaciones" = @{
        Fuentes = @(
            "III. Ingenieria conceptual\28_Sistema_FibraOptica_Integrado*.md",
            "III. Ingenieria conceptual\27_Sistema_TETRA_Integrado*.md"
        )
        DTs = "DT-FIBRA-*", "DT-TETRA-*", "DT-GSMR-*"
        CapituloWBS = "2"
        Descripcion = "Fibra Optica + TETRA + GSM-R"
    }
    "SISTEMA_03_ITS_y_Seguridad" = @{
        Fuentes = @(
            "III. Ingenieria conceptual\31_Sistema_CCTV_Integrado*.md",
            "III. Ingenieria conceptual\30_Sistema_ITS_Integrado*.md"
        )
        DTs = "DT-CCTV-*", "DT-ITS-*", "DT-PAN-*"
        CapituloWBS = "3"
        Descripcion = "CCTV + ITS + Pasos a Nivel"
    }
    "SISTEMA_04_Material_Rodante" = @{
        Fuentes = @(
            "III. Ingenieria conceptual\32_Material_Rodante_Integrado*.md"
        )
        DTs = "DT-MR-*", "DT-EOT-*", "DT-LOCOMOTORA-*"
        CapituloWBS = "4"
        Descripcion = "Locomotoras + EOT + Equipamiento Embarcado"
    }
    "SISTEMA_05_Infraestructura_Operativa" = @{
        Fuentes = @(
            "V. Ingenieria de detalle\V.4_Sistemas_Potencia*.md"
        )
        DTs = "DT-ENERGIA-*", "DT-SCADA-*", "DT-UPS-*"
        CapituloWBS = "5"
        Descripcion = "Energia + SCADA + UPS + Climatizacion"
    }
    "SISTEMA_06_Integracion_y_Coordinacion" = @{
        Fuentes = @(
            "III. Ingenieria conceptual\34_Criterios_Interoperabilidad*.md"
        )
        DTs = "DT-INTEGRACION-*"
        CapituloWBS = "6"
        Descripcion = "Integracion + Coordinacion + Gestion"
    }
}

# ================================================================
# PASO 1: ANALIZAR PLATOS ANTERIORES Y RECETAS
# ================================================================

Write-Host "PASO 1: Analizando platos anteriores y recetas..." -ForegroundColor Yellow
Write-Host ""

$carpetaEjecutivos = "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS"
$carpetaDTs = "II. Apendices Tecnicos\Decisiones_Tecnicas"

$analisis = @{}

foreach ($sistema in $mapeoSistemas.Keys) {
    Write-Host "  Analizando: $sistema" -ForegroundColor Cyan
    
    $config = $mapeoSistemas[$sistema]
    $rutaEjecutivo = Join-Path $raiz "$carpetaEjecutivos\$sistema`_EJECUTIVO.md"
    
    # Leer plato anterior
    $platoAnterior = ""
    if (Test-Path $rutaEjecutivo) {
        $platoAnterior = Get-Content $rutaEjecutivo -Raw -Encoding UTF8
        Write-Host "    Plato anterior: $([math]::Round((Get-Item $rutaEjecutivo).Length / 1KB, 1)) KB" -ForegroundColor White
    } else {
        Write-Host "    Plato anterior: NO EXISTE (crear nuevo)" -ForegroundColor Yellow
    }
    
    # Contar DTs ejecutadas
    $dtsEjecutadas = @()
    foreach ($patronDT in $config.DTs) {
        $dts = Get-ChildItem -Path (Join-Path $raiz $carpetaDTs) -Filter "$patronDT.md" -ErrorAction SilentlyContinue
        foreach ($dt in $dts) {
            $contenidoDT = Get-Content $dt.FullName -Raw -Encoding UTF8
            if ($contenidoDT -match '\[x\].*Ejecutado') {
                $dtsEjecutadas += $dt.Name
            }
        }
    }
    
    Write-Host "    Recetas (DTs): $($dtsEjecutadas.Count) ejecutadas" -ForegroundColor Green
    
    # Encontrar fuentes en cocina
    $fuentesEncontradas = 0
    foreach ($patronFuente in $config.Fuentes) {
        $nombreFuente = $patronFuente -replace '.*\\', '' -replace '\*', ''
        $archivos = Get-ChildItem -Path $raiz -Filter "$nombreFuente*" -Recurse -ErrorAction SilentlyContinue | 
                    Where-Object { $_.FullName -match 'III\. Ingenieria conceptual|V\. Ingenieria de detalle' } | 
                    Select-Object -First 1
        
        if ($archivos) {
            $fuentesEncontradas++
        }
    }
    
    Write-Host "    Ingredientes (Cocina): $fuentesEncontradas fuentes encontradas" -ForegroundColor Green
    
    $analisis[$sistema] = @{
        TienePlatoAnterior = (Test-Path $rutaEjecutivo)
        DTs = $dtsEjecutadas.Count
        Fuentes = $fuentesEncontradas
        NecesitaRegeneracion = ($dtsEjecutadas.Count -gt 0 -or -not (Test-Path $rutaEjecutivo))
    }
    
    Write-Host ""
}

# ================================================================
# PASO 2: INSTRUCCIONES PARA REGENERACION CON LLM
# ================================================================

Write-Host "PASO 2: Preparando instrucciones para el cocinero..." -ForegroundColor Yellow
Write-Host ""

$instruccionesPath = Join-Path $raiz "scripts\INSTRUCCIONES_REGENERACION_EJECUTIVOS.md"

$instrucciones = @"
# INSTRUCCIONES PARA REGENERAR EJECUTIVOS DESDE COCINA
**Fecha:** $fechaActual  
**Proceso:** Ciclo de Mejora Continua del Cocinero Especialista

---

## 🎯 SISTEMAS A REGENERAR

"@

foreach ($sistema in $mapeoSistemas.Keys) {
    $config = $mapeoSistemas[$sistema]
    $info = $analisis[$sistema]
    
    $estado = if ($info.NecesitaRegeneracion) { "REGENERAR" } else { "ACTUAL" }
    
    $instrucciones += @"

### $sistema - $($config.Descripcion)
**Estado:** $estado  
**Capítulo WBS:** $($config.CapituloWBS)  
**DTs ejecutadas:** $($info.DTs)  
**Fuentes en cocina:** $($info.Fuentes)

**INSTRUCCIONES PARA EL COCINERO:**

1. **LEE TU PLATO ANTERIOR:**
   ``````
   X_ENTREGABLES_CONSOLIDADOS/7_SISTEMAS_EJECUTIVOS/$sistema`_EJECUTIVO.md
   ``````
   Identifica errores o informacion desactualizada.
   Revisa que justificaciones ya estan bien.

2. **LEE LAS RECETAS (DTs):**"@

    foreach ($patronDT in $config.DTs) {
        $instrucciones += "`n   Busca: II. Apendices Tecnicos/Decisiones_Tecnicas/$patronDT.md"
    }

    $instrucciones += @"

   Extrae cambios aplicados.
   Identifica nuevas justificaciones tecnicas.

3. **LEE LOS INGREDIENTES (Cocina actualizada):**"@

    foreach ($fuente in $config.Fuentes) {
        $instrucciones += "`n   Lee: $fuente"
    }

    $instrucciones += @"

   Extrae cantidades actuales.
   Extrae justificaciones tecnicas.
   Verifica calculos detallados.

4. **LEE LA WBS ACTUAL:**
   ``````
   IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md (Capítulo $($config.CapituloWBS))
   ``````
   - Cantidades finales
   - Valores unitarios
   - Verificar coherencia

5. **PREPARA EL PLATO MEJORADO:**
   Corrige errores del plato anterior.
   Agrega DTs ejecutadas en seccion Decisiones Tecnicas Aplicadas.
   Actualiza justificaciones con info de cocina.
   Manten estructura ejecutiva (claro para stakeholders).
   Verifica coherencia total.

6. **GUARDA EL PLATO:**
   ``````
   X_ENTREGABLES_CONSOLIDADOS/7_SISTEMAS_EJECUTIVOS/$sistema`_EJECUTIVO.md
   ``````

---

"@
}

$instrucciones += @"

## 📋 CHECKLIST FINAL

Cada documento ejecutivo regenerado debe tener:

- [ ] Justificaciones tecnicas actualizadas desde cocina
- [ ] Todas las DTs ejecutadas mencionadas
- [ ] Calculos verificados con WBS actual
- [ ] Errores corregidos del plato anterior
- [ ] Lenguaje ejecutivo (no ultra-tecnico)
- [ ] Referencias a AT1-AT10 cuando aplique
- [ ] Seccion Decisiones Tecnicas Aplicadas actualizada

---

**Después de regenerar todos, ejecutar:**
``````powershell
.\scripts\servir_ingenieria_COMPLETO_v2.ps1 -RegenerarTodo
``````

Esto generará los .docx y .html servidos desde los ejecutivos regenerados.
"@

$instrucciones | Out-File -FilePath $instruccionesPath -Encoding UTF8 -Force

Write-Host "✅ Instrucciones generadas en:" -ForegroundColor Green
Write-Host "   $instruccionesPath" -ForegroundColor Yellow
Write-Host ""

# ================================================================
# RESUMEN FINAL
# ================================================================

Write-Host "================================================================" -ForegroundColor Green
Write-Host "  ANALISIS COMPLETO" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""

Write-Host "SISTEMAS QUE NECESITAN REGENERACION:" -ForegroundColor Cyan
$necesitanRegeneracion = ($analisis.Values | Where-Object { $_.NecesitaRegeneracion }).Count
Write-Host "  Total: $necesitanRegeneracion de $($mapeoSistemas.Count) sistemas" -ForegroundColor White
Write-Host ""

foreach ($sistema in $mapeoSistemas.Keys) {
    if ($analisis[$sistema].NecesitaRegeneracion) {
        Write-Host "  🔄 $sistema" -ForegroundColor Yellow
        Write-Host "     DTs: $($analisis[$sistema].DTs) | Fuentes: $($analisis[$sistema].Fuentes)" -ForegroundColor White
    }
}

Write-Host ""
Write-Host "PROXIMO PASO:" -ForegroundColor Magenta
Write-Host "  Abre: $instruccionesPath" -ForegroundColor Yellow
Write-Host "  Sigue las instrucciones para regenerar cada sistema" -ForegroundColor Yellow
Write-Host ""

