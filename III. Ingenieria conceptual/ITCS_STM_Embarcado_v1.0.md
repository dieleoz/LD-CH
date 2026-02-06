# ITCS — STM Embarcado (Especificación v1.0)

- Versión: 1.0
- Fecha: 02/10/2025
- Sistema: Specific Transmission Module (STM) embarcado
- Referencias: ETCS Level 2, UIC EIRENE, EN 50126/50128/50129

---

## 1. Alcance y Objetivo

### 1.1 Propósito
Este documento especifica el sistema STM (Specific Transmission Module) embarcado para locomotoras del proyecto APP La Dorada-Chiriguaná, compatible con ETCS Level 2.

### 1.2 Objetivos del STM
- **Compatibilidad ETCS:** Nivel 2 completo con degradación a Level 1
- **Interfaz conductor:** DMI (Driver Machine Interface) conforme a UIC EIRENE
- **Comunicación tren-tierra:** TETRA con RBC
- **Detección de posición:** Eurobalise + odometría
- **Seguridad funcional:** SIL 4 para funciones críticas

### 1.3 Contexto operacional
- **Locomotoras objetivo:** 24 locomotoras existentes (retrofit)
- **Cobertura:** 146 km de vía, 5 estaciones
- **Modos de operación:** ETCS Level 2, Level 1, STM, Degradado
- **Interfaces:** RBC, Eurobalise, DMI, sistemas de freno

---

## 2. Arquitectura del Sistema

### 2.1 Componentes principales

| Componente | Cantidad | Función | Redundancia |
|:---|:---:|:---|:---:|
| **Procesador STM** | 2 | Lógica de control principal | 1+1 |
| **Módulo de comunicación** | 2 | GSM-R y Eurobalise | 1+1 |
| **DMI (Driver Machine Interface)** | 1 | Interfaz conductor | - |
| **Sistema de posición** | 2 | GPS + odometría | 1+1 |
| **Interfaz de freno** | 2 | Control de frenos | 1+1 |
| **Fuente de alimentación** | 2 | Alimentación 24VDC | 1+1 |

### 2.2 Arquitectura de redundancia
**Principio 1+1:**
- **Canal principal:** Operación normal
- **Canal de respaldo:** Standby activo
- **Conmutación automática:** < 100ms
- **Sincronización:** Estado consistente

**Estados de operación:**
- **Ambos canales:** Modo normal, máxima disponibilidad
- **Canal principal:** Operación continua
- **Canal de respaldo:** Degradación controlada
- **Sin canales:** Modo seguro, parada

---

## 3. Especificaciones de Hardware

### 3.1 Procesador STM
**Especificaciones técnicas:**
- **Procesador:** ARM Cortex-A78 o equivalente
- **Frecuencia:** 1.8 GHz mínimo
- **Memoria RAM:** 8 GB DDR4
- **Almacenamiento:** 256 GB SSD
- **Interfaces:** 2x Ethernet, 2x RS-485, 1x CAN, 1x USB

**Características de seguridad:**
- **Certificación SIL 4:** Hardware certificado
- **Detección de fallos:** Autodiagnóstico continuo
- **Temperatura:** Operación -40°C a +85°C
- **Vibración:** IEC 61373 Clase 1A
- **EMC:** EN 50121-3-2

### 3.2 Módulo de comunicación
**GSM-R:**
- **Frecuencia:** 876-880 MHz (uplink), 921-925 MHz (downlink)
- **Potencia:** 2W máximo
- **Antena:** Omnidireccional, ganancia 3 dBi
- **Protocolo:** ETCS sobre TETRA
- **Velocidad:** 9.6 kbps

**Eurobalise:**
- **Frecuencia:** 27.095 MHz
- **Potencia:** 1W máximo
- **Antena:** Inductiva, acoplada magnéticamente
- **Protocolo:** ETCS-44
- **Alcance:** 0.5m máximo

### 3.3 DMI (Driver Machine Interface)
**Especificaciones:**
- **Pantalla:** TFT 10.1" 1024x768
- **Teclado:** 20 teclas físicas + pantalla táctil
- **Iluminación:** LED de fondo ajustable
- **Temperatura:** -25°C a +70°C
- **Certificación:** UIC EIRENE

