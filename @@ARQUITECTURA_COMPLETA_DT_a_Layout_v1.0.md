# 🏗️ ARQUITECTURA COMPLETA: De DT a Layout

**Proyecto:** APP La Dorada - Chiriguaná  
**Versión:** 1.0  
**Fecha:** 11 de Octubre 2025  
**Tipo:** Documento de Arquitectura Integral  
**Estado:** 🟡 **PARCIALMENTE IMPLEMENTADO**

---

## 📋 **RESUMEN EJECUTIVO**

Este documento describe el **flujo completo end-to-end** desde que un especialista propone un cambio técnico (DT) hasta que se refleja en TODOS los niveles del sistema, incluyendo el **Layout de equipos** y el **menú WBS visual**.

### **Pregunta que responde:**

> "Si te paso una DT donde ahora las antenas TETRA son a criterio de 30% de solapamiento (en vez de 20%), ¿cómo recalculas y ubicas equipos, cantidad, actualizas la documentación y 'pintas' el menú/layout?"

---

## 🔄 **SISTEMA ACTUAL: 6 NIVELES DE PROPAGACIÓN**

### **Según las reglas del proyecto (.cursorrules):**

Cuando se ejecuta una DT, los cambios deben propagarse en **6 NIVELES**:

```
┌────────────────────────────────────────────────────────────┐
│  NIVEL 1: IX. WBS Y PLANIFICACIÓN ✅ OBLIGATORIO           │
├────────────────────────────────────────────────────────────┤
│  - WBS_Presupuestal_v2.0.md (cantidades, VU, totales)      │
│  - datos_wbs_TODOS_items.json (datos completos)            │
│  - wbs_metadata_enriquecida.json (metadata técnica)        │
│  - Interfaces HTML (visualización)                         │
└────────────────────────────────────────────────────────────┘
                        ↓
┌────────────────────────────────────────────────────────────┐
│  NIVEL 2: V. INGENIERÍA DE DETALLE ⚠️ CONDICIONAL         │
├────────────────────────────────────────────────────────────┤
│  - V.X_Sistema_Detalle_vX.md (sección técnica específica)  │
│  Ejemplo: DT-TETRA-002 → V.3 Comunicaciones §4.2           │
│  Script: actualizar_documentos_detalle.ps1                 │
└────────────────────────────────────────────────────────────┘
                        ↓
┌────────────────────────────────────────────────────────────┐
│  NIVEL 3: III. INGENIERÍA CONCEPTUAL ⚠️ SI APLICA         │
├────────────────────────────────────────────────────────────┤
│  - 27_Sistema_TETRA_Integrado.md                           │
│  - Criterios y cantidades conceptuales                     │
└────────────────────────────────────────────────────────────┘
                        ↓
┌────────────────────────────────────────────────────────────┐
│  NIVEL 4: VIII. DOCUMENTOS MAESTROS ✅ OBLIGATORIO         │
├────────────────────────────────────────────────────────────┤
│  - CRITERIOS_TECNICOS_MAESTRO_v1.0.md                      │
│  - MATRIZ_TRAZABILIDAD_TECNICA_v1.0.md                     │
│  - MATRIZ_DEPENDENCIAS_DOCUMENTALES_v1.0.md                │
│  Script: actualizar_documentos_maestros.ps1                │
└────────────────────────────────────────────────────────────┘
                        ↓
┌────────────────────────────────────────────────────────────┐
│  NIVEL 5: X. ENTREGABLES CONSOLIDADOS ⚠️ SI EXISTE        │
├────────────────────────────────────────────────────────────┤
│  - SISTEMA_02_Telecomunicaciones_Master.md                 │
│  Script: cocinar.ps1                                       │
└────────────────────────────────────────────────────────────┘
                        ↓
┌────────────────────────────────────────────────────────────┐
│  NIVEL 6: ÍNDICES ✅ OBLIGATORIO                           │
├────────────────────────────────────────────────────────────┤
│  - Indice_Maestro_Consolidado_v1.0.md                      │
└────────────────────────────────────────────────────────────┘
                        ↓
                      CLIENTE
```

---

## 🚨 **PROBLEMA DETECTADO: LAYOUT NO ESTÁ EN LOS 6 NIVELES**

### **Lo que FALTA (no implementado):**

