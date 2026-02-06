# ESTUDIO DE REFERENCIA - ESCENARIO ITCS (BENCHMARK)
## APP La Dorada-Chiriguaná - Documento de Consulta (No Vinculante)

**Estado:** ⚠️ **EN RE-LINEACIÓN (PHASE 7 - DESCONTAMINACIÓN TÉCNICA)**
**Fecha:** Enero 2025
**Nota:** Este documento constituye un estudio de referencia de mercado y no representa el diseño mandatorio del proyecto.

---

## 🎯 **PROPÓSITO Y ALCANCE**

### **1.1 PROPÓSITO**
Este documento define las **Especificaciones de Requisitos del Sistema (SRS)** para el **Sistema de Control de Trenes ITCS ETCS Level 2** del proyecto APP La Dorada-Chiriguaná, basado en estándares internacionales UIC y CENELEC.

### **1.2 ALCANCE**
El sistema ITCS ETCS Level 2 cubrirá:
- **Corredor completo:** La Dorada - Chiriguaná (1,291 km)
- **5 estaciones principales:** La Dorada, Puerto Salgar, Honda, Mariquita, Chiriguaná
- **146 pasos a nivel:** Integración con sistemas de señalización
- **Interoperabilidad:** Compatibilidad con sistemas FENOCO
- **Material rodante:** Retrofit de locomotoras existentes

### **1.3 REFERENCIAS NORMATIVAS**
- **EN 50126:** Aplicación de técnicas de confiabilidad para sistemas ferroviarios
- **EN 50128:** Software para sistemas de control ferroviario
- **EN 50129:** Aplicación de técnicas de seguridad para sistemas de señalización ferroviaria
- **UIC 438:** Especificaciones técnicas para ETCS Level 2
- **IEC 62290:** Sistemas de control automático de trenes (CBTC)

---

## 📊 **REQUISITOS FUNCIONALES DEL SISTEMA**

### **2.1 REQUISITOS DE CONTROL DE TRENES**

#### **2.1.1 CONTROL AUTOMÁTICO DE VELOCIDAD**
```
RF-001: El sistema ITCS debe controlar automáticamente la velocidad del tren
        basado en la autorización de movimiento (MA) recibida del RBC.

RF-002: El sistema debe implementar curvas de velocidad dinámicas
        considerando el perfil de vía y las condiciones operacionales.

RF-003: El sistema debe aplicar frenado automático cuando el tren
        exceda la velocidad autorizada o se acerque a un obstáculo.
```

#### **2.1.2 AUTORIZACIÓN DE MOVIMIENTO (MA)**
```
RF-004: El sistema debe solicitar y recibir autorizaciones de movimiento
        del Radio Block Center (RBC) para cada sección de vía.

RF-005: El sistema debe validar la integridad de la autorización de movimiento
        antes de permitir el avance del tren.

RF-006: El sistema debe gestionar la renovación automática de autorizaciones
        durante el movimiento del tren.
```

#### **2.1.3 DETECCIÓN DE POSICIÓN**
```
RF-007: El sistema debe determinar la posición exacta del tren
        con precisión de ±5 metros.

RF-008: El sistema debe utilizar Eurobalises como puntos de referencia
        para corrección de posición.

RF-009: El sistema debe implementar odometría para seguimiento continuo
        entre Eurobalises.
```

### **2.2 REQUISITOS DE COMUNICACIÓN**

#### **2.2.1 COMUNICACIÓN RADIO (GSM-R)**
```
RF-010: El sistema debe mantener comunicación continua con el RBC
        a través de la red GSM-R.

RF-011: El sistema debe implementar handover automático entre células GSM-R
        sin pérdida de comunicación crítica.

RF-012: El sistema debe gestionar la degradación de comunicación
        según protocolos ETCS Level 2.
```

#### **2.2.2 INTERFACES CON SISTEMAS EXTERNOS**
```
RF-013: El sistema debe comunicarse con el Centro de Control de Tráfico (CTC)
        para coordinación operacional.

RF-014: El sistema debe integrarse con sistemas de señalización local
        en estaciones y pasos a nivel.

RF-015: El sistema debe interoperar con sistemas FENOCO
        según protocolos UIC estándar.
```

### **2.3 REQUISITOS DE INTERFAZ HUMANA**

#### **2.3.1 INTERFAZ MAQUINA-CONDUCTOR (DMI)**
```
RF-016: El sistema debe proporcionar información clara al conductor
        sobre velocidad, límites y autorizaciones.

RF-017: El sistema debe alertar al conductor sobre situaciones anómalas
        mediante indicaciones visuales y acústicas.

RF-018: El sistema debe permitir al conductor confirmar acciones
        críticas del sistema.
```

