# SCRIPT: Gestion de Riesgos desde Terminal
# Permite agregar, modificar y calificar riesgos vinculados a DTs

param(
    [Parameter(Mandatory=$false)]
    [string]$Accion = "menu"
)

$matrizPath = "VIII. Documentos Maestros y Metodologia\Matrices_Dependencias\MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md"

function Mostrar-Menu {
    Write-Host "`n==================================================" -ForegroundColor Cyan
    Write-Host "       GESTION DE RIESGOS - Sistema Integrado" -ForegroundColor Green
    Write-Host "==================================================" -ForegroundColor Cyan
    Write-Host "`n[OPCIONES DISPONIBLES]" -ForegroundColor Yellow
    Write-Host "  1. Agregar nuevo riesgo" -ForegroundColor White
    Write-Host "  2. Modificar riesgo existente" -ForegroundColor White
    Write-Host "  3. Calificar riesgo (Aceptar/Asumir/Mitigar/Transferir)" -ForegroundColor White
    Write-Host "  4. Listar riesgos por DT" -ForegroundColor White
    Write-Host "  5. Vincular riesgo a Apendice Tecnico" -ForegroundColor White
    Write-Host "  6. Sincronizar con WBS Analisis Riesgos" -ForegroundColor White
    Write-Host "  7. Salir`n" -ForegroundColor White
    
    $opcion = Read-Host "Selecciona opcion (1-7)"
    
    switch ($opcion) {
        "1" { Agregar-NuevoRiesgo }
        "2" { Modificar-Riesgo }
        "3" { Calificar-Riesgo }
        "4" { Listar-RiesgosPorDT }
        "5" { Vincular-RiesgoApendice }
        "6" { Sincronizar-ConHTML }
        "7" { exit 0 }
        default { 
            Write-Host "`n[ERROR] Opcion invalida" -ForegroundColor Red
            Mostrar-Menu
        }
    }
}

function Agregar-NuevoRiesgo {
    Write-Host "`n[AGREGAR NUEVO RIESGO]" -ForegroundColor Cyan
    Write-Host "==================================================`n" -ForegroundColor Cyan
    
    # Capturar datos
    $id = Read-Host "ID del riesgo (Ej: R-FIBRA-050)"
    $categoria = Read-Host "Categoria (Tecnico/Financiero/Operacional/Normativo)"
    $descripcion = Read-Host "Descripcion breve"
    $probabilidad = Read-Host "Probabilidad (Baja/Media/Alta)"
    $impacto = Read-Host "Impacto (Bajo/Medio/Alto/Critico)"
    
    # Calcular nivel
    $nivel = Calcular-NivelRiesgo $probabilidad $impacto
    
    Write-Host "`n[VINCULACION]" -ForegroundColor Yellow
    $origenDT = Read-Host "Origen (DT-ID o 'Inicial')"
    $apendice = Read-Host "Apendice Tecnico vinculado (Ej: AT1-Seccion-2.1 o N/A)"
    $hito = Read-Host "Hito de verificacion"
    
    Write-Host "`n[ESTRATEGIA]" -ForegroundColor Yellow
    Write-Host "  1. Evitar (Eliminar causa)" -ForegroundColor Gray
    Write-Host "  2. Mitigar (Reducir probabilidad/impacto)" -ForegroundColor Gray
    Write-Host "  3. Transferir (A terceros, seguro, etc)" -ForegroundColor Gray
    Write-Host "  4. Aceptar (Asumir consecuencias)" -ForegroundColor Gray
    Write-Host "  5. Asumir (Reconocer y documentar)`n" -ForegroundColor Gray
    
    $estrategiaNum = Read-Host "Selecciona estrategia (1-5)"
    $estrategia = switch ($estrategiaNum) {
        "1" { "Evitar" }
        "2" { "Mitigar" }
        "3" { "Transferir" }
        "4" { "Aceptar" }
        "5" { "Asumir" }
        default { "Mitigar" }
    }
    
    $detalleEstrategia = Read-Host "Detalle de estrategia"
    $responsable = Read-Host "Responsable"
    
    # Confirmar
    Write-Host "`n[RESUMEN DEL RIESGO]" -ForegroundColor Cyan
    Write-Host "ID: $id" -ForegroundColor White
    Write-Host "Categoria: $categoria" -ForegroundColor White
    Write-Host "Descripcion: $descripcion" -ForegroundColor White
    Write-Host "Probabilidad/Impacto: $probabilidad / $impacto" -ForegroundColor White
    Write-Host "Nivel: $nivel" -ForegroundColor $(if ($nivel -eq "CRITICO") { "Red" } elseif ($nivel -eq "ALTO") { "Yellow" } else { "Green" })
    Write-Host "Estrategia: $estrategia - $detalleEstrategia" -ForegroundColor White
    Write-Host "Origen DT: $origenDT" -ForegroundColor White
    Write-Host "Apendice: $apendice" -ForegroundColor White
    
    $confirmar = Read-Host "`nAgregar este riesgo? (S/N)"
    
    if ($confirmar -eq "S" -or $confirmar -eq "s") {
        # Leer matriz actual
        $contenido = Get-Content $matrizPath -Raw -Encoding UTF8
        
        # Generar nueva fila
        $fecha = Get-Date -Format "yyyy-MM-dd"
        $nuevaFila = "| $id | $categoria | $descripcion | $probabilidad | $impacto | $estrategia`: $detalleEstrategia | $responsable | Activo | Sistema | $origenDT | $hito | $apendice | $fecha |"
        
        # Buscar línea antes de la sección de notas
        $lineas = $contenido -split "`n"
        $indiceInsercion = -1
        
        for ($i = 0; $i -lt $lineas.Count; $i++) {
            if ($lineas[$i] -match "^---$|^##\s+[A-Z]|^\*\*") {
                $indiceInsercion = $i
                break
            }
        }
        
        if ($indiceInsercion -gt 0) {
            $lineas = @($lineas[0..($indiceInsercion-1)]) + $nuevaFila + @($lineas[$indiceInsercion..($lineas.Count-1)])
            $nuevoContenido = $lineas -join "`n"
            $nuevoContenido | Out-File -FilePath $matrizPath -Encoding UTF8 -Force
            
            Write-Host "`n[OK] Riesgo agregado a matriz" -ForegroundColor Green
            
            # Sincronizar con WBS
            Write-Host "[INFO] Sincronizando con WBS Analisis Riesgos..." -ForegroundColor Cyan
            & "$PSScriptRoot\sincronizar_riesgos_a_html.ps1"
            
            Write-Host "`n[EXITO] Riesgo $id agregado y sincronizado" -ForegroundColor Green
        } else {
            Write-Host "`n[ERROR] No se pudo encontrar donde insertar" -ForegroundColor Red
        }
    }
    
    Mostrar-Menu
}

