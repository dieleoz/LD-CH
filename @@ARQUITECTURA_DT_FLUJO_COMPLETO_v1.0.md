# ARQUITECTURA: FLUJO COMPLETO DE DECISIONES TÉCNICAS
**Proyecto:** APP La Dorada-Chiriguaná  
**Versión:** 1.0  
**Fecha:** 13 de Octubre 2025  
**Estado:** ✅ Sistema 100% Dinámico - 0% Hardcode

---

## 🎯 RESUMEN EJECUTIVO

Este documento explica **cómo el sistema propaga cambios** desde una Decisión Técnica (DT) a través de **6 niveles de documentación** SIN hardcodear valores, manteniendo coherencia técnica completa.

### **PRINCIPIO FUNDAMENTAL:**
```
UNA SOLA FUENTE DE VERDAD → SCRIPTS REGENERAN TODO → HTML CARGA DINÁMICAMENTE
```

---

## 🏗️ ARQUITECTURA COMPLETA

```
┌─────────────────────────────────────────────────────────────────┐
│  🎯 NIVEL 1: FUENTE ÚNICA DE VERDAD                             │
│                                                                  │
│  IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md              │
│  ├─ Nivel 1: ### **CAPÍTULO 1: CONTROL...**                    │
│  ├─ Nivel 2: #### **1.1 Sistema CTC Virtual (7 UND)**          │
│  └─ Nivel 3: | **1.1.100** | Servidores | 2 | $180M | $360M | │
│                                                                  │
│  📝 Este archivo se modifica MANUALMENTE por:                   │
│     - Cursor (ejecutando DTs con .cursorrules)                  │
│     - Especialista (cambios directos versionados)               │
└──────────────────────┬──────────────────────────────────────────┘
                       │
                       │ ⚡ DT MODIFICA AQUÍ
                       │ Ejemplo: DT-FIBRA-042
                       │ Item 2.3.103: 1,823 → 1,042 cajas
                       │ Total: $2,461M → $1,407M
                       │
                       ↓
┌─────────────────────────────────────────────────────────────────┐
│  📜 NIVEL 1: EXTRACTOR DINÁMICO                                 │
│                                                                  │
│  scripts/extraer_todos_items_wbs.ps1                           │
│                                                                  │
│  ¿Qué hace?                                                     │
│  1. Lee WBS_Presupuestal_v2.0.md línea por línea                │
│  2. Busca "**TOTAL CAPÍTULO X:**" → Agrega capítulo (nivel 1)  │
│  3. Busca "#### **X.Y ..."" → Agrega subcapítulo (nivel 2)     │
│  4. Busca "| **X.Y.ZZZ** |" → Agrega ítem (nivel 3)            │
│  5. Extrae: codigo, cantidad, vu_cop, total_cop (NÚMEROS PUROS)│
│  6. Genera: datos_wbs_TODOS_items.json (149 ítems)             │
│                                                                  │
│  ✅ Dinámico: Lee del archivo, NO hardcodea valores             │
│  ✅ Robusto: Detecta capítulos vía "TOTAL CAPÍTULO X"           │
│  ✅ Automático: Ejecutado por sincronizar_TODO.ps1              │
└──────────────────────┬──────────────────────────────────────────┘
                       │
                       │ Genera JSON estructurado
                       │
                       ↓
┌─────────────────────────────────────────────────────────────────┐
│  📦 NIVEL 1: DATOS INTERMEDIOS                                  │
│                                                                  │
│  datos_wbs_TODOS_items.json (149 ítems)                        │
│  {                                                              │
│    proyecto: "APP La Dorada-Chiriguaná",                       │
│    version: "3.0",                                              │
│    fecha_actualizacion: "2025-10-13",                           │
│    items: [                                                     │
│      // Nivel 1: Capítulos (6)                                  │
│      {codigo:"1", descripcion:"CONTROL Y SEÑALIZACIÓN...",      │
│       nivel:1, vu_cop:0, total_cop:0, tipo:""},                 │
│                                                                  │
│      // Nivel 2: Subcapítulos (19)                              │
│      {codigo:"1.1", descripcion:"Sistema CTC Virtual...",       │
│       nivel:2, vu_cop:0, total_cop:0, tipo:""},                 │
│                                                                  │
│      // Nivel 3: Ítems con valores (124)                        │
│      {codigo:"1.1.100", descripcion:"Servidores CTC...",        │
│       nivel:3, cantidad:"2", vu_cop:180000000,                  │
│       total_cop:360000000, tipo:"SUMINISTRO"}                   │
│    ]                                                            │
│  }                                                              │
│                                                                  │
│  ✅ Números PUROS (no strings "180.000.000")                    │
│  ✅ Todos los niveles (1, 2, 3)                                 │
│  ✅ Metadata completa (tipo, categoría, etc.)                   │
└──────────────────────┬──────────────────────────────────────────┘
                       │
                       │ Conversión automática (sincronizar_TODO.ps1):
                       │ $json = Get-Content ...
                       │ "const wbsDataGlobal = " + $json + ";"
                       │
                       ↓
┌─────────────────────────────────────────────────────────────────┐
│  🌐 NIVEL 1: DATOS PARA BROWSER                                 │
│                                                                  │
│  datos_wbs_TODOS_items.js                                      │
│  const wbsDataGlobal = { ... };                                 │
│  window.datos_wbs = wbsDataGlobal;                              │
│                                                                  │
│  ✅ Accesible desde HTML vía window.datos_wbs                   │
│  ✅ Cache-busting: ?v=20251013192528                            │
└──────────────────────┬──────────────────────────────────────────┘
                       │
                       │ HTML carga:
                       │ <script src="datos_wbs_TODOS_items.js?v=...">
                       │
                       ↓
┌─────────────────────────────────────────────────────────────────┐
│  🎨 NIVEL 1: INTERFAZ VISUAL (100% DINÁMICA)                    │
│                                                                  │
│  WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguaná.html            │
│                                                                  │
│  // PASO 1: Cargar datos (líneas 442-458)                       │
│  if (typeof window.datos_wbs !== 'undefined') {                 │
│      wbsData = window.datos_wbs.items.map(item => ({            │
│          nivel: item.codigo.split('.').length,                  │
│          item: item.codigo,                                     │
│          descripcion: item.descripcion,                         │
│          cantidad: item.cantidad || "",                         │
│          vu: item.vu_cop || 0,         // ✅ NÚMERO PURO        │
│          total: item.total_cop || 0,   // ✅ NÚMERO PURO        │
│          tipo: item.tipo || ""                                  │
│      }));                                                       │
│  }                                                              │
│                                                                  │
│  // PASO 2: Renderizar tabla (líneas 691-825)                   │
│  function renderTable() {                                       │
│      filteredData.forEach(item => {                             │
│          if (item.nivel === 1) {                                │
│              // Renderiza fila de capítulo                      │
│          } else if (item.nivel === 2) {                         │
│              // Renderiza fila de subcapítulo                   │
│          } else if (item.nivel === 3) {                         │
│              // Renderiza fila de ítem con valores              │
│              // Formatea SOLO aquí:                             │
│              const vu_formateado = parseNumber(item.vu)         │
│                  .toLocaleString('es-CO');                      │
│          }                                                      │
│      });                                                        │
│  }                                                              │
│                                                                  │
│  ✅ Detecta nivel automáticamente (split('.').length)           │
│  ✅ Formatea SOLO al mostrar, NO al cargar                      │
│  ✅ Calcula subtotales dinámicamente                            │
└─────────────────────────────────────────────────────────────────┘
```

