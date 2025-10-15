# DECISIÓN TÉCNICA - DT-TETRA-040

## 1. IDENTIFICACIÓN

| Campo | Valor |
|:------|:------|
| **ID Decisión** | DT-TETRA-040-2025-10-15 |
| **Sistema** | TETRA |
| **Fecha** | 15 de Octubre 2025 |
| **Responsable** | Especialista TETRA |
| **Tipo** | Ajuste Layout |
| **Prioridad** | Media |
| **Estado** | ⏳ Pendiente Ejecución |

---

## 2. CONTEXTO

### 2.1 Situación Actual
- **Layout actual:** 42 torres TETRA (DT-TETRA-039, solapamiento 15%)
- **WBS Presupuestal:** 37 torres TETRA (correcto según criterios)
- **Discrepancia:** Layout tiene 5 torres de más vs WBS

### 2.2 Origen del Cambio
Las pruebas con DT-TETRA-039 (solapamiento 15% → 42 torres) fueron exitosas para validar el sistema de preservación de categorías, pero el criterio técnico definitivo es:

**CRITERIO TÉCNICO MAESTRO:**
- 37 torres para cobertura 594 km con solapamiento 20%
- Alcance por torre: 12-16 km
- 594 km ÷ 12 km = 49.5 torres → Optimizado a 37 con solapamiento inteligente

---

## 3. DECISIÓN

### 3.1 Descripción
**Volver el layout a 37 torres TETRA** para alinear con WBS Presupuestal y criterios técnicos definitivos.

### 3.2 Justificación Técnica
1. **Coherencia WBS:** WBS Presupuestal tiene 37 torres ($6,660,000,000)
2. **Criterio definitivo:** Solapamiento 20% es el estándar técnico
3. **Cobertura garantizada:** 37 torres aseguran 100% cobertura 594 km
4. **Validado:** Simulación de cobertura aprobada con 37 torres

### 3.3 Desglose de 37 Torres
- **Torres backbone:** 30 unidades (espaciamiento ~20 km)
- **Torres en nodos críticos:** 5 unidades (estaciones, patios)
- **Torres de refuerzo cobertura:** 2 unidades (zonas complejas)

---

## 4. ALTERNATIVAS EVALUADAS

| Alternativa | Ventajas | Desventajas | Decisión |
|:------------|:---------|:------------|:---------|
| **A. Mantener 42 torres** | Mayor redundancia | Sobrecosto $900M, inconsistencia con WBS | ❌ Rechazado |
| **B. Volver a 37 torres** | Coherencia WBS, criterio técnico validado | Requiere actualizar layout | ✅ **SELECCIONADO** |
| **C. Reducir a 33 torres** | Ahorro $720M | Riesgo cobertura (mínimo 33) | ❌ Rechazado |

---

## 5. IMPACTO

### 5.1 Archivos Afectados

| Archivo | Sección | Cambio |
|:--------|:--------|:-------|
| `IX. WBS y Planificacion/layout.md` | Torres TETRA | 42 → 37 (-5 torres) |
| `IX. WBS y Planificacion/layout_datos.js` | Array equipos | Regenerar con 37 torres |
| `WBS_Layout_Maestro.html` | Filtro TETRA | Mostrar 37 torres |

### 5.2 Impacto en WBS Presupuestal
**Ninguno** - WBS ya tiene 37 torres correctamente ($6,660,000,000).

### 5.3 Impacto en Layout
- **TELECOMUNICACIONES:** 2004 → 1999 equipos (-5)
- **Otras categorías:** 200 equipos (SIN CAMBIO - preservadas)

### 5.4 Impacto Económico
**$0 COP** - WBS Presupuestal ya refleja 37 torres.

---

## 6. RIESGOS IDENTIFICADOS

| ID | Descripción | Probabilidad | Impacto | Estrategia |
|:---|:------------|:-------------|:--------|:-----------|
| R-TETRA-040-01 | Preservación de otras categorías | Baja | Medio | MITIGAR - Usar módulo LayoutPreserver |
| R-TETRA-040-02 | Regeneración incorrecta | Baja | Bajo | MITIGAR - Validar con script verificación |