---

## 🛡️ **REQUISITOS DE SEGURIDAD Y CONFIABILIDAD**

### **3.1 REQUISITOS DE SEGURIDAD**

#### **3.1.1 NIVELES DE INTEGRIDAD DE SEGURIDAD (SIL)**
```
RS-001: El sistema debe cumplir SIL 4 para funciones críticas de seguridad
        según EN 50129.

RS-002: Las funciones de frenado de emergencia deben tener SIL 4
        con redundancia 2oo3.

RS-003: Las funciones de autorización de movimiento deben tener SIL 3
        con redundancia N+1.
```

#### **3.1.2 ANÁLISIS DE RIESGOS (HAZOP)**
```
RS-004: El sistema debe implementar medidas de mitigación para:
        - Pérdida de comunicación con RBC
        - Fallo de detección de posición
        - Mal funcionamiento de Eurobalises
        - Interferencia electromagnética
```

### **3.2 REQUISITOS DE CONFIABILIDAD**

#### **3.2.1 DISPONIBILIDAD**
```
RC-001: El sistema debe mantener disponibilidad ≥ 99.95%
        durante operación normal.

RC-002: El tiempo de recuperación ante fallos debe ser ≤ 4 horas
        para fallos no críticos.

RC-003: El sistema debe implementar modos de degradación
        que mantengan operación segura.
```

#### **3.2.2 REDUNDANCIA**
```
RC-004: El RBC debe implementar arquitectura redundante 2oo3
        para funciones críticas.

RC-005: Los equipos embarcados deben tener redundancia N+1
        para sistemas de comunicación.

RC-006: Las Eurobalises deben tener redundancia física
        en ubicaciones críticas.
```

---

## 🏗️ **ARQUITECTURA DEL SISTEMA**

### **4.1 ARQUITECTURA GENERAL**

#### **4.1.1 COMPONENTES PRINCIPALES**
```
COMPONENTE                    FUNCIÓN PRINCIPAL              UBICACIÓN
Radio Block Center (RBC)      Control centralizado           Centro de Control
Eurobalises                   Referencias de posición        Vía (cada 150m)
STM Embarcado                 Control automático tren        Locomotora
DMI                           Interfaz conductor-sistema     Cabina conductor
GSM-R                         Comunicación radio             Red celular
```

#### **4.1.2 ARQUITECTURA RBC**
```
ARQUITECTURA RBC - REDUNDANCIA 2OO3
┌─────────────────────────────────────────────────────────┐
│                    RBC PRIMARY                          │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐    │
│  │   RBC-1     │  │   RBC-2     │  │   RBC-3     │    │
│  │  (ACTIVO)   │  │  (STANDBY)  │  │  (STANDBY)  │    │
│  └─────────────┘  └─────────────┘  └─────────────┘    │
│           │              │              │              │
│           └──────────────┼──────────────┘              │
│                         │                              │
│  ┌─────────────────────────────────────────────────────┐│
│  │            SWITCHING LOGIC                          ││
│  │         (2oo3 VOTING SYSTEM)                       ││
│  └─────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────┘
```

### **4.2 ARQUITECTURA EMBARCADA**

#### **4.2.1 STM (Specific Transmission Module)**
```
FUNCIONES STM:
- Procesamiento de mensajes Eurobalise
- Cálculo de velocidad y posición
- Gestión de autorizaciones de movimiento
- Control de frenado automático
- Comunicación con RBC via GSM-R
```

#### **4.2.2 DMI (Driver Machine Interface)**
```
INFORMACIÓN DMI:
- Velocidad actual vs. velocidad objetivo
- Distancia hasta próximo límite de velocidad
- Estado del sistema ITCS
- Alertas y alarmas
- Confirmaciones requeridas
```

---

## 📡 **REQUISITOS DE INTEROPERABILIDAD**

### **5.1 INTEROPERABILIDAD FENOCO**

#### **5.1.1 PROTOCOLOS DE COMUNICACIÓN**
```
RI-001: El sistema debe implementar protocolos UIC 438
        para interoperabilidad con FENOCO.

RI-002: El sistema debe soportar intercambio de información
        de autorizaciones de movimiento.

RI-003: El sistema debe coordinar operaciones en secciones compartidas
        con sistemas FENOCO.
```

#### **5.1.2 INTERFACES TÉCNICAS**
```
RI-004: Interface física: Conectores estándar UIC
RI-005: Interface eléctrica: Señales 24V DC, RS-485
RI-006: Interface de comunicación: Protocolo FFFIS
```