```
┌────────────────────────────────────────────────────────────┐
│  NIVEL 7: LAYOUT Y UBICACIONES ❌ FALTA IMPLEMENTAR        │
├────────────────────────────────────────────────────────────┤
│  - VIII/LAYOUT_MAESTRO_EQUIPOS_v1.0.md                     │
│  - IX/WBS_Layout_Maestro.html (interfaz visual)            │
│  Script: actualizar_layout_desde_DT.ps1 ❌ NO EXISTE       │
└────────────────────────────────────────────────────────────┘
```

**Actualmente:**
- El layout.md es **ESTÁTICO** (lo creaste manualmente)
- **NO se actualiza** automáticamente cuando ejecutas DTs
- **NO recalcula** ubicaciones cuando cambian cantidades
- **NO se sincroniza** con el sistema de propagación

---

## 💡 **EJEMPLO CONCRETO: DT-TETRA-030 (Cambio Solapamiento)**

### **Escenario:**

Especialista propone:
> "Cambiar criterio de solapamiento TETRA de 20% a 30% para mejorar cobertura en zonas montañosas"

---

### **PASO 1: CREAR DT-TETRA-030-2025-10-11.md**

```yaml
dt_metadata:
  id: "DT-TETRA-030"
  fecha: "2025-10-11"
  item_wbs: "2.1.100"
  tipo_cambio: "criterio_tecnico"
  impacto: "recalculo_cantidad_y_ubicaciones"

criterios_modificados:
  - nombre: "Solapamiento_Cobertura_TETRA"
    valor_anterior: "20%"
    valor_nuevo: "30%"
    justificacion: "Mejorar cobertura en zonas montañosas según análisis topográfico"

recalculo_automatico:
  - parametro: "cantidad_estaciones_tetra"
    formula_anterior: "594 km ÷ (15 km × (1 - 0.20)) = 594 ÷ 12 = 49.5 ≈ 37 estaciones"
    formula_nueva: "594 km ÷ (15 km × (1 - 0.30)) = 594 ÷ 10.5 = 56.6 ≈ 57 estaciones"
    cantidad_anterior: 37
    cantidad_nueva: 57
    diferencia: +20 estaciones

archivos_actualizar:
  # NIVEL 1: WBS
  - file: "IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md"
    seccion: "Item 2.1.100 - Torres TETRA/GSM-R"
    cambios:
      - campo: "cantidad"
        buscar: "37"
        reemplazar: "57"
      - campo: "total_cop"
        buscar: "antiguo_total"
        reemplazar: "nuevo_total"
        recalcular: true
        formula: "57 × VU_torre"

  # NIVEL 2: Ingeniería de Detalle
  - file: "V.3_Sistemas_Comunicacion_Detalle_v5.0.md"
    seccion: "§4.2 Cobertura TETRA"
    cambios:
      - campo: "criterio_solapamiento"
        buscar: "20% entre estaciones"
        reemplazar: "30% entre estaciones"
      - campo: "cantidad_estaciones"
        buscar: "37 estaciones"
        reemplazar: "57 estaciones"

  # NIVEL 3: Ingeniería Conceptual
  - file: "III. Ingenieria conceptual/27_Sistema_TETRA_Integrado_v5.0.md"
    seccion: "§3.1 Dimensionamiento"
    cambios:
      - campo: "cantidad_tetra"
        buscar: "37"
        reemplazar: "57"

  # NIVEL 4: Documentos Maestros
  - file: "VIII/CRITERIOS_TECNICOS_MAESTRO_v1.0.md"
    accion: "agregar_criterio"
    nuevo_criterio:
      id: "CRIT-TETRA-030"
      nombre: "Solapamiento Cobertura TETRA"
      valor: "30%"
      norma: "Análisis topográfico específico del corredor"
      origen_dt: "DT-TETRA-030"

  # 🆕 NIVEL 7: LAYOUT (NO IMPLEMENTADO AÚN)
  - file: "VIII/LAYOUT_MAESTRO_EQUIPOS_v1.0.md"
    accion: "recalcular_ubicaciones"
    parametros:
      tipo_equipo: "TELECOMUNICACIONES"
      dispositivo: "TETRA BS"
      cantidad_anterior: 37
      cantidad_nueva: 57
      metodo_recalculo: "distribucion_uniforme"
      pk_inicio: "201+470"
      pk_fin: "722+250"
      distancia_nueva: "594 km ÷ 57 = 10.42 km"
    salida:
      - regenerar_filas_tabla
      - mantener_estaciones_criticas
      - distribuir_nuevas_uniformemente

  # 🆕 NIVEL 8: WBS LAYOUT HTML (NO IMPLEMENTADO)
  - file: "IX/WBS_Layout_Maestro.html"
    accion: "regenerar_desde_layout_maestro"
    script: "generar_layout_html_REORGANIZADO.ps1"

  # NIVEL 5: Entregables Consolidados
  - file: "X/7_SISTEMAS_EJECUTIVOS/SISTEMA_02_Telecomunicaciones_EJECUTIVO.md"
    accion: "cocinar_y_servir"
    scripts:
      - "cocinar.ps1 -Sistema 02"
      - "servir.ps1 -Sistema 02"
```

