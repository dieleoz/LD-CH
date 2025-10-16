# ⚡ METODOLOGÍA ELÉCTRICA: AGRUPACIÓN POR NODOS Y CÁLCULO DE CARGAS

**Proyecto:** APP La Dorada-Chiriguaná  
**Especialidad:** Ingeniería Eléctrica  
**Fecha:** 15 de Octubre de 2025  
**Versión:** 1.0  
**Objetivo:** Metodología para agrupar equipos por nodos eléctricos y calcular cargas por punto de acometida  

---

## 🎯 CONCEPTO: ¿QUÉ ES UN "NODO ELÉCTRICO"?

### **Definición Técnica:**

Un **NODO ELÉCTRICO** (o **PUNTO 0**) es un **punto de acometida eléctrica** donde se agrupan varios equipos que comparten:

1. **Misma ubicación física** (PK similar, radio < 50m)
2. **Mismo tablero de distribución**
3. **Misma acometida de red** (o generación local)
4. **Mismo sistema de respaldo** (UPS, generador)

### **Analogía:**

```
Nodo Eléctrico = "Enchúster Principal" del que salen varios circuitos

Ejemplo: PN Tipo C (PK 215+250)
         │
    ┌────┴─────┐
    │ TABLERO  │ ← PUNTO 0 (Nodo Eléctrico)
    │  220V AC │
    └────┬─────┘
         │
    ┌────┴────────────────────────────────┐
    │                                     │
Circuito 1         Circuito 2         Circuito 3
(Barreras)         (Señalización)     (Control)
  300W                180W               500W
```

---

## 📋 TIPOS DE NODOS ELÉCTRICOS EN EL PROYECTO

### **Clasificación por Complejidad:**

| Tipo de Nodo | Cantidad | Carga Típica | Acometida | Respaldo |
|:---|:---:|:---:|:---|:---|
| **NODO TIPO 1: Estación ENCE** | 5 | 15-30 kW | MT (13.8 kV) | UPS 8h + Generador |
| **NODO TIPO 2: Torre TETRA** | 37 | 4-5 kW | BT (220V) | UPS 4h + Solar/Generador |
| **NODO TIPO 3: PN Tipo C** | 9 | 2-3 kW | BT (220V) | UPS 4h + Solar |
| **NODO TIPO 4: PN Tipo B** | 15 | 1-2 kW | BT (220V) | UPS 4h + Solar |
| **NODO TIPO 5: PN Tipo A** | 122 | **0 kW** | **SIN** | **SIN** |
| **NODO TIPO 6: CCO** | 1 | 50-75 kW | MT (13.8 kV) | UPS 8h + 2 Generadores |
| **NODO TIPO 7: Taller** | 2 | 100-150 kW | MT (13.8 kV) | UPS 4h + Generador |
| **TOTAL NODOS ACTIVOS** | **69 nodos** | | | |

---

## 🔌 METODOLOGÍA DE AGRUPACIÓN POR NODOS

### **PASO 1: IDENTIFICAR EQUIPOS EN LA MISMA UBICACIÓN (PK)**

**Herramienta:** Usar el **Layout Maestro** + **Export a Excel**

**Proceso:**
1. Exportar Layout a Excel
2. Ordenar por columna "PK"
3. Agrupar equipos con **mismo PK ± 100m**
4. Identificar nodos naturales

**Ejemplo práctico:**

```excel
PK          | Nombre Equipo           | Tipo Equipo      | Consumo
───────────────────────────────────────────────────────────────
215+250     | PN_001_BARRERA_1        | PN TIPO C        | 150W
215+250     | PN_001_BARRERA_2        | PN TIPO C        | 150W
215+250     | PN_001_PLC              | PN TIPO C        | 50W
215+250     | PN_001_UPS              | PN TIPO C        | 500W
215+250     | PN_001_LED_01           | PN TIPO C        | 20W
215+250     | PN_001_LED_02           | PN TIPO C        | 20W
215+250     | PN_001_LED_03           | PN TIPO C        | 20W
215+250     | PN_001_LED_04           | PN TIPO C        | 20W
215+250     | PN_001_SIRENA_1         | PN TIPO C        | 15W
215+250     | PN_001_SIRENA_2         | PN TIPO C        | 15W
215+250     | PN_001_CONTADOR_1       | PN TIPO C        | 50W
215+250     | PN_001_CONTADOR_2       | PN TIPO C        | 50W
215+280     | CCTV_PN_001             | CCTV             | 30W
───────────────────────────────────────────────────────────────
NODO ELÉCTRICO PN-001 → SUMA TOTAL = 1,090W ≈ 1.1 kW
```

**Agrupación:** Todos los equipos con PK 215+250 ±50m = **1 NODO**

---

### **PASO 2: CREAR FICHA DE NODO ELÉCTRICO**

**Plantilla por Nodo:**

```
═══════════════════════════════════════════════════════════════
  FICHA DE NODO ELÉCTRICO: [NOMBRE]
═══════════════════════════════════════════════════════════════

📍 UBICACIÓN:
├─ PK: [valor]
├─ Nombre: [identificador]
├─ Tipo de nodo: [TIPO 1-7]
├─ Coordenadas: [lat, lon]
└─ Accesibilidad: [fácil/moderado/difícil]

⚡ CARGAS INSTALADAS:
├─ Categoría A (Fuerza):        [XX] kW
├─ Categoría B (Iluminación):   [XX] kW
├─ Categoría C (Tomacorrientes):[XX] kW
├─ Categoría D (Climatización): [XX] kW
├─ Categoría E (UPS):           [XX] kVA
└─ TOTAL INSTALADA:             [XX] kW

📊 DEMANDA MÁXIMA:
├─ Factor de demanda (Fd):      [0.X]
├─ Factor de potencia (Fp):     [0.X]
├─ Demanda (kW):                [XX] kW
└─ Demanda (kVA):               [XX] kVA

🔋 SISTEMA DE RESPALDO:
├─ UPS:                         [XX] kVA, [Y] horas
├─ Generador:                   [XX] kVA (SÍ/NO)
├─ Solar:                       [XX] kW (SÍ/NO)
└─ Baterías:                    [XX] Ah, [YY] V

🔌 ACOMETIDA:
├─ Tipo:                        [BT/MT]
├─ Tensión:                     [220V/13.8kV]
├─ Fases:                       [1F/3F]
├─ Calibre conductor:           [AWG/MCM]
├─ Longitud:                    [metros]
└─ Protección:                  [breaker/fusible]

📋 EQUIPOS EN ESTE NODO:
[Listado detallado]

═══════════════════════════════════════════════════════════════
```

---

## ⚡ EJEMPLOS PRÁCTICOS: NODOS TIPO

### **EJEMPLO 1: NODO TIPO 3 - PN TIPO C (PK 215+250)**

