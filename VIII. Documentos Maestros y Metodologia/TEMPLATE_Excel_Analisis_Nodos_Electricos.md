# 📊 TEMPLATE EXCEL: ANÁLISIS DE NODOS ELÉCTRICOS

**Proyecto:** APP La Dorada-Chiriguaná  
**Especialidad:** Ingeniería Eléctrica  
**Fecha:** 15 de Octubre de 2025  
**Objetivo:** Template práctico para análisis eléctrico por nodos  

---

## 📋 INSTRUCCIONES DE USO

### **PASO 1: Exportar Layout a Excel**
1. Abrir `WBS_Layout_Maestro.html`
2. Click "📊 Exportar Excel"
3. Guardar como: `Layout_Maestro_Base.xlsx`

### **PASO 2: Crear las 6 hojas siguientes**

---

## 📊 HOJA 1: INVENTARIO_NODOS

**Copiar/pegar esta tabla en Excel:**

```
Nodo_ID	Tipo_Nodo	Nombre_Nodo	PK	UFV	Latitud	Longitud	Carga_Instalada_kW	Factor_Demanda	Demanda_kW	Factor_Potencia	Demanda_kVA	Margen_%	Capacidad_Diseño_kVA	Tipo_Acometida	Tensión_V	Transformador_kVA	Longitud_Acometida_m	Conductor_AWG	Breaker_A	UPS_kVA	Autonomía_h	Generador_kVA	Solar_kW	Costo_Acometida_COP	Costo_Respaldo_COP	Costo_Total_COP	Estado	Observaciones
ENCE-1	TIPO 1	La Dorada-México	201+470	UFV23			23.5	0.8	18.8	0.9	20.9	20%	25.1	MT	13800	30	200	#2	15	30	8	50	NO	45000000	85000000	130000000	✅	Estación principal
EBT-01	TIPO 2	Torre TETRA 01	201+470	UFV23			8.4	0.85	7.14	0.85	8.4	15%	9.7	BT	220	NO	150	#1/0	60	10	4	15	NO	33000000	45000000	78000000	✅	Colocalizada ENCE
PN-001	TIPO 3	PN La Dorada Norte	215+250	UFV23			1.135	1.0	1.135	0.9	1.26	20%	1.51	BT	220	NO	100	#12	15	2	4	NO	SI-0.8kW	28000000	18000000	46000000	✅	Con CCTV
PN-010	TIPO 4	PN La Dorada Resid	220+180	UFV23			0.82	1.0	0.82	0.9	0.91	20%	1.09	BT	220	NO	80	#12	15	1	4	NO	SI-0.3kW	25000000	12000000	37000000	✅	Tipo B
EBT-02	TIPO 2	Torre TETRA 02	215+936	UFV23			8.4	0.85	7.14	0.85	8.4	15%	9.7	BT	220	NO	200	#1/0	60	10	4	NO	SI-0.6kW	35000000	48000000	83000000	✅	Sitio remoto
```

**Fórmulas Excel a usar:**

| Columna | Fórmula |
|:---|:---|
| **Demanda_kW** | `=Carga_Instalada_kW * Factor_Demanda` |
| **Demanda_kVA** | `=Demanda_kW / Factor_Potencia` |
| **Capacidad_Diseño_kVA** | `=Demanda_kVA * (1 + Margen_%/100)` |
| **Costo_Total_COP** | `=Costo_Acometida_COP + Costo_Respaldo_COP` |

---

## 📊 HOJA 2: DETALLE_EQUIPOS_POR_NODO

**Template para desglosar equipos de cada nodo:**