---

## 🔧 **LO QUE ACTUALMENTE NO HACEMOS (Y DEBERÍAMOS):**

### **1. Recalcular Ubicaciones de Equipos** ❌

**Situación actual:**
- DT cambia cantidad 37 → 57 estaciones TETRA
- WBS se actualiza (presupuesto)
- Documentos se actualizan (descripción)
- **PERO layout.md NO se recalcula** ❌

**Lo que debería pasar:**
```powershell
# Script que NO existe:
.\scripts\recalcular_layout_desde_DT.ps1 -DT "DT-TETRA-030"

# Debería:
1. Leer DT y detectar cambio de cantidad
2. Leer layout.md y encontrar equipos tipo "TETRA BS"
3. Recalcular distribución:
   - Distancia anterior: 12 km (37 estaciones)
   - Distancia nueva: 10.42 km (57 estaciones)
4. Generar nuevas filas de tabla con PKs recalculados
5. Actualizar layout.md
6. Regenerar WBS_Layout_Maestro.html
```

---

### **2. Validar Coherencia Layout ↔ DTs** ❌

**Situación actual:**
- Layout tiene 700 balizas Eurobalise
- DT-CTC-001 dice "filosofía virtual" (sin señales físicas)
- **NO hay validación** de esta contradicción

**Lo que debería pasar:**
```powershell
# Script que NO existe:
.\scripts\validar_coherencia_layout.ps1

# Debería:
1. Leer todas las DTs ejecutadas
2. Leer layout.md
3. Comparar:
   - Si DT dice "virtual" → Balizas NO deberían estar en layout
   - Si DT dice "37 TETRA" → Layout debe tener exactamente 37 TETRA
4. Generar reporte de inconsistencias
5. Proponer correcciones
```

---

### **3. Actualizar "Pintura" del Menú** ⚠️ PARCIAL

**Lo que SÍ hacemos:**
- Actualizar estadísticas en `WBS_Menu_Principal.html` (presupuesto, kilometraje, etc.)

**Lo que NO hacemos:**
- Actualizar estadísticas de layout en tiempo real
- Reflejar cambios de ubicaciones en interfaz
- Mostrar "Última DT aplicada afectó 20 equipos del layout"

---

## 🎯 **FLUJO COMPLETO PROPUESTO (Como DEBERÍA Funcionar)**

### **Ejemplo: DT-TETRA-030 (Solapamiento 20% → 30%)**