```
═══════════════════════════════════════════════════════════════
  NODO ELÉCTRICO: PN-001 (La Dorada - Acceso Norte)
═══════════════════════════════════════════════════════════════

📍 UBICACIÓN:
├─ PK: 215+250
├─ Nombre: PN_001_LA_DORADA_NORTE
├─ Tipo de nodo: TIPO 3 (PN Tipo C - Barreras Automáticas)
├─ Coordenadas: [5.450°N, 74.660°W] (estimado)
└─ Accesibilidad: Fácil (acceso vial directo)

⚡ LISTADO DE CARGAS INSTALADAS:

┌─────────────────────────────────────────────────────────────┐
│ CIRCUITO 1: SISTEMA DE BARRERAS                            │
├─────────────────────────────────────────────────────────────┤
│ • Barrera automática 1 (motor 24V DC)        150W          │
│ • Barrera automática 2 (motor 24V DC)        150W          │
│ • Subtotal Barreras:                         300W          │
├─────────────────────────────────────────────────────────────┤
│ CIRCUITO 2: SEÑALIZACIÓN LUMINOSA Y ACÚSTICA               │
├─────────────────────────────────────────────────────────────┤
│ • Señal LED roja 1 (12V DC)                   20W          │
│ • Señal LED roja 2 (12V DC)                   20W          │
│ • Señal LED roja 3 (12V DC)                   20W          │
│ • Señal LED roja 4 (12V DC)                   20W          │
│ • Sirena acústica 1 (110 dB, 12V DC)          15W          │
│ • Sirena acústica 2 (110 dB, 12V DC)          15W          │
│ • Subtotal Señalización:                     110W          │
├─────────────────────────────────────────────────────────────┤
│ CIRCUITO 3: SISTEMA DE CONTROL Y DETECCIÓN                │
├─────────────────────────────────────────────────────────────┤
│ • Controlador PLC S7-1200 (24V DC)            50W          │
│ • Contador de ejes 1 (ADIF, 24V DC)           50W          │
│ • Contador de ejes 2 (ADIF, 24V DC)           50W          │
│ • Sistema detección vehículos (lazos)        100W          │
│ • Radar Doppler                               120W          │
│ • Subtotal Control:                          370W          │
├─────────────────────────────────────────────────────────────┤
│ CIRCUITO 4: SISTEMAS AUXILIARES                           │
├─────────────────────────────────────────────────────────────┤
│ • UPS Online 2kVA (cargador)                 500W          │
│ • Radio comunicación CTC                      50W          │
│ • Ventilación gabinete                        80W          │
│ • Iluminación LED gabinete                    20W          │
│ • Controlador MPPT (solar)                   100W          │
│ • Subtotal Auxiliares:                       750W          │
├─────────────────────────────────────────────────────────────┤
│ CIRCUITO 5: CCTV (OPCIONAL - si aplica)                   │
├─────────────────────────────────────────────────────────────┤
│ • Cámara IP PTZ 4MP                           30W          │
│ • Switch PoE 8 puertos                        15W          │
│ • Subtotal CCTV:                              45W          │
└─────────────────────────────────────────────────────────────┘

📊 RESUMEN DE CARGAS:

Carga Instalada Total:
├─ Barreras:           300W
├─ Señalización:       110W
├─ Control/Detección:  370W
├─ Auxiliares:         750W
├─ CCTV (opcional):     45W
└─ TOTAL INSTALADO:  1,575W ≈ 1.6 kW

Demanda Máxima Calculada:
├─ Factor de demanda (Fd):     0.80 (80%)
├─ Carga simultánea:           1.6 kW × 0.8 = 1.28 kW
├─ Factor de potencia (Fp):    0.90
├─ Demanda en kVA:             1.28 / 0.90 = 1.42 kVA
└─ Margen de seguridad (20%):  1.42 × 1.2 = 1.7 kVA

🔋 SISTEMA DE RESPALDO:

UPS Requerido:
├─ Capacidad nominal:          2 kVA (estándar comercial)
├─ Tensión salida:             220V AC / 24V DC
├─ Autonomía mínima:           4 horas
├─ Banco de baterías:          4 × 200Ah, 12V (48V sistema)
├─ Energía almacenada:         4 × 200 × 12 = 9,600 Wh ≈ 10 kWh
└─ Autonomía real:             10 kWh / 1.28 kW ≈ 7.8 horas ✅

Solar (Opcional/Remoto):
├─ Paneles:                    2 × 400W = 800W
├─ Horas sol efectivas:        5 h/día (promedio Colombia)
├─ Energía diaria:             800W × 5h = 4 kWh/día
├─ Consumo diario:             1.28 kW × 24h = 30.7 kWh/día
└─ Cobertura solar:            4 / 30.7 = 13% (complemento, no principal)

🔌 ACOMETIDA ELÉCTRICA:

Datos de Diseño:
├─ Tensión:                    220V AC, monofásica
├─ Corriente nominal:          1.7 kVA / 220V = 7.7 A
├─ Corriente de diseño (1.25): 7.7 × 1.25 = 9.6 A
├─ Breaker principal:          2 × 15A (NTC 2050)
├─ Calibre conductor:          #12 AWG THHN/THWN (20A)
├─ Longitud desde red:         [Variable según ubicación]
├─ Caída de tensión máx:       3% (NTC 2050)
└─ Ducto/canalización:         PVC 1" (3 conductores #12)

📋 TABLERO DE DISTRIBUCIÓN:

Configuración:
├─ Tipo:                       NEMA 3R (intemperie)
├─ Dimensiones:                400 × 300 × 200 mm
├─ Breaker principal:          2 × 15A
├─ Breakers ramales:           6 circuitos
│   ├─ C1: Barreras (2×10A)
│   ├─ C2: Señalización (1×15A)
│   ├─ C3: Control (1×15A)
│   ├─ C4: UPS (1×15A)
│   ├─ C5: CCTV (1×10A)
│   └─ C6: Reserva (1×10A)
└─ Puesta a tierra:            <25 Ohms

═══════════════════════════════════════════════════════════════
```

---

### **EJEMPLO 2: NODO TIPO 2 - TORRE TETRA (PK 215+936)**

