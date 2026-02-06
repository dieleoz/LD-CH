# RESPUESTA TÉCNICA PARA JOVEGA INGENIERÍA S.A.S.

**Para:** JOVEGA Ingeniería S.A.S.  
**De:** [Concesionario] - Proyecto APP La Dorada-Chiriguaná  
**Asunto:** RE: Información para Preparación de Oferta - Señalización y Telecomunicaciones  
**Fecha:** 15 de Octubre de 2025  
**Ref.:** Lista de Chequeo para Preparación de Oferta  

---

## SALUDO

Estimados señores de JOVEGA Ingeniería S.A.S.:

Recibimos su Lista de Chequeo para Preparación de Oferta y agradecemos su interés en participar como posible contratista especializado para el proyecto APP La Dorada-Chiriguaná.

---

## 📋 ESTADO ACTUAL DEL PROYECTO

Confirmamos que el **diseño detallado de señalización y telecomunicaciones se encuentra actualmente en proceso de licitación**, por lo que la información disponible en esta etapa corresponde a:

✅ **Especificaciones técnicas contractuales** (Apéndices Técnicos AT1-AT10)  
✅ **Ingeniería conceptual completa** (Filosofía de sistemas, arquitecturas, cantidades globales)  
✅ **Ingeniería básica** (Criterios de diseño, especificaciones preliminares)  
⏳ **Ingeniería de detalle** (En proceso de licitación - adjudicación estimada: [Fecha])  

A continuación, detallamos la **información disponible** que les permitirá preparar una **cotización paramétrica preliminar**, con el entendimiento de que las cantidades y especificaciones definitivas dependerán del diseño de detalle actualmente en licitación.

---

## 🗺️ 1. TOPOLOGÍA Y LAYOUT DE VÍA ✅ DISPONIBLE

### **1.1 Características Generales del Corredor**

| Parámetro | Valor | Fuente Documental |
|:---|:---|:---|
| **Longitud contractual** | **520.78 km** | AT1, AT2 |
| **PK Inicio** | PK 201+470 (México, Caldas) | Planos generales |
| **PK Fin** | PK 722+250 (Chiriguaná, Cesar) | Planos generales |
| **Departamentos** | Caldas, Antioquia, Santander, Cesar | Contrato base |
| **Trocha** | 914 mm (trocha métrica) | AT2 |
| **Velocidad diseño** | 80 km/h (trenes cargados) | AT1, AT10 |

### **1.2 Estaciones y Puntos de Control**

#### **A) Estaciones Principales (11 ubicaciones)**

| Nº | Estación | PK Aproximado | UFV | Función Principal | Lote |
|:---:|:---|:---:|:---:|:---|:---:|
| 1 | **México** | 201+470 | UFV 23 | Terminal Sur + Control | 2.1 |
| 2 | **Puerto Triunfo** | 250+133 | UFV 30 | Operación Intermedia | 2.1 |
| 3 | **La Argelia** | 282+154 | UFV 31 | Operación Intermedia | 2.1 |
| 4 | **Puerto Olaya** | 338+250 | UFV 03 | Operación Pre-Bermejo | 2.1 |
| 5 | **Barrancabermeja (CCO)** | 441+932 | UFV 40/41 | **CCO + Taller Pesado** | 2.1/2.2 |
| 6 | **García Cadena** | 462+520 | UFV 44 | Operación Post-Bermejo | 2.2 |
| 7 | **San Rafael** | 516+490 | UFV 46 | Operación Intermedia | 2.2 |
| 8 | **Santa Lucía** | 569+800 | UFV 49 | Operación Intermedia | 2.2 |
| 9 | **Gamarra** | 604+265 | UFV 52 | Operación Intermedia | 2.2 |
| 10 | **La Gloria** | 635+991 | UFV 54 | Operación Pre-Terminal | 2.2 |
| 11 | **Chiriguaná** | 722+250 | UFV 56 | Terminal Norte + Taller | 2.2 |

#### **B) Estaciones Menores/Apeaderos (15 ubicaciones)**
- Distribución uniforme a lo largo del corredor
- Función: Paradas operacionales y puntos de cruce
- Especificaciones: Según diseño de detalle en licitación

#### **C) Centro de Control de Operaciones (CCO)**
- **Ubicación:** Barrancabermeja (PK 441+932)
- **Función:** Control maestro del corredor completo
- **Sistemas:** CTC, TETRA, CCTV, gestión de tráfico
- **Área estimada:** 300 m² de sala de control + servidores

#### **D) Talleres de Mantenimiento**
- **Taller México:** Mantenimiento pesado + liviano
- **Taller Chiriguaná:** Mantenimiento liviano

---

## 🚦 2. ESPECIFICACIONES TÉCNICAS DE SEÑALIZACIÓN ✅ PARCIAL

### **2.1 Filosofía de Señalización ⚠️ CRÍTICO**

**⭐ DECISIÓN TÉCNICA FUNDAMENTAL:**

El proyecto adopta una **filosofía de señalización VIRTUAL**, eliminando infraestructura física de señalización en vía y concentrando el control en sistemas embarcados y centralizados.

| Componente | Filosofía Tradicional | Filosofía Adoptada | Justificación |
|:---|:---:|:---:|:---|
| **Eurobalises en vía** | 1,080 unidades | **0 unidades** | Reemplazado por ATP embarcado |
| **Señales LED en vía** | 270 unidades | **0 unidades** | Reemplazado por CTC virtual |
| **RBC (Radio Block Centre)** | 2 unidades | **0 unidades** | Reemplazado por ATP embarcado |
| **LEU (Lineside Electronic Unit)** | 1,080 unidades | **0 unidades** | Reemplazado por ATP embarcado |
| **Señalización ENCE** | Variable | **10 semáforos** | Solo entrada/salida en 5 estaciones |

**Implicaciones para la oferta:**
- ✅ **Reducción significativa** de equipamiento en vía
- ✅ **Mayor énfasis** en sistemas embarcados y CTC
- ✅ **Menor obra civil** para cimentaciones de señales
- ✅ **Mayor complejidad** en integración de software

### **2.2 Sistema de Control de Tráfico Centralizado (CTC)**

#### **Especificaciones Contractuales (AT1, Sección 4.3.2):**

| Parámetro | Especificación | Fuente |
|:---|:---|:---|
| **Ubicación CCO** | Barrancabermeja (PK 441+932) | AT1 |
| **Arquitectura** | Centralizada con respaldo | AT1, AT3 |
| **Disponibilidad** | **99.5%** | AT4 |
| **Protocolos** | UIC (interoperabilidad FENOCO) | AT1, AT3 |
| **Funciones** | Asignación surcos, control desvíos, monitoreo trenes | AT1, AT10 |
| **Redundancia** | Servidor principal + backup (2OO3) | AT3 |
| **Consolas operador** | 3 estaciones mínimo | AT1 |
| **Sistema SCADA** | Supervisión en tiempo real | AT1 |

#### **Componentes del Sistema CTC:**
```
CCO Principal (Barrancabermeja):
├─ Servidores CTC (principal + backup)
├─ Consolas de operador (3 unidades)
├─ Pantallas de visualización (mural de control)
├─ Sistema SCADA
├─ Interfaces con FENOCO (protocolo UIC)
├─ Sistemas de comunicación redundante (TETRA + TETRA + fibra óptica)
└─ Sistemas de energía y respaldo (UPS 8 horas + generador)
```

### **2.3 Sistema ATP Embarcado (Automatic Train Protection)**

#### **Especificaciones Contractuales (AT1, Sección 5.1 / AT3, Capítulo 8.10):**

| Parámetro | Especificación | Fuente |
|:---|:---|:---|
| **Tipo de sistema** | ATP embarcado (On-Board) | AT1, AT3 |
| **Estándar** | Compatible ETCS Level 2* | AT3 |
| **Locomotoras equipadas** | **15 unidades** | AT6, Cl. 13.1 |
| **Funciones** | Control velocidad, autorización movimiento, protección colisiones | AT1 |
| **Comunicación** | TETRA + TETRA (redundante) | AT1, AT3 |
| **Disponibilidad** | **99.5%** | AT4 |
| **Interfaces** | CTC, FENOCO (protocolo UIC) | AT1, AT3 |

*Nota: "Compatible ETCS Level 2" significa preparado para interoperabilidad futura, no necesariamente certificación ETCS completa en esta fase.

#### **Componentes por Locomotora:**
```
Sistema ATP Embarcado:
├─ Computadora ATP (DMI - Driver Machine Interface)
├─ Radio TETRA embarcado
├─ Radio TETRA embarcado (redundancia)
├─ Antenas TETRA (2 por locomotora)
├─ Antenas TETRA (2 por locomotora)
├─ Display de maquinista (pantalla táctil)
├─ Sensores de velocidad y posición
├─ Módulo GPS/GNSS
└─ Sistema de registro de eventos (caja negra)
```

### **2.4 Enclavamientos Electrónicos (ENCE) - 5 Estaciones**

#### **Especificaciones Contractuales (AT1, Tabla 17):**

| Parámetro | Especificación | Fuente |
|:---|:---|:---|
| **Cantidad de estaciones ENCE** | **5 estaciones** | AT1 |
| **Tipo** | Enclavamiento electrónico (EI - Electronic Interlocking) | AT1, AT3 |
| **Integración** | CTC centralizado | AT1 |
| **Disponibilidad** | **99.5%** | AT4 |
| **Nivel de seguridad** | SIL-4 (Safety Integrity Level 4) | AT3 |

#### **Estaciones con ENCE:**

| Nº | Estación | PK Aproximado | Justificación | Señales ENCE |
|:---:|:---|:---:|:---|:---:|
| 1 | **Zapatosa** | ~350 km | Estación principal con maniobras complejas | 2 (entrada/salida) |
| 2 | **García Cadena** | 462+520 | Estación principal con maniobras complejas | 2 (entrada/salida) |
| 3 | **Barrancabermeja** | 441+932 | Estación principal + CCO | 2 (entrada/salida) |
| 4 | **Puerto Berrío-Grecia** | ~380 km | Estación principal con maniobras complejas | 2 (entrada/salida) |
| 5 | **La Dorada-México** | 201+470 | Estación principal con maniobras complejas | 2 (entrada/salida) |

#### **Componentes por Estación ENCE:**
```
Enclavamiento Electrónico (ENCE):
├─ Controlador Interlocking (redundante SIL-4)
├─ Panel de control local (HMI)
├─ Módulos I/O (entradas/salidas)
├─ Detección de trenes (contadores de ejes - 2 por estación)
├─ Control de desvíos (según cantidad por estación)
├─ Señales luminosas (2 por estación: entrada/salida)
├─ UPS dedicado (5 kVA, 8 horas autonomía)
├─ Interfaz con CTC (protocolo SCI-CC-A / NAS 830)
└─ Caseta técnica (según diseño de detalle)
```

#### **Señalización Luminosa ENCE:**
- **Cantidad total:** **10 semáforos** (2 por estación × 5 estaciones)
- **Tipo:** Señales LED de entrada/salida
- **Función:** Autorización de itinerarios en estaciones críticas
- **Certificación:** SIL-4
- **Costo estimado:** $10.000.000 COP por señal
- **Nota:** Esta es la **ÚNICA** señalización luminosa física del proyecto (resto es virtual)

### **2.5 Máquinas de Cambio y Desvíos**

#### **Cantidades Globales (AT1, WBS):**

| Tipo | Cantidad | Control | Ubicaciones | Especificaciones |
|:---|:---:|:---|:---|:---|
| **Desvíos motorizados** | **25 unidades** | Automático desde CTC | Estaciones principales | Motor eléctrico 480V AC, 3 kW |
| **Desvíos manuales autotalonables** | **95 unidades** | Manual local | Estaciones menores, apartaderos | Operación manual + comprobadores de punta |
| **TOTAL** | **120 desvíos** | Mixto | A lo largo del corredor | Según norma AREMA |

#### **Componentes por Desvío Motorizado:**
```
Máquina de Cambio Motorizada:
├─ Motor de desvío (3 kW, 480V AC, 3 fases)
├─ Detectores de posición (doble contacto, redundancia)
├─ Cerradura electromagnética
├─ Controlador local (PLC)
├─ Calefacción (para zonas de riesgo de hielo - si aplica)
├─ Cableado de potencia y señal
├─ Interfaz con ENCE/CTC
└─ Comprobadores de punta (sensores de posición)
```

#### **Distribución Estimativa:**
- Estaciones con ENCE (5): ~8 desvíos motorizados cada una = 40 desvíos
- Otras estaciones principales (6): ~3 desvíos cada una = 18 desvíos
- Apartaderos y zonas de cruce: ~55 desvíos manuales
- Zonas de servicio/mantenimiento: ~40 desvíos manuales

**Nota:** Distribución exacta depende del diseño de detalle en licitación.

### **2.6 Sistemas de Detección de Trenes**

#### **Tecnología Especificada (AT3, Sección 8.1):**

| Parámetro | Especificación | Fuente |
|:---|:---|:---|
| **Tipo de detección** | **Contadores de ejes** (Axle Counters) | AT3, norma ADIF ET 03.365.310.6 |
| **Ubicaciones** | Estaciones ENCE, pasos a nivel críticos | AT1, AT3 |
| **Cantidad estimativa** | ~150 unidades (2 por punto de detección) | Estimación |
| **Funciones** | Detección presencia tren, liberación de secciones | AT1 |
| **Interfaz** | ENCE, CTC | AT1 |

**Razón de la elección (contadores de ejes vs circuitos de vía):**
- ✅ Menor mantenimiento
- ✅ Independiente de condiciones de balasto
- ✅ Menor costo de instalación y operación
- ✅ Mayor confiabilidad en clima tropical

### **2.7 Casetas de Señalización**

#### **Cantidades y Ubicaciones:**

| Tipo de Caseta | Cantidad | Ubicaciones | Área Estimativa | Especificaciones |
|:---|:---:|:---|:---:|:---|
| **Casetas ENCE** | 5 | Estaciones con enclavamiento | 20-30 m² | Hormigón/metálica, climatización, UPS |
| **Casetas PN Tipo C** | 9 | Pasos a nivel con barreras | 6-10 m² | Metálica NEMA 4X, paneles solares |
| **Casetas PN Tipo B** | 15 | Pasos a nivel señalización | 4-6 m² | Metálica NEMA 4X, paneles solares |

#### **Especificaciones Casetas ENCE:**
```
Caseta Técnica ENCE:
├─ Estructura: Hormigón prefabricado o metálica
├─ Dimensiones: ~5m × 4m × 2.8m altura
├─ Equipamiento:
│   ├─ Racks para equipos (19", profundidad 800mm)
│   ├─ Climatización (AC inverter, redundante)
│   ├─ Sistema de detección de incendio
│   ├─ Control de acceso (cerraduras electrónicas)
│   ├─ Puesta a tierra dedicada (<5 Ohms)
│   ├─ UPS dedicado (5 kVA, 8 horas autonomía)
│   └─ Generador de respaldo (opcional según criticidad)
└─ Servicios: Acometida eléctrica, fibra óptica, TETRA
```

---

## 🗼 3. SUMINISTRO E INSTALACIÓN DE EQUIPOS DE COMUNICACIONES ✅ DISPONIBLE

### **3.1 Torres de Comunicaciones - Sistema TETRA**

#### **Cantidades y Especificaciones (AT1, AT4, Criterios Técnicos Maestros):**

| Parámetro | Especificación | Fuente |
|:---|:---|:---|
| **Cantidad de torres** | **37 estaciones** | AT1, AT4, Criterios Maestros v1.0 |
| **Altura estándar** | **40 metros** | Criterios de diseño |
| **Tipo de torre** | Autosoportada (celosía triangular) | Especificaciones técnicas |
| **Radio de cobertura** | **15 km** por estación | Cálculo de radio enlace |
| **Solapamiento** | **20%** mínimo | Criterio de redundancia |
| **Espaciamiento promedio** | **~14.47 km** entre torres | 520.78 km ÷ 36 intervalos |
| **Colocalización TETRA** | **Sí** (misma torre) | Optimización EPC |

#### **Justificación Técnica 37 Estaciones:**
```
Cálculo de Cobertura:
├─ Corredor total: 520.78 km (PK 201+470 → PK 722+250)
├─ Radio de cobertura nominal: 15 km
├─ Solapamiento requerido: 20%
├─ Distancia efectiva: 15 km × (1 - 0.20) = 12 km
├─ Cantidad calculada: 520.78 km ÷ 12 km ≈ 43.4 estaciones
└─ Cantidad optimizada: 37 estaciones (ajuste por topografía + colocalización)
```

**Criterio de Optimización:**
- Colocalización en estaciones principales
- Aprovechamiento de puntos altos topográficos
- Reducción de gestión predial (de 74 a 37 ubicaciones)

#### **Distribución Aproximada de Torres:**
```
PK 201+470 (México) → PK 722+250 (Chiriguaná)

Torre 01: PK 201+470 (México - Estación)
Torre 02: PK 215+936
Torre 03: PK 230+402
...
Torre 37: PK 722+250 (Chiriguaná - Estación)

Espaciamiento: ~14.47 km
```

**Nota:** Ubicaciones exactas dependen del estudio de propagación RF del diseño de detalle.

#### **Componentes por Torre TETRA:**

```
Torre de Comunicaciones (37 unidades):
├─ Estructura:
│   ├─ Torre autosoportada celosía triangular (40m)
│   ├─ Cimentación (según estudio de suelos)
│   ├─ Sistema de puesta a tierra (malla + pararrayos)
│   └─ Cerramiento perimetral (malla + concertina)
│
├─ Equipos TETRA:
│   ├─ Estación base TETRA (TBS)
│   ├─ Antenas TETRA (3 sectores 120° cada uno)
│   ├─ Duplexers y combinadores
│   ├─ Cables coaxiales (7/8" + conectores)
│   └─ Sistema de monitoreo y alarmas
│
├─ Equipos TETRA (colocalizado):
│   ├─ Estación base TETRA (BTS)
│   ├─ Antenas TETRA (3 sectores 120°)
│   ├─ Combinadores y diplexores
│   └─ Cables coaxiales
│
├─ Equipos de Transmisión:
│   ├─ Radio punto a punto (microondas - 2 unidades por sitio)
│   ├─ Antenas parabólicas (2 unidades, 0.6-1.2m)
│   ├─ Equipo de fibra óptica (switch + transceptores)
│   └─ Router de borde
│
├─ Caseta Técnica:
│   ├─ Estructura metálica (4m × 3m × 2.8m)
│   ├─ Racks de equipos (19", 42U mínimo)
│   ├─ Sistema de climatización (AC inverter, redundante)
│   ├─ Sistema de detección de incendio
│   └─ Control de acceso
│
├─ Sistemas de Energía:
│   ├─ Acometida eléctrica (doble si disponible)
│   ├─ UPS Online (3 kVA, 4-8 horas autonomía)
│   ├─ Banco de baterías VRLA (200 Ah)
│   ├─ Generador diésel (15 kVA - sitios críticos)
│   ├─ Paneles solares (opcional, sitios remotos)
│   ├─ Controlador MPPT (si solar)
│   └─ Tablero de distribución AC/DC
│
└─ Predios y Permisos:
    ├─ Área mínima: 100-500 m² (según altura)
    ├─ Accesibilidad: Vías para vehículos 24/7
    ├─ Permisos ANE (Agencia Nacional del Espectro)
    └─ Permisos aviación civil (si aplica)
```

#### **Equipos Terminales y Accesorios TETRA:**

| Equipo | Cantidad | Ubicación | Función |
|:---|:---:|:---|:---|
| **Radios embarcados TETRA** | 30 unidades | 15 locomotoras × 2 | Comunicación tren-tierra |
| **Antenas embarcadas TETRA** | 30 unidades | 15 locomotoras × 2 | Transmisión/recepción |
| **Radios portátiles TETRA** | 80 unidades | Personal operativo | Comunicación personal |
| **Consolas de despacho** | 3 unidades | CCO Barrancabermeja | Control centralizado |
| **Sistema de control TETRA** | 1 sistema | CCO Barrancabermeja | Gestión de red |
| **Gateway TETRA-FENOCO** | 1 sistema | CCO Barrancabermeja | Integración protocolos UIC |

#### **Sistema TETRA (Redundancia con TETRA):**

**Filosofía:** Colocalización en las mismas 37 torres para redundancia de comunicaciones críticas.

| Componente | Cantidad | Especificación |
|:---|:---:|:---|
| **Estaciones base TETRA** | 37 unidades | Colocalización con TETRA |
| **Antenas TETRA** | 111 unidades | 3 sectores × 37 sitios |
| **Radios embarcados TETRA** | 30 unidades | 15 locomotoras × 2 |
| **Sistema control TETRA** | 1 sistema | CCO centralizado |

### **3.2 Fibra Óptica - Red Backbone del Proyecto**

#### **Cantidades y Especificaciones (Criterios Técnicos Maestros):**

| Parámetro | Especificación | Fuente |
|:---|:---|:---|
| **Longitud total** | **594 km** | Criterios Maestros v1.0 |
| **Cálculo base** | 520.78 km (corredor) + 10% reserva = 578.746 km | Cálculo técnico |
| **Redondeo comercial** | 594 km (rollos de 4 km estándar) | Optimización EPC |
| **Topología** | Red redundante paralela a vía | AT1, AT3 |
| **Lado de instalación** | **Costado derecho** (sentido de avance) | Criterio de diseño |
| **Tipo de cable** | 48 hilos, monomodo OS2 | AT3 |
| **Rollos necesarios** | 149 rollos (594 km ÷ 4 km) | Cálculo |

#### **Aclaración Importante sobre "Doble Anillo":**
⚠️ **NO es doble anillo físico (que sería 1,188 km).**  
✅ Es **corredor simple con redundancia lógica** mediante:
- Arquitectura de anillo auto-sanante (self-healing)
- Equipos de red con protocolos de redundancia (RSTP, ERPS)
- Rutas diversificadas en puntos críticos (puentes, túneles)

#### **Infraestructura de Fibra Óptica:**

```
Red de Fibra Óptica (594 km):
├─ Cable de Fibra:
│   ├─ Rollos de 4 km (149 unidades)
│   ├─ Tipo: 48 hilos, monomodo OS2
│   ├─ Protección: Armadura metálica + dieléctrico
│   └─ Costo estimativo: $580,000 USD por rollo
│
├─ Cajas de Empalme:
│   ├─ Cajas lineales 80×80 cm (cada 300m): 1,735 unidades
│   ├─ Cajas en puentes (4 por puente × 22 puentes): 88 unidades
│   ├─ **TOTAL CAJAS: 1,823 unidades**
│   └─ Ubicación: Costado derecho de vía
│
├─ Domos de Fusión:
│   ├─ Cantidad: 130 unidades (cada 4 km, por rollo)
│   ├─ Función: Empalme completo entre rollos
│   └─ Capacidad: 48 fusiones por domo
│
├─ Uniones Rápidas:
│   ├─ Conectores rápidos 40mm: 5,469 unidades
│   ├─ Función: 3 uniones por caja (entrada-paso-salida)
│   └─ Costo: $35,000 COP por unión
│
├─ Equipos de Fusión y Certificación:
│   ├─ Fusionadora de fibra: 1 equipo (principal)
│   ├─ Fusionadoras portátiles: 2-3 equipos (cuadrillas)
│   ├─ OTDR (reflectómetro óptico): 1 equipo
│   ├─ Power meter + fuente de luz: 2 kits
│   └─ Herramientas y accesorios
│
├─ Canalización (Ductos):
│   ├─ Ducto PEAD 110mm: ~600 km (principal)
│   ├─ Ducto PEAD 160mm: ~200 km (zonas críticas)
│   ├─ Ducto PVC 3": Adosado a puentes (22 ubicaciones)
│   ├─ Cámaras de inspección: ~683 unidades
│   │   ├─ Zonas urbanas (15%): 178 cámaras (cada 500m)
│   │   └─ Zonas rurales (85%): 505 cámaras (cada 1 km)
│   └─ Profundidad mínima: 1.8m (cruces críticos)
│
├─ Puentes y Cruces Especiales:
│   ├─ Puentes identificados: ~22 ubicaciones
│   ├─ Cajas adicionales por puente: 4 unidades
│   ├─ Ducto adosado PVC 3": Fijación a estructura
│   └─ Protección mecánica reforzada
│
└─ Equipos de Red (Activos):
    ├─ Switches/routers de agregación: 46 equipos
    ├─ Switches de acceso (torres TETRA): 37 equipos
    ├─ Regeneradores/amplificadores ópticos: 34 equipos (cada 40 km)
    └─ Casetas de regeneración (Bunkers L3): 34 ubicaciones
```

#### **Estimación de Fusiones Totales:**
```
Fusiones por Unión de Rollos: 149 fusiones
Fusiones en Cajas (cada 300m): ~3,960 fusiones (1,980 cajas × 2 fusiones promedio)
Fusiones en Nodos Principales: ~424 fusiones (53 nodos × 8 fusiones)
Fusiones en Equipos TETRA: ~148 fusiones (37 estaciones × 4 fusiones)
───────────────────────────────────────────────────────────────
TOTAL ESTIMADO: ~4,681 fusiones
```

**Nota:** Cantidad exacta depende del diseño de detalle de la red.

### **3.3 Integración con Red FENOCO**

#### **Especificaciones de Interoperabilidad (AT1, AT3):**

| Parámetro | Especificación | Fuente |
|:---|:---|:---|
| **Protocolos** | UIC (Unión Internacional de Ferrocarriles) | AT1, AT3 |
| **Interfaces** | CTC-CTC, TETRA-TETRA, ATP-ATP | AT1 |
| **Gateway de integración** | 1 sistema en CCO | AT3 |
| **Pruebas de interoperabilidad** | Obligatorias antes de puesta en servicio | AT1, AT4 |

---

## ⚡ 4. SUMINISTRO E INSTALACIÓN DE REDES DE ALIMENTACIÓN ELÉCTRICA Y RESPALDO ✅ PARCIAL

### **4.1 Redes de Media y Baja Tensión**

#### **Subestaciones Eléctricas:**

| Tipo | Cantidad | Ubicaciones | Función | Potencia Estimativa |
|:---|:---:|:---|:---|:---|
| **Subestaciones principales** | 4 | La Dorada, Puerto Berrío, Barrancabermeja, Chiriguaná | Transformación AT → MT | 1-2 MVA |
| **Subestaciones distribución** | 8 | Intermedias (~75 km) | Distribución MT → BT | 250-500 kVA |

**Nota:** Ubicaciones exactas y capacidades dependen del diseño eléctrico de detalle.

#### **Acometidas y Alimentación:**
```
Puntos de Alimentación Eléctrica:
├─ Torres TETRA (37): Acometida BT + doble alimentación (si disponible)
├─ Estaciones ENCE (5): Acometida MT + transformador dedicado
├─ CCO (1): Doble acometida MT + redundancia
├─ Talleres (2): Acometida MT industrial
├─ Pasos a nivel Tipo C (9): Acometida BT + paneles solares
└─ Pasos a nivel Tipo B (15): Acometida BT + paneles solares
```

### **4.2 Sistemas de Respaldo Energético**

#### **UPS (Uninterruptible Power Supply):**

| Tipo | Cantidad | Ubicaciones | Especificación | Autonomía |
|:---|:---:|:---|:---|:---:|
| **UPS torres TETRA** | 37 | Torres comunicaciones | 3 kVA, Online | 4-8 horas |
| **UPS enclavamientos ENCE** | 5 | Estaciones ENCE | 5 kVA, Online | 8 horas |
| **UPS PN Tipo C** | 9 | Pasos a nivel | 2 kVA, Online | 4 horas |
| **UPS PN Tipo B** | 15 | Pasos a nivel | 1 kVA, Online | 4 horas |
| **UPS CCO** | 1 | CCO Barrancabermeja | 20 kVA (redundante) | 8 horas |

#### **Baterías:**

| Tipo | Cantidad | Especificación | Ubicación |
|:---|:---:|:---|:---|
| **Bancos baterías TETRA** | 37 | 200 Ah, VRLA, ciclo profundo | Torres |
| **Bancos baterías ENCE** | 5 | 400 Ah, VRLA | Estaciones |
| **Bancos baterías PN Tipo C** | 9 | 200 Ah (4 por PN), ciclo profundo | Pasos a nivel |
| **Bancos baterías PN Tipo B** | 15 | 100 Ah (2 por PN), ciclo profundo | Pasos a nivel |

#### **Paneles Solares (Sitios Remotos):**

| Tipo | Cantidad | Especificación | Ubicación |
|:---|:---:|:---|:---|
| **Paneles PN Tipo C** | 18 | 400W monocristalino (2 por PN) | Pasos a nivel Tipo C |
| **Paneles PN Tipo B** | 15 | 300W monocristalino (1 por PN) | Pasos a nivel Tipo B |
| **Paneles torres remotas** | Variable | 600W (según disponibilidad red) | Torres TETRA remotas |

**Controladores MPPT:** 1 por instalación solar (30A-40A, 12/24V)

#### **Generadores Diésel (Sitios Críticos):**

| Tipo | Cantidad | Especificación | Ubicación |
|:---|:---:|:---|:---|
| **Generador CCO** | 1 | 150 kVA, arranque automático | CCO Barrancabermeja |
| **Generadores torres críticas** | 10-15 | 15 kVA, arranque automático | Torres TETRA críticas |
| **Generadores talleres** | 2 | 250 kVA | Talleres México y Chiriguaná |

**Nota:** Cantidad exacta de generadores depende del análisis de criticidad y disponibilidad de red eléctrica del diseño de detalle.

---

## 🏗️ 5. OBRAS CIVILES COMPLEMENTARIAS 🔄 PARCIAL

### **5.1 Canalizaciones para Cableado**

#### **Fibra Óptica:**
- **Longitud:** ~600 km de ducto PEAD 110mm + 200 km PEAD 160mm
- **Cámaras de inspección:** ~683 unidades
- **Profundidad:** 1.2m (estándar), 1.8m (cruces críticos)
- **Señalización:** Cinta de advertencia, mojones cada 50m

#### **Señalización y Control:**
- **Canalización para cableado de señalización:** Según diseño de detalle
- **Ductos entre ENCE y desvíos:** A definir por diseño
- **Cruces de vía:** Perforaciones horizontales dirigidas (cuando aplique)

### **5.2 Bases de Concreto**

#### **Cimentaciones Torres TETRA:**
- **Cantidad:** 37 unidades
- **Tipo:** Base cuadrada de concreto reforzado (según estudio de suelos)
- **Dimensiones estimativas:** 4m × 4m × 2m (profundidad variable)
- **Concreto:** 3000 PSI mínimo
- **Acero de refuerzo:** Según cálculo estructural

#### **Cimentaciones Casetas:**
```
Casetas ENCE (5): Losa de cimentación 6m × 5m × 0.3m
Casetas TETRA (37): Losa de cimentación 5m × 4m × 0.25m
Casetas PN Tipo C (9): Dado de concreto 1.5m × 1.5m × 1.0m
Casetas PN Tipo B (15): Dado de concreto 1.0m × 1.0m × 0.8m
```

#### **Bases para Equipos en Vía:**
```
Barreras PN Tipo C (9 PN × 2 barreras): 18 bases (1.0m × 1.0m × 1.0m)
Postes señalización PN: Variable según diseño
Gabinetes equipos: Dados de concreto según especificación
```

### **5.3 Cerramientos Perimetrales**

| Instalación | Cantidad | Especificación |
|:---|:---:|:---|
| **Torres TETRA** | 37 | Malla eslabonada 2.5m + concertina, perímetro ~50m |
| **Estaciones ENCE** | 5 | Cerramiento reforzado, perímetro variable |
| **CCO** | 1 | Perímetro de seguridad, CCTV, control de acceso |

**Nota:** Especificaciones detalladas dependen del diseño arquitectónico.

---

## 🚧 6. PASOS A NIVEL (PN) - INFORMACIÓN DETALLADA ✅ DISPONIBLE

### **6.1 Cantidades Globales (AT2, V.4_Sistemas/3_Pasos_a_nivel):**

| Tipo | Cantidad | Protección | Control | Tráfico Vehicular |
|:---|:---:|:---|:---|:---|
| **Tipo C** | **9 PN** | Barreras automáticas | Automático CTC | Alto (>500 veh/día) |
| **Tipo B** | **15 PN** | Señales luminosas/acústicas | Automático CTC | Medio (100-500 veh/día) |
| **Tipo A** | **122 PN** | Señalización fija | Manual | Bajo (<100 veh/día) |
| **TOTAL** | **146 PN** | Mixto | Mixto | Variable |

### **6.2 Pasos a Nivel Tipo C (Barreras Automáticas) - 9 Unidades**

#### **Ubicaciones Aproximadas:**

| PN | PK Aproximado | Ubicación | Tráfico | Observaciones |
|:---:|:---:|:---|:---:|:---|
| PN-001 | ~215 | La Dorada - Acceso Norte | Alto | Principal acceso ciudad |
| PN-002 | ~380 | Puerto Berrío - Centro | Muy Alto | Centro comercial |
| PN-003 | ~442 | Barrancabermeja - Industrial | Alto | Zona industrial |
| PN-004 | ~480 | San Pablo - Principal | Alto | Carretera principal |
| PN-005 | ~535 | Cimitarra - Centro | Alto | Centro urbano |
| PN-006 | ~590 | Landázuri - Comercial | Alto | Zona comercial |
| PN-007 | ~630 | Vélez - Industrial | Alto | Zona industrial |
| PN-008 | ~670 | Barbosa - Principal | Alto | Carretera principal |
| PN-009 | ~720 | Chiriguaná - Acceso Sur | Muy Alto | Principal acceso ciudad |

#### **Equipos Eléctricos por PN Tipo C:**

```
Paso a Nivel Tipo C (9 unidades):
├─ Barreras Automáticas:
│   ├─ Cantidad: 2 por PN (entrada/salida)
│   ├─ Longitud: 6 metros
│   ├─ Motor: 24V DC, 150W
│   ├─ Tiempo de cierre: <15 segundos
│   └─ Señalización reflectiva
│
├─ Controlador de Barreras:
│   ├─ PLC Siemens S7-1200 (o equivalente)
│   ├─ Tensión: 24V DC
│   └─ Interfaz con CTC
│
├─ Señalización:
│   ├─ Señales luminosas LED rojas intermitentes: 4 por PN
│   ├─ Potencia: 12V DC, 20W cada una
│   ├─ Sirenas acústicas: 2 por PN (110 dB, 12V DC, 15W)
│   └─ Postes de señalización
│
├─ Detección de Trenes:
│   ├─ Contadores de ejes ADIF ET 03.365.310.6: 2 por PN
│   ├─ Ubicación: Ambos lados del PN
│   └─ Interfaz con controlador
│
├─ Sistemas de Energía:
│   ├─ UPS Online 2 kVA, 24V DC: 1 por PN
│   ├─ Autonomía: 4 horas
│   ├─ Panel Solar 400W monocristalino: 2 por PN
│   ├─ Controlador MPPT 40A, 12/24V: 1 por PN
│   ├─ Banco de Baterías 200Ah ciclo profundo: 4 por PN
│   └─ Acometida eléctrica (principal) + solar (respaldo)
│
├─ Gabinete:
│   ├─ Tipo: NEMA 4X (acero inoxidable)
│   ├─ Dimensiones: 1200×800×600mm
│   ├─ Climatización: Ventilación forzada
│   └─ Ubicación: Lado de vía
│
└─ Obra Civil:
    ├─ Base de concreto gabinete: 1.5m × 1.5m × 1.0m
    ├─ Bases para barreras: 1.0m × 1.0m × 1.0m (2 por PN)
    ├─ Postes señalización: 4 por PN (3m altura)
    └─ Canalización para cableado
```

### **6.3 Pasos a Nivel Tipo B (Señales Luminosas/Acústicas) - 15 Unidades**

#### **Ubicaciones:** Distribuidas en zonas de tráfico medio (según diseño de detalle).

#### **Equipos Eléctricos por PN Tipo B:**

```
Paso a Nivel Tipo B (15 unidades):
├─ Señalización:
│   ├─ Señales luminosas LED rojas intermitentes: 4 por PN
│   ├─ Sirenas acústicas: 2 por PN (110 dB)
│   └─ Postes de señalización: 4 por PN
│
├─ Controlador:
│   ├─ PLC Siemens S7-1200: 1 por PN
│   └─ Interfaz con CTC
│
├─ Detección:
│   ├─ Contadores de ejes: 2 por PN
│   └─ Interfaz con controlador
│
├─ Energía:
│   ├─ UPS Online 1 kVA: 1 por PN
│   ├─ Panel Solar 300W: 1 por PN
│   ├─ Controlador MPPT 30A: 1 por PN
│   ├─ Banco de Baterías 100Ah: 2 por PN
│   └─ Gabinete NEMA 4X (800×600×400mm)
│
└─ Obra Civil:
    ├─ Base gabinete: 1.0m × 1.0m × 0.8m
    ├─ Postes señalización
    └─ Canalización
```

### **6.4 Pasos a Nivel Tipo A (Señalización Fija) - 122 Unidades**

#### **Distribución por Tramos:**
```
Tramo 1 (PK 201 - PK 381): 40 PN
Tramo 2 (PK 381 - PK 541): 40 PN
Tramo 3 (PK 541 - PK 722): 42 PN
```

#### **Equipamiento:**
- **Señales fijas reflectivas:** 4 por PN (Tipo Cruz de San Andrés)
- **Postes de señalización:** 4 por PN (3m altura, acero galvanizado)
- **Cimientos de postes:** Concreto 3000 PSI
- **Señalización vial:** 2 por PN (reflectiva, acero galvanizado)
- **NO requieren energía eléctrica** (señalización pasiva)

---

## 📋 7. SERVICIOS COMPLEMENTARIOS 🔄 PARCIAL

### **7.1 Logística**

**Servicios esperados:**
- Transporte de equipos (nacional e internacional)
- Almacenamiento temporal en sitios de obra
- Gestión de importaciones (si aplica)
- Coordinación con FENOCO para accesos a vía

**Nota:** Alcance exacto depende del esquema contractual a definir.

### **7.2 Movilización y Desmovilización**

**Alcances esperados:**
- Movilización de equipos y personal
- Instalación de campamentos temporales (si aplica)
- Desmontaje y limpieza final
- Transporte de equipos de prueba

### **7.3 Programa EHSQ (Environment, Health, Safety, Quality)**

#### **Requisitos Contractuales (AT6, AT8):**
- Plan de Gestión Ambiental (según AT6)
- Plan de Gestión Social (según AT8)
- Programa de Seguridad y Salud en el Trabajo (PESV)
- Plan de Calidad (ISO 9001 o equivalente)
- Campañas de cultura vial en pasos a nivel (AT8)

**Nota:** Detalles específicos dependen de los pliegos de condiciones del proceso de contratación.

---

## ⚠️ INFORMACIÓN EN DESARROLLO (Dependiente de Diseño en Licitación)

Los siguientes aspectos están sujetos al **diseño de detalle actualmente en proceso de licitación**:

### ❌ **NO DISPONIBLE EN ESTA ETAPA:**

1. **Ubicaciones exactas:**
   - Ubicación precisa (coordenadas) de cada torre TETRA
   - Ubicación exacta de cada semáforo/señal
   - Ubicación detallada de cada caja de empalme de fibra
   - Trazado exacto de canalizaciones

2. **Cantidades específicas:**
   - Cantidades exactas de equipos por estación/tramo
   - Longitudes exactas de cableado (potencia, señal, fibra)
   - Cantidades detalladas de materiales civiles
   - Distribución exacta de desvíos por estación

3. **Especificaciones de producto:**
   - Marcas y modelos específicos de equipos
   - Proveedores de tecnología (a definir en licitación)
   - Certificaciones específicas de equipos
   - Hojas de datos técnicos (datasheets)

4. **Cronograma:**
   - Cronograma de implementación por fases
   - Secuencia de instalación por tramos
   - Plan de pruebas y comisionamiento detallado
   - Fechas de entrega por subsistema

5. **Planos:**
   - Planos constructivos detallados
   - Planos eléctricos unifilares
   - Planos de cimentaciones
   - Planos de arquitectura de casetas

---

## 📊 PROPUESTA DE TRABAJO CON JOVEGA

Dado el estado preliminar del proyecto, proponemos el siguiente enfoque:

### **FASE 1 - ESTIMACIÓN PRELIMINAR (INMEDIATA - 2 Semanas)**

