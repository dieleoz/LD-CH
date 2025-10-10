# ÍTEMS WBS PARA DTs DE PRUEBA

**Fecha:** 9 de Octubre 2025  
**Propósito:** Identificar ítems WBS de cada capítulo para crear DTs de test que actualicen SISTEMA_02-06

---

## 📋 MAPEO CAPÍTULO → SISTEMA → ÍTEMS SUGERIDOS

### **CAPÍTULO 2 - SISTEMA DE ENERGÍA Y TELECOMUNICACIONES** → SISTEMA_02

#### **2.1 Sistema TETRA (37 estaciones)**
- ✅ **2.1.100** - Estación base TETRA completa (Qty: 37, VU: $180M)
- **2.1.101** - Antenas TETRA (Qty: 37, VU: $65M)
- **2.1.102** - Equipos terminales (Qty: 37, VU: $12M)
- **2.1.105** - Sistema gestión TETRA (Qty: 1, VU: $120M)
- **2.1.112** - Central switching TETRA (Qty: 1, VU: $200M)

#### **2.2 Sistema GSM-R**
- **2.2.100** - Estación base GSM-R (Qty: 37, VU: $45M)
- **2.2.103** - Core network GSM-R (Qty: 1, VU: $80M)
- **2.2.105** - Sistema gestión GSM-R (Qty: 1, VU: $150M)

#### **2.3 Fibra Óptica**
- ✅ **2.3.100** - Tendido fibra óptica (Qty: 594 km, VU: $9.8M/km)
- **2.3.103** - Cajas empalme (Qty: 2,068 und, VU: $1.35M)
- **2.3.105** - Fusionadora (Qty: 2, VU: $50M)
- **2.3.106** - OTDR (Qty: 2, VU: $30M)

**DT Sugerida:** `DT-TETRA-002-2025-10-09` (item 2.1.100 o 2.1.105)  
**Afectaría:** SISTEMA_02_Telecomunicaciones_EJECUTIVO.docx

---

### **CAPÍTULO 3 - SISTEMAS ITS Y SEGURIDAD** → SISTEMA_03

#### **3.1 Sistema CCTV**
- ✅ **3.1.100** - Cámaras CCTV (Qty: 73, VU: $30M)
- **3.1.101** - Cámaras talleres (Qty: 12, VU: $6M)
- **3.1.102** - Cámaras CCO (Qty: 8, VU: $10M)
- **3.1.104** - Sistema gestión CCTV (Qty: 1, VU: $150M)
- **3.1.105** - Servidores grabación (Qty: 2, VU: $80M)
- **3.1.106** - Software análisis video (Qty: 1, VU: $120M)

#### **3.2 Control de Acceso**
- **3.2.100** - Lectores biométricos (Qty: 100, VU: $3M)
- **3.2.102** - Torniquetes (Qty: 5, VU: $50M)
- **3.2.103** - Sistema control acceso central (Qty: 1, VU: $80M)

#### **3.3 Detección Intrusión**
- **3.3.100** - Sensores perimetrales (detalles en JSON)

**DT Sugerida:** `DT-CCTV-002-2025-10-09` (item 3.1.100 o 3.1.104)  
**Afectaría:** SISTEMA_03_ITS_y_Seguridad_EJECUTIVO.docx

---

### **CAPÍTULO 4 - MATERIAL RODANTE** → SISTEMA_04

#### **4.1 Pasos a Nivel**
- **4.1.100** - Pasos nivel tipo C (Qty: 9, VU: aprox $80M)
- **4.1.101** - Pasos nivel tipo B (Qty: 15, VU: aprox $50M)
- **4.1.102** - Sensores PAN
- **4.1.105** - Sistema PAN avanzado

#### **4.2 EOT (End of Train)**
- **4.2.100** - Dispositivos EOT (Qty: 15, VU: aprox $25M)

#### **4.3 Balizas (Eurobaliza)**
- **4.3.100** - Balizas eurobaliza (Qty: estimada)
- **4.3.101** - Balizas tipo A
- **4.3.102** - Balizas tipo B

**DT Sugerida:** `DT-EOT-001-2025-10-09` (item 4.2.100)  
**Afectaría:** SISTEMA_04_Material_Rodante_EJECUTIVO.docx

---

### **CAPÍTULO 5 - INFRAESTRUCTURA Y SCADA** → SISTEMA_05

#### **5.1 CCO (Centro Control Operaciones)**
- Ítems de infraestructura CCO

#### **5.2 Subestaciones Eléctricas**
- Ítems de potencia y energía

#### **5.3 Sistema SCADA**
- ✅ **5.3.100** - Servidores SCADA (Qty: estimada, VU: estimado)
- **5.3.101** - Software SCADA (Qty: estimada)
- **5.3.102** - Estaciones trabajo SCADA
- **5.3.103** - Interfaces comunicación L2/L3 (ya tiene DT-SCADA-003)

**DT Sugerida:** `DT-SCADA-004-2025-10-09` (item 5.3.100)  
**Afectaría:** SISTEMA_05_Infraestructura_Operativa_EJECUTIVO.docx

---

### **CAPÍTULO 6 - INTEGRACIÓN Y GESTIÓN** → SISTEMA_06

#### **6.1 Gestión del Proyecto**
- Ítems de gestión PMO
- Coordinación general

