# CÓMO SE ACTUALIZAN LOS DOCUMENTOS SERVIDOS

**Carpeta X - Sistema de Consolidación**  
**Fecha:** 9 de Octubre 2025  
**Versión:** 1.0  

---

## 🎯 PREGUNTA CLAVE

**"Los documentos SISTEMA_02-06 y ESPECIALIDADES tienen fecha 6-Oct-2025. ¿Cómo se relacionan con las DTs y cómo se actualizan?"**

---

## 📊 ESTADO ACTUAL DE DOCUMENTOS

### **✅ ACTUALIZADOS HOY (9-Oct-2025) - 4 documentos:**

| Documento | Sistema WBS | DT que lo afectó | Fecha Actualización |
|:----------|:------------|:-----------------|:--------------------|
| **SISTEMA_01** Control y Señalización | Cap. 1 (1.1.106) | DT-INTERFACES-001 | 9-Oct 11:54 AM ✅ |
| Interfaces_Sistemas_Actualizado | IV.2 Ing. Básica | DT-INTERFACES-001 | 9-Oct 11:29 AM ✅ |
| CTC_v5_Actualizado | V.2 Ing. Detalle | DT-INTERFACES-001 | 9-Oct 11:29 AM ✅ |
| Protocolo_FFFIS_Actualizado | VII.2.4 Soporte | DT-INTERFACES-001 | 9-Oct 11:29 AM ✅ |

### **⏸️ SIN CAMBIOS (6-Oct-2025) - 12 documentos:**

| Documento | Por qué NO se actualizó | ¿Cuándo se actualizará? |
|:----------|:------------------------|:------------------------|
| SISTEMA_02 Telecomunicaciones | Sin DTs que afecten Cap. 2 | Cuando haya DT de TETRA/Fibra/TETRA |
| SISTEMA_03 ITS y Seguridad | Sin DTs que afecten Cap. 3 | Cuando haya DT de CCTV/ITS |
| SISTEMA_04 Material Rodante | Sin DTs que afecten Cap. 4 | Cuando haya DT de Locomotoras/EOT |
| SISTEMA_05 Infraestructura | Sin DTs que afecten Cap. 5 | Cuando haya DT de Energía/SCADA |
| SISTEMA_06 Integración | Sin DTs que afecten Cap. 6 | Cuando haya DT de Integración |
| ESPECIALIDAD_01-05 | Sin DTs de especialidades | Consolidación formal (hito/mensual) |

---

## 🔄 METODOLOGÍA DE ACTUALIZACIÓN

### **FLUJO COMPLETO:**

```
┌─────────────────────────────────────────────────────────────┐
│ FASE 1: TRABAJO DIARIO EN LA COCINA (I-VI)                  │
└─────────────────────────────────────────────────────────────┘

DT ejecutada (ej: DT-INTERFACES-001)
    ↓
Actualiza COCINA (I-VI) según aplique:
    ├─ IV. Ingeniería Básica (41. Interfaces_Sistemas)
    ├─ V. Ingeniería Detalle (V.2_CTC)
    ├─ VII. Soporte (VII.2.4_Interfaces)
    ├─ IX. WBS (metadata enriquecida)
    └─ VIII. Maestros (matrices)

┌─────────────────────────────────────────────────────────────┐
│ FASE 2: CONSOLIDACIÓN A CARPETA X/7_SISTEMAS_EJECUTIVOS/    │
└─────────────────────────────────────────────────────────────┘

Script: consolidar_para_carpeta_x.ps1
    ↓
Lee COCINA actualizada (I-VI):
    ├─ V.1_Señalizacion → SISTEMA_01_Master
    ├─ V.2_CTC → SISTEMA_01_Master
    ├─ V.3_Comunicacion → SISTEMA_02_Master
    ├─ V.4_Potencia → SISTEMA_05_Master
    └─ V.5_Seguridad → SISTEMA_03_Master
    ↓
Genera/Actualiza:
    └─ X/1_SISTEMAS_TECNICOS/SISTEMA_XX_Master.md
    ↓
Transforma a Ejecutivo:
    └─ X/7_SISTEMAS_EJECUTIVOS/SISTEMA_XX_EJECUTIVO.md

┌─────────────────────────────────────────────────────────────┐
│ FASE 3: SERVIR A CLIENTE (X/8_DOCUMENTOS_SERVIDOS/)         │
└─────────────────────────────────────────────────────────────┘

Script: servir_ingenieria_completo.ps1
    ↓
Lee X/7_SISTEMAS_EJECUTIVOS/ actualizados
    ↓
Pandoc genera:
    ├─ .docx → X/8_DOCUMENTOS_SERVIDOS/WORD/
    └─ .html → X/8_DOCUMENTOS_SERVIDOS/HTML/
    ↓
Cliente ve/descarga documentos
```