**Funcionalidades:**
- **Información de velocidad:** Actual y objetivo
- **Movement Authority:** Visualización de MA
- **Alarmas:** Indicadores visuales y sonoros
- **Modos de operación:** Selección y confirmación
- **Diagnóstico:** Estado del sistema

### 3.4 Sistema de posición
**GPS:**
- **Receptor:** GPS + GLONASS + Galileo
- **Precisión:** ±2m en condiciones normales
- **Actualización:** 10 Hz
- **Antena:** GPS activa, ganancia 28 dB

**Odometría:**
- **Sensores:** Encoders en ruedas
- **Precisión:** ±0.1% de distancia
- **Actualización:** 100 Hz
- **Calibración:** Automática con Eurobalise

---

## 4. Especificaciones de Software

### 4.1 Sistema operativo
**Especificaciones:**
- **OS:** Linux en tiempo real (PREEMPT_RT)
- **Kernel:** 5.15 LTS
- **Parches:** Tiempo real, seguridad, networking
- **Certificación:** SIL 4 conforme a EN 50128

**Características:**
- **Tiempo real:** Latencia < 1ms
- **Determinismo:** Comportamiento predecible
- **Seguridad:** Hardening y parches
- **Monitoreo:** Logs de sistema

### 4.2 Aplicación STM
**Módulos principales:**

| Módulo | Función | SIL | Estado |
|:---|:---|:---:|:---|
| **Gestión ETCS** | Control ETCS Level 2 | SIL 4 | 🟠 |
| **Comunicación RBC** | Enlace con RBC | SIL 3 | 🟠 |
| **Detección posición** | GPS + odometría | SIL 3 | 🟠 |
| **Interfaz DMI** | Comunicación conductor | SIL 2 | 🟠 |
| **Control de freno** | Aplicación de frenos | SIL 4 | 🟠 |
| **Diagnóstico** | Autodiagnóstico | SIL 1 | 🟠 |

**Arquitectura de software:**
- **Patrón:** Microservicios
- **Lenguaje:** C++17
- **Base de datos:** SQLite embebida
- **Middleware:** Message queue

### 4.3 Gestión de modos
**Modos de operación:**
1. **ETCS Level 2:** Modo normal
2. **ETCS Level 1:** Degradación por fallo TETRA
3. **STM:** Modo para locomotoras no compatibles
4. **Degradado:** Señalización convencional
5. **Seguro:** Parada controlada

**Transiciones de modo:**
- **Automática:** Por detección de fallo
- **Manual:** Por intervención del conductor
- **Confirmada:** Requiere confirmación del conductor
- **Tiempo limitada:** Transición temporal

---

## 5. Interfaz DMI (Driver Machine Interface)

### 5.1 Diseño conforme a UIC EIRENE
**Principios de diseño:**
- **Simplicidad:** Interfaz intuitiva
- **Consistencia:** Comportamiento predecible
- **Feedback:** Confirmación de acciones
- **Seguridad:** Prevención de errores

**Elementos de la interfaz:**
- **Velocímetro:** Velocidad actual y objetivo
- **Indicador de MA:** Movement Authority
- **Alarmas:** Indicadores visuales y sonoros
- **Modos:** Estado actual del sistema
- **Diagnóstico:** Información del sistema

### 5.2 Pantalla principal
**Layout:**
```
┌─────────────────────────────────────┐
│  [LOGO] ETCS Level 2    [MODO]     │
├─────────────────────────────────────┤
│  Velocidad: 85 km/h  Objetivo: 90  │
│  ┌─────────────────────────────────┐ │
│  │        VELOCÍMETRO              │ │
│  │                                 │ │
│  │        85 km/h                  │ │
│  │                                 │ │
│  └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│  MA: Válida  Distancia: 2.5 km     │
│  [ALARMA] [INFO] [MENU] [CONFIRM]  │
└─────────────────────────────────────┘
```

