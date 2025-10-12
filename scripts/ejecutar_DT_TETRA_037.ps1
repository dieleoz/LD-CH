# SCRIPT: Ejecutar DT-TETRA-037 Automaticamente
# Fecha: 11 Octubre 2025
# Proposito: Actualizar layout a 37 estaciones TETRA

Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "  EJECUTANDO DT-TETRA-037 AUTOMATICAMENTE       " -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""

# PASO 1: Validaciones
Write-Host "PASO 1: VALIDACIONES PRE-EJECUCION" -ForegroundColor Yellow
Write-Host ""

$validaciones = @{
    "layout.md" = Test-Path "layout.md"
    "TETRA_37_LINEAS_LAYOUT.txt" = Test-Path "VIII. Documentos Maestros y Metodologia/TETRA_37_LINEAS_LAYOUT.txt"
    "convertir_layout_a_js.ps1" = Test-Path "scripts/convertir_layout_a_js.ps1"
    "generar_layout_integral_completo.ps1" = Test-Path "scripts/generar_layout_integral_completo.ps1"
}

$okCount = 0
foreach ($item in $validaciones.GetEnumerator()) {
    if ($item.Value) {
        Write-Host "  OK $($item.Key)" -ForegroundColor Green
        $okCount++
    } else {
        Write-Host "  ERROR $($item.Key) no existe" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Validaciones: $okCount/$($validaciones.Count)" -ForegroundColor $(if($okCount -eq $validaciones.Count){'Green'}else{'Red'})

if ($okCount -ne $validaciones.Count) {
    Write-Host ""
    Write-Host "ERROR: No se pueden ejecutar los cambios" -ForegroundColor Red
    exit 1
}

Write-Host ""

# PASO 2: Leer las 37 lineas generadas
Write-Host "PASO 2: CARGANDO 37 ESTACIONES TETRA" -ForegroundColor Yellow
Write-Host ""

$lineasTETRA = Get-Content "VIII. Documentos Maestros y Metodologia/TETRA_37_LINEAS_LAYOUT.txt" -Encoding UTF8
Write-Host "  Lineas cargadas: $($lineasTETRA.Count)" -ForegroundColor Green
Write-Host ""

# PASO 3: Insertar en layout.md
Write-Host "PASO 3: ACTUALIZANDO LAYOUT.MD" -ForegroundColor Yellow
Write-Host ""

$layoutContent = Get-Content "layout.md" -Raw -Encoding UTF8

# Buscar donde insertar (despues de la seccion de encabezados de TETRA)
$seccionTETRA = "## 🎯 ESTACIONES BASE TETRA - 37 UBICACIONES"

# Agregar seccion completa
$nuevoContenido = @"

---

$seccionTETRA

**Base Contractual:** AT4 - Telecomunicaciones  
**Criterio Técnico:** III/27.1_Estimacion_Cantidades_TETRA_v5.0.md  
**Decisión Técnica:** DT-TETRA-037  
**Fecha:** 11 Octubre 2025  

**Parámetros:**
- Total estaciones: 37
- PK inicio: 201+470 (México)
- PK fin: 722+250 (Chiriguaná)
- Espaciamiento promedio: 14.47 km
- Radio cobertura: 15 km
- Solapamiento: 20%

| UFV | Implementacion | Nombre | PK | Descripcion | Ubicacion_Lado | Direccion | Tipo_Equipo | Dispositivo | Switch_Acceso | Tipo_ITS | Latitud_X | Longitud_Y |
|:----|:---------------|:-------|:---|:------------|:---------------|:----------|:------------|:------------|:--------------|:---------|:----------|:-----------|
$($lineasTETRA -join "`n")

---

"@

# Agregar al final del layout
$layoutFinal = $layoutContent + $nuevoContenido

# Guardar
$layoutFinal | Out-File "layout.md" -Encoding UTF8

Write-Host "  Layout.md actualizado con 37 estaciones" -ForegroundColor Green
Write-Host ""

# PASO 4: Regenerar layout_datos.js
Write-Host "PASO 4: REGENERANDO LAYOUT_DATOS.JS" -ForegroundColor Yellow
Write-Host ""

& ".\scripts\convertir_layout_a_js.ps1"

Write-Host ""

# PASO 5: Regenerar layout integral
Write-Host "PASO 5: REGENERANDO LAYOUT INTEGRAL" -ForegroundColor Yellow
Write-Host ""

& ".\scripts\generar_layout_integral_completo.ps1"

Write-Host ""

# PASO 6: Marcar DT como ejecutada
Write-Host "PASO 6: MARCANDO DT COMO EJECUTADA" -ForegroundColor Yellow
Write-Host ""

$dtPath = "II. Apendices Tecnicos/Decisiones_Tecnicas/DT-TETRA-037-Actualizar_Layout_37_Estaciones.md"
$dtContent = Get-Content $dtPath -Raw -Encoding UTF8

# Marcar checkbox
$dtContent = $dtContent -replace 'Pendiente de ejecucion', "Ejecutado: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

$dtContent | Out-File $dtPath -Encoding UTF8

Write-Host "  DT marcada como ejecutada" -ForegroundColor Green
Write-Host ""

# RESUMEN FINAL
Write-Host "=================================================" -ForegroundColor Green
Write-Host "  DT-TETRA-037 EJECUTADA EXITOSAMENTE          " -ForegroundColor Green
Write-Host "=================================================" -ForegroundColor Green
Write-Host ""
Write-Host "CAMBIOS APLICADOS:" -ForegroundColor Cyan
Write-Host "  - Layout.md: +37 estaciones TETRA" -ForegroundColor White
Write-Host "  - layout_datos.js: Regenerado" -ForegroundColor White
Write-Host "  - LAYOUT_INTEGRAL_COMPLETO: Actualizado" -ForegroundColor White
Write-Host "  - Estaciones TETRA: 26 → 37 (+11)" -ForegroundColor Green
Write-Host ""
Write-Host "SIGUIENTE PASO:" -ForegroundColor Yellow
Write-Host "  Recarga WBS_Layout_Maestro.html" -ForegroundColor White
Write-Host "  Ahora veras 37 estaciones TETRA en el filtro" -ForegroundColor White
Write-Host ""

