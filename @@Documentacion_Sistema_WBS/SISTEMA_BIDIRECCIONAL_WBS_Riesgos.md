# SISTEMA BIDIRECCIONAL WBS ↔ RIESGOS ↔ TERMINAL
## Integración Completa para Gestión de Cambios

**Proyecto:** APP La Dorada-Chiriguaná  
**Fecha:** 7 de Octubre de 2025  
**Versión:** 1.0  

---

## 🎯 **CONCEPTO: SISTEMA BIDIRECCIONAL**

### **Flujo 1: Usuario Final → Sistema**
```
Usuario en WBS Interactiva
    ↓
Propone cambio (ej: cajas 300m → 500m)
    ↓
Sistema analiza TODO:
- ✅ Criterios técnicos (norma, acceso, fallas, costo)
- ✅ Impacto en otros ítems WBS
- ✅ Riesgos nuevos/modificados
- ✅ Archivos afectados
- ✅ Recomendación fundamentada
    ↓
Usuario aprueba
    ↓
Sistema ejecuta cambios en I-VI
```

### **Flujo 2: Terminal/PMO → Interfaz**
```
PMO actualiza riesgo en terminal
    ↓
Modifica: VIII/Matrices_Dependencias/MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md
    ↓
Sistema detecta cambio (auto-refresh o manual)
    ↓
WBS Interactiva recarga riesgos
    ↓
Usuario ve riesgos actualizados en interfaz
```

---

## 📊 **QUÉ ANALIZA LA INTERFAZ (TODO, NO SOLO RIESGOS)**

### **1. ANÁLISIS DE CRITERIOS TÉCNICOS** ✅

**Tabla generada automáticamente:**
| Criterio | Valor Actual | Valor Propuesto | Cumplimiento | Observaciones |
|:---------|:-------------|:----------------|:-------------|:--------------|
| Norma UIT-T | 300m | 500m | ✅ Cumple | Dentro de límite |
| Acceso vehicular | ❌ Difícil | ✅ Mejorado | ✅ Bueno | Mejor acceso mantenimiento |
| Localización fallas | ✅ Rápida | ⏱️ +66% tiempo | ⚠️ Aceptable | Aumento moderado |
| Costo-efectividad | ❌ Alto CAPEX | ✅ Mejora 42.5% | ✅ Excelente | Reducción significativa |

**Fuentes consultadas:**
- `CRITERIOS_TECNICOS_MAESTRO_v1.0.md` - Criterios maestros
- Normas UIT-T, RETIE, estándares ferroviarios
- Documentos técnicos en III/ y V/

---

### **2. ANÁLISIS DE IMPACTO EN OTROS ÍTEMS WBS** ✅

**Tabla generada automáticamente:**
| Ítem WBS | Descripción | Cant. Actual | Cant. Nueva | Δ Costo |
|:---------|:------------|:-------------|:------------|:--------|
| 2.3.104 | Uniones rápidas (3 × cajas) | 6,204 | 3,564 | -$92,400,000 |
| 2.3.108 | Insumos fusionado (3.2 × cajas) | 6,600 | 3,780 | -$42,300,000 |
| **TOTAL IMPACTO** | | | | **-$134,700,000** |

**Cálculo:** Sistema identifica ítems vinculados y recalcula automáticamente

---

### **3. ANÁLISIS DE RIESGOS DETALLADO** ✅

**Por cada alternativa:**

**Alternativa 1 (300m - Actual):**
| Riesgo | Prob | Impacto | Estrategia |
|:-------|:-----|:--------|:-----------|
| R-FIBRA-003 (CAPEX alto) | Alta | Alto | Aceptar |
| R-FIBRA-008 (Acceso vehicular) | Media | Medio | Aceptar |

**Alternativa 2 (500m - Propuesta):**
| Riesgo | Prob | Impacto | Estrategia |
|:-------|:-----|:--------|:-----------|
| R-FIBRA-003 (CAPEX) | Baja | Alto | Mitigado |
| R-FIBRA-006 (Localización fallas) | Baja | Medio | Aceptar |
| R-FIBRA-008 (Acceso) | Baja | Bajo | Mitigado |

