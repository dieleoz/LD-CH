# ITCS — Propuesta de Arquitectura RBC (Documento de Trabajo)
**ESTADO: ✅ APROBADO (PHASE 7)**

- Sistema: Radio Block Centre (RBC) con redundancia 2oo3
- Referencias: EN 50126/50128/50129, ETCS Level 2, FFFIS

---

## 1. Alcance y Objetivo

### 1.1 Propósito
Este documento especifica la arquitectura del Radio Block Centre (RBC) con redundancia 2oo3 para el sistema ITCS del proyecto APP La Dorada-Chiriguaná, conforme a ETCS Level 2.

### 1.2 Objetivos de la Propuesta
*   **Cumplimiento de Disponibilidad:** Alcanzar los KPIs definidos en AT4 (ej. SICC ≥ 99.5%).
*   **Seguridad:** Cumplimentar los niveles SIL requeridos por la norma técnica aplicable tras la resolución de la DT-001 (FRA vs UIC).
*   **Tolerancia a fallos:** Establecer una arquitectura de redundancia que permita la continuidad del servicio ante fallas de componentes individuales.

### 1.3 Contexto operacional
- **Cobertura:** 146 km de vía, 5 estaciones, 146 pasos a nivel
- **Capacidad:** Hasta 24 trenes simultáneos
- **Interfaces:** CTC, Eurobalise, GSM-R, STM embarcado
- **Modos de operación:** ETCS Level 2, Level 1, STM, Degradado

---

## 2. Arquitectura General

### 2.1 Principio 2oo3 (2 de 3)
**Concepto:** Tres procesadores independientes toman decisiones por votación mayoritaria.

**Ventajas:**
- **Tolerancia a fallo simple:** Sistema continúa operando
- **Detección automática:** Fallos detectados por discrepancia
- **Aislamiento de fallos:** Un fallo no afecta a los otros canales
- **Recuperación automática:** Reintegración tras reparación

**Estados de operación:**
- **3 canales operativos:** Modo normal, máxima disponibilidad
- **2 canales operativos:** Modo degradado, operación continua
- **1 canal operativo:** Modo seguro, parada controlada

### 2.2 Componentes principales

| Componente | Cantidad | Función | Redundancia |
|:---|:---:|:---|:---:|
| **Procesador RBC** | 3 | Lógica de control principal | 2oo3 |
| **Memoria de trabajo** | 3 | Almacenamiento temporal | 2oo3 |
| **Interfaz de red** | 3 | Comunicación externa | 2oo3 |
| **Fuente de alimentación** | 4 | Alimentación eléctrica | 3+1 |
| **Sistema de refrigeración** | 2 | Control térmico | 1+1 |
| **Unidad de sincronización** | 3 | Sincronización temporal | 2oo3 |

---

## 3. Arquitectura de Hardware

### 3.1 Requisitos de Procesamiento (Estimados)
La plataforma de hardware deberá dimensionarse para soportar la carga transaccional de los trenes en operación, garantizando el determinismo requerido por las funciones de seguridad.

### 3.2 Sistema de votación
**Algoritmo de votación:**
1. **Entrada:** Cada procesador recibe los mismos datos
2. **Procesamiento:** Cada procesador ejecuta la misma lógica
3. **Votación:** Comparación de resultados entre procesadores
4. **Decisión:** Resultado por mayoría (2 de 3)
5. **Salida:** Comando único enviado al sistema

**Criterios de votación:**
- **Coincidencia exacta:** Resultados idénticos
- **Tolerancia de tiempo:** Diferencia máxima 10ms
- **Validación cruzada:** Verificación de integridad
- **Log de discrepancias:** Registro de diferencias

### 3.3 Sistema de comunicación
**Arquitectura de red:**
- **Red principal:** Ethernet 1 Gbps conmutada
- **Red de respaldo:** Ethernet 100 Mbps independiente
- **Protocolo:** TCP/IP con QoS prioritario
- **Seguridad:** VLANs segregadas por función