---

## 📋 MAPEO WBS ↔ DOCUMENTOS X/

### **SISTEMA_01 - Control y Señalización**

**Capítulos WBS que cubre:**
- Cap. 1.1: CTC
- Cap. 1.2: ATP Embarcado
- Cap. 1.3: Enclavamientos ENCE
- Cap. 1.4: Equipos ENCE
- Cap. 1.5: Desvíos

**Fuentes en Cocina (I-VI):**
- V.1_Señalizacion_Ferroviaria_Detalle
- V.2_Centro_Control_Trafico_CTC ✅ Actualizado hoy
- V.X_Enclavamientos_ENCE_Detalle
- V.X_Sistema_Desvios_Detalle
- IV.2 Interfaces_Sistemas ✅ Actualizado hoy
- VII.2.4 Protocolo FFFIS ✅ Actualizado hoy

**Actualización:**
- ✅ **Hoy (9-Oct):** DT-INTERFACES-001 afectó ítem 1.1.106 → SISTEMA_01 regenerado
- ⏸️ **Anterior (6-Oct):** Consolidación inicial sin DTs

---

### **SISTEMA_02 - Telecomunicaciones**

**Capítulos WBS que cubre:**
- Cap. 2.1: Red TETRA
- Cap. 2.2: Sistema TETRA
- Cap. 2.3: Fibra Óptica

**Fuentes en Cocina (I-VI):**
- V.3_Sistemas_Comunicacion_Detalle
- V.X_Sistema_TETRA_Detalle
- III. Conceptual (26_Sistema_CTC, 27_Fibra)

**Actualización:**
- ⏸️ **No actualizado hoy:** Sin DTs que afecten Cap. 2
- ✅ **Se actualizará cuando:** Haya DT-TETRA, DT-FIBRA, DT-GSMR
- 📅 **Última versión:** 6-Oct-2025 (consolidación base)

---

### **SISTEMA_03 - ITS y Seguridad**

**Capítulos WBS que cubre:**
- Cap. 3.1: CCTV
- Cap. 3.2: Control Acceso
- Cap. 3.3: Detección Intrusión

**Fuentes en Cocina (I-VI):**
- V.5_Sistemas_Seguridad_Detalle

**Actualización:**
- ⏸️ **No actualizado hoy:** Sin DTs que afecten Cap. 3
- ✅ **Se actualizará cuando:** Haya DT-CCTV, DT-ACCESO, DT-INTRUSION
- 📅 **Última versión:** 6-Oct-2025

---

### **SISTEMA_04 - Material Rodante**

**Capítulos WBS que cubre:**
- Cap. 4.1: Locomotoras
- Cap. 4.2: Equipos embarcados
- Cap. 4.3: Sistema EOT

**Fuentes en Cocina (I-VI):**
- V.X_Sistema_EOT_Detalle

**Actualización:**
- ⏸️ **No actualizado hoy:** Sin DTs que afecten Cap. 4
- ✅ **Se actualizará cuando:** Haya DT-LOCOMOTORA, DT-EOT
- 📅 **Última versión:** 6-Oct-2025

---

### **SISTEMA_05 - Infraestructura Operativa**