```
┌──────────────────────────────────────────────────────────┐
│  PASO 1: ESPECIALISTA PROPONE CAMBIO                     │
└──────────────────────────────────────────────────────────┘

Especialista:
  "Cambiar solapamiento TETRA de 20% a 30%"
  "Razón: Análisis topográfico muestra zonas montañosas"
  "Impacto: +20 estaciones (37 → 57)"

        ↓

┌──────────────────────────────────────────────────────────┐
│  PASO 2: CREAR DT CON YAML EXTENDIDO                     │
└──────────────────────────────────────────────────────────┘

DT-TETRA-030-2025-10-11.md
  - Secciones 1-9: Contexto, justificación, riesgos
  - Sección 10: YAML con:
    ✅ archivos_actualizar (6 niveles actuales)
    🆕 layout_actualizar (nueva sección)
    🆕 recalculo_ubicaciones (nueva sección)

        ↓

┌──────────────────────────────────────────────────────────┐
│  PASO 3: CURSOR EJECUTA DT (Automático)                  │
└──────────────────────────────────────────────────────────┘

3.1 Actualiza NIVEL 1: WBS
    ├─ WBS_Presupuestal: 37 → 57 estaciones
    ├─ Recalcula presupuesto
    └─ Actualiza datos_wbs_TODOS_items.json

3.2 Actualiza NIVEL 2: Detalle
    ├─ V.3_Comunicaciones: §4.2 "30% solapamiento"
    └─ Versiona v5.0 → v5.1

3.3 Actualiza NIVEL 3: Conceptual
    └─ 27_Sistema_TETRA: Cantidad 37 → 57

3.4 Actualiza NIVEL 4: Maestros
    ├─ CRITERIOS_TECNICOS: Agrega "Solapamiento 30%"
    └─ MATRIZ_TRAZABILIDAD: DT-TETRA-030 → 5 docs

3.5 🆕 Actualiza NIVEL 7: LAYOUT ⭐ NUEVO
    ├─ Ejecuta: recalcular_layout_desde_DT.ps1
    ├─ Lee layout.md actual
    ├─ Encuentra 37 estaciones TETRA (EBT_01 a EBT_26, etc.)
    ├─ RECALCULA ubicaciones:
    │  Fórmula anterior: PK cada 12 km
    │  Fórmula nueva: PK cada 10.42 km
    ├─ Genera 20 nuevas filas de tabla:
    │  | UFV | PK | Tipo | Dispositivo | Nombre |
    │  | UFV24 | 215+000 | TELECOM | TETRA BS | EBT_27 | (nueva)
    │  | UFV25 | 225+400 | TELECOM | TETRA BS | EBT_28 | (nueva)
    │  ...
    ├─ Actualiza layout.md (37 → 57 filas tipo TETRA)
    └─ Versiona layout v1.1 → v1.2

3.6 🆕 Actualiza NIVEL 8: WBS VISUAL ⭐ NUEVO
    ├─ Ejecuta: generar_layout_html_REORGANIZADO.ps1
    ├─ Regenera WBS_Layout_Maestro.html
    ├─ Ahora muestra 57 estaciones (antes 37)
    ├─ Estadísticas actualizadas:
    │  Total Equipos: 396 → 416 (+20)
    │  Tipo TELECOM: 87 → 107 (+20)
    └─ Interfaz "pintada" con nuevos equipos

        ↓

┌──────────────────────────────────────────────────────────┐
│  PASO 4: COCINAR (Consolidar a X/7_EJECUTIVOS)           │
└──────────────────────────────────────────────────────────┘

.\scripts\cocinar.ps1 -Sistema 02

Resultado:
  - SISTEMA_02_Telecomunicaciones_EJECUTIVO.md actualizado
  - Incluye: "57 estaciones TETRA con 30% solapamiento"

        ↓

┌──────────────────────────────────────────────────────────┐
│  PASO 5: SERVIR (Exportar a Word/HTML + Layout)          │
└──────────────────────────────────────────────────────────┘

.\scripts\servir.ps1 -Sistema 02

Resultado:
  - SISTEMA_02_...EJECUTIVO.docx generado
  - Contiene:
    ✅ Descripción: "57 estaciones con 30% solapamiento"
    ✅ ANEXO Layout: Tabla con 57 estaciones + PKs actualizados
  - Layout INYECTADO automáticamente desde layout.md actualizado

        ↓

┌──────────────────────────────────────────────────────────┐
│  PASO 6: CLIENTE VE RESULTADO FINAL                      │
└──────────────────────────────────────────────────────────┘

Cliente recibe:
  ✅ Word con descripción técnica actualizada
  ✅ Tabla layout con 57 estaciones ubicadas
  ✅ PKs recalculados según nuevo criterio
  ✅ TODO COHERENTE desde 1 DT
```

---

## 📊 **COMPARATIVA: Actual vs Propuesto**

| Nivel | Descripción | Actual | Propuesto |
|:------|:------------|:-------|:----------|
| **1** | WBS (cantidades, $) | ✅ Implementado | ✅ Funciona |
| **2** | Ingeniería Detalle | ✅ Implementado | ✅ Funciona |
| **3** | Ingeniería Conceptual | ✅ Implementado | ✅ Funciona |
| **4** | Documentos Maestros | ✅ Implementado | ✅ Funciona |
| **5** | Entregables Consolid. | ✅ Implementado (cocinar.ps1) | ✅ Funciona |
| **6** | Índices | ✅ Implementado | ✅ Funciona |
| **7** | **LAYOUT (ubicaciones)** | ❌ **NO existe** | 🆕 **Por implementar** |
| **8** | **WBS Visual (HTML)** | ⚠️ **Manual** | 🆕 **Por automatizar** |

---

## 🔧 **LO QUE NECESITAMOS IMPLEMENTAR:**

### **Script 1: recalcular_layout_desde_DT.ps1** ❌ NO EXISTE

**Propósito:** Recalcular ubicaciones de equipos cuando cambian cantidades

**Lógica:**

