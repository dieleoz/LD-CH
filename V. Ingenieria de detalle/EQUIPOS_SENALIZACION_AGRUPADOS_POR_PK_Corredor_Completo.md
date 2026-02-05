# 📍 EQUIPOS DE SEÑALIZACIÓN AGRUPADOS POR PK - CORREDOR COMPLETO

**Proyecto:** APP La Dorada-Chiriguaná  
**Corredor:** PK 201+470 (México) → PK 722+250 (Chiriguaná) = 520.78 km  
**Fecha:** 15 de Octubre de 2025  
**Objetivo:** Relación de equipos de señalización organizados por punto kilométrico para diseño de nodos eléctricos  

---

## 📊 RESUMEN EJECUTIVO POR ZONA

| Zona | PKs | Long (km) | Nodos Activos | Consumo Total | Observaciones |
|:---|:---:|:---:|:---:|:---:|:---|
| **ZONA 1: La Dorada - Puerto Berrío** | 201-315 | 114 | 18 nodos | 145 kW | ENCE, 8 torres, 3 PN |
| **ZONA 2: Puerto Berrío - Barrancabermeja** | 315-442 | 127 | 19 nodos | 180 kW | ENCE, 9 torres, 4 PN |
| **ZONA 3: Barrancabermeja - Chiriguaná** | 442-722 | 280 | 32 nodos | 454 kW | CCO, 2 ENCE, 20 torres, 11 PN |
| **TOTAL CORREDOR** | **201-722** | **521** | **69 nodos** | **779 kW** | |

---

## 🗺️ LISTADO COMPLETO POR PUNTO KILOMÉTRICO

### **CONVENCIONES:**

```
🟢 = Estación ENCE (alta carga, crítico)
🔵 = Torre TETRA (carga media)
🟡 = PN Tipo C (barreras automáticas)
🟠 = PN Tipo B (señales luminosas)
⚪ = PN Tipo A (pasivos, sin consumo)
```

---

## 📍 ZONA 1: LA DORADA - PUERTO BERRÍO (PK 201 - 315)

### **PK 201+470: ESTACIÓN LA DORADA-MÉXICO** 🟢 + 🔵

**NODO ELÉCTRICO: ENCE-1 + EBT-01 (Colocalizados)**

#### **Equipos de Señalización:**

| # | Categoría | Equipo | Cantidad | Consumo Unit. | Consumo Total |
|:---:|:---|:---|:---:|:---:|:---:|
| | **1. DETECCIÓN DE TRENES** | | | | |
| 1.1 | Contadores de ejes | ADIF ET 03.365.310.6 | 10 | 50W | 500W |
| 1.2 | Controladores detección | Unidades procesamiento | 5 | 30W | 150W |
| | **2. MÁQUINAS DE CAMBIO** | | | | |
| 2.1 | Desvíos motorizados | Motor 480V 3kW | 6 | 3,000W | 18,000W (op) |
| 2.2 | Controladores desvíos | PLC redundante | 6 | 20W | 120W (reposo) |
| | **3. CASETA EN VÍA** | | | | |
| 3.1 | Caseta ENCE | 30 m², equipada | 1 | 15,000W | 15,000W |
| | **4. SEMÁFOROS** | | | | |
| 4.1 | Señal entrada (PK 201+450) | LED rojo/verde SIL-4 | 1 | 600W | 600W |
| 4.2 | Señal salida (PK 201+600) | LED rojo/verde SIL-4 | 1 | 600W | 600W |
| | **5. BARRERAS PN** | | | | |
| | | (No aplica en estación) | - | - | - |
| | **6. EQUIPOS EN ESTACIÓN** | | | | |
| 6.1 | Controlador ENCE | Interlocking 2OO3 | 1 | 4,200W | 4,200W |
| 6.2 | Sistemas comunicación | CTC, TETRA, fibra | 1 | 600W | 600W |
| 6.3 | Climatización | 2 AC inverter 3kW | 2 | 6,000W | 6,000W |
| 6.4 | UPS ENCE | 5 kVA, 8h autonomía | 1 | 1,000W | 1,000W |

