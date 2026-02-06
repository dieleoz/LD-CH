# ITCS — Interlocking Tables 5 Estaciones (Especificación v1.0)

- Versión: 1.0
- Fecha: 02/10/2025
- Sistema: Tablas de enclavamiento para 5 estaciones
- Referencias: EN 50126/50128/50129, ETCS Level 2, CENELEC
# ESTUDIO DE REFERENCIA - TABLAS DE ENCLAVAMIENTO (REFERENCIA TÉCNICA NO PRESCRIPTIVA)
## APP La Dorada - Chiriguaná

**Versión:** 1.0 (Phase 7 - Archivo de Referencia)  
**Estado:** ⚠️ **ESTUDIO DE BENCHMARKING (NO PRESCRIPTIVO)**

---

## 1. Alcance y Objetivo

### 1.1 Propósito
Este documento especifica las tablas de enclavamiento (interlocking tables) para las 5 estaciones del proyecto APP La Dorada-Chiriguaná, integradas con el sistema ITCS ETCS Level 2.

### 1.2 Objetivos del interlocking
- **Seguridad:** Prevención de conflictos de rutas
- **Disponibilidad:** 99.5% de disponibilidad del sistema
- **Automatización:** Gestión automática de rutas
- **Integración:** Coordinación con ITCS y CTC
- **Mantenibilidad:** Acceso fácil para mantenimiento

### 1.3 Estaciones objetivo
| Estación | Código | Tipo | Vías | Señales | Puntos |
|:---|:---:|:---|:---:|:---:|:---:|
| **La Dorada** | LD | Principal | 4 | 12 | 8 |
| **Puerto Salgar** | PS | Intermedia | 3 | 8 | 6 |
| **Puerto Berrío** | PB | Intermedia | 3 | 8 | 6 |
| **Puerto Nare** | PN | Intermedia | 3 | 8 | 6 |
| **Chiriguaná** | CH | Terminal | 4 | 12 | 8 |

---

## 2. Arquitectura del Sistema

### 2.1 Componentes principales

| Componente | Función | Redundancia | Estado |
|:---|:---|:---:|:---:|
| **Procesador de enclavamiento** | Lógica de control | 2oo3 | 🟠 |
| **Tablas de rutas** | Definición de rutas | 1+1 | 🟠 |
| **Interfaz con señales** | Control de señales | 1+1 | 🟠 |
| **Interfaz con puntos** | Control de agujas | 1+1 | 🟠 |
| **Interfaz con ITCS** | Coordinación RBC | 1+1 | 🟠 |
| **Interfaz con CTC** | Control central | 1+1 | 🟠 |

### 2.2 Arquitectura de seguridad
**Principios de diseño:**
- **Fail-safe:** Estado seguro ante fallo
- **Redundancia:** Múltiples canales independientes
- **Diversidad:** Tecnologías diferentes
- **Verificación:** Autodiagnóstico continuo

**Niveles de seguridad:**
- **SIL 4:** Funciones críticas de seguridad
- **SIL 3:** Funciones de supervisión
- **SIL 2:** Funciones de información
- **SIL 1:** Funciones auxiliares

---

## 3. Especificación por Estación

### 3.1 La Dorada (LD) - Estación Principal
**Configuración:**
- **Vías:** 4 vías principales + 2 vías de servicio
- **Señales:** 12 señales de entrada/salida
- **Puntos:** 8 agujas motorizadas
- **Pasos a nivel:** 3 pasos a nivel

**Tabla de rutas principales:**

| Ruta | Vía Origen | Vía Destino | Señales | Puntos | Condiciones |
|:---|:---|:---|:---|:---|:---|
| **R001** | Vía 1 | Vía 2 | S01→S02 | P01→P02 | Vía 2 libre |
| **R002** | Vía 1 | Vía 3 | S01→S03 | P01→P03 | Vía 3 libre |
| **R003** | Vía 2 | Vía 1 | S02→S01 | P02→P01 | Vía 1 libre |
| **R004** | Vía 2 | Vía 4 | S02→S04 | P02→P04 | Vía 4 libre |
| **R005** | Vía 3 | Vía 1 | S03→S01 | P03→P01 | Vía 1 libre |
| **R006** | Vía 3 | Vía 4 | S03→S04 | P03→P04 | Vía 4 libre |
| **R007** | Vía 4 | Vía 2 | S04→S02 | P04→P02 | Vía 2 libre |
| **R008** | Vía 4 | Vía 3 | S04→S03 | P04→P03 | Vía 3 libre |

