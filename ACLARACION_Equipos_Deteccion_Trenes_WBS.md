# ⚠️ ACLARACIÓN: EQUIPOS DE DETECCIÓN DE TRENES EN LA WBS

**Proyecto:** APP La Dorada-Chiriguaná  
**Fecha:** 15 de Octubre de 2025  
**Asunto:** Ubicación de contadores de ejes en la WBS  
**Estado:** ⚠️ **GAP IDENTIFICADO - REQUIERE CORRECCIÓN**  

---

## 🎯 ¿QUÉ SON LOS EQUIPOS DE DETECCIÓN DE TRENES?

### **Definición Técnica:**

Los **contadores de ejes (axle counters)** son dispositivos electrónicos instalados en la vía que:

1. **Detectan cuándo un tren entra y sale** de una sección de vía
2. **Cuentan los ejes** que pasan sobre ellos
3. **Determinan si la vía está ocupada o libre** (esencial para seguridad)

### **¿Cómo funcionan?**

```
Tren entra a sección:
├─ Sensor 1 (entrada): Cuenta 40 ejes → "Sección OCUPADA"
├─ Tren circula por la sección
└─ Sensor 2 (salida): Cuenta 40 ejes → "Sección LIBRE"

Si entran 40 ejes pero solo salen 39 → ⚠️ ALARMA (posible descarrilamiento)
```

### **Especificación Técnica:**

| Parámetro | Valor |
|:---|:---|
| **Norma** | ADIF ET 03.365.310.6 (España) |
| **Tecnología** | Sensores inductivos o magnetorresistivos |
| **Alimentación** | 24V DC |
| **Consumo** | ~50W por unidad (sensor + electrónica) |
| **Precisión** | 100% de detección |
| **Certificación** | SIL-4 (Safety Integrity Level 4) |

### **¿Por qué contadores de ejes y NO circuitos de vía?**

| Característica | Contadores de Ejes | Circuitos de Vía |
|:---|:---:|:---:|
| **Mantenimiento** | ✅ Bajo | ❌ Alto |
| **Condiciones balasto** | ✅ Independiente | ❌ Dependiente |
| **Clima tropical** | ✅ Ideal | ❌ Problemático |
| **Costo instalación** | ✅ Menor | ❌ Mayor |
| **Costo operación** | ✅ Menor | ❌ Mayor |
| **Confiabilidad** | ✅ Alta | ⚠️ Media |

**Decisión:** El proyecto usa **contadores de ejes** según AT3 (Especificaciones Generales).

---

## 📋 CANTIDAD TOTAL: 340 CONTADORES (170 PUNTOS × 2)

### **¿Por qué 340 unidades?**

Cada **punto de detección** requiere **2 contadores** (entrada + salida):

```
Punto de Detección = Sensor Entrada + Sensor Salida
                   = 2 contadores de ejes

Ejemplo: PN-001 (Paso a Nivel)
├─ Contador 1: 100m antes del PN (detecta entrada)
└─ Contador 2: 100m después del PN (detecta salida)
```

### **Distribución de 170 puntos de detección:**

| Ubicación | Puntos | Contadores | Consumo |
|:---|:---:|:---:|:---:|
| **Estaciones ENCE** | 24 puntos | 48 unidades | 2.4 kW |
| **Pasos a Nivel Tipo C** | 9 puntos | 18 unidades | 0.9 kW |
| **Pasos a Nivel Tipo B** | 15 puntos | 30 unidades | 1.5 kW |
| **Pasos a Nivel Tipo A** | 122 puntos | 244 unidades | 12.2 kW |
| **TOTAL** | **170 puntos** | **340 contadores** | **17.0 kW** |

---

## 🔍 UBICACIÓN EN LA WBS ACTUAL

### ⚠️ **PROBLEMA DETECTADO:**

Los contadores de ejes **NO tienen un ítem específico en la WBS**. Actualmente están **dispersos** e **implícitos** dentro de otros ítems:

### **Ubicación Actual (INCORRECTA - Dispersa):**

