# SCRIPT: Eliminar Balizas del Layout (Señalización Virtual)
# Fecha: 11 Octubre 2025
# Base: DT-CTC-001 - Señalización Virtual (NO balizas físicas)

Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "  ELIMINANDO BALIZAS - SENALIZACION VIRTUAL     " -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""

# Leer layout actual
$layoutPath = "layout.md"
if (-not (Test-Path $layoutPath)) {
    Write-Host "ERROR: No se encontro layout.md" -ForegroundColor Red
    exit 1
}

Write-Host "Leyendo layout.md..." -ForegroundColor Yellow
$contenido = Get-Content $layoutPath -Raw -Encoding UTF8

# Contar balizas antes
$lineasOriginales = ($contenido -split "`n").Count
$balizasAntes = ($contenido -split "`n" | Where-Object { $_ -match "BALIZA|Baliza|Eurobalise" }).Count

Write-Host "  Lineas totales: $lineasOriginales" -ForegroundColor White
Write-Host "  Balizas encontradas: $balizasAntes" -ForegroundColor Yellow
Write-Host ""

# Filtrar líneas (eliminar balizas)
$lineasNuevas = $contenido -split "`n" | Where-Object { 
    $_ -notmatch "BALIZA|Baliza|Eurobalise" 
}

$nuevoContenido = $lineasNuevas -join "`n"

# Contar después
$lineasDespues = ($nuevoContenido -split "`n").Count
$elementosEliminados = $lineasOriginales - $lineasDespues

Write-Host "RESULTADO:" -ForegroundColor Cyan
Write-Host "  Lineas eliminadas: $elementosEliminados" -ForegroundColor Green
Write-Host "  Lineas restantes: $lineasDespues" -ForegroundColor White
Write-Host ""

# Crear backup del original
$backupPath = "layout_CON_BALIZAS_backup_$(Get-Date -Format 'yyyyMMdd_HHmmss').md"
Copy-Item $layoutPath $backupPath
Write-Host "Backup creado: $backupPath" -ForegroundColor Green
Write-Host ""

# Guardar layout limpio
$nuevoContenido | Out-File $layoutPath -Encoding UTF8
Write-Host "Layout actualizado (SIN balizas)" -ForegroundColor Green
Write-Host ""

# Agregar nota al final del layout
$nota = @"


---

## ⚠️ NOTA TÉCNICA: SEÑALIZACIÓN VIRTUAL

**Decisión Técnica:** DT-CTC-001  
**Fecha:** Octubre 2025  
**Filosofía:** Señalización Virtual (CTC + ETCS Level 2)  

**Cambio aplicado:**
- ✅ Eliminadas **$elementosEliminados balizas Eurobalise** físicas
- ✅ Sistema de señalización: **100% Virtual**
- ✅ Control: CTC + RBC ETCS L2
- ✅ No requiere balizas físicas en vía

**Equipos de control que SÍ permanecen:**
- ✅ 11 Puestos CTC Local
- ✅ 5 RBC (Radio Block Centers) ETCS L2
- ✅ 1 CCO (Centro Control Operacional)
- ✅ Sistemas embarcados en locomotoras (15 unidades)

**Backup del layout original (con balizas):**
Archivo: $backupPath

---
"@

Add-Content $layoutPath $nota -Encoding UTF8

Write-Host "Nota tecnica agregada al layout" -ForegroundColor Green
Write-Host ""
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "  BALIZAS ELIMINADAS - LAYOUT ACTUALIZADO       " -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "RESUMEN:" -ForegroundColor Yellow
Write-Host "  - Balizas eliminadas: $elementosEliminados" -ForegroundColor White
Write-Host "  - Elementos restantes: $($lineasDespues - $lineasOriginales + $lineasDespues)" -ForegroundColor White
Write-Host "  - Backup: $backupPath" -ForegroundColor White
Write-Host "  - Layout: Actualizado con senalizacion virtual" -ForegroundColor White
Write-Host ""
Write-Host "SIGUIENTE PASO:" -ForegroundColor Cyan
Write-Host "  Ejecuta: .\scripts\convertir_layout_a_js.ps1" -ForegroundColor Yellow
Write-Host "  Para actualizar el archivo JavaScript sin balizas" -ForegroundColor Yellow
Write-Host ""

