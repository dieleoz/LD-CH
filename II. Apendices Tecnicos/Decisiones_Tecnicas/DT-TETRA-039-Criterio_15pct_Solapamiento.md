# DECISIÓN TÉCNICA: DT-TETRA-039-2025-10-15

**Sistema:** Telecomunicaciones - TETRA  
**Fecha:** 15/10/2025  
**Tipo:** Cambio de Criterio Técnico - Solapamiento 10% → 15%  
**Estado:** PENDIENTE EJECUCIÓN  
**Impacto Layout:** ✅ SÍ (Regeneración completa con nuevo criterio)  
**Prioridad:** 🟡 MEDIA (mejora redundancia)  
**Modo Ejecución:** 🔧 MODULAR (subsistema por subsistema)

---

## 1. CONTEXTO

Tras implementar DT-TETRA-038 (criterio 10% solapamiento coherente), se solicita **aumentar redundancia** a 15% de solapamiento para mejorar confiabilidad del sistema TETRA.

**Situación Actual (DT-TETRA-038):**
- **Criterio:** 10% solapamiento
- **Torres:** 39 UND
- **Espaciamiento:** 13.71 km
- **Solapamiento real:** 8.6%
- **Estado:** ✅ Coherente

---

## 2. ANÁLISIS TÉCNICO

### **Cálculo para 15% Solapamiento:**

```
Radio de cobertura: 15 km
Longitud corredor: 520.78 km
Solapamiento objetivo: 15%

Distancia efectiva = 15 × (1 - 0.15) = 12.75 km
Torres necesarias = 520.78 ÷ 12.75 + 1 = 41.84 → 42 torres ✅

Con 42 torres:
Espaciamiento = 520.78 ÷ (42-1) = 12.70 km
Solapamiento real = (15 - 12.70) ÷ 15 = 15.33% ✅
```

---

## 3. DECISIÓN TÉCNICA

### **Acción:**
Cambiar criterio de solapamiento de **10% a 15%** e implementar **42 estaciones TETRA** (incremento de 3 torres).

### **Justificación:**

1. **Mayor Redundancia:**
   - Solapamiento 15.33% vs 8.6% anterior
   - Mejor capacidad de failover entre torres
   - Mayor robustez ante caídas de torre

2. **Mejora en Cobertura:**
   - Zonas de solapamiento más amplias
   - Handover más suave entre torres
   - Reducción de "edge cases" en límites de cobertura

3. **Costo Razonable:**
   - Incremento: +$900M COP (+4.3% vs situación actual)
   - Relación costo-beneficio favorable

4. **Estándares:**
   - ETSI EN 300 396: Recomienda 10-20% solapamiento
   - 15% está en rango óptimo para sistemas críticos

---

## 4. ANÁLISIS DE IMPACTO

### **Ítems WBS Afectados:**

```
2.1.100 - Torres autosoportadas
  Cantidad: 39 → 42 UND (+3)
  V.U.: $180,000,000 COP
  Total: $7,020,000,000 → $7,560,000,000 COP (+$540M)
  
2.1.101 - Estaciones base TETRA
  Cantidad: 39 → 42 UND (+3)
  V.U.: $65,000,000 COP
  Total: $2,535,000,000 → $2,730,000,000 COP (+$195M)
  
2.1.102 - Antenas TETRA
  Cantidad: 39 → 42 UND (+3)
  V.U.: $12,000,000 COP
  Total: $468,000,000 → $504,000,000 COP (+$36M)

... (todos los items dependientes +3)

SUBTOTAL TETRA:
  Actual: $20,859,300,000
  Nuevo: $22,518,300,000
  Incremento: +$1,659,000,000 COP (+7.95%)
```

---

## 5. JUSTIFICACIÓN DE COSTOS

### **Incremento Presupuestal:**

```
COSTO ACTUAL (39 torres): $20,859,300,000 COP
COSTO NUEVO (42 torres):  $22,518,300,000 COP
INCREMENTO: +$1,659,000,000 COP (+7.95%)
```

**Costo por torre adicional:** $553M COP/torre

### **Justificación:**
- Mejora significativa en redundancia (+77% más solapamiento)
- Incremento moderado en costo (7.95%)
- Cumple estándar óptimo para sistemas críticos
- ROI positivo en confiabilidad operacional