**RESUMEN PK 201+470:**
```
Carga instalada (operación): 46,650W ≈ 46.7 kW
Carga instalada (reposo):    28,770W ≈ 28.8 kW
Demanda calculada:           ~32.0 kW (considerando Fd)
Tipo de nodo:                TIPO 1 (ENCE) + TIPO 2 (Torre)
Acometida:                   Media Tensión 13.8 kV
Transformadores:             2 × 30 kVA (ENCE + Torre separados)
UPS:                         30 kVA (ENCE) + 10 kVA (Torre)
Generador:                   50 kVA (compartido)
```

---

### **PK 206+000: PN TIPO C #2** 🟡

**NODO ELÉCTRICO: PN-002-LA-DORADA-NORCASIA**

#### **Equipos de Señalización:**

| # | Categoría | Equipo | Cantidad | Consumo Unit. | Consumo Total |
|:---:|:---|:---|:---:|:---:|:---:|
| | **1. DETECCIÓN** | | | | |
| 1.1 | Contadores de ejes | Activación barreras | 2 | 50W | 100W |
| | **2. MÁQUINAS** | (No hay desvíos en PN) | - | - | - |
| | **3. CASETA** | | | | |
| 3.1 | Gabinete NEMA 4X | 1200×800×600mm | 1 | Incluido | - |
| | **4. SEMÁFOROS** | (No en PN) | - | - | - |
| | **5. BARRERAS** | | | | |
| 5.1 | Barrera automática 1 | Motor 24V 150W | 1 | 150W | 150W |
| 5.2 | Barrera automática 2 | Motor 24V 150W | 1 | 150W | 150W |
| 5.3 | Señales LED rojas | Intermitentes 12V | 4 | 20W | 80W |
| 5.4 | Sirenas acústicas | 110 dB, 12V | 2 | 15W | 30W |
| | **6. EQUIPOS PN** | | | | |
| 6.1 | PLC Controlador | Siemens S7-1200 | 1 | 50W | 50W |
| 6.2 | Detección vehículos | Lazos + Radar + IA | 1 | 220W | 220W |
| 6.3 | UPS 2 kVA | 4h autonomía | 1 | 500W | 500W |
| 6.4 | Sistema solar | 2×400W paneles | 1 | 100W | 100W |

**RESUMEN PK 206+000:**
```
Carga instalada: 1,380W ≈ 1.4 kW
Demanda calculada: 1.4 kW × 1.0 = 1.4 kVA
Tipo de nodo: TIPO 3 (PN Tipo C)
Acometida: BT 220V, monofásica
Conductor: #12 AWG
Breaker: 2 × 15A
UPS: 2 kVA
Solar: 2 × 400W (respaldo)
```

---

### **PK 215+250: PN TIPO C #1** 🟡

*(Similar a PK 206+000, consumo: 1.4 kW)*

---

### **PK 215+936: TORRE TETRA #2** 🔵

**NODO ELÉCTRICO: EBT-02**

#### **Equipos de Señalización:**

| # | Categoría | Equipo | Cantidad | Consumo Unit. | Consumo Total |
|:---:|:---|:---|:---:|:---:|:---:|
| | **1-5.** | (No aplica - Torre es telecomunicaciones) | - | - | - |
| | **6. EQUIPOS EN "ESTACIÓN"** (Torre) | | | | |
| 6.1 | Caseta técnica | 15 m², climatizada | 1 | 4,300W | 4,300W |
| 6.2 | Estación Base TETRA | 220V AC | 1 | 500W | 500W |
| 6.3 | Estación Base GSM-R | Colocalizada | 1 | 300W | 300W |
| 6.4 | Equipos transmisión | Switch + radios | 1 | 480W | 480W |
| 6.5 | Climatización | 2 AC 3kW redundantes | 2 | 6,000W | 6,000W |
| 6.6 | UPS 3 kVA | 4h autonomía | 1 | 500W | 500W |
| 6.7 | Auxiliares | Iluminación, alarmas | 1 | 300W | 300W |