#### **1. En Pasos a Nivel Tipo C (9 PN):**
```
Item 4.1.102: "Sistemas detección vehículos"
├─ Cantidad: 9 PN
├─ Valor unitario: $360.000.000 COP
├─ Total: $3.240.000.000
├─ INCLUYE:
│   ├─ Lazos inductivos (detectan vehículos)
│   ├─ Radar Doppler (detectan vehículos)
│   ├─ Cámaras IA (detectan vehículos)
│   └─ ⚠️ CONTADORES DE EJES (detectan trenes) - IMPLÍCITO
```

**Problema:** El nombre dice "detección de **vehículos**" pero incluye detección de **trenes**.

#### **2. En Pasos a Nivel Tipo B (15 PN):**
```
Item 4.2.102: "Sistemas detección"
├─ Cantidad: 15 PN
├─ Valor unitario: $80.000.000 COP
├─ Total: $1.200.000.000
├─ INCLUYE:
│   └─ ⚠️ CONTADORES DE EJES - IMPLÍCITO
```

#### **3. En Estaciones ENCE (5 estaciones):**
```
⚠️ NO HAY ÍTEM ESPECÍFICO
Los contadores de ejes para las estaciones ENCE están:
- Posiblemente incluidos dentro de 1.3.100-104 (Controladores ENCE)
- O NO ESTÁN PRESUPUESTADOS ← PROBLEMA CRÍTICO
```

---

## ❌ GAP IDENTIFICADO EN LA WBS

### **Problema:**

Los **contadores de ejes de las estaciones ENCE** (48 unidades) **NO están presupuestados explícitamente** en la WBS.

| Ubicación | Contadores | ¿Está en WBS? | Item WBS |
|:---|:---:|:---:|:---|
| **Estaciones ENCE (5)** | 48 unidades | ❌ **NO** | Falta crear |
| **PN Tipo C (9)** | 18 unidades | 🔄 Implícito | 4.1.102 |
| **PN Tipo B (15)** | 30 unidades | 🔄 Implícito | 4.2.102 |
| **PN Tipo A (122)** | 244 unidades | ❌ **NO** | Falta crear |

### **Impacto del GAP:**

```
Contadores NO presupuestados:
├─ ENCE: 48 unidades × $5.000.000 = $240.000.000 COP
├─ PN Tipo A: 244 unidades × $5.000.000 = $1.220.000.000 COP
└─ TOTAL FALTANTE: $1.460.000.000 COP
```

---

## ✅ SOLUCIÓN PROPUESTA: CREAR ÍTEM ESPECÍFICO

### **Nuevo Ítem WBS Recomendado:**

```
CAPÍTULO 1: CONTROL Y SEÑALIZACIÓN VIRTUAL

1.6 SISTEMAS DE DETECCIÓN DE TRENES
────────────────────────────────────────────────────────────────

Item 1.6.100: Contadores de ejes ENCE (Estaciones)
├─ Descripción: Contadores de ejes para enclavamientos ENCE
├─ Norma: ADIF ET 03.365.310.6
├─ Cantidad: 48 unidades (5 estaciones × 8-12 contadores promedio)
├─ Valor unitario: $5.000.000 COP
├─ Total: $240.000.000 COP
└─ Ubicaciones: La Dorada, Puerto Berrío, Barrancabermeja, García Cadena, Chiriguaná

Item 1.6.101: Contadores de ejes PN Tipo A (Pasivo)
├─ Descripción: Contadores de ejes para pasos a nivel pasivos
├─ Norma: ADIF ET 03.365.310.6
├─ Cantidad: 244 unidades (122 PN × 2 contadores)
├─ Valor unitario: $5.000.000 COP
├─ Total: $1.220.000.000 COP
└─ Ubicaciones: Distribuidos en 122 PN Tipo A

Item 1.6.102: Controladores de detección
├─ Descripción: Unidades de procesamiento para contadores
├─ Cantidad: 170 unidades (1 por punto de detección)
├─ Valor unitario: $3.000.000 COP
├─ Total: $510.000.000 COP
└─ Función: Interface con ENCE/CTC

Item 1.6.103: Cableado y accesorios
├─ Descripción: Cables señal, conectores, protecciones
├─ Cantidad: 1 GL (global)
├─ Valor unitario: $300.000.000 COP
├─ Total: $300.000.000 COP
└─ Instalación completa

Item 1.6.104: Instalación y configuración
├─ Descripción: Instalación, calibración, certificación
├─ Cantidad: 170 puntos
├─ Valor unitario: $2.000.000 COP
├─ Total: $340.000.000 COP
└─ Incluye certificación SIL-4

Item 1.6.105: Repuestos (10%)
├─ Descripción: Repuestos y mantenimiento
├─ Cantidad: Calculado
├─ Total: $261.000.000 COP
└─ 10% del subtotal

SUBTOTAL 1.6 DETECCIÓN DE TRENES: $2.871.000.000 COP
```

