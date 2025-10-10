# V.2 Centro de Control de Tráfico (CTC) - Ingeniería de Detalle (v1.0)

**Versión:** 1.0  
**Fecha:** 02/10/2025  
**Sistema:** Centro de Control de Tráfico (CTC)  
**Fase:** D. Ingeniería de Detalle  
**Referencias:** EN 50126/50128/50129, IEC 62290, UIC 615, FFFIS CTC–ITCS

---

## 1. Resumen Ejecutivo

Este documento detalla la ingeniería del Centro de Control de Tráfico (CTC) para el proyecto APP La Dorada-Chiriguaná, abarcando la arquitectura, los componentes, la lógica de operación, la integración con ITCS y los criterios de seguridad y rendimiento.

> **📋 DOCUMENTO MAESTRO CONSOLIDADO:** Para la versión definitiva y consolidada del sistema CTC, consulte: `IV. Ingenieria básica/SIS_CTC_Definitivo_v1.0.md`

### 1.1 Alcance del Sistema CTC
- **Sistema principal:** Centro de Control de Tráfico
- **Componentes:** Servidores, estaciones de trabajo, interfaces, comunicaciones
- **Cobertura:** 146 km de vía, 5 estaciones, 146 pasos a nivel
- **Capacidad:** Hasta 24 trenes simultáneos

### 1.2 Objetivos del Sistema
- **Control centralizado:** Gestión unificada del tráfico ferroviario
- **Supervisión en tiempo real:** Monitoreo continuo de operaciones
- **Integración ITCS:** Comunicación bidireccional con ETCS Level 2
- **Disponibilidad:** 99.95% de disponibilidad operacional
- **Seguridad:** Cumplimiento EN 50126/50128/50129

---

## 2. Arquitectura del Sistema

### 2.1 Arquitectura General
```
┌─────────────────────────────────────────────────────────────┐
│                    CENTRO DE CONTROL DE TRÁFICO (CTC)        │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │   Servidor  │  │   Servidor  │  │   Servidor  │         │
│  │  Principal  │  │  Secundario │  │   Backup    │         │
│  │   (2oo3)    │  │   (2oo3)    │  │   (2oo3)    │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │ Estación de │  │ Estación de │  │ Estación de │         │
│  │  Trabajo    │  │  Trabajo    │  │  Trabajo    │         │
│  │ Operador    │  │ Supervisor  │  │ Mantenimiento│         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │  Interface  │  │  Interface  │  │  Interface  │         │
│  │    ITCS     │  │    SCADA    │  │  Comunicación│         │
│  │  (FFFIS)    │  │   (OPC UA)  │  │   (GSM-R)   │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
└─────────────────────────────────────────────────────────────┘
```

### 2.2 Componentes Principales

#### 2.2.1 Servidores de Control
- **Servidor Principal:** Procesamiento en tiempo real
- **Servidor Secundario:** Redundancia y respaldo
- **Servidor Backup:** Continuidad operacional
- **Arquitectura:** 2oo3 (2 de 3) para máxima disponibilidad

#### 2.2.2 Estaciones de Trabajo
- **Estación Operador:** Control diario del tráfico
- **Estación Supervisor:** Supervisión y coordinación
- **Estación Mantenimiento:** Diagnóstico y mantenimiento
- **Estación Emergencia:** Control de contingencias

#### 2.2.3 Interfaces de Comunicación
- **Interface ITCS:** Comunicación con ETCS Level 2
- **Interface SCADA:** Supervisión de sistemas auxiliares
- **Interface Comunicación:** Enlaces con operadores externos

---

## 3. Especificaciones Técnicas

### 3.1 Hardware

#### 3.1.1 Servidores
- **Procesador:** Intel Xeon Gold 6248R (24 cores, 3.0 GHz)
- **Memoria:** 128 GB DDR4 ECC
- **Almacenamiento:** 2 TB SSD NVMe + 10 TB HDD
- **Red:** 2x 10 Gbps Ethernet
- **Fuente:** 2x 750W redundantes
- **Rack:** 19" 2U