**Alternativa 3 (1000m - Agresiva):**
| Riesgo | Prob | Impacto | Estrategia |
|:-------|:-----|:--------|:-----------|
| R-FIBRA-006 (Localización fallas) | Media | Alto | Mitigar con OTDR |
| R-FIBRA-007 (Degradación señal) | Media | Medio | Mitigar con validación |

**Fuente:** Riesgos cargados desde `MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md`

---

### **4. ARCHIVOS QUE SE ACTUALIZARÁN** ✅

**Consultado automáticamente de MATRIZ_DEPENDENCIAS:**
| Archivo | Ubicación | Sección | Tipo Cambio | Versión |
|:--------|:----------|:--------|:------------|:--------|
| V.3_Sistemas_Comunicacion_Detalle.md | Carpetas I-VI | Tabla 5.3 | Cantidades | v2.0 → v2.1 |
| WBS_Presupuestal_v3.0.md | Carpetas I-VI | Item 2.3.103 | Costos | Recalculado |
| IV/37_Memorias_Diseno_Basico.md | Carpetas I-VI | Sección 4.2.3 | Especificaciones | v5.0 → v5.1 |
| III/28_Sistema_FibraOptica_Integrado.md | Carpetas I-VI | Sección 2.2 | Criterios | v5.0 → v5.1 |
| X/SISTEMA_02_Telecomunicaciones_Master.md | Carpeta X | Sección 5.2.3 | Consolidado | ⏳ Snapshot mensual |

---

### **5. COMPARATIVA DE ALTERNATIVAS** ✅

**3 Alternativas con puntaje calculado:**
- Alternativa 1: 300m - Puntaje 7.2/10
- **Alternativa 2: 500m - Puntaje 8.5/10** ⭐ RECOMENDADA
- Alternativa 3: 1000m - Puntaje 6.8/10

**Matriz de decisión (pesos):**
- Costo CAPEX: 30%
- Cumplimiento técnico: 25%
- Facilidad construcción: 20%
- Mantenibilidad: 15%
- Riesgo técnico: 10%

---

### **6. RECOMENDACIÓN DEL SISTEMA** ✅

```
🎯 RECOMENDACIÓN: ✅ APROBAR ALTERNATIVA 2 (500m)

Puntaje: 8.5/10
Ahorro: $1,188,000,000 COP (42.5%)

Justificación:
✅ Cumple norma UIT-T estrictamente
✅ Balance óptimo entre ahorro y riesgo
✅ Riesgos manejables (2 identificados)
✅ Ahorro significativo en CAPEX

Condiciones:
📝 Actualizar CRITERIOS_TECNICOS_MAESTRO
⚠️ Agregar 2 riesgos a MATRIZ_RIESGOS_PMO
📁 Actualizar 5 archivos en carpetas I-VI
```

---

## 🔄 **SISTEMA BIDIRECCIONAL: TERMINAL → INTERFAZ**

### **Caso de Uso: PMO actualiza riesgo desde terminal**

**PASO 1: PMO edita matriz de riesgos**
```bash
# Terminal/Editor
Archivo: VIII/Matrices_Dependencias/MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md

CAMBIO:
Agregar nuevo riesgo:
| R-FIBRA-009 | Técnico | Validación OTDR no realizada | Alta | Alto | Mitigar | Ing. Fibra | Activo | Validación | DT-FIBRA-001 | H-FIBRA-005 |

Guardar archivo
```

**PASO 2: Sistema detecta cambio**
```javascript
// En WBS_Presupuestal_INTERACTIVA_v3.0.html

Opción A: Auto-refresh cada 30 segundos
setInterval(recargarRiesgosDesdeMatriz, 30000);

Opción B: Botón manual "🔄 Actualizar Riesgos"
Click en botón → Lee archivo → Actualiza interfaz
```

**PASO 3: Interfaz actualiza riesgos**
```javascript
function recargarRiesgosDesdeMatriz() {
    // Leer archivo: MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md
    // Filtrar riesgos donde campo "Relacionado_Item_WBS" === "2.3.103"
    // o donde "Origen_Decisión" === "DT-FIBRA-001"
    
    // Actualizar div #riesgos-2-3-103
    const divRiesgos = document.getElementById('riesgos-2-3-103');
    divRiesgos.innerHTML = `
        <h4>⚠️ Riesgos Asociados: 4 (Actualizado 🔄)</h4>
        [Riesgos recargados desde matriz]
        - R-FIBRA-003
        - R-FIBRA-006
        - R-FIBRA-008
        - R-FIBRA-009 ⭐ NUEVO
    `;
}
```