```powershell
param(
    [string]$DT_ID,              # Ej: DT-TETRA-030
    [string]$TipoEquipo,         # Ej: TELECOMUNICACIONES
    [string]$Dispositivo,        # Ej: TETRA BS
    [int]$CantidadAnterior,      # Ej: 37
    [int]$CantidadNueva,         # Ej: 57
    [string]$MetodoDistribucion  # Ej: "uniforme" o "criterio_tecnico"
)

# 1. Leer layout.md actual
$layout = Get-Content "layout.md"

# 2. Encontrar filas del equipo afectado
$filasTE TRA = $layout | Where-Object { $_ -match 'TETRA BS' }
# Resultado: 37 filas encontradas

# 3. Calcular nueva distribución
$pkInicio = "201+470"
$pkFin = "722+250"
$distanciaTotal = 520.78 km  # (722.250 - 201.470)
$distanciaNueva = $distanciaTotal / $CantidadNueva
# = 520.78 / 57 = 9.14 km por estación

# 4. Generar nuevas ubicaciones PK
$nuevasEstaciones = @()
$pkActual = 201.470

for ($i = 1; $i -le $CantidadNueva; $i++) {
    $ufv = Calcular-UFV($pkActual)
    $nuevaEstacion = @{
        UFV = $ufv
        PK = Format-PK($pkActual)
        Tipo = "TELECOMUNICACIONES"
        Dispositivo = "TETRA BS"
        Nombre = "EBT_$($i.ToString('00'))"
    }
    $nuevasEstaciones += $nuevaEstacion
    $pkActual += 9.14
}

# 5. Reemplazar filas en layout.md
# Eliminar 37 filas antiguas TETRA
# Insertar 57 filas nuevas TETRA
# Mantener orden por PK

# 6. Guardar layout.md actualizado
# Versionar: v1.1 → v1.2

# 7. Regenerar WBS_Layout_Maestro.html
.\scripts\generar_layout_html_REORGANIZADO.ps1
```

---

### **Script 2: validar_coherencia_layout_DTs.ps1** ❌ NO EXISTE

**Propósito:** Validar que layout.md concuerda con DTs ejecutadas

**Lógica:**

```powershell
# 1. Leer todas las DTs ejecutadas
$dts = Get-ChildItem "II. Apendices Tecnicos/Decisiones_Tecnicas/DT-*.md"

# 2. Construir "estado esperado" desde DTs
$estadoEsperado = @{
    "TETRA_BS" = 37  # Según DT-TETRA-001
    "ATP_Embarcado" = 8  # Según DT-TETRA-001
    "Balizas_Eurobalise" = 0  # Según DT-CTC-001 (filosofía virtual)
    ...
}

# 3. Leer layout.md y contar equipos reales
$layoutReal = Parse-Layout("layout.md")
$equiposReales = @{
    "TETRA_BS" = ($layoutReal | Where-Object { $_.Dispositivo -eq "TETRA BS" }).Count
    "ATP_Embarcado" = ($layoutReal | Where-Object { $_.Dispositivo -eq "ATP" }).Count
    "Balizas_Eurobalise" = ($layoutReal | Where-Object { $_.Dispositivo -eq "Eurobalise" }).Count
}

# 4. Comparar esperado vs real
$inconsistencias = @()

foreach ($equipo in $estadoEsperado.Keys) {
    if ($estadoEsperado[$equipo] -ne $equiposReales[$equipo]) {
        $inconsistencias += @{
            Equipo = $equipo
            Esperado = $estadoEsperado[$equipo]
            Real = $equiposReales[$equipo]
            Diferencia = $equiposReales[$equipo] - $estadoEsperado[$equipo]
        }
    }
}

# 5. Generar reporte
Write-Host "INCONSISTENCIAS DETECTADAS:" -ForegroundColor Red
$inconsistencias | Format-Table

# Ejemplo salida:
# Equipo              Esperado  Real  Diferencia
# ------              --------  ----  ----------
# Balizas_Eurobalise        0   700         +700  ❌ ERROR
# TETRA_BS                 37    37            0  ✅ OK
# ATP_Embarcado             8    15           +7  ❌ ERROR
```

---

### **Script 3: actualizar_menu_wbs_desde_layout.ps1** ❌ NO EXISTE

**Propósito:** Actualizar estadísticas del menú WBS cuando cambia el layout

**Lógica:**

