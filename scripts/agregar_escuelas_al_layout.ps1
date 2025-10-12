# SCRIPT: Agregar Escuelas al Layout
# Fecha: 11 Octubre 2025
# Propósito: Integrar las 2 escuelas contractuales en el layout

Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "  AGREGAR ESCUELAS AL LAYOUT                     " -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""

# Cargar el layout actual
$layoutPath = "layout.md"
$layoutIntegralPath = "VIII. Documentos Maestros y Metodologia/LAYOUT_INTEGRAL_COMPLETO_v1.0.json"

if (-not (Test-Path $layoutPath)) {
    Write-Host "ERROR: No se encontro layout.md" -ForegroundColor Red
    exit 1
}

Write-Host "Cargando layout actual..." -ForegroundColor Yellow
$layoutContenido = Get-Content $layoutPath -Raw -Encoding UTF8

Write-Host "Cargando layout integral..." -ForegroundColor Yellow
$layoutIntegral = Get-Content $layoutIntegralPath -Raw -Encoding UTF8 | ConvertFrom-Json

# Definir las 2 escuelas según AT1
$escuelas = @(
    @{
        id = "ESC-01"
        nombre = "IE Santo Domingo"
        tipo = "Institucion Educativa"
        municipio = "Puerto Wilches"
        departamento = "Santander"
        ufv = "Pendiente"
        pk = "Pendiente"
        latitud = "TBD"
        longitud = "TBD"
        tipo_obra = "REVERSION ESPECIAL"
        alcance = "Rehabilitacion integral"
        estado = "Verificacion predial pendiente"
    },
    @{
        id = "ESC-02"
        nombre = "Escuela San Jose Primavera"
        tipo = "Escuela"
        municipio = "La Dorada"
        departamento = "Caldas"
        ufv = "UFV 23"
        pk = "201+470"
        pk_aprox = "PK 201+000 - 220+000 (zona La Dorada)"
        latitud = "TBD"
        longitud = "TBD"
        tipo_obra = "REVERSION ESPECIAL"
        alcance = "Rehabilitacion arquitectonica, estructural y electrica"
        estado = "Ubicada en UFVF 1 - Area de influencia"
    }
)

Write-Host ""
Write-Host "ESCUELAS IDENTIFICADAS CONTRACTUALMENTE:" -ForegroundColor Cyan
Write-Host ""

foreach ($escuela in $escuelas) {
    Write-Host "  $($escuela.id) - $($escuela.nombre)" -ForegroundColor Green
    Write-Host "    Municipio: $($escuela.municipio) ($($escuela.departamento))" -ForegroundColor White
    Write-Host "    UFV: $($escuela.ufv)" -ForegroundColor White
    Write-Host "    PK: $($escuela.pk)" -ForegroundColor White
    Write-Host "    Tipo: $($escuela.tipo_obra)" -ForegroundColor Yellow
    Write-Host "    Estado: $($escuela.estado)" -ForegroundColor White
    Write-Host ""
}

# Crear sección de escuelas para el layout
$seccionEscuelas = @"

---

## 🏫 INSTITUCIONES EDUCATIVAS - REVERSION ESPECIAL

**Base Contractual:** AT1 Cap. IV.4 - Tablas 22 y 23  
**Cantidad Total:** 2 instituciones educativas  
**Tipo:** Obras de Reversión Especial (NO infraestructura operativa)  

| ID | Nombre | Municipio | UFVF | PK | Tipo Obra | Estado |
|:---|:-------|:----------|:-----|:---|:----------|:-------|
| **ESC-01** | IE Santo Domingo | Puerto Wilches (Santander) | ⚠️ Pendiente | ⚠️ Pendiente | Rehabilitación integral | Verificación predial pendiente |
| **ESC-02** | Escuela San José Primavera | La Dorada (Caldas) | UFV 23 (UFVF 1) | PK 201+470 (aprox.) | Rehab. arq/est/elec | Ubicada en zona La Dorada |

### 📋 Requisitos Técnicos:
- **NSR-10:** Títulos A, E, G (estructural)
- **RETIE/RETILAP:** Instalaciones eléctricas
- **MEN 2018:** Infraestructura educativa
- **Ley 1618/2013:** Accesibilidad
- **BIM LOD 300:** Modelado requerido

### 🔄 Proceso EPC:
1. Verificación Predial (AT7)
2. Levantamiento Técnico (AT3)
3. Diseño BIM LOD 300
4. Gestión Ambiental/Social (AT6/AT8)
5. Ejecución y Reversión (AT9)

### 📄 Entregables:
- Planos as-built
- Acta de Terminación
- Acta de Reversión Especial al MEN
- Inspección de calidad con Interventoría ANI

---

**🔍 NOTA IMPORTANTE:** Estas instituciones NO aparecen en el inventario de 396 equipos porque son **obras de reversión especial**, no infraestructura operativa ferroviaria. Sin embargo, deben integrarse en el Layout como **Infraestructura Social** asociada a sus respectivas UFVF.

"@

# Agregar al final del layout
$nuevoLayout = $layoutContenido + $seccionEscuelas

# Guardar el layout actualizado
$nuevoLayout | Out-File $layoutPath -Encoding UTF8

Write-Host "Layout actualizado con seccion de escuelas" -ForegroundColor Green
Write-Host ""

# Actualizar también el JSON del layout integral
if ($layoutIntegral.infraestructura_fisica) {
    # Agregar escuelas a infraestructura física
    $layoutIntegral.infraestructura_fisica | Add-Member -NotePropertyName "escuelas" -NotePropertyValue @{
        descripcion = "Instituciones Educativas - Reversion Especial (AT1 Cap. IV.4)"
        total = 2
        elementos = @(
            @{
                id = "ESC-01"
                nombre = "IE Santo Domingo"
                municipio = "Puerto Wilches"
                departamento = "Santander"
                ufvf = "Pendiente"
                pk = "Pendiente"
                tipo_obra = "REVERSION ESPECIAL"
                alcance = "Rehabilitacion integral"
                estado = "Verificacion predial pendiente"
            },
            @{
                id = "ESC-02"
                nombre = "Escuela San Jose Primavera"
                municipio = "La Dorada"
                departamento = "Caldas"
                ufvf = "UFV 23"
                pk = "201+470"
                tipo_obra = "REVERSION ESPECIAL"
                alcance = "Rehabilitacion arq/est/elec"
                estado = "Ubicada en UFVF 1"
            }
        )
    } -Force
    
    # Guardar JSON actualizado
    $layoutIntegral | ConvertTo-Json -Depth 20 | Out-File $layoutIntegralPath -Encoding UTF8
    Write-Host "JSON del layout integral actualizado" -ForegroundColor Green
}

Write-Host ""
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "  ESCUELAS AGREGADAS AL LAYOUT                   " -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Archivos actualizados:" -ForegroundColor Green
Write-Host "  - $layoutPath" -ForegroundColor White
Write-Host "  - $layoutIntegralPath" -ForegroundColor White
Write-Host ""