#### 3.1.2 Estaciones de Trabajo
- **Procesador:** Intel Core i7-12700K (12 cores, 3.6 GHz)
- **Memoria:** 32 GB DDR4
- **Almacenamiento:** 1 TB SSD NVMe
- **Pantalla:** 2x 27" 4K UHD
- **Red:** 1 Gbps Ethernet
- **Fuente:** 650W

#### 3.1.3 Red y Comunicaciones
- **Switch Principal:** Cisco Catalyst 9300 (48 puertos)
- **Switch Redundante:** Cisco Catalyst 9300 (48 puertos)
- **Router:** Cisco ISR 4331
- **Firewall:** Cisco ASA 5525-X
- **UPS:** APC Smart-UPS 3000VA

### 3.2 Software

#### 3.2.1 Sistema Operativo
- **Servidores:** Red Hat Enterprise Linux 8.5
- **Estaciones:** Windows 10 Enterprise LTSC
- **Actualizaciones:** Automáticas con validación

#### 3.2.2 Software de Control
- **CTC Core:** Sistema propietario Grupo Ortiz
- **Base de Datos:** PostgreSQL 13
- **Middleware:** RabbitMQ 3.9
- **Monitoreo:** Zabbix 5.4

#### 3.2.3 Interfaces
- **ITCS Interface:** FFFIS v2.1
- **SCADA Interface:** OPC UA v1.04
- **Comunicación:** GSM-R v8.0

---

## 4. Funcionalidades del Sistema

### 4.1 Control de Tráfico

#### 4.1.1 Gestión de Rutas
- **Planificación:** Rutas automáticas y manuales
- **Optimización:** Algoritmos de optimización de tráfico
- **Conflictos:** Detección y resolución automática
- **Prioridades:** Gestión de prioridades de trenes

#### 4.1.2 Supervisión en Tiempo Real
- **Posición de Trenes:** Tracking en tiempo real
- **Estado de Vías:** Monitoreo continuo
- **Señales:** Control y supervisión
- **Alarmas:** Gestión de alarmas y eventos

### 4.2 Integración ITCS

#### 4.2.1 Comunicación Bidireccional
- **Estado de Trenes:** Recepción de posiciones
- **Autorizaciones:** Envío de Movement Authority
- **Comandos:** Control remoto de trenes
- **Eventos:** Intercambio de eventos críticos

#### 4.2.2 Interfaces FFFIS
- **IF-001:** Estado de trenes (RBC → CTC)
- **IF-002:** Autorización de rutas (CTC → RBC)
- **IF-003:** Señales y enclavamientos (CTC → RBC)
- **IF-004:** Alarmas y eventos (RBC → CTC)
- **IF-005:** Comandos de emergencia (CTC → RBC)
- **IF-006:** Estado del sistema (RBC → CTC)
- **IF-007:** Configuración (CTC → RBC)
- **IF-008:** Logs y trazabilidad (RBC → CTC)

### 4.3 Gestión de Emergencias

#### 4.3.1 Procedimientos de Emergencia
- **Parada de Emergencia:** Comando inmediato
- **Evacuación:** Procedimientos de evacuación
- **Comunicación:** Enlaces de emergencia
- **Coordinación:** Integración con servicios de emergencia

#### 4.3.2 Modos de Operación
- **Normal:** Operación estándar
- **Degradado:** Operación con limitaciones
- **Emergencia:** Procedimientos de emergencia
- **Mantenimiento:** Modo de mantenimiento

---

## 5. Seguridad y Confiabilidad

### 5.1 Seguridad Funcional (EN 50126/50128/50129)

#### 5.1.1 Objetivos de Seguridad
- **SIL 4:** Funciones críticas de seguridad
- **SIL 3:** Funciones de control
- **SIL 2:** Funciones de supervisión
- **SIL 1:** Funciones auxiliares