**PASO 4: Usuario ve cambio**
```
Usuario en WBS Interactiva
    ↓
Ve riesgo R-FIBRA-009 aparecer automáticamente
    ↓
Contador cambia: "3 riesgos" → "4 riesgos" 🔄
    ↓
Riesgo nuevo visible con badge "NUEVO"
```

---

## 🛠️ **IMPLEMENTACIÓN TÉCNICA**

### **Archivo JSON Intermedio (Generado desde Matriz)**

**Crear:** `riesgos_item_2-3-103.json`

```json
{
  "item_wbs": "2.3.103",
  "ultima_actualizacion": "2025-10-07T15:30:00",
  "riesgos": [
    {
      "id": "R-FIBRA-003",
      "descripcion": "Espaciamiento muy corto aumenta CAPEX",
      "probabilidad": "Alta",
      "impacto": "Alto",
      "estrategia": "Analizar 500m-1000m",
      "responsable": "PMO",
      "estado": "Activo",
      "origen_decision": "N/A",
      "hito_verificacion": "N/A"
    },
    {
      "id": "R-FIBRA-006",
      "descripcion": "Reducir cajas puede aumentar tiempo localización fallas",
      "probabilidad": "Baja",
      "impacto": "Medio",
      "estrategia": "Aceptar si > 500m",
      "responsable": "Ing. Fibra",
      "estado": "Activo",
      "origen_decision": "DT-FIBRA-001",
      "hito_verificacion": "H-FIBRA-005"
    },
    {
      "id": "R-FIBRA-008",
      "descripcion": "Acceso a cajas cada 300m dificulta mantenimiento vehicular",
      "probabilidad": "Media",
      "impacto": "Medio",
      "estrategia": "Considerar 500m-1000m",
      "responsable": "Construcción",
      "estado": "Activo",
      "origen_decision": "N/A",
      "hito_verificacion": "N/A"
    }
  ]
}
```

**Generado por script:** `scripts/generar_json_riesgos.ps1`

---

### **Script PowerShell para Sincronización**

**Crear:** `scripts/sincronizar_riesgos_wbs.ps1`

```powershell
# Script para convertir MATRIZ_RIESGOS_PMO_AMPLIADA a JSON
# Se ejecuta cada vez que se actualiza la matriz

$matrizPath = "VIII. Documentos Maestros y Metodologia/Matrices_Dependencias/MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md"
$outputPath = "IX. WBS y Planificacion/riesgos_cache/"

# Leer matriz de riesgos
$contenido = Get-Content $matrizPath -Raw

# Extraer riesgos relacionados con cada ítem WBS
# Parsear tabla Markdown
# Generar JSON por ítem WBS

# Ejemplo output:
# riesgos_item_2-3-103.json
# riesgos_item_3-1-100.json
# etc.

Write-Host "✅ Riesgos sincronizados para WBS Interactiva"
```

---

### **JavaScript en WBS para Cargar Riesgos**

