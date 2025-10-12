# DECISIÓN TÉCNICA: DT-TETRA-037-2025-10-11

**Sistema:** Telecomunicaciones - TETRA  
**Fecha:** 11/10/2025  
**Tipo:** Actualización Layout - Completar 37 Estaciones  
**Estado:** PENDIENTE EJECUCIÓN  
**Impacto Layout:** ✅ SÍ (Actualización completa)  

---

## 1. CONTEXTO

El layout actual solo tiene 20-26 estaciones TETRA visibles en el sistema, pero el criterio técnico establecido requiere **37 estaciones TETRA** para garantizar cobertura continua del corredor.

---

## 2. PROBLEMA DETECTADO

### **Layout Actual:**
- ❌ Solo 20-26 estaciones TETRA parseadas correctamente
- ❌ Inconsistencia con criterio técnico
- ❌ Cobertura incompleta del corredor

### **Criterio Técnico (III/27.1_Estimacion_Cantidades_TETRA_v5.0.md):**
- ✅ **37 estaciones TETRA** requeridas
- ✅ Radio de cobertura: 15 km
- ✅ Solapamiento: 20%
- ✅ Distancia efectiva: 12 km
- ✅ Cálculo: 594 km ÷ 12 km ≈ 49.5 → 37 estaciones (ajustado)

---

## 3. ANÁLISIS TÉCNICO

### **Corredor:**
- **PK Inicio:** 201+470 (México)
- **PK Fin:** 722+250 (Chiriguaná)
- **Longitud:** 520.78 km

### **Criterio de Distribución:**
- **Estaciones totales:** 37
- **Espaciamiento:** 520.78 km ÷ 36 intervalos = **14.47 km**
- **Radio cobertura:** 15 km
- **Solapamiento:** 20% mínimo

### **Distribución Calculada:**
```
EBT-01: PK 201+470 (México)
EBT-02: PK 215+936
EBT-03: PK 230+402
...
EBT-37: PK 722+250 (Chiriguaná)
```

---

## 4. DECISIÓN TÉCNICA

### **Acción:**
Actualizar el layout.md y sistemas asociados para reflejar las **37 estaciones TETRA** según el criterio técnico establecido.

### **Impacto:**
- ✅ Layout coherente con ingeniería conceptual
- ✅ Cobertura TETRA garantizada
- ✅ Sistema de filtros mostrará las 37 estaciones
- ✅ Trazabilidad completa

---

## 5. RIESGOS IDENTIFICADOS

| ID | Riesgo | Probabilidad | Impacto | Estrategia |
|:---|:-------|:-------------|:--------|:-----------|
| R-TETRA-037-01 | Parseo automático falla | Baja | Medio | MITIGAR - Validar después de ejecución |
| R-TETRA-037-02 | UFVs mal asignadas | Media | Medio | MITIGAR - Verificar mapeo PK→UFV |

---

## 6. ALTERNATIVAS CONSIDERADAS

| Alternativa | Ventajas | Desventajas | Decisión |
|:------------|:---------|:------------|:---------|
| **Hardcodear 37 estaciones manualmente** | Simple, rápido | No escalable, no dinámico | ❌ Rechazada |
| **Recalcular automáticamente desde criterio** | Dinámico, escalable, correcto | Requiere automatización | ✅ **SELECCIONADA** |
| **Mantener 26 estaciones** | Sin cambios | Incoherente con criterio | ❌ Rechazada |

---

## 7. ANÁLISIS DE IMPACTO

### **Documentos Afectados:**
1. ✅ `layout.md` - Agregar/actualizar sección TETRA
2. ✅ `IX/layout_datos.js` - Regenerar con 37 estaciones
3. ✅ `IX/WBS_Layout_Maestro.html` - Reflejará 37 estaciones
4. ✅ `VIII/LAYOUT_INTEGRAL_COMPLETO_v1.0.json` - Actualizar
5. ✅ `III/27.1_Estimacion_Cantidades_TETRA_v5.0.md` - Referenciar

### **Ítems WBS Afectados:**
- `2.1.100` - Estaciones Base TETRA (cantidad: 26 → 37)
- Ítems dependientes: Antenas, UPS, switches

---

## 8. JUSTIFICACIÓN DE COSTOS

### **Incremento:**
- **Estaciones adicionales:** 37 - 26 = **11 estaciones**
- **Costo por estación:** ~$300M COP
- **Incremento total:** ~$3,300M COP

### **Justificación:**
Necesario para cumplir criterio técnico de cobertura y garantizar redundancia del 20%.

---