```
═══════════════════════════════════════════════════════════════
  NODO ELÉCTRICO: EBT-02 (Torre TETRA Intermedia)
═══════════════════════════════════════════════════════════════

📍 UBICACIÓN:
├─ PK: 215+936
├─ Nombre: EBT_02_TORRE_TETRA
├─ Tipo de nodo: TIPO 2 (Torre Comunicaciones)
├─ Altura torre: 40 metros
└─ Accesibilidad: Moderada

⚡ LISTADO DE CARGAS INSTALADAS:

┌─────────────────────────────────────────────────────────────┐
│ CIRCUITO 1: EQUIPOS TETRA                                  │
├─────────────────────────────────────────────────────────────┤
│ • Estación Base TETRA (220V AC)              500W          │
│ • Antenas TETRA (3 sectores)                  50W          │
│ • Duplexers y combinadores                    30W          │
│ • Subtotal TETRA:                            580W          │
├─────────────────────────────────────────────────────────────┤
│ CIRCUITO 2: EQUIPOS GSM-R                                 │
├─────────────────────────────────────────────────────────────┤
│ • Estación Base GSM-R (220V AC)              300W          │
│ • Antenas GSM-R (3 sectores)                  30W          │
│ • Combinadores GSM-R                          20W          │
│ • Subtotal GSM-R:                            350W          │
├─────────────────────────────────────────────────────────────┤
│ CIRCUITO 3: TRANSMISIÓN (FIBRA/MICROONDAS)                │
├─────────────────────────────────────────────────────────────┤
│ • Switch Ethernet 1 Gbps                     100W          │
│ • Router de borde                             80W          │
│ • Radio microondas 1 (backup fibra)          150W          │
│ • Radio microondas 2 (redundancia)           150W          │
│ • Subtotal Transmisión:                      480W          │
├─────────────────────────────────────────────────────────────┤
│ CIRCUITO 4: CLIMATIZACIÓN                                 │
├─────────────────────────────────────────────────────────────┤
│ • Aire acondicionado 1 (inverter 3 kW)     3,000W          │
│ • Aire acondicionado 2 (redundancia)       3,000W          │
│ • Ventiladores extracción (2 unidades)       200W          │
│ • Subtotal Climatización:                  6,200W          │
├─────────────────────────────────────────────────────────────┤
│ CIRCUITO 5: AUXILIARES                                    │
├─────────────────────────────────────────────────────────────┤
│ • Iluminación caseta (LED)                    80W          │
│ • Iluminación torre (balizamiento)           100W          │
│ • Sistema monitoreo y alarmas                 50W          │
│ • Control de acceso electrónico               30W          │
│ • Detección de incendio                       20W          │
│ • UPS 3 kVA (cargador)                       500W          │
│ • Subtotal Auxiliares:                       780W          │
└─────────────────────────────────────────────────────────────┘

📊 RESUMEN DE CARGAS:

Carga Instalada Total:
├─ TETRA:              580W
├─ GSM-R:              350W
├─ Transmisión:        480W
├─ Climatización:    6,200W
├─ Auxiliares:         780W
└─ TOTAL INSTALADO:  8,390W ≈ 8.4 kW

Demanda Máxima Calculada:
├─ Factor de demanda:
│   ├─ Equipos telecomunicaciones: Fd = 1.0 (100% simultáneo)
│   ├─ Climatización: Fd = 0.8 (80% simultáneo por redundancia)
│   └─ Auxiliares: Fd = 0.7 (70% promedio)
│
├─ Cálculo demanda:
│   ├─ Telecom: (580 + 350 + 480) × 1.0 = 1,410W
│   ├─ Clima: 6,200 × 0.8 = 4,960W
│   └─ Auxiliares: 780 × 0.7 = 546W
│
├─ Demanda total (kW):         1.41 + 4.96 + 0.55 = 6.92 kW
├─ Factor de potencia (Fp):    0.85
├─ Demanda (kVA):              6.92 / 0.85 = 8.14 kVA
└─ Margen seguridad (15%):     8.14 × 1.15 = 9.4 kVA

🔋 SISTEMA DE RESPALDO:

UPS:
├─ Capacidad:                  10 kVA (estándar comercial)
├─ Tipo:                       Online (doble conversión)
├─ Tensión entrada:            220V AC (monofásica)
├─ Tensión salida:             220V AC + 48V DC
├─ Autonomía objetivo:         4 horas mínimo
├─ Banco de baterías:          48V, 400 Ah VRLA
├─ Energía almacenada:         48V × 400Ah = 19.2 kWh
└─ Autonomía real:             19.2 kWh / 6.92 kW ≈ 2.8 horas
                                ⚠️ Requiere ampliar a 600 Ah para 4h

Generador (Sitios remotos sin red confiable):
├─ Capacidad:                  15 kVA (si aplica)
├─ Combustible:                Diésel
├─ Autonomía:                  24 horas (tanque 50 litros)
└─ Arranque:                   Automático (ATS)

Solar (Opcional):
├─ Paneles:                    NO (carga muy alta para solar)
├─ Alternativa:                Red eléctrica + UPS + Generador

🔌 ACOMETIDA ELÉCTRICA:

Diseño Acometida:
├─ Tipo:                       Baja Tensión (BT)
├─ Tensión:                    220V AC, monofásica
├─ Corriente nominal:          9.4 kVA / 220V = 42.7 A
├─ Corriente de diseño:        42.7 × 1.25 = 53.4 A
├─ Breaker principal:          2 × 60A (estándar NTC 2050)
├─ Calibre conductor:          #6 AWG THHN/THWN (65A, 75°C)
├─ Longitud estimada:          150 metros (desde subestación o red)
├─ Caída de tensión:
│   ├─ ΔV = 2 × L × I / (σ × S)
│   ├─ ΔV = 2 × 150 × 53.4 / (56 × 13.3) = 21.5V
│   ├─ ΔV% = 21.5 / 220 = 9.8% ⚠️ EXCEDE 3%
│   └─ Solución: Aumentar a #4 AWG (S = 21.15 mm²)
│       ΔV = 2 × 150 × 53.4 / (56 × 21.15) = 13.5V = 6.1% ⚠️
│       Solución: Aumentar a #2 AWG (S = 33.6 mm²)
│       ΔV = 2 × 150 × 53.4 / (56 × 33.6) = 8.5V = 3.9% ⚠️
│       Solución FINAL: #1 AWG (S = 42.4 mm²)
│       ΔV = 2 × 150 × 53.4 / (56 × 42.4) = 6.7V = 3.05% ⚠️
│       O MEJOR: #1/0 AWG (S = 53.5 mm²)
│       ΔV = 2 × 150 × 53.4 / (56 × 53.5) = 5.3V = 2.4% ✅
│
├─ Conductor seleccionado:     #1/0 AWG (3 × #1/0 + 1 × #4 tierra)
├─ Ducto/canalización:         PVC 2" (4 conductores)
└─ Protección:                 Breaker 2×60A (principal) + DPS

📋 EQUIPOS EN ESTE NODO (13 equipos):

│ ID │ Equipo                    │ Consumo │ Tensión │ Circuito │
├────┼───────────────────────────┼─────────┼─────────┼──────────┤
│ 01 │ Estación Base TETRA       │ 500W    │ 220V AC │ C1       │
│ 02 │ Estación Base GSM-R       │ 300W    │ 220V AC │ C2       │
│ 03 │ Switch Ethernet           │ 100W    │ 220V AC │ C3       │
│ 04 │ Router                    │  80W    │ 220V AC │ C3       │
│ 05 │ Radio microondas 1        │ 150W    │ 220V AC │ C3       │
│ 06 │ Radio microondas 2        │ 150W    │ 220V AC │ C3       │
│ 07 │ AC inverter 1             │ 3,000W  │ 220V AC │ C4       │
│ 08 │ AC inverter 2             │ 3,000W  │ 220V AC │ C4       │
│ 09 │ UPS 3 kVA                 │ 500W    │ 220V AC │ C5       │
│ 10 │ Iluminación LED           │  80W    │ 220V AC │ C5       │
│ 11 │ Sistemas monitoreo        │  50W    │ 24V DC  │ C5       │
│ 12 │ Control acceso            │  30W    │ 24V DC  │ C5       │
│ 13 │ Detección incendio        │  20W    │ 24V DC  │ C5       │

💰 COSTO ESTIMADO NODO:

Equipos (de WBS):              Incluido en ítems 2.1.XXX
Acometida eléctrica:           $25.000.000 COP
├─ Conductor #1/0 × 150m:      $12.000.000
├─ Ducto PVC 2" × 150m:        $3.000.000
├─ Excavación/relleno:         $4.000.000
├─ Tablero 60A:                $3.000.000
└─ Instalación/pruebas:        $3.000.000

Sistema de respaldo:           Incluido en ítems 2.1.XXX
Puesta a tierra:               $8.000.000 COP
├─ Malla de tierra:            $4.000.000
├─ Electrodos:                 $2.000.000
└─ Instalación/medición:       $2.000.000

TOTAL INFRAESTRUCTURA ELÉCTRICA NODO: $33.000.000 COP

═══════════════════════════════════════════════════════════════
```