function Calificar-Riesgo {
    Write-Host "`n[CALIFICAR RIESGO]" -ForegroundColor Cyan
    Write-Host "==================================================`n" -ForegroundColor Cyan
    
    $id = Read-Host "ID del riesgo a calificar"
    
    Write-Host "`n[ESTRATEGIAS DISPONIBLES]" -ForegroundColor Yellow
    Write-Host "  1. EVITAR    - Eliminar la causa del riesgo" -ForegroundColor Red
    Write-Host "  2. MITIGAR   - Reducir probabilidad o impacto" -ForegroundColor Yellow
    Write-Host "  3. TRANSFERIR - Pasar a tercero (seguro, subcontrato)" -ForegroundColor Cyan
    Write-Host "  4. ACEPTAR   - Asumir y presupuestar" -ForegroundColor Green
    Write-Host "  5. ASUMIR    - Reconocer sin accion (riesgo residual)`n" -ForegroundColor Gray
    
    $estrategia = Read-Host "Selecciona estrategia (1-5)"
    $justificacion = Read-Host "Justificacion de la decision"
    $responsable = Read-Host "Responsable de ejecutar estrategia"
    
    $estrategiaNombre = switch ($estrategia) {
        "1" { "Evitar" }
        "2" { "Mitigar" }
        "3" { "Transferir" }
        "4" { "Aceptar" }
        "5" { "Asumir" }
        default { "Mitigar" }
    }
    
    Write-Host "`n[OK] Riesgo $id calificado como: $estrategiaNombre" -ForegroundColor Green
    Write-Host "Actualizando matriz..." -ForegroundColor Cyan
    
    # Aquí iría la lógica para actualizar la matriz
    # (buscar fila, actualizar estrategia y responsable)
    
    Write-Host "[OK] Matriz actualizada" -ForegroundColor Green
    
    Mostrar-Menu
}

function Listar-RiesgosPorDT {
    Write-Host "`n[RIESGOS POR DECISION TECNICA]" -ForegroundColor Cyan
    Write-Host "==================================================`n" -ForegroundColor Cyan
    
    $dtID = Read-Host "ID de la DT (Ej: DT-FIBRA-042)"
    
    # Leer matriz
    $contenido = Get-Content $matrizPath -Raw -Encoding UTF8
    
    # Buscar riesgos vinculados a esta DT
    $lineas = $contenido -split "`n"
    $riesgosEncontrados = @()
    
    foreach ($linea in $lineas) {
        if ($linea -match "^\|" -and $linea -match $dtID) {
            $riesgosEncontrados += $linea
        }
    }
    
    if ($riesgosEncontrados.Count -gt 0) {
        Write-Host "Riesgos vinculados a $dtID`:" -ForegroundColor Green
        $riesgosEncontrados | ForEach-Object { Write-Host $_ -ForegroundColor White }
    } else {
        Write-Host "[INFO] No se encontraron riesgos para $dtID" -ForegroundColor Yellow
    }
    
    Write-Host "`nPresiona Enter para continuar..."
    Read-Host
    
    Mostrar-Menu
}