**RESUMEN PK 215+936:**
```
Carga instalada: 8,380W ≈ 8.4 kW
Demanda calculada: 6.9 kW
Tipo de nodo: TIPO 2 (Torre TETRA)
Acometida: BT 220V
Conductor: #1/0 AWG (150m)
Breaker: 2 × 60A
UPS: 10 kVA
Generador: 15 kVA (opcional, sitios remotos)
```

---

### **PK 220+180: PN TIPO B #1** 🟠

**NODO ELÉCTRICO: PN-010-LA-DORADA-RESIDENCIAL**

#### **Equipos de Señalización:**

| # | Categoría | Equipo | Cantidad | Consumo Unit. | Consumo Total |
|:---:|:---|:---|:---:|:---:|:---:|
| | **1. DETECCIÓN** | | | | |
| 1.1 | Contadores de ejes | Activación señales | 2 | 50W | 100W |
| | **2-4.** | (No barreras ni semáforos) | - | - | - |
| | **5. SEÑALIZACIÓN** | | | | |
| 5.1 | Señales LED rojas | Intermitentes 12V | 4 | 20W | 80W |
| 5.2 | Sirenas acústicas | 110 dB, 12V | 2 | 15W | 30W |
| | **6. EQUIPOS PN** | | | | |
| 6.1 | PLC Controlador | Señales automáticas | 1 | 50W | 50W |
| 6.2 | UPS 1 kVA | 4h autonomía | 1 | 300W | 300W |
| 6.3 | Panel solar | 300W | 1 | 50W | 50W |
| 6.4 | Gabinete | 800×600×400mm | 1 | 50W | 50W |

**RESUMEN PK 220+180:**
```
Carga instalada: 660W ≈ 0.7 kW
Tipo de nodo: TIPO 4 (PN Tipo B)
Acometida: BT 220V
Conductor: #12 AWG
Breaker: 2 × 10A
UPS: 1 kVA
Solar: 300W
```

---

### **PK 230+402: TORRE TETRA #3** 🔵

*(Similar a EBT-02, consumo: 8.4 kW)*

---

### **PK 244+868: TORRE TETRA #4** 🔵

*(Similar, consumo: 8.4 kW)*

---

### **PK 259+334: TORRE TETRA #5** 🔵

*(Similar, consumo: 8.4 kW)*

---

### **PK 273+800: TORRE TETRA #6** 🔵

*(Similar, consumo: 8.4 kW)*

---

### **PK 288+266: TORRE TETRA #7** 🔵

*(Similar, consumo: 8.4 kW)*

---

### **PK 302+732: TORRE TETRA #8** 🔵

*(Similar, consumo: 8.4 kW)*

---

## 📍 ZONA 2: PUERTO BERRÍO - BARRANCABERMEJA (PK 315 - 442)

### **PK 315+000: ESTACIÓN PUERTO BERRÍO** 🟢

**NODO ELÉCTRICO: ENCE-2 + EBT-21**

#### **Equipos de Señalización:**

| # | Categoría | Equipo | Cantidad | Consumo Unit. | Consumo Total |
|:---:|:---|:---|:---:|:---:|:---:|
| | **1. DETECCIÓN** | | | | |
| 1.1 | Contadores de ejes | ENCE | 8 | 50W | 400W |
| | **2. MÁQUINAS DE CAMBIO** | | | | |
| 2.1 | Desvíos motorizados | 5 unidades | 5 | 3,000W | 15,000W (op) |
| 2.2 | Controladores | En reposo | 5 | 20W | 100W (reposo) |
| | **3. CASETA** | | | | |
| 3.1 | Caseta ENCE | 25 m² | 1 | 13,000W | 13,000W |
| | **4. SEMÁFOROS** | | | | |
| 4.1 | Señal entrada | LED SIL-4 | 1 | 600W | 600W |
| 4.2 | Señal salida | LED SIL-4 | 1 | 600W | 600W |
| | **6. EQUIPOS ESTACIÓN** | | | | |
| 6.1 | Controlador ENCE | Interlocking | 1 | 3,500W | 3,500W |
| 6.2 | Comunicaciones | CTC, fibra | 1 | 500W | 500W |
| 6.3 | Climatización | AC redundante | 1 | 5,000W | 5,000W |
| 6.4 | UPS 5 kVA | 8h | 1 | 1,000W | 1,000W |

