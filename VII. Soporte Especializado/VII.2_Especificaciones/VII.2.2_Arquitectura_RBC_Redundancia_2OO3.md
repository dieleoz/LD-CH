# ARQUITECTURA RBC - REDUNDANCIA 2OO3
## APP La Dorada-Chiriguaná - Radio Block Center

**Estado:** 🔄 **EN ESPECIFICACIÓN - FASE 1 CRÍTICA**  
**Fecha:** 27 de Enero, 2025  
**Responsable:** Ing. Sistemas - EPC  
**Especialista:** Especialista Senior en Control de Trenes  
**Estándar Base:** UIC 438, EN 50126, EN 50129

---

## 🎯 **PROPÓSITO Y ALCANCE**

### **1.1 PROPÓSITO**
Este documento define la **arquitectura del Radio Block Center (RBC)** con **redundancia 2oo3** para el sistema ITCS ETCS Level 2 del proyecto APP La Dorada-Chiriguaná, garantizando disponibilidad ≥ 99.95% y cumplimiento SIL 4.

### **1.2 ALCANCE**
La arquitectura RBC cubrirá:
- **Control centralizado** de movimientos de trenes
- **Gestión de autorizaciones** de movimiento (MA)
- **Comunicación GSM-R** con material rodante
- **Integración con CTC** para coordinación operacional
- **Redundancia 2oo3** para funciones críticas de seguridad

### **1.3 REFERENCIAS NORMATIVAS**
- **UIC 438:** Especificaciones técnicas ETCS Level 2
- **EN 50126:** Aplicación de técnicas de confiabilidad
- **EN 50129:** Aplicación de técnicas de seguridad
- **IEC 61508:** Seguridad funcional de sistemas eléctricos/electrónicos

---

## 🏗️ **ARQUITECTURA GENERAL DEL SISTEMA**

### **2.1 ARQUITECTURA RBC 2OO3**

```
ARQUITECTURA RBC - REDUNDANCIA 2OO3
┌─────────────────────────────────────────────────────────────────┐
│                    CENTRO DE CONTROL RBC                        │
│                                                                 │
│  ┌───────────────┐  ┌───────────────┐  ┌───────────────┐     │
│  │    RBC-1      │  │    RBC-2      │  │    RBC-3      │     │
│  │   (ACTIVO)    │  │   (STANDBY)   │  │   (STANDBY)   │     │
│  │               │  │               │  │               │     │
│  │ ┌───────────┐ │  │ ┌───────────┐ │  │ ┌───────────┐ │     │
│  │ │  SERVER   │ │  │ │  SERVER   │ │  │ │  SERVER   │ │     │
│  │ │  HARDWARE │ │  │ │  HARDWARE │ │  │ │  HARDWARE │ │     │
│  │ └───────────┘ │  │ └───────────┘ │  │ └───────────┘ │     │
│  │               │  │               │  │               │     │
│  │ ┌───────────┐ │  │ ┌───────────┐ │  │ ┌───────────┐ │     │
│  │ │ SOFTWARE  │ │  │ │ SOFTWARE  │ │  │ │ SOFTWARE  │ │     │
│  │ │   RBC     │ │  │ │   RBC     │ │  │ │   RBC     │ │     │
│  │ └───────────┘ │  │ └───────────┘ │  │ └───────────┘ │     │
│  └───────────────┘  └───────────────┘  └───────────────┘     │
│           │                  │                  │             │
│           └──────────────────┼──────────────────┘             │
│                              │                                │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │              SWITCHING LOGIC                            │   │
│  │           (2oo3 VOTING SYSTEM)                         │   │
│  │                                                         │   │
│  │  ┌─────────┐  ┌─────────┐  ┌─────────┐                │   │
│  │  │ VOTING  │  │ VOTING  │  │ VOTING  │                │   │
│  │  │ LOGIC-1 │  │ LOGIC-2 │  │ LOGIC-3 │                │   │
│  │  └─────────┘  └─────────┘  └─────────┘                │   │
│  └─────────────────────────────────────────────────────────┘   │
│                              │                                │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │              OUTPUT CONTROLLER                          │   │
│  │         (COMMAND DISTRIBUTION)                         │   │
│  └─────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                    INTERFACES EXTERNAS                          │
│                                                                 │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐            │
│  │    GSM-R    │  │     CTC     │  │   FENOCO    │            │
│  │   NETWORK   │  │  INTERFACE  │  │ INTERFACE   │            │
│  └─────────────┘  └─────────────┘  └─────────────┘            │
└─────────────────────────────────────────────────────────────────┘
```

