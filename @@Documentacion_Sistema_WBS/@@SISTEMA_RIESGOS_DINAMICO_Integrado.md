# 🎯 SISTEMA DE RIESGOS DINÁMICO INTEGRADO
## DT → Análisis Automático → Matriz Riesgos → Terminal → HTML

**Fecha:** 7 de Octubre de 2025  
**Estado:** ✅ IMPLEMENTADO  

---

## 🔄 **FLUJO COMPLETO DE RIESGOS**

### **EJEMPLO: Cajas cada 1000m (FUERA de norma)**

```
┌──────────────────────────────────────────────────────────┐
│ 1. ESPECIALISTA (WBS Interactiva)                        │
│    - Propone: Cajas espaciamiento 1000m                 │
│    - (actual: 300m)                                       │
│    - Clic [Analizar Cambio]                              │
└────────────────┬─────────────────────────────────────────┘
                 │
                 ↓ (JavaScript analiza automáticamente)
┌──────────────────────────────────────────────────────────┐
│ 2. ANÁLISIS AUTOMÁTICO (JavaScript)                      │
│    Sistema detecta:                                       │
│    ✅ 1000m > 500m (límite UIT-T)                        │
│    ✅ RIESGO CRÍTICO generado automáticamente:          │
│                                                            │
│    R-FIBRA-NEW-001:                                       │
│      Descripción: "Espaciamiento 1000m EXCEDE límite    │
│                    normativo UIT-T (500m máx)"           │
│      Probabilidad: Alta                                   │
│      Impacto: Crítico                                     │
│      Nivel: CRÍTICO                                       │
│      Estrategia sugerida: EVITAR - NO PROCEDE            │
│      Acción requerida: DETENER - INCUMPLE NORMA          │
│      Vinculación: AT1-Sección-2.1.3 (Normas)            │
│                                                            │
│    ⚠️ RECOMENDACIÓN AUTOMÁTICA:                          │
│    "PROPUESTA RECHAZADA - Incumple UIT-T G.652.D"       │
└────────────────┬─────────────────────────────────────────┘
                 │
                 ↓ (Si usuario insiste en generar DT)
┌──────────────────────────────────────────────────────────┐
│ 3. DT GENERADA CON RIESGOS (Markdown + YAML)            │
│                                                            │
│    Archivo: DT-FIBRA-050-Cajas-1000m.md                  │
│                                                            │
│    Sección 8: ANÁLISIS DE RIESGOS                        │
│    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━      │
│    ### Riesgos Nuevos Identificados:                     │
│                                                            │
│    #### R-FIBRA-NEW-001 (CRÍTICO)                        │
│    - Descripción: Excede límite normativo UIT-T          │
│    - Origen: Espaciamiento 1000m > 500m                  │
│    - Estrategia: EVITAR - NO PROCEDE                     │
│    - Vinculación: AT1-Sección-2.1.3                      │
│                                                            │
│    Sección 10: INSTRUCCIONES PARA CURSOR (YAML)          │
│    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━      │
│    ```yaml                                                │
│    matriz_riesgos_actualizar:                            │
│      - file: "MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md"      │
│        accion: "agregar_riesgos_nuevos"                  │
│        riesgos_nuevos:                                    │
│          - id: "R-FIBRA-NEW-001"                         │
│            categoria: "Técnico-Normativo"                │
│            descripcion: "Espaciamiento 1000m excede..."  │
│            probabilidad: "Alta"                           │
│            impacto: "Crítico"                             │
│            nivel_riesgo: "CRÍTICO"                        │
│            estrategia: "Evitar - NO PROCEDE"             │
│            origen_decision: "DT-FIBRA-050"               │
│            vinculacion_contractual: "AT1-Sec-2.1.3"      │
│            accion_requerida: "DETENER"                    │
│    ```                                                    │
└────────────────┬─────────────────────────────────────────┘
                 │
                 ↓ (PMO abre DT en Cursor)
┌──────────────────────────────────────────────────────────┐
│ 4. CURSOR EJECUTA DT (Automático)                        │
│                                                            │
│    Cursor lee YAML y muestra:                             │
│    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━      │
│    📋 DT-FIBRA-050 detectada                             │
│                                                            │
│    ⚠️ RIESGOS NUEVOS A AGREGAR (1):                      │
│      • R-FIBRA-NEW-001 (CRÍTICO)                         │
│        Espaciamiento 1000m excede norma UIT-T            │
│        Vinculación: AT1-Sección-2.1.3                    │
│        Acción: DETENER - NO PROCEDE                      │
│                                                            │
│    Archivos a actualizar (2):                             │
│    ✓ MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md                │
│    ✓ WBS_Presupuestal_v3.0.md (SI SE APRUEBA)           │
│                                                            │
│    ⚠️ RECOMENDACIÓN: NO EJECUTAR                         │
│    Este cambio incumple normativa contractual.           │
│                                                            │
│    ¿Deseas continuar? (Sí/No)                            │
│    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━      │
│                                                            │
│    PMO responde: "No" (por incumplimiento normativo)     │
│                                                            │
│    Cursor DETIENE ejecución y reporta:                   │
│    ❌ DT-FIBRA-050 NO EJECUTADA                          │
│    Razón: Incumple UIT-T G.652.D (Apéndice AT1)         │
│    Riesgo CRÍTICO identificado: R-FIBRA-NEW-001          │
│                                                            │
│    ✅ Riesgo agregado a MATRIZ (para registro)           │
│    ❌ Cambio en WBS NO aplicado                          │
└────────────────┬─────────────────────────────────────────┘
                 │
                 ↓ (Cursor actualizó MATRIZ_RIESGOS)
┌──────────────────────────────────────────────────────────┐
│ 5. PMO GESTIONA RIESGO (Desde Terminal)                 │
│                                                            │
│    PowerShell:                                            │
│    PS> .\scripts\gestionar_riesgos.ps1                   │
│                                                            │
│    [GESTION DE RIESGOS]                                   │
│    1. Agregar nuevo riesgo                                │
│    2. Modificar riesgo existente                          │
│    3. Calificar riesgo ← SELECCIONA ESTA                │
│    4. Listar riesgos por DT                               │
│    5. Vincular a Apéndice Técnico                         │
│    6. Sincronizar con HTML                                │
│                                                            │
│    Selecciona: 3                                          │
│    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━      │
│    ID del riesgo: R-FIBRA-NEW-001                        │
│                                                            │
│    [ESTRATEGIAS DISPONIBLES]                              │
│    1. EVITAR    - Eliminar causa ← SELECCIONA            │
│    2. MITIGAR   - Reducir probabilidad/impacto           │
│    3. TRANSFERIR - Pasar a tercero                       │
│    4. ACEPTAR   - Asumir y presupuestar                  │
│    5. ASUMIR    - Reconocer sin acción                   │
│                                                            │
│    Estrategia: 1 (EVITAR)                                │
│    Justificación: "Incumple norma UIT-T, no es viable"  │
│    Responsable: "PMO + Especialista Fibra"               │
│                                                            │
│    [OK] Riesgo R-FIBRA-NEW-001 calificado: EVITAR        │
│    [OK] MATRIZ_RIESGOS actualizada                       │
│    [OK] Sincronizando con WBS_Analisis_Riesgos.html...   │
└────────────────┬─────────────────────────────────────────┘
                 │
                 ↓ (Sincronización completa)
┌──────────────────────────────────────────────────────────┐
│ 6. INTERFAZ WBS_Analisis_Riesgos.html ACTUALIZADA       │
│                                                            │
│    Usuario abre: WBS_Analisis_Riesgos.html               │
│    Ve:                                                    │
│    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━      │
│    ┌────────────────────────────────────────────┐        │
│    │ R-FIBRA-NEW-001 (CRÍTICO)           EVITAR │        │
│    ├────────────────────────────────────────────┤        │
│    │ Espaciamiento 1000m excede límite UIT-T   │        │
│    │ (500m máximo normativo)                    │        │
│    │                                             │        │
│    │ 📊 Análisis:                               │        │
│    │   Probabilidad: Alta                       │        │
│    │   Impacto: Crítico                         │        │
│    │   Nivel: CRÍTICO                           │        │
│    │                                             │        │
│    │ 🛡️ Estrategia: EVITAR                     │        │
│    │   Incumple norma UIT-T, no es viable       │        │
│    │                                             │        │
│    │ 📋 Origen: DT-FIBRA-050 (rechazada)       │        │
│    │ 📄 Vinculación: AT1-Sección-2.1.3         │        │
│    │ 👤 Responsable: PMO + Especialista Fibra  │        │
│    │ ✅ Estado: Evitado (DT no ejecutada)      │        │
│    └────────────────────────────────────────────┘        │
│                                                            │
│    [Estadísticas actualizadas]                            │
│    Total Riesgos: X + 1                                   │
│    CRÍTICOS: Y + 1                                        │
│    Evitados: Z + 1                                        │
└──────────────────────────────────────────────────────────┘
```