### **Ajuste a Ítems Existentes:**

```
Item 4.1.102: "Sistemas detección vehículos" 
├─ ANTES: $360M × 9 = $3.240M (incluía contadores de ejes)
├─ DESPUÉS: $355M × 9 = $3.195M (solo detección vehicular)
└─ Diferencia: -$45M (contadores movidos a 1.6.100)

Item 4.2.102: "Sistemas detección"
├─ ANTES: $80M × 15 = $1.200M (incluía contadores de ejes)
├─ DESPUÉS: $70M × 15 = $1.050M (solo detección vehicular)
└─ Diferencia: -$150M (contadores movidos a 1.6.100)
```

---

## 📊 RESUMEN: ESTADO ACTUAL vs PROPUESTO

### **ESTADO ACTUAL EN LA WBS (v2.11):**

| Ubicación | Está en WBS | Item WBS | Cantidad | Presupuesto | Estado |
|:---|:---:|:---|:---:|:---:|:---:|
| **ENCE (5 estaciones)** | ❌ | NO EXISTE | 48 | $0 | ⚠️ FALTANTE |
| **PN Tipo C (9)** | 🔄 | 4.1.102 | 18 | Implícito en $3.240M | ⚠️ IMPLÍCITO |
| **PN Tipo B (15)** | 🔄 | 4.2.102 | 30 | Implícito en $1.200M | ⚠️ IMPLÍCITO |
| **PN Tipo A (122)** | ❌ | NO EXISTE | 244 | $0 | ⚠️ FALTANTE |
| **TOTAL** | | | **340** | **~$195M implícito** | ❌ INCOMPLETO |

### **ESTADO PROPUESTO (Corrección):**

| Ubicación | Item WBS Propuesto | Cantidad | Presupuesto | Estado |
|:---|:---|:---:|:---:|:---:|
| **ENCE (5 estaciones)** | **1.6.100** | 48 | $240M | ✅ EXPLÍCITO |
| **PN Tipo C (9)** | 4.1.102 (ajustado) | 18 | Separado $90M | ✅ EXPLÍCITO |
| **PN Tipo B (15)** | 4.2.102 (ajustado) | 30 | Separado $150M | ✅ EXPLÍCITO |
| **PN Tipo A (122)** | **1.6.101** | 244 | $1.220M | ✅ EXPLÍCITO |
| **Controladores** | **1.6.102** | 170 | $510M | ✅ NUEVO |
| **Accesorios** | **1.6.103** | 1 GL | $300M | ✅ NUEVO |
| **Instalación** | **1.6.104** | 170 | $340M | ✅ NUEVO |
| **Repuestos** | **1.6.105** | - | $261M | ✅ NUEVO |
| **TOTAL** | **1.6.XXX** | **340** | **$2.871M** | ✅ COMPLETO |

---

## 🔧 ¿QUÉ SON EXACTAMENTE?

### **Componentes Físicos:**