**Elementos:**
- **Velocímetro:** Circular con escala 0-200 km/h
- **Indicador de MA:** Barra de progreso
- **Alarmas:** Iconos con colores (rojo, amarillo, verde)
- **Botones:** Físicos y táctiles
- **Información:** Texto descriptivo

### 5.3 Gestión de alarmas
**Tipos de alarma:**
- **Crítica:** Requiere acción inmediata
- **Importante:** Requiere atención
- **Informativa:** Para conocimiento
- **Sistema:** Estado del sistema

**Presentación:**
- **Visual:** Colores y iconos
- **Sonora:** Tones diferenciados
- **Táctil:** Vibración (opcional)
- **Texto:** Descripción detallada

---

## 6. Comunicación Tren-Tierra

### 6.1 Protocolo ETCS sobre TETRA
**Estructura de mensaje:**
```
┌─────────────────────────────────────┐
│  Header ETCS (4 bytes)              │
├─────────────────────────────────────┤
│  NID_MESSAGE (1 byte)               │
├─────────────────────────────────────┤
│  L_MESSAGE (2 bytes)                │
├─────────────────────────────────────┤
│  Payload (variable)                 │
├─────────────────────────────────────┤
│  CRC (2 bytes)                      │
└─────────────────────────────────────┘
```

**Tipos de mensaje:**
- **MA (Movement Authority):** Autorización de movimiento
- **SP (Speed Profile):** Perfil de velocidad
- **EM (Emergency Message):** Mensaje de emergencia
- **ST (Status Message):** Estado del tren

### 6.2 Gestión de comunicación
**Estados de comunicación:**
- **Conectado:** Comunicación activa con RBC
- **Desconectado:** Sin comunicación
- **Degradado:** Comunicación intermitente
- **Emergencia:** Modo de emergencia

**Procedimientos:**
- **Establecimiento:** Inicio de sesión
- **Mantenimiento:** Keep-alive
- **Recuperación:** Reconexión automática
- **Terminación:** Cierre de sesión

---

## 7. Sistema de Posición

### 7.1 Fusión de datos
**Fuentes de posición:**
- **GPS:** Posición absoluta
- **Odometría:** Distancia relativa
- **Eurobalise:** Puntos de referencia
- **Mapa de vía:** Base de datos

**Algoritmo de fusión:**
1. **Captura de datos:** Múltiples fuentes
2. **Validación:** Coherencia entre fuentes
3. **Fusión:** Algoritmo de Kalman
4. **Corrección:** Ajuste con Eurobalise
5. **Salida:** Posición corregida

### 7.2 Precisión y confiabilidad
**Especificaciones:**
- **Precisión:** ±2m en condiciones normales
- **Confiabilidad:** 99.9% de disponibilidad
- **Actualización:** 10 Hz
- **Latencia:** < 100ms

**Factores de degradación:**
- **Túneles:** Pérdida de señal GPS
- **Curvas cerradas:** Error de odometría
- **Condiciones climáticas:** Atenuación de señal
- **Interferencias:** Señales espurias

---

## 8. Control de Frenos

### 8.1 Interfaz con sistema de freno
**Tipos de freno:**
- **Freno de servicio:** Control normal
- **Freno de emergencia:** Parada inmediata
- **Freno de estacionamiento:** Freno de mano
- **Freno dinámico:** Frenado regenerativo

**Señales de control:**
- **Comando de freno:** 0-100% de aplicación
- **Confirmación:** Estado del freno
- **Alarma:** Fallo del sistema
- **Diagnóstico:** Información del sistema

### 8.2 Lógica de control
**Algoritmo de frenado:**
1. **Cálculo de distancia:** Hasta fin de MA
2. **Cálculo de velocidad:** Objetivo vs actual
3. **Cálculo de deceleración:** Requerida
4. **Aplicación de freno:** Gradual o emergencia
5. **Monitoreo:** Efectividad del frenado

**Criterios de activación:**
- **Supervisión de velocidad:** Exceso de velocidad
- **Fin de MA:** Límite de autorización
- **Comando de emergencia:** RBC o conductor
- **Fallo del sistema:** Degradación segura

