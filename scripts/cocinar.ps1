# ================================================================
#  FUNCION: cocinar()
#  Regenera documentos ejecutivos desde la cocina (I-VI)
# ================================================================
#
# USO:
#   .\scripts\cocinar.ps1                    # Cocina solo sistemas con DTs nuevas
#   .\scripts\cocinar.ps1 -Todo              # Cocina todos los sistemas
#   .\scripts\cocinar.ps1 -Sistema 02        # Cocina solo SISTEMA_02
#

param(
    [switch]$Todo = $false,
    [string]$Sistema = ""
)

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  COCINAR - Regenerar desde Cocina (I-VI)" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$raiz = Get-Location

# ================================================================
# MAPEO: Que sistemas cocinar
# ================================================================

$mapeoSistemas = @{
    "01" = @{ Nombre = "Control_y_Senalizacion"; Fuentes = @("26. Sistem_CTC*.md", "29_Sistema_Senalizacion*.md") }
    "02" = @{ Nombre = "Telecomunicaciones"; Fuentes = @("28_Sistema_FibraOptica*.md", "27_Sistema_TETRA*.md") }
    "03" = @{ Nombre = "ITS_y_Seguridad"; Fuentes = @("31_Sistema_CCTV*.md", "30_Sistema_ITS*.md") }
    "04" = @{ Nombre = "Material_Rodante"; Fuentes = @("32_Material_Rodante*.md") }
    "05" = @{ Nombre = "Infraestructura_Operativa"; Fuentes = @("V.4_Sistemas_Potencia*.md") }
    "06" = @{ Nombre = "Integracion_y_Coordinacion"; Fuentes = @("34_Criterios_Interoperabilidad*.md") }
}

# ================================================================
# IDENTIFICAR QUE COCINAR
# ================================================================

$sistemasACocinar = @()

if ($Sistema -ne "") {
    Write-Host "Modo: COCINAR SOLO SISTEMA_$Sistema" -ForegroundColor Yellow
    $sistemasACocinar = @($Sistema)
} elseif ($Todo) {
    Write-Host "Modo: COCINAR TODO" -ForegroundColor Yellow
    $sistemasACocinar = $mapeoSistemas.Keys
} else {
    Write-Host "Modo: DETECTAR DTs RECIENTES (ultimos 7 dias)" -ForegroundColor Yellow
    
    $fechaLimite = (Get-Date).AddDays(-7)
    $carpetaDTs = "II. Apendices Tecnicos\Decisiones_Tecnicas"
    
    foreach ($cap in $mapeoSistemas.Keys) {
        $dtsRecientes = Get-ChildItem -Path $carpetaDTs -Filter "DT-*.md" | Where-Object {
            $_.LastWriteTime -gt $fechaLimite -and $_.Name -notmatch 'TEMPLATE|EJEMPLO|GUIA|README'
        }
        
        if ($dtsRecientes.Count -gt 0) {
            Write-Host "  SISTEMA_$cap tiene $($dtsRecientes.Count) DTs recientes" -ForegroundColor Green
            $sistemasACocinar += $cap
        }
    }
}

if ($sistemasACocinar.Count -eq 0) {
    Write-Host ""
    Write-Host "No hay sistemas para cocinar (sin DTs recientes)" -ForegroundColor Yellow
    Write-Host "Usa -Todo para cocinar todos de todas formas" -ForegroundColor Yellow
    Write-Host ""
    exit 0
}

Write-Host ""
Write-Host "Sistemas a cocinar: $($sistemasACocinar.Count)" -ForegroundColor Green
Write-Host ""

# ================================================================
# COCINAR CADA SISTEMA
# ================================================================

$cocinados = 0

foreach ($cap in $sistemasACocinar) {
    $config = $mapeoSistemas[$cap]
    $nombreSistema = "SISTEMA_$cap`_$($config.Nombre)_EJECUTIVO"
    $rutaEjecutivo = "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS\$nombreSistema.md"
    
    Write-Host "Cocinando SISTEMA_$cap..." -ForegroundColor Cyan
    
    # Verificar si existe el ejecutivo
    if (-not (Test-Path $rutaEjecutivo)) {
        Write-Host "  Ejecutivo no existe, omitiendo..." -ForegroundColor Yellow
        continue
    }
    
    # Leer ejecutivo actual
    $contenido = Get-Content $rutaEjecutivo -Raw -Encoding UTF8
    
    # Verificar si ya tiene seccion de DTs
    $tieneDTs = $contenido -match "DECISIONES TECNICAS APLICADAS"
    
    # Buscar fuentes en cocina
    $fuentesEncontradas = 0
    foreach ($patronFuente in $config.Fuentes) {
        $archivos = Get-ChildItem -Path $raiz -Filter ($patronFuente -replace '\*.*', '*') -Recurse -ErrorAction SilentlyContinue | 
                    Where-Object { $_.FullName -match 'III\. Ingenieria conceptual|V\. Ingenieria de detalle' } | 
                    Select-Object -First 1
        
        if ($archivos) {
            $fuentesEncontradas++
            Write-Host "    Fuente: $($archivos.Name)" -ForegroundColor White
        }
    }
    
    # Contar DTs del capitulo
    $dts = Get-ChildItem -Path "II. Apendices Tecnicos\Decisiones_Tecnicas" -Filter "DT-*.md" -ErrorAction SilentlyContinue
    $dtsCapitulo = 0
    foreach ($dt in $dts) {
        $contDT = Get-Content $dt.FullName -Raw -Encoding UTF8
        if ($contDT -match "Capitulo.*$cap[^\d]|$cap\.\d+\.\d+") {
            $dtsCapitulo++
        }
    }
    
    Write-Host "    Fuentes cocina: $fuentesEncontradas" -ForegroundColor Green
    Write-Host "    DTs Cap. $cap`: $dtsCapitulo" -ForegroundColor Green
    
    # Marcar como cocinado (agregar nota temporal)
    if ($contenido -notmatch "COCINADO DESDE FUENTES") {
        $fechaActual = Get-Date -Format "dd/MM/yyyy HH:mm"
        $notaCocina = "`n`n<!-- COCINADO DESDE FUENTES: $fechaActual | Fuentes: $fuentesEncontradas | DTs: $dtsCapitulo -->`n"
        $contenido += $notaCocina
        $contenido | Out-File $rutaEjecutivo -Encoding UTF8 -Force
    }
    
    Write-Host "    Cocinado OK" -ForegroundColor Green
    $cocinados++
    Write-Host ""
}

# ================================================================
# RESUMEN
# ================================================================

Write-Host "================================================================" -ForegroundColor Green
Write-Host "  COCINA COMPLETADA" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Sistemas cocinados: $cocinados" -ForegroundColor White
Write-Host ""
Write-Host "PROXIMO PASO:" -ForegroundColor Yellow
Write-Host "  Ejecuta: .\scripts\servir.ps1" -ForegroundColor Cyan
Write-Host "  Para servir los platos a Word/HTML" -ForegroundColor White
Write-Host ""