```powershell
# 1. Parsear layout.md
$equipos = Parse-Layout("layout.md")

# 2. Calcular estadísticas
$stats = @{
    TotalEquipos = $equipos.Count
    UFVUnicas = ($equipos | Select-Object -Unique UFV).Count
    TiposTelecom = ($equipos | Where-Object { $_.Tipo_Equipo -eq "TELECOMUNICACIONES" }).Count
    # ...
}

# 3. Actualizar WBS_Menu_Principal.html
$menu = Get-Content "IX/WBS_Menu_Principal.html"

# Buscar sección de estadísticas de layout
# Reemplazar números con $stats calculadas

# Ejemplo:
# ANTES:
#   <div class="summary-item">
#       <div class="number">800+</div>
#       <div class="label">Equipos en Layout</div>
#   </div>
#
# DESPUÉS:
#   <div class="summary-item">
#       <div class="number">$($stats.TotalEquipos)</div>
#       <div class="label">Equipos en Layout</div>
#   </div>

# 4. Guardar menú actualizado
```

---

## 🎯 **FLUJO ACTUAL vs FLUJO IDEAL**

### **LO QUE HACEMOS HOY (Implementado):**

```
DT creada
  ↓
Cursor ejecuta DT
  ↓
Actualiza 6 niveles:
  1. WBS (cantidades, $)
  2. V. Detalle
  3. III. Conceptual
  4. VIII. Maestros
  5. X. Consolidados (cocinar.ps1)
  6. Índices
  ↓
servir.ps1 → Word/HTML
  ↓
Layout ESTÁTICO inyectado (no recalculado) ⚠️
```

---

### **LO QUE DEBERÍAMOS HACER (Propuesto):**

```
DT creada
  ↓
Cursor ejecuta DT
  ↓
Actualiza 6 niveles actuales
  ↓
🆕 NIVEL 7: Recalcula Layout
  ├─ recalcular_layout_desde_DT.ps1
  ├─ Nuevas ubicaciones PK
  ├─ Actualiza layout.md
  └─ Versiona layout (v1.1 → v1.2)
  ↓
🆕 NIVEL 8: Regenera WBS Visual
  ├─ generar_layout_html_REORGANIZADO.ps1
  ├─ WBS_Layout_Maestro.html actualizado
  └─ Estadísticas reflejadas en menú
  ↓
cocinar.ps1 → Consolida
  ↓
servir.ps1 → Word/HTML
  ↓
Layout DINÁMICO inyectado (recalculado) ✅
```

---

## 📝 **EJEMPLO DE DT EXTENDIDA CON LAYOUT:**

```yaml
# DT-TETRA-030-2025-10-11.md
# Sección 10: INSTRUCCIONES PARA CURSOR

dt_metadata:
  id: "DT-TETRA-030"
  fecha: "2025-10-11"
  item_wbs: "2.1.100"
  tipo_cambio: "criterio_recalculo"
  impacto_layout: true  # 🆕 Flag que indica cambio de ubicaciones

archivos_actualizar:
  # ... (6 niveles actuales) ...

# 🆕 NUEVA SECCIÓN: Layout
layout_recalcular:
  activar: true
  tipo_equipo_afectado: "TELECOMUNICACIONES"
  dispositivo_especifico: "TETRA BS"
  criterio_cambio:
    parametro: "solapamiento_cobertura"
    valor_anterior: "20%"
    valor_nuevo: "30%"
  
  cantidad_equipos:
    anterior: 37
    nueva: 57
    diferencia: +20
  
  metodo_redistribucion: "uniforme_con_estaciones_fijas"
  estaciones_fijas_mantener:
    - PK: "201+470"  # México
    - PK: "441+932"  # B/Bermejo
    - PK: "722+250"  # Chiriguaná
  
  distribuir_entre_fijos: true
  distancia_nueva_promedio: "10.42 km"
  
  acciones_layout:
    - accion: "eliminar_filas_antiguas"
      criterio: "Dispositivo='TETRA BS'"
      cantidad_esperada: 37
      
    - accion: "generar_filas_nuevas"
      cantidad: 57
      algoritmo: "distribucion_uniforme"
      pk_inicio: "201+470"
      pk_fin: "722+250"
      mantener_puntos_fijos: true
      
    - accion: "actualizar_switches_acceso"
      patron_nomenclatura: "SWA_[UBICACION]_01"
      
    - accion: "versionar_layout"
      version_actual: "v1.1"
      version_nueva: "v1.2"
      nota: "DT-TETRA-030: Recalculo 37→57 estaciones (30% solapamiento)"

# 🆕 NUEVA SECCIÓN: WBS Visual
wbs_visual_actualizar:
  activar: true
  archivos:
    - file: "IX/WBS_Layout_Maestro.html"
      metodo: "regenerar_desde_layout_md"
      script: "generar_layout_html_REORGANIZADO.ps1"
      
    - file: "IX/WBS_Menu_Principal.html"
      seccion: "Tarjeta LAYOUT MAESTRO"
      actualizar_estadisticas:
        - campo: "Total Equipos"
          valor_anterior: "396"
          valor_nuevo: "416"
        - campo: "Equipos TELECOM"
          valor_anterior: "87"
          valor_nuevo: "107"
```