**Alcance:**
1. **Documentación a suministrar por Concesionario:**
   - ✅ Extracto ejecutivo AT1 (Señalización y Telecomunicaciones)
   - ✅ Extracto ejecutivo AT2 (Infraestructura y Pasos a Nivel)
   - ✅ Extracto ejecutivo AT3 (Especificaciones Generales)
   - ✅ Extracto ejecutivo AT4 (Indicadores de Desempeño)
   - ✅ Plano topología simplificada (estaciones + PN + PKs)
   - ✅ Matriz de cantidades globales (WBS)
   - ✅ Matriz de requerimientos técnicos preliminares
   - ✅ Criterios técnicos maestros (filosofía de señalización virtual)

2. **Entregable esperado de JOVEGA:**
   - **Cotización paramétrica preliminar** con rangos de costo:
     - Opción 1: Suministro + instalación + comisionamiento
     - Opción 2: Solo suministro
     - Opción 3: Solo instalación y comisionamiento
   - **Identificación de riesgos y supuestos**
   - **Propuesta de alcance contractual**
   - **Cronograma preliminar**

3. **Objetivo:**
   - Orden de magnitud presupuestal (+/- 30%)
   - Viabilidad técnica
   - Identificación de riesgos críticos
   - Base para negociación

### **FASE 2 - OFERTA DEFINITIVA (Post-Adjudicación Diseño - 3 Meses después)**

**Alcance:**
1. **Documentación a suministrar por Concesionario:**
   - ✅ Planos de ingeniería definitivos (señalización, telecomunicaciones, eléctrica, civil)
   - ✅ Cantidades de obra detalladas por ítem (BOQ - Bill of Quantities)
   - ✅ Especificaciones de equipos seleccionados (marcas, modelos)
   - ✅ Cronograma de obra definido
   - ✅ Procedimientos de pruebas y comisionamiento
   - ✅ Manuales de operación y mantenimiento preliminares

2. **Entregable esperado de JOVEGA:**
   - **Oferta firme y detallada** (+/- 10%) con:
     - Precios unitarios por ítem
     - Cronograma detallado
     - Plan de calidad
     - Plan de gestión de riesgos
     - Garantías y responsabilidades
   - **Propuesta técnica definitiva**
   - **Propuesta económica definitiva**

3. **Objetivo:**
   - Oferta para contratación
   - Precio firme
   - Compromiso contractual

---

## 📑 INFORMACIÓN ADICIONAL RELEVANTE

### **Restricciones Operativas (AT1, AT2, AT4):**

| Restricción | Especificación | Fuente |
|:---|:---|:---|
| **Interoperabilidad FENOCO** | Todas las soluciones deben ser compatibles con red existente | AT1, AT3 |
| **Disponibilidad de sistemas** | 99.5% mínimo (señalización, CTC, comunicaciones) | AT4 |
| **Mantenimiento predictivo** | Sistema debe permitir monitoreo remoto | AT2 |
| **Ciberseguridad** | Cumplimiento NIST/IEC 62443 | AT3, VII.2.11 |
| **Estándares ferroviarios** | AREMA, UIC, RETIE, IEC, ETSI | AT3 |
| **Integración con material rodante** | 15 locomotoras con equipos embarcados | AT6, Cl. 13.1 |

### **Cronograma Preliminar (Estimado):**

| Hito | Fecha Estimativa | Observaciones |
|:---|:---:|:---|
| **Adjudicación diseño detallado** | [T + 3 meses] | En proceso de licitación |
| **Inicio de obras** | [T + 12 meses] | Según cronograma AT9 |
| **Puesta en servicio progresiva** | [T + 36 meses] | Por tramos |
| **Puesta en servicio completa** | [T + 48 meses] | Corredor completo |

**Nota:** Fechas sujetas a validación según cronograma contractual definitivo.

### **Normativa Aplicable:**

#### **Señalización y Control:**
- AREMA (American Railway Engineering and Maintenance-of-Way Association)
- UIC (Unión Internacional de Ferrocarriles)
- IEC 62278 (RAMS - Confiabilidad, Disponibilidad, Mantenibilidad, Seguridad)
- EN 50126, EN 50128, EN 50129 (Normas CENELEC para señalización)
- CENELEC EN 50159 (Seguridad en comunicaciones de datos)

#### **Telecomunicaciones:**
- ETSI EN 300 392 (TETRA - Terrestrial Trunked Radio)
- ITU-T (Fibra óptica y transmisión)
- IEC 62443 (Ciberseguridad en sistemas de control industrial)

#### **Eléctrica:**
- RETIE (Reglamento Técnico de Instalaciones Eléctricas - Colombia)
- NTC 2050 (Código Eléctrico Colombiano)
- IEEE 80 (Puesta a tierra)

#### **Civil:**
- NSR-10 (Norma Sismo-Resistente Colombiana)
- NFPA (National Fire Protection Association)

---

## 🤝 PRÓXIMOS PASOS

Para avanzar con la cotización preliminar de JOVEGA, proponemos:

### **PASO 1: FIRMA DE NDA (Non-Disclosure Agreement)**
- Protección de información técnica confidencial
- Condiciones de uso de información proporcionada
- Vigencia del acuerdo

### **PASO 2: ENVÍO DE DOCUMENTACIÓN TÉCNICA PRELIMINAR (1 Semana)**
- Anexo A: Extracto Ejecutivo AT1
- Anexo B: Plano Topología Simplificada
- Anexo C: Matriz de Requerimientos Preliminares
- Anexo D: Cantidades Globales WBS
- Anexo E: Criterios Técnicos Maestros (extracto)

### **PASO 3: REUNIÓN TÉCNICA DE ACLARACIÓN (2 Semanas)**
- **Modalidad:** Presencial en Bogotá o virtual
- **Duración:** 4 horas
- **Participantes:**
  - Concesionario: Gerente de Proyecto, Ingeniero de Señalización, Ingeniero de Telecomunicaciones
  - JOVEGA: Equipo técnico comercial
- **Agenda:**
  - Presentación del proyecto (30 min)
  - Filosofía de señalización virtual (30 min)
  - Sistemas de comunicación TETRA + TETRA (30 min)
  - Pasos a nivel y seguridad (20 min)
  - Sesión de preguntas y respuestas (2 horas)

### **PASO 4: VISITA TÉCNICA AL CORREDOR (Opcional - 3 Semanas)**
- Reconocimiento de estaciones principales
- Inspección de pasos a nivel críticos
- Evaluación de accesibilidad y logística
- Identificación de restricciones de campo

### **PASO 5: PRESENTACIÓN DE COTIZACIÓN PRELIMINAR (4 Semanas)**
- Formato de oferta paramétrica
- Rangos de costo (+/- 30%)
- Supuestos y exclusiones
- Riesgos identificados
- Condiciones comerciales preliminares

### **PASO 6: EVALUACIÓN Y RETROALIMENTACIÓN (6 Semanas)**
- Análisis técnico-económico de la oferta
- Identificación de ajustes necesarios
- Retroalimentación a JOVEGA
- Definición de próximos pasos

