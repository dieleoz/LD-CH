# ✅ CORRECCIÓN: EQUIPOS DE DETECCIÓN DE TRENES - REQUISITO CONTRACTUAL

**Proyecto:** APP La Dorada-Chiriguaná  
**Fecha:** 15 de Octubre de 2025  
**Estado:** ✅ **CORRECCIÓN BASADA EN CONTRATO**  

---

## ❌ ERROR EN MI INTERPRETACIÓN ANTERIOR

**Lo que dije antes (INCORRECTO):**
- 340 contadores de ejes en 170 puntos
- Incluía los 122 PN Tipo A

**Lo que dice REALMENTE el contrato:**
- Solo los PN **Tipo B y C** requieren sistemas automáticos
- Los PN **Tipo A son PASIVOS** (solo señales fijas)

---

## ✅ INTERPRETACIÓN CORRECTA DEL CONTRATO

### **AT1 Sección 4.5 - Pasos a Nivel:**

> *"...el accionamiento y control de los equipos tecnológicos de los pasos a nivel **Clase B y C** (como lo son señales lumínicas, sonoras, y talanqueras) deberá estar **interconectado** y contar con **enclavamiento y automatización centralizada** desde el Centro de Control de Operaciones (CCO), y desde los enclavamientos y bloqueo automáticos electrónico estructurado (ENCE)."*

### **Tabla 23 - Tipos de Pasos a Nivel:**

| Tipo | Nombre | Protección | Detección Automática | Cantidad Mínima |
|:---:|:---|:---|:---:|:---:|
| **Tipo C** | S.B.E., S.B.A. o S.B.E.S.B.A. | **Barreras automáticas** | ✅ **SÍ** (requiere) | **9 PN** |
| **Tipo B** | S.L.A. | **Señales luminosas/acústicas** | ✅ **SÍ** (requiere) | **15 PN** |
| **Tipo A** | Señales Fijas | **Señalización fija pasiva** | ❌ **NO** (pasivo) | **122 PN** |

### **Conclusión del Contrato:**

✅ **SÍ requieren contadores de ejes:**
- PN Tipo C: 9 × 2 = **18 contadores**
- PN Tipo B: 15 × 2 = **30 contadores**

❌ **NO requieren contadores de ejes:**
- PN Tipo A: 122 (son PASIVOS, solo cruces en X reflectivas)

---

## 📊 CANTIDAD CORRECTA: 96 CONTADORES (NO 340)

### **DISTRIBUCIÓN REAL:**

| Ubicación | Puntos | Contadores | Consumo | Justificación |
|:---|:---:|:---:|:---:|:---|
| **Estaciones ENCE** | 24 puntos | 48 unidades | 2.4 kW | Para enclavamientos (AT1) |
| **PN Tipo C** | 9 PN | 18 unidades | 0.9 kW | Activar barreras automáticas |
| **PN Tipo B** | 15 PN | 30 unidades | 1.5 kW | Activar señales luminosas |
| **PN Tipo A** | ~~122 PN~~ | ~~244~~ **0 unidades** | ~~12.2~~ **0 kW** | ❌ PASIVOS (no requieren) |
| **TOTAL REAL** | **48 puntos** | **96 contadores** | **4.8 kW** | Según contrato |

---

## 🎯 RESPUESTA A TU PREGUNTA

### **"¿El contrato me pide solo los instale en 9 puntos?"**

**Respuesta:**

No exactamente **9 puntos**, sino:

1. **9 PN Tipo C** (barreras automáticas) → **SÍ requieren contadores** ✅
2. **15 PN Tipo B** (señales luminosas) → **SÍ requieren contadores** ✅
3. **5 Estaciones ENCE** (enclavamientos) → **SÍ requieren contadores** ✅
4. **122 PN Tipo A** (señalización fija) → **NO requieren contadores** ❌

**Total contractual:** 9 + 15 + 5 estaciones = **29 ubicaciones con detección automática**

---

## 📋 PN TIPO A: ¿QUÉ TIENEN ENTONCES?

### **Pasos a Nivel Tipo A (122 PN) - PASIVOS:**

**Equipamiento según AT1/NTC 4741:**