```
CONTADOR DE EJES (2 sensores por punto):
├─ Sensor Inductivo 1 (Rueda Izquierda)
│   ├─ Detecta paso de cada rueda
│   ├─ Genera pulso eléctrico
│   └─ Envía señal a controlador
│
├─ Sensor Inductivo 2 (Rueda Derecha)
│   ├─ Redundancia del sensor 1
│   ├─ Validación cruzada
│   └─ Seguridad SIL-4
│
├─ Controlador de Detección
│   ├─ Cuenta ejes entrada/salida
│   ├─ Compara entrada vs salida
│   ├─ Envía estado a ENCE/CTC
│   └─ Genera alarmas si no coincide
│
└─ Cableado y Accesorios
    ├─ Cable de señal (blindado)
    ├─ Caja de protección (IP67)
    ├─ Conectores estancos
    └─ Puesta a tierra
```

### **Ubicación Física en Vía:**

```
═══════════════════════════════════════════════════════════════
               SECCIÓN DE VÍA ENTRE ESTACIONES
═══════════════════════════════════════════════════════════════

[Estación A] ─────────── [Punto Detección] ─────────── [Estación B]
                                │
                    ┌───────────┴───────────┐
                    │                       │
                Contador 1              Contador 2
                (Entrada)               (Salida)
                    │                       │
                    └───────── Controlador ─┘
                               │
                        A ENCE o CTC
```

---

## 📍 DISTRIBUCIÓN DE LOS 170 PUNTOS DE DETECCIÓN

### **1. Estaciones ENCE (24 puntos = 48 contadores)**

#### **Distribución por estación:**

| Estación | PK | Puntos Detección | Contadores | Justificación |
|:---|:---:|:---:|:---:|:---|
| **La Dorada** | 201+470 | 5 puntos | 10 | 6 desvíos + múltiples vías |
| **Puerto Berrío** | ~315+000 | 4 puntos | 8 | 5 desvíos + apartaderos |
| **Barrancabermeja** | 441+932 | 6 puntos | 12 | CCO + 6 desvíos + alto tráfico |
| **García Cadena** | 462+520 | 4 puntos | 8 | 4 desvíos + operación estándar |
| **Chiriguaná** | 722+250 | 5 puntos | 10 | 4 desvíos + terminal |
| **TOTAL ENCE** | **5 estaciones** | **24 puntos** | **48 contadores** | |

**Función:** Detectar ocupación de vías, proteger itinerarios, gestionar enclavamientos.

### **2. Pasos a Nivel Tipo C (9 puntos = 18 contadores)**

| PN | PK | Contadores | Función | WBS Actual |
|:---:|:---:|:---:|:---|:---|
| PN-001 | 215+250 | 2 | Activar barreras automáticas | 4.1.102 (implícito) |
| PN-002 | 350+180 | 2 | Activar barreras automáticas | 4.1.102 (implícito) |
| PN-003 | 441+920 | 2 | Activar barreras automáticas | 4.1.102 (implícito) |
| PN-004 | 490+450 | 2 | Activar barreras automáticas | 4.1.102 (implícito) |
| PN-005 | 540+300 | 2 | Activar barreras automáticas | 4.1.102 (implícito) |
| PN-006 | 590+180 | 2 | Activar barreras automáticas | 4.1.102 (implícito) |
| PN-007 | 630+650 | 2 | Activar barreras automáticas | 4.1.102 (implícito) |
| PN-008 | 670+200 | 2 | Activar barreras automáticas | 4.1.102 (implícito) |
| PN-009 | 720+150 | 2 | Activar barreras automáticas | 4.1.102 (implícito) |
| **TOTAL** | **9 PN** | **18** | | |

### **3. Pasos a Nivel Tipo B (15 puntos = 30 contadores)**

| Ubicación | Contadores | Función | WBS Actual |
|:---|:---:|:---|:---|
| PN-010 a PN-024 | 30 | Activar señales luminosas/acústicas | 4.2.102 (implícito) |

### **4. Pasos a Nivel Tipo A (122 puntos = 244 contadores)**