**Capítulos WBS que cubre:**
- Cap. 5.1: CCO
- Cap. 5.2: Estaciones
- Cap. 5.3: SCADA y Energía

**Fuentes en Cocina (I-VI):**
- V.4_Sistemas_Potencia_Detalle

**Actualización:**
- ⏸️ **No actualizado hoy:** Sin DTs que afecten Cap. 5
- ✅ **Se actualizará cuando:** Haya DT-SCADA, DT-ENERGIA, DT-CCO
- 📅 **Última versión:** 6-Oct-2025

---

### **SISTEMA_06 - Integración y Coordinación**

**Capítulos WBS que cubre:**
- Cap. 6: Gestión de Proyecto
- Integración de Sistemas
- Coordinación General

**Fuentes en Cocina (I-VI):**
- V.5_Integracion (si existe)
- III. Conceptual (documentos integrados)

**Actualización:**
- ⏸️ **No actualizado hoy:** Sin DTs que afecten Cap. 6
- ✅ **Se actualizará cuando:** Consolidación formal completa
- 📅 **Última versión:** 6-Oct-2025

---

### **ESPECIALIDADES (Civil, Eléctrica, Mecánica, Sistemas, Ambiental)**

**Fuentes en Cocina (I-VI):**
- V.1_Civil/, V.2_Electrica/, V.3_Mecanica/, V.4_Sistemas/, V.5_Integracion/
- IV. Ingeniería Básica (especificaciones por especialidad)

**Actualización:**
- ⏸️ **No actualizadas hoy:** DTs son por sistema, no por especialidad
- ✅ **Se actualizarán cuando:**
  - Consolidación formal (mensual/hito)
  - Script lea TODA la cocina I-VI
  - Se ejecute consolidación completa por especialidad
- 📅 **Última versión:** 6-Oct-2025

---

## 🔄 CUÁNDO SE ACTUALIZAN ESTOS DOCUMENTOS

### **ACTUALIZACIÓN INCREMENTAL (Como hoy):**

**Cuando hay DT que afecta sistema específico:**
```
DT-INTERFACES-001 (ítem 1.1.106 Cap. 1)
    ↓
Afecta SOLO documentos relacionados con Cap. 1:
    ✅ SISTEMA_01_Control_y_Senalizacion
    ✅ Documentos técnicos (IV.2, V.2, VII.2.4)
    ⏸️ SISTEMA_02-06 NO se tocan (sin cambios en sus capítulos)
```

**Ejemplo futuro - DT-TETRA-999:**
```
DT-TETRA-999 (ítem 2.1.100 Cap. 2)
    ↓
Afectaría:
    ✅ SISTEMA_02_Telecomunicaciones (regenerar)
    ⏸️ Otros sistemas NO se tocan
```

---

### **ACTUALIZACIÓN COMPLETA (Consolidación formal):**

**Cuando se requiere entrega formal (mensual/hito):**
```
Usuario ejecuta consolidación completa
    ↓
Script: consolidar_para_carpeta_x.ps1 (completo)
    ├─ Lee TODA la cocina I-VI
    ├─ Regenera TODOS los SISTEMA_XX_Master.md
    ├─ Transforma a EJECUTIVO
    └─ Pandoc genera .docx/.html de TODOS
    ↓
X/8_DOCUMENTOS_SERVIDOS/ completamente actualizado
    ├─ 16 Word
    └─ 17 HTML
    ↓
TODOS los documentos tienen la misma fecha
```

---

## 📋 METODOLOGÍA DE 3 FASES (Carpeta X)

### **FASE 1: CONSOLIDACIÓN (6-9h/sistema)**
**De:** Carpetas I-VI (cocina dispersa)  
**A:** X/1_SISTEMAS_TECNICOS/SISTEMA_XX_Master.md  
**Proceso:**
1. Mapear todas las fuentes en I-VI
2. Analizar coherencia
3. Consolidar en documento Master único
4. Validar completitud