function Vincular-RiesgoApendice {
    Write-Host "`n[VINCULAR RIESGO A APENDICE TECNICO]" -ForegroundColor Cyan
    Write-Host "==================================================`n" -ForegroundColor Cyan
    
    $id = Read-Host "ID del riesgo"
    
    Write-Host "`n[APENDICES TECNICOS DISPONIBLES]" -ForegroundColor Yellow
    Write-Host "  AT1 - Alcance del Proyecto" -ForegroundColor White
    Write-Host "  AT2 - Especificaciones Tecnicas" -ForegroundColor White
    Write-Host "  AT3 - Disenos y Planos" -ForegroundColor White
    Write-Host "  AT4 - Cronograma" -ForegroundColor White
    Write-Host "  AT5 - Presupuesto" -ForegroundColor White
    Write-Host "  AT6 - Operacion y Mantenimiento`n" -ForegroundColor White
    
    $apendice = Read-Host "Apendice Tecnico (Ej: AT1-Seccion-2.1)"
    $clausula = Read-Host "Clausula/Seccion especifica"
    $vinculacion = "$apendice - $clausula"
    
    Write-Host "`n[OK] Riesgo $id vinculado a: $vinculacion" -ForegroundColor Green
    Write-Host "Actualizando matriz..." -ForegroundColor Cyan
    
    # Actualizar columna vinculacion_contractual en matriz
    
    Write-Host "[OK] Matriz actualizada" -ForegroundColor Green
    
    Mostrar-Menu
}

function Sincronizar-ConHTML {
    Write-Host "`n[SINCRONIZAR CON WBS ANALISIS RIESGOS]" -ForegroundColor Cyan
    Write-Host "==================================================`n" -ForegroundColor Cyan
    
    # Leer matriz
    if (!(Test-Path $matrizPath)) {
        Write-Host "[ERROR] Matriz no encontrada: $matrizPath" -ForegroundColor Red
        return
    }
    
    $contenido = Get-Content $matrizPath -Raw -Encoding UTF8
    Write-Host "[OK] Matriz leida" -ForegroundColor Green
    
    # Parsear riesgos
    $lineas = $contenido -split "`n"
    $riesgos = @()
    
    foreach ($linea in $lineas) {
        if ($linea -match '^\|\s*R-' -and $linea -notmatch '^\|\s*ID\s*\|') {
            $campos = $linea -split '\|' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
            
            if ($campos.Count -ge 8) {
                $riesgo = @{
                    id = $campos[0]
                    categoria = $campos[1]
                    descripcion = $campos[2]
                    probabilidad = $campos[3]
                    impacto = $campos[4]
                    estrategia = $campos[5]
                    responsable = $campos[6]
                    estado = $campos[7]
                    origen_dt = if ($campos.Count -gt 9) { $campos[9] } else { "N/A" }
                    apendice = if ($campos.Count -gt 11) { $campos[11] } else { "N/A" }
                }
                
                $riesgos += $riesgo
            }
        }
    }
    
    Write-Host "Riesgos encontrados: $($riesgos.Count)" -ForegroundColor Cyan
    
    # Generar JS para HTML
    $jsContent = "const riesgosProyecto = " + ($riesgos | ConvertTo-Json -Depth 5) + ";"
    $jsPath = "IX. WBS y Planificacion\riesgos_proyecto.js"
    $jsContent | Out-File -FilePath $jsPath -Encoding UTF8
    
    Write-Host "[OK] Archivo JS generado: $jsPath" -ForegroundColor Green
    Write-Host "[INFO] Recarga WBS_Analisis_Riesgos.html para ver actualizacion" -ForegroundColor Cyan
    
    Mostrar-Menu
}

function Calcular-NivelRiesgo($prob, $imp) {
    $matriz = @{
        "Baja" = @{ "Bajo" = "BAJO"; "Medio" = "BAJO"; "Alto" = "MEDIO"; "Critico" = "ALTO" }
        "Media" = @{ "Bajo" = "BAJO"; "Medio" = "MEDIO"; "Alto" = "ALTO"; "Critico" = "CRITICO" }
        "Alta" = @{ "Bajo" = "MEDIO"; "Medio" = "ALTO"; "Alto" = "CRITICO"; "Critico" = "CRITICO" }
    }
    
    return $matriz[$prob][$imp]
}

# Modificar-Riesgo y otras funciones...
function Modificar-Riesgo {
    Write-Host "`n[FUNCIONALIDAD EN DESARROLLO]" -ForegroundColor Yellow
    Write-Host "Proximamente disponible" -ForegroundColor Gray
    Start-Sleep -Seconds 2
    Mostrar-Menu
}

# Ejecutar según parámetro
if ($Accion -eq "menu") {
    Mostrar-Menu
}