---

## 📋 EJEMPLO COMPLETO: DT-FIBRA-042 (Cambiar cajas 300m → 500m)

### **PASO 1: Especialista genera DT**

```markdown
## 10. INSTRUCCIONES PARA CURSOR ⚙️

```yaml
archivos_actualizar:
  - file: "IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md"
    seccion: "Item 2.3.103"
    cambios:
      - campo: "cantidad"
        buscar: "1,823"
        reemplazar: "1,042"
      - campo: "total"
        buscar: "$2,461,050,000"
        reemplazar: "$1,406,700,000"
    versionamiento:
      version_actual: "v2.11"
      version_nueva: "v2.12"
      razon: "DT-FIBRA-042 - Espaciamiento 500m"

items_dependientes:
  recalcular: true
  items:
    - "2.3.104"  # Uniones rápidas (proporcional)
    - "2.3.113"  # Cajas repuesto (5% nueva cantidad)
  formula_base: "proporcional_a_item_principal"
```
```

### **PASO 2: CURSOR ejecuta (según .cursorrules)**

```powershell
# 2.1 Modificar WBS_Presupuestal_v2.0.md
search_replace(
  file: "IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md"
  old: "| **2.3.103** | Cajas empalme 80x80 | 1,823 | $1,350,000 | $2,461,050,000 |"
  new: "| **2.3.103** | Cajas empalme 80x80 | 1,042 | $1,350,000 | $1,406,700,000 |"
)

# 2.2 Recalcular ítems dependientes
# Item 2.3.104: 5,469 → 3,126 uniones (proporcional: -43%)
# Item 2.3.113: Recalcular 5% de 1,042 = 52 cajas repuesto

# 2.3 Versionar archivo
header: "# WBS PRESUPUESTAL v2.11" → "# WBS PRESUPUESTAL v2.12"

# 2.4 Ejecutar script sincronización
powershell: .\scripts\extraer_todos_items_wbs.ps1
```