#### 5.1.2 Arquitectura de Seguridad
- **Redundancia:** 2oo3 en componentes críticos
- **Diversidad:** Diferentes tecnologías
- **Aislamiento:** Separación física y lógica
- **Monitoreo:** Supervisión continua

### 5.2 Ciberseguridad (IEC 62443)

#### 5.2.1 Zonas de Seguridad
- **Zona 0:** Red de control crítico
- **Zona 1:** Red de supervisión
- **Zona 2:** Red administrativa
- **Zona 3:** Red externa

#### 5.2.2 Medidas de Protección
- **Firewall:** Protección perimetral
- **IDS/IPS:** Detección de intrusiones
- **Antivirus:** Protección de endpoints
- **Backup:** Respaldo y recuperación

### 5.3 Disponibilidad

#### 5.3.1 Objetivos de Disponibilidad
- **Disponibilidad:** 99.95% (4.38 horas/año)
- **MTBF:** 8,760 horas (1 año)
- **MTTR:** 2 horas
- **RTO:** 4 horas
- **RPO:** 1 hora

#### 5.3.2 Estrategias de Redundancia
- **Servidores:** 2oo3 con failover automático
- **Red:** Enlaces redundantes
- **Alimentación:** UPS + generador
- **Comunicación:** Enlaces múltiples

---

## 6. Integración y Comunicaciones

### 6.1 Integración ITCS

#### 6.1.1 Protocolo FFFIS
- **Versión:** FFFIS v2.1
- **Formato:** XML/JSON
- **Frecuencia:** 1 Hz (tiempo real)
- **Latencia:** < 100 ms
- **Confiabilidad:** 99.99%

#### 6.1.2 Datos Intercambiados
- **Posición de Trenes:** Coordenadas GPS
- **Estado de Vías:** Libre/Ocupado
- **Señales:** Aspecto y estado
- **Alarmas:** Eventos críticos
- **Comandos:** Control remoto

### 6.2 Comunicaciones Externas

#### 6.2.1 GSM-R
- **Cobertura:** 146 km de vía
- **Capacidad:** 24 trenes simultáneos
- **Latencia:** < 500 ms
- **Confiabilidad:** 99.9%

#### 6.2.2 Enlaces de Datos
- **Fibra Óptica:** Enlace principal
- **Radio:** Enlace de respaldo
- **Satelital:** Enlace de emergencia
- **Internet:** Enlace administrativo

---

## 7. Operación y Mantenimiento

### 7.1 Operación

#### 7.1.1 Turnos de Operación
- **Turno 1:** 06:00 - 14:00
- **Turno 2:** 14:00 - 22:00
- **Turno 3:** 22:00 - 06:00
- **Supervisor:** 24/7

#### 7.1.2 Procedimientos Operacionales
- **Inicio de Turno:** Checklist de verificación
- **Operación Normal:** Procedimientos estándar
- **Emergencias:** Procedimientos de emergencia
- **Cierre de Turno:** Handover y reportes

### 7.2 Mantenimiento

#### 7.2.1 Mantenimiento Preventivo
- **Diario:** Verificaciones básicas
- **Semanal:** Limpieza y calibración
- **Mensual:** Pruebas funcionales
- **Anual:** Revisión completa

#### 7.2.2 Mantenimiento Correctivo
- **Nivel 1:** Operadores (básico)
- **Nivel 2:** Técnicos (intermedio)
- **Nivel 3:** Especialistas (avanzado)
- **Nivel 4:** Fabricante (crítico)

---

## 8. Pruebas y Validación

### 8.1 Pruebas de Fábrica (FAT)

#### 8.1.1 Pruebas de Hardware
- **Servidores:** Pruebas de rendimiento
- **Estaciones:** Pruebas funcionales
- **Red:** Pruebas de conectividad
- **Comunicaciones:** Pruebas de enlaces