---

### **EJEMPLO 3: NODO TIPO 1 - ESTACIÓN ENCE (PK 201+470)**

```
═══════════════════════════════════════════════════════════════
  NODO ELÉCTRICO: ENCE-1 (La Dorada-México)
═══════════════════════════════════════════════════════════════

📍 UBICACIÓN:
├─ PK: 201+470
├─ Nombre: ENCE_LA_DORADA_MEXICO
├─ Tipo de nodo: TIPO 1 (Estación ENCE - Alto consumo)
├─ Área caseta: 30 m² (6m × 5m × 2.8m altura)
└─ Accesibilidad: Fácil (estación principal)

⚡ LISTADO DE CARGAS INSTALADAS:

┌─────────────────────────────────────────────────────────────┐
│ CIRCUITO 1: SISTEMA ENCE (CRÍTICO - SIL-4)                │
├─────────────────────────────────────────────────────────────┤
│ • Controlador Interlocking (2OO3)          2,000W          │
│ • Servidores locales (2 unidades)          1,000W          │
│ • HMI/Paneles control (2 estaciones)         400W          │
│ • Módulos I/O (4 racks)                      600W          │
│ • Switches de red (redundantes)              200W          │
│ • Subtotal ENCE:                           4,200W          │
├─────────────────────────────────────────────────────────────┤
│ CIRCUITO 2: DETECCIÓN DE TRENES                           │
├─────────────────────────────────────────────────────────────┤
│ • Contadores de ejes (10 unidades)           500W          │
│ • Controladores de detección (5 unidades)    150W          │
│ • Subtotal Detección:                        650W          │
├─────────────────────────────────────────────────────────────┤
│ CIRCUITO 3: DESVÍOS MOTORIZADOS (6 unidades)              │
├─────────────────────────────────────────────────────────────┤
│ • Desvío 1 (3 kW × 5 seg operación)        3,000W          │
│ • Desvío 2                                 3,000W          │
│ • Desvío 3                                 3,000W          │
│ • Desvío 4                                 3,000W          │
│ • Desvío 5                                 3,000W          │
│ • Desvío 6                                 3,000W          │
│ • Controladores desvíos (en reposo)          100W          │
│ • Subtotal Desvíos:                       18,100W (op)
│                                               100W (reposo) │
├─────────────────────────────────────────────────────────────┤
│ CIRCUITO 4: SEÑALIZACIÓN LUMINOSA                         │
├─────────────────────────────────────────────────────────────┤
│ • Semáforo entrada (LED rojo/verde)          600W          │
│ • Semáforo salida (LED rojo/verde)           600W          │
│ • Subtotal Señalización:                   1,200W          │
├─────────────────────────────────────────────────────────────┤
│ CIRCUITO 5: COMUNICACIONES                                │
├─────────────────────────────────────────────────────────────┤
│ • Interface CTC (protocolo SCI-CC-A)         200W          │
│ • Radio TETRA local                          100W          │
│ • Switch fibra óptica                        100W          │
│ • Router redundante                          200W          │
│ • Subtotal Comunicaciones:                   600W          │
├─────────────────────────────────────────────────────────────┤
│ CIRCUITO 6: CLIMATIZACIÓN CASETA                          │
├─────────────────────────────────────────────────────────────┤
│ • AC inverter 1 (3 kW, redundante)         3,000W          │
│ • AC inverter 2 (3 kW, redundante)         3,000W          │
│ • Ventilación forzada                        200W          │
│ • Subtotal Climatización:                  6,200W          │
├─────────────────────────────────────────────────────────────┤
│ CIRCUITO 7: SISTEMAS AUXILIARES                           │
├─────────────────────────────────────────────────────────────┤
│ • Iluminación caseta (LED)                   200W          │
│ • UPS 5 kVA (cargador baterías)            1,000W          │
│ • Detección incendio                          50W          │
│ • Control de acceso                           50W          │
│ • CCTV (1 cámara local)                       30W          │
│ • Subtotal Auxiliares:                     1,330W          │
└─────────────────────────────────────────────────────────────┘

📊 RESUMEN DE CARGAS:

Carga Instalada Total (OPERACIÓN):
├─ ENCE:                 4,200W
├─ Detección:              650W
├─ Desvíos (operación): 18,100W ← Solo 5 segundos cada 10-15 min
├─ Señalización:         1,200W
├─ Comunicaciones:         600W
├─ Climatización:        6,200W
├─ Auxiliares:           1,330W
└─ TOTAL PICO:          32,280W ≈ 32.3 kW

Carga Instalada Total (REPOSO - sin operar desvíos):
├─ ENCE:                 4,200W
├─ Detección:              650W
├─ Desvíos (reposo):       100W ← Solo controladores
├─ Señalización:         1,200W
├─ Comunicaciones:         600W
├─ Climatización:        6,200W
├─ Auxiliares:           1,330W
└─ TOTAL REPOSO:        14,280W ≈ 14.3 kW

Demanda Máxima Calculada:
├─ Escenario 1 (Operación desvíos):
│   ├─ Factor de simultaneidad desvíos:   0.3 (30% - max 2 de 6 simultáneos)
│   ├─ Desvíos: 18.1 × 0.3 = 5.43 kW
│   ├─ Resto sistemas: 14.18 kW × 1.0
│   ├─ Demanda total: 5.43 + 14.18 = 19.61 kW
│   └─ Con margen 20%: 19.61 × 1.2 = 23.5 kW
│
├─ Escenario 2 (Reposo):
│   ├─ Demanda: 14.3 kW
│   └─ Con margen 20%: 14.3 × 1.2 = 17.2 kW
│
├─ Demanda de diseño:          23.5 kW (escenario crítico)
├─ Factor de potencia:         0.90
├─ Demanda en kVA:             23.5 / 0.9 = 26.1 kVA
└─ Transformador requerido:    30 kVA (estándar comercial)

🔋 SISTEMA DE RESPALDO:

UPS:
├─ Capacidad:                  30 kVA (triplicada, online)
├─ Tensión entrada:            220V AC
├─ Tensión salidas:            220V AC + 48V DC
├─ Autonomía objetivo:         8 horas (ENCE es crítico)
├─ Banco de baterías:          48V, 800 Ah VRLA (2 bancos de 400Ah)
├─ Energía almacenada:         48V × 800Ah = 38.4 kWh
├─ Autonomía real (reposo):    38.4 kWh / 14.3 kW ≈ 2.7 horas ⚠️
└─ Baterías requeridas:        48V, 2,400 Ah (3 bancos) para 8h
                                38.4 × 3 = 115.2 kWh / 14.3 = 8.1 horas ✅

Generador:
├─ Capacidad:                  50 kVA
├─ Combustible:                Diésel
├─ Tanque:                     200 litros (48h autonomía)
├─ Arranque:                   Automático (ATS < 10 seg)
└─ Función:                    Respaldo de UPS (carga baterías + alimenta directa)

🔌 ACOMETIDA ELÉCTRICA:

Opción A: Acometida BT (si red disponible cercana):
├─ Tensión:                    220V AC, monofásica
├─ Corriente:                  26.1 kVA / 220V = 118.6 A
├─ Breaker:                    2 × 150A
├─ Conductor:                  #2/0 AWG (3 × #2/0 + 1 × #2 tierra)
├─ Longitud máxima:            50 metros (ΔV < 3%)
└─ Problema:                   Alta corriente, caída de tensión crítica

Opción B: Acometida MT (RECOMENDADO para estaciones ENCE):
├─ Tensión:                    13.8 kV (Media Tensión)
├─ Transformador local:        30 kVA, 13.8kV/220V
├─ Corriente MT:               26.1 kVA / 13.8 kV = 1.9 A
├─ Breaker MT:                 15 A (fusibles)
├─ Conductor MT:               #2 AWG (baja corriente)
├─ Longitud máxima:            2,000 metros (ΔV < 3%)
├─ Ventaja:                    Menor caída, mayor distancia
└─ Costo adicional:            Transformador ($15M) + celda MT ($25M)

Selección FINAL:
├─ Tipo:                       **Media Tensión (13.8 kV)**
├─ Transformador:              30 kVA, 13.8kV/220V, padmounted
├─ Breaker MT:                 3 × 15A (fusibles)
├─ Conductor MT:               3 × #2 AWG + neutro
├─ Tablero BT:                 220V, 2 × 150A
└─ Costo total acometida:      $45.000.000 COP

═══════════════════════════════════════════════════════════════
```