**RESUMEN PK 315+000:**
```
Carga (operación): 39,600W ≈ 39.6 kW
Carga (reposo): 24,700W ≈ 24.7 kW
Demanda: ~27 kW
Acometida: MT 13.8 kV
Transformador: 2 × 30 kVA (ENCE + Torre)
```

---

### **PK 329+468: TORRE TETRA #9** 🔵

*(Consumo: 8.4 kW)*

---

### **PK 331+770: PN TIPO C #3** 🟡

**NODO ELÉCTRICO: PN-003-PUERTO-BERRIO**

*(Similar a PN-001, consumo: 1.4 kW)*

---

### **PK 343+934: TORRE TETRA #10** 🔵

*(Consumo: 8.4 kW)*

---

### **PK 350+180: PN TIPO C #2** 🟡

**NODO ELÉCTRICO: PN-002-PUERTO-BERRIO-CENTRO**

*(Similar a PN-001, consumo: 1.4 kW)*

---

### **PK 358+400: TORRE TETRA #11** 🔵

*(Consumo: 8.4 kW)*

---

### **PK 360+320: PN TIPO B #2** 🟠

*(Consumo: 0.7 kW)*

---

### **PK 372+866: TORRE TETRA #12** 🔵

*(Consumo: 8.4 kW)*

---

### **PK 387+332: TORRE TETRA #13** 🔵

*(Consumo: 8.4 kW)*

---

### **PK 401+798: TORRE TETRA #14** 🔵

*(Consumo: 8.4 kW)*

---

### **PK 416+264: TORRE TETRA #15** 🔵

*(Consumo: 8.4 kW)*

---

### **PK 430+730: TORRE TETRA #16** 🔵

*(Consumo: 8.4 kW)*

---

## 📍 ZONA 3: BARRANCABERMEJA - CHIRIGUANÁ (PK 442 - 722)

### **PK 441+932: CCO + ESTACIÓN BARRANCABERMEJA** 🟢 + 🔵 + 🏢

**NODO ELÉCTRICO: CCO-PRINCIPAL + ENCE-3 + EBT-30 (Complejo)**

#### **Equipos de Señalización:**

| # | Categoría | Equipo | Cantidad | Consumo Unit. | Consumo Total |
|:---:|:---|:---|:---:|:---:|:---:|
| | **1. DETECCIÓN** | | | | |
| 1.1 | Contadores de ejes | ENCE (6 desvíos) | 12 | 50W | 600W |
| | **2. MÁQUINAS DE CAMBIO** | | | | |
| 2.1 | Desvíos motorizados | 6 unidades | 6 | 3,000W | 18,000W (op) |
| 2.2 | Controladores | Reposo | 6 | 20W | 120W (reposo) |
| | **3. CASETAS** | | | | |
| 3.1 | Caseta ENCE | 30 m² | 1 | 15,000W | 15,000W |
| 3.2 | Caseta Torre TETRA | 15 m² | 1 | 4,300W | 4,300W |
| 3.3 | CCO Edificio | 300 m² | 1 | 30,000W | 30,000W |
| | **4. SEMÁFOROS** | | | | |
| 4.1 | Señal entrada | LED SIL-4 | 1 | 600W | 600W |
| 4.2 | Señal salida | LED SIL-4 | 1 | 600W | 600W |
| | **6. EQUIPOS ESTACIÓN/CCO** | | | | |
| 6.1 | Controlador ENCE | Interlocking | 1 | 4,500W | 4,500W |
| 6.2 | Servidores CTC principales | 4 servidores | 1 | 5,000W | 5,000W |
| 6.3 | Consolas operador | 3 estaciones | 1 | 1,500W | 1,500W |
| 6.4 | Mural visualización | 6 pantallas 4K | 1 | 2,000W | 2,000W |
| 6.5 | Sistema SCADA | Supervisión | 1 | 1,000W | 1,000W |
| 6.6 | Climatización CCO | Sala servidores | 1 | 10,000W | 10,000W |
| 6.7 | UPS CCO | 20 kVA redundante | 1 | 2,000W | 2,000W |
| 6.8 | UPS ENCE | 5 kVA | 1 | 1,000W | 1,000W |

