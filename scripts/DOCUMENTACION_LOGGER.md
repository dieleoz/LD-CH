# DOCUMENTACIÓN: MÓDULO LOGGER (Logging Estructurado JSON)
## Sistema WBS v14.7.5
## Fecha: 12 de Octubre 2025

---

## 📋 PROPÓSITO

Proporcionar **logging estructurado en formato JSON** para auditoría completa y troubleshooting eficiente de todos los scripts del Sistema WBS.

**Beneficios:**
- ✅ Auditoría completa de acciones del sistema
- ✅ Troubleshooting más rápido (datos estructurados)
- ✅ Métricas de performance por operación
- ✅ Historial de errores y advertencias
- ✅ Trazabilidad de archivos modificados

---

## 🚀 USO RÁPIDO

### Ejemplo Básico:

```powershell
# 1. Importar módulo
Import-Module ".\scripts\modules\Logger.psm1"

# 2. Iniciar log
$log = Start-ActionLog -Accion "COCINAR" -Parametros @{sistema="FIBRA"}

# 3. Registrar acciones
Add-ProcessedFile -LogContext $log -Archivo "layout.md"
Add-ModifiedFile -LogContext $log -Archivo "layout.md" -TipoCambio "ACTUALIZADO"
Add-LogMetric -LogContext $log -Nombre "elementos_procesados" -Valor 1953

# 4. Finalizar log
$resumen = Complete-ActionLog -LogContext $log -Exitoso $true -Mensaje "OK"

# Resultado: logs/cocinar_20251012_153000.json
```

---

## 📚 FUNCIONES DISPONIBLES

### 1️⃣ `Start-ActionLog`

**Propósito:** Iniciar un nuevo log de acción

**Parámetros:**
- `Accion` (obligatorio): Nombre de la acción (ej: "COCINAR", "SERVIR", "SINCRONIZAR")
- `Parametros` (opcional): Hashtable con parámetros de la acción

**Retorna:** Objeto `LogContext` para usar en otras funciones

**Ejemplo:**
```powershell
$log = Start-ActionLog -Accion "COCINAR" -Parametros @{
    sistema = "02"
    modo = "AUTOMATICO"
    usuario = $env:USERNAME
}
```

---

### 2️⃣ `Add-ProcessedFile`

**Propósito:** Registrar un archivo procesado

**Parámetros:**
- `LogContext` (obligatorio): Objeto retornado por Start-ActionLog
- `Archivo` (obligatorio): Ruta del archivo procesado
- `Estado` (opcional): Estado del procesamiento (default: "PROCESADO")

**Ejemplo:**
```powershell
Add-ProcessedFile -LogContext $log -Archivo "WBS_Presupuestal_v2.0.md" -Estado "LEIDO"
```

---

### 3️⃣ `Add-ModifiedFile`

**Propósito:** Registrar un archivo modificado

**Parámetros:**
- `LogContext` (obligatorio): Objeto log
- `Archivo` (obligatorio): Ruta del archivo modificado
- `TipoCambio` (opcional): Tipo de cambio (default: "ACTUALIZADO")

**Ejemplo:**
```powershell
Add-ModifiedFile -LogContext $log -Archivo "layout.md" -TipoCambio "REGENERADO"
```

---

### 4️⃣ `Add-LogError`

**Propósito:** Registrar un error

**Parámetros:**
- `LogContext` (obligatorio): Objeto log
- `Mensaje` (obligatorio): Mensaje del error
- `Detalle` (opcional): Detalle adicional del error

**Ejemplo:**
```powershell
Add-LogError -LogContext $log -Mensaje "Archivo no encontrado" -Detalle "layout_backup.md no existe"
```

---

### 5️⃣ `Add-LogWarning`

**Propósito:** Registrar una advertencia

**Parámetros:**
- `LogContext` (obligatorio): Objeto log
- `Mensaje` (obligatorio): Mensaje de advertencia

**Ejemplo:**
```powershell
Add-LogWarning -LogContext $log -Mensaje "PKs fuera de rango detectados: 2"
```

---

### 6️⃣ `Add-LogMetric`

**Propósito:** Agregar una métrica numérica

**Parámetros:**
- `LogContext` (obligatorio): Objeto log
- `Nombre` (obligatorio): Nombre de la métrica
- `Valor` (obligatorio): Valor numérico o string

**Ejemplo:**
```powershell
Add-LogMetric -LogContext $log -Nombre "cajas_procesadas" -Valor 1823
Add-LogMetric -LogContext $log -Nombre "duracion_generacion_ms" -Valor 2450
```

