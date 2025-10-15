# DECISIÓN TÉCNICA: DT-[SISTEMA]-[NUMERO]-[FECHA]

**Sistema:** [NOMBRE DEL SISTEMA]  
**Fecha:** [DD/MM/YYYY]  
**Tipo:** [Cambio de Criterio / Corrección Técnica / Ajuste de Cantidades]  
**Estado:** PENDIENTE EJECUCIÓN  
**Impacto Layout:** ✅ SÍ / ❌ NO  
**Prioridad:** 🔴 ALTA / 🟡 MEDIA / 🟢 BAJA  
**Modo Ejecución:** 🔧 MODULAR (subsistema por subsistema)

---

## 1. CONTEXTO

[Descripción del problema o situación que genera esta DT]

**Hallazgo:**
- [Punto 1]
- [Punto 2]
- [Punto 3]

---

## 2. PROBLEMA DETECTADO

### **Situación Actual:**
[Descripción técnica del estado actual]

### **Inconsistencia / Problema:**
[Explicar qué está mal o qué necesita cambiarse]

---

## 3. ANÁLISIS TÉCNICO

### **Datos del Sistema:**
```
[Parámetros técnicos relevantes]
```

### **Cálculos / Simulaciones:**
[Mostrar cálculos que respaldan la decisión]

---

## 4. DECISIÓN TÉCNICA

### **Acción:**
[Descripción clara de qué se va a hacer]

### **Justificación:**
1. **[Razón 1]:** [Explicación]
2. **[Razón 2]:** [Explicación]
3. **[Razón 3]:** [Explicación]

---

## 5. ANÁLISIS DE IMPACTO

### **Documentos Afectados:**

| # | Documento | Sección | Cambio | Subsistema |
|:--|:----------|:--------|:-------|:-----------|
| 1 | [archivo1] | [sección] | [cambio] | layout |
| 2 | [archivo2] | [sección] | [cambio] | wbs |
| 3 | [archivo3] | [sección] | [cambio] | maestros |

### **Ítems WBS Afectados:**
```
[codigo] - [descripción]
  Cantidad: [antes] → [después]
  V.U.: [valor]
  Total: [antes] → [después]
```

---

## 6. JUSTIFICACIÓN DE COSTOS

### **Incremento Presupuestal:**
```
COSTO ACTUAL: $[valor]
COSTO NUEVO: $[valor]
INCREMENTO: +$[valor] COP (+[%]%)
```

### **Justificación:**
[Explicar por qué vale la pena el incremento]

---

## 7. CRONOGRAMA

| Actividad | Duración | Responsable |
|:----------|:--------:|:------------|
| Aprobación DT | [tiempo] | [rol] |
| Ejecución subsistema 1 | [tiempo] | Cursor |
| Ejecución subsistema 2 | [tiempo] | Cursor |
| Validación técnica | [tiempo] | [rol] |
| Aprobación cliente | [tiempo] | [rol] |

---

## 8. INSTRUCCIONES PARA CURSOR (EJECUCIÓN MODULAR) ⚙️

