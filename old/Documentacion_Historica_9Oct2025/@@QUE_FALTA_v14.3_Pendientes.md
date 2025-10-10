# ⏳ QUÉ FALTA - PENDIENTES POST v14.3

**Fecha:** 9 de Octubre 2025  
**Sistema actual:** v14.3 OPERATIVO  
**Estado:** 90% completado - Pendientes de automatización completa

---

## ✅ LO QUE YA ESTÁ FUNCIONANDO (v14.3)

### **Sistema Core:**
- ✅ WBS Presupuestal Interactiva
- ✅ EDT Detalle con metadata enriquecida
- ✅ Cronograma con 124 actividades
- ✅ Análisis de Riesgos (7 riesgos vinculados)
- ✅ Reporte Gerencial (18 DTs procesadas)
- ✅ Trazabilidad DT → 7 niveles documentada
- ✅ Sistema SERVIR (.docx/.html bajo demanda)
- ✅ 8 tipos de DT específicos

### **Flujos automáticos:**
- ✅ DT → WBS actualizado
- ✅ DT → Metadata enriquecida
- ✅ DT → Matrices de dependencias
- ✅ DT → Archivos V.X versionados
- ✅ DT → Carpeta X consolidada
- ✅ I-VI → Servir → X/ (Pandoc)

---

## ⏳ LO QUE FALTA IMPLEMENTAR

### **1. AUTOMATIZACIÓN COMPLETA DE TIPOS DE DT** 🔧

#### **Actualmente:**
- ✅ Tipos de DT definidos en formulario (8 opciones)
- ✅ YAML manual en DTs con instrucciones
- ⏳ **FALTA:** Procesamiento automático según tipo

#### **Por implementar:**

**a) Script `procesar_DT_por_tipo.ps1`:**
```powershell
# Lee DT ejecutada
# Detecta tipo (criterio_tecnico, riesgo, cronograma, etc.)
# Ejecuta acciones específicas según tipo:

if ($tipo -eq "riesgo" -or $tipo -eq "riesgo_cronograma") {
    # Agregar automáticamente a MATRIZ_RIESGOS_PMO_AMPLIADA
    Agregar-RiesgoAMatriz -DT $dt
    
    # Ejecutar: sincronizar_riesgos_wbs_v3.ps1
    Actualizar-RiesgosWBS
}

if ($tipo -eq "cronograma" -or $tipo -eq "riesgo_cronograma") {
    # Ajustar cronograma_datos.json automáticamente
    Ajustar-Cronograma -DT $dt
    
    # Regenerar cronograma_datos.js
    Actualizar-CronogramaJS
}

if ($tipo -eq "criterio_tecnico") {
    # Ya funciona (metadata + I-VI)
    # Pero podría mejorar con templates
    Actualizar-Metadata -DT $dt
}
```

**Beneficio:** DT ejecutada → Todo se actualiza automáticamente según tipo

---

**b) Templates YAML por tipo:**

Cuando usuario selecciona tipo en formulario, generar YAML apropiado:

```yaml
# Template para "Riesgo + Cronograma"
archivos_actualizar:
  - file: "VIII/.../MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md"
    accion: "agregar_riesgo"
    nuevo_riesgo:
      id: "[AUTO-GENERADO]"
      descripcion: "[TEXTO_USUARIO]"
      categoria: "Cronograma"
      probabilidad: [1-5]
      impacto: [1-5]
      
  - file: "IX/.../cronograma_datos.json"
    accion: "ajustar_cronograma"
    cambios_cronograma:
      actividad: "[CODIGO_WBS]"
      adelantar_meses: [NUMERO]
```

**Beneficio:** Usuario NO escribe YAML manualmente, se genera según tipo

---

**c) Actualizar `actualizar_documentos_maestros.ps1`:**

Actualmente solo registra DT en matrices. Expandir para:

```powershell
# Si tipo = "riesgo"
if ($tipoCambio -match "riesgo") {
    # Agregar riesgo automáticamente
    $riesgoId = "R-$sistema-" + ($ultimoRiesgo + 1).ToString("000")
    Agregar-FilaRiesgo -Id $riesgoId -Descripcion $desc -DT $dtId
}

# Si tipo = "cronograma"
if ($tipoCambio -match "cronograma") {
    # Ajustar fechas en cronograma_datos.json
    $cronograma = Get-Content "IX.../cronograma_datos.json" | ConvertFrom-Json
    # ... modificar fechas
    $cronograma | ConvertTo-Json | Set-Content "cronograma_datos.json"
}
```

**Beneficio:** Script maestro maneja todos los tipos automáticamente

---

### **2. MATRIZ DE RIESGOS - ACTUALIZACIÓN AUTOMÁTICA** ⚠️

#### **Actualmente:**
- ✅ DT-FIBRA-003 identifica riesgo R-FIBRA-001
- ⏳ **FALTA:** Agregar riesgo a matriz MANUAL

#### **Por automatizar:**

**Script:** `agregar_riesgo_desde_DT.ps1`

```powershell
# Lee DT con tipo "riesgo" o "riesgo_cronograma"
$dt = Get-Content "II.../DT-FIBRA-003-2025-10-09.md"

# Extrae metadata de riesgo desde YAML
$riesgoId = "R-FIBRA-001"
$descripcion = "Lead time crítico..."
$probabilidad = 5
$impacto = 5
# ...

# Abre MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md
$matriz = Get-Content "VIII/.../MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md"

# Busca tabla de riesgos
# Agrega nueva fila automáticamente
$nuevaFila = "| $riesgoId | $descripcion | Cronograma | $prob | $imp | ... | DT-FIBRA-003 | ... |"

# Guarda matriz actualizada
```

**Resultado:** DT ejecutada → Riesgo aparece automáticamente en `WBS_Analisis_Riesgos.html`

---

### **3. CRONOGRAMA - AJUSTE AUTOMÁTICO** 📅

#### **Actualmente:**
- ✅ DT-FIBRA-003 requiere ajuste de cronograma (Mes -9)
- ⏳ **FALTA:** Modificar `cronograma_datos.json` MANUAL

#### **Por automatizar:**

**Script:** `ajustar_cronograma_desde_DT.ps1`

```powershell
# Lee DT con tipo "cronograma" o "riesgo_cronograma"
$dt = Get-Content "II.../DT-FIBRA-003-2025-10-09.md"

# Extrae cambios de cronograma desde YAML
$actividadId = "2.3.100-PRE"
$nombre = "Orden Compra Fibra"
$inicio = "Mes -9"
$duracion = 9
# ...

# Abre cronograma_datos.json
$cronograma = Get-Content "IX.../cronograma_datos.json" | ConvertFrom-Json

# Agrega nueva actividad
$nuevaActividad = @{
    codigo = $actividadId
    nombre = $nombre
    inicio = $inicio
    duracion_meses = $duracion
    predecesora = $null
    criticidad = "CRÍTICA"
}

$cronograma.actividades += $nuevaActividad

# Guarda JSON actualizado
$cronograma | ConvertTo-Json -Depth 10 | Set-Content "cronograma_datos.json"

# Regenera cronograma_datos.js
Regenerar-CronogramaJS
```

**Resultado:** DT ejecutada → Cronograma actualizado → `WBS_Cronograma_Propuesta.html` muestra cambios

---

### **4. GENERACIÓN AUTOMÁTICA DE YAML EN FORMULARIO** 🤖

#### **Actualmente:**
- ✅ Formulario tiene 8 tipos de DT
- ⏳ **FALTA:** Generar YAML automáticamente según tipo seleccionado

#### **Por implementar:**

**En `WBS_COMPLETA_TODO_Interactiva_v4.0.html`:**

```javascript
function generarYAMLPorTipo(tipo, itemWBS, observacion) {
    let yaml = "";
    
    switch(tipo) {
        case "criterio_tecnico":
            yaml = `
archivos_actualizar:
  - file: "IX.../wbs_metadata_enriquecida.json"
    accion: "agregar_o_actualizar_metadata"
    item_codigo: "${itemWBS}"
    metadata:
      justificacion_tecnica: "${observacion}"