**RESUMEN PK 441+932:**
```
Carga instalada (operación): 96,220W ≈ 96.2 kW
Carga instalada (reposo): 78,340W ≈ 78.3 kW
Demanda calculada: ~65 kW (considerando Fd)
Tipo de nodo: TIPO 1 + TIPO 2 + TIPO 6 (Multi-nodo)
Estrategia: 3 NODOS SEPARADOS
├─ NODO 1: CCO (52.5 kW) → Transformador 75 kVA
├─ NODO 2: ENCE-3 (30 kW) → Transformador 50 kVA
└─ NODO 3: EBT-30 (8.4 kW) → Transformador 15 kVA
Acometida: MT 13.8 kV (doble alimentador redundante)
Generadores: 2 × 150 kVA (N+1 redundancia)
UPS: 100 kVA (CCO) + 50 kVA (ENCE) + 10 kVA (Torre)
```

---

### **PK 445+196: TORRE TETRA #17** 🔵

*(Consumo: 8.4 kW)*

---

### **PK 445+400: PN TIPO B #3** 🟠

*(Consumo: 0.7 kW)*

---

### **PK 459+662: TORRE TETRA #18** 🔵

*(Consumo: 8.4 kW)*

---

### **PK 462+520: ESTACIÓN GARCÍA CADENA** 🟢

**NODO ELÉCTRICO: ENCE-4 + EBT-32**

#### **Equipos de Señalización:**

| # | Categoría | Equipo | Cantidad | Consumo Total |
|:---:|:---|:---|:---:|:---:|
| 1 | **DETECCIÓN** | 8 contadores ejes | 8 | 400W |
| 2 | **MÁQUINAS** | 4 desvíos motorizados | 4 | 12,000W (op) / 80W (reposo) |
| 3 | **CASETA** | 25 m² | 1 | 13,000W |
| 4 | **SEMÁFOROS** | 2 señales LED | 2 | 1,200W |
| 6 | **EQUIPOS** | ENCE completo | 1 | 6,000W |

**RESUMEN PK 462+520:**
```
Carga (operación): 32,600W ≈ 32.6 kW
Carga (reposo): 20,680W ≈ 20.7 kW
Demanda: ~23 kW
Acometida: MT 13.8 kV
Transformadores: 2 × 30 kVA
```

---

### **PKs 474-720: TORRES TETRA #19-37** 🔵

*(19 torres adicionales, espaciadas cada ~14.47 km)*
*(Consumo c/u: 8.4 kW)*

**Listado PKs aproximados:**
```
EBT-19: PK 474+128
EBT-20: PK 488+594
EBT-21: PK 503+060
EBT-22: PK 517+526
EBT-23: PK 531+992
EBT-24: PK 546+458
EBT-25: PK 560+924
EBT-26: PK 575+390
EBT-27: PK 589+856
EBT-28: PK 604+322
EBT-29: PK 618+788
EBT-30: PK 633+254 (Ya usado en 441+932)
EBT-31: PK 647+720
EBT-32: PK 662+186 (Ya usado en 462+520)
EBT-33: PK 676+652
EBT-34: PK 691+118
EBT-35: PK 705+584
EBT-36: PK 720+050
EBT-37: PK 722+250 (Chiriguaná, colocalizado ENCE-5)
```

---

### **PN Tipo C #4-9 (PKs 490-720)** 🟡

| PN | PK Aproximado | Ubicación | Consumo |
|:---:|:---:|:---|:---:|
| PN-004 | 490+450 | San Pablo - Principal | 1.4 kW |
| PN-005 | 540+300 | Cimitarra - Centro | 1.4 kW |
| PN-006 | 590+180 | Landázuri - Comercial | 1.4 kW |
| PN-007 | 630+650 | Vélez - Industrial | 1.4 kW |
| PN-008 | 670+200 | Barbosa - Principal | 1.4 kW |
| PN-009 | 720+150 | Chiriguaná - Acceso Sur | 1.4 kW |