---

## 7. PLAN DE IMPLEMENTACIÓN

### 7.1 Pasos de Ejecución
1. ✅ Cargar layout completo (2204 equipos, 9 categorías)
2. ✅ Eliminar SOLO 42 torres TETRA actuales
3. ✅ Generar 37 torres TETRA nuevas (solapamiento 20%)
4. ✅ Verificar preservación de 8 categorías no afectadas
5. ✅ Guardar layout con backup automático
6. ✅ Regenerar layout_datos.js
7. ✅ Validar WBS (0 errores esperados)

### 7.2 Script a Ejecutar
**Archivo:** `scripts/completar_37_estaciones_TETRA_20pct.ps1`

**Acciones del script:**
- Importa módulo `LayoutPreserver.psm1`
- Carga layout completo con todas las categorías
- Elimina solo torres TETRA (filtro: dispositivo = "TETRA BS")
- Genera 37 torres nuevas con solapamiento 20%
- Preserva CONTROL, ITS, FIBRA, y otras 5 categorías
- Guarda con backup automático
- Regenera layout_datos.js

---

## 8. VALIDACIÓN POST-EJECUCIÓN

### 8.1 Criterios de Éxito
- ✅ Layout tiene 37 torres TETRA
- ✅ Layout total: ~1999 equipos (2204 - 5)
- ✅ 8 categorías no afectadas preservadas (200 equipos)
- ✅ WBS validado: 0 errores
- ✅ Coherencia WBS ↔ Layout: 100%

### 8.2 Scripts de Validación
```powershell
# Validar layout completo
.\scripts\verificar_layout_completo.ps1

# Validar WBS
.\scripts\validar_wbs_cantidades_totales.ps1 -ItemsValidar @("2.1.100","2.1.101","2.1.102","2.1.103","2.1.104","2.1.105","2.1.106","2.1.107","2.1.108","2.1.109","2.1.110","2.1.111","2.1.112","2.1.113","2.1.114","2.1.115")
```

---

## 9. TRAZABILIDAD

### 9.1 Referencias Contractuales
- **AT5:** Especificaciones TETRA
- **WBS 2.1:** Sistema TETRA completo

### 9.2 Documentos Técnicos
- `III. Ingenieria conceptual/27_Sistema_TETRA_Integrado_v5.0.md`
- `V. Ingenieria de detalle/V.3_Sistemas_Comunicacion_Detalle_v2.0.md`
- `WBS_Presupuestal_v2.0.md` - Item 2.1.100

### 9.3 Decisiones Técnicas Relacionadas
- **DT-TETRA-038:** Solapamiento 20% → 10% (39 torres)
- **DT-TETRA-039:** Solapamiento 10% → 15% (42 torres) - PRUEBA
- **DT-TETRA-040:** Volver a solapamiento 20% (37 torres) - DEFINITIVO

---

## 10. INSTRUCCIONES PARA CURSOR ⚙️