`;
            break;
            
        case "riesgo_cronograma":
            yaml = `
archivos_actualizar:
  - file: "VIII/.../MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md"
    accion: "agregar_riesgo"
    nuevo_riesgo:
      id: "R-AUTO-${Date.now()}"
      descripcion: "${observacion}"
      
  - file: "IX.../cronograma_datos.json"
    accion: "ajustar_cronograma"
`;
            break;
            
        // ... otros tipos
    }
    
    return yaml;
}

// Al crear DT, insertar YAML generado automáticamente
```

**Beneficio:** Usuario selecciona tipo → YAML se escribe automáticamente

---

### **5. SCRIPT MAESTRO v14.4 - TODO AUTOMATIZADO** 🚀

#### **Script:** `sincronizar_SISTEMA_COMPLETO_v14.4.ps1`

```powershell
# PASO 1: Detectar DTs nuevas o modificadas
$dtsNuevas = Get-ChildItem "II.../Decisiones_Tecnicas/" | 
    Where-Object { $_.LastWriteTime -gt (Get-Date).AddHours(-24) }

foreach ($dt in $dtsNuevas) {
    Write-Host "Procesando $($dt.Name)..."
    
    # PASO 2: Extraer tipo de DT
    $contenido = Get-Content $dt.FullName -Raw
    if ($contenido -match 'tipo_cambio:\s*"(\w+)"') {
        $tipo = $matches[1]
    }
    
    # PASO 3: Ejecutar según tipo
    switch ($tipo) {
        "cantidad" {
            # Actualizar WBS + Datos
            .\actualizar_wbs_cantidad.ps1 -DT $dt.Name
        }
        "precio" {
            # Actualizar WBS + Datos
            .\actualizar_wbs_precio.ps1 -DT $dt.Name
        }
        "criterio_tecnico" {
            # Actualizar metadata + I-VI + X/
            .\actualizar_documentos_detalle.ps1 -DT $dt.Name
            .\actualizar_metadata.ps1 -DT $dt.Name
        }
        "riesgo" {
            # Agregar a matriz de riesgos
            .\agregar_riesgo_desde_DT.ps1 -DT $dt.Name
            .\sincronizar_riesgos_wbs_v3.ps1
        }
        "cronograma" {
            # Ajustar cronograma
            .\ajustar_cronograma_desde_DT.ps1 -DT $dt.Name
            .\sincronizar_cronograma.ps1
        }
        "riesgo_cronograma" {
            # Combinar ambos
            .\agregar_riesgo_desde_DT.ps1 -DT $dt.Name
            .\ajustar_cronograma_desde_DT.ps1 -DT $dt.Name
            .\sincronizar_riesgos_wbs_v3.ps1
            .\sincronizar_cronograma.ps1
        }
    }
    
    # PASO 4: Actualizar matrices siempre
    .\actualizar_documentos_maestros.ps1 -DT $dt.Name
}

# PASO 5: Reporte final
Write-Host "✅ DTs procesadas: $($dtsNuevas.Count)"
Write-Host "✅ Todos los archivos sincronizados"
```

**Beneficio:** UN SOLO COMANDO sincroniza TODO según tipo de DT

---

### **6. INTERFAZ "EJECUTAR DT" EN WBS INTERACTIVA** 🖱️

#### **Por implementar:**

**En panel de DT creada:**

```html
<div class="dt-actions">
    <button onclick="ejecutarDT('DT-FIBRA-003-2025-10-09')">
        🔧 EJECUTAR DT AHORA
    </button>
    <button onclick="simularDT('DT-FIBRA-003-2025-10-09')">
        🔍 SIMULAR (Dry-run)
    </button>
    <button onclick="validarDT('DT-FIBRA-003-2025-10-09')">
        ✅ VALIDAR YAML
    </button>
</div>

<script>
function ejecutarDT(dtId) {
    // Llamar a API local o ejecutar PowerShell
    fetch('/api/ejecutar-dt', {
        method: 'POST',
        body: JSON.stringify({ dt: dtId })
    })
    .then(resp => resp.json())
    .then(resultado => {
        alert(`✅ DT ejecutada: ${resultado.archivos_actualizados} archivos`);
        // Recargar HTML actualizado
        location.reload();
    });
}
</script>
```