---

## 📊 TABLA MAESTRA: AGRUPACIÓN POR NODOS

### **Resumen de 69 Nodos Activos:**

| Tipo Nodo | Nombre | Cantidad | Carga/Nodo | Carga Total | Acometida | Respaldo |
|:---|:---|:---:|:---:|:---:|:---|:---|
| **TIPO 1** | Estación ENCE | 5 | 15-30 kW | 120 kW | MT 13.8kV | UPS 8h + Gen 50kVA |
| **TIPO 2** | Torre TETRA | 37 | 4-9 kW | 296 kW | BT 220V | UPS 4h + Gen/Solar |
| **TIPO 3** | PN Tipo C | 9 | 1.5-2.5 kW | 18 kW | BT 220V | UPS 4h + Solar |
| **TIPO 4** | PN Tipo B | 15 | 1-1.5 kW | 18 kW | BT 220V | UPS 4h + Solar |
| **TIPO 5** | PN Tipo A | 122 | **0 kW** | **0 kW** | **SIN** | **SIN** |
| **TIPO 6** | CCO | 1 | 50-75 kW | 75 kW | MT 13.8kV | UPS 8h + 2×Gen |
| **TIPO 7** | Taller | 2 | 100-150 kW | 300 kW | MT 13.8kV | UPS 4h + Gen |
| **TOTAL ACTIVOS** | | **69** | | **827 kW** | | |

---

## 🔧 METODOLOGÍA DE REVISIÓN PARA ESPECIALISTA ELÉCTRICO

### **PASO 1: EXPORTAR LAYOUT A EXCEL**

1. Abrir `WBS_Layout_Maestro.html`
2. Click "📊 Exportar Excel"
3. Abrir Excel descargado

### **PASO 2: CREAR COLUMNA "NODO ELÉCTRICO"**

En Excel:
```
1. Agregar columna "Nodo Eléctrico"
2. Fórmula de agrupación por PK:
   =SI(tipo_equipo="TETRA", "EBT-"&NUMERO_CORRELATIVO, 
      SI(tipo_equipo="CONTROL", "ENCE-"&ESTACION,
      SI(dispositivo CONTIENE "PN", "PN-"&NUMERO)))
```

### **PASO 3: CREAR TABLA DINÁMICA**

```
Filas: Nodo Eléctrico
Valores: SUMA de Consumo (kW)
Filtros: Tipo de Equipo, UFV
```

### **PASO 4: AGRUPAR EQUIPOS POR NODO**

**Criterio de agrupación:**

| Condición | Acción |
|:---|:---|
| **PK exactamente igual** | Mismo nodo ✅ |
| **PK ± 50m** | Mismo nodo ✅ (equipos cercanos) |
| **PK ± 100m** | ⚠️ Evaluar (puede ser mismo o separado) |
| **PK > 200m** | Nodos separados ❌ |

**Excepciones:**
- **CCTV en PN:** Puede estar PK ± 30m del PN (para mejor ángulo), pero **mismo nodo eléctrico**
- **Cajas fibra:** NO son nodos eléctricos (pasivas)
- **Domos fusión:** Pueden tener iluminación LED (5W), despreciable

---

## 📋 FICHA TIPO POR NODO (Template Excel)

### **Columnas recomendadas para análisis eléctrico:**

| Columna | Descripción | Ejemplo |
|:---|:---|:---|
| **Nodo_ID** | Identificador único del nodo | EBT-02, PN-001, ENCE-3 |
| **Tipo_Nodo** | Clasificación 1-7 | TIPO 2 (Torre TETRA) |
| **PK** | Punto kilométrico | 215+936 |
| **Carga_Instalada_kW** | Suma de consumos | 8.4 kW |
| **Factor_Demanda** | Fd según NTC 2050 | 0.80 |
| **Demanda_kW** | Carga × Fd | 6.72 kW |
| **Demanda_kVA** | Demanda / Fp | 7.91 kVA |
| **Tipo_Acometida** | BT o MT | BT 220V |
| **Transformador_kVA** | Si MT | 15 kVA |
| **Breaker_Principal** | Protección | 2×60A |
| **Conductor_Acometida** | Calibre | #1/0 AWG |
| **Longitud_Acometida_m** | Distancia a red | 150m |
| **UPS_kVA** | Capacidad UPS | 10 kVA |
| **Autonomía_h** | Horas de respaldo | 4h |
| **Generador_kVA** | Si tiene (SÍ/NO) | 15 kVA |
| **Solar_kW** | Si tiene (SÍ/NO) | NO |
| **Costo_Acometida_COP** | Estimado | $33.000.000 |

---

## 🧮 CÁLCULO DE CARGAS POR NODO

