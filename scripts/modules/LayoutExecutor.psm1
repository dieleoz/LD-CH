# MODULO: LayoutExecutor
# Ejecucion de scripts especializados de layout
# Fecha: 12 de Octubre 2025

function Invoke-LayoutScript {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Sistema,
        
        [Parameter(Mandatory=$false)]
        [string]$ScriptsPath = "scripts"
    )
    
    $ejecutado = $false
    
    switch ($Sistema) {
        "FIBRA" {
            $scriptPath = Join-Path $ScriptsPath "regenerar_fibra_1824_cajas.ps1"
            if (Test-Path $scriptPath) {
                Write-Host "      Ejecutando script de fibra..." -ForegroundColor Gray
                & $scriptPath 2>&1 | Out-Null
                Write-Host "      Script fibra completado" -ForegroundColor Green
                $ejecutado = $true
            }
        }
        "TETRA" {
            $scriptPath = Join-Path $ScriptsPath "completar_37_estaciones_TETRA.ps1"
            if (Test-Path $scriptPath) {
                Write-Host "      Ejecutando script de TETRA..." -ForegroundColor Gray
                & $scriptPath 2>&1 | Out-Null
                Write-Host "      Script TETRA completado" -ForegroundColor Green
                $ejecutado = $true
            }
        }
        "BALIZA" {
            $scriptPath = Join-Path $ScriptsPath "eliminar_balizas_layout.ps1"
            if (Test-Path $scriptPath) {
                Write-Host "      Ejecutando script de balizas..." -ForegroundColor Gray
                & $scriptPath 2>&1 | Out-Null
                Write-Host "      Script balizas completado" -ForegroundColor Green
                $ejecutado = $true
            }
        }
        default {
            Write-Host "      Sin script especializado para $Sistema" -ForegroundColor Gray
        }
    }
    
    return $ejecutado
}

Export-ModuleMember -Function 'Invoke-LayoutScript'

