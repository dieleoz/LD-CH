# ═══════════════════════════════════════════════════════════════════════
# MODULO: Logger (Logging Estructurado JSON)
# ═══════════════════════════════════════════════════════════════════════
# Propósito: Proporcionar logging estructurado en JSON para auditoría y troubleshooting
# Versión: 1.0
# Fecha: 12 de Octubre 2025
# ═══════════════════════════════════════════════════════════════════════

$global:LogPath = "logs"
$global:LogLevel = "INFO" # DEBUG, INFO, WARN, ERROR, CRITICAL

# Asegurar que la carpeta logs existe
if (-not (Test-Path $global:LogPath)) {
    New-Item -ItemType Directory -Path $global:LogPath -Force | Out-Null
}

# ═══════════════════════════════════════════════════════════════════════
# FUNCIÓN: Iniciar Log de Acción
# ═══════════════════════════════════════════════════════════════════════
function Start-ActionLog {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Accion,
        
        [Parameter(Mandatory=$false)]
        [hashtable]$Parametros = @{}
    )
    
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $fechaISO = Get-Date -Format "yyyy-MM-ddTHH:mm:ss"
    
    $logFileName = "$($Accion.ToLower())_$timestamp.json"
    $logFilePath = Join-Path $global:LogPath $logFileName
    
    $logData = [PSCustomObject]@{
        timestamp = $fechaISO
        accion = $Accion
        estado = "EN_CURSO"
        parametros = $Parametros
        inicio = $fechaISO
        fin = $null
        duracion_segundos = 0
        resultado = @{
            exitoso = $null
            mensaje = ""
            detalles = @{}
        }
        archivos_procesados = @()
        archivos_modificados = @()
        errores = @()
        advertencias = @()
        metricas = @{}
    }
    
    # Guardar log inicial
    $logData | ConvertTo-Json -Depth 10 | Out-File -FilePath $logFilePath -Encoding UTF8 -Force
    
    # Retornar objeto para continuar actualizándolo
    return [PSCustomObject]@{
        LogPath = $logFilePath
        LogData = $logData
        Inicio = Get-Date
    }
}

# ═══════════════════════════════════════════════════════════════════════
# FUNCIÓN: Registrar Archivo Procesado
# ═══════════════════════════════════════════════════════════════════════
function Add-ProcessedFile {
    param(
        [Parameter(Mandatory=$true)]
        $LogContext,
        
        [Parameter(Mandatory=$true)]
        [string]$Archivo,
        
        [Parameter(Mandatory=$false)]
        [string]$Estado = "PROCESADO"
    )
    
    $LogContext.LogData.archivos_procesados += [PSCustomObject]@{
        archivo = $Archivo
        estado = $Estado
        timestamp = (Get-Date -Format "yyyy-MM-ddTHH:mm:ss")
    }
    
    # Actualizar archivo de log
    $LogContext.LogData | ConvertTo-Json -Depth 10 | Out-File -FilePath $LogContext.LogPath -Encoding UTF8 -Force
}

# ═══════════════════════════════════════════════════════════════════════
# FUNCIÓN: Registrar Archivo Modificado
# ═══════════════════════════════════════════════════════════════════════
function Add-ModifiedFile {
    param(
        [Parameter(Mandatory=$true)]
        $LogContext,
        
        [Parameter(Mandatory=$true)]
        [string]$Archivo,
        
        [Parameter(Mandatory=$false)]
        [string]$TipoCambio = "ACTUALIZADO"
    )
    
    $LogContext.LogData.archivos_modificados += [PSCustomObject]@{
        archivo = $Archivo
        tipo_cambio = $TipoCambio
        timestamp = (Get-Date -Format "yyyy-MM-ddTHH:mm:ss")
    }
    
    # Actualizar archivo de log
    $LogContext.LogData | ConvertTo-Json -Depth 10 | Out-File -FilePath $LogContext.LogPath -Encoding UTF8 -Force
}

# ═══════════════════════════════════════════════════════════════════════
# FUNCIÓN: Registrar Error
# ═══════════════════════════════════════════════════════════════════════
function Add-LogError {
    param(
        [Parameter(Mandatory=$true)]
        $LogContext,
        
        [Parameter(Mandatory=$true)]
        [string]$Mensaje,
        
        [Parameter(Mandatory=$false)]
        [string]$Detalle = ""
    )
    
    $LogContext.LogData.errores += [PSCustomObject]@{
        mensaje = $Mensaje
        detalle = $Detalle
        timestamp = (Get-Date -Format "yyyy-MM-ddTHH:mm:ss")
    }
    
    # Actualizar archivo de log
    $LogContext.LogData | ConvertTo-Json -Depth 10 | Out-File -FilePath $LogContext.LogPath -Encoding UTF8 -Force
}