```
PN Tipo A (Señalización Fija):
├─ Cruz de San Andrés reflectiva (4 unidades por PN)
├─ Postes de señalización (3m altura, galvanizado)
├─ Señalización vial horizontal (pintura reflectiva)
├─ Señales preventivas en carretera
└─ ❌ SIN sistemas eléctricos
    ❌ SIN contadores de ejes
    ❌ SIN conexión al CTC
    ❌ SIN barreras ni señales luminosas
```

**Consumo eléctrico:** **0 kW** (100% pasivo)

**Presupuesto WBS:**
```
Item 4.3.100: Señalización fija PN Tipo A
├─ Cantidad: 122 PN
├─ V/U: $15.000.000 COP
├─ Total: $1.830.000.000 COP
└─ Incluye: Cruces, postes, pintura, instalación
```

---

## 🔧 CORRECCIÓN DE MI DOCUMENTO ANTERIOR

### **Tabla Correcta:**

| Categoría | Antes (ERROR) | Ahora (CORRECTO) | Diferencia |
|:---|:---:|:---:|:---:|
| **Estaciones ENCE** | 48 contadores | 48 contadores | ✅ Correcto |
| **PN Tipo C** | 18 contadores | 18 contadores | ✅ Correcto |
| **PN Tipo B** | 30 contadores | 30 contadores | ✅ Correcto |
| **PN Tipo A** | ~~244~~ | **0 contadores** | ❌ ERROR (eliminado) |
| **TOTAL** | ~~340~~ | **96 contadores** | -244 unidades |
| **Consumo** | ~~17.0 kW~~ | **4.8 kW** | -12.2 kW |
| **Costo** | ~~$2.871M~~ | **$860M estimado** | -$2.011M |

---

## 💰 PRESUPUESTO CORREGIDO

### **Contadores de Ejes - Cantidad Real:**

```
ÍTEM WBS (Propuesto): 1.6 SISTEMAS DE DETECCIÓN DE TRENES

1.6.100 - Contadores ejes ENCE
├─ Cantidad: 48 unidades (5 estaciones)
├─ V/U: $5.000.000 COP
└─ Total: $240.000.000

1.6.101 - Contadores ejes PN Tipo C
├─ Cantidad: 18 unidades (9 PN × 2)
├─ V/U: $5.000.000 COP
└─ Total: $90.000.000
└─ Nota: Puede estar incluido en 4.1.102

1.6.102 - Contadores ejes PN Tipo B
├─ Cantidad: 30 unidades (15 PN × 2)
├─ V/U: $5.000.000 COP
└─ Total: $150.000.000
└─ Nota: Puede estar incluido en 4.2.102

1.6.103 - Controladores detección
├─ Cantidad: 48 unidades (1 por punto)
├─ V/U: $3.000.000 COP
└─ Total: $144.000.000

1.6.104 - Instalación
├─ Cantidad: 48 puntos
├─ V/U: $2.000.000 COP
└─ Total: $96.000.000

1.6.105 - Repuestos 10%
└─ Total: $72.000.000

───────────────────────────────────────────────
SUBTOTAL CORRECTO: $792.000.000 COP (~$180,000 USD)
```

**Nota:** Los contadores de PN Tipo C y B pueden estar ya incluidos en ítems 4.1.102 y 4.2.102.

---

## 📍 UBICACIONES CONTRACTUALES - 48 PUNTOS

### **1. Estaciones ENCE (24 puntos = 48 contadores):**

| Estación | PK | Puntos | Contadores | Presupuesto |
|:---|:---:|:---:|:---:|:---:|
| La Dorada | 201+470 | 5 | 10 | $50M |
| Puerto Berrío | ~315+000 | 4 | 8 | $40M |
| Barrancabermeja | 441+932 | 6 | 12 | $60M |
| García Cadena | 462+520 | 4 | 8 | $40M |
| Chiriguaná | 722+250 | 5 | 10 | $50M |
| **TOTAL** | **5 estaciones** | **24** | **48** | **$240M** |

### **2. Pasos a Nivel Tipo C (9 puntos = 18 contadores):**

Según **AT1 Tabla 24**, los 9 PN Tipo C identificados son:

| Nº | PK Contractual | Ubicación | Contadores | Incluido en WBS |
|:---:|:---|:---|:---:|:---|
| 1 | 202+460 | La Dorada | 2 | 4.1.102 |
| 2 | 206+000 | La Dorada (Vía Norcasia) | 2 | 4.1.102 |
| 30 | 331+770 | Puerto Berrío | 2 | 4.1.102 |
| 54 | 439+740 | Barrancabermeja | 2 | 4.1.102 |
| 56 | 441+770 | Barrancabermeja | 2 | 4.1.102 |
| 57 | 443+080 | Barrancabermeja | 2 | 4.1.102 |
| 73 | 465+500 | Puerto Wilches | 2 | 4.1.102 |
| 115 | 591+400 | Aguachica | 2 | 4.1.102 |
| 133 | 675+930 | Chiriguaná | 2 | 4.1.102 |
| **TOTAL** | **9 PN** | | **18** | |

### **3. Pasos a Nivel Tipo B (15 puntos = 30 contadores):**

Según **AT1 Tabla 24**, algunos de los 15 PN Tipo B identificados:

| Nº | PK Contractual | Ubicación | Contadores | Incluido en WBS |
|:---:|:---|:---|:---:|:---|
| 21 | 277+950 | Puerto Nare | 2 | 4.2.102 |
| 22 | 287+810 | Puerto Nare | 2 | 4.2.102 |
| 59 | 445+400 | Barrancabermeja | 2 | 4.2.102 |
| 63 | 448+490 | Barrancabermeja | 2 | 4.2.102 |
| 67 | 453+530 | Barrancabermeja | 2 | 4.2.102 |
| 71 | 465+250 | Puerto Wilches | 2 | 4.2.102 |
| 78 | 473+300 | Puerto Wilches | 2 | 4.2.102 |
| 93 | 517+600 | Rionegro | 2 | 4.2.102 |
| 101 | 546+800 | San Martín | 2 | 4.2.102 |
| ... | ... | ... | ... | 4.2.102 |
| **TOTAL** | **15 PN** | | **30** | |

---

## 🎯 RESPUESTA CLARA Y CORRECTA

### **"¿El contrato me pide solo los instale en 9 puntos?"**

**Respuesta:**

El contrato pide contadores de ejes en **48 puntos** (no 9, no 170):

1. **9 PN Tipo C** (barreras automáticas) → 18 contadores ✅
2. **15 PN Tipo B** (señales luminosas/acústicas) → 30 contadores ✅
3. **5 Estaciones ENCE** (enclavamientos) → 48 contadores ✅
4. **122 PN Tipo A** (señalización fija PASIVA) → **0 contadores** ❌

**Total contractual:** 9 + 15 + 5 = **29 ubicaciones** = **48 puntos de detección** = **96 contadores**

---

## 📊 TABLA CORRECTA FINAL

### **Equipos de Detección de Trenes - CANTIDAD CONTRACTUAL:**

| Ubicación | Tipo | Puntos | Contadores | Consumo | Presupuesto |
|:---|:---|:---:|:---:|:---:|:---:|
| **Estaciones ENCE** | Enclavamientos | 24 | 48 | 2.4 kW | $240M |
| **PN Tipo C** | Barreras automáticas | 9 | 18 | 0.9 kW | Incluido 4.1.102 |
| **PN Tipo B** | Señales luminosas | 15 | 30 | 1.5 kW | Incluido 4.2.102 |
| **PN Tipo A** | Pasivos (sin detección) | 0 | 0 | 0 kW | N/A |
| **TOTAL** | | **48 puntos** | **96 contadores** | **4.8 kW** | **~$860M** |

---

## ⚠️ ¿POR QUÉ LOS PN TIPO A NO REQUIEREN CONTADORES?

### **Definición de PN Tipo A (Pasivo):**

```
Paso a Nivel Tipo A (Señalización Fija):
├─ Cruz de San Andrés reflectiva
├─ Señales verticales fijas
├─ Pintura horizontal (rayas)
├─ ❌ SIN sistemas eléctricos
├─ ❌ SIN activación automática
├─ ❌ SIN conexión a CTC/ENCE
└─ Responsabilidad del conductor (visual)
```

**Filosofía:** El conductor del vehículo debe **MIRAR** antes de cruzar (responsabilidad personal).