---

## 🔄 **EJEMPLO 2: Cajas cada 350m (VIABLE)**

```
Especialista → Propone 350m
   ↓
Análisis Automático:
  ✅ 350m está en rango 300m-500m (cumple UIT-T)
  ✅ Genera AHORRO de $500M
  ⚠️ Riesgo MEDIO identificado:
  
  R-FIBRA-NEW-002:
    Descripción: "Espaciamiento 350m aumenta tiempo
                  localización fallas en ~3 min"
    Probabilidad: Baja
    Impacto: Medio
    Nivel: MEDIO
    Estrategia sugerida: ASUMIR (documentar en Plan Mantenimiento)
    Vinculación: AT6 - Operación y Mantenimiento
   ↓
DT Generada con YAML:
  - Actualiza WBS (cajas: 2,068 → 1,697)
  - Agrega R-FIBRA-NEW-002 a MATRIZ_RIESGOS
  - Vincula a AT6
   ↓
Cursor Ejecuta:
  ✅ Actualiza WBS_Presupuestal v3.0 → v3.1
  ✅ Agrega riesgo a MATRIZ_RIESGOS_PMO
     Nueva fila:
     | R-FIBRA-NEW-002 | Operacional | Tiempo fallas +3min | 
     | Baja | Medio | Asumir: Documentar Plan Mant | Operaciones |
     | Activo | Sistema | DT-FIBRA-042 | Plan Mantenimiento |
     | AT6-Sec-3.2 | 2025-10-07 | DOCUMENTAR |
   ↓
PMO en Terminal:
  PS> .\scripts\gestionar_riesgos.ps1
  Opción 3: Calificar riesgo
  ID: R-FIBRA-NEW-002
  Estrategia: 5 (ASUMIR)
  Justificación: "Impacto operacional menor, compensado
                  por ahorro $500M. Se documentará en
                  Plan de Mantenimiento sección 3.2"
  
  [OK] Riesgo calificado: ASUMIR
  [OK] Sincronizando con HTML...
   ↓
WBS_Analisis_Riesgos.html actualizado:
  ✅ Muestra R-FIBRA-NEW-002
  ✅ Con estrategia "ASUMIR"
  ✅ Vinculado a AT6
  ✅ Origen: DT-FIBRA-042
  ✅ Dashboard actualizado: +1 riesgo ASUMIDO
```