**Interfaces externas:**
- **CTC:** Interfaz FFFIS sobre TCP/IP
- **GSM-R:** Interfaz ETCS sobre UDP
- **Eurobalise:** Interfaz baliza sobre RS-485
- **STM:** Interfaz tren sobre TETRA

---

## 4. Arquitectura de Software

### 4.1 Sistema operativo
**Especificaciones:**
- **OS:** Linux en tiempo real (PREEMPT_RT)
- **Kernel:** 5.15 LTS o superior
- **Parches:** Tiempo real, seguridad, networking
- **Certificación:** SIL 4 conforme a EN 50128

**Características:**
- **Tiempo real:** Latencia < 1ms
- **Determinismo:** Comportamiento predecible
- **Seguridad:** Hardening y parches de seguridad
- **Monitoreo:** Logs de sistema y aplicación

### 4.2 Aplicación RBC
**Módulos principales:**

| Módulo | Función | SIL | Estado |
|:---|:---|:---:|:---:|
| **Gestión de trenes** | Control de movimiento | SIL 4 | 🟠 |
| **Autorización MA** | Movement Authority | SIL 4 | 🟠 |
| **Supervisión velocidad** | Control de velocidad | SIL 3 | 🟠 |
| **Gestión de rutas** | Optimización de rutas | SIL 2 | 🟠 |
| **Comunicación** | Interfaces externas | SIL 2 | 🟠 |
| **Diagnóstico** | Autodiagnóstico | SIL 1 | 🟠 |

**Arquitectura de software:**
- **Patrón:** Microservicios con comunicación asíncrona
- **Lenguaje:** C++17 con librerías certificadas
- **Base de datos:** PostgreSQL con replicación
- **Middleware:** Message queue para comunicación

### 4.3 Sistema de votación software
**Algoritmo de sincronización:**
1. **Sincronización temporal:** NTP con precisión ±1ms
2. **Sincronización de datos:** Replicación en tiempo real
3. **Sincronización de estado:** Estado consistente entre canales
4. **Detección de divergencia:** Monitoreo continuo

**Gestión de fallos:**
- **Detección:** Comparación continua de resultados
- **Aislamiento:** Canal fallido marcado como no confiable
- **Recuperación:** Reintegración tras verificación
- **Logging:** Registro detallado de eventos

---

## 5. Sistema de Alimentación

### 5.1 Arquitectura de alimentación
**Configuración 3+1:**
- **3 fuentes principales:** Alimentación redundante
- **1 fuente de respaldo:** UPS para transiciones
- **Distribución:** Cada procesador desde fuente independiente
- **Monitoreo:** Supervisión continua de estado

**Especificaciones técnicas:**
- **Potencia:** 2 kW por fuente
- **Voltaje:** 24 VDC nominal
- **Eficiencia:** > 90%
- **Factor de potencia:** > 0.95
- **Certificación:** SIL 4

### 5.2 Sistema UPS
**Características:**
- **Autonomía:** 30 minutos mínimo
- **Tiempo de transición:** < 10ms
- **Monitoreo:** Estado de baterías y carga
- **Mantenimiento:** Acceso fácil para reemplazo

---

## 6. Sistema de Refrigeración

### 6.1 Arquitectura térmica
**Configuración 1+1:**
- **Unidad principal:** Refrigeración activa
- **Unidad de respaldo:** Refrigeración pasiva
- **Distribución:** Flujo de aire optimizado
- **Control:** Termostatos independientes

**Especificaciones:**
- **Capacidad:** 5 kW de refrigeración
- **Temperatura:** 20°C ± 2°C
- **Humedad:** 45% ± 5% RH
- **Ruido:** < 60 dB(A)

### 6.2 Monitoreo térmico
**Sensores:**
- **Temperatura:** 12 sensores por rack
- **Humedad:** 4 sensores por rack
- **Flujo de aire:** 6 sensores por rack
- **Alarmas:** Notificación automática

---

## 7. Sistema de Diagnóstico