---

## 📞 INFORMACIÓN DE CONTACTO

**Concesionario APP La Dorada-Chiriguaná:**
- **Gerente de Proyecto:** [Nombre]
- **Email:** [correo@concesionario.com]
- **Teléfono:** [+57 xxx xxx xxxx]
- **Dirección:** [Dirección oficina proyecto]

**Ingeniero de Señalización y Telecomunicaciones:**
- **Nombre:** [Nombre]
- **Email:** [correo@concesionario.com]
- **Teléfono:** [+57 xxx xxx xxxx]

---

## 📋 ANEXOS INCLUIDOS

### **ANEXO A: Extracto Ejecutivo AT1 - Señalización y Telecomunicaciones**
(Documento adjunto - 3 páginas)

**Contenido:**
1. Sistemas principales (CTC, ATP embarcado, ENCE, TETRA, TETRA, fibra óptica)
2. Criterios de disponibilidad (99.5%)
3. Estándares técnicos aplicables (AREMA, UIC, RETIE, IEC, ETSI)
4. Interfaces con FENOCO (protocolos UIC)
5. Filosofía de señalización virtual

### **ANEXO B: Plano Topología Simplificada**
(Archivo DWG + PDF - 1 plano tamaño A0)

**Contenido:**
- Esquema unifilar del corredor (PK 201+470 → PK 722+250)
- Estaciones principales (11) con PKs
- Estaciones menores (15) con PKs aproximados
- CCO Barrancabermeja (PK 441+932)
- Pasos a nivel (146) agrupados por zona
  - 9 Tipo C (barreras automáticas)
  - 15 Tipo B (señales luminosas)
  - 122 Tipo A (señalización fija)
- Puntos de control ENCE (5 estaciones)
- Distancias aproximadas entre estaciones
- Perfil altimétrico simplificado

### **ANEXO C: Matriz de Requerimientos Técnicos Preliminares**
(Archivo Excel - 1 hoja de cálculo)

| Sistema/Subsistema | Especificación Técnica Mínima | Cantidad | Disponibilidad Requerida | Normativa Aplicable |
|:---|:---|:---:|:---:|:---|
| **CTC** | Control centralizado, protocolo UIC | 1 sistema | 99.5% | AREMA, UIC, IEC 62278 |
| **ATP Embarcado** | Compatible ETCS Level 2, radio redundante | 15 locomotoras | 99.5% | EN 50126/128/129 |
| **ENCE** | Enclavamiento electrónico SIL-4 | 5 estaciones | 99.5% | IEC 62278, EN 50129 |
| **TETRA** | 37 estaciones, 15 km cobertura, redundancia | 37 torres | 99.5% | ETSI EN 300 392 |
| **TETRA** | Colocalización TETRA, redundancia | 37 estaciones | 99.5% | ETSI TETRA |
| **Fibra Óptica** | 594 km, 48 hilos, monomodo OS2, redundancia | 594 km | 99.9% | ITU-T G.652D |
| **Desvíos Motorizados** | Control automático CTC, SIL-4 | 25 unidades | 99.5% | AREMA, UIC |
| **Desvíos Manuales** | Autotalonables, comprobadores de punta | 95 unidades | Manual | AREMA |
| **PN Tipo C** | Barreras automáticas, detección, CTC | 9 PN | 99.5% | Norma colombiana PN |
| **PN Tipo B** | Señales luminosas/acústicas, CTC | 15 PN | 99.5% | Norma colombiana PN |
| **PN Tipo A** | Señalización fija reflectiva | 122 PN | Pasivo | Norma colombiana PN |

### **ANEXO D: Cantidades Globales WBS - Extracto**
(Archivo Excel - Extracto de WBS Presupuestal v2.0)

**Contenido:**
- Capítulo 1: Señalización y Control
  - 1.3: Sistemas CTC y ENCE
  - 1.5: Desvíos y equipos de vía
  - 1.6: Pasos a nivel
- Capítulo 2: Telecomunicaciones
  - 2.1: Sistema TETRA
  - 2.2: Sistema TETRA
  - 2.3: Fibra Óptica
- Capítulo 3: Sistemas Eléctricos
  - 3.1: Subestaciones
  - 3.2: UPS y respaldo
  - 3.3: Sistemas de energía renovable
- Capítulo 4: Obras Civiles Complementarias
  - 4.1: Canalizaciones
  - 4.2: Cimentaciones
  - 4.3: Casetas técnicas

---

## ⚠️ ADVERTENCIA LEGAL Y TÉRMINOS DE USO

### **IMPORTANTE:**

1. **Carácter Preliminar:**
   Esta información es de carácter **preliminar y referencial**, basada en especificaciones contractuales (AT1-AT10) e ingeniería conceptual/básica completada. **NO constituye información definitiva de contratación**.

2. **Sujeto a Diseño en Licitación:**
   Las cantidades, ubicaciones y especificaciones **están sujetas a validación y ajuste** por el diseño de detalle actualmente en proceso de licitación.

3. **Uso Recomendado:**
   Se recomienda considerar esta información como **base para estimaciones paramétricas** con rangos de variación de +/- 30%, **NO como especificaciones definitivas de contratación**.

4. **Responsabilidad:**
   El Concesionario **no se responsabiliza** por estimaciones de costos o cronogramas realizados con base exclusiva en esta información preliminar. Las ofertas definitivas deberán basarse en los documentos de diseño de detalle que se entregarán tras la adjudicación de la licitación en curso.

5. **Confidencialidad:**
   Esta información es **confidencial** y de uso exclusivo para JOVEGA Ingeniería S.A.S. en el marco de la preparación de oferta preliminar. Queda prohibida su divulgación a terceros sin autorización escrita del Concesionario.

6. **Próxima Actualización:**
   Se espera disponer de información definitiva aproximadamente **[3-6 meses]** después de la adjudicación del diseño de detalle.

---

## 🎉 CONCLUSIÓN

Quedamos a disposición de JOVEGA Ingeniería S.A.S. para ampliar cualquier punto de esta respuesta y avanzar en el proceso de preparación de oferta preliminar.

Confiamos en que la información suministrada les permita realizar una **estimación paramétrica preliminar** del proyecto y agradecemos su interés en participar en este importante desarrollo ferroviario para Colombia.

Quedamos atentos a sus comentarios, consultas adicionales y confirmación para proceder con los próximos pasos propuestos.

---

**Atentamente,**

**[Nombre y Cargo]**  
**Gerente de Proyecto**  
**Concesionario APP La Dorada-Chiriguaná**  
**[Correo electrónico]**  
**[Teléfono]**  

---

**Fecha:** 15 de Octubre de 2025  
**Referencia:** Respuesta a Lista de Chequeo para Preparación de Oferta - JOVEGA  
**Documentos anexos:** 4 (Anexos A, B, C, D)  
**Páginas:** [Total de páginas]  

---

**FIN DEL DOCUMENTO**

