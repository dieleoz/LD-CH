# ================================================================
#  CREAR LAYOUT JERARQUICO (JSON)
#  Transforma layout.md plano en estructura jerarquica
# ================================================================

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  CREANDO LAYOUT JERARQUICO (JSON)" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

# ================================================================
# PARSEAR LAYOUT.MD ACTUAL
# ================================================================

$layoutMd = Get-Content "layout.md" -Encoding UTF8
$filas = $layoutMd | Select-Object -Skip 238 | Where-Object { $_ -match '^\| UFV' }

Write-Host "Parseando $($filas.Count) equipos..." -ForegroundColor Yellow

$equipos = @()

foreach ($fila in $filas) {
    $cols = ($fila -replace '^\||\|$', '' -split '\|') | ForEach-Object { $_.Trim() }
    
    if ($cols.Count -ge 13) {
        $equipo = [PSCustomObject]@{
            UFV = $cols[0]
            Implementacion = $cols[1]
            Nombre_Tablero = $cols[2]
            Ubicacion_PK = $cols[3]
            Descripcion = $cols[4]
            Ubicacion_Lado = $cols[5]
            Direccion = $cols[6]
            Tipo_Equipo = $cols[7]
            Dispositivo = $cols[8]
            Switch_Acceso = $cols[9]
            Tipo_ITS = $cols[10]
            Latitud_X = $cols[11]
            Longitud_Y = $cols[12]
        }
        $equipos += $equipo
    }
}

Write-Host "Equipos parseados: $($equipos.Count)" -ForegroundColor Green
Write-Host ""

# ================================================================
# AGRUPAR POR INSTALACIONES
# ================================================================

Write-Host "Agrupando por instalaciones..." -ForegroundColor Yellow

# Identificar estaciones (cualquier equipo con "Estacion" o "Apeadero")
$estaciones = $equipos | Where-Object { 
    $_.Descripcion -like "*Estacion*" -or 
    $_.Descripcion -like "*Apeadero*" -or
    $_.Nombre_Tablero -like "*ESTACION*"
} | Select-Object Nombre_Tablero, Ubicacion_PK, UFV, Descripcion -Unique

Write-Host "Estaciones identificadas: $($estaciones.Count)" -ForegroundColor Green

# Identificar puentes
$puentes = $equipos | Where-Object { 
    $_.Tipo_Equipo -eq "INFRAESTRUCTURA" -and 
    $_.Descripcion -like "*Puente*"
} | Select-Object Nombre_Tablero, Ubicacion_PK, UFV, Descripcion -Unique

Write-Host "Puentes identificados: $($puentes.Count)" -ForegroundColor Green
Write-Host ""

# ================================================================
# CONSTRUIR ESTRUCTURA JERARQUICA
# ================================================================

Write-Host "Construyendo estructura jerarquica..." -ForegroundColor Yellow