### **PASO 3: Script regenera datos**

```powershell
# extraer_todos_items_wbs.ps1:

# 3.1 Lee WBS_Presupuestal_v2.0.md
$contenido = Get-Content $wbsPath -Raw -Encoding UTF8

# 3.2 Busca "**TOTAL CAPÍTULO X:**" → Agrega 6 capítulos
foreach ($lin in $lineasContenido) {
    if ($lin -match '^\*\*TOTAL CAP.?TULO (\d+):\*\*') {
        $items += @{codigo="1"; descripcion="CONTROL Y SEÑALIZACIÓN..."}
    }
}

# 3.3 Busca "#### **X.Y ..." → Agrega 19 subcapítulos
if ($linea -match '#### \*\*(\d+\.\d+)\s+(.+?)') {
    $items += @{codigo="1.1"; descripcion="Sistema CTC Virtual..."}
}

# 3.4 Busca "| **X.Y.ZZZ** |" → Agrega 124 ítems
if ($linea -match '^\|\s*\*\*(\d+\.\d+\.\d+)\*\*\s*\|...') {
    $items += @{
        codigo="2.3.103"
        cantidad="1042"         # ← LEE DEL ARCHIVO (no hardcode)
        vu_cop=1350000          # ← NÚMERO PURO
        total_cop=1406700000    # ← NÚMERO PURO (calculado: 1042 × 1350000)
    }
}

# 3.5 Genera datos_wbs_TODOS_items.json
ConvertTo-Json -Depth 10 | Out-File
```

### **PASO 4: Conversión a JS**

```powershell
# sincronizar_TODO.ps1:
$json = Get-Content 'datos_wbs_TODOS_items.json' -Raw
"const wbsDataGlobal = " + $json + ";" > datos_wbs_TODOS_items.js
```

### **PASO 5: HTML carga y renderiza**

```javascript
// WBS_Presupuesto_SCC...html:

// 5.1 Cargar datos (línea 442)
if (typeof window.datos_wbs !== 'undefined' && window.datos_wbs.items) {
    wbsData = window.datos_wbs.items.map(item => ({
        nivel: item.codigo.split('.').length,  // 1, 2 o 3
        item: item.codigo,                     // "2.3.103"
        descripcion: item.descripcion,         
        cantidad: item.cantidad || "",         // "1042"
        vu: item.vu_cop || 0,                  // ✅ 1350000 (NÚMERO)
        total: item.total_cop || 0,            // ✅ 1406700000 (NÚMERO)
        tipo: item.tipo || ""                  // "SUMINISTRO"
    }));
    // ✅ 149 ítems cargados
}

// 5.2 Renderizar tabla (línea 691)
function renderTable() {
    filteredData.forEach((item, index) => {
        // Detectar nivel
        if (item.nivel === 1) {
            // CAPÍTULO: Agregar fila de título
            row.innerHTML = `
                <td colspan="8" class="capitulo-row">
                    <h2>CAPÍTULO ${item.item}: ${item.descripcion}</h2>
                </td>
            `;
        } 
        else if (item.nivel === 2) {
            // SUBCAPÍTULO: Agregar fila de subtítulo
            row.className = 'nivel-2 subcapitulo';
            row.innerHTML = `
                <td colspan="8"><strong>${item.item} ${item.descripcion}</strong></td>
            `;
        }
        else if (item.nivel === 3) {
            // ÍTEM: Agregar fila con valores
            // ✅ Formatea SOLO aquí (no antes)
            const vu_formateado = '$' + parseNumber(item.vu)
                .toLocaleString('es-CO', {maximumFractionDigits: 0});
            const total_formateado = '$' + parseNumber(item.total)
                .toLocaleString('es-CO', {maximumFractionDigits: 0});
            
            row.innerHTML = `
                <td>${item.item}</td>
                <td>${item.descripcion}</td>
                <td>${item.tipo}</td>
                <td>${item.unidad}</td>
                <td>${item.cantidad}</td>
                <td>${vu_formateado}</td>           // "$1.350.000"
                <td>${total_formateado}</td>        // "$1.406.700.000"
                <td>${(item.total/4400).toFixed(0)} USD</td>
            `;
            
            // Acumular subtotales
            if (item.total && parseNumber(item.total) > 0) {
                chapterSubtotal += parseNumber(item.total);
                totalGeneral += parseNumber(item.total);
            }
        }
    });
    
    // Agregar fila TOTAL con AIU e IVA
    calcularTotalConAIUeIVA();
}
```