#### **6.2 Integración de Sistemas**
- **6.2.100** - Plan integración (estimado)
- **6.2.101** - Pruebas integración
- **6.2.102** - Documentación integración

**DT Sugerida:** `DT-INTEGRACION-001-2025-10-09` (item 6.2.100)  
**Afectaría:** SISTEMA_06_Integracion_y_Coordinacion_EJECUTIVO.docx

---

## 🎯 RECOMENDACIONES PARA DTs DE TEST

### **OPCIÓN 1: DT Simple para probar flujo** ⭐ RECOMENDADA

**Ítem:** `2.1.105` - Sistema gestión TETRA  
**Tipo DT:** Ajuste criterio técnico  
**Cambio:** SIN cambio numérico, solo justificación  
**Afecta:** SISTEMA_02_Telecomunicaciones

**Por qué este ítem:**
- ✅ Fácil de justificar (sistema de gestión)
- ✅ No requiere cálculos complejos
- ✅ Probará flujo completo: DT → Cocina → SISTEMA_02 → .docx
- ✅ Verás fecha actualizada en SISTEMA_02

---

### **OPCIÓN 2: DT de cantidad (más completa)**

**Ítem:** `3.1.100` - Cámaras CCTV  
**Tipo DT:** Ajuste de cantidad  
**Cambio:** Cantidad 73 → 75 (por ejemplo)  
**Razón:** Cobertura adicional de 2 puntos críticos  
**Afecta:** SISTEMA_03_ITS_y_Seguridad

**Por qué este ítem:**
- ✅ Cambio de cantidad visible
- ✅ Fácil de justificar (cobertura)
- ✅ Probará actualización numérica
- ✅ Verás cambio en WBS y en SISTEMA_03

---

### **OPCIÓN 3: DT de precio (completa)**

**Ítem:** `2.3.103` - Cajas de empalme  
**Tipo DT:** Actualización de precio  
**Cambio:** VU $1.35M → $1.5M (por ejemplo)  
**Razón:** Cotización actualizada de fabricante  
**Afecta:** SISTEMA_02_Telecomunicaciones

**Por qué este ítem:**
- ✅ Ya hay DTs similares de referencia
- ✅ Probará cambio de precio
- ✅ Actualiza presupuesto total
- ✅ Visible en WBS y SISTEMA_02

---

## 📝 PLANTILLA DE DT RÁPIDA

```markdown
# DECISIÓN TÉCNICA: DT-TETRA-002-2025-10-09

**Ítem WBS:** 2.1.105 - Sistema gestión TETRA  
**Tipo de cambio:** Ajuste criterio técnico  
**Fecha:** 2025-10-09  

---

## 1. DESCRIPCIÓN DEL ÍTEM
- Código: 2.1.105
- Descripción: Sistema gestión TETRA
- Cantidad: 1 UND
- VU: $120.000.000 COP (SIN CAMBIO)

---

## 3. JUSTIFICACIÓN TÉCNICA

Sistema central de gestión y monitoreo de las 37 estaciones base TETRA.
Incluye software de gestión, licencias, configuración y monitoreo remoto.

Funciones:
- Gestión de red TETRA
- Monitoreo de estaciones
- Configuración centralizada
- Análisis de tráfico
- Generación de reportes

---

## 10. INSTRUCCIONES PARA CURSOR

```yaml
dt_metadata:
  dt_id: "DT-TETRA-002-2025-10-09"
  item_wbs: "2.1.105"
  tipo_cambio: "ajuste_criterio_tecnico"
  
archivos_actualizar:
  - file: "IX. WBS y Planificacion/wbs_metadata_enriquecida.json"
    accion: "agregar_o_actualizar_metadata"
    item_codigo: "2.1.105"
    metadata:
      justificacion_tecnica: "Sistema central gestión 37 estaciones TETRA..."
```
```

---

## 🎯 FLUJO DE PRUEBA SUGERIDO

```
1. Crear DT-TETRA-002 con ítem 2.1.105
   ↓
2. DT actualiza:
   - IX. WBS (metadata)
   - (Opcional) V.3_Comunicacion si aplica
   ↓
3. Actualizar X/7_SISTEMAS_EJECUTIVOS/SISTEMA_02...md
   - Agregar § Ítem 2.1.105
   ↓
4. Ejecutar: .\scripts\servir_ingenieria_completo.ps1
   ↓
5. Regenera: SISTEMA_02.docx/.html
   ↓
6. Índice HTML muestra:
   - SISTEMA_02 con fecha nueva
   - Badge: DT-TETRA-002
   - En sección "Actualizados Hoy"
```

---

## ✅ VERIFICACIÓN

**Después de crear la DT de prueba, verificarás:**

1. ✅ Índice HTML muestra SISTEMA_02 actualizado
2. ✅ Fecha nueva visible (9-Oct 2025)
3. ✅ Botón Word descarga .docx con § nuevo
4. ✅ Sistema completo funcionando

---

**¿Con cuál ítem quieres que cree la DT de prueba?**

Opciones rápidas:
- **2.1.105** (TETRA gestión) → SISTEMA_02 ⭐ Recomendada
- **3.1.100** (Cámaras CCTV) → SISTEMA_03
- **5.3.100** (Servidores SCADA) → SISTEMA_05