---

### **PN Tipo B #4-15 (PKs distribuidos 450-715)** 🟠

*(12 PN Tipo B adicionales, consumo c/u: 0.7 kW)*

---

### **PK 722+250: ESTACIÓN CHIRIGUANÁ (TERMINAL NORTE)** 🟢

**NODO ELÉCTRICO: ENCE-5 + TALLER + EBT-37**

#### **Equipos de Señalización:**

| # | Categoría | Equipo | Cantidad | Consumo Total |
|:---:|:---|:---|:---:|:---:|
| 1 | **DETECCIÓN** | 10 contadores ejes | 10 | 500W |
| 2 | **MÁQUINAS** | 4 desvíos motorizados | 4 | 12,000W (op) / 80W (reposo) |
| 3 | **CASETA** | 30 m² (ENCE + Taller) | 1 | 18,000W |
| 4 | **SEMÁFOROS** | 2 señales LED | 2 | 1,200W |
| 6 | **EQUIPOS** | ENCE + Taller | 1 | 8,000W |

**RESUMEN PK 722+250:**
```
Carga (operación): 39,700W ≈ 39.7 kW
Carga (reposo): 27,780W ≈ 27.8 kW
Demanda: ~28 kW
Acometida: MT 13.8 kV
Transformadores: 2 × 30 kVA (ENCE + Taller)
```

---

### **PN TIPO A (122 unidades - PASIVOS)** ⚪

**PKs distribuidos a lo largo del corredor (202+460 a 722+xxx)**

⚠️ **IMPORTANTE:** Los PN Tipo A son **100% PASIVOS**

| Elemento | Cantidad | Consumo Eléctrico |
|:---|:---:|:---:|
| Cruz de San Andrés reflectiva | 4 por PN | **0 kW** |
| Postes galvanizados | 4 por PN | **0 kW** |
| Pintura horizontal | Variable | **0 kW** |
| **TOTAL 122 PN Tipo A** | **122** | **0 kW** |

**No requieren:**
- ❌ Acometida eléctrica
- ❌ Contadores de ejes
- ❌ Sistemas automáticos
- ❌ UPS ni respaldo
- ❌ Diseño de nodo eléctrico

---

## 📊 TABLA CONSOLIDADA POR PK - TODOS LOS NODOS

### **Nodos Activos Ordenados por PK:**