---

### 7️⃣ `Complete-ActionLog`

**Propósito:** Finalizar el log y calcular duración

**Parámetros:**
- `LogContext` (obligatorio): Objeto log
- `Exitoso` (obligatorio): Boolean - true si exitoso, false si hubo error
- `Mensaje` (opcional): Mensaje de resultado

**Retorna:** Objeto con resumen de la operación

**Ejemplo:**
```powershell
$resumen = Complete-ActionLog -LogContext $log -Exitoso $true -Mensaje "Cocina completada exitosamente"

# Acceder al resumen:
Write-Host "Duración: $($resumen.DuracionSegundos)s"
Write-Host "Archivos modificados: $($resumen.ArchivosModificados)"
Write-Host "Errores: $($resumen.Errores)"
```

---

### 8️⃣ `Get-RecentLogs`

**Propósito:** Leer logs recientes

**Parámetros:**
- `Ultimos` (opcional): Cantidad de logs a mostrar (default: 10)
- `Accion` (opcional): Filtrar por tipo de acción

**Retorna:** Array de logs con resumen

**Ejemplo:**
```powershell
# Últimos 5 logs de cualquier tipo
$logs = Get-RecentLogs -Ultimos 5

# Últimos 10 logs de acción "COCINAR"
$logs = Get-RecentLogs -Ultimos 10 -Accion "COCINAR"

# Mostrar tabla
$logs | Format-Table -AutoSize
```

---

## 📄 ESTRUCTURA DEL LOG JSON

```json
{
  "timestamp": "2025-10-12T15:27:50",
  "accion": "COCINAR",
  "estado": "COMPLETADO",
  "parametros": {
    "sistema": "02",
    "modo": "AUTOMATICO"
  },
  "inicio": "2025-10-12T15:27:50",
  "fin": "2025-10-12T15:28:12",
  "duracion_segundos": 22.45,
  "resultado": {
    "exitoso": true,
    "mensaje": "Cocina completada exitosamente",
    "detalles": {}
  },
  "archivos_procesados": [
    {
      "archivo": "WBS_Presupuestal_v2.0.md",
      "estado": "PROCESADO",
      "timestamp": "2025-10-12T15:27:51"
    }
  ],
  "archivos_modificados": [
    {
      "archivo": "SISTEMA_02_Telecomunicaciones_EJECUTIVO.md",
      "tipo_cambio": "ACTUALIZADO",
      "timestamp": "2025-10-12T15:28:10"
    }
  ],
  "errores": [
    {
      "mensaje": "Archivo opcional no encontrado",
      "detalle": "layout_backup.md",
      "timestamp": "2025-10-12T15:28:05"
    }
  ],
  "advertencias": [
    "PKs fuera de rango: 2"
  ],
  "metricas": {
    "elementos_procesados": 1953,
    "cajas_fibra": 1823,
    "domos_fusion": 130
  }
}
```

---

## 🔧 INTEGRACIÓN CON SCRIPTS EXISTENTES

### Ejemplo: cocinar.ps1 con Logger

```powershell
# Al inicio del script
Import-Module "$PSScriptRoot\modules\Logger.psm1" -Force

# Iniciar log
$log = Start-ActionLog -Accion "COCINAR" -Parametros @{
    sistema = $Sistema
    modo = if ($DryRun) { "DRY_RUN" } else { "REAL" }
}

# Durante procesamiento
try {
    # ... lógica de cocinar ...
    
    Add-ProcessedFile -LogContext $log -Archivo $archivoFuente
    Add-ModifiedFile -LogContext $log -Archivo $archivoDestino
    Add-LogMetric -LogContext $log -Nombre "dts_procesadas" -Valor $contadorDTs
    
    # Finalizar exitosamente
    $resumen = Complete-ActionLog -LogContext $log -Exitoso $true -Mensaje "OK"
    
} catch {
    # En caso de error
    Add-LogError -LogContext $log -Mensaje $_.Exception.Message
    $resumen = Complete-ActionLog -LogContext $log -Exitoso $false -Mensaje "ERROR"
    throw
}
```

---

## 📁 UBICACIÓN DE LOGS

**Carpeta:** `logs/`  
**Nomenclatura:** `{accion}_{YYYYMMDD}_{HHMMSS}.json`

**Ejemplos:**
- `logs/cocinar_20251012_153000.json`
- `logs/servir_20251012_153045.json`
- `logs/sincronizar_20251012_154000.json`

---

## 🔍 CONSULTAR LOGS