**Beneficio:** Ejecutar DT desde browser sin terminal

---

## 📊 RESUMEN DE PENDIENTES

| Funcionalidad | Estado | Prioridad | Tiempo estimado |
|:--------------|:-------|:----------|:----------------|
| **Procesamiento auto por tipo** | ⏳ Pendiente | ⭐⭐⭐ ALTA | 4 horas |
| **Agregar riesgo automático** | ⏳ Pendiente | ⭐⭐⭐ ALTA | 2 horas |
| **Ajustar cronograma auto** | ⏳ Pendiente | ⭐⭐⭐ ALTA | 2 horas |
| **Generar YAML por tipo** | ⏳ Pendiente | ⭐⭐ MEDIA | 3 horas |
| **Script maestro v14.4** | ⏳ Pendiente | ⭐⭐⭐ ALTA | 2 horas |
| **Botón "Ejecutar DT" UI** | ⏳ Pendiente | ⭐ BAJA | 4 horas |

**Total estimado:** 17 horas (2 días)

---

## 🎯 PRÓXIMA VERSIÓN: v14.4

### **Objetivo:**
Automatización COMPLETA de DTs por tipo específico

### **Entregables:**
1. ✅ `procesar_DT_por_tipo.ps1` (detecta y ejecuta según tipo)
2. ✅ `agregar_riesgo_desde_DT.ps1` (agrega riesgo automáticamente)
3. ✅ `ajustar_cronograma_desde_DT.ps1` (ajusta cronograma)
4. ✅ `sincronizar_SISTEMA_COMPLETO_v14.4.ps1` (maestro mejorado)
5. ✅ Templates YAML en formulario (generación automática)
6. ✅ Botones UI para ejecutar/simular/validar DTs

### **Resultado esperado:**
```
Usuario crea DT (tipo: Riesgo + Cronograma)
    ↓
YAML se genera automáticamente
    ↓
Click "Ejecutar DT"
    ↓
TODO se actualiza automáticamente:
    ✅ Riesgo agregado a matriz
    ✅ Cronograma ajustado
    ✅ Metadata actualizada
    ✅ riesgos_wbs.js regenerado
    ✅ cronograma_datos.js regenerado
    ✅ HTMLs actualizados
    ↓
Cliente ve cambios en:
    - WBS_Analisis_Riesgos.html (riesgo nuevo)
    - WBS_Cronograma_Propuesta.html (actividad nueva)
    - WBS_EDT_Detalle.html (metadata actualizada)
```

---

## 🔧 PROBLEMAS CONOCIDOS A RESOLVER

### **1. Pandoc no instalado en todos los entornos**
- **Solución:** Verificar si Pandoc existe antes de servir
- **Fallback:** Generar solo HTML sin .docx si falta

### **2. Browser no puede ejecutar .ps1**
- **Solución actual:** Usuario ejecuta manual
- **Mejora futura:** API local Node.js que ejecute scripts

### **3. Cache HTML persiste**
- **Solución actual:** Cache-busting con `?v=X.Y.Z`
- **Mejora:** Timestamp dinámico en cada carga

---

## ✅ LO QUE YA NO ES NECESARIO

- ❌ Crear DTs manualmente → YA existe formulario en WBS
- ❌ Escribir YAML manualmente → Se automatizará con templates
- ❌ Ejecutar 7 scripts separados → Script maestro ejecuta todo
- ❌ Actualizar matrices manualmente → Scripts automatizan
- ❌ Versionar V.X manualmente → Script `actualizar_documentos_detalle.ps1` lo hace

---

**Estado actual:** 90% completado ✅  
**Próximo hito:** v14.4 - Automatización completa por tipo (2 días)  
**Fecha actualización:** 9 de Octubre 2025