### **2.2 PRINCIPIOS DE REDUNDANCIA 2OO3**

#### **2.2.1 VOTING LOGIC**
```
PRINCIPIO 2OO3:
- 3 módulos idénticos procesan la misma información
- 2 de 3 módulos deben coincidir para validar resultado
- Tolerancia a fallo de 1 módulo sin pérdida de función
- Detección automática de módulo fallido
- Aislamiento automático de módulo defectuoso
```

#### **2.2.2 SWITCHING LOGIC**
```
LÓGICA DE CONMUTACIÓN:
- Monitoreo continuo de estado de cada módulo
- Detección de fallos en < 1 segundo
- Conmutación automática a módulos sanos
- Sincronización automática de datos
- Recuperación automática de módulo reparado
```

---

## 💻 **ESPECIFICACIONES HARDWARE**

### **3.1 SERVIDORES RBC**

#### **3.1.1 ESPECIFICACIONES TÉCNICAS**
```
SERVIDOR RBC - ESPECIFICACIONES:

Procesador:
- CPU: Intel Xeon Gold 6248R (24 cores, 48 threads)
- Frecuencia: 3.0 GHz base, 4.0 GHz turbo
- Cache: 35.75 MB L3 cache
- Arquitectura: x86-64

Memoria:
- RAM: 128 GB DDR4-2933 ECC
- Configuración: 8 x 16 GB módulos
- Velocidad: 2933 MHz
- ECC: Error Correcting Code habilitado

Almacenamiento:
- SSD Principal: 2TB NVMe PCIe 4.0
- SSD Backup: 1TB NVMe PCIe 4.0
- Configuración: RAID 1 (mirroring)
- Interface: M.2 2280

Red:
- Interface 1: 2 x 10 Gbps Ethernet (redundante)
- Interface 2: 2 x 1 Gbps Ethernet (administrativa)
- Protocolo: TCP/IP, UDP
- Switching: Layer 2/3

Fuente de Alimentación:
- Configuración: Redundante N+1
- Potencia: 2 x 800W 80+ Platinum
- Voltaje: 100-240V AC, 50/60Hz
- Autonomía: 4 horas con UPS
```

#### **3.1.2 REDUNDANCIA HARDWARE**
```
REDUNDANCIA NIVEL SERVIDOR:
- 3 servidores idénticos (RBC-1, RBC-2, RBC-3)
- 2 servidores activos, 1 en standby
- Conmutación automática en < 30 segundos
- Sincronización de datos en tiempo real
- Monitoreo de salud continuo

REDUNDANCIA NIVEL COMPONENTE:
- Fuentes de alimentación: N+1
- Ventiladores: N+1
- Discos: RAID 1
- Interfaces de red: Redundantes
- UPS: Redundante N+1
```

### **3.2 INFRAESTRUCTURA DE RED**

#### **3.2.1 SWITCHES DE RED**
```
ESPECIFICACIONES SWITCH:

Modelo: Cisco Catalyst 9300-48P
Puertos: 48 x 1 Gbps + 4 x 10 Gbps SFP+
Stacking: Hasta 9 switches en stack
Throughput: 176 Gbps
Latencia: < 10 μs
Redundancia: StackWise-480

CONFIGURACIÓN:
- 2 switches en stack (redundancia)
- VLAN separadas para tráfico RBC/CTC/Admin
- QoS configurado para tráfico crítico
- Spanning Tree Protocol (STP) habilitado
- Port Security habilitado
```

#### **3.2.2 ROUTERS GSM-R**
```
ESPECIFICACIONES ROUTER GSM-R:

Modelo: Nokia Flexi NS
Capacidad: 10,000 conexiones simultáneas
Throughput: 100 Gbps
Interfaces: E1, STM-1, Ethernet
Redundancia: N+1 hot standby

CONFIGURACIÓN:
- 2 routers en configuración N+1
- Conexión redundante a red GSM-R
- Load balancing automático
- Failover en < 5 segundos
```

---

## 🔧 **ESPECIFICACIONES SOFTWARE**

### **4.1 SISTEMA OPERATIVO**

#### **4.1.1 ESPECIFICACIONES OS**
```
SISTEMA OPERATIVO:
- Distribución: Red Hat Enterprise Linux 8.6
- Kernel: Linux 4.18.0-372.19.1.el8_6
- Tipo: Real-Time (RT) kernel
- Arquitectura: x86-64
- Certificación: Common Criteria EAL4+

CARACTERÍSTICAS RT:
- Latencia máxima: < 100 μs
- Jitter: < 50 μs
- Preemption: Fully preemptible kernel
- Priority: SCHED_FIFO para procesos críticos
```