### Ver últimos logs:
```powershell
Import-Module ".\scripts\modules\Logger.psm1"
$logs = Get-RecentLogs -Ultimos 10
$logs | Format-Table
```

### Filtrar por acción:
```powershell
$logsCocinar = Get-RecentLogs -Ultimos 20 -Accion "COCINAR"
$logsCocinar | Format-Table
```

### Análisis con PowerShell:
```powershell
# Leer un log específico
$log = Get-Content "logs/cocinar_20251012_153000.json" | ConvertFrom-Json

# Analizar
Write-Host "Duracion: $($log.duracion_segundos)s"
Write-Host "Archivos modificados: $($log.archivos_modificados.Count)"
Write-Host "Exitoso: $($log.resultado.exitoso)"

# Listar archivos modificados
$log.archivos_modificados | ForEach-Object {
    Write-Host "  - $($_.archivo) ($($_.tipo_cambio))"
}
```

---

## 📊 MÉTRICAS Y ANÁLISIS

### Ejemplo: Análisis de Performance

```powershell
# Leer todos los logs de "COCINAR"
$logsCocinar = Get-ChildItem logs -Filter "cocinar_*.json" | ForEach-Object {
    Get-Content $_.FullName | ConvertFrom-Json
}

# Calcular estadísticas
$duraciones = $logsCocinar | Select-Object -ExpandProperty duracion_segundos
$promedio = ($duraciones | Measure-Object -Average).Average
$maximo = ($duraciones | Measure-Object -Maximum).Maximum
$minimo = ($duraciones | Measure-Object -Minimum).Minimum

Write-Host "Estadísticas de COCINAR (últimos $($logsCocinar.Count) ejecuciones):"
Write-Host "  Promedio: $([Math]::Round($promedio, 2))s"
Write-Host "  Máximo: $([Math]::Round($maximo, 2))s"
Write-Host "  Mínimo: $([Math]::Round($minimo, 2))s"
```

---

## ⚙️ CONFIGURACIÓN

### Variables Globales:

```powershell
$global:LogPath = "logs"           # Carpeta de logs
$global:LogLevel = "INFO"          # Nivel de logging (DEBUG, INFO, WARN, ERROR)
```

### Personalizar ubicación de logs:

```powershell
# Antes de importar el módulo
$global:LogPath = "C:\MisLogs\WBS"
Import-Module ".\scripts\modules\Logger.psm1"
```

---

## 🔒 EXCLUSIÓN DE GIT

Agregar a `.gitignore`:
```gitignore
# Logs del sistema (opcional - conservar para auditoría)
logs/*.json
```

**Recomendación:** Mantener logs en git para auditoría, pero excluir logs muy grandes (>1MB).

---

## 📚 SCRIPTS COMPATIBLES

El módulo Logger se puede integrar en:

| Script | Estado | Prioridad |
|:-------|:-------|:----------|
| `cocinar.ps1` | ⏳ Pendiente | 🔴 Alta |
| `servir.ps1` | ⏳ Pendiente | 🔴 Alta |
| `servir_ingenieria_completo.ps1` | ⏳ Pendiente | 🔴 Alta |
| `sincronizar_SISTEMA_COMPLETO_v14.3.ps1` | ⏳ Pendiente | 🟡 Media |
| `regenerar_fibra_1824_cajas.ps1` | ⏳ Pendiente | 🟡 Media |
| `actualizar_documentos_detalle_v2.ps1` | ⏳ Pendiente | 🟡 Media |

---

## ✅ VERIFICACIÓN

### Probar el módulo:

```powershell
# Test rápido
Import-Module ".\scripts\modules\Logger.psm1" -Force

$log = Start-ActionLog -Accion "TEST" -Parametros @{modo="PRUEBA"}
Add-LogMetric -LogContext $log -Nombre "test_metrica" -Valor 123
Complete-ActionLog -LogContext $log -Exitoso $true -Mensaje "Test OK"

# Ver log generado
Get-ChildItem logs -Filter "test_*.json" | Select -Last 1 | Get-Content
```

---

## 🎯 PRÓXIMOS PASOS

1. ✅ Módulo Logger.psm1 creado
2. ✅ Funciones testeadas y verificadas
3. ⏳ Integrar en scripts principales (cocinar.ps1, servir.ps1)
4. ⏳ Crear dashboard de análisis de logs (opcional)

---

**Documento creado:** 12 de Octubre 2025  
**Versión:** 1.0  
**Estado:** ✅ COMPLETADO  
**Responsable:** Equipo Técnico

