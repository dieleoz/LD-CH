# CHEF PROMPT INTEGRAL - Layout Dinamico
# Lee TODAS las recetas (Contrato + AT1-AT10) y genera layout completo
# Version: 1.0 | Fecha: 10 Octubre 2025

Write-Host "CHEF PROMPT INTEGRAL - Layout Dinamico" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# Configuracion de archivos
$contratoPath = "01. contrato en .md"
$outputPath = "VIII. Documentos Maestros y Metodologia"

# Verificar que existen todos los archivos
$archivos = @(
    "$contratoPath/FORMATEADO_1 - CONTRATO DE CONCESION NO. 001 DE 2025 - Editable.md",
    "$contratoPath/FORMATEADO_APENDICE TECNICO 1.md",
    "$contratoPath/FORMATEADO_APENDICE TECNICO 2.md",
    "$contratoPath/FORMATEADO_APENDICE TECNICO 3.md",
    "$contratoPath/FORMATEADO_APENDICE TECNICO 4.md",
    "$contratoPath/FORMATEADO_APENDICE TECNICO 5.md",
    "$contratoPath/FORMATEADO_APENDICE TECNICO 6.md",
    "$contratoPath/FORMATEADO_APENDICE TECNICO 7.md",
    "$contratoPath/FORMATEADO_APENDICE TECNICO 8.md",
    "$contratoPath/FORMATEADO_APENDICE TECNICO 9.md",
    "$contratoPath/FORMATEADO_APENDICE TECNICO 10.md"
)

Write-Host "Verificando recetas disponibles..." -ForegroundColor Yellow
$recetasDisponibles = @()

foreach ($archivo in $archivos) {
    if (Test-Path $archivo) {
        $nombre = Split-Path $archivo -Leaf
        $size = [math]::Round((Get-Item $archivo).Length / 1KB, 1)
        Write-Host "  OK $nombre ($size KB)" -ForegroundColor Green
        $recetasDisponibles += $archivo
    } else {
        Write-Host "  ERROR $archivo - NO ENCONTRADO" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "RESUMEN DE RECETAS:" -ForegroundColor Cyan
Write-Host "  Total archivos: $($archivos.Count)" -ForegroundColor White
Write-Host "  Disponibles: $($recetasDisponibles.Count)" -ForegroundColor Green
Write-Host "  Faltantes: $($archivos.Count - $recetasDisponibles.Count)" -ForegroundColor Red

if ($recetasDisponibles.Count -eq 0) {
    Write-Host ""
    Write-Host "ERROR: No se encontraron recetas" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "ANALIZANDO ESTRUCTURA DE RECETAS..." -ForegroundColor Yellow

# Crear estructura de datos para todas las recetas
$recetasCompletas = @{
    contrato_general = @{
        archivo = "$contratoPath/FORMATEADO_1 - CONTRATO DE CONCESION NO. 001 DE 2025 - Editable.md"
        tipo = "Marco Legal"
        contenido = @{
            alcance = @()
            definiciones = @()
            obligaciones = @()
        }
    }
    
    AT1_infraestructura = @{
        archivo = "$contratoPath/FORMATEADO_APENDICE TECNICO 1.md"
        tipo = "Infraestructura Ferrea"
        contenido = @{
            puentes = @()
            estaciones = @()
            apartaderos = @()
            pasos_nivel = @()
            escuelas = @()
            ufvf = @()
            uf = @()
        }
    }
    
    AT2_control = @{
        archivo = "$contratoPath/FORMATEADO_APENDICE TECNICO 2.md"
        tipo = "Control y Senalizacion"
        contenido = @{
            ctc = @()
            etcs = @()
            senalizacion = @()
            interlocking = @()
        }
    }
    
    AT3_especificaciones = @{
        archivo = "$contratoPath/FORMATEADO_APENDICE TECNICO 3.md"
        tipo = "Especificaciones Generales"
        contenido = @{
            normas = @()
            tipologias = @()
            metodos = @()
            criterios = @()
        }
    }
    
    AT4_telecomunicaciones = @{
        archivo = "$contratoPath/FORMATEADO_APENDICE TECNICO 4.md"
        tipo = "Telecomunicaciones"
        contenido = @{
            tetra = @()
            fibra_optica = @()
            radio = @()
            redes = @()
        }
    }
    
    AT5_ITS = @{
        archivo = "$contratoPath/FORMATEADO_APENDICE TECNICO 5.md"
        tipo = "ITS y Seguridad"
        contenido = @{
            cctv = @()
            hbd = @()
            seguridad = @()
            monitoreo = @()
        }
    }
    
    AT6_material_rodante = @{
        archivo = "$contratoPath/FORMATEADO_APENDICE TECNICO 6.md"
        tipo = "Material Rodante"
        contenido = @{
            locomotoras = @()
            coches = @()
            vagones = @()
            vehiculos = @()
        }
    }
    
    AT7_predial = @{
        archivo = "$contratoPath/FORMATEADO_APENDICE TECNICO 7.md"
        tipo = "Gestion Predial"
        contenido = @{
            limites = @()
            franjas = @()
            predios = @()
            areas = @()
        }
    }
    
    AT8_obras_civiles = @{
        archivo = "$contratoPath/FORMATEADO_APENDICE TECNICO 8.md"
        tipo = "Obras Civiles"
        contenido = @{
            alcantarillas = @()
            box_culverts = @()
            drenajes = @()
            estructuras = @()
        }
    }
    
    AT9_cronograma = @{
        archivo = "$contratoPath/FORMATEADO_APENDICE TECNICO 9.md"
        tipo = "Cronograma y Plan de Obras"
        contenido = @{
            fases = @()
            hitos = @()
            dependencias = @()
            recursos = @()
        }
    }
    
    AT10_operacion = @{
        archivo = "$contratoPath/FORMATEADO_APENDICE TECNICO 10.md"
        tipo = "Operacion y Mantenimiento"
        contenido = @{
            mantenimiento = @()
            operacion = @()
            reversion = @()
            procedimientos = @()
        }
    }
}

Write-Host "ESTRUCTURA DE RECETAS CREADA:" -ForegroundColor Green
foreach ($receta in $recetasCompletas.Keys) {
    $info = $recetasCompletas[$receta]
    Write-Host "  RECETA: $receta - $($info.tipo)" -ForegroundColor White
}

Write-Host ""
Write-Host "PROXIMOS PASOS:" -ForegroundColor Cyan
Write-Host "  1. Extraer ingredientes de cada receta" -ForegroundColor White
Write-Host "  2. Combinar recetas coherentemente" -ForegroundColor White
Write-Host "  3. Validar contra DTs" -ForegroundColor White
Write-Host "  4. Generar layout integral" -ForegroundColor White

# Guardar estructura de recetas
$recetasJson = $recetasCompletas | ConvertTo-Json -Depth 4
$outputFile = "$outputPath/RECETAS_COMPLETAS_v1.0.json"
$recetasJson | Out-File -FilePath $outputFile -Encoding UTF8

Write-Host ""
Write-Host "Estructura guardada en: $outputFile" -ForegroundColor Green
Write-Host "Tamano: $([math]::Round((Get-Item $outputFile).Length / 1KB, 1)) KB" -ForegroundColor Gray

Write-Host ""
Write-Host "CHEF PROMPT INTEGRAL - FASE 1 COMPLETADA" -ForegroundColor Green
Write-Host "   Listo para extraer ingredientes de cada receta" -ForegroundColor Gray
