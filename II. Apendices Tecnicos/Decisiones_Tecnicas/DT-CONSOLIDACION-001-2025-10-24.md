# DECISIÓN TÉCNICA: DT-CONSOLIDACION-001-2025-10-24
**Problema:** Duplicación ATP embarcado entre CAP 1.2 y CAP 6.1  
**Tipo de cambio:** Consolidación estructural  
**Fecha:** 2025-10-24  
**Especialista:** Marta Karina (LFC) + Diego Eleoz  

---

## 1. DESCRIPCIÓN DEL PROBLEMA

### **Duplicación detectada:**

El **ATP embarcado** está documentado en DOS lugares de la WBS:

1. **CAPÍTULO 1.2** (Control y Señalización):
   - Componentes funcionales/ingeniería
   - Items 1.2.100 a 1.2.106 (Computadora, Display, Sensores, GPS, Software, Interfaces, Redundancia)
   - **Subtotal: $3,520,000,000 COP**

2. **CAPÍTULO 6.1** (Material Rodante):
   - Kit completo embarcado
   - Items 6.1.100 a 6.1.106 (Sistema ATP, TETRA, GSM-R, GPS, Redundancia, Instalación, Repuestos)
   - **Subtotal: $6,468,000,000 COP**

### **Causa raíz:**
- **Paquete 1.2:** "ATP embarcado" desde perspectiva de ingeniería/funcional (Control)
- **Paquete 6.1:** "Kit abordo" desde perspectiva constructiva (Material Rodante)
- **Son el MISMO sistema**, nombrado distinto según contexto

---

## 2. ANÁLISIS TÉCNICO

### **Confirmación contractual:**

Según conversación LFC:
- **"El kit abordo es el mismo ATP embarcado"** (Marta Karina)
- **"Para mi debe ir todo en un solo item, material rodante"** (Marta Karina)
- **"No coordino ya"** - Confusión generada por duplicación

### **Estructura actual vs propuesta:**

```
ACTUAL (DUPLICADO):
├── CAP 1: Control y Señalización ($131,887M)
│   ├── 1.1 CTC Virtual ($89,542M)
│   ├── 1.2 ATP Embarcado ($3,520M) ← FASE INGENIERÍA
│   ├── 1.3 ENCE ($4,700M)
│   ├── 1.4 Desvíos Motorizados ($16,261M)
│   └── 1.5 Desvíos Manuales ($17,865M)
│
└── CAP 6: Material Rodante ($12,647M)
    ├── 6.1 ATP Embarcado ($6,468M) ← FASE EJECUCIÓN
    └── 6.2 EOT ($520M)

PROPUESTA (CONSOLIDADO):
├── CAP 1: Control y Señalización ($128,367M)
│   ├── 1.1 CTC Virtual ($89,542M)
│   ├── 1.2 ELIMINADO ← TODO consolidado en 6.1
│   ├── 1.3 ENCE ($4,700M)
│   ├── 1.4 Desvíos Motorizados ($16,261M)
│   └── 1.5 Desvíos Manuales ($17,865M)
│
└── CAP 6: Material Rodante ($12,647M)
    ├── 6.1 Kit ATP Embarcado ($6,468M) ← ÚNICA FUENTE
    │   └── Incluye: diseño, ingeniería, integración, suministro, instalación
    └── 6.2 EOT ($520M)
```

---

## 3. JUSTIFICACIÓN DE LA CONSOLIDACIÓN

### **Por qué eliminar CAP 1.2:**
1. **Es el MISMO sistema** (ATP embarcado = kit abordo)
2. **CAP 6.1 ya es COMPLETO** ($6,468M vs $3,520M del CAP 1.2)
3. **Sin pérdida funcional:** CAP 6.1 incluye:
   - Sistema ATP embarcado ($3,200M) ← INCLUYE todos los componentes de 1.2.100-106
   - Radios TETRA/GSM-R embarcados ($960M)
   - GPS ($280M)
   - Redundancia ($640M)
   - Instalación y configuración ($800M)
   - Repuestos ($588M)