| PK | Nodo_ID | Tipo | Nombre | Equipos Señalización | Consumo (kW) | Acometida |
|:---:|:---|:---:|:---|:---|:---:|:---|
| **201+470** | ENCE-1 | 1 | La Dorada-México | Detección(10), Desvíos(6), Caseta, Semáforos(2), ENCE | 28.8 (reposo) | MT 13.8kV |
| **201+470** | EBT-01 | 2 | Torre TETRA 01 | Caseta torre | 8.4 | BT 220V |
| **206+000** | PN-002-TIPO-C | 3 | La Dorada Norcasia | Barreras(2), Detección(2), Señalización | 1.4 | BT 220V |
| **215+250** | PN-001-TIPO-C | 3 | La Dorada Norte | Barreras(2), Detección(2), Señalización, CCTV | 1.4 | BT 220V |
| **215+936** | EBT-02 | 2 | Torre TETRA 02 | Caseta torre | 8.4 | BT 220V |
| **220+180** | PN-010-TIPO-B | 4 | La Dorada Residencial | Señales(4), Sirenas(2), Detección(2) | 0.7 | BT 220V |
| **230+402** | EBT-03 | 2 | Torre TETRA 03 | Caseta torre | 8.4 | BT 220V |
| **244+868** | EBT-04 | 2 | Torre TETRA 04 | Caseta torre | 8.4 | BT 220V |
| **259+334** | EBT-05 | 2 | Torre TETRA 05 | Caseta torre | 8.4 | BT 220V |
| **273+800** | EBT-06 | 2 | Torre TETRA 06 | Caseta torre | 8.4 | BT 220V |
| **288+266** | EBT-07 | 2 | Torre TETRA 07 | Caseta torre | 8.4 | BT 220V |
| **302+732** | EBT-08 | 2 | Torre TETRA 08 | Caseta torre | 8.4 | BT 220V |
| **315+000** | ENCE-2 | 1 | Puerto Berrío | Detección(8), Desvíos(5), Caseta, Semáforos(2), ENCE | 24.7 (reposo) | MT 13.8kV |
| **315+000** | EBT-21 | 2 | Torre TETRA 21 | Caseta torre | 8.4 | BT 220V |
| **329+468** | EBT-09 | 2 | Torre TETRA 09 | Caseta torre | 8.4 | BT 220V |
| **331+770** | PN-003-TIPO-C | 3 | Puerto Berrío Tipo C | Barreras, Detección, Señalización | 1.4 | BT 220V |
| **343+934** | EBT-10 | 2 | Torre TETRA 10 | Caseta torre | 8.4 | BT 220V |
| **350+180** | PN-002-TIPO-C | 3 | Puerto Berrío Centro | Barreras, Detección, Señalización | 1.4 | BT 220V |
| **358+400** | EBT-11 | 2 | Torre TETRA 11 | Caseta torre | 8.4 | BT 220V |
| **360+320** | PN-011-TIPO-B | 4 | Puerto Berrío Industrial | Señales, Detección | 0.7 | BT 220V |
| ... | ... | ... | ... | ... | ... | ... |
| **441+932** | CCO | 6 | CCO Principal | Servidores CTC, SCADA, Consolas | 52.5 | MT 13.8kV |
| **441+932** | ENCE-3 | 1 | Barrancabermeja | Detección(12), Desvíos(6), Semáforos(2), ENCE | 30.0 (reposo) | MT 13.8kV |
| **441+932** | EBT-30 | 2 | Torre TETRA 30 | Caseta torre | 8.4 | BT 220V |
| ... | ... | ... | ... | ... | ... | ... |
| **462+520** | ENCE-4 | 1 | García Cadena | Detección(8), Desvíos(4), Semáforos(2), ENCE | 20.7 (reposo) | MT 13.8kV |
| ... | ... | ... | ... | ... | ... | ... |
| **722+250** | ENCE-5 | 1 | Chiriguaná | Detección(10), Desvíos(4), Semáforos(2), ENCE | 27.8 (reposo) | MT 13.8kV |
| **722+250** | TALLER-CHI | 7 | Taller Chiriguaná | Equipos taller | 150.0 | MT 13.8kV |
| **722+250** | EBT-37 | 2 | Torre TETRA 37 | Caseta torre | 8.4 | BT 220V |

**TOTAL:** 69 nodos activos

---

## 📈 GRÁFICO DE CARGAS POR PK

```
Consumo (kW)
│
100├─
   │              ██
 80├─             ██
   │              ██
 60├─             ██
   │              ██
 40├─  ██         ██         ██              ██
   │  ██         ██         ██              ██
 20├─  ██  ████  ██  ████████████████████  ██
   │  ██  ████  ██  ████████████████████  ██
  0└──┴────┴────┴────┴────┴────┴────┴────┴──
    201  215  315  441  462  ...  ...  722  PK

Leyenda:
██ Alta (> 20 kW): ENCE, CCO
██ Media (5-10 kW): Torres TETRA
██ Baja (< 2 kW): PN Tipo C, PN Tipo B
```

---

## 🗺️ DISTRIBUCIÓN ESPACIAL DE CARGAS

### **Densidad de Nodos por Tramo:**

| Tramo | Km | Nodos | Densidad (nodos/km) | Carga Total |
|:---|:---:|:---:|:---:|:---:|
| La Dorada - Puerto Berrío | 114 | 18 | 0.16 | 145 kW |
| Puerto Berrío - Barrancabermeja | 127 | 19 | 0.15 | 180 kW |
| Barrancabermeja - Chiriguaná | 280 | 32 | 0.11 | 454 kW |
| **TOTAL** | **521** | **69** | **0.13** | **779 kW** |