---

## 🔄 **CÓMO FUNCIONARÍA EL SISTEMA COMPLETO:**

### **Tu pregunta:** "Si te paso una DT con solapamiento 30%..."

### **Mi respuesta (Flujo ideal):**

```
1. TÚ creas: DT-TETRA-030-2025-10-11.md
   (Con YAML extendido incluyendo sección layout_recalcular)

2. YO (Cursor) ejecuto la DT:
   
   a) Leo YAML completo
   
   b) Actualizo 6 niveles actuales ✅
      - WBS: 37 → 57 estaciones
      - Presupuesto recalculado
      - V.3: Criterio 30% actualizado
      - Matrices: Trazabilidad agregada
   
   c) 🆕 RECALCULO LAYOUT:
      - Ejecuto: recalcular_layout_desde_DT.ps1
      - Leo layout.md
      - Encuentro 37 filas tipo "TETRA BS"
      - ELIMINO esas 37 filas
      - CALCULO 57 nuevos PKs:
        * PK_1 = 201+470 (fijo - México)
        * PK_2 = 201+470 + 10.42 = 211+890
        * PK_3 = 211+890 + 10.42 = 222+310
        * ...
        * PK_57 = 722+250 (fijo - Chiriguaná)
      - GENERO 57 nuevas filas:
        | UFV23 | 201+470 | TELECOM | TETRA BS | EBT_01 | ...
        | UFV23 | 211+890 | TELECOM | TETRA BS | EBT_02 | ...
        ...
      - INSERTO en layout.md (orden por PK)
      - Versiono: v1.1 → v1.2
   
   d) 🆕 REGENERO WBS VISUAL:
      - Ejecuto: generar_layout_html_REORGANIZADO.ps1
      - WBS_Layout_Maestro.html ahora tiene 57 TETRA
      - Estadísticas actualizadas:
        Total: 416 equipos (antes 396)
   
   e) COCINO documentos:
      - cocinar.ps1 -Sistema 02
      - SISTEMA_02_...EJECUTIVO.md actualizado
   
   f) SIRVO al cliente:
      - servir.ps1 -Sistema 02
      - Word generado CON:
        * Descripción: "57 estaciones con 30% solapamiento"
        * ANEXO Layout: Tabla con 57 TETRA + PKs recalculados

3. CLIENTE recibe:
   ✅ Documento coherente
   ✅ Cantidades: 57 estaciones
   ✅ Criterio: 30% solapamiento
   ✅ Layout: 57 ubicaciones PK recalculadas
   ✅ Presupuesto: Recalculado automáticamente
   ✅ TODO sincronizado desde 1 DT
```

---

## ⚠️ **ESTADO ACTUAL DEL LAYOUT:**

### **Problema 1: Layout es copia ciega de layout.md**

```
Tu layout.md original:
  - 396 filas
  - Algunas pueden ser incorrectas
  - Ejemplo: 700 balizas Eurobalise (pero filosofía es VIRTUAL)
  
Mi sistema actual:
  - Copia las 396 filas SIN VALIDAR ❌
  - Las muestra en HTML
  - Las inyecta en documentos
  - NO verifica si concuerdan con DTs
```

---

### **Problema 2: No hay recálculo automático**

```
Si cambias cantidad TETRA 37 → 57:
  
  Actual:
    - WBS se actualiza ✅
    - Docs se actualizan ✅
    - Layout.md NO se actualiza ❌
    - Sigues viendo 37 en layout ❌
    - Inconsistencia: Docs dicen "57", Layout muestra "37"
  
  Ideal:
    - WBS se actualiza ✅
    - Docs se actualizan ✅
    - Layout se RECALCULA automáticamente ✅
    - 57 estaciones con PKs redistribuidos ✅
    - Coherencia total ✅
```

---

## 🎯 **LO QUE PROPONGO IMPLEMENTAR:**

### **Fase 1: Validación (1-2 horas)** ⭐ PRIORITARIO

**Script:** `validar_coherencia_layout_DTs.ps1`

**Hace:**
1. Lee DTs ejecutadas
2. Extrae cantidades esperadas por tipo de equipo
3. Compara con layout.md actual
4. Genera reporte de inconsistencias
5. Propone correcciones