---

## 9. Plan de Retrofit

### 9.1 Locomotoras objetivo
**Inventario:**
- **Total:** 24 locomotoras
- **Tipo:** Diesel-eléctricas
- **Año:** 2010-2020
- **Estado:** Operativas

**Especificaciones técnicas:**
- **Potencia:** 3000-4000 HP
- **Velocidad máxima:** 120 km/h
- **Peso:** 120-150 toneladas
- **Sistemas:** Frenos neumáticos, control electrónico

### 9.2 Proceso de retrofit
**Fases del retrofit:**

| Fase | Actividad | Duración | Responsable |
|:---|:---|:---:|:---|
| **Fase 1** | Análisis y diseño | 4 semanas | Ing. Mecánica |
| **Fase 2** | Fabricación de componentes | 8 semanas | Fabricante |
| **Fase 3** | Instalación en taller | 2 semanas | Taller especializado |
| **Fase 4** | Pruebas y validación | 1 semana | Ing. Pruebas |
| **Fase 5** | Certificación y entrega | 1 semana | Organismo notificado |

**Criterios de aceptación:**
- **Funcionalidad:** Todas las funciones operativas
- **Seguridad:** Certificación SIL 4
- **Rendimiento:** Cumplimiento de especificaciones
- **Documentación:** Manuales y certificados

### 9.3 Cronograma de implementación
**Plan de 24 locomotoras:**
- **Lotes de 4 locomotoras:** 6 lotes
- **Duración por lote:** 16 semanas
- **Duración total:** 96 semanas (24 meses)
- **Recursos:** 2 talleres especializados

**Hitos críticos:**
- **Lote 1:** Locomotoras piloto
- **Lote 3:** Validación de proceso
- **Lote 6:** Completación del proyecto

---

## 10. Plan de Pruebas

### 10.1 Pruebas de unidad
**Componentes individuales:**
- **Procesador STM:** Funcionalidad y rendimiento
- **Módulo de comunicación:** GSM-R y Eurobalise
- **DMI:** Interfaz y usabilidad
- **Sistema de posición:** Precisión y confiabilidad
- **Control de frenos:** Efectividad y seguridad

### 10.2 Pruebas de integración
**Sistema completo:**
- **Comunicación RBC:** Enlace tren-tierra
- **Detección de posición:** Fusión de datos
- **Control de velocidad:** Supervisión y frenado
- **Modos de operación:** Transiciones
- **Diagnóstico:** Autodiagnóstico

### 10.3 Pruebas de aceptación
**Criterios contractuales:**
- **Funcionalidad:** Todas las funciones
- **Seguridad:** SIL 4
- **Rendimiento:** Especificaciones técnicas
- **Usabilidad:** Interfaz conductor
- **Mantenibilidad:** Acceso y reparación

---

## 11. Referencias y Anexos

### 11.1 Referencias normativas
- **ETCS Level 2:** Especificación técnica
- **UIC EIRENE:** Especificación de interfaz conductor
- **EN 50126:** Aplicación de técnicas de fiabilidad
- **EN 50128:** Sistemas de señalización ferroviaria
- **EN 50129:** Sistemas de señalización ferroviaria de seguridad

### 11.2 Referencias del proyecto
- **ITCS_SRS_Indice_v0.1.md:** Especificación de requisitos
- **ITCS_Arquitectura_RBC_2oo3_v0.1.md:** Arquitectura RBC
- **ITCS_Interfaces_CTC_ITCS_FFFIS_v0.1.md:** Interfaces CTC-ITCS
- **@@Roadmap_v10.0_Marco_Gestion.md:** Estado del proyecto

---

**Control de versiones:**
| Versión | Fecha | Responsable | Descripción |
|:---:|:---:|:---|:---|
| v0.1 | 02/10/2025 | Ing. Embarcados | Especificación inicial de STM embarcado |

**Próximas versiones:**
- **v0.2:** Diseño detallado de hardware
- **v0.3:** Especificación de software
- **v1.0:** Versión final para implementación