#### 8.1.2 Pruebas de Software
- **CTC Core:** Pruebas funcionales
- **Interfaces:** Pruebas de integración
- **Base de Datos:** Pruebas de rendimiento
- **Monitoreo:** Pruebas de alertas

### 8.2 Pruebas de Sitio (SAT)

#### 8.2.1 Pruebas de Integración
- **ITCS:** Pruebas de comunicación
- **SCADA:** Pruebas de supervisión
- **Comunicaciones:** Pruebas de enlaces
- **Emergencias:** Pruebas de procedimientos

#### 8.2.2 Pruebas de Aceptación
- **Funcionales:** Cumplimiento de requisitos
- **Rendimiento:** Objetivos de disponibilidad
- **Seguridad:** Cumplimiento normativo
- **Usabilidad:** Interfaz de usuario

---

## 9. Entregables y Cronograma

### 9.1 Entregables Fase D

#### 9.1.1 Documentos de Ingeniería
- **Especificación Técnica:** CTC detallado
- **Plan de Pruebas:** FAT/SAT
- **Manual de Operación:** Procedimientos
- **Manual de Mantenimiento:** Mantenimiento

#### 9.1.2 Software y Configuración
- **CTC Core:** Software de control
- **Interfaces:** Configuración FFFIS
- **Base de Datos:** Esquema y datos
- **Monitoreo:** Configuración Zabbix

### 9.2 Cronograma de Implementación

#### 9.2.1 Fase de Desarrollo
- **Mes 1-2:** Especificación y diseño
- **Mes 3-4:** Desarrollo de software
- **Mes 5-6:** Pruebas de fábrica
- **Mes 7-8:** Pruebas de sitio

#### 9.2.2 Fase de Puesta en Servicio
- **Mes 9:** Instalación y configuración
- **Mes 10:** Pruebas de integración
- **Mes 11:** Pruebas de aceptación
- **Mes 12:** Puesta en servicio

---

## 10. Anexos

### 10.1 Matriz de Trazabilidad
| Requisito | Especificación | Prueba | Estado |
|:---|:---|:---|:---:|
| CTC-001 | Control centralizado | FAT-001 | 🟢 |
| CTC-002 | Supervisión tiempo real | FAT-002 | 🟢 |
| CTC-003 | Integración ITCS | FAT-003 | 🟢 |
| CTC-004 | Gestión emergencias | FAT-004 | 🟢 |
| CTC-005 | Disponibilidad 99.95% | SAT-001 | 🟢 |

### 10.2 Glosario de Términos
- **CTC:** Centro de Control de Tráfico
- **ITCS:** Integrated Train Control System
- **FFFIS:** Form Fit Function Interface Specification
- **RBC:** Radio Block Centre
- **SIL:** Safety Integrity Level
- **MTBF:** Mean Time Between Failures
- **MTTR:** Mean Time To Repair
- **RTO:** Recovery Time Objective
- **RPO:** Recovery Point Objective

### 10.3 Referencias Normativas
- **EN 50126:** Aplicación de técnicas de confiabilidad para sistemas ferroviarios
- **EN 50128:** Software para sistemas de control y protección ferroviarios
- **EN 50129:** Sistemas de señalización ferroviaria
- **IEC 62290:** Sistemas de gestión ferroviaria
- **IEC 62443:** Seguridad de sistemas de automatización industrial
- **UIC 615:** Sistemas de control de tráfico ferroviario

### 10.4 Control de Versiones
| Versión | Fecha | Autor | Cambios |
|:---|:---|:---|:---|
| 0.1 | 02/10/2025 | Grupo Ortiz | Versión inicial |

---

**Documento:** V.2 Centro de Control de Tráfico (CTC) - Ingeniería de Detalle  
**Estado:** ✅ **COMPLETADO**  
**Próximo:** V.3 Sistemas de Comunicación - Ingeniería de Detalle