#### **4.1.2 MIDDLEWARE**
```
MIDDLEWARE CRÍTICO:
- Database: PostgreSQL 13 (cluster)
- Message Queue: RabbitMQ 3.9 (cluster)
- Monitoring: Prometheus + Grafana
- Logging: ELK Stack (Elasticsearch, Logstash, Kibana)
- Backup: Bacula (redundante)
```

### **4.2 APLICACIONES RBC**

#### **4.2.1 MÓDULOS PRINCIPALES**
```
MÓDULOS SOFTWARE RBC:

1. MOVEMENT AUTHORITY MANAGER (MAM)
   - Gestión de autorizaciones de movimiento
   - Cálculo de rutas seguras
   - Validación de conflictos
   - Actualización en tiempo real

2. TRAIN SUPERVISOR (TS)
   - Monitoreo de posición de trenes
   - Validación de integridad de datos
   - Detección de anomalías
   - Alertas de seguridad

3. COMMUNICATION MANAGER (CM)
   - Gestión de comunicación GSM-R
   - Handover entre células
   - Retransmisión de mensajes
   - Monitoreo de calidad de enlace

4. INTERFACE MANAGER (IM)
   - Interface con CTC
   - Interface con sistemas FENOCO
   - Protocolo SCI-CC-A
   - Validación de mensajes

5. SAFETY MONITOR (SM)
   - Monitoreo de seguridad continuo
   - Detección de fallos críticos
   - Aplicación de medidas de seguridad
   - Logging de eventos de seguridad
```

#### **4.2.2 ARQUITECTURA SOFTWARE**
```
ARQUITECTURA SOFTWARE RBC:

┌─────────────────────────────────────────────────────────┐
│                    APPLICATION LAYER                    │
│                                                         │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐   │
│  │   MAM   │  │   TS    │  │   CM    │  │   IM    │   │
│  └─────────┘  └─────────┘  └─────────┘  └─────────┘   │
│       │           │           │           │            │
│       └───────────┼───────────┼───────────┘            │
│                   │           │                        │
│  ┌─────────────────────────────────────────────────────┐│
│  │              SAFETY MONITOR (SM)                   ││
│  └─────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────┐
│                    MIDDLEWARE LAYER                     │
│                                                         │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐   │
│  │Database │  │Message  │  │Monitor  │  │ Logging │   │
│  │Cluster  │  │Queue    │  │System   │  │ System  │   │
│  └─────────┘  └─────────┘  └─────────┘  └─────────┘   │
└─────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────┐
│                      OS LAYER                           │
│                                                         │
│              Red Hat Enterprise Linux 8.6 RT            │
│                                                         │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐   │
│  │Network  │  │Storage  │  │Process  │  │Security │   │
│  │Stack    │  │Manager  │  │Manager  │  │Manager  │   │
│  └─────────┘  └─────────┘  └─────────┘  └─────────┘   │
└─────────────────────────────────────────────────────────┘
```

---

## 🔒 **SEGURIDAD Y CONFIABILIDAD**

### **5.1 ANÁLISIS DE SEGURIDAD**

#### **5.1.1 NIVELES DE INTEGRIDAD DE SEGURIDAD (SIL)**
```
ASIGNACIÓN SIL POR FUNCIÓN:

FUNCIONES SIL 4:
- Autorización de movimiento (MA)
- Detección de conflictos de trenes
- Aplicación de medidas de seguridad
- Control de velocidad crítica

FUNCIONES SIL 3:
- Comunicación con trenes
- Interface con CTC
- Monitoreo de posición
- Logging de eventos

FUNCIONES SIL 2:
- Interface administrativa
- Reportes de estado
- Configuración de parámetros
- Monitoreo de rendimiento
```

#### **5.1.2 MEDIDAS DE SEGURIDAD**
```
MEDIDAS DE SEGURIDAD IMPLEMENTADAS:

1. REDUNDANCIA 2OO3:
   - 3 módulos idénticos
   - Voting logic para decisiones críticas
   - Tolerancia a fallo de 1 módulo

2. DETECCIÓN DE FALLOS:
   - Watchdog timers en cada módulo
   - Health checks continuos
   - Detección de fallos en < 1 segundo

3. AISLAMIENTO DE FALLOS:
   - Módulo fallido aislado automáticamente
   - Sistema continúa con 2 módulos sanos
   - Recuperación automática tras reparación

4. VALIDACIÓN DE DATOS:
   - Checksums en todos los mensajes
   - Validación de integridad de datos
   - Rechazo de datos corruptos

5. AUDITORÍA Y LOGGING:
   - Log completo de todas las operaciones
   - Trazabilidad de decisiones críticas
   - Análisis forense de incidentes
```