### **Trazabilidad preservada:**
- CAP 6.1 es el **kit completo integrado** para instalación a bordo
- Incluye todo lo que CAP 1.2 tenía (componentes funcionales)
- **NO se pierde información**, solo se consolida en un solo lugar

---

## 4. IMPACTO PRESUPUESTAL

### **Cambios en CAPÍTULO 1:**
- **Total actual:** $131,887,640,432 COP
- **Eliminado:** $3,520,000,000 COP (CAP 1.2)
- **Nuevo total:** $128,367,640,432 COP
- **Variación:** -$3,520,000,000 COP (-2.7%)

### **Cambios en CAPÍTULO 6:**
- **Sin cambios:** $12,647,500,000 COP
- **CAP 6.1 ya incluye todo** (no hay que agregar nada)

### **IMPACTO NETO PRESUPUESTAL:**
- **Total eliminado:** -$3,520,000,000 COP
- **Total previsto:** $287,833,000,000 COP
- **Nuevo total:** $284,313,000,000 COP
- **Ajuste AIU/IVA:** Aplicar a presupuesto base ($284,313M)
- **Total final:** $303,989,000,000 COP (antes: $307,533,000,000)

---

## 5. ÍTEMS AFECTADOS - COMPARACIÓN DETALLADA

### **Tabla de Mapeo CAP 1.2 → CAP 6.1:**

| Item CAP 1.2 | Descripción | Cantidad | VU (COP) | Total (COP) | ¿Está en CAP 6.1? | Item CAP 6.1 | Acción |
|:-------------|:------------|:--------:|:---------:|:-----------:|:-----------------|:-------------|:-------|
| 1.2.100 | Computadora ATP embarcada | 8 | $120M | **$960M** | ❓ ¿Incluido en 6.1.100? | 6.1.100 | **VERIFICAR** |
| 1.2.101 | Display maquinista | 8 | $80M | **$640M** | ❓ ¿Incluido en 6.1.100? | 6.1.100 | **VERIFICAR** |
| 1.2.102 | Sensores velocidad | 8 | $25M | **$200M** | ❓ ¿Incluido en 6.1.100? | 6.1.100 | **VERIFICAR** |
| 1.2.103 | Sistema GPS | 8 | $35M | **$280M** | ✅ **SÍ (EXACTO)** | **6.1.103** ($280M) | ELIMINAR 1.2.103 |
| 1.2.104 | Software ATP | 8 | $100M | **$800M** | ❓ ¿Incluido en 6.1.100? | 6.1.100 | **VERIFICAR** |
| 1.2.105 | Interfaces frenos | 8 | $30M | **$240M** | ❓ ¿Incluido en 6.1.100? | 6.1.100 | **VERIFICAR** |
| 1.2.106 | Sistema redundancia | 8 | $50M | **$400M** | ⚠️ **DIFERENTE** | 6.1.104 ($640M) | **CAUTION** |

### **Análisis de cobertura:**

#### **✅ CONFIRMADO - Duplicación exacta:**
- **1.2.103 (GPS) = 6.1.103 (GPS):** $280M idéntico → **SE PUEDE ELIMINAR 1.2.103**

#### **⚠️ VERIFICAR - Componentes en kit 6.1.100:**
- **6.1.100: Sistemas ATP embarcados ($3,200M)** 
  - ¿Incluye Computadora ATP (1.2.100 = $960M)?
  - ¿Incluye Display (1.2.101 = $640M)?
  - ¿Incluye Sensores (1.2.102 = $200M)?
  - ¿Incluye Software (1.2.104 = $800M)?
  - ¿Incluye Interfaces frenos (1.2.105 = $240M)?
  - **Subtotal verificar:** $960M + $640M + $200M + $800M + $240M = **$2,840M**
  - **6.1.100 tiene:** $3,200M
  - **Diferencia:** $360M → ¿Son componentes adicionales o overhead?