**Promedio:** 1 nodo eléctrico cada 7.5 km

---

## 💰 PRESUPUESTO POR PK (Infraestructura Eléctrica)

### **Costo Estimado de Nodos:**

| Tipo Nodo | Cantidad | Costo/Nodo | Costo Total |
|:---|:---:|:---:|:---:|
| **TIPO 1 (ENCE)** | 5 | $130M | $650M |
| **TIPO 2 (Torres)** | 37 | $78M | $2,886M |
| **TIPO 3 (PN-C)** | 9 | $46M | $414M |
| **TIPO 4 (PN-B)** | 15 | $37M | $555M |
| **TIPO 5 (PN-A)** | 122 | $0 | $0 |
| **TIPO 6 (CCO)** | 1 | $250M | $250M |
| **TIPO 7 (Talleres)** | 2 | $180M | $360M |
| **TOTAL** | **69** | | **$5,115M** |

**Nota:** Este es el costo de **infraestructura eléctrica** (acometidas, UPS, generadores), los equipos están en WBS.

---

## 📋 RESUMEN PARA JOVEGA (Agrupado por PK)

### **Información clave para cotización:**

**Ubicaciones con equipos de señalización (69 nodos):**

1. **5 Estaciones ENCE** (PKs: 201, 315, 441, 462, 722)
   - Detección: 48 contadores total
   - Desvíos: 25 motorizados total
   - Semáforos: 10 señales LED total
   - Consumo: 20-30 kW c/u

2. **37 Torres TETRA** (cada 14.47 km promedio)
   - Casetas técnicas: 37 × 15 m²
   - Consumo: 8.4 kW c/u
   - Acometida: BT 220V

3. **9 PN Tipo C** (PKs: 206, 215, 332, 350, 442, 490, 540, 590, 630, 670, 720)
   - Barreras: 18 total (2 por PN)
   - Detección: 18 contadores total
   - Consumo: 1.4 kW c/u

4. **15 PN Tipo B** (PKs distribuidos)
   - Señalización: Solo luces y sirenas
   - Detección: 30 contadores total
   - Consumo: 0.7 kW c/u

5. **122 PN Tipo A** (PKs múltiples)
   - **PASIVOS** (sin electricidad)
   - Consumo: 0 kW

---

## ✅ CONCLUSIONES

### **Datos clave para diseño eléctrico:**

1. **69 nodos activos** requieren diseño eléctrico
2. **122 PN Tipo A** NO requieren (pasivos)
3. **Consumo total:** ~779 kW (considerando reposo)
4. **Demanda total:** ~680 kVA (con factores)
5. **Densidad:** 1 nodo cada 7.5 km promedio

### **Agrupación natural por complejidad:**

```
Nodos Simples (Repetibles): 61 nodos
├─ 37 Torres TETRA: Template estándar 8.4 kW
├─ 9 PN Tipo C: Template estándar 1.4 kW
└─ 15 PN Tipo B: Template estándar 0.7 kW

Nodos Complejos (Individuales): 8 nodos
├─ 5 ENCE: Análisis individual 20-30 kW c/u
├─ 1 CCO: Análisis específico 52.5 kW
└─ 2 Talleres: Análisis específico 150 kW c/u
```

### **Presupuesto infraestructura eléctrica:**

**~$5,115 millones COP** (~$1.16 millones USD) para:
- Acometidas (conductores, ductos, excavación)
- Transformadores (MT donde aplique)
- Tableros y protecciones
- UPS y baterías
- Generadores (sitios críticos/remotos)
- Puesta a tierra
- Instalación y pruebas

---

**FIN DEL DOCUMENTO**

**Fecha:** 15 de Octubre de 2025  
**Versión:** 1.0  
**Estado:** ✅ Organizado por PK para diseño eléctrico  
**Uso:** Diseño de nodos eléctricos + Cotización contratistas