**Lógica de enclavamiento:**
- **Conflictos:** Rutas mutuamente excluyentes
- **Dependencias:** Señales dependientes de puntos
- **Secuencias:** Orden de operación
- **Tiempos:** Delays de seguridad

### 3.2 Puerto Salgar (PS) - Estación Intermedia
**Configuración:**
- **Vías:** 3 vías principales + 1 vía de servicio
- **Señales:** 8 señales de entrada/salida
- **Puntos:** 6 agujas motorizadas
- **Pasos a nivel:** 2 pasos a nivel

**Tabla de rutas principales:**

| Ruta | Vía Origen | Vía Destino | Señales | Puntos | Condiciones |
|:---|:---|:---|:---|:---|:---|
| **R101** | Vía 1 | Vía 2 | S11→S12 | P11→P12 | Vía 2 libre |
| **R102** | Vía 1 | Vía 3 | S11→S13 | P11→P13 | Vía 3 libre |
| **R103** | Vía 2 | Vía 1 | S12→S11 | P12→P11 | Vía 1 libre |
| **R104** | Vía 2 | Vía 3 | S12→S13 | P12→P13 | Vía 3 libre |
| **R105** | Vía 3 | Vía 1 | S13→S11 | P13→P11 | Vía 1 libre |
| **R106** | Vía 3 | Vía 2 | S13→S12 | P13→P12 | Vía 2 libre |

**Características especiales:**
- **Cruce de vías:** Protección automática
- **Señales de maniobra:** Control de movimientos
- **Protección de pasos a nivel:** Coordinación automática

### 3.3 Puerto Berrío (PB) - Estación Intermedia
**Configuración:**
- **Vías:** 3 vías principales + 1 vía de servicio
- **Señales:** 8 señales de entrada/salida
- **Puntos:** 6 agujas motorizadas
- **Pasos a nivel:** 2 pasos a nivel

**Tabla de rutas principales:**

| Ruta | Vía Origen | Vía Destino | Señales | Puntos | Condiciones |
|:---|:---|:---|:---|:---|:---|
| **R201** | Vía 1 | Vía 2 | S21→S22 | P21→P22 | Vía 2 libre |
| **R202** | Vía 1 | Vía 3 | S21→S23 | P21→P23 | Vía 3 libre |
| **R203** | Vía 2 | Vía 1 | S22→S21 | P22→P21 | Vía 1 libre |
| **R204** | Vía 2 | Vía 3 | S22→S23 | P22→P23 | Vía 3 libre |
| **R205** | Vía 3 | Vía 1 | S23→S21 | P23→P21 | Vía 1 libre |
| **R206** | Vía 3 | Vía 2 | S23→S22 | P23→P22 | Vía 2 libre |

**Características especiales:**
- **Cruce de vías:** Protección automática
- **Señales de maniobra:** Control de movimientos
- **Protección de pasos a nivel:** Coordinación automática

### 3.4 Puerto Nare (PN) - Estación Intermedia
**Configuración:**
- **Vías:** 3 vías principales + 1 vía de servicio
- **Señales:** 8 señales de entrada/salida
- **Puntos:** 6 agujas motorizadas
- **Pasos a nivel:** 2 pasos a nivel

**Tabla de rutas principales:**

| Ruta | Vía Origen | Vía Destino | Señales | Puntos | Condiciones |
|:---|:---|:---|:---|:---|:---|
| **R301** | Vía 1 | Vía 2 | S31→S32 | P31→P32 | Vía 2 libre |
| **R302** | Vía 1 | Vía 3 | S31→S33 | P31→P33 | Vía 3 libre |
| **R303** | Vía 2 | Vía 1 | S32→S31 | P32→P31 | Vía 1 libre |
| **R304** | Vía 2 | Vía 3 | S32→S33 | P32→P33 | Vía 3 libre |
| **R305** | Vía 3 | Vía 1 | S33→S31 | P33→P31 | Vía 1 libre |
| **R306** | Vía 3 | Vía 2 | S33→S32 | P33→P32 | Vía 2 libre |

**Características especiales:**
- **Cruce de vías:** Protección automática
- **Señales de maniobra:** Control de movimientos
- **Protección de pasos a nivel:** Coordinación automática

### 3.5 Chiriguaná (CH) - Estación Terminal
**Configuración:**
- **Vías:** 4 vías principales + 2 vías de servicio
- **Señales:** 12 señales de entrada/salida
- **Puntos:** 8 agujas motorizadas
- **Pasos a nivel:** 3 pasos a nivel

**Tabla de rutas principales:**