```yaml
dt_metadata:
  id: "DT-[SISTEMA]-[NUMERO]"
  fecha: "YYYY-MM-DD"
  item_wbs: "[codigo]"
  tipo_cambio: "[tipo]"
  impacto_layout: [true/false]
  impacto_costo: [true/false]
  incremento_cop: [valor]
  
  # MODO DE EJECUCIÓN MODULAR
  ejecucion_modular:
    activado: true
    modo: "secuencial_con_confirmacion"  # Usuario confirma cada subsistema
    permitir_parcial: true  # Puede ejecutar solo algunos subsistemas
    rollback_individual: true  # Puede revertir subsistemas individualmente

# ================================================================
# SUBSISTEMAS INDEPENDIENTES (se ejecutan UNO A LA VEZ)
# ================================================================

subsistemas:
  
  # ──────────────────────────────────────────────────────────────
  # SUBSISTEMA 1: LAYOUT (Actualizar layout.md)
  # ──────────────────────────────────────────────────────────────
  - id: "layout"
    nombre: "Actualizar Layout"
    orden: 1
    critico: true  # Si falla, detener todo
    dependencias: []  # No depende de otros subsistemas
    
    archivos:
      - file: "layout.md"
        accion: "actualizar_seccion"
        seccion: "[nombre de la sección]"
        
    scripts_ejecutar:
      - script: "[nombre_script].ps1"
        descripcion: "[qué hace]"
        timeout_segundos: 60
        
    validaciones:
      - tipo: "verificar_cantidad"
        parametro: "[qué verificar]"
        valor_esperado: "[valor]"
        
      - tipo: "verificar_archivo_existe"
        archivo: "layout.md"
        
    rollback:
      posible: true
      metodo: "revertir_cambios_archivo"
      
    resultado_esperado: "[Descripción de qué debe quedar]"
  
  # ──────────────────────────────────────────────────────────────
  # SUBSISTEMA 2: LAYOUT DATOS JS (Regenerar layout_datos.js)
  # ──────────────────────────────────────────────────────────────
  - id: "layout_datos"
    nombre: "Regenerar Layout Datos JS"
    orden: 2
    critico: true
    dependencias: ["layout"]  # Solo ejecutar si layout OK
    
    archivos:
      - file: "IX. WBS y Planificacion/layout_datos.js"
        accion: "regenerar"
        
    scripts_ejecutar:
      - script: "scripts/convertir_layout_a_js.ps1"
        descripcion: "Convertir layout.md a JavaScript"
        timeout_segundos: 120
        
    validaciones:
      - tipo: "verificar_contenido"
        archivo: "IX. WBS y Planificacion/layout_datos.js"
        debe_contener: "[identificador esperado]"
        
    rollback:
      posible: true
      metodo: "regenerar_desde_backup"
      
    resultado_esperado: "layout_datos.js con [N] elementos"
  
  # ──────────────────────────────────────────────────────────────
  # SUBSISTEMA 3: WBS PRESUPUESTAL (Actualizar cantidades y costos)
  # ──────────────────────────────────────────────────────────────
  - id: "wbs_presupuestal"
    nombre: "Actualizar WBS Presupuestal"
    orden: 3
    critico: true
    dependencias: []  # Independiente del layout
    
    archivos:
      - file: "IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md"
        accion: "actualizar_items"
        
        cambios:
          - items: ["[codigo1]", "[codigo2]", "[codigo3]"]
            campo: "cantidad"
            buscar: "[valor_anterior]"
            reemplazar: "[valor_nuevo]"
            
          - items: ["[codigo1]"]
            campo: "total_cop"
            buscar: "[total_anterior]"
            reemplazar: "[total_nuevo]"
            
          - seccion: "SUBTOTAL [SISTEMA]"
            campo: "total"
            buscar: "[subtotal_anterior]"
            reemplazar: "[subtotal_nuevo]"
            
    validaciones:
      - tipo: "verificar_subtotal_coherente"
        sistema: "[nombre sistema]"
        subtotal_esperado: "[valor]"
        
      - tipo: "verificar_items_actualizados"
        items: ["[codigo1]", "[codigo2]"]
        cantidad_esperada: "[valor]"
        
    rollback:
      posible: true
      metodo: "revertir_cambios_archivo"
      
    resultado_esperado: "WBS actualizado con [N] items modificados"
  
  # ──────────────────────────────────────────────────────────────
  # SUBSISTEMA 4: DATOS WBS JS (Regenerar datos_wbs_TODOS_items.js)
  # ──────────────────────────────────────────────────────────────
  - id: "datos_wbs"
    nombre: "Regenerar Datos WBS"
    orden: 4
    critico: false  # OPCIONAL - Puede fallar sin detener
    dependencias: ["wbs_presupuestal"]
    
    archivos:
      - file: "IX. WBS y Planificacion/datos_wbs_TODOS_items.js"
        accion: "regenerar"
        
    scripts_ejecutar:
      - script: "scripts/extraer_todos_items_wbs.ps1"
        descripcion: "Extraer items del WBS"
        timeout_segundos: 60
        ignorar_errores: true  # Continuar aunque falle
        
    validaciones:
      - tipo: "verificar_archivo_existe"
        archivo: "IX. WBS y Planificacion/datos_wbs_TODOS_items.js"
        opcional: true
        
    rollback:
      posible: false  # No crítico
      
    resultado_esperado: "datos_wbs regenerado (opcional)"
  
  # ──────────────────────────────────────────────────────────────
  # SUBSISTEMA 5: DOCUMENTOS MAESTROS (Matrices y trazabilidad)
  # ──────────────────────────────────────────────────────────────
  - id: "documentos_maestros"
    nombre: "Actualizar Documentos Maestros"
    orden: 5
    critico: false  # OPCIONAL
    dependencias: ["wbs_presupuestal"]
    
    archivos:
      - file: "VIII. Documentos Maestros y Metodologia/Matrices_Dependencias/MATRIZ_DEPENDENCIAS_DOCUMENTALES_v1.0.md"
        accion: "agregar_fila"
        nueva_fila:
          sistema: "[nombre]"
          decision_tecnica: "DT-[ID]"
          archivos_afectados: "[lista]"
          tipo_impacto: "[tipo]"
          
    validaciones:
      - tipo: "verificar_fila_agregada"
        archivo: "MATRIZ_DEPENDENCIAS_DOCUMENTALES_v1.0.md"
        buscar: "DT-[ID]"
        opcional: true
        
    rollback:
      posible: true
      metodo: "eliminar_ultima_fila"
      
    resultado_esperado: "Matriz actualizada con nueva fila"

# ================================================================
# ESTRATEGIA DE EJECUCIÓN
# ================================================================

estrategia_ejecucion:
  
  # Modo de confirmación
  confirmacion:
    antes_de_iniciar: true  # Confirmar antes de empezar
    entre_subsistemas: true  # Confirmar cada subsistema ← CLAVE
    despues_de_finalizar: true  # Mostrar resumen final
    
  # Manejo de errores
  manejo_errores:
    subsistema_critico_falla: "detener_y_reportar"
    subsistema_opcional_falla: "reportar_y_continuar"
    ofrecer_rollback: true
    permitir_reintento: true
    
  # Validaciones
  validaciones:
    ejecutar_antes_subsistema: true
    ejecutar_despues_subsistema: true
    detener_si_validacion_falla: true  # Solo para críticos
    
  # Reporte
  reporte:
    mostrar_progreso: true  # "Subsistema 2/5..."
    mostrar_tiempo: true
    detallar_cambios: true
    log_detallado: true

# ================================================================
# FLUJO DE USUARIO
# ================================================================

flujo_usuario:
  
  paso_1_deteccion:
    mensaje: "📋 DT-[ID] detectada (5 subsistemas). ¿Ejecutar?"
    opciones:
      - "Sí, subsistema por subsistema (recomendado)"
      - "Sí, todo automático"
      - "Solo simular (dry-run)"
      - "Cancelar"
      
  paso_2_confirmacion_subsistema:
    mensaje: |
      ┌─────────────────────────────────────────┐
      │ SUBSISTEMA [N]/[TOTAL]: [NOMBRE]       │
      │ Archivos: [lista]                      │
      │ Scripts: [lista]                       │
      │ Crítico: [SÍ/NO]                       │
      │                                         │
      │ ¿Ejecutar este subsistema? [S/n/i]     │
      │   S = Sí, ejecutar                     │
      │   n = No, saltar                       │
      │   i = Información adicional            │
      └─────────────────────────────────────────┘
    opciones: ["S", "n", "i"]
    
  paso_3_resultado_subsistema:
    exito:
      mensaje: "✅ SUBSISTEMA [N] COMPLETADO"
      mostrar_cambios: true
      preguntar_continuar: true
      
    fallo:
      mensaje: "❌ SUBSISTEMA [N] FALLÓ"
      mostrar_error: true
      ofrecer_rollback: true
      ofrecer_reintento: true
      opciones:
        - "Reintentar subsistema"
        - "Revertir cambios"
        - "Continuar sin este subsistema"
        - "Cancelar todo"
        
  paso_4_resumen_final:
    mensaje: |
      ═══════════════════════════════════════════
        DT-[ID] EJECUTADA
      ═══════════════════════════════════════════
      
      Subsistemas ejecutados: [N]/[TOTAL]
        ✅ [nombre1]
        ✅ [nombre2]
        ⚠️  [nombre3] (opcional, falló)
        ✅ [nombre4]
        
      Archivos modificados: [N]
      Tiempo total: [tiempo]
      Estado: [EXITOSA / PARCIAL / FALLIDA]
```