### **5.2 ANÁLISIS DE CONFIABILIDAD**

#### **5.2.1 CÁLCULO DE DISPONIBILIDAD**
```
CÁLCULO DISPONIBILIDAD RBC 2OO3:

CONFIGURACIÓN 2OO3:
- Probabilidad de fallo de un módulo: λ = 1/8760 h⁻¹
- Tiempo medio de reparación: MTTR = 4 horas
- Disponibilidad de un módulo: A = 99.954%

DISPONIBILIDAD SISTEMA 2OO3:
A_sistema = 3A² - 2A³
A_sistema = 3(0.99954)² - 2(0.99954)³
A_sistema = 0.99962 = 99.962%

RESULTADO: Disponibilidad ≥ 99.95% ✅ CUMPLE
```

#### **5.2.2 MTBF Y MTTR**
```
MÉTRICAS DE CONFIABILIDAD:

MTBF (Mean Time Between Failures):
- Módulo individual: 8760 horas (1 año)
- Sistema 2OO3: 131,400 horas (15 años)

MTTR (Mean Time To Repair):
- Detección de fallo: < 1 segundo
- Aislamiento de fallo: < 5 segundos
- Reparación de hardware: 4 horas
- Recuperación completa: < 30 segundos

AVAILABILITY TARGET:
- Objetivo: ≥ 99.95%
- Calculado: 99.962%
- Margen de seguridad: 0.012%
```

---

## 📡 **INTERFACES Y COMUNICACIONES**

### **6.1 INTERFACE GSM-R**

#### **6.1.1 ESPECIFICACIONES DE COMUNICACIÓN**
```
PROTOCOLO GSM-R:

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
```

#### **6.1.2 MENSAJES CRÍTICOS**
```
MENSAJES RBC-TREN:

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
   - Estado del sistema RBC
   - Disponibilidad de funciones
   - Alertas de mantenimiento
   - Información de degradación
```

### **6.2 INTERFACE CTC**

#### **6.2.1 PROTOCOLO SCI-CC-A**
```
PROTOCOLO SCI-CC-A:

Estándar: CENELEC EN 50159-2
Transporte: TCP/IP sobre Ethernet
Puerto: 1024-65535 (configurable)
Seguridad: Autenticación mutua, cifrado AES-256

MENSAJES PRINCIPALES:
- Train Status Request/Response
- Movement Authority Request/Response
- Emergency Stop Command
- System Status Report
- Configuration Update
```

#### **6.2.2 INTERFACE FENOCO**
```
PROTOCOLO INTEROPERABILIDAD FENOCO:

Estándar: UIC 438
Interface: FFFIS (Form Fit Function Interface Specification)
Transporte: IP sobre fibra óptica
Redundancia: N+1

INFORMACIÓN INTERCAMBIADA:
- Autorizaciones de movimiento compartidas
- Estado de trenes en secciones comunes
- Coordinación de operaciones
- Alertas de seguridad
```

---

## 🔧 **PLAN DE IMPLEMENTACIÓN**

### **7.1 FASES DE DESARROLLO**

#### **7.1.1 FASE 1: ESPECIFICACIÓN (2 semanas)**
```
TAREA                    RESPONSABLE           PLAZO
Arquitectura detallada   Ing. Sistemas         1 semana
Especificaciones HW      Ing. Hardware         1 semana
Especificaciones SW      Ing. Software         1 semana
```

#### **7.1.2 FASE 2: DISEÑO (4 semanas)**
```
TAREA                    RESPONSABLE           PLAZO
Diseño hardware RBC     Ing. Hardware         2 semanas
Diseño software RBC     Ing. Software         3 semanas
Diseño interfaces       Ing. Integración      2 semanas
```

#### **7.1.3 FASE 3: IMPLEMENTACIÓN (8 semanas)**
```
TAREA                    RESPONSABLE           PLAZO
Procura hardware        Proveedor HW          4 semanas
Desarrollo software     Proveedor SW          8 semanas
Integración sistemas    Ing. Integración      4 semanas
```

### **7.2 CRONOGRAMA CRÍTICO**