| Ubicación | Contadores | Función | WBS Actual |
|:---|:---:|:---|:---|
| PN-025 a PN-146 | 244 | Monitoreo CTC (sin activación) | ❌ NO EXISTE |

**Función:** Monitorear tráfico ferroviario en PN pasivos para estadísticas y seguridad.

---

## 💰 PRESUPUESTO ESTIMADO: $2.871 MILLONES COP

### **Desglose del presupuesto propuesto:**

| Ítem | Descripción | Cantidad | V/U | Total |
|:---|:---|:---:|:---:|:---:|
| **1.6.100** | Contadores ENCE | 48 | $5.000.000 | $240.000.000 |
| **1.6.101** | Contadores PN Tipo A | 244 | $5.000.000 | $1.220.000.000 |
| **1.6.102** | Controladores | 170 | $3.000.000 | $510.000.000 |
| **1.6.103** | Cableado/accesorios | 1 GL | $300.000.000 | $300.000.000 |
| **1.6.104** | Instalación | 170 | $2.000.000 | $340.000.000 |
| **1.6.105** | Repuestos 10% | - | - | $261.000.000 |
| **SUBTOTAL** | | | | **$2.871.000.000** |

**Nota:** Los contadores de PN Tipo C y B ya están presupuestados dentro de 4.1.102 y 4.2.102, solo necesitan separarse.

---

## 🎯 RESPUESTA A TU PREGUNTA

### **"¿Esto qué es en la WBS?"**

**Respuesta corta:**

Los **EQUIPOS DE DETECCIÓN DE TRENES** (contadores de ejes) **NO tienen un ítem específico y completo en la WBS actual**. Están:

1. ✅ **Parcialmente incluidos** en ítems 4.1.102 y 4.2.102 (PN Tipo C y B)
2. ❌ **FALTANTES** para estaciones ENCE (48 unidades)
3. ❌ **FALTANTES** para PN Tipo A (244 unidades)

**Respuesta larga:**

Los contadores de ejes son **equipos críticos de seguridad** que deben tener su propio capítulo en la WBS (propuesto: **Sección 1.6**) con:
- 340 contadores totales
- 170 puntos de detección
- $2.871 millones COP presupuesto
- Distribuidos en 5 estaciones ENCE + 146 pasos a nivel

---

## 📋 DECISIÓN TÉCNICA RECOMENDADA

### **DT-DETECCION-001: Crear ítem específico para contadores de ejes**

```yaml
Acción: Crear sección 1.6 en WBS
Ítems nuevos: 1.6.100 a 1.6.105
Presupuesto: $2.871.000.000 COP
Ajustes: Reducir 4.1.102 y 4.2.102 (separar contadores)
Impacto neto: +$1.460M (contadores ENCE y PN-A no presupuestados)
```

---

## ✅ CONCLUSIÓN

### **Los EQUIPOS DE DETECCIÓN DE TRENES son:**

1. **Qué:** Contadores de ejes (axle counters) - sensores de seguridad crítica
2. **Cantidad:** 340 unidades (170 puntos × 2 sensores)
3. **Ubicación física:** 5 estaciones ENCE + 146 pasos a nivel
4. **Ubicación WBS actual:** ⚠️ Disperso/incompleto (GAP identificado)
5. **Ubicación WBS propuesta:** **Sección 1.6** (nuevo capítulo)
6. **Consumo:** 17.0 kW total
7. **Presupuesto:** $2.871 millones COP
8. **Tecnología:** ADIF ET 03.365.310.6, SIL-4

### **Acción recomendada:**

✅ Crear **DT-DETECCION-001** para agregar la sección 1.6 a la WBS  
✅ Presupuestar explícitamente los 340 contadores  
✅ Separar detección de trenes vs detección vehicular  

---

**¿Quieres que cree la Decisión Técnica DT-DETECCION-001 para agregar este ítem a la WBS?**

---

**FIN DEL DOCUMENTO**

**Fecha:** 15 de Octubre de 2025  
**Versión:** 1.0  
**Estado:** ⚠️ GAP IDENTIFICADO - Acción Requerida

