# MODULO: Consolidator
# Consolidacion de documentos ejecutivos
# Fecha: 12 de Octubre 2025

function New-SistemaEjecutivo {
    param(
        [Parameter(Mandatory=$true)]
        [string]$CapituloSistema,
        
        [Parameter(Mandatory=$true)]
        [hashtable]$ConfigSistema,
        
        [Parameter(Mandatory=$false)]
        [string]$RutaRaiz = "."
    )
    
    $nombreSistema = "SISTEMA_$CapituloSistema`_$($ConfigSistema.Nombre)_EJECUTIVO"
    $rutaEjecutivo = Join-Path $RutaRaiz "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS\$nombreSistema.md"
    
    # Verificar si existe
    if (-not (Test-Path $rutaEjecutivo)) {
        return [PSCustomObject]@{
            Exitoso = $false
            Mensaje = "Ejecutivo no existe"
            Ruta = $null
        }
    }
    
    # Leer contenido actual
    $contenido = Get-Content $rutaEjecutivo -Raw -Encoding UTF8
    
    # Buscar fuentes en cocina
    $fuentesEncontradas = 0
    foreach ($patronFuente in $ConfigSistema.Fuentes) {
        $archivos = Get-ChildItem -Path $RutaRaiz -Filter ($patronFuente -replace '\*.*', '*') -Recurse -ErrorAction SilentlyContinue | 
                    Where-Object { $_.FullName -match 'III\. Ingenieria conceptual|V\. Ingenieria de detalle' } | 
                    Select-Object -First 1
        
        if ($archivos) {
            $fuentesEncontradas++
        }
    }
    
    # Contar DTs del capítulo
    $dts = Get-ChildItem -Path "II. Apendices Tecnicos\Decisiones_Tecnicas" -Filter "DT-*.md" -ErrorAction SilentlyContinue
    $dtsCapitulo = 0
    foreach ($dt in $dts) {
        $contDT = Get-Content $dt.FullName -Raw -Encoding UTF8
        if ($contDT -match "Capitulo.*$CapituloSistema[^\d]|$CapituloSistema\.\d+\.\d+") {
            $dtsCapitulo++
        }
    }
    
    # Agregar nota de cocina si no existe
    if ($contenido -notmatch "COCINADO DESDE FUENTES") {
        $fechaActual = Get-Date -Format "dd/MM/yyyy HH:mm"
        $notaCocina = "`n`n<!-- COCINADO DESDE FUENTES: $fechaActual | Fuentes: $fuentesEncontradas | DTs: $dtsCapitulo -->`n"
        $contenido += $notaCocina
        $contenido | Out-File $rutaEjecutivo -Encoding UTF8 -Force
    }
    
    return [PSCustomObject]@{
        Exitoso = $true
        Mensaje = "Cocinado OK"
        Ruta = $rutaEjecutivo
        FuentesEncontradas = $fuentesEncontradas
        DTsEncontradas = $dtsCapitulo
    }
}

Export-ModuleMember -Function 'New-SistemaEjecutivo'