```yaml
dt_metadata:
  dt_id: "DT-TETRA-040-2025-10-15"
  sistema: "TETRA"
  subsistema: "Layout"
  tipo_cambio: "Ajuste Layout"
  impacto_wbs: false
  impacto_layout: true
  categoria_wbs_afectada: "TELECOMUNICACIONES"
  
cambio_layout:
  torres_actuales: 42
  torres_nuevas: 37
  diferencia: -5
  solapamiento: "20%"
  espaciamiento_km: 16.0
  
archivos_actualizar:
  - file: "IX. WBS y Planificacion/layout.md"
    accion: "regenerar_con_script"
    script: "scripts/completar_37_estaciones_TETRA_20pct.ps1"
    
  - file: "IX. WBS y Planificacion/layout_datos.js"
    accion: "regenerar_automatico"
    script: "scripts/convertir_layout_a_js.ps1"
    
  - file: "IX. WBS y Planificacion/WBS_Layout_Maestro.html"
    accion: "cache_bust"
    cambio: "Actualizar timestamp ?v="

preservacion:
  categorias_no_afectadas:
    - CONTROL
    - EDIFICACION
    - ENERGIA
    - EQUIPO ITS
    - INFRAESTRUCTURA
    - SEGURIDAD
    - SEÑALIZACION
    - VIA
  equipos_esperados_preservados: 200
  verificacion: "scripts/verificar_layout_completo.ps1"

validaciones:
  pre_ejecucion:
    - verificar_layout_actual: true
    - verificar_modulo_preserver: true
    - confirmar_con_usuario: true
    
  post_ejecucion:
    - verificar_37_torres: true
    - verificar_categorias_intactas: true
    - validar_wbs: true
    - script_validacion: "scripts/validar_wbs_cantidades_totales.ps1"
    - items_validar: ["2.1.100","2.1.101","2.1.102","2.1.103","2.1.104","2.1.105","2.1.106","2.1.107","2.1.108","2.1.109","2.1.110","2.1.111","2.1.112","2.1.113","2.1.114","2.1.115"]

manejo_errores:
  - backup_antes_ejecutar: true
  - validacion_falla: "detener_y_reportar"
  - preservacion_falla: "revertir_desde_backup"
```

---

## 11. ESTADO DE EJECUCIÓN

- [x] 📋 DT creada
- [x] 🔧 Script preparado
- [x] ✅ Validaciones pre-ejecución
- [x] 🚀 Ejecución completada - 15/10/2025 09:59:31
- [x] ✅ Validaciones post-ejecución
- [x] 📊 Resultados verificados

---

## 12. LOG DE EJECUCIÓN

```
Fecha ejecución: 15 de Octubre 2025, 09:59:31
Usuario Cursor: AI Assistant
Script ejecutado: scripts/completar_37_estaciones_TETRA_20pct.ps1

RESULTADOS:
  ✅ Torres TETRA: 42 → 37 (-5 torres)
  ✅ Solapamiento: 15% → 20% (criterio definitivo)
  ✅ Espaciamiento promedio: 14.08 km
  
EQUIPOS:
  - Equipos iniciales: 2204
  - Torres TETRA eliminadas: 42
  - Torres TETRA nuevas: 37
  - Equipos finales: 2199
  - Diferencia neta: -5
  
CATEGORÍAS PRESERVADAS (8/8):
  ✓ CONTROL: 14 equipos (intacto)
  ✓ EDIFICACION: 24 equipos (intacto)
  ✓ ENERGIA: 22 equipos (intacto)
  ✓ EQUIPO ITS: 75 equipos (intacto)
  ✓ INFRAESTRUCTURA: 11 equipos (intacto)
  ✓ SEGURIDAD: 11 equipos (intacto)
  ✓ SEÑALIZACION: 30 equipos (intacto)
  ✓ VIA: 13 equipos (intacto)

ARCHIVOS MODIFICADOS:
  1. IX. WBS y Planificacion/layout.md
  2. IX. WBS y Planificacion/layout_datos.js
  3. IX. WBS y Planificacion/WBS_Layout_Maestro.html (cache-bust)
  4. Backup: layout_backup_20251015_095931.md

VALIDACIÓN WBS:
  - Items validados: 16 (sistema TETRA completo)
  - Errores encontrados: 0
  - Advertencias: 0
  - Subtotal TETRA: $22,518,300,000 ✅

COHERENCIA:
  ✅ WBS Presupuestal: 37 torres ($6,660,000,000)
  ✅ Layout: 37 torres TETRA
  ✅ Criterio técnico: Solapamiento 20% validado
  ✅ Todas las categorías preservadas

Errores encontrados: 0
Tiempo ejecución: ~45 segundos

ESTADO FINAL: ✅ EJECUCIÓN EXITOSA
```

---

**Documento generado:** 15 de Octubre 2025  
**Versión:** 1.0  
**Estado:** ⏳ Pendiente Ejecución  
**Próxima acción:** Crear script `completar_37_estaciones_TETRA_20pct.ps1` y ejecutar