$layoutJerarquico = @{
    metadata = @{
        proyecto = "APP La Dorada-Chiriguaná"
        version = "1.0"
        fecha_generacion = (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
        origen = "layout.md parseado"
        total_equipos = $equipos.Count
        total_instalaciones = $estaciones.Count + $puentes.Count
    }
    
    instalaciones = @{
        edificaciones = @()
        infraestructura = @()
    }
    
    sistemas_distribuidos = @{
        red_tetra = @{
            cantidad_nodos = ($equipos | Where-Object { $_.Dispositivo -eq "TETRA BS" }).Count
            nodos = @()
        }
        red_fibra_optica = @{
            cantidad_empalmes = ($equipos | Where-Object { $_.Dispositivo -eq "Caja Empalme" }).Count
            empalmes = @()
        }
    }
    
    plantillas_equipos = @{
        KIT_ESTACION_PRINCIPAL = @(
            "Edificio_Estacion",
            "Torre_TETRA",
            "Subestacion_Electrica",
            "UPS",
            "CTC_Local",
            "Nodo_Fibra_Optica",
            "Camaras_CCTV_x3",
            "Desvios_Motorizados"
        )
        KIT_PUENTE_PRIORITARIO = @(
            "Camaras_CCTV_PTZ_x4-6",
            "Detector_Sismico",
            "Detector_Socavacion",
            "Senalizacion_Proteccion"
        )
        KIT_NODO_TETRA_INTERMEDIO = @(
            "Torre_TETRA",
            "UPS_10kVA",
            "Switch_Acceso",
            "Camara_CCTV"
        )
    }
}

# Agregar instalaciones de edificaciones
foreach ($estacion in $estaciones) {
    $pkEstacion = $estacion.Ubicacion_PK
    
    # Buscar todos los equipos cercanos a esta estacion (mismo PK o muy cerca)
    $equiposEstacion = $equipos | Where-Object { $_.Ubicacion_PK -eq $pkEstacion }
    
    $instalacion = @{
        id = $estacion.Nombre_Tablero
        tipo = "EDIFICACION"
        subtipo = if ($estacion.Descripcion -like "*Principal*" -or $estacion.Descripcion -like "*Clase A*") { "Estacion_Principal" } else { "Estacion_Menor" }
        nombre = $estacion.Descripcion
        ufv = $estacion.UFV
        pk = $pkEstacion
        equipos = @($equiposEstacion | ForEach-Object {
            @{
                id = $_.Nombre_Tablero
                categoria = $_.Tipo_Equipo
                dispositivo = $_.Dispositivo
                descripcion = $_.Descripcion
            }
        })
        total_equipos = $equiposEstacion.Count
    }
    
    $layoutJerarquico.instalaciones.edificaciones += $instalacion
}

# Agregar puentes
foreach ($puente in $puentes) {
    $pkPuente = $puente.Ubicacion_PK
    $equiposPuente = $equipos | Where-Object { 
        $_.Ubicacion_PK -like "$($pkPuente.Substring(0,3))*" -and
        ($_.Tipo_Equipo -eq "EQUIPO ITS" -or $_.Tipo_Equipo -eq "INFRAESTRUCTURA")
    }
    
    $instalacion = @{
        id = $puente.Nombre_Tablero
        tipo = "INFRAESTRUCTURA"
        subtipo = "Puente_Prioritario"
        nombre = $puente.Descripcion
        ufv = $puente.UFV
        pk_inicio = $pkPuente
        equipos = @($equiposPuente | ForEach-Object {
            @{
                id = $_.Nombre_Tablero
                categoria = $_.Tipo_Equipo
                dispositivo = $_.Dispositivo
                descripcion = $_.Descripcion
                pk = $_.Ubicacion_PK
            }
        })
        total_equipos = $equiposPuente.Count
    }
    
    $layoutJerarquico.instalaciones.infraestructura += $instalacion
}

# Agregar nodos TETRA distribuidos
$nodosTetra = $equipos | Where-Object { $_.Dispositivo -eq "TETRA BS" }
foreach ($nodo in $nodosTetra) {
    $layoutJerarquico.sistemas_distribuidos.red_tetra.nodos += @{
        id = $nodo.Nombre_Tablero
        pk = $nodo.Ubicacion_PK
        ufv = $nodo.UFV
    }
}

# Guardar JSON
$outputPath = "VIII. Documentos Maestros y Metodologia\LAYOUT_JERARQUICO_v1.0.json"
$layoutJerarquico | ConvertTo-Json -Depth 10 | Out-File $outputPath -Encoding UTF8

Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host "  LAYOUT JERARQUICO CREADO" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Archivo: $outputPath" -ForegroundColor White
Write-Host ""
Write-Host "RESUMEN:" -ForegroundColor Cyan
Write-Host "  Total equipos: $($equipos.Count)" -ForegroundColor White
Write-Host "  Edificaciones: $($estaciones.Count)" -ForegroundColor White
Write-Host "  Puentes: $($puentes.Count)" -ForegroundColor White
Write-Host "  Nodos TETRA: $($nodosTetra.Count)" -ForegroundColor White
Write-Host ""
Write-Host "PROXIMO PASO: Generar vista visual mejorada" -ForegroundColor Yellow
Write-Host "  .\scripts\generar_wbs_layout_jerarquico.ps1" -ForegroundColor Gray
Write-Host ""