#### **❌ DIFERENTE - Redundancia:**
- **1.2.106:** Sistema redundancia ($400M, 8 UND × $50M)
- **6.1.104:** Sistemas redundancia ($640M, 8 UND × $80M)
- **Diferencia:** $240M ($30M/UND más caro en 6.1)
- **Acción:** Si se elimina 1.2.106, se pierden $240M que NO están en 6.1.104

### **CONCLUSIÓN TRAS ANÁLISIS DOCUMENTAL:**

**Según documentación técnica:**
- **6.1.100 "Sistemas ATP embarcados" ($3,200M)** = Kit completo ATP por locomotora
- **Incluye:** Computadora ATP + Display + Sensores + Software + Interfaces frenos
- **6.1.101-102:** Radios TETRA/GSM-R (componentes ADICIONALES de comunicación)
- **6.1.103:** GPS ($280M) ← **DUPLICADO** con 1.2.103
- **6.1.104:** Redundancia ($640M) vs 1.2.106 ($400M) ← **DIFERENTE VALOR**

**DECISIÓN:**
- ✅ **SÍ se puede eliminar todo CAP 1.2** si 6.1.100 ($3,200M) ya incluye computadora+display+sensores+software+interfaces
- ⚠️ **PERO:** 6.1.103 GPS está duplicado con 1.2.103 → eliminar 1.2.103 es SEGURO
- ⚠️ **PERO:** 6.1.104 ($640M) ≠ 1.2.106 ($400M) → Si se elimina 1.2.106, se pierden $240M de presupuesto

**RECOMENDACIÓN FINAL:**
- NO eliminar todo CAP 1.2 sin verificar si 6.1.100 incluye todos los componentes
- Esperar confirmación técnica: ¿6.1.100 ($3,200M) = kit completo que incluye computadora+display+sensores+software+interfaces?
- Si SÍ → Eliminar CAP 1.2 completo
- Si NO → Eliminar solo duplicados exactos (GPS 1.2.103) y mantener el resto

---

## 6. ARCHIVOS AFECTADOS

1. ✅ `IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md`
   - Eliminar sección completa 1.2 (líneas 186-196)
   - Actualizar TOTAL CAPÍTULO 1

2. ✅ `IX. WBS y Planificacion/datos_wbs_TODOS_items.json`
   - Eliminar items 1.2.100 a 1.2.106

3. ✅ `IX. WBS y Planificacion/wbs_metadata_enriquecida.json`
   - Eliminar metadata de 1.2.100 (o mantener como referencia histórica)

4. ✅ `VIII. Documentos Maestros y Metodologia/CRITERIOS_TECNICOS_MAESTRO_v1.0.md`
   - Agregar nota: "ATP embarcado consolidado en CAP 6 (Material Rodante)"

5. ✅ `VIII. Documentos Maestros y Metodologia/Matrices_Dependencias/MATRIZ_DEPENDENCIAS_DOCUMENTALES_v1.0.md`
   - Registrar esta consolidación

---

## 10. INSTRUCCIONES PARA CURSOR ⚙️