### **Factores de Demanda (según NTC 2050 y experiencia ferroviaria):**

| Tipo de Carga | Factor Demanda (Fd) | Justificación |
|:---|:---:|:---|
| **Iluminación** | 1.00 | 100% simultánea |
| **Tomacorrientes** | 0.70 | 70% simultánea |
| **Climatización** | 0.80 | 80% por redundancia (1 de 2 operando) |
| **Equipos telecomunicaciones** | 1.00 | 100% simultánea (crítico) |
| **Equipos de control (ENCE, CTC)** | 1.00 | 100% simultánea (crítico) |
| **Desvíos motorizados** | 0.30 | 30% simultánea (máx 2 de 6 operando) |
| **UPS (cargador)** | 1.00 | 100% (carga continua) |
| **Señalización LED** | 1.00 | 100% (siempre encendida) |

### **Fórmula General:**

```
Demanda_kW = Σ (Carga_i × Fd_i)
Demanda_kVA = Demanda_kW / Fp
Capacidad_Diseño_kVA = Demanda_kVA × Margen_Seguridad

Donde:
├─ Carga_i: Potencia instalada del equipo i (kW)
├─ Fd_i: Factor de demanda del equipo i
├─ Fp: Factor de potencia (típico 0.85-0.90)
└─ Margen_Seguridad: 1.15 a 1.25 (15-25%)
```

---

## 🎯 CASOS PRÁCTICOS DE NODOS COMPLEJOS

### **CASO 1: PN TIPO C CON CÁMARA CCTV**

**Ubicación:** PK 215+250 (PN-001)

**Equipos en el nodo:**
```
PUNTO 0: Tablero PN-001 (220V AC)
│
├─ Sistema PN Tipo C:          1,090W
│   ├─ 2 Barreras
│   ├─ 4 Señales LED
│   ├─ 2 Sirenas
│   ├─ PLC
│   ├─ 2 Contadores ejes
│   ├─ Detección vehículos
│   └─ UPS 2kVA
│
├─ CCTV (PK 215+280 ±30m):       45W
│   ├─ Cámara IP PTZ
│   └─ Switch PoE
│
└─ TOTAL NODO:                1,135W ≈ 1.15 kW
```

**¿Mismo nodo o separado?**

✅ **MISMO NODO** porque:
- Distancia < 50m (215+250 vs 215+280)
- Funcionalidad relacionada (CCTV vigila el PN)
- Carga pequeña (45W adicional, despreciable)
- Economía: 1 acometida vs 2

**Diseño:**
```
Demanda total:                 1.15 kW
Factor demanda:                1.0 (todo simultáneo)
Factor potencia:               0.90
Demanda kVA:                   1.15 / 0.9 = 1.28 kVA
Margen 20%:                    1.28 × 1.2 = 1.54 kVA

Acometida:
├─ Tensión:                    220V AC, monofásica
├─ Breaker:                    2 × 15A
├─ Conductor:                  #12 AWG
└─ UPS:                        2 kVA (suficiente para todo)
```

---

### **CASO 2: TORRE TETRA CERCANA A SUBESTACIÓN**

**Ubicación:** PK 201+500 (cerca de Estación La Dorada)

**Equipos:**
```
Torre EBT-01 (PK 201+470):     8.4 kW
Subestación (PK 201+500):      Distribuye energía (no consume)
Estación ENCE (PK 201+470):    23.5 kW
```

**¿Mismo nodo?**

❌ **NODOS SEPARADOS** porque:
- Cargas muy diferentes (8.4 kW vs 23.5 kW)
- Funciones independientes (Torre vs Estación)
- Criticidad diferente (ENCE es SIL-4, Torre es alta pero no crítica)
- Facilita mantenimiento independiente

**Pero conectados a misma subestación:**
```
Subestación La Dorada (PK 201+500):
│
├─ Salida 1: ENCE La Dorada (transformador 30 kVA)
├─ Salida 2: Torre EBT-01 (transformador 15 kVA)
├─ Salida 3: Iluminación estación (10 kVA)
└─ Salida 4: Reserva (15 kVA)

Total subestación: 70 kVA
```

---

### **CASO 3: EDIFICACIÓN COMPLEJA (CCO Barrancabermeja)**

**Ubicación:** PK 441+932

**Equipos en ubicación:**
```
CCO (300 m²):                  52.5 kW
├─ Sala Control CTC:           22.5 kW
├─ Sala Servidores:            15.0 kW
├─ Climatización:              10.0 kW
└─ Auxiliares:                  5.0 kW

Estación ENCE-3:               30.0 kW

Torre EBT-30 (colocalizada):    8.4 kW

TOTAL UBICACIÓN:               90.9 kW
```

**Estrategia de nodos:**

```
OPCIÓN A: Un solo nodo (NO RECOMENDADO)
└─ Problemas: Sobrecarga, falla total si cae

OPCIÓN B: Tres nodos independientes (RECOMENDADO)
├─ NODO 1: CCO (52.5 kW) → Transformador 75 kVA
├─ NODO 2: ENCE-3 (30 kW) → Transformador 50 kVA
└─ NODO 3: Torre EBT-30 (8.4 kW) → Transformador 15 kVA

Ventajas:
✅ Redundancia (falla uno, no caen todos)
✅ Mantenimiento independiente
✅ Protecciones selectivas
✅ Criticidad diferenciada (CCO y ENCE SIL-4)
```

**Alimentación recomendada:**

```
Subestación Barrancabermeja (PK 441+932):
├─ Capacidad total:            150 kVA
├─ Transformador 1:            75 kVA (CCO)
├─ Transformador 2:            50 kVA (ENCE-3)
├─ Transformador 3:            15 kVA (Torre)
├─ Reserva:                    10 kVA
│
├─ Doble acometida MT:         13.8 kV (redundancia)
│   ├─ Alimentador 1:          Desde red pública
│   └─ Alimentador 2:          Desde otra subestación
│
└─ Sistema de respaldo total:
    ├─ UPS CCO:                100 kVA (8h)
    ├─ UPS ENCE:               50 kVA (8h)
    ├─ UPS Torre:              10 kVA (4h)
    ├─ Generador 1:            150 kVA (principal)
    ├─ Generador 2:            150 kVA (respaldo)
    └─ ATS automático:         Transferencia < 100ms
```

---

## 📊 HOJA DE CÁLCULO RECOMENDADA

### **Template Excel para Especialista Eléctrico:**