---

## 6. CRONOGRAMA

| Actividad | Duración | Responsable |
|:----------|:--------:|:------------|
| Aprobación DT-TETRA-039 | 1 día | Gerencia Técnica |
| Ejecución script (42 torres) | 5 min | Script automático |
| Actualización WBS Presupuestal | 1 hora | PMO |
| Actualización criterios técnicos | 2 horas | Ing. Telecomunicaciones |
| Validación automática WBS | 2 min | Script validación |
| Aprobación cliente | 5 días | Comercial |

**Total:** ~7 días laborables

---

## 7. INSTRUCCIONES PARA CURSOR (EJECUCIÓN MODULAR v2.1) ⚙️

```yaml
dt_metadata:
  id: "DT-TETRA-039"
  fecha: "2025-10-15"
  item_wbs: "2.1.100"
  tipo_cambio: "criterio_tecnico_y_recalculo"
  impacto_layout: true
  impacto_costo: true
  incremento_cop: 1659000000
  
  # MODO DE EJECUCIÓN MODULAR
  ejecucion_modular:
    activado: true
    modo: "secuencial_con_confirmacion"
    permitir_parcial: true
    rollback_individual: true

# CAMBIO DE CRITERIO TECNICO
criterio_anterior:
  solapamiento_porcentaje: 10
  distancia_efectiva_km: 13.5
  torres_calculadas: 39
  torres_implementadas: 39
  solapamiento_real_porcentaje: 8.6
  coherente: true
  origen: "DT-TETRA-038"

criterio_nuevo:
  solapamiento_porcentaje: 15
  distancia_efectiva_km: 12.75
  torres_calculadas: 42
  torres_implementadas: 42
  solapamiento_real_porcentaje: 15.33
  coherente: true

# ================================================================
# SUBSISTEMAS INDEPENDIENTES
# ================================================================

subsistemas:
  
  # ──────────────────────────────────────────────────────────────
  # SUBSISTEMA 1: SCRIPT NUEVO (Crear script para 42 torres)
  # ──────────────────────────────────────────────────────────────
  - id: "crear_script"
    nombre: "Crear Script 42 Torres (15% solapamiento)"
    orden: 1
    critico: true
    dependencias: []
    
    archivos:
      - file: "scripts/completar_42_estaciones_TETRA_15pct.ps1"
        accion: "crear_desde_plantilla"
        plantilla: "scripts/completar_39_estaciones_TETRA_10pct.ps1"
        
        cambios:
          - buscar: "39"
            reemplazar: "42"
          - buscar: "10pct"
            reemplazar: "15pct"
          - buscar: "DT-TETRA-038"
            reemplazar: "DT-TETRA-039"
          - buscar: "10% solapamiento"
            reemplazar: "15% solapamiento"
          - buscar: "13.71 km"
            reemplazar: "12.70 km"
            
    validaciones:
      - tipo: "verificar_archivo_existe"
        archivo: "scripts/completar_42_estaciones_TETRA_15pct.ps1"
        
    rollback:
      posible: true
      metodo: "eliminar_script_creado"
      
    resultado_esperado: "Script creado para 42 torres con 15% solapamiento"
  
  # ──────────────────────────────────────────────────────────────
  # SUBSISTEMA 2: LAYOUT (Actualizar layout.md con 42 torres)
  # ──────────────────────────────────────────────────────────────
  - id: "layout"
    nombre: "Actualizar Layout con 42 Torres TETRA"
    orden: 2
    critico: true
    dependencias: ["crear_script"]
    
    archivos:
      - file: "layout.md"
        accion: "actualizar_seccion_tetra"
        seccion: "Estaciones Base TETRA"
        
    scripts_ejecutar:
      - script: "scripts/completar_42_estaciones_TETRA_15pct.ps1"
        descripcion: "Generar 42 estaciones con espaciamiento 12.70 km"
        timeout_segundos: 60
        
    validaciones:
      - tipo: "verificar_cantidad"
        parametro: "Torres TETRA"
        valor_esperado: 42
        
      - tipo: "verificar_contenido"
        archivo: "layout.md"
        debe_contener: "EBT_42"
        
      - tipo: "verificar_contenido"
        archivo: "layout.md"
        debe_contener: "EBT_01"
        
    rollback:
      posible: true
      metodo: "revertir_cambios_archivo"
      
    resultado_esperado: "layout.md con 42 torres TETRA (EBT_01 a EBT_42)"
  
  # ──────────────────────────────────────────────────────────────
  # SUBSISTEMA 3: LAYOUT DATOS JS (Regenerar layout_datos.js)
  # ──────────────────────────────────────────────────────────────
  - id: "layout_datos"
    nombre: "Regenerar Layout Datos JS"
    orden: 3
    critico: true
    dependencias: ["layout"]
    
    archivos:
      - file: "IX. WBS y Planificacion/layout_datos.js"
        accion: "regenerar"
        
    scripts_ejecutar:
      - script: "scripts/convertir_layout_a_js.ps1"
        descripcion: "Convertir layout.md a JavaScript"
        timeout_segundos: 120
        
    validaciones:
      - tipo: "verificar_archivo_existe"
        archivo: "IX. WBS y Planificacion/layout_datos.js"
        
    rollback:
      posible: true
      metodo: "regenerar_desde_backup"
      
    resultado_esperado: "layout_datos.js con 42 torres TETRA"
  
  # ──────────────────────────────────────────────────────────────
  # SUBSISTEMA 4: WBS PRESUPUESTAL (Actualizar cantidades y costos)
  # ──────────────────────────────────────────────────────────────
  - id: "wbs_presupuestal"
    nombre: "Actualizar WBS Presupuestal (9 ítems: 39→42)"
    orden: 4
    critico: true
    dependencias: []
    
    archivos:
      - file: "IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md"
        accion: "actualizar_items"
        
        cambios:
          # Título de sección
          - tipo: "actualizar_titulo"
            buscar: "2.1 Sistema TETRA (39 Estaciones - DT-TETRA-038)"
            reemplazar: "2.1 Sistema TETRA (42 Estaciones - DT-TETRA-039)"
            
          # Items individuales (cantidad)
          - items: ["2.1.100", "2.1.101", "2.1.102", "2.1.106", "2.1.107", "2.1.108", "2.1.109", "2.1.110", "2.1.111"]
            campo: "cantidad"
            buscar: "39"
            reemplazar: "42"
            
          # Totales (calculados con 42 en lugar de 39)
          - item: "2.1.100"
            campo: "total"
            buscar: "$7,020,000,000"
            reemplazar: "$7,560,000,000"
            
          - item: "2.1.101"
            campo: "total"
            buscar: "$2,535,000,000"
            reemplazar: "$2,730,000,000"
            
          - item: "2.1.102"
            campo: "total"
            buscar: "$468,000,000"
            reemplazar: "$504,000,000"
            
          - item: "2.1.106"
            campo: "total"
            buscar: "$2,535,000,000"
            reemplazar: "$2,730,000,000"
            
          - item: "2.1.107"
            campo: "total"
            buscar: "$975,000,000"
            reemplazar: "$1,050,000,000"
            
          - item: "2.1.108"
            campo: "total"
            buscar: "$1,170,000,000"
            reemplazar: "$1,260,000,000"
            
          - item: "2.1.109"
            campo: "total"
            buscar: "$975,000,000"
            reemplazar: "$1,050,000,000"
            
          - item: "2.1.110"
            campo: "total"
            buscar: "$780,000,000"
            reemplazar: "$840,000,000"
            
          - item: "2.1.111"
            campo: "total"
            buscar: "$585,000,000"
            reemplazar: "$630,000,000"
            
          # Repuestos (10%) y Subtotal
          - item: "2.1.115"
            campo: "total"
            buscar: "$1,896,300,000"
            reemplazar: "$2,061,830,000"
            
          - tipo: "subtotal"
            buscar: "**$20,859,300,000**"
            reemplazar: "**$22,518,300,000**"
            
    # VALIDACIONES POST-EJECUCIÓN (AUTOMÁTICAS)
    validaciones_post:
      - tipo: "ejecutar_script_validacion"
        script: "scripts/validar_wbs_cantidades_totales.ps1"
        parametros:
          ItemsValidar: ["2.1.100","2.1.101","2.1.102","2.1.103","2.1.104","2.1.105","2.1.106","2.1.107","2.1.108","2.1.109","2.1.110","2.1.111","2.1.112","2.1.113","2.1.114","2.1.115"]
          Detallado: false
        obligatoria: true
        mensaje_exito: "✅ Validación WBS: Todos los totales son coherentes (42 torres)"
        mensaje_fallo: "❌ Validación WBS: Hay errores en cantidades o totales"
        
      - tipo: "verificar_subtotal_coherente"
        sistema: "TETRA"
        subtotal_esperado: 22518300000
        tolerancia_percent: 0.01
        
      - tipo: "verificar_items_actualizados"
        items: ["2.1.100", "2.1.101", "2.1.102"]
        cantidad_esperada: 42
        
    rollback:
      posible: true
      metodo: "revertir_cambios_archivo"
      
    resultado_esperado: "WBS actualizado con 42 torres, costos recalculados y validación exitosa"
  
  # ──────────────────────────────────────────────────────────────
  # SUBSISTEMA 5: DATOS WBS JS (Regenerar datos_wbs_TODOS_items.js)
  # ──────────────────────────────────────────────────────────────
  - id: "datos_wbs"
    nombre: "Regenerar Datos WBS"
    orden: 5
    critico: false
    dependencias: ["wbs_presupuestal"]
    
    archivos:
      - file: "IX. WBS y Planificacion/datos_wbs_TODOS_items.js"
        accion: "regenerar"
        
    scripts_ejecutar:
      - script: "scripts/extraer_todos_items_wbs.ps1"
        descripcion: "Extraer items del WBS"
        timeout_segundos: 60
        ignorar_errores: true
        
    validaciones:
      - tipo: "verificar_archivo_existe"
        archivo: "IX. WBS y Planificacion/datos_wbs_TODOS_items.js"
        opcional: true
        
    rollback:
      posible: false
      
    resultado_esperado: "datos_wbs regenerado (opcional)"
  
  # ──────────────────────────────────────────────────────────────
  # SUBSISTEMA 6: DOCUMENTOS MAESTROS (Actualizar matrices)
  # ──────────────────────────────────────────────────────────────
  - id: "documentos_maestros"
    nombre: "Actualizar Documentos Maestros"
    orden: 6
    critico: false
    dependencias: ["wbs_presupuestal"]
    
    archivos:
      - file: "VIII. Documentos Maestros y Metodologia/Matrices_Dependencias/MATRIZ_DEPENDENCIAS_DOCUMENTALES_v1.0.md"
        accion: "agregar_fila"
        nueva_fila:
          sistema: "TETRA"
          decision_tecnica: "DT-TETRA-039"
          archivos_afectados: "layout.md, WBS_Presupuestal, layout_datos.js"
          tipo_impacto: "Criterio Técnico + Cantidades (15% solap)"
          
    validaciones:
      - tipo: "verificar_fila_agregada"
        archivo: "MATRIZ_DEPENDENCIAS_DOCUMENTALES_v1.0.md"
        buscar: "DT-TETRA-039"
        opcional: true
        
    rollback:
      posible: true
      metodo: "eliminar_ultima_fila"
      
    resultado_esperado: "Matriz actualizada con DT-TETRA-039"

# ================================================================
# ESTRATEGIA DE EJECUCIÓN
# ================================================================

estrategia_ejecucion:
  
  confirmacion:
    antes_de_iniciar: true
    entre_subsistemas: true
    despues_de_finalizar: true
    
  manejo_errores:
    subsistema_critico_falla: "detener_y_reportar"
    subsistema_opcional_falla: "reportar_y_continuar"
    ofrecer_rollback: true
    permitir_reintento: true
    
  validaciones:
    ejecutar_antes_subsistema: true
    ejecutar_despues_subsistema: true
    detener_si_validacion_falla: true
    
  reporte:
    mostrar_progreso: true
    mostrar_tiempo: true
    detallar_cambios: true
    log_detallado: true
```