---

## 9. ESTADO DE EJECUCIÓN

### **Subsistemas:**
- [ ] 📁 SUBSISTEMA 1: Layout
- [ ] 📊 SUBSISTEMA 2: Layout Datos JS
- [ ] 💰 SUBSISTEMA 3: WBS Presupuestal
- [ ] 🔢 SUBSISTEMA 4: Datos WBS (opcional)
- [ ] 📋 SUBSISTEMA 5: Documentos Maestros (opcional)

### **Aprobaciones:**
- [ ] 📊 Pendiente de aprobación PMO
- [ ] 💰 Pendiente de aprobación presupuestal

---

## 10. LOG DE EJECUCIÓN

```
[Pendiente de ejecución]

SUBSISTEMA 1: Layout
  Estado: [PENDIENTE/OK/FALLO]
  Tiempo: [segundos]
  Archivos: [lista]
  Errores: [ninguno/lista]
  
SUBSISTEMA 2: Layout Datos JS
  Estado: [PENDIENTE/OK/FALLO]
  Tiempo: [segundos]
  Archivos: [lista]
  Errores: [ninguno/lista]
  
SUBSISTEMA 3: WBS Presupuestal
  Estado: [PENDIENTE/OK/FALLO]
  Tiempo: [segundos]
  Archivos: [lista]
  Errores: [ninguno/lista]
  
SUBSISTEMA 4: Datos WBS
  Estado: [PENDIENTE/OK/FALLO/OMITIDO]
  Tiempo: [segundos]
  Archivos: [lista]
  Errores: [ninguno/lista]
  
SUBSISTEMA 5: Documentos Maestros
  Estado: [PENDIENTE/OK/FALLO/OMITIDO]
  Tiempo: [segundos]
  Archivos: [lista]
  Errores: [ninguno/lista]

RESUMEN FINAL:
  Subsistemas ejecutados: [N]/[TOTAL]
  Subsistemas exitosos: [N]
  Subsistemas fallidos: [N]
  Subsistemas omitidos: [N]
  Tiempo total: [tiempo]
  Estado DT: [EXITOSA/PARCIAL/FALLIDA]
```

---

## 11. APROBACIONES

| Rol | Nombre | Firma | Fecha |
|:----|:-------|:------|:------|
| **Ing. [Especialidad]** | [PENDIENTE] | | |
| **PMO** | [PENDIENTE] | | |
| **Gerente Técnico** | [PENDIENTE] | | |
| **Director Proyecto** | [PENDIENTE] | | |

---

**Base contractual:** [Referencia]  
**Base técnica:** [Referencia]  
**Metodología:** Punto 42 - Ejecución Modular de Decisiones Técnicas  
**Normativa:** [Referencias]