## 9. CRONOGRAMA

| Actividad | Duración | Responsable |
|:----------|:--------:|:------------|
| Recálculo automático | 5 min | Script |
| Validación técnica | 1 día | Ing. Telecomunicaciones |
| Actualización WBS | 1 día | PMO |
| Aprobación | 2 días | Gerencia Técnica |

---

## 10. INSTRUCCIONES PARA CURSOR ⚙️

```yaml
dt_metadata:
  id: "DT-TETRA-037"
  fecha: "2025-10-11"
  item_wbs: "2.1.100"
  tipo_cambio: "recalculo_layout"
  impacto_layout: true

# RECALCULO AUTOMATICO DE LAYOUT
layout_recalcular:
  activar: true
  sistema: "Red_TETRA"
  parametro_cambio: "cantidad_estaciones"
  valor_anterior: 26
  valor_nuevo: 37
  
  recalculo_automatico:
    pk_inicio: "201+470"
    pk_fin: "722+250"
    longitud_total_km: 520.78
    cantidad_nueva: 37
    espaciamiento_km: 14.47
    metodo: "distribucion_uniforme"
  
  generar_instalaciones_nuevas: true
  tipo_instalacion: "Estacion_Base_TETRA"
  
  kit_por_instalacion:
    - categoria: "Telecomunicaciones"
      dispositivo: "TETRA BS"
      nomenclatura: "EBT_[NUMERO]"
      
    - categoria: "Energia"
      dispositivo: "UPS 10kVA"
      nomenclatura: "SAI_TETRA_[NUMERO]"
      
    - categoria: "Telecomunicaciones"
      dispositivo: "Switch PoE"
      nomenclatura: "SWA_TETRA_[NUMERO]"
      
    - categoria: "Seguridad_ITS"
      dispositivo: "CCTV Fija"
      nomenclatura: "CCTV_TETRA_[NUMERO]"

archivos_actualizar:
  - file: "layout.md"
    accion: "reemplazar_seccion_tetra"
    seccion: "Estaciones Base TETRA"
    metodo: "usar_archivo_generado"
    archivo_fuente: "VIII. Documentos Maestros y Metodologia/TETRA_37_LINEAS_LAYOUT.txt"
    
  - file: "IX. WBS y Planificacion/layout_datos.js"
    accion: "regenerar"
    script: "scripts/convertir_layout_a_js.ps1"
    
  - file: "VIII. Documentos Maestros y Metodologia/LAYOUT_INTEGRAL_COMPLETO_v1.0.json"
    accion: "regenerar"
    script: "scripts/generar_layout_integral_completo.ps1"
    
  - file: "IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md"
    seccion: "Item 2.1.100"
    cambios:
      - campo: "cantidad"
        buscar: "26"
        reemplazar: "37"
      - campo: "total_cop"
        recalcular: true
        formula: "cantidad * valor_unitario"

scripts_ejecutar:
  - script: "convertir_layout_a_js.ps1"
    orden: "despues_de_actualizar_layout"
    parametros: ""
    
  - script: "generar_layout_integral_completo.ps1"
    orden: "despues_de_convertir_js"
    parametros: ""

validaciones:
  - verificar_37_estaciones: true
  - validar_espaciamiento: true
  - verificar_cobertura: true

manejo_errores:
  - archivo_no_existe: "crear_backup_y_continuar"
  - validacion_falla: "reportar_y_solicitar_confirmacion"
```

---

## 11. ESTADO DE EJECUCIÓN

- [ ] 🔧 Pendiente de ejecución por Cursor

---

## 12. LOG DE EJECUCIÓN

```
[Pendiente de ejecución]

Fecha ejecución: 
Usuario Cursor: 
Archivos modificados: 
Estaciones TETRA: 26 → 37 (+11)
Scripts ejecutados: 2 (convertir_layout_a_js.ps1, generar_layout_integral_completo.ps1)
Errores encontrados: 
Tiempo ejecución: 
```

---

**ESTE DOCUMENTO ESTÁ LISTO PARA SER EJECUTADO POR CURSOR**

Para ejecutar:
1. Abre este archivo en Cursor
2. Cursor detectará el YAML automáticamente
3. Cursor preguntará: "¿Ejecutar DT-TETRA-037?"
4. Responde "Sí"
5. El sistema recalculará automáticamente todo

---

**Base contractual:** AT4 - Telecomunicaciones  
**Base técnica:** III/27.1_Estimacion_Cantidades_TETRA_v5.0.md  
**Metodología:** Punto 42 - Recálculo Automático  