# ═══════════════════════════════════════════════════════════════════════
# FUNCIÓN: Registrar Advertencia
# ═══════════════════════════════════════════════════════════════════════
function Add-LogWarning {
    param(
        [Parameter(Mandatory=$true)]
        $LogContext,
        
        [Parameter(Mandatory=$true)]
        [string]$Mensaje
    )
    
    $LogContext.LogData.advertencias += $Mensaje
    
    # Actualizar archivo de log
    $LogContext.LogData | ConvertTo-Json -Depth 10 | Out-File -FilePath $LogContext.LogPath -Encoding UTF8 -Force
}

# ═══════════════════════════════════════════════════════════════════════
# FUNCIÓN: Agregar Métrica
# ═══════════════════════════════════════════════════════════════════════
function Add-LogMetric {
    param(
        [Parameter(Mandatory=$true)]
        $LogContext,
        
        [Parameter(Mandatory=$true)]
        [string]$Nombre,
        
        [Parameter(Mandatory=$true)]
        $Valor
    )
    
    $LogContext.LogData.metricas[$Nombre] = $Valor
    
    # Actualizar archivo de log
    $LogContext.LogData | ConvertTo-Json -Depth 10 | Out-File -FilePath $LogContext.LogPath -Encoding UTF8 -Force
}

# ═══════════════════════════════════════════════════════════════════════
# FUNCIÓN: Finalizar Log de Acción
# ═══════════════════════════════════════════════════════════════════════
function Complete-ActionLog {
    param(
        [Parameter(Mandatory=$true)]
        $LogContext,
        
        [Parameter(Mandatory=$true)]
        [bool]$Exitoso,
        
        [Parameter(Mandatory=$false)]
        [string]$Mensaje = ""
    )
    
    $fin = Get-Date
    $duracion = ($fin - $LogContext.Inicio).TotalSeconds
    
    $LogContext.LogData.estado = if ($Exitoso) { "COMPLETADO" } else { "ERROR" }
    $LogContext.LogData.fin = $fin.ToString("yyyy-MM-ddTHH:mm:ss")
    $LogContext.LogData.duracion_segundos = [Math]::Round($duracion, 2)
    $LogContext.LogData.resultado.exitoso = $Exitoso
    $LogContext.LogData.resultado.mensaje = $Mensaje
    
    # Guardar log final
    $LogContext.LogData | ConvertTo-Json -Depth 10 | Out-File -FilePath $LogContext.LogPath -Encoding UTF8 -Force
    
    # Retornar resumen
    return [PSCustomObject]@{
        Exitoso = $Exitoso
        DuracionSegundos = [Math]::Round($duracion, 2)
        LogPath = $LogContext.LogPath
        ArchivosModificados = $LogContext.LogData.archivos_modificados.Count
        Errores = $LogContext.LogData.errores.Count
    }
}

# ═══════════════════════════════════════════════════════════════════════
# FUNCIÓN: Leer Logs Recientes
# ═══════════════════════════════════════════════════════════════════════
function Get-RecentLogs {
    param(
        [Parameter(Mandatory=$false)]
        [int]$Ultimos = 10,
        
        [Parameter(Mandatory=$false)]
        [string]$Accion = ""
    )
    
    $archivosLog = Get-ChildItem -Path $global:LogPath -Filter "*.json" -ErrorAction SilentlyContinue | 
        Sort-Object LastWriteTime -Descending
    
    if ($Accion) {
        $archivosLog = $archivosLog | Where-Object { $_.Name -match "^$($Accion.ToLower())_" }
    }
    
    $logs = @()
    foreach ($archivo in ($archivosLog | Select-Object -First $Ultimos)) {
        try {
            $logData = Get-Content $archivo.FullName -Raw -Encoding UTF8 | ConvertFrom-Json
            $logs += [PSCustomObject]@{
                Archivo = $archivo.Name
                Timestamp = $logData.timestamp
                Accion = $logData.accion
                Estado = $logData.estado
                Duracion = "$($logData.duracion_segundos)s"
                Exitoso = $logData.resultado.exitoso
                Mensaje = $logData.resultado.mensaje
                ArchivosModificados = $logData.archivos_modificados.Count
                Errores = $logData.errores.Count
            }
        } catch {
            # Ignorar logs corruptos
        }
    }
    
    return $logs
}

# ═══════════════════════════════════════════════════════════════════════
# EXPORTAR FUNCIONES
# ═══════════════════════════════════════════════════════════════════════
Export-ModuleMember -Function @(
    'Start-ActionLog',
    'Add-ProcessedFile',
    'Add-ModifiedFile',
    'Add-LogError',
    'Add-LogWarning',
    'Add-LogMetric',
    'Complete-ActionLog',
    'Get-RecentLogs'
)