| Ruta | Vía Origen | Vía Destino | Señales | Puntos | Condiciones |
|:---|:---|:---|:---|:---|:---|
| **R401** | Vía 1 | Vía 2 | S41→S42 | P41→P42 | Vía 2 libre |
| **R402** | Vía 1 | Vía 3 | S41→S43 | P41→P43 | Vía 3 libre |
| **R403** | Vía 1 | Vía 4 | S41→S44 | P41→P44 | Vía 4 libre |
| **R404** | Vía 2 | Vía 1 | S42→S41 | P42→P41 | Vía 1 libre |
| **R405** | Vía 2 | Vía 3 | S42→S43 | P42→P43 | Vía 3 libre |
| **R406** | Vía 2 | Vía 4 | S42→S44 | P42→P44 | Vía 4 libre |
| **R407** | Vía 3 | Vía 1 | S43→S41 | P43→P41 | Vía 1 libre |
| **R408** | Vía 3 | Vía 2 | S43→S42 | P43→P42 | Vía 2 libre |
| **R409** | Vía 3 | Vía 4 | S43→S44 | P43→P44 | Vía 4 libre |
| **R410** | Vía 4 | Vía 1 | S44→S41 | P44→P41 | Vía 1 libre |
| **R411** | Vía 4 | Vía 2 | S44→S42 | P44→P42 | Vía 2 libre |
| **R412** | Vía 4 | Vía 3 | S44→S43 | P44→P43 | Vía 3 libre |

**Características especiales:**
- **Terminal:** Rutas de entrada/salida
- **Maniobras:** Movimientos de estacionamiento
- **Protección:** Sistemas de seguridad

---

## 4. Lógica de Enclavamiento

### 4.1 Principios de seguridad
**Reglas fundamentales:**
1. **Exclusión mutua:** Dos rutas no pueden estar activas simultáneamente
2. **Dependencia de puntos:** Señales dependen del estado de agujas
3. **Verificación de vía libre:** Rutas requieren vía libre
4. **Secuencia de operación:** Orden específico de operaciones
5. **Tiempos de seguridad:** Delays entre operaciones

### 4.2 Matriz de conflictos
**Ejemplo para La Dorada:**

| Ruta | R001 | R002 | R003 | R004 | R005 | R006 | R007 | R008 |
|:---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **R001** | - | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ | ❌ |
| **R002** | ❌ | - | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ |
| **R003** | ❌ | ❌ | - | ❌ | ❌ | ❌ | ❌ | ❌ |
| **R004** | ❌ | ❌ | ❌ | - | ❌ | ❌ | ❌ | ❌ |
| **R005** | ❌ | ❌ | ❌ | ❌ | - | ❌ | ❌ | ❌ |
| **R006** | ✅ | ❌ | ❌ | ❌ | ❌ | - | ❌ | ❌ |
| **R007** | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | - | ❌ |
| **R008** | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | - |

**Leyenda:**
- **❌:** Conflicto (rutas mutuamente excluyentes)
- **✅:** Compatible (rutas pueden coexistir)
- **-:** Misma ruta

### 4.3 Dependencias de puntos
**Ejemplo para Ruta R001 (La Dorada):**
```
Ruta R001: Vía 1 → Vía 2
├── Punto P01: Posición normal (recto)
├── Punto P02: Posición normal (recto)
├── Señal S01: Aspecto verde
├── Señal S02: Aspecto rojo (bloqueada)
└── Condición: Vía 2 libre
```

**Secuencia de operación:**
1. **Verificar vía libre:** Vía 2 debe estar libre
2. **Posicionar puntos:** P01 y P02 en posición normal
3. **Verificar puntos:** Confirmar posición correcta
4. **Abrir señal:** S01 a aspecto verde
5. **Bloquear señal:** S02 a aspecto rojo
6. **Confirmar ruta:** Ruta R001 activa

---

## 5. Integración con ITCS

### 5.1 Interfaz con RBC
**Comunicación bidireccional:**
- **RBC → Interlocking:** Solicitud de rutas
- **Interlocking → RBC:** Estado de rutas
- **Protocolo:** FFFIS sobre TCP/IP
- **Frecuencia:** 1 Hz para estado, evento para cambios

**Mensajes principales:**
- **Route Request:** Solicitud de ruta
- **Route Status:** Estado de ruta
- **Route Confirmation:** Confirmación de ruta
- **Route Cancellation:** Cancelación de ruta