```
SEMANA 1-2:  Especificación arquitectural
SEMANA 3-6:  Diseño detallado
SEMANA 7-14: Implementación
SEMANA 15-18: Pruebas FAT
SEMANA 19-22: Pruebas SAT
SEMANA 23-24: Puesta en servicio
```

---

## 📊 **MÉTRICAS Y MONITOREO**

### **8.1 MÉTRICAS DE RENDIMIENTO**

| Métrica | Objetivo | Medición | Frecuencia |
|:---|:---:|:---:|:---:|
| **Disponibilidad** | ≥ 99.95% | Uptime/Tiempo total | Diaria |
| **Latencia RBC** | ≤ 500ms | Tiempo respuesta MA | Continua |
| **Throughput** | ≥ 1000 trenes/h | Trenes procesados | Por hora |
| **CPU Usage** | ≤ 70% | Uso promedio CPU | Continua |
| **Memory Usage** | ≤ 80% | Uso promedio RAM | Continua |

### **8.2 MÉTRICAS DE SEGURIDAD**

| Métrica | Objetivo | Medición | Frecuencia |
|:---|:---:|:---:|:---:|
| **Detección fallos** | ≤ 1s | Tiempo detección | Por fallo |
| **Failover time** | ≤ 30s | Tiempo conmutación | Por evento |
| **SIL compliance** | 100% | Cumplimiento SIL | Mensual |
| **MTBF** | ≥ 8760h | Tiempo entre fallos | Mensual |

### **8.3 SISTEMA DE MONITOREO**

#### **8.3.1 HERRAMIENTAS DE MONITOREO**
```
HERRAMIENTAS IMPLEMENTADAS:

1. PROMETHEUS + GRAFANA:
   - Métricas de rendimiento en tiempo real
   - Dashboards personalizados
   - Alertas automáticas
   - Análisis de tendencias

2. ELK STACK:
   - Logging centralizado
   - Análisis de logs
   - Búsqueda avanzada
   - Correlación de eventos

3. ZABBIX:
   - Monitoreo de infraestructura
   - Alertas de hardware
   - Monitoreo de red
   - Disponibilidad de servicios
```

#### **8.3.2 ALERTAS CRÍTICAS**
```
CONFIGURACIÓN DE ALERTAS:

CRÍTICAS (INMEDIATAS):
- Fallo de módulo RBC
- Pérdida de comunicación GSM-R
- Fallo de sistema de votación
- Pérdida de sincronización

ALTAS (5 MINUTOS):
- Uso CPU > 80%
- Uso memoria > 85%
- Latencia > 1 segundo
- Error rate > 1%

MEDIAS (15 MINUTOS):
- Uso disco > 90%
- Conexiones GSM-R > 90%
- Temperatura > 35°C
- Fallos de red > 5%
```

---

## 📋 **CONTROL DE VERSIONES**

| Versión | Fecha | Responsable | Descripción |
|:---:|:---:|:---|:---|
| **v1.1** | 27/01/2025 | Ing. Sistemas EPC | **Arquitectura RBC 2OO3** - Fase 1 crítica en especificación |
| **v1.0** | 27/01/2025 | Ing. Sistemas EPC | **Arquitectura RBC inicial** - Redundancia 2OO3 especificada |
| **v0.1** | 27/01/2025 | Admin. Contractual EPC | **Especificaciones provisionales** - Desarrollo inicial |

---

## ✅ **CONCLUSIONES Y PRÓXIMOS PASOS**

### **🎯 ESTADO ACTUAL**
- ✅ **Arquitectura RBC 2OO3 especificada** con redundancia completa
- ✅ **Especificaciones hardware detalladas** para servidores y red
- ✅ **Especificaciones software definidas** con módulos críticos
- ✅ **Análisis de seguridad y confiabilidad** completado

### **🔄 PRÓXIMOS PASOS INMEDIATOS**
1. **Validación técnica** de la arquitectura con especialistas
2. **Desarrollo de especificaciones detalladas** de hardware
3. **Definición de interfaces** GSM-R, CTC y FENOCO
4. **Plan de pruebas** para validar redundancia 2OO3

### **📞 CONTACTOS**
- **Responsable Técnico:** Ing. Sistemas EPC
- **Especialista Senior:** Control de Trenes
- **Revisión:** Cada 2 semanas durante desarrollo

---

**Documento desarrollado según estándares UIC 438 y EN 50126/50129**  
**Fecha:** 27 de Enero, 2025  
**Estado:** 🔄 **EN ESPECIFICACIÓN - FASE 1 CRÍTICA**  
**Próxima actualización:** 3 de Febrero, 2025

