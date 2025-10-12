# MODULO: DTDetector
# Deteccion de Decisiones Tecnicas con impacto en layout
# Fecha: 12 de Octubre 2025

function Get-DTsRecientes {
    param(
        [int]$DiasAtras = 7,
        [string]$CarpetaDTs = "II. Apendices Tecnicos\Decisiones_Tecnicas"
    )
    
    $fechaLimite = (Get-Date).AddDays(-$DiasAtras)
    
    $dtsRecientes = Get-ChildItem -Path $CarpetaDTs -Filter "DT-*.md" -ErrorAction SilentlyContinue | Where-Object {
        $_.LastWriteTime -gt $fechaLimite -and $_.Name -notmatch 'TEMPLATE|EJEMPLO|GUIA|README'
    }
    
    return $dtsRecientes
}

function Get-DTsConImpactoLayout {
    param(
        [int]$DiasAtras = 7,
        [string]$CarpetaDTs = "II. Apendices Tecnicos\Decisiones_Tecnicas"
    )
    
    $fechaLimite = (Get-Date).AddDays(-$DiasAtras)
    
    $dtsConImpactoLayout = Get-ChildItem -Path $CarpetaDTs -Filter "DT-*.md" -ErrorAction SilentlyContinue | Where-Object {
        $_.LastWriteTime -gt $fechaLimite -and 
        $_.Name -notmatch 'TEMPLATE|EJEMPLO|GUIA|README'
    } | ForEach-Object {
        $contenido = Get-Content $_.FullName -Raw -Encoding UTF8
        if ($contenido -match 'impacto_layout:\s*true') {
            [PSCustomObject]@{
                Archivo = $_
                Sistema = if ($contenido -match 'sistema:\s*"([^"]+)"') { $matches[1].ToUpper() } else { "DESCONOCIDO" }
            }
        }
    }
    
    return $dtsConImpactoLayout
}

Export-ModuleMember -Function @('Get-DTsRecientes', 'Get-DTsConImpactoLayout')