### **5.2 INTEROPERABILIDAD CTC**

#### **5.2.1 PROTOCOLO SCI-CC-A**
```
RI-007: El sistema debe implementar protocolo SCI-CC-A
        según CENELEC para comunicación con CTC.

RI-008: El sistema debe intercambiar información de:
        - Estado de trenes
        - Autorizaciones de movimiento
        - Alarmas y eventos
        - Datos de telemetría
```

---

## 🔧 **REQUISITOS TÉCNICOS DETALLADOS**

### **6.1 ESPECIFICACIONES HARDWARE**

#### **6.1.1 RBC (Radio Block Center)**
```
ESPECIFICACIONES RBC:
- Procesadores: 3x servidores redundantes
- Memoria: 64GB RAM por servidor
- Almacenamiento: 2TB SSD RAID 1
- Red: Ethernet 1Gbps redundante
- UPS: 4 horas de autonomía
- Aire acondicionado: Redundante N+1
```

#### **6.1.2 STM EMBARCADO**
```
ESPECIFICACIONES STM:
- Procesador: ARM Cortex-A9 dual-core
- Memoria: 4GB RAM, 32GB Flash
- Interfaces: GSM-R, Eurobalise, DMI, Odometría
- Alimentación: 24V DC (12V-36V rango)
- Temperatura: -25°C a +70°C
- Humedad: 0-95% sin condensación
```

#### **6.1.3 EUROBALISES**
```
ESPECIFICACIONES EUROBALISE:
- Frecuencia: 27.095 MHz
- Potencia: 4W (transmisión)
- Alcance: 0.5m - 1.5m
- Temperatura: -40°C a +85°C
- Protección: IP67
- Vida útil: 15 años
```

### **6.2 ESPECIFICACIONES SOFTWARE**

#### **6.2.1 SISTEMA OPERATIVO**
```
REQUISITOS SOFTWARE:
- OS: Linux RT (Real-Time)
- Kernel: Versión 4.19 o superior
- Tiempo real: Latencia < 1ms
- Seguridad: Certificación Common Criteria EAL4+
```

#### **6.2.2 APLICACIONES CRÍTICAS**
```
APLICACIONES RBC:
- Sistema de gestión de movimientos
- Algoritmo de autorización de movimientos
- Sistema de comunicación GSM-R
- Interface con CTC
- Sistema de logging y auditoría
```

---

## 📋 **PLAN DE VERIFICACIÓN Y VALIDACIÓN (V&V)**

### **7.1 ESTRATEGIA DE V&V**

#### **7.1.1 VERIFICACIÓN EN FÁBRICA (FAT)**
```
FAT-001: Pruebas unitarias de componentes individuales
FAT-002: Pruebas de integración de subsistemas
FAT-003: Pruebas de rendimiento bajo carga
FAT-004: Pruebas de compatibilidad electromagnética (EMC)
FAT-005: Pruebas de seguridad funcional
```

#### **7.1.2 VALIDACIÓN EN SITIO (SAT)**
```
SAT-001: Pruebas de comunicación RBC-Tren
SAT-002: Pruebas de detección de posición
SAT-003: Pruebas de autorización de movimiento
SAT-004: Pruebas de interoperabilidad FENOCO
SAT-005: Pruebas de integración con CTC
```

### **7.2 CRITERIOS DE ACEPTACIÓN**

#### **7.2.1 CRITERIOS FUNCIONALES**
```
CA-001: Sistema debe controlar velocidad con precisión ±2 km/h
CA-002: Sistema debe detectar posición con precisión ±5 metros
CA-003: Sistema debe responder a comandos en < 500ms
CA-004: Sistema debe mantener comunicación 99.9% del tiempo
```

#### **7.2.2 CRITERIOS DE SEGURIDAD**
```
CA-005: Sistema debe aplicar frenado de emergencia en < 3 segundos
CA-006: Sistema debe detectar fallos críticos en < 1 segundo
CA-007: Sistema debe mantener operación segura ante fallos
CA-008: Sistema debe cumplir SIL 4 para funciones críticas
```

---

## 🚀 **PLAN DE IMPLEMENTACIÓN**

### **8.1 FASES DE DESARROLLO**

#### **8.1.1 FASE 1: ESPECIFICACIÓN (2 semanas)**
```
TAREA                    RESPONSABLE           PLAZO
Detalle SRS completo     Ing. Sistemas         1 semana
Arquitectura detallada   Ing. Arquitectura     1 semana
Plan V&V detallado       Ing. Calidad          1 semana
```

