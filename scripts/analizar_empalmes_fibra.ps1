# SCRIPT: Analizar Empalmes de Fibra Optica
# Fecha: 11 Octubre 2025

Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "  ANALISIS DE EMPALMES DE FIBRA OPTICA         " -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""

# Leer layout.md
$layoutContent = Get-Content "layout.md" -Raw -Encoding UTF8

# Buscar empalmes
$lineasEmpalme = $layoutContent -split "`n" | Where-Object { $_ -match 'EMPALME|Empalme' }

Write-Host "EMPALMES ENCONTRADOS EN LAYOUT:" -ForegroundColor Yellow
Write-Host "  Total lineas con 'EMPALME': $($lineasEmpalme.Count)" -ForegroundColor White
Write-Host ""

# Analizar cada empalme
$empalmes = @()
foreach ($linea in $lineasEmpalme) {
    if ($linea -match '\|') {
        $celdas = $linea -split '\|' | ForEach-Object { $_.Trim() } | Where-Object { $_ }
        if ($celdas.Count -ge 4) {
            $empalmes += @{
                nombre = $celdas[2]
                pk = $celdas[3]
                ufv = $celdas[0]
            }
        }
    }
}

Write-Host "Empalmes parseados: $($empalmes.Count)" -ForegroundColor Green
Write-Host ""

# Mostrar primeros 10
Write-Host "PRIMEROS 10 EMPALMES:" -ForegroundColor Cyan
$empalmes | Select-Object -First 10 | ForEach-Object {
    Write-Host "  $($_.nombre) - PK $($_.pk) ($($_.ufv))" -ForegroundColor White
}

Write-Host ""
Write-Host "  ..." -ForegroundColor Gray
Write-Host ""

# Mostrar ultimos 5
Write-Host "ULTIMOS 5 EMPALMES:" -ForegroundColor Cyan
$empalmes | Select-Object -Last 5 | ForEach-Object {
    Write-Host "  $($_.nombre) - PK $($_.pk) ($($_.ufv))" -ForegroundColor White
}

Write-Host ""

# Analizar espaciamiento
Write-Host "ANALISIS DE ESPACIAMIENTO:" -ForegroundColor Yellow
Write-Host ""

$pks = $empalmes | ForEach-Object {
    $pk = $_.pk
    if ($pk -match '(\d+)\+(\d+)') {
        [double]($matches[1] + "." + $matches[2])
    }
} | Sort-Object

if ($pks.Count -gt 1) {
    $espaciamientos = @()
    for ($i = 1; $i -lt $pks.Count; $i++) {
        $espaciamientos += $pks[$i] - $pks[$i-1]
    }
    
    $promedio = ($espaciamientos | Measure-Object -Average).Average
    $minimo = ($espaciamientos | Measure-Object -Minimum).Minimum
    $maximo = ($espaciamientos | Measure-Object -Maximum).Maximum
    
    Write-Host "  Espaciamiento promedio: $([math]::Round($promedio, 2)) km" -ForegroundColor White
    Write-Host "  Espaciamiento minimo: $([math]::Round($minimo, 2)) km" -ForegroundColor White
    Write-Host "  Espaciamiento maximo: $([math]::Round($maximo, 2)) km" -ForegroundColor White
}

Write-Host ""

# Comparar con criterio tecnico
Write-Host "COMPARACION CON CRITERIO TECNICO:" -ForegroundColor Yellow
Write-Host ""

$longitudCorredor = 520.78  # km
$criterioEspaciamiento = 10  # km (criterio tecnico)
$empalmesEsperados = [math]::Ceiling($longitudCorredor / $criterioEspaciamiento)

Write-Host "  Longitud corredor: $longitudCorredor km" -ForegroundColor White
Write-Host "  Criterio espaciamiento: cada $criterioEspaciamiento km" -ForegroundColor White
Write-Host "  Empalmes esperados: ~$empalmesEsperados" -ForegroundColor Cyan
Write-Host "  Empalmes actuales: $($empalmes.Count)" -ForegroundColor White
Write-Host ""

if ($empalmes.Count -lt $empalmesEsperados) {
    $faltantes = $empalmesEsperados - $empalmes.Count
    Write-Host "  ADVERTENCIA: Faltan ~$faltantes empalmes" -ForegroundColor Yellow
} elseif ($empalmes.Count -gt $empalmesEsperados) {
    $sobrantes = $empalmes.Count - $empalmesEsperados
    Write-Host "  ADVERTENCIA: Hay ~$sobrantes empalmes de mas" -ForegroundColor Yellow
} else {
    Write-Host "  OK: Cantidad coherente con criterio" -ForegroundColor Green
}

Write-Host ""
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "  ANALISIS COMPLETADO                           " -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan

