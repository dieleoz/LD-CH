# ESPECIFICACIONES STM EMBARCADAS - ETCS LEVEL 2
## APP La Dorada-Chiriguaná - Specific Transmission Module

**Estado:** 🔄 **EN DESARROLLO - FASE 2 URGENTE**  
**Fecha:** 27 de Enero, 2025  
**Responsable:** Ing. Embarcados - EPC  
**Especialista:** Especialista Senior en Control de Trenes  
**Estándar Base:** EN 50126, EN 50128, EN 50129, UIC 438

---

## 🎯 **PROPÓSITO Y ALCANCE**

### **1.1 PROPÓSITO**
Este documento define las **especificaciones técnicas del STM (Specific Transmission Module)** embarcado para el sistema ITCS ETCS Level 2 del proyecto APP La Dorada-Chiriguaná, estableciendo los requerimientos para equipos embarcados en material rodante.

### **1.2 ALCANCE**
El STM embarcado cubrirá:
- **Material rodante:** Locomotoras y trenes de pasajeros
- **Funciones ETCS Level 2:** Control automático de velocidad
- **Interfaces embarcadas:** DMI, odometría, frenado
- **Comunicación GSM-R:** Con Radio Block Center
- **Retrofit:** Adaptación a locomotoras existentes

### **1.3 REFERENCIAS NORMATIVAS**
- **EN 50126:** Aplicación de técnicas de confiabilidad
- **EN 50128:** Software para sistemas de control ferroviario
- **EN 50129:** Aplicación de técnicas de seguridad
- **UIC 438:** Especificaciones técnicas ETCS Level 2

---

## 🔧 **ARQUITECTURA DEL STM EMBARCADO**

### **2.1 ARQUITECTURA GENERAL**

#### **2.1.1 DIAGRAMA DE ARQUITECTURA**
```
ARQUITECTURA STM EMBARCADO
┌─────────────────────────────────────────────────────────────────┐
│                    STM EMBARCADO                               │
│                                                                 │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │              APPLICATION LAYER                          │   │
│  │                                                         │   │
│  │  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐   │   │
│  │  │ Speed   │  │Movement │  │ Safety  │  │ System  │   │   │
│  │  │ Control │  │ Auth.   │  │ Monitor │  │ Monitor │   │   │
│  │  └─────────┘  └─────────┘  └─────────┘  └─────────┘   │   │
│  └─────────────────────────────────────────────────────────┘   │
│                              │                                 │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │              COMMUNICATION LAYER                        │   │
│  │                                                         │   │
│  │  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐   │   │
│  │  │ GSM-R   │  │Eurobalise│  │ Odometry│  │ DMI     │   │   │
│  │  │Manager  │  │Reader   │  │ System  │  │ Interface│   │   │
│  │  └─────────┘  └─────────┘  └─────────┘  └─────────┘   │   │
│  └─────────────────────────────────────────────────────────┘   │
│                              │                                 │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │              HARDWARE LAYER                             │   │
│  │                                                         │   │
│  │  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐   │   │
│  │  │CPU      │  │Memory   │  │Storage  │  │I/O      │   │   │
│  │  │Module   │  │Module   │  │Module   │  │Module   │   │   │
│  │  └─────────┘  └─────────┘  └─────────┘  └─────────┘   │   │
│  └─────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────────┐
│                    INTERFACES EXTERNAS                         │
│                                                                 │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐            │
│  │    GSM-R    │  │ Eurobalises │  │   DMI       │            │
│  │   ANTENNA   │  │   ANTENNA   │  │  DISPLAY    │            │
│  └─────────────┘  └─────────────┘  └─────────────┘            │
│                                                                 │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐            │
│  │  ODOMETRY   │  │  BRAKING    │  │   POWER     │            │
│  │   SENSORS   │  │   SYSTEM    │  │   SUPPLY    │            │
│  └─────────────┘  └─────────────┘  └─────────────┘            │
└─────────────────────────────────────────────────────────────────┘
```

#### **2.1.2 COMPONENTES PRINCIPALES**
```
COMPONENTES STM EMBARCADO:

1. CPU MODULE:
   - Procesador: ARM Cortex-A9 dual-core
   - Frecuencia: 1.0 GHz
   - Arquitectura: ARMv7-A
   - Cache: L1 32KB, L2 512KB

2. MEMORY MODULE:
   - RAM: 4GB DDR3-1600
   - Flash: 32GB eMMC
   - EEPROM: 1MB
   - Backup: 256KB FRAM

3. COMMUNICATION MODULE:
   - GSM-R: Quad-band 900/1800 MHz
   - Eurobalise: 27.095 MHz
   - Ethernet: 100 Mbps
   - USB: 2.0 Host/Device

4. I/O MODULE:
   - Digital I/O: 32 canales
   - Analog I/O: 16 canales
   - Serial: 4 canales RS-485
   - CAN: 2 canales CAN 2.0B
```

### **2.2 ESPECIFICACIONES HARDWARE**

#### **2.2.1 ESPECIFICACIONES TÉCNICAS**
```
ESPECIFICACIONES HARDWARE STM:

PROCESADOR:
- Modelo: ARM Cortex-A9 MPCore
- Cores: 2 cores @ 1.0 GHz
- Cache: L1 32KB, L2 512KB
- FPU: VFPv3-D16
- NEON: SIMD engine

MEMORIA:
- RAM: 4GB DDR3-1600 ECC
- Flash: 32GB eMMC 5.1
- EEPROM: 1MB I2C
- Backup: 256KB FRAM
- SD Card: 64GB opcional

ALMACENAMIENTO:
- Sistema: 8GB (Linux RT)
- Aplicaciones: 16GB
- Datos: 8GB
- Logs: 4GB
- Backup: 4GB

RED:
- Ethernet: 100 Mbps
- WiFi: 802.11n (opcional)
- Bluetooth: 4.0 (opcional)
- GSM-R: Quad-band
- Eurobalise: 27.095 MHz
```

#### **2.2.2 ESPECIFICACIONES ELÉCTRICAS**
```
ESPECIFICACIONES ELÉCTRICAS:

ALIMENTACIÓN:
- Voltaje: 24V DC (12V-36V rango)
- Consumo: 15W típico, 25W máximo
- Eficiencia: > 90%
- Protección: Sobretensión, subtensión, inversión

INTERFACES:
- Digital I/O: 24V/0V, 32 canales
- Analog I/O: 0-10V, 16 canales
- Serial: RS-485, 4 canales
- CAN: CAN 2.0B, 2 canales
- USB: USB 2.0, 2 puertos

PROTECCIONES:
- Sobretensión: 60V DC
- Subtensión: 9V DC
- Corriente: 2A máximo
- Temperatura: -40°C a +85°C
- Humedad: 0-95% sin condensación
```

### **2.3 ESPECIFICACIONES MECÁNICAS**

#### **2.3.1 DIMENSIONES Y PESO**
```
ESPECIFICACIONES MECÁNICAS:

DIMENSIONES:
- Ancho: 483mm (19")
- Alto: 44mm (1.75")
- Profundidad: 300mm (11.8")
- Peso: 8.5 kg

MATERIALES:
- Chasis: Acero inoxidable AISI 316L
- Front panel: Aluminio anodizado
- Conectores: Acero inoxidable
- Tornillería: Acero inoxidable A2

PROTECCIÓN:
- IP Rating: IP67
- EMC: EN 50121-3-2
- Vibración: EN 61373
- Impacto: EN 61373
```

#### **2.3.2 INSTALACIÓN**
```
ESPECIFICACIONES DE INSTALACIÓN:

UBICACIÓN:
- Rack: 19" estándar
- Posición: Horizontal
- Acceso: Frontal y posterior
- Ventilación: Natural

CONEXIONES:
- Alimentación: Terminal block
- Comunicaciones: Conectores RJ45
- I/O: Terminal blocks
- Antenas: Conectores N-type

HERRAMIENTAS:
- Destornilladores: T10, T15
- Llaves: 10mm, 13mm
- Multímetro: Digital
- Osciloscopio: 100 MHz
```

---

## 💻 **ESPECIFICACIONES SOFTWARE**

### **3.1 SISTEMA OPERATIVO**

#### **3.1.1 ESPECIFICACIONES OS**
```
SISTEMA OPERATIVO:

Distribución: Linux RT (Real-Time)
Kernel: Linux 4.19.0-rt
Arquitectura: ARMv7-A
Tipo: Real-Time preemptible

CARACTERÍSTICAS RT:
- Latencia máxima: < 100 μs
- Jitter: < 50 μs
- Preemption: Fully preemptible
- Priority: SCHED_FIFO para procesos críticos

CONFIGURACIÓN:
- Bootloader: U-Boot 2019.01
- Init system: systemd
- Package manager: apt
- Development: GCC 8.3
```

#### **3.1.2 MIDDLEWARE**
```
MIDDLEWARE CRÍTICO:

1. DATABASE:
   - SQLite 3.28
   - Configuración: In-memory
   - Backup: Automático
   - Integridad: Checksums

2. MESSAGE QUEUE:
   - ZeroMQ 4.3
   - Patrón: PUB/SUB
   - Persistencia: Opcional
   - Performance: < 1ms

3. LOGGING:
   - syslog-ng 3.25
   - Niveles: DEBUG, INFO, WARN, ERROR
   - Rotación: Automática
   - Compresión: gzip

4. NETWORKING:
   - NetworkManager 1.20
   - DHCP: Cliente
   - DNS: Resolver
   - Firewall: iptables
```

### **3.2 APLICACIONES STM**

#### **3.2.1 MÓDULOS PRINCIPALES**
```
MÓDULOS SOFTWARE STM:

1. SPEED CONTROL MODULE (SCM):
   - Control automático de velocidad
   - Aplicación de frenado
   - Monitoreo de límites
   - Integración con odometría

2. MOVEMENT AUTHORITY MODULE (MAM):
   - Gestión de autorizaciones
   - Validación de rutas
   - Actualización de posición
   - Comunicación con RBC

3. SAFETY MONITOR MODULE (SMM):
   - Monitoreo de seguridad
   - Detección de fallos
   - Aplicación de medidas
   - Logging de eventos

4. COMMUNICATION MODULE (COM):
   - Gestión GSM-R
   - Lectura Eurobalise
   - Interface DMI
   - Comunicación RBC

5. ODOMETRY MODULE (ODM):
   - Cálculo de posición
   - Corrección de deriva
   - Validación de movimiento
   - Integración con sensores

6. SYSTEM MONITOR MODULE (SMM):
   - Monitoreo del sistema
   - Gestión de recursos
   - Alertas y alarmas
   - Mantenimiento predictivo
```

#### **3.2.2 ARQUITECTURA SOFTWARE**
```
ARQUITECTURA SOFTWARE STM:

┌─────────────────────────────────────────────────────────┐
│                    APPLICATION LAYER                    │
│                                                         │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐   │
│  │   SCM   │  │   MAM   │  │   SMM   │  │   ODM   │   │
│  └─────────┘  └─────────┘  └─────────┘  └─────────┘   │
│       │           │           │           │            │
│       └───────────┼───────────┼───────────┘            │
│                   │           │                        │
│  ┌─────────────────────────────────────────────────────┐│
│  │              COMMUNICATION MODULE                   ││
│  │                                                     ││
│  │  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐││
│  │  │ GSM-R   │  │Eurobalise│  │   DMI   │  │   RBC   │││
│  │  │Manager  │  │Reader   │  │Interface│  │Interface│││
│  │  └─────────┘  └─────────┘  └─────────┘  └─────────┘││
│  └─────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────┐
│                    MIDDLEWARE LAYER                     │
│                                                         │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐   │
│  │Database │  │Message  │  │Logging  │  │Network  │   │
│  │Manager  │  │Queue    │  │System   │  │Manager  │   │
│  └─────────┘  └─────────┘  └─────────┘  └─────────┘   │
└─────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────┐
│                      OS LAYER                           │
│                                                         │
│              Linux RT 4.19.0-rt                        │
│                                                         │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐   │
│  │Process  │  │Memory   │  │Network  │  │Device   │   │
│  │Manager  │  │Manager  │  │Stack    │  │Manager  │   │
│  └─────────┘  └─────────┘  └─────────┘  └─────────┘   │
└─────────────────────────────────────────────────────────┘
```

---

## 📡 **INTERFACES Y COMUNICACIONES**

### **4.1 INTERFACE GSM-R**

#### **4.1.1 ESPECIFICACIONES DE COMUNICACIÓN**
```
INTERFACE GSM-R:

Estándar: EIRENE (European Integrated Railway Radio Enhanced Network)
Frecuencias: 876-880 MHz (uplink), 921-925 MHz (downlink)
Modulación: GMSK (Gaussian Minimum Shift Keying)
Velocidad: 9.6 kbps por canal
Canales: 8 canales por célula

CARACTERÍSTICAS:
- Handover automático entre células
- Prioridad para comunicaciones ferroviarias
- Cifrado de comunicaciones
- Redundancia de red

ANTENA:
- Tipo: Omnidireccional
- Ganancia: 3 dBi
- Impedancia: 50 ohmios
- VSWR: < 1.5:1
- Cables: RG-58, 2 metros
```

#### **4.1.2 MENSAJES CRÍTICOS**
```
MENSAJES GSM-R:

1. MOVEMENT AUTHORITY (MA):
   - Autorización de movimiento
   - Límites de velocidad
   - Distancia hasta próximo punto de control
   - Tiempo de validez

2. POSITION REPORT (PR):
   - Posición actual del tren
   - Velocidad actual
   - Dirección de movimiento
   - Timestamp

3. EMERGENCY STOP (ES):
   - Comando de parada de emergencia
   - Prioridad máxima
   - Transmisión inmediata
   - Confirmación requerida

4. SYSTEM STATUS (SS):
   - Estado del sistema STM
   - Disponibilidad de funciones
   - Alertas de mantenimiento
   - Información de degradación
```

### **4.2 INTERFACE EUROBALISE**

#### **4.2.1 ESPECIFICACIONES DE COMUNICACIÓN**
```
INTERFACE EUROBALISE:

Frecuencia: 27.095 MHz
Modulación: FSK (Frequency Shift Keying)
Velocidad: 564.48 kbps
Alcance: 0.5m - 1.5m
Tiempo de transmisión: 50 ms

CARACTERÍSTICAS:
- Transmisión unidireccional
- Detección automática
- Validación de datos
- Corrección de errores

ANTENA:
- Tipo: Loop rectangular
- Dimensiones: 490mm x 350mm
- Impedancia: 50 ohmios
- VSWR: < 1.5:1
- Cables: RG-58, 1 metro
```

#### **4.2.2 PROCESAMIENTO DE DATOS**
```
PROCESAMIENTO EUROBALISE:

1. DETECCIÓN:
   - Detección automática de baliza
   - Sincronización de señal
   - Demodulación FSK
   - Decodificación Manchester

2. VALIDACIÓN:
   - Checksum: Verificación de integridad
   - CRC32: Detección de errores
   - Timestamp: Validación de tiempo
   - Secuencia: Verificación de orden

3. PROCESAMIENTO:
   - Extracción de datos
   - Validación lógica
   - Actualización de posición
   - Integración con odometría
```

### **4.3 INTERFACE DMI**

#### **4.3.1 ESPECIFICACIONES DMI**
```
INTERFACE DMI:

Tipo: Driver Machine Interface
Protocolo: ETCS-ETCS-ETCS
Velocidad: 1 Mbps
Interface: RS-485
Distancia: 10 metros máximo

CARACTERÍSTICAS:
- Comunicación bidireccional
- Validación de datos
- Timeout de comunicación
- Recuperación automática

DISPLAY:
- Tipo: TFT LCD
- Resolución: 800x480 píxeles
- Tamaño: 7 pulgadas
- Brillo: Ajustable automáticamente
- Contraste: Ajustable automáticamente
```

#### **4.3.2 INFORMACIÓN DISPLAY**
```
INFORMACIÓN DMI:

1. VELOCIDAD:
   - Velocidad actual
   - Velocidad objetivo
   - Límite de velocidad
   - Diferencia de velocidad

2. DISTANCIA:
   - Distancia hasta próximo límite
   - Distancia hasta fin de autorización
   - Distancia hasta próximo punto de control
   - Distancia hasta fin de ruta

3. ESTADO:
   - Estado del sistema
   - Modo de operación
   - Alertas activas
   - Confirmaciones requeridas

4. NAVEGACIÓN:
   - Próxima estación
   - Tiempo estimado de llegada
   - Información de ruta
   - Alertas de tráfico
```

---

## 🔧 **SISTEMA DE ODOMETRÍA**

### **5.1 ESPECIFICACIONES DE ODOMETRÍA**

#### **5.1.1 SENSORES DE ODOMETRÍA**
```
SENSORES DE ODOMETRÍA:

1. ENCODERS DE RUEDA:
   - Tipo: Incremental
   - Resolución: 1024 pulsos/revolución
   - Frecuencia: 10 kHz máximo
   - Precisión: ±0.1%

2. ACELERÓMETROS:
   - Tipo: MEMS 3-axis
   - Rango: ±16g
   - Resolución: 16 bits
   - Frecuencia: 1 kHz

3. GIROSCOPIOS:
   - Tipo: MEMS 3-axis
   - Rango: ±2000°/s
   - Resolución: 16 bits
   - Frecuencia: 1 kHz

4. GPS:
   - Tipo: GNSS multi-constelación
   - Precisión: ±3 metros
   - Frecuencia: 1 Hz
   - Disponibilidad: 95%
```

#### **5.1.2 ALGORITMO DE ODOMETRÍA**
```
ALGORITMO DE ODOMETRÍA:

1. FUSIÓN DE SENSORES:
   - Encoders: Posición relativa
   - Acelerómetros: Aceleración
   - Giroscopios: Velocidad angular
   - GPS: Posición absoluta

2. FILTRADO:
   - Filtro de Kalman extendido
   - Frecuencia: 100 Hz
   - Ventana: 1 segundo
   - Suavizado: Exponencial

3. CORRECCIÓN:
   - Eurobalises: Puntos de referencia
   - GPS: Corrección absoluta
   - Mapas: Corrección de ruta
   - Validación: Lógica de negocio

4. VALIDACIÓN:
   - Consistencia de datos
   - Límites físicos
   - Validación cruzada
   - Detección de fallos
```

### **5.2 PRECISIÓN Y RENDIMIENTO**

#### **5.2.1 ESPECIFICACIONES DE PRECISIÓN**
```
ESPECIFICACIONES DE PRECISIÓN:

POSICIÓN:
- Precisión absoluta: ±5 metros
- Precisión relativa: ±0.5 metros
- Resolución: 0.1 metros
- Actualización: 100 Hz

VELOCIDAD:
- Precisión: ±0.1 km/h
- Resolución: 0.01 km/h
- Rango: 0-300 km/h
- Actualización: 100 Hz

ACELERACIÓN:
- Precisión: ±0.01 m/s²
- Resolución: 0.001 m/s²
- Rango: ±10 m/s²
- Actualización: 100 Hz

ORIENTACIÓN:
- Precisión: ±1°
- Resolución: 0.1°
- Rango: 0-360°
- Actualización: 100 Hz
```

#### **5.2.2 RENDIMIENTO**
```
RENDIMIENTO ODOMETRÍA:

LATENCIA:
- Procesamiento: < 10 ms
- Comunicación: < 5 ms
- Total: < 15 ms
- Objetivo: < 20 ms

THROUGHPUT:
- Datos: 1000 muestras/segundo
- Procesamiento: 100 Hz
- Comunicación: 10 Hz
- Almacenamiento: 1 Hz

CONFIABILIDAD:
- Disponibilidad: > 99.9%
- MTBF: > 8760 horas
- MTTR: < 4 horas
- Redundancia: N+1
```

---

## 🔒 **SEGURIDAD Y CONFIABILIDAD**

### **6.1 ANÁLISIS DE SEGURIDAD**

#### **6.1.1 NIVELES DE INTEGRIDAD DE SEGURIDAD (SIL)**
```
ASIGNACIÓN SIL POR FUNCIÓN:

FUNCIONES SIL 4:
- Control de velocidad crítica
- Aplicación de frenado de emergencia
- Detección de sobrepaso de velocidad
- Validación de autorizaciones de movimiento

FUNCIONES SIL 3:
- Comunicación con RBC
- Lectura de Eurobalises
- Cálculo de odometría
- Interface con DMI

FUNCIONES SIL 2:
- Monitoreo del sistema
- Logging de eventos
- Interface con sistemas auxiliares
- Mantenimiento predictivo

FUNCIONES SIL 1:
- Interface de configuración
- Reportes de estado
- Comunicación con sistemas no críticos
- Herramientas de diagnóstico
```

#### **6.1.2 MEDIDAS DE SEGURIDAD**
```
MEDIDAS DE SEGURIDAD IMPLEMENTADAS:

1. REDUNDANCIA:
   - Procesadores: Dual-core
   - Memoria: ECC
   - Comunicaciones: Múltiples canales
   - Sensores: Validación cruzada

2. DETECCIÓN DE FALLOS:
   - Watchdog timers
   - Health checks continuos
   - Validación de datos
   - Monitoreo de rendimiento

3. AISLAMIENTO DE FALLOS:
   - Módulos independientes
   - Comunicación segura
   - Validación de interfaces
   - Recuperación automática

4. VALIDACIÓN DE DATOS:
   - Checksums en todos los mensajes
   - Validación de rangos
   - Validación de consistencia
   - Rechazo de datos corruptos

5. AUDITORÍA Y LOGGING:
   - Log completo de todas las operaciones
   - Trazabilidad de decisiones críticas
   - Análisis forense de incidentes
   - Reportes de seguridad
```

### **6.2 ANÁLISIS DE CONFIABILIDAD**

#### **6.2.1 CÁLCULO DE DISPONIBILIDAD**
```
CÁLCULO DISPONIBILIDAD STM:

CONFIGURACIÓN:
- MTBF: 8760 horas (1 año)
- MTTR: 4 horas
- Disponibilidad: 99.954%

COMPONENTES CRÍTICOS:
- CPU: MTBF = 8760h, MTTR = 2h
- Memoria: MTBF = 17520h, MTTR = 1h
- Comunicaciones: MTBF = 4380h, MTTR = 2h
- Sensores: MTBF = 8760h, MTTR = 1h

DISPONIBILIDAD SISTEMA:
A_sistema = A1 × A2 × A3 × A4
A_sistema = 0.9998 × 0.9999 × 0.9995 × 0.9999
A_sistema = 0.9991 = 99.91%

RESULTADO: Disponibilidad ≥ 99.9% ✅ CUMPLE
```

#### **6.2.2 MTBF Y MTTR**
```
MÉTRICAS DE CONFIABILIDAD:

MTBF (Mean Time Between Failures):
- STM completo: 8760 horas (1 año)
- Componentes individuales: 4380-17520 horas
- Sistema integrado: 4380 horas (6 meses)

MTTR (Mean Time To Repair):
- Detección de fallo: < 1 segundo
- Diagnóstico: 5-30 minutos
- Reparación: 1-4 horas
- Verificación: 15-60 minutos

AVAILABILITY TARGET:
- Objetivo: ≥ 99.9%
- Calculado: 99.91%
- Margen de seguridad: 0.01%
```

---

## 🔧 **PLAN DE IMPLEMENTACIÓN**

### **7.1 FASES DE DESARROLLO**

#### **7.1.1 FASE 1: ESPECIFICACIÓN (2 semanas)**
```
TAREA                    RESPONSABLE           PLAZO
Especificación hardware  Ing. Hardware         1 semana
Especificación software  Ing. Software         1 semana
Especificación interfaces Ing. Integración      1 semana
```