### 5.2 Coordinación de MA
**Movement Authority (MA):**
- **Generación:** RBC genera MA basado en rutas
- **Validación:** Interlocking valida disponibilidad
- **Coordinación:** Sincronización entre sistemas
- **Actualización:** Cambios en tiempo real

**Flujo de coordinación:**
1. **RBC solicita ruta:** Envío de Route Request
2. **Interlocking valida:** Verificación de disponibilidad
3. **Interlocking confirma:** Envío de Route Status
4. **RBC genera MA:** Creación de Movement Authority
5. **RBC notifica:** Envío de MA al tren
6. **Interlocking bloquea:** Bloqueo de ruta

---

## 6. Integración con CTC

### 6.1 Interfaz con CTC
**Comunicación bidireccional:**
- **CTC → Interlocking:** Comandos de control
- **Interlocking → CTC:** Estado del sistema
- **Protocolo:** FFFIS sobre TCP/IP
- **Frecuencia:** 1 Hz para estado, evento para cambios

**Comandos principales:**
- **Route Command:** Comando de ruta
- **Signal Command:** Comando de señal
- **Point Command:** Comando de aguja
- **Emergency Command:** Comando de emergencia

### 6.2 Control centralizado
**Funciones del CTC:**
- **Supervisión:** Monitoreo del estado
- **Control:** Comandos de operación
- **Planificación:** Optimización de rutas
- **Emergencia:** Comandos de emergencia

**Niveles de control:**
- **Automático:** Control automático por ITCS
- **Supervisado:** Control con supervisión humana
- **Manual:** Control manual completo
- **Emergencia:** Control de emergencia

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
| **Disponibilidad** | 99.5% | MTBF/MTTR | 🟠 |
| **Latencia** | < 100ms | Tiempo de respuesta | 🟠 |
| **Throughput** | 100 rutas/s | Rutas por segundo | 🟠 |
| **Precisión** | 100% | Exactitud de rutas | 🟠 |
| **Confiabilidad** | 99.99% | Sin fallos de seguridad | 🟠 |

### 8.2 Criterios de aceptación
**Funcionales:**
- Todas las rutas operativas
- Enclavamiento correcto
- Integración con ITCS
- Integración con CTC

**No funcionales:**
- Disponibilidad > 99.5%
- Latencia < 100ms
- Throughput > 100 rutas/s
- Certificación SIL 4

---

## 9. Plan de Implementación

### 9.1 Fases de desarrollo
| Fase | Actividad | Duración | Responsable |
|:---|:---|:---:|:---|
| **Fase 1** | Diseño de tablas | 6 semanas | Ing. Señalización |
| **Fase 2** | Desarrollo software | 8 semanas | Ing. Software |
| **Fase 3** | Pruebas de unidad | 4 semanas | Ing. Pruebas |
| **Fase 4** | Pruebas de integración | 6 semanas | Ing. Integración |
| **Fase 5** | Pruebas de aceptación | 4 semanas | Cliente |

### 9.2 Cronograma por estación
**Plan de 5 estaciones:**
- **Estación 1:** La Dorada (piloto)
- **Estación 2:** Chiriguaná (terminal)
- **Estación 3:** Puerto Salgar
- **Estación 4:** Puerto Berrío
- **Estación 5:** Puerto Nare

**Duración total:** 28 semanas (7 meses)

---

## 10. Referencias y Anexos

### 10.1 Referencias normativas
- **EN 50126:** Aplicación de técnicas de fiabilidad
- **EN 50128:** Sistemas de señalización ferroviaria
- **EN 50129:** Sistemas de señalización ferroviaria de seguridad
- **CENELEC:** Estándares europeos de señalización
- **ETCS Level 2:** Especificación técnica

### 10.2 Referencias del proyecto
- **ITCS_SRS_Indice_v0.1.md:** Especificación de requisitos
- **ITCS_Arquitectura_RBC_2oo3_v0.1.md:** Arquitectura RBC
- **ITCS_Interfaces_CTC_ITCS_FFFIS_v0.1.md:** Interfaces CTC-ITCS
- **ITCS_STM_Embarcado_v0.1.md:** STM embarcado
- **@@Roadmap_v10.0_Marco_Gestion.md:** Estado del proyecto

---

**Control de versiones:**
| Versión | Fecha | Responsable | Descripción |
|:---:|:---:|:---|:---|
| v0.1 | 02/10/2025 | Ing. Señalización | Especificación inicial de interlocking tables para 5 estaciones |

**Próximas versiones:**
- **v0.2:** Tablas detalladas por estación
- **v0.3:** Lógica de enclavamiento completa
- **v1.0:** Versión final para implementación