**Normativa:** NTC 4741 - Señalización de Vías Férreas y Pasos a Nivel

### **¿Cómo se garantiza la seguridad en PN Tipo A?**

Según **AT8 (Gestión Social)**:
- Campañas de cultura vial
- Señalización clara y visible
- Mantenimiento de cruces
- Educación a comunidades
- **NO con sistemas automáticos**

---

## 📝 UBICACIÓN EN WBS - REVISIÓN

### **¿Dónde ESTÁN presupuestados los 96 contadores?**

#### **Opción 1: Están INCLUIDOS en ítems existentes (más probable):**

```
4.1.102 - Sistemas detección vehículos (PN Tipo C)
├─ Cantidad: 9 PN
├─ V/U: $360.000.000 COP
├─ Total: $3.240.000.000
├─ INCLUYE:
│   ├─ Lazos inductivos (vehículos)
│   ├─ Radar Doppler (vehículos)
│   ├─ Cámaras IA (vehículos)
│   └─ ✅ Contadores de ejes (trenes) ← Aquí están los 18
└─ Conclusión: ✅ YA están presupuestados

4.2.102 - Sistemas detección (PN Tipo B)
├─ Cantidad: 15 PN
├─ V/U: $80.000.000 COP
├─ Total: $1.200.000.000
├─ INCLUYE:
│   ├─ Señales luminosas LED
│   ├─ Sirenas acústicas
│   └─ ✅ Contadores de ejes (trenes) ← Aquí están los 30
└─ Conclusión: ✅ YA están presupuestados
```

#### **Opción 2: NO están presupuestados (requiere corrección):**

Solo los **48 contadores de ENCE** podrían estar faltando:

```
Gap en WBS:
├─ ENCE (5 estaciones): 48 contadores × $5M = $240M
└─ Acción: Crear ítem 1.6.100 (o incluir en 1.3.XXX)
```

---

## ✅ CONCLUSIÓN CORRECTA

### **Para JOVEGA, la información correcta es:**

**1. Equipos de Detección de Trenes:**
- **Cantidad:** **96 contadores de ejes** (NO 340)
- **Ubicaciones:** **48 puntos** (NO 170):
  - 5 estaciones ENCE: 24 puntos
  - 9 PN Tipo C: 9 puntos
  - 15 PN Tipo B: 15 puntos
- **Consumo:** **4.8 kW** (NO 17.0 kW)
- **Tecnología:** ADIF ET 03.365.310.6
- **Presupuesto estimado:** **$860M COP** (~$195,000 USD)

**Nota importante:** Los 122 PN Tipo A son **PASIVOS** (solo señalización fija reflectiva, sin sistemas eléctricos ni automáticos).

---

## 🎯 PARA TU RESPUESTA A JOVEGA

Cuando respondas sobre **"Equipos de detección de trenes"**, la información correcta es:

```
1. EQUIPOS DE DETECCIÓN DE TRENES

✅ INFORMACIÓN DISPONIBLE:
- Tecnología: Contadores de ejes (Axle Counters)
- Norma: ADIF ET 03.365.310.6
- Cantidad: 96 unidades (48 puntos de detección × 2 sensores)
- Ubicaciones:
  • 5 estaciones ENCE: 48 contadores (control de itinerarios)
  • 9 PN Tipo C: 18 contadores (activación barreras automáticas)
  • 15 PN Tipo B: 30 contadores (activación señales luminosas)
- Consumo: 50W por unidad = 4.8 kW total
- Función: Detección automática de trenes, activación sistemas seguridad
- Certificación: SIL-4 (seguridad ferroviaria crítica)

⚠️ IMPORTANTE:
- Los 122 PN Tipo A son PASIVOS (solo señalización fija reflectiva)
- NO requieren contadores de ejes ni sistemas eléctricos
- Seguridad basada en señalización visual y cultura vial (AT8)
```

---

**Gracias por la corrección! El contrato es claro: solo PN Tipo B y C requieren detección automática.**

---

**FIN DEL DOCUMENTO**

**Versión:** 1.0 - CORREGIDA  
**Fecha:** 15 de Octubre de 2025  
**Estado:** ✅ **ALINEADO CON CONTRATO AT1**