#### **8.1.2 FASE 2: DISEÑO (4 semanas)**
```
TAREA                    RESPONSABLE           PLAZO
Diseño RBC               Ing. Sistemas         2 semanas
Diseño STM               Ing. Embarcados       2 semanas
Diseño DMI               Ing. Interfaces       2 semanas
```

#### **8.1.3 FASE 3: IMPLEMENTACIÓN (8 semanas)**
```
TAREA                    RESPONSABLE           PLAZO
Desarrollo RBC           Proveedor Software    6 semanas
Desarrollo STM           Proveedor Hardware    8 semanas
Integración sistemas     Ing. Integración      4 semanas
```

### **8.2 CRONOGRAMA CRÍTICO**

```
SEMANA 1-2:  Especificación detallada
SEMANA 3-6:  Diseño arquitectural
SEMANA 7-14: Desarrollo e implementación
SEMANA 15-18: Pruebas FAT
SEMANA 19-22: Pruebas SAT
SEMANA 23-24: Puesta en servicio
```

---

## 📊 **MÉTRICAS Y KPI**

### **9.1 MÉTRICAS DE RENDIMIENTO**

| Métrica | Objetivo | Medición | Frecuencia |
|:---|:---:|:---:|:---:|
| **Disponibilidad** | ≥ 99.95% | Uptime/Tiempo total | Diaria |
| **Latencia RBC** | ≤ 500ms | Tiempo respuesta | Continua |
| **Precisión posición** | ±5m | Error de posicionamiento | Por viaje |
| **Comunicación** | ≥ 99.9% | Mensajes exitosos | Continua |

### **9.2 MÉTRICAS DE SEGURIDAD**

| Métrica | Objetivo | Medición | Frecuencia |
|:---|:---:|:---:|:---:|
| **Detección fallos** | ≤ 1s | Tiempo detección | Por fallo |
| **Frenado emergencia** | ≤ 3s | Tiempo aplicación | Por evento |
| **SIL compliance** | 100% | Cumplimiento SIL | Mensual |
| **MTBF** | ≥ 8760h | Tiempo entre fallos | Mensual |

---

## 🔒 **REQUISITOS DE CIBERSEGURIDAD**

### **10.1 SEGURIDAD DE RED**

#### **10.1.1 PROTECCIÓN PERIMETRAL**
```
CS-001: El sistema debe implementar firewalls entre redes
        operacionales y administrativas.

CS-002: El sistema debe utilizar VPN para comunicaciones externas
        con cifrado AES-256.

CS-003: El sistema debe implementar detección de intrusiones (IDS)
        en tiempo real.
```

#### **10.1.2 AUTENTICACIÓN Y AUTORIZACIÓN**
```
CS-004: El sistema debe implementar autenticación multifactor
        para accesos administrativos.

CS-005: El sistema debe gestionar roles y permisos
        según principio de menor privilegio.

CS-006: El sistema debe registrar todas las actividades
        de usuarios y sistemas.
```

---

## 📋 **CONTROL DE VERSIONES**

| Versión | Fecha | Responsable | Descripción |
|:---:|:---:|:---|:---|
| **v1.1** | 27/01/2025 | Ing. Sistemas EPC | **SRS ITCS Provisional** - Fase 1 crítica iniciada |
| **v1.0** | 27/01/2025 | Ing. Sistemas EPC | **SRS ITCS inicial** - Basado en ETCS Level 2 |
| **v0.1** | 27/01/2025 | Admin. Contractual EPC | **Especificaciones provisionales** - Desarrollo inicial |

---

## ✅ **CONCLUSIONES Y PRÓXIMOS PASOS**

### **🎯 ESTADO ACTUAL**
- ✅ **SRS ITCS Provisional desarrollado** basado en estándares internacionales
- ✅ **Requisitos funcionales definidos** según ETCS Level 2
- ✅ **Arquitectura del sistema especificada** con redundancia 2oo3
- ✅ **Plan de implementación establecido** con cronograma crítico

### **🔄 PRÓXIMOS PASOS INMEDIATOS**
1. **Validación técnica** del SRS con especialistas ETCS
2. **Desarrollo de arquitectura detallada** RBC y STM
3. **Definición de interfaces** CTC-ITCS y FENOCO
4. **Plan de pruebas** FAT/SAT detallado

### **📞 CONTACTOS**
- **Responsable Técnico:** Ing. Sistemas EPC
- **Especialista Senior:** Control de Trenes
- **Revisión:** Cada 2 semanas durante desarrollo

---

**Documento desarrollado según estándares EN 50126/50128/50129**  
**Fecha:** 02 de Octubre, 2025  
**Estado:** ✅ **COMPLETADO**  
**Próxima actualización:** 3 de Febrero, 2025