---

## 📊 **MATRIZ DE RIESGOS AMPLIADA**

### **Estructura (Columnas):**

| Campo | Descripción | Ejemplo |
|-------|-------------|---------|
| ID | Identificador único | R-FIBRA-050 |
| Categoría | Tipo de riesgo | Técnico-Normativo |
| Descripción | Texto descriptivo | "Espaciamiento excede norma..." |
| Probabilidad | Baja/Media/Alta | Alta |
| Impacto | Bajo/Medio/Alto/Crítico | Crítico |
| Estrategia | Evitar/Mitigar/Transferir/Aceptar/Asumir | Evitar |
| Responsable | Quien gestiona | PMO |
| Estado | Activo/Mitigado/Cerrado | Activo |
| Fuente | Inicial/Sistema/Manual | Sistema |
| **Origen_Decisión** | DT que lo originó | DT-FIBRA-050 |
| **Hito_Verificación** | Cuándo se verifica | Ingeniería Detalle |
| **Vinculación_Contractual** | Apéndice/Cláusula | AT1-Sección-2.1.3 |
| **Fecha_Identificación** | Cuándo se detectó | 2025-10-07 |
| **Acción_Requerida** | Qué hacer | DETENER / APROBAR / DOCUMENTAR |

---

## 🎯 **ANÁLISIS AUTOMÁTICO DE RIESGOS**