```
HOJA 1: INVENTARIO DE NODOS
───────────────────────────────────────────────────────────────
Nodo_ID | Tipo | PK | UFV | Carga_kW | Demanda_kVA | Acometida | Transformador
EBT-01  | 2    | 201+470 | UFV23 | 8.4 | 9.4 | BT 220V | NO
EBT-02  | 2    | 215+936 | UFV23 | 8.4 | 9.4 | BT 220V | NO
...
ENCE-1  | 1    | 201+470 | UFV23 | 23.5 | 26.1 | MT 13.8kV | 30 kVA
PN-001  | 3    | 215+250 | UFV23 | 1.15 | 1.54 | BT 220V | NO
...

HOJA 2: DETALLE POR NODO (1 fila = 1 equipo)
───────────────────────────────────────────────────────────────
Nodo_ID | Equipo | Consumo_W | Tensión | Fd | Demanda_W | Circuito
EBT-02  | Estación TETRA | 500 | 220V AC | 1.0 | 500 | C1
EBT-02  | AC inverter 1 | 3000 | 220V AC | 0.8 | 2400 | C4
EBT-02  | AC inverter 2 | 3000 | 220V AC | 0.8 | 2400 | C4
...

HOJA 3: RESUMEN POR TIPO DE NODO
───────────────────────────────────────────────────────────────
Tipo | Cantidad | Carga_Total_kW | Demanda_Total_kVA | Costo_Prom_Acometida
1    | 5        | 120           | 140               | $45M
2    | 37       | 296           | 350               | $33M
3    | 9        | 18            | 21                | $28M
...

HOJA 4: SUBESTACIONES (Agrupación superior)
───────────────────────────────────────────────────────────────
Subestación | PK | Nodos_Servidos | Demanda_Total_kVA | Transformador
La Dorada   | 201+500 | EBT-01, ENCE-1, PN-001, PN-010 | 70 kVA | 100 kVA
...
```

---

## 🔍 REVISIÓN SISTEMÁTICA POR ESPECIALISTA ELÉCTRICO

### **CHECKLIST DE REVISIÓN:**

#### **A) VERIFICAR AGRUPACIÓN DE NODOS:**

- [ ] ¿Todos los equipos tienen asignado un nodo?
- [ ] ¿Los equipos del mismo PK están en el mismo nodo?
- [ ] ¿Los nodos están a distancia razonable de subestación?
- [ ] ¿Hay equipos "huérfanos" sin nodo asignado?

#### **B) VERIFICAR CÁLCULO DE CARGAS:**

- [ ] ¿Se usó factor de demanda correcto?
- [ ] ¿Se consideró factor de potencia?
- [ ] ¿Se agregó margen de seguridad (15-25%)?
- [ ] ¿Cargas de desvíos consideran simultaneidad (no todos a la vez)?

#### **C) VERIFICAR SISTEMAS DE RESPALDO:**

- [ ] ¿UPS tiene capacidad suficiente para demanda del nodo?
- [ ] ¿Autonomía de baterías cumple requisito (4h o 8h)?
- [ ] ¿Generador (si aplica) tiene capacidad para demanda + margen?
- [ ] ¿Sistema solar (si aplica) es complemento o principal?

#### **D) VERIFICAR ACOMETIDAS:**

- [ ] ¿Tensión de acometida es adecuada (BT o MT)?
- [ ] ¿Conductor cumple capacidad de corriente?
- [ ] ¿Caída de tensión < 3% (NTC 2050)?
- [ ] ¿Protecciones (breakers) coordinados?

---

## 💡 CRITERIOS DE DECISIÓN: BT vs MT

### **¿Cuándo usar Baja Tensión (220V)?**

✅ **BT si:**
- Demanda < 10 kVA
- Distancia a red < 100m
- Carga no crítica (puede tolerar interrupciones breves)
- Ejemplos: Torres TETRA, PN Tipo C/B

### **¿Cuándo usar Media Tensión (13.8 kV)?**

✅ **MT si:**
- Demanda > 15 kVA
- Distancia a red > 100m
- Carga crítica (SIL-4, disponibilidad 99.95%)
- Necesita transformador dedicado
- Ejemplos: Estaciones ENCE, CCO, Talleres

---

## 📊 EJEMPLO COMPLETO: ANÁLISIS DE 9 PN TIPO C

### **Tabla de Nodos PN Tipo C:**

| Nodo | PK | UFV | Base (PN) | CCTV | Carga Total | Demanda | Acometida | Costo |
|:---|:---:|:---:|:---:|:---:|:---:|:---:|:---|:---:|
| **PN-001** | 215+250 | UFV23 | 1,090W | 45W | 1,135W | 1.54 kVA | BT 220V | $28M |
| **PN-002** | 350+180 | UFV03 | 1,090W | 45W | 1,135W | 1.54 kVA | BT 220V | $28M |
| **PN-003** | 441+920 | UFV40 | 1,090W | 45W | 1,135W | 1.54 kVA | BT 220V | $28M |
| **PN-004** | 490+450 | UFV45 | 1,090W | 45W | 1,135W | 1.54 kVA | BT 220V | $28M |
| **PN-005** | 540+300 | UFV47 | 1,090W | 45W | 1,135W | 1.54 kVA | BT 220V | $28M |
| **PN-006** | 590+180 | UFV50 | 1,090W | 45W | 1,135W | 1.54 kVA | BT 220V | $28M |
| **PN-007** | 630+650 | UFV53 | 1,090W | 45W | 1,135W | 1.54 kVA | BT 220V | $28M |
| **PN-008** | 670+200 | UFV54 | 1,090W | 45W | 1,135W | 1.54 kVA | BT 220V | $28M |
| **PN-009** | 720+150 | UFV56 | 1,090W | 45W | 1,135W | 1.54 kVA | BT 220V | $28M |
| **TOTAL** | **9 nodos** | | | | **10.2 kW** | **13.9 kVA** | | **$252M** |

**Observaciones:**
- ✅ Todos los PN Tipo C tienen carga similar (~1.15 kW)
- ✅ Diseño eléctrico repetible (economía de escala)
- ✅ Acometida BT suficiente para todos
- ✅ UPS 2 kVA estándar para todos

---

## 🗺️ MAPA DE NODOS POR TRAMO

### **Distribución de Nodos en Corredor (520.78 km):**

```
PK 201+470 ═══════════════════════════════════════════ PK 722+250
│                    520.78 km                              │
│                                                            │
├─ ZONA 1: La Dorada - Puerto Berrío (114 km)              │
│  ├─ ENCE-1 (201+470): 26.1 kVA                           │
│  ├─ PN-001 (215+250): 1.54 kVA                           │
│  ├─ EBT-01 (201+470): 9.4 kVA                            │
│  ├─ EBT-02 (215+936): 9.4 kVA                            │
│  ├─ EBT-03 (230+402): 9.4 kVA                            │
│  └─ ...                                                   │
│  SUBTOTAL ZONA 1: ~150 kVA en 15 nodos                   │
│                                                            │
├─ ZONA 2: Puerto Berrío - Barrancabermeja (127 km)        │
│  ├─ ENCE-2 (~315): 23 kVA                                │
│  ├─ PN-002 (350+180): 1.54 kVA                           │
│  ├─ EBT-... (múltiples torres)                           │
│  └─ ...                                                   │
│  SUBTOTAL ZONA 2: ~180 kVA en 18 nodos                   │
│                                                            │
├─ ZONA 3: Barrancabermeja - Chiriguaná (280 km)           │
│  ├─ CCO + ENCE-3 (441+932): 52.5 + 26.1 = 78.6 kVA      │
│  ├─ ENCE-4 (462+520): 23 kVA                             │
│  ├─ ENCE-5 (722+250): 26.1 kVA                           │
│  ├─ Torres TETRA (22 torres × 9.4 kVA): 206.8 kVA        │
│  ├─ PN Tipo C (6 nodos × 1.54 kVA): 9.2 kVA              │
│  └─ ...                                                   │
│  SUBTOTAL ZONA 3: ~500 kVA en 36 nodos                   │
│                                                            │
└─ TOTAL CORREDOR: ~830 kVA en 69 nodos activos            │
```