#### **7.1.2 FASE 2: DISEÑO (3 semanas)**
```
TAREA                    RESPONSABLE           PLAZO
Diseño hardware          Ing. Hardware         2 semanas
Diseño software          Ing. Software         3 semanas
Diseño interfaces        Ing. Integración      2 semanas
```

#### **7.1.3 FASE 3: IMPLEMENTACIÓN (6 semanas)**
```
TAREA                    RESPONSABLE           PLAZO
Desarrollo hardware      Proveedor HW          4 semanas
Desarrollo software      Proveedor SW          6 semanas
Integración sistemas     Ing. Integración      3 semanas
```

### **7.2 CRONOGRAMA CRÍTICO**

```
SEMANA 1-2:  Especificación detallada
SEMANA 3-5:  Diseño arquitectural
SEMANA 6-11: Implementación
SEMANA 12-14: Pruebas FAT
SEMANA 15-17: Pruebas SAT
SEMANA 18-19: Puesta en servicio
```

---

## 📊 **MÉTRICAS Y KPI**

### **8.1 MÉTRICAS DE RENDIMIENTO**

| Métrica | Objetivo | Medición | Frecuencia |
|:---|:---:|:---:|:---:|
| **Disponibilidad** | ≥ 99.9% | Uptime/Tiempo total | Diaria |
| **Latencia** | ≤ 100ms | Tiempo de respuesta | Por mensaje |
| **Precisión posición** | ±5m | Error de posicionamiento | Por viaje |
| **Tasa de fallos** | ≤ 0.1% | Fallos/Total operaciones | Mensual |

### **8.2 MÉTRICAS DE SEGURIDAD**

| Métrica | Objetivo | Medición | Frecuencia |
|:---|:---:|:---:|:---:|
| **Detección fallos** | ≤ 1s | Tiempo detección | Por fallo |
| **Respuesta emergencia** | ≤ 3s | Tiempo respuesta | Por evento |
| **SIL compliance** | 100% | Cumplimiento SIL | Mensual |
| **MTBF** | ≥ 8760h | Tiempo entre fallos | Mensual |

---

## 📋 **CONTROL DE VERSIONES**

| Versión | Fecha | Responsable | Descripción |
|:---:|:---:|:---|:---|
| **v1.1** | 27/01/2025 | Ing. Embarcados EPC | **Especificaciones STM Embarcadas** - Fase 2 urgente en desarrollo |
| **v1.0** | 27/01/2025 | Ing. Embarcados EPC | **Especificaciones STM inicial** - ETCS Level 2 especificado |
| **v0.1** | 27/01/2025 | Admin. Contractual EPC | **Especificaciones provisionales** - Desarrollo inicial |

---

## ✅ **CONCLUSIONES Y PRÓXIMOS PASOS**

### **🎯 ESTADO ACTUAL**
- ✅ **Especificaciones STM embarcadas desarrolladas** para ETCS Level 2
- ✅ **Arquitectura hardware y software** detallada y especificada
- ✅ **Interfaces de comunicación** GSM-R, Eurobalise y DMI definidas
- ✅ **Sistema de odometría** con precisión ±5 metros especificado

### **🔄 PRÓXIMOS PASOS INMEDIATOS**
1. **Validación técnica** de las especificaciones con especialistas
2. **Desarrollo de prototipos** hardware y software
3. **Pruebas de integración** con sistemas externos
4. **Plan de retrofit** para locomotoras existentes

### **📞 CONTACTOS**
- **Responsable Técnico:** Ing. Embarcados EPC
- **Especialista Senior:** Control de Trenes
- **Revisión:** Cada 2 semanas durante desarrollo

---

**Documento desarrollado según estándares EN 50126, EN 50128, EN 50129 y UIC 438**  
**Fecha:** 27 de Enero, 2025  
**Estado:** 🔄 **EN DESARROLLO - FASE 2 URGENTE**  
**Próxima actualización:** 3 de Febrero, 2025