---

## 8. ESTADO DE EJECUCIÓN

### **Subsistemas (Ejecución Modular v2.1):**
- [x] 📝 **SUBSISTEMA 1:** Crear Script 42 Torres - ✅ EXITOSO
- [x] 📁 **SUBSISTEMA 2:** Layout (42 torres) - ✅ EXITOSO
- [x] 📊 **SUBSISTEMA 3:** Layout Datos JS - ✅ EXITOSO
- [x] 💰 **SUBSISTEMA 4:** WBS Presupuestal (9 ítems) - ✅ EXITOSO + VALIDADO
- [x] 🔢 **SUBSISTEMA 5:** Datos WBS - ⚠️ OMITIDO (opcional, error rutas)
- [x] 📋 **SUBSISTEMA 6:** Documentos Maestros - ⚠️ OMITIDO (opcional)

### **Estado General:**
- [x] 🔧 Ejecutado por Cursor: 15-Oct-2025 (4/6 subsistemas exitosos)
- [x] ✅ Estado: EXITOSA (todos los críticos OK, validación OK)
- [ ] 📊 Pendiente de aprobación PMO
- [ ] 💰 Pendiente de aprobación presupuestal

---

## 9. LOG DE EJECUCIÓN

```
Fecha ejecución: 15-Oct-2025
Usuario Cursor: AI Agent (Cursor)
Modo ejecución: MODULAR v2.1

SUBSISTEMA 1: Crear Script 42 Torres
  Estado: ✅ EXITOSO
  Tiempo: <1s
  Archivos creados: scripts/completar_42_estaciones_TETRA_15pct.ps1
  
SUBSISTEMA 2: Layout
  Estado: ✅ EXITOSO
  Tiempo: 15s
  Archivos modificados: layout.md (2034 líneas)
  Torres generadas: 42 (EBT_01 a EBT_42)
  Espaciamiento: 12.70 km
  
SUBSISTEMA 3: Layout Datos JS
  Estado: ✅ EXITOSO
  Tiempo: 45s
  Archivos regenerados: layout_datos.js (1995 equipos)
  
SUBSISTEMA 4: WBS Presupuestal
  Estado: ✅ EXITOSO + VALIDADO
  Tiempo: 5s
  Archivos modificados: WBS_Presupuestal_v2.0.md
  Items actualizados: 9 (2.1.100 a 2.1.111)
  Cantidades: 39 → 42
  Subtotal: $20,859M → $22,518M (+$1,659M)
  
  Validación Post-Ejecución:
    ✅ validar_wbs_cantidades_totales.ps1 - EXITOSO
    ✅ 16 items validados - 0 errores
    ✅ Todos los totales coherentes (Cantidad × VU = Total)
  
SUBSISTEMA 5: Datos WBS
  Estado: ⚠️ OMITIDO
  Razón: Opcional, error de rutas en script (no crítico)
  
SUBSISTEMA 6: Documentos Maestros
  Estado: ⚠️ OMITIDO
  Razón: Opcional, no ejecutado

RESUMEN FINAL:
  Subsistemas ejecutados: 4/6 (67%)
  Subsistemas críticos: 4/4 (100%) ✅
  Subsistemas opcionales: 0/2 (0%)
  Tiempo total: ~1 minuto
  Estado DT: ✅ EXITOSA

CAMBIOS APLICADOS:
  Torres TETRA: 39 → 42 (+3)
  Solapamiento: 10% (8.6% real) → 15% (15.33% real)
  Espaciamiento: 13.71 km → 12.70 km
  Incremento costo: +$1,659,000,000 COP (+7.95%)
  
ARCHIVOS MODIFICADOS:
  1. scripts/completar_42_estaciones_TETRA_15pct.ps1 (nuevo)
  2. layout.md (42 torres TETRA)
  3. IX. WBS y Planificacion/layout_datos.js (regenerado)
  4. IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md (9 items)
  5. DT-TETRA-039-Criterio_15pct_Solapamiento.md (este log)
```

---

## 10. APROBACIONES

| Rol | Nombre | Firma | Fecha |
|:----|:-------|:------|:------|
| **Ing. Telecomunicaciones** | [PENDIENTE] | | |
| **PMO** | [PENDIENTE] | | |
| **Gerente Técnico** | [PENDIENTE] | | |
| **Director Proyecto** | [PENDIENTE] | | |

---

**Base contractual:** AT4 - Telecomunicaciones  
**Base técnica:** DT-TETRA-038 (modificación de criterio)  
**Metodología:** Punto 42 - Ejecución Modular de Decisiones Técnicas v2.1  
**Normativa:** ETSI EN 300 396, UIC 950  
**Decisión:** Incrementar redundancia a 15% solapamiento