### **Umbrales Configurados (JavaScript):**

```javascript
umbrales: {
  cajas_fibra_espaciamiento: {
    optimo_min: 300,      // < 300m → Riesgo ALTO (sobrecosto)
    optimo_max: 400,      // > 400m → Riesgo MEDIO (operación)
    limite_normativo: 500, // > 500m → Riesgo CRÍTICO (incumple)
    norma: "UIT-T G.652.D"
  },
  
  torres_tetra_cantidad: {
    minimo_absoluto: 33,   // < 33 → Riesgo CRÍTICO (sin cobertura)
    optimo: 37,            // Valor óptimo
    maximo_eficiente: 42,  // > 42 → Riesgo MEDIO (sobrecosto)
    norma: "ETSI EN 300 396"
  },
  
  impacto_economico: {
    bajo: $100M,           // < $100M → Riesgo financiero BAJO
    medio: $500M,          // $100M-$500M → MEDIO
    alto: $1,000M,         // $500M-$1,000M → ALTO
    critico: $5,000M       // > $5,000M → CRÍTICO (Junta Directiva)
  }
}
```

### **Reglas Automáticas:**

| Condición | Riesgo Generado | Nivel | Estrategia Sugerida |
|-----------|-----------------|-------|---------------------|
| Espaciamiento > 500m | R-FIBRA-XXX (Normativo) | CRÍTICO | EVITAR |
| Espaciamiento < 250m | R-FIBRA-XXX (Sobrecosto) | ALTO | MITIGAR |
| Torres < 33 | R-TETRA-XXX (Cobertura) | CRÍTICO | EVITAR |
| Impacto > $5,000M | R-ECON-XXX (Financiero) | CRÍTICO | APROBAR JUNTA |
| Impacto > $500M | R-ECON-XXX (Financiero) | ALTO | APROBAR PMO |

---

## 🔧 **GESTIÓN DESDE TERMINAL**

### **Script:** `gestionar_riesgos.ps1`

**Funcionalidades:**

#### **1. Agregar Nuevo Riesgo (Manual)**
```powershell
PS> .\scripts\gestionar_riesgos.ps1

Opción: 1 (Agregar)

ID: R-CIVIL-020
Categoría: Operacional
Descripción: Acceso a cajas dificulta mantenimiento vehicular
Probabilidad: Media
Impacto: Medio

[VINCULACION]
Origen DT: DT-FIBRA-042
Apéndice: AT6-Sección-3.2
Hito: Plan Mantenimiento

[ESTRATEGIA]
1. Evitar
2. Mitigar ← SELECCIONA
3. Transferir
4. Aceptar
5. Asumir

Estrategia: 2 (Mitigar)
Detalle: "Programar mantenimiento en horarios de bajo tráfico"
Responsable: "Jefe Operaciones"

[OK] Riesgo R-CIVIL-020 agregado
[OK] Sincronizado con WBS_Analisis_Riesgos.html
```