**Estado actual:**
- ✅ SISTEMA_01-06: Consolidados (6-Oct)
- ⏸️ Se reconsolidan cuando hay cambios significativos

---

### **FASE 2: TRANSFORMACIÓN (2-3h/doc)**
**De:** X/1_SISTEMAS_TECNICOS/ (Master técnico)  
**A:** X/7_SISTEMAS_EJECUTIVOS/ (Ejecutivo para stakeholders)  
**Proceso:**
1. Aplicar prompt de transformación
2. Adaptar lenguaje para stakeholders
3. Agregar resumen ejecutivo
4. Simplificar contenido técnico

**Estado actual:**
- ✅ 13 documentos EJECUTIVO creados (6-Oct)
- ✅ SISTEMA_01 actualizado manualmente (9-Oct) con ítem 1.1.106

---

### **FASE 3: EXPORTACIÓN (2-3min)**
**De:** X/7_SISTEMAS_EJECUTIVOS/ (.md)  
**A:** X/8_DOCUMENTOS_SERVIDOS/ (.docx/.html)  
**Proceso:**
1. Pandoc: .md → .docx (Word)
2. Pandoc: .md → .html (Web)
3. Copiar a carpetas WORD/ y HTML/
4. Generar índice interactivo

**Estado actual:**
- ✅ 16 Word + 17 HTML generados
- ✅ 4 actualizados hoy (9-Oct) con DT-INTERFACES-001
- ✅ 12 sin cambios (6-Oct) - esperando DTs que los afecten

---

## 🎯 ESTRATEGIAS DE ACTUALIZACIÓN

### **ESTRATEGIA 1: INCREMENTAL (Actual - Eficiente)** ⭐ RECOMENDADA

**Cuándo:** Cada vez que hay DT ejecutada

**Proceso:**
1. DT actualiza cocina I-VI
2. Identificar qué SISTEMA_XX afecta la DT
3. Actualizar SOLO ese SISTEMA_XX en X/7_SISTEMAS_EJECUTIVOS/
4. Regenerar .docx/.html de ese sistema específico
5. Actualizar índice HTML

**Ventajas:**
- ✅ Rápido (5 minutos por sistema)
- ✅ Solo se tocan documentos afectados
- ✅ Fechas reflejan cambios reales
- ✅ Cliente ve claramente qué cambió

**Ejemplo hoy:**
- DT-INTERFACES-001 → Cap. 1 → SISTEMA_01 actualizado
- SISTEMA_02-06 NO se tocan (sin cambios en sus capítulos)

---

### **ESTRATEGIA 2: COMPLETA (Mensual/Hitos)**

**Cuándo:** Entregas formales programadas

**Proceso:**
1. Ejecutar consolidación completa I-VI → X/
2. Regenerar TODOS los SISTEMA_XX
3. Pandoc todos los .md → .docx/.html
4. TODOS los documentos tienen misma fecha

**Ventajas:**
- ✅ Snapshot completo del proyecto
- ✅ Todas las fechas sincronizadas
- ✅ Revisión integral de coherencia

**Cuándo usar:**
- Entregas mensuales programadas
- Hitos del proyecto
- Auditorías
- Presentaciones formales a cliente

---

## 📊 EJEMPLOS DE ACTUALIZACIÓN FUTURA

### **Ejemplo 1: DT-TETRA-050 (afecta Cap. 2)**

```
DT-TETRA-050: Ajuste cantidad estaciones TETRA
    ↓
Actualiza Cocina:
    ├─ V.3_Comunicacion_Detalle (estaciones TETRA)
    └─ IX. WBS (cantidad ítem 2.1.100)
    ↓
Consolida:
    └─ X/7_SISTEMAS_EJECUTIVOS/SISTEMA_02_Telecomunicaciones_EJECUTIVO.md
    ↓
Exporta:
    ├─ X/8_DOCUMENTOS_SERVIDOS/WORD/SISTEMA_02...docx (fecha nueva)
    └─ X/8_DOCUMENTOS_SERVIDOS/HTML/SISTEMA_02...html (fecha nueva)
    ↓
Índice HTML actualizado:
    ├─ SISTEMA_02 aparece en "Actualizados Hoy"
    └─ Badge: DT-TETRA-050
```