```yaml
dt_metadata:
  dt_id: "DT-CONSOLIDACION-001-2025-10-24"
  fecha: "2025-10-24"
  tipo_cambio: "consolidacion_estructural"
  sistema: "ATP EMBARCADO"
  problema: "Duplicación ATP entre CAP 1.2 y CAP 6.1"
  solucion: "Eliminar CAP 1.2, mantener solo CAP 6.1"

archivos_actualizar:
  # 1. ELIMINAR SECCIÓN 1.2 EN WBS_PRESUPUESTAL
  - file: "IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md"
    accion: "eliminar_seccion_y_recalcular"
    seccion: "1.2 Sistema ATP Embarcado"
    eliminar_lineas: "186-196"  # TODO el bloque 1.2.100 a 1.2.106
    actualizar_totales:
      capitulo: "1"
      total_actual: "$131,887,640,432"
      eliminar: "$3,520,000,000"
      total_nuevo: "$128,367,640,432"
    versionamiento:
      version_actual: "v2.0"
      version_nueva: "v2.1"
      razon: "DT-CONSOLIDACION-001 - Eliminación CAP 1.2 duplicado"
      agregar_nota: "## 📋 CAMBIO v2.1 - CONSOLIDACIÓN ATP\n\n**DT-CONSOLIDACION-001-2025-10-24:** Eliminación sección 1.2 duplicada (ATP embarcado). Todo consolidado en CAP 6.1 (Material Rodante).\n\n- CAP 1: $131,887M → $128,367M (-$3,520M)\n- CAP 6: Sin cambios ($12,647M)\n- Total WBS: $307,533M → $284,313M (-$23,220M base, considerando AIU/IVA ajustados)"

  # 2. ELIMINAR ÍTEMS EN DATOS_WBS
  - file: "IX. WBS y Planificacion/datos_wbs_TODOS_items.json"
    accion: "eliminar_items"
    items_eliminar:
      - "1.2.100"
      - "1.2.101"
      - "1.2.102"
      - "1.2.103"
      - "1.2.104"
      - "1.2.105"
      - "1.2.106"
    nota: "Items duplicados - consolidados en 6.1"

  # 3. ELIMINAR METADATA DE 1.2
  - file: "IX. WBS y Planificacion/wbs_metadata_enriquecida.json"
    accion: "eliminar_metadata"
    item_codigo: "1.2.100"
    nota: "ATP embarcado consolidado en CAP 6.1, metadata movida a 6.1.100"

  # 4. ACTUALIZAR MATRIZ DEPENDENCIAS
  - file: "VIII. Documentos Maestros y Metodologia/Matrices_Dependencias/MATRIZ_DEPENDENCIAS_DOCUMENTALES_v1.0.md"
    accion: "agregar_fila"
    nueva_fila:
      sistema: "ATP Consolidación"
      decision_tecnica: "DT-CONSOLIDACION-001"
      archivos_afectados: "WBS_Presupuestal, datos_wbs_TODOS, metadata"
      tipo_impacto: "Estructural - eliminación duplicación"

items_dependientes:
  recalcular: true
  items:
    - "capitulo_1_total"  # Recalcular total CAP 1
    - "presupuesto_total"  # Recalcular total general

validaciones:
  - verificar_archivos_existen: true
  - confirmar_que_6_1_tiene_todo: true  # Verificar que CAP 6.1 ya incluye todo
  - validar_totales_coinciden: true
  - confirmar_con_usuario: true

manejo_errores:
  - archivo_no_existe: "reportar_y_detener"
  - seccion_no_encontrada: "reportar_y_detener"
  - totales_no_coinciden: "detener_y_reportar"
```

---

## 11. ESTADO DE EJECUCIÓN

- [ ] 📝 Revisado por PMO: 2025-10-24
- [ ] ⚠️ **VERIFICACIÓN REQUERIDA:** Pendiente confirmación técnica de Marta
- [ ] ❌ **NO ejecutar:** Hasta confirmar que 6.1.100 incluye todos los componentes de 1.2
- [ ] 📊 Validado: Pendiente

---

## 12. LOG DE EJECUCIÓN

```
⚠️ EJECUCIÓN EN PAUSA - VERIFICACIÓN TÉCNICA REQUERIDA

Problema identificado:
- No está 100% claro si 6.1.100 ($3,200M) incluye TODOS los componentes de 1.2 ($3,520M)
- Redundancia tiene valores diferentes ($400M vs $640M)
- Riesgo de perder $240M de presupuesto si se elimina 1.2.106 sin ajuste

Acción requerida:
- Consultar con Marta Karina: ¿6.1.100 "Sistemas ATP embarcados" incluye computadora + display + sensores + software + interfaces?
- Si SÍ → Proseguir con eliminación total CAP 1.2
- Si NO → Eliminar solo duplicado exacto (GPS 1.2.103) y mantener el resto

Estado: En espera de confirmación técnica
```

---

**Origen:** Conversación LFC - Problema duplicación ATP embarcado  
**Aprobación requerida:** Marta Karina (LFC) + PMO  
**Justificación:** Eliminar confusión, consolidar en un solo lugar (CAP 6 Material Rodante)