### 7.1 Autodiagnóstico
**Niveles de diagnóstico:**
- **Nivel 1:** Verificación de hardware (cada 1s)
- **Nivel 2:** Verificación de software (cada 10s)
- **Nivel 3:** Verificación de comunicación (cada 30s)
- **Nivel 4:** Verificación de sistema (cada 60s)

**Parámetros monitoreados:**
- **Hardware:** CPU, memoria, disco, red
- **Software:** Procesos, servicios, logs
- **Comunicación:** Latencia, pérdida de paquetes
- **Sistema:** Disponibilidad, rendimiento

### 7.2 Gestión de alarmas
**Clasificación de alarmas:**
- **Crítica:** Fallo que afecta seguridad (SIL 4)
- **Mayor:** Fallo que afecta disponibilidad
- **Menor:** Fallo que afecta rendimiento
- **Informativa:** Eventos de mantenimiento

**Procedimientos de respuesta:**
- **Crítica:** Parada segura inmediata
- **Mayor:** Degradación a modo seguro
- **Menor:** Notificación y monitoreo
- **Informativa:** Log y seguimiento

---

## 8. Especificaciones de Rendimiento

### 8.1 Métricas de rendimiento
| Métrica | Objetivo | Medición | Estado |
|:---|:---:|:---|:---:|
| **Disponibilidad** | 99.996% | MTBF/MTTR | 🟠 |
| **Latencia** | < 100ms | Tiempo de respuesta | 🟠 |
| **Throughput** | 1000 msg/s | Mensajes por segundo | 🟠 |
| **Capacidad** | 24 trenes | Trenes simultáneos | 🟠 |
| **Precisión** | ±1ms | Sincronización temporal | 🟠 |

### 8.2 Criterios de aceptación
**Funcionales:**
- Votación 2oo3 operativa
- Tolerancia a fallo simple
- Detección automática de fallos
- Recuperación automática

**No funcionales:**
- Disponibilidad > 99.5%
- Latencia < 100ms
- Capacidad 24 trenes
- Certificación SIL 4

---

## 9. Plan de Implementación

### 9.1 Fases de desarrollo
| Fase | Actividad | Duración | Responsable |
|:---|:---|:---:|:---|
| **Fase 1** | Diseño detallado | 4 semanas | Ing. Sistemas |
| **Fase 2** | Desarrollo hardware | 8 semanas | Fabricante |
| **Fase 3** | Desarrollo software | 12 semanas | Ing. Software |
| **Fase 4** | Pruebas de integración | 6 semanas | Ing. Pruebas |
| **Fase 5** | Certificación SIL | 8 semanas | Organismo notificado |

### 9.2 Criterios de validación
- **Diseño:** Revisión técnica y aprobación
- **Hardware:** Pruebas FAT en fábrica
- **Software:** Pruebas de unidad e integración
- **Sistema:** Pruebas SAT en campo
- **Certificación:** Certificado SIL 4

---

## 10. Referencias y Anexos

### 10.1 Referencias normativas
- **EN 50126:** Aplicación de técnicas de fiabilidad
- **EN 50128:** Sistemas de señalización ferroviaria
- **EN 50129:** Sistemas de señalización ferroviaria de seguridad
- **ETCS Level 2:** Especificación técnica
- **FFFIS:** Form Fit Function Interface Specification

### 10.2 Referencias del proyecto
- **ITCS_SRS_Indice_v0.1.md:** Especificación de requisitos
- **@@Roadmap_v10.0_Marco_Gestion.md:** Estado del proyecto
- **41. Interfaces_Sistemas_MEJORADO.md:** Especificación de interfaces

---

**Control de versiones:**
| Versión | Fecha | Responsable | Descripción |
|:---:|:---:|:---|:---|
| v0.1 | 02/10/2025 | Ing. Sistemas | Especificación inicial de arquitectura RBC 2oo3 |

**Próximas versiones:**
- **v0.2:** Diseño detallado de hardware
- **v0.3:** Especificación de software
- **v1.0:** Versión final para implementación