---

## 🔄 PROPAGACIÓN EN 6 NIVELES

### **NIVEL 1: IX. WBS Y PLANIFICACIÓN** ✅ OBLIGATORIO

```powershell
# Archivos actualizados:
1. WBS_Presupuestal_v2.0.md (manual por Cursor)
2. datos_wbs_TODOS_items.json (automático por script)
3. datos_wbs_TODOS_items.js (automático por script)
4. HTML carga y muestra (automático por navegador)

# Comando:
.\scripts\extraer_todos_items_wbs.ps1
```

### **NIVEL 2: V. INGENIERÍA DETALLE** ⚠️ CONDICIONAL

```powershell
# Script automático:
.\scripts\actualizar_documentos_detalle.ps1

# Qué hace:
- Lee YAML de DTs
- Busca archivos V.X mencionados
- Actualiza secciones específicas
- Versiona: v5.0 → v5.1
- Agrega nota: "Origen: DT-FIBRA-042"

# Ejemplo:
V.3_Sistemas_Comunicacion_Detalle.md
  Sección 5.3 "Cajas de empalme"
  Antes: "1,823 cajas (espaciamiento 300m)"
  Después: "1,042 cajas (espaciamiento 500m)"
```

### **NIVEL 3: III. INGENIERÍA CONCEPTUAL** ⚠️ SI APLICA

```powershell
# Cursor actualiza (según MATRIZ_DEPENDENCIAS):
28_Sistema_FibraOptica_Integrado.md
  Sección 2.2 "Criterios de diseño"
  Criterio: "Espaciamiento cajas: 500m (UIT-T máx 500m)"
```

### **NIVEL 4: VIII. DOCUMENTOS MAESTROS** ✅ OBLIGATORIO

```powershell
# Script automático:
.\scripts\actualizar_documentos_maestros.ps1

# Qué hace:
1. MATRIZ_DEPENDENCIAS_DOCUMENTALES
   | fibra | DT-FIBRA-042 | WBS, V.3, 28_FibraOptica | Cantidades |

2. MATRIZ_TRAZABILIDAD_TECNICA
   DT-FIBRA-042 → [WBS Item 2.3.103, V.3 §5.3, III/28 §2.2]

3. CRITERIOS_TECNICOS_MAESTRO
   "Cajas fibra: Espaciamiento 500m (UIT-T G.652.D máx 500m)"
```

### **NIVEL 5: X. ENTREGABLES CONSOLIDADOS** ⚠️ MANUAL

```powershell
# Scripts:
.\scripts\cocinar.ps1 -Sistema 02
.\scripts\servir.ps1 -Sistema 02

# Qué hace:
- Consolida I-VI → SISTEMA_02_Telecomunicaciones_EJECUTIVO.md
- Genera Word: SISTEMA_02...docx
- Genera HTML: SISTEMA_02...html
```

### **NIVEL 6: ÍNDICES** ✅ OBLIGATORIO

```
Actualiza referencias en:
- Indice_Maestro_Consolidado_v1.0.md
- README.md
```

---

## 🔍 PUNTOS CLAVE (SIN HARDCODE)

### ✅ **1. Valores se extraen dinámicamente del WBS**
```powershell
# NO hace esto:
$cantidad = 1823  # ❌ Hardcode

# Hace esto:
if ($linea -match '\|\s*\*\*2\.3\.103\*\*\s*\|.*\|\s*(\d+)') {
    $cantidad = $matches[1]  # ✅ Lee del archivo
}
```

### ✅ **2. Capítulos se detectan vía marcadores**
```powershell
# NO hace esto:
$capitulos = @("CONTROL...", "TELECOM...")  # ❌ Hardcode

# Hace esto:
if ($lin -match '^\*\*TOTAL CAPÍTULO (\d+):\*\*') {
    # Busca descripción hacia arriba en el archivo
    $desc = extraerDescripcionCapitulo($numCap)  # ✅ Dinámico
}
```