```javascript
// En WBS_Presupuestal_INTERACTIVA_v3.0.html

async function recargarRiesgosDesdeMatriz(itemId) {
    try {
        // Opción 1: Cargar desde JSON generado
        const response = await fetch(`riesgos_cache/riesgos_item_${itemId.replace('.', '-')}.json`);
        const data = await response.json();
        
        // Actualizar div de riesgos
        const divRiesgos = document.getElementById(`riesgos-${itemId}`);
        divRiesgos.innerHTML = `<h4>⚠️ Riesgos Asociados: ${data.riesgos.length} (Actualizado: ${new Date(data.ultima_actualizacion).toLocaleString('es-CO')})</h4>`;
        
        data.riesgos.forEach(riesgo => {
            const div = document.createElement('div');
            div.className = 'riesgo-item';
            div.innerHTML = `
                <div>
                    <strong>${riesgo.id}:</strong> ${riesgo.descripcion}
                    ${riesgo.estado === 'Nuevo' ? '<span class="riesgo-badge riesgo-alto">NUEVO</span>' : ''}
                </div>
                <div>
                    <span class="riesgo-badge riesgo-${riesgo.probabilidad.toLowerCase()}">${riesgo.probabilidad} Prob</span>
                    <span class="riesgo-badge riesgo-${riesgo.impacto.toLowerCase()}">${riesgo.impacto} Impacto</span>
                </div>
            `;
            divRiesgos.appendChild(div);
        });
        
        // Notificar al usuario
        if (data.riesgos.some(r => r.estado === 'Nuevo')) {
            mostrarNotificacion('🔔 Nuevos riesgos agregados desde terminal', 'info');
        }
        
    } catch (error) {
        console.error('Error cargando riesgos:', error);
        
        // Fallback: Mostrar mensaje
        alert('⚠️ No se pudieron cargar riesgos actualizados.\n\nAsegúrate de ejecutar:\nscripts/sincronizar_riesgos_wbs.ps1');
    }
}

// AUTO-REFRESH cada 30 segundos (opcional)
setInterval(() => {
    recargarRiesgosDesdeMatriz('2-3-103');
}, 30000);
```

---

## 🔄 **FLUJO COMPLETO INTEGRADO**

### **Escenario: Especialista propone cambio y PMO agrega riesgo**

```
DÍA 1 - 10:00 AM: ESPECIALISTA PROPONE
├── Usuario abre WBS_Presupuestal_INTERACTIVA_v3.0.html
├── Ve ítem 2.3.103: 2,068 cajas a 300m = $2,791M
├── Ve criterio: "UIT-T 300m estándar"
├── Ve 3 riesgos actuales
└── Click en [Proponer Cambio]

DÍA 1 - 10:05 AM: SISTEMA ANALIZA TODO
├── Usuario escribe: "Sugiero 500m para mejor acceso vehicular"
├── Click en [Generar Análisis]
├── Sistema calcula:
│   ✅ Criterios técnicos (4 criterios analizados)
│   ✅ Impacto otros ítems (2 ítems recalculados)
│   ✅ Riesgos por alternativa (3 alternativas × 2-3 riesgos c/u)
│   ✅ Archivos afectados (5 archivos listados)
│   ✅ Recomendación (Alternativa 2: 8.5/10)
└── Muestra análisis completo en pantalla

DÍA 1 - 10:15 AM: USUARIO ENVÍA APROBACIÓN
├── Usuario revisa análisis completo
├── Click en [Enviar para Aprobación PMO]
└── Sistema genera: DT-FIBRA-001_v1.0.md + AC-FIBRA-001_Análisis_v1.0.md

DÍA 2 - 9:00 AM: PMO REVISA (EN TERMINAL)
├── PMO abre: II/Decisiones_Tecnicas/AC-FIBRA-001_Análisis_v1.0.md
├── Revisa análisis
└── Identifica riesgo adicional no considerado

DÍA 2 - 9:15 AM: PMO AGREGA RIESGO (TERMINAL)
├── PMO edita: VIII/Matrices_Dependencias/MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md
├── Agrega fila:
│   R-FIBRA-009 | Validación OTDR no realizada puede generar fallas posteriores
│   Origen_Decisión: DT-FIBRA-001
│   Hito_Verificación: H-FIBRA-005
├── Guarda archivo
└── Ejecuta: scripts/sincronizar_riesgos_wbs.ps1

DÍA 2 - 9:16 AM: INTERFAZ DETECTA CAMBIO
├── WBS Interactiva ejecuta auto-refresh (30 seg después)
├── Lee: riesgos_cache/riesgos_item_2-3-103.json
├── Detecta nuevo riesgo: R-FIBRA-009
└── Actualiza interfaz: "3 riesgos" → "4 riesgos" 🔄

DÍA 2 - 9:20 AM: ESPECIALISTA VE ACTUALIZACIÓN
├── Especialista refresca página WBS
├── Ve nuevo riesgo R-FIBRA-009 con badge "NUEVO"
├── Lee descripción del riesgo agregado por PMO
└── Decide si ajustar propuesta o mantenerla

DÍA 2 - 10:00 AM: DECISIÓN FINAL
├── PMO aprueba DT-FIBRA-001 → v2.0
├── Sistema ejecuta cambios (Cursor)
└── Actualiza 5 archivos + agrega riesgos a matriz
```