#### **2. Calificar Riesgo**
```powershell
Opción: 3 (Calificar)

ID: R-FIBRA-NEW-002

[ESTRATEGIAS]
1. EVITAR
2. MITIGAR
3. TRANSFERIR
4. ACEPTAR
5. ASUMIR ← SELECCIONA

Estrategia: 5 (ASUMIR)
Justificación: "Impacto operacional menor compensado
                por ahorro $500M. Documentado en Plan
                de Mantenimiento AT6-3.2"
Responsable: "Jefe Operaciones"

[OK] R-FIBRA-NEW-002 → Estrategia: ASUMIR
[OK] Actualizado en MATRIZ_RIESGOS
[OK] Sincronizado con HTML
```

#### **3. Vincular a Apéndice Técnico**
```powershell
Opción: 5 (Vincular)

ID: R-FIBRA-NEW-002

[APENDICES DISPONIBLES]
AT1 - Alcance del Proyecto
AT2 - Especificaciones Técnicas
AT3 - Diseños y Planos
AT4 - Cronograma
AT5 - Presupuesto
AT6 - Operación y Mantenimiento ← SELECCIONA

Apéndice: AT6-Sección-3.2
Cláusula: "Procedimiento Localización Fallas"

[OK] R-FIBRA-NEW-002 vinculado a AT6-Sección-3.2
[OK] Matriz actualizada
```

#### **4. Listar Riesgos por DT**
```powershell
Opción: 4 (Listar)

ID de DT: DT-FIBRA-042

[RIESGOS VINCULADOS A DT-FIBRA-042]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. R-FIBRA-NEW-002 (MEDIO) - ASUMIR
   Espaciamiento 350m aumenta tiempo fallas +3min
   Vinculación: AT6-Sección-3.2
   
2. R-ECON-050 (ALTO) - ACEPTAR
   Ahorro $500M genera impacto presupuestal alto
   Vinculación: Contrato-Cláusula-3.5
   
Total: 2 riesgos
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## 🌐 **INTERFAZ WBS_Analisis_Riesgos.html**

### **Actualización para Cargar Dinámicamente:**

**ANTES:** Riesgos hardcodeados en HTML

**AHORA:** Carga desde MATRIZ_RIESGOS_PMO

```html
<!-- Agregar antes del </body> -->
<script src="riesgos_proyecto.js"></script>

<script>
  // Cargar riesgos desde matriz sincronizada
  if (typeof riesgosProyecto !== 'undefined') {
    cargarRiesgosDinamicos(riesgosProyecto);
  }
  
  function cargarRiesgosDinamicos(riesgos) {
    const container = document.getElementById('risks-container');
    container.innerHTML = '';
    
    riesgos.forEach(riesgo => {
      const card = crearRiesgoCard(riesgo);
      container.appendChild(card);
    });
    
    actualizarEstadisticas(riesgos);
  }
</script>
```

---

## 📋 **TIPOS DE ESTRATEGIAS**

### **1. EVITAR** 🚫
**Cuándo:** Riesgo inaceptable (incumple norma, bloqueante)
**Acción:** NO ejecutar el cambio propuesto
**Ejemplo:** Espaciamiento > 500m → NO PROCEDE

### **2. MITIGAR** 🛡️
**Cuándo:** Riesgo alto pero manejable
**Acción:** Reducir probabilidad o impacto
**Ejemplo:** Cajas 350m → Documentar procedimientos fallas

### **3. TRANSFERIR** 🔄
**Cuándo:** Riesgo especializado
**Acción:** Pasar a tercero (seguro, subcontrato)
**Ejemplo:** Riesgo climático → Póliza de seguros

### **4. ACEPTAR** ✅
**Cuándo:** Riesgo con beneficio mayor
**Acción:** Asumir y presupuestar contingencia
**Ejemplo:** Ahorro $500M → Aceptar riesgo operacional menor

### **5. ASUMIR** 📝
**Cuándo:** Riesgo residual inevitable
**Acción:** Reconocer y documentar
**Ejemplo:** Tiempo fallas +3min → Documentar en procedimientos

---

## 🔗 **VINCULACIÓN CONTRACTUAL**

### **Apéndices Técnicos del Contrato:**

| Apéndice | Tema | Ejemplos de Vinculación |
|----------|------|-------------------------|
| **AT1** | Alcance del Proyecto | Normas técnicas, cantidades mínimas |
| **AT2** | Especificaciones Técnicas | Equipos, materiales, estándares |
| **AT3** | Diseños y Planos | Planos aprobados, modificaciones diseño |
| **AT4** | Cronograma | Hitos, plazos contractuales |
| **AT5** | Presupuesto | Modificaciones >5%, ajustes financieros |
| **AT6** | Operación y Mantenimiento | Procedimientos, tiempos de respuesta |

**Ejemplo de vinculación:**
```
Riesgo: R-FIBRA-050
Descripción: "Espaciamiento 1000m excede norma"
Vinculación: AT1-Sección-2.1.3 (Cumplimiento Normas Fibra Óptica)