**Resultado:**
```
REPORTE DE VALIDACIÓN:

❌ Balizas Eurobalise:
   Esperado: 0 (DT-CTC-001: filosofía virtual)
   Real: 700 (layout.md tiene 700 filas)
   Acción: ELIMINAR 700 filas de balizas

✅ TETRA BS:
   Esperado: 37 (DT-TETRA-001)
   Real: 37 (layout.md tiene 37 filas)
   Estado: OK

❌ ATP Embarcado:
   Esperado: 8 (DT-TETRA-001)
   Real: 15 (layout.md tiene 15 filas)
   Acción: ELIMINAR 7 filas de ATP
```

---

### **Fase 2: Limpieza Manual del Layout (30 min)**

**Tú decides qué equipos SÍ van:**

```
Editar layout.md:
  1. Eliminar ~700 balizas Eurobalise (filosofía virtual)
  2. Ajustar ATP a 8 unidades
  3. Verificar cantidad de cada equipo vs DTs
  4. Regenerar HTML: generar_layout_html_REORGANIZADO.ps1
```

---

### **Fase 3: Automatización de Recálculo (3-4 horas)**

**Script:** `recalcular_layout_desde_DT.ps1`

**Hace:**
1. Lee DT con cambios de cantidad
2. Calcula nuevas ubicaciones PK
3. Actualiza layout.md
4. Regenera WBS visual
5. Versiona layout automáticamente

---

### **Fase 4: Integración Completa (2 horas)**

**Modificar:** `servir.ps1` v2.1

**Agregar:**
- Check de coherencia layout antes de servir
- Warning si layout desactualizado
- Regeneración automática de WBS visual

---

## 📊 **ARQUITECTURA PROPUESTA (7 NIVELES + Layout)**

```
DT-TETRA-030 (Solapamiento 30%)
                ↓
┌───────────────────────────────────────────┐
│  Cursor parsea YAML                       │
└───────────────────────────────────────────┘
                ↓
    ┌───────────┴────────────┬──────────────┬─────────────┐
    ↓                        ↓              ↓             ↓
[NIVEL 1-6]            [NIVEL 7]      [NIVEL 8]    [VALIDACIÓN]
 WBS, Docs,            LAYOUT          WBS Visual   Coherencia
 Maestros,             .md             .html        Check
 Índices
    ↓                        ↓              ↓             ↓
Cantidades            Ubicaciones     Interfaz      Reporte
actualizadas          recalculadas    "pintada"     inconsist.
    ↓                        ↓              ↓             ↓
    └───────────────┬────────┴──────────────┴─────────────┘
                    ↓
            cocinar.ps1 (Consolida)
                    ↓
            servir.ps1 (Exporta + Layout)
                    ↓
                Word/HTML
          (Todo coherente ✅)
```

---

## 🔧 **¿QUÉ QUIERES QUE HAGA AHORA?**

### **Opción A: Crear script de validación** ⭐ RECOMENDADO

```powershell
# Creo: validar_coherencia_layout_DTs.ps1
# Tú ejecutas y ves qué equipos están mal
# Limpiamos layout.md juntos
```

**Tiempo:** 30 minutos  
**Beneficio:** Sabemos exactamente qué corregir

---

### **Opción B: Crear script de recálculo**

```powershell
# Creo: recalcular_layout_desde_DT.ps1
# Pero primero necesitas layout.md limpio (sin inconsistencias)
```

**Tiempo:** 2-3 horas  
**Requisito:** Layout validado primero

---

### **Opción C: Limpieza manual guiada**

Te doy un checklist de qué equipos eliminar/mantener según las DTs ya ejecutadas, tú limpias manualmente.

**Tiempo:** 1 hora (tu trabajo)  
**Beneficio:** Layout correcto inmediatamente

---

## 🎯 **MI RECOMENDACIÓN:**

**PASO 1:** Crear script de validación (YO lo hago en 30 min)  
**PASO 2:** Ejecutas y ves reporte de inconsistencias  
**PASO 3:** Limpias layout.md según reporte  
**PASO 4:** Regeneras HTML con datos limpios  
**PASO 5:** (Futuro) Implemento recálculo automático  

---

**¿Procedo con Opción A (script de validación)?** 

Esto te dirá **exactamente**:
- Qué equipos sobran en el layout
- Qué equipos faltan
- Qué cantidades están mal
- Qué PKs podrían estar incorrectos

🤔 **¿Creamos el script de validación?**