---

### **Ejemplo 2: Consolidación Mensual Completa**

```
Fin de mes → Entrega formal
    ↓
Ejecutar: .\scripts\consolidar_para_carpeta_x.ps1 (completo)
    ↓
Regenerar TODOS:
    ├─ SISTEMA_01 (incluye todas las DTs de Cap. 1)
    ├─ SISTEMA_02 (incluye todas las DTs de Cap. 2)
    ├─ SISTEMA_03-06
    └─ ESPECIALIDAD_01-05
    ↓
Exportar TODOS:
    ├─ 16 Word con fecha nueva (ej: 30-Oct-2025)
    └─ 17 HTML con fecha nueva
    ↓
Cliente recibe paquete completo sincronizado
```

---

## ✅ RESPUESTA A TU PREGUNTA

### **"¿Cómo se relacionan SISTEMA_02-06 con las DTs?"**

**Relación por capítulo WBS:**
- SISTEMA_01 ↔ Cap. 1 (CTC, ATP, ENCE) ✅ Actualizado hoy
- SISTEMA_02 ↔ Cap. 2 (TETRA, TETRA, Fibra) ⏸️ Sin DTs recientes
- SISTEMA_03 ↔ Cap. 3 (CCTV, ITS) ⏸️ Sin DTs recientes
- SISTEMA_04 ↔ Cap. 4 (Locomotoras, EOT) ⏸️ Sin DTs recientes
- SISTEMA_05 ↔ Cap. 5 (SCADA, Energía) ⏸️ Sin DTs recientes
- SISTEMA_06 ↔ Cap. 6 (Integración) ⏸️ Sin DTs recientes

### **"¿Cómo se actualizan?"**

**OPCIÓN A - Incremental (actual):**
- Solo cuando hay DT que afecte su capítulo WBS
- Actualización manual del SISTEMA_XX_EJECUTIVO.md
- Regeneración Pandoc de ese sistema
- Resto de documentos sin cambios (fechas antiguas)

**OPCIÓN B - Completa (mensual):**
- Script consolidación completa I-VI → X/
- TODOS los sistemas regenerados
- TODAS las fechas sincronizadas
- Paquete completo para cliente

---

## 🎯 PRÓXIMA ACCIÓN SUGERIDA

### **Para mantener Carpeta X actualizada:**

**Script mejorado que detecte automáticamente:**
```powershell
# servir_ingenieria_INTELIGENTE.ps1

1. Lee todas las DTs ejecutadas
2. Identifica qué capítulos WBS afectan
3. Mapea capítulos → SISTEMA_XX
4. Regenera SOLO sistemas afectados
5. Actualiza índice HTML dinámicamente
```

**Beneficio:**
- ✅ Solo regenera lo necesario
- ✅ Fechas reflejan cambios reales
- ✅ Proceso automático completo
- ✅ Cliente ve claramente qué cambió

---

## 📚 DOCUMENTACIÓN DE REFERENCIA

- **Metodología consolidación:** `X/6_METODOLOGIAS_Y_RECETAS/METODOLOGIA_CONSOLIDACION_DOCUMENTAL_v1.0.md`
- **Script actual:** `scripts/consolidar_para_carpeta_x.ps1`
- **Script servir:** `scripts/servir_ingenieria_completo.ps1`
- **README Carpeta X:** `X_ENTREGABLES_CONSOLIDADOS/README_CARPETA_X.md`

---

**Conclusión:**  
Los documentos SISTEMA_02-06 tienen fecha 6-Oct porque NO han sido afectados por DTs recientes. Se actualizarán cuando haya DTs de sus capítulos o en consolidación formal mensual.

**Fecha:** 9 de Octubre 2025  
**Estado:** ✅ Metodología clarificada