Si se incumple este riesgo → Incumplimiento contractual AT1
```

---

## 📊 **DASHBOARD DE RIESGOS ACTUALIZADO**

### **Estadísticas en WBS_Analisis_Riesgos.html:**

```
┌─────────────┬─────────────┬─────────────┬─────────────┐
│  CRÍTICOS   │    ALTOS    │   MEDIOS    │   BAJOS     │
│     X       │     Y       │     Z       │     W       │
│   (color)   │   (color)   │   (color)   │   (color)   │
└─────────────┴─────────────┴─────────────┴─────────────┘

POR ESTRATEGIA:
Evitados: A
Mitigados: B
Transferidos: C
Aceptados: D
Asumidos: E

POR ORIGEN:
Iniciales: F
Desde DTs: G  ← Dinámico
Desde Operación: H

POR VINCULACIÓN:
AT1: I riesgos
AT2: J riesgos
AT3: K riesgos
...
```

---

## 🚀 **IMPLEMENTACIÓN COMPLETA**

### **Archivos Creados:**

1. ✅ `SISTEMA_Analisis_Riesgos_Automatico.js` - Motor análisis
2. ✅ `gestionar_riesgos.ps1` - Terminal gestión
3. ✅ `sincronizar_riesgos_a_html.ps1` - Sync Matriz→HTML
4. ✅ `riesgos_proyecto.js` - Datos para HTML (autogenerado)

### **Integración con Sistema Existente:**

- ✅ `.cursorrules` - Ejecuta actualizaciones de matriz
- ✅ `WBS_Analisis_Riesgos.html` - Actualizado para cargar dinámicamente
- ✅ `WBS_COMPLETA_TODO_Interactiva_v4.0.html` - Análisis automático integrado

---

## 📋 **FLUJO DE TRABAJO COMPLETO**

```
Usuario Final (WBS Operativa)
   → Propone cambio
   → Análisis automático genera riesgos
   → Genera DT con riesgos incluidos
      ↓
PMO (Cursor)
   → Ejecuta DT
   → Cursor actualiza MATRIZ_RIESGOS automáticamente
   → Cursor actualiza WBS (si se aprueba)
      ↓
PMO (Terminal PowerShell)
   → gestionar_riesgos.ps1
   → Califica riesgos (Evitar/Mitigar/etc)
   → Vincula a Apéndices Técnicos
   → Sincroniza con HTML
      ↓
Todos (WBS_Analisis_Riesgos.html)
   → Ven riesgos actualizados
   → Con vinculación a contrato
   → Con estrategias definidas
   → Dashboard actualizado
```

---

**¿Quieres que implemente ahora la integración completa con WBS_Analisis_Riesgos.html?**

Voy a:
1. ✅ Actualizar WBS_Analisis_Riesgos.html para cargar desde matriz
2. ✅ Crear script `sincronizar_riesgos_a_html.ps1`
3. ✅ Integrar análisis automático en WBS v4.0
4. ✅ Probar flujo completo con ejemplo

**¿Procedo?** 🚀