---

## 📁 **ARCHIVOS DEL SISTEMA BIDIRECCIONAL**

### **Interfaz (Front-end):**
```
IX. WBS y Planificacion/
├── WBS_Presupuestal_INTERACTIVA_v3.0.html ⭐ (Interfaz principal)
├── WBS_Presupuestal_AMPLIADA_v3.0.md (Markdown con columnas ampliadas)
└── riesgos_cache/ (JSONs generados)
    ├── riesgos_item_2-3-103.json
    ├── riesgos_item_3-1-100.json
    └── [Más por cada ítem modificable]
```

### **Datos (Backend):**
```
VIII. Documentos Maestros y Metodologia/Matrices_Dependencias/
├── MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md (Fuente de verdad)
├── MATRIZ_DEPENDENCIAS_DOCUMENTALES_v1.0.md (Archivos afectados)
└── [Matrices maestras]
```

### **Scripts (Sincronización):**
```
scripts/ (Nueva carpeta)
├── sincronizar_riesgos_wbs.ps1 (Matriz → JSON)
├── generar_dt_desde_observacion.ps1 (Observación → DT)
└── ejecutar_cambio_aprobado.ps1 (DT aprobada → Archivos)
```

---

## 🎯 **VENTAJAS DEL SISTEMA BIDIRECCIONAL**

### **Para Usuario Final (Especialista):**
- ✅ Ve TODO el análisis integrado (no solo costos)
- ✅ Ve riesgos actualizados en tiempo real
- ✅ Propone cambios con análisis automático
- ✅ Ve impacto completo antes de aprobar

### **Para PMO (Terminal):**
- ✅ Actualiza riesgos desde terminal
- ✅ Cambios se reflejan en interfaz automáticamente
- ✅ Mantiene control desde archivos MD
- ✅ Sin duplicación de trabajo

### **Para Sistema:**
- ✅ Fuente de verdad: Archivos MD en VIII/
- ✅ Interfaz: Lee desde JSONs generados
- ✅ Sincronización: Scripts PowerShell
- ✅ Trazabilidad: 100% completa

---

## 📊 **ESTADO ACTUAL**

| Componente | Estado | Observaciones |
|:-----------|:-------|:--------------|
| **WBS Interactiva HTML** | ✅ Creada | Analiza TODO (criterios, impactos, riesgos, archivos) |
| **Análisis completo** | ✅ Implementado | 6 secciones de análisis automático |
| **Sistema bidireccional** | 🔄 Diseñado | Falta crear scripts PowerShell |
| **JSONs de riesgos** | ⏳ Pendiente | Requiere script de sincronización |
| **Auto-refresh** | ⏳ Pendiente | Implementar lectura desde JSON |

---

## 🚀 **PRÓXIMOS PASOS**

### **Completar sistema bidireccional:**

1. **Crear carpeta scripts/**
   ```bash
   mkdir scripts
   ```

2. **Crear script sincronización:**
   ```
   scripts/sincronizar_riesgos_wbs.ps1
   ```

3. **Crear carpeta caché:**
   ```bash
   mkdir "IX. WBS y Planificacion/riesgos_cache"
   ```

4. **Implementar auto-refresh en HTML:**
   - Función fetch() para leer JSONs
   - Timer para auto-actualizar cada 30 seg

5. **Probar flujo completo:**
   - Especialista propone cambio
   - PMO agrega riesgo desde terminal
   - Interfaz detecta y muestra nuevo riesgo

---

**✅ ANÁLISIS COMPLETO IMPLEMENTADO**
**🔄 SISTEMA BIDIRECCIONAL DISEÑADO**
**⏳ SCRIPTS DE SINCRONIZACIÓN PENDIENTES**

---

**Elaborado por:** Administrador Contractual EPC  
**Fecha:** 7 de Octubre de 2025  
**Estado:** ✅ Interfaz funcional - Sincronización por implementar  
**Metodología:** Punto 42 v5.0  