```
Nodo_ID	Equipo_ID	Nombre_Equipo	Tipo_Equipo	Consumo_W	Tensión_V	Fases	Factor_Demanda	Demanda_W	Circuito	Protección_A	Observaciones
ENCE-1	E001	Controlador Interlocking	CONTROL	2000	220	1F	1.0	2000	C1-Control	15A	SIL-4 crítico
ENCE-1	E002	Servidor principal	CONTROL	500	220	1F	1.0	500	C1-Control	15A	Redundante
ENCE-1	E003	Servidor backup	CONTROL	500	220	1F	1.0	500	C1-Control	15A	Redundante
ENCE-1	E004	HMI Operador 1	CONTROL	200	220	1F	1.0	200	C1-Control	15A	Pantalla táctil
ENCE-1	E005	HMI Operador 2	CONTROL	200	220	1F	1.0	200	C1-Control	15A	Pantalla táctil
ENCE-1	E006	Módulos I/O Rack 1	CONTROL	150	220	1F	1.0	150	C1-Control	15A	64 E/S
ENCE-1	E007	Módulos I/O Rack 2	150	220	1F	1.0	150	C1-Control	15A	64 E/S
ENCE-1	E008	Contador ejes 1	DETECCIÓN	50	24	DC	1.0	50	C2-Detección	10A	ADIF ET 03.365
ENCE-1	E009	Contador ejes 2	DETECCIÓN	50	24	DC	1.0	50	C2-Detección	10A	ADIF ET 03.365
ENCE-1	E010	Contador ejes 3	DETECCIÓN	50	24	DC	1.0	50	C2-Detección	10A	ADIF ET 03.365
... (total 10 contadores)
ENCE-1	E018	Contador ejes 10	DETECCIÓN	50	24	DC	1.0	50	C2-Detección	10A	ADIF ET 03.365
ENCE-1	E019	Desvío motorizado 1	DESVÍO	3000	480	3F	0.3	900	C3-Desvíos	20A	Opera 5s c/15min
ENCE-1	E020	Desvío motorizado 2	DESVÍO	3000	480	3F	0.3	900	C3-Desvíos	20A	Simultaneidad 30%
... (6 desvíos total)
ENCE-1	E025	Semáforo entrada	SEÑALIZACIÓN	600	220	1F	1.0	600	C4-Señales	10A	LED SIL-4
ENCE-1	E026	Semáforo salida	SEÑALIZACIÓN	600	220	1F	1.0	600	C4-Señales	10A	LED SIL-4
ENCE-1	E027	Interface CTC	COMUNICACIÓN	200	220	1F	1.0	200	C5-Telecom	10A	Protocolo SCI-CC
ENCE-1	E028	Radio TETRA	COMUNICACIÓN	100	220	1F	1.0	100	C5-Telecom	10A	Comunicación CCO
ENCE-1	E029	Switch fibra	COMUNICACIÓN	100	220	1F	1.0	100	C5-Telecom	10A	1 Gbps
ENCE-1	E030	AC inverter 1	CLIMATIZACIÓN	3000	220	1F	0.8	2400	C6-Clima	20A	Redundante
ENCE-1	E031	AC inverter 2	CLIMATIZACIÓN	3000	220	1F	0.8	2400	C6-Clima	20A	Redundante
ENCE-1	E032	UPS 5 kVA	RESPALDO	1000	220	1F	1.0	1000	C7-Auxiliar	15A	Online, 8h
ENCE-1	E033	Iluminación LED	AUXILIAR	200	220	1F	1.0	200	C7-Auxiliar	10A	Caseta
ENCE-1	E034	Detección incendio	AUXILIAR	50	24	DC	1.0	50	C7-Auxiliar	5A	Sistema central
ENCE-1	E035	Control acceso	AUXILIAR	50	24	DC	1.0	50	C7-Auxiliar	5A	RFID
```

**Fórmulas:**
- `Demanda_W = Consumo_W × Factor_Demanda`
- Al final: `SUMA(Demanda_W)` por nodo

---

## 📊 HOJA 3: RESUMEN_CIRCUITOS

**Agrupación de equipos por circuito:**

```
Nodo_ID	Circuito	Nombre_Circuito	Tipo_Carga	Equipos_#	Carga_Total_W	Demanda_W	Tensión_V	Fases	Corriente_A	Breaker_A	Conductor_AWG	Ducto
ENCE-1	C1	Control ENCE	CONTROL	7	4,200	4,200	220	1F	19.1	20A	#12	3/4"
ENCE-1	C2	Detección	DETECCIÓN	10	500	500	24	DC	20.8	25A	#10	1/2"
ENCE-1	C3	Desvíos	DESVÍOS	6	18,100	5,430	480	3F	6.5	15A	#12	3/4"
ENCE-1	C4	Señalización	SEÑALIZACIÓN	2	1,200	1,200	220	1F	5.5	10A	#14	1/2"
ENCE-1	C5	Comunicación	COMUNICACIÓN	4	600	600	220	1F	2.7	10A	#14	1/2"
ENCE-1	C6	Climatización	CLIMA	3	6,200	4,960	220	1F	22.5	30A	#10	1"
ENCE-1	C7	Auxiliares	AUXILIAR	5	1,330	1,330	220	1F	6.0	10A	#14	1/2"
```

**Validación:**
- Corriente por circuito < 80% capacidad breaker ✅
- Conductor adecuado para corriente ✅
- Protecciones coordinadas ✅

---

## 📊 HOJA 4: CALCULO_ACOMETIDAS

**Cálculo de caída de tensión y selección de conductor:**

```
Nodo_ID	Demanda_kVA	Tensión_V	Longitud_m	Corriente_A	Corriente_Diseño_A	Conductor_AWG	Sección_mm2	Caída_V	Caída_%	OK?	Alternativa_AWG	Costo_COP
ENCE-1	26.1	220	200	118.6	148.3	#2/0	67.4	4.8	2.2%	✅	-	$45,000,000
EBT-02	9.7	220	150	44.1	55.1	#1/0	53.5	5.3	2.4%	✅	-	$33,000,000
PN-001	1.51	220	100	6.9	8.6	#12	3.3	1.7	0.8%	✅	-	$28,000,000
```