---

## ⚡ DISEÑO POR "PUNTO 0" - METODOLOGÍA PASO A PASO

### **PARA CADA NODO, SEGUIR ESTOS PASOS:**

#### **PASO 1: INVENTARIAR EQUIPOS**
```
Listar todos los equipos en radio de 50m del PK
Incluir consumo de cada uno (W)
```

#### **PASO 2: CLASIFICAR CARGAS**
```
Fuerza:          [Desvíos, bombas]
Iluminación:     [Luces LED, reflectores]
Tomacorrientes:  [Tomas mantenimiento]
Climatización:   [AC, ventiladores]
Control:         [ENCE, PLC, contadores]
Telecomunicaciones: [TETRA, switches]
```

#### **PASO 3: CALCULAR DEMANDA**
```
Para cada categoría:
Demanda_i = Carga_instalada_i × Factor_demanda_i

Demanda_Total = Σ Demanda_i
Demanda_kVA = Demanda_Total_kW / Factor_potencia
```

#### **PASO 4: DIMENSIONAR UPS**
```
Capacidad_UPS ≥ Demanda_kVA × 1.2

Autonomía_requerida:
- ENCE/CCO: 8 horas
- Torres: 4 horas
- PN: 4 horas

Energía_baterías = Demanda_kW × Horas_autonomía
Capacidad_Ah = Energía_kWh × 1000 / Tensión_V
```

#### **PASO 5: DIMENSIONAR ACOMETIDA**
```
Corriente_nominal = Demanda_kVA / Tensión_V
Corriente_diseño = Corriente_nominal × 1.25 (NTC 2050)
Breaker = Estándar comercial >= Corriente_diseño
Conductor = Tabla NTC 2050 (≥ Corriente_diseño, Temp 75°C)

Verificar caída de tensión:
ΔV% = (2 × L × I) / (σ × S × V) × 100
Donde:
L = Longitud (m)
I = Corriente (A)
σ = Conductividad cobre (56 m/Ωmm²)
S = Sección conductor (mm²)
V = Tensión (V)

ΔV% debe ser < 3%
```

#### **PASO 6: PRESUPUESTAR**
```
Costo_Acometida = Conductor + Ducto + Excavación + Tablero + Instalación
Costo_Respaldo = UPS + Baterías + Generador (si aplica) + Solar (si aplica)
Costo_Protecciones = Breakers + DPS + Puesta a tierra
```

---

## 📋 PLANTILLA DE REVISIÓN POR NODO

### **Ficha de Revisión Eléctrica (1 por nodo):**

```
NODO: [ID]                                      Fecha: [____]
Revisor: [Nombre]                               Versión: [__]

✅ INVENTARIO DE EQUIPOS
│ Equipo                    │ Consumo │ Tensión │ ✓ │
├───────────────────────────┼─────────┼─────────┼───┤
│ [equipo 1]                │ [__]W   │ [___]V  │ □ │
│ [equipo 2]                │ [__]W   │ [___]V  │ □ │
│ ...                       │         │         │   │

✅ CÁLCULO DE DEMANDA
│ Carga instalada total:    [____] kW           │ ✓ │
│ Factor de demanda (Fd):   [____]              │ □ │
│ Factor de potencia (Fp):  [____]              │ □ │
│ Demanda calculada:        [____] kVA          │ □ │
│ Margen de seguridad:      [____]%             │ □ │
│ Capacidad de diseño:      [____] kVA          │ □ │

✅ SISTEMA DE RESPALDO
│ UPS capacidad:            [____] kVA          │ ✓ │
│ Autonomía requerida:      [____] horas        │ □ │
│ Baterías necesarias:      [____] Ah, [__]V    │ □ │
│ Generador (si aplica):    [____] kVA          │ □ │
│ Solar (si aplica):        [____] kW           │ □ │

✅ ACOMETIDA ELÉCTRICA
│ Tipo:                     [ ] BT  [ ] MT      │ ✓ │
│ Tensión:                  [____] V/kV         │ □ │
│ Longitud:                 [____] metros       │ □ │
│ Corriente diseño:         [____] A           │ □ │
│ Conductor seleccionado:   [____] AWG         │ □ │
│ Caída de tensión:         [____]% (<3%)      │ □ │
│ Breaker principal:        [____] A           │ □ │

✅ PRESUPUESTO
│ Acometida eléctrica:      $[________] COP    │ ✓ │
│ Sistema respaldo:         $[________] COP    │ □ │
│ Protecciones:             $[________] COP    │ □ │
│ Puesta a tierra:          $[________] COP    │ □ │
│ TOTAL NODO:               $[________] COP    │ □ │

═══════════════════════════════════════════════════════════════
APROBADO POR:
Especialista Eléctrico: [______________________] Fecha: [____]
Coordinador EPC:        [______________________] Fecha: [____]
═══════════════════════════════════════════════════════════════
```

---

## 🎯 RECOMENDACIONES FINALES

### **Para el Especialista Eléctrico:**

1. **Usar el Layout Maestro** como punto de partida (exportar a Excel)
2. **Agrupar por PK** (equipos ± 50m = mismo nodo)
3. **Crear ficha** por cada uno de los 69 nodos activos
4. **Calcular demandas** con factores correctos
5. **Dimensionar respaldos** según criticidad (4h o 8h)
6. **Seleccionar acometida** (BT o MT según demanda y distancia)
7. **Verificar caída de tensión** (< 3% siempre)
8. **Presupuestar** infraestructura eléctrica por nodo

### **Prioridades:**

1. **CRÍTICO (SIL-4):** ENCE (5), CCO (1) → MT + UPS 8h + Generador redundante
2. **ALTO:** Torres TETRA (37) → BT + UPS 4h + Generador/Solar
3. **MEDIO:** PN Tipo C (9) → BT + UPS 4h + Solar
4. **BAJO:** PN Tipo B (15) → BT + UPS 4h + Solar

---

## 📁 ENTREGABLES RECOMENDADOS

1. **Plano Unifilar General** (por zona)
2. **Fichas de Nodo** (69 fichas)
3. **Tabla Consolidada de Demandas** (Excel)
4. **Memoria de Cálculo** (por nodo tipo)
5. **Especificaciones de Equipos** (UPS, generadores, transformadores)
6. **Presupuesto Detallado** (infraestructura eléctrica por nodo)

---

**FIN DEL DOCUMENTO**

**Fecha:** 15 de Octubre de 2025  
**Versión:** 1.0  
**Especialidad:** Ingeniería Eléctrica  
**Estado:** ✅ **METODOLOGÍA COMPLETA**