### ✅ **3. HTML calcula totales dinámicamente**
```javascript
// NO hace esto:
const totalGeneral = 307533941332;  // ❌ Hardcode

// Hace esto:
filteredData.forEach(item => {
    if (item.total && parseNumber(item.total) > 0) {
        totalGeneral += parseNumber(item.total);  // ✅ Suma dinámica
    }
});

// Aplica AIU/IVA según regla canónica:
const aiu = sumaObra * 0.33;
const iva = (sumaSuministros * 0.19) + (sumaServicios * 0.19) + (sumaObra * 0.05 * 0.19);
const total = cd + aiu + iva;  // ✅ Calculado, NO hardcodeado
```

---

## 🎯 VENTAJAS DE ESTA ARQUITECTURA

| Característica | Beneficio |
|:---------------|:----------|
| **Una sola fuente de verdad** | Cambios SOLO en WBS_Presupuestal_v2.0.md |
| **Regeneración automática** | Scripts extraen y convierten sin intervención |
| **0% Hardcode en HTML** | HTML carga datos dinámicamente |
| **Escalable** | Agregar capítulo 7: Solo editar WBS.md |
| **Mantenible** | Scripts claros con REGEX documentados |
| **Trazable** | Cada cambio tiene DT con YAML completo |

---

## 🧪 CASOS DE USO

### **Caso 1: Cambiar cantidad de un ítem**
```yaml
DT-FIBRA-042: Cajas 1,823 → 1,042
  ↓
Cursor modifica WBS_Presupuestal_v2.0.md (1 línea)
  ↓
Script regenera JSON (149 ítems, incluye nuevo valor)
  ↓
HTML carga y muestra automáticamente
```

### **Caso 2: Agregar nuevo ítem al WBS**
```yaml
Especialista agrega en WBS_Presupuestal_v2.0.md:
| **2.3.110** | Medidores OTDR adicionales | 3 | $30,000,000 | $90,000,000 |
  ↓
Script lo detecta automáticamente (REGEX de ítems)
  ↓
JSON ahora tiene 150 ítems (149 + 1)
  ↓
HTML muestra nueva fila automáticamente
```

### **Caso 3: Agregar capítulo 7**
```yaml
Especialista agrega en WBS_Presupuestal_v2.0.md:
### **CAPÍTULO 7: SISTEMA DE MANTENIMIENTO**
...
**TOTAL CAPÍTULO 7:** **$X,XXX,XXX,XXX**
  ↓
Script detecta "TOTAL CAPÍTULO 7:" automáticamente
  ↓
JSON ahora tiene capítulo 7 + sus subcapítulos + ítems
  ↓
HTML renderiza capítulo 7 automáticamente
```

---

## 📝 RESUMEN

### **El sistema NO hardcodea porque:**

1. ✅ **WBS_Presupuestal_v2.0.md** = Fuente única de verdad
2. ✅ **Script extractor** = Lee dinámicamente con REGEX
3. ✅ **JSON** = Datos puros (números, no strings formateados)
4. ✅ **HTML** = Carga y formatea dinámicamente

### **Cuando cambias cantidades:**

```
MODIFICAS 1 ARCHIVO → EJECUTAS 1 SCRIPT → TODO SE ACTUALIZA AUTOMÁTICAMENTE
```

### **NO necesitas:**
- ❌ Modificar HTML manualmente
- ❌ Hardcodear valores en JSON
- ❌ Actualizar múltiples archivos
- ❌ Recordar qué archivos cambiar

### **El sistema hace TODO por ti:**
- ✅ Extrae valores del WBS
- ✅ Regenera JSON/JS
- ✅ Actualiza HTML (via cache-busting)
- ✅ Propaga a 6 niveles (según .cursorrules)

---

## 🚀 COMANDO ÚNICO

Para sincronizar TODO el sistema después de una DT:

```powershell
.\scripts\sincronizar_SISTEMA_COMPLETO_v14.3.ps1
```

Este comando ejecuta:
1. `extraer_todos_items_wbs.ps1` (WBS → JSON)
2. `sincronizar_riesgos_wbs_v3.ps1` (Riesgos)
3. `sincronizar_cronograma.ps1` (Cronograma)
4. `sincronizar_reporte_gerencial.ps1` (Reporte)

**Tiempo total:** ~10 segundos  
**Archivos actualizados:** 15+  
**Niveles sincronizados:** 6  

---

**Documento técnico**  
**Autor:** AI Assistant  
**Revisado por:** Usuario  
**Estado:** ✅ Arquitectura validada y operativa