**Fórmula caída de tensión (BT monofásica):**
```
=2 × Longitud_m × Corriente_A / (56 × Sección_mm2)
```

**Validación:**
```
=SI(Caída_% < 3%, "✅", "❌ Aumentar calibre")
```

---

## 📊 HOJA 5: DIMENSIONAMIENTO_UPS

**Cálculo de baterías y autonomía:**

```
Nodo_ID	Demanda_kW	Autonomía_Req_h	Energía_kWh	Tensión_Bat_V	Capacidad_Ah_Calculada	Capacidad_Comercial_Ah	Cantidad_Bancos	Energía_Real_kWh	Autonomía_Real_h	OK?	Costo_UPS_COP	Costo_Baterías_COP	Total_COP
ENCE-1	18.8	8	150.4	48	3,133	400	8	153.6	8.2	✅	$35,000,000	$48,000,000	$83,000,000
EBT-02	7.14	4	28.6	48	596	200	3	28.8	4.0	✅	$18,000,000	$15,000,000	$33,000,000
PN-001	1.135	4	4.54	48	95	100	1	4.8	4.2	✅	$8,000,000	$3,000,000	$11,000,000
```

**Fórmulas:**
```
Energía_kWh = Demanda_kW × Autonomía_Req_h
Capacidad_Ah_Calculada = (Energía_kWh × 1000) / Tensión_Bat_V
Energía_Real_kWh = (Capacidad_Comercial_Ah × Cantidad_Bancos × Tensión_Bat_V) / 1000
Autonomía_Real_h = Energía_Real_kWh / Demanda_kW
```

---

## 📊 HOJA 6: PRESUPUESTO_NODOS

**Consolidado de costos por nodo:**

```
Nodo_ID	Tipo	Equipos_COP	Acometida_COP	Transformador_COP	Tablero_COP	Ductos_COP	Tierra_COP	UPS_COP	Baterías_COP	Generador_COP	Solar_COP	Instalación_COP	Total_Infraestructura_COP	Total_Equipos_COP	GRAN_TOTAL_COP
ENCE-1	1	4700000000	15000000	25000000	5000000	8000000	8000000	35000000	48000000	80000000	0	25000000	249000000	4700000000	4949000000
EBT-02	2	8014000000	12000000	0	3000000	4000000	6000000	18000000	15000000	25000000	10000000	15000000	108000000	8014000000	8122000000
PN-001	3	1620000000	8000000	0	2000000	3000000	5000000	8000000	3000000	0	12000000	8000000	49000000	1620000000	1669000000
```

**Totales por tipo:**
```
=SUMAR.SI(Tipo, "1", Total_Infraestructura_COP)
```

---

## 🎯 EJEMPLO PRÁCTICO: ANALIZAR UN NODO NUEVO

### **Caso: Necesitas analizar la Torre EBT-15**

**PASO 1: Identificar equipos en el Layout**

Filtrar Layout por:
- PK: 350 ± 50m
- Tipo_Equipo: TETRA, TELECOMUNICACIONES

**PASO 2: Completar ficha en HOJA 2:**

```
Nodo_ID: EBT-15
Equipos:
├─ Estación TETRA: 500W
├─ Estación TETRA: 300W
├─ Switch: 100W
├─ Router: 80W
├─ 2 Radios microondas: 300W
├─ 2 AC inverter: 6,000W
├─ UPS: 500W
├─ Iluminación: 80W
└─ Auxiliares: 100W
TOTAL: 7,960W ≈ 8.0 kW
```

**PASO 3: Calcular demanda (HOJA 1):**

```
Carga instalada: 8.0 kW
Factor demanda: 0.85 (climatización 80%, resto 100%)
Demanda: 6.8 kW
Factor potencia: 0.85
Demanda kVA: 6.8 / 0.85 = 8.0 kVA
Margen 15%: 8.0 × 1.15 = 9.2 kVA
```

**PASO 4: Dimensionar acometida:**

```
Tensión: 220V (BT)
Corriente: 9.2 kVA / 220V = 41.8 A
Corriente diseño: 41.8 × 1.25 = 52.3 A
Breaker: 2 × 60A
Conductor: #1/0 AWG (para 150m y ΔV < 3%)
```

**PASO 5: Dimensionar UPS (HOJA 5):**

```
Demanda: 6.8 kW
Autonomía: 4 horas
Energía: 6.8 × 4 = 27.2 kWh
Tensión baterías: 48V
Capacidad Ah: 27,200 / 48 = 567 Ah
Bancos comerciales: 3 × 200Ah = 600 Ah ✅
```

**PASO 6: Presupuestar (HOJA 6):**

```
Acometida (150m): $33M
UPS 10 kVA: $18M
Baterías 3×200Ah: $15M
Generador 15 kVA (opcional): $25M
Puesta a tierra: $6M
Instalación: $12M
────────────────────────────
TOTAL: $109M
```

---

## 🔧 HERRAMIENTAS RECOMENDADAS

### **Software:**

1. **Microsoft Excel** (con Power Query para filtros avanzados)
2. **AutoCAD Electrical** (diagramas unifilares)
3. **DIALux/Calculux** (cálculo iluminación)
4. **Amtech ProDesign** (cálculo caída tensión, cortos)
5. **ETAP** (análisis de redes, flujo de carga)

### **Tablas NTC/Normas:**

- **NTC 2050** Tabla 310.15(B)(16): Capacidad de corriente de conductores
- **NTC 2050** Artículo 215: Alimentadores
- **NTC 2050** Artículo 220: Cálculo de cargas
- **RETIE** Artículo 20: Puesta a tierra
- **IEEE 1100** (Emerald Book): Sistemas de respaldo

---

## 📊 DASHBOARD RECOMENDADO (Power BI o Excel)

### **KPIs a visualizar:**

```
┌────────────────────────────────────────┐
│  RESUMEN GENERAL                       │
├────────────────────────────────────────┤
│  Total Nodos:              69          │
│  Carga Total:              827 kW      │
│  Demanda Total:            720 kVA     │
│  Costo Infraestructura:    $4.8B COP  │
└────────────────────────────────────────┘

┌────────────────────────────────────────┐
│  POR TIPO DE NODO                      │
├────────────────────────────────────────┤
│  Tipo 1 (ENCE):  5 nodos,  120 kW     │
│  Tipo 2 (TETRA): 37 nodos, 296 kW     │
│  Tipo 3 (PN-C):  9 nodos,   18 kW     │
│  Tipo 4 (PN-B):  15 nodos,  18 kW     │
│  Tipo 6 (CCO):   1 nodo,    75 kW     │
│  Tipo 7 (Taller):2 nodos,  300 kW     │
└────────────────────────────────────────┘

┌────────────────────────────────────────┐
│  ACOMETIDAS                            │
├────────────────────────────────────────┤
│  BT 220V:        59 nodos (85%)        │
│  MT 13.8kV:      10 nodos (15%)        │
│  Sin acometida:  122 (PN-A pasivos)    │
└────────────────────────────────────────┘
```

---

## ✅ CHECKLIST FINAL PARA ENTREGAR

### **Documentos del Especialista Eléctrico:**

- [ ] 📊 Excel: Inventario de 69 nodos con cargas calculadas
- [ ] 📊 Excel: Detalle de equipos por nodo (filas individuales)
- [ ] 📊 Excel: Resumen por tipo de nodo
- [ ] 📊 Excel: Cálculo de acometidas (caída de tensión)
- [ ] 📊 Excel: Dimensionamiento UPS y baterías
- [ ] 📊 Excel: Presupuesto consolidado
- [ ] 📐 Planos: Unifilares por nodo tipo (7 planos)
- [ ] 📐 Planos: Diagrama general de distribución
- [ ] 📄 Memoria: Memoria de cálculo eléctrico
- [ ] 📄 Especificaciones: Equipos eléctricos (UPS, generadores, transformadores)

---

## 🎯 RESPUESTA A TU PREGUNTA

### **"¿Cómo asumo carga y diseño por nodo eléctrico?"**

**Respuesta:**

1. **Agrupar equipos** por PK (mismo ± 50m) = 1 NODO
2. **Sumar cargas** de todos los equipos del nodo
3. **Aplicar factores de demanda** (no todo opera simultáneo)
4. **Calcular demanda en kVA** (dividir por Fp)
5. **Agregar margen** (15-25%)
6. **Dimensionar acometida** (conductor, breaker, ΔV < 3%)
7. **Dimensionar UPS** (autonomía 4h o 8h según criticidad)
8. **Presupuestar** infraestructura completa del nodo

**Ejemplo resumido:**
```
Nodo PN-001 (con CCTV):
├─ Equipos PN: 1,090W
├─ CCTV: 45W
├─ TOTAL: 1,135W
├─ Demanda: 1.26 kVA
├─ UPS: 2 kVA
├─ Acometida: #12 AWG, 100m, 220V
└─ Costo total: $46M
```

---

**¡Usa este template para analizar los 69 nodos del proyecto!** 🎯

---

**FIN DEL TEMPLATE**

**Fecha:** 15 de Octubre de 2025  
**Versión:** 1.0  
**Estado:** ✅ Listo para usar

