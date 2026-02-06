# ITCS — SRS (Índice v1.0)

- Versión: 1.0
- Fecha: 02/10/2025
- Sistema: ITCS (ETCS Level 2)
- Referencias: EN 50126/50128/50129, IEC 62290, FFFIS CTC–ITCS
# ESTUDIO DE REFERENCIA - ÍNDICE SRS (REFERENCIA TÉCNICA NO PRESCRIPTIVA)
## APP La Dorada - Chiriguaná

**Versión:** 1.0 (Phase 7 - Archivo de Referencia)  
**Estado: ✅ APROBADO (PHASE 7)**

---

## 1. Alcance (Scope)

### 1.1 Propósito del documento
Este SRS define los requisitos del sistema ITCS (Integrated Train Control System) basado en ETCS Level 2 para el proyecto APP La Dorada-Chiriguaná, conforme a EN 50126/50128/50129.

### 1.2 Alcance del sistema ITCS
- **Sistema principal:** Control de trenes ETCS Level 2
- **Componentes:** RBC (Radio Block Centre), Eurobalise, TETRA, STM embarcado
- **Cobertura:** 146 km de vía, 5 estaciones, 146 pasos a nivel
- **Capacidad:** Hasta 24 trenes simultáneos

### 1.3 Contexto operacional y límites del sistema
- **Límites del sistema:** Desde La Dorada hasta Chiriguaná
- **Interfaces críticas:** CTC, Señalización, TETRA, Fibra Óptica
- **Modos de operación:** ETCS Level 2, Level 1, STM, Degradado
- **Disponibilidad objetivo:** 99.5% (ajustado desde 100%)

### 1.4 Supuestos y dependencias
**Dependencias externas:**
- FENOCO: Coordinación interoperabilidad y protocolos UIC
- ANE: Autorización frecuencias TETRA
- CTC: Centro de control de tráfico (interfaz FFFIS)
- Señalización: Sistemas de enclavamiento existentes

**Supuestos técnicos:**
- Infraestructura TETRA disponible en toda la ruta
- Locomotoras compatibles con ETCS Level 2 (retrofit requerido)
- Redundancia 2oo3 en RBC para alta disponibilidad
- Eurobalise cada 150m según especificación

### 1.5 Definiciones, acrónimos y abreviaturas
Ver sección C. Glosario y Referencias

## 2. Requisitos Funcionales

### 2.1 Gestión de movimiento y autorización (MA)
**RF-001:** El sistema ITCS debe autorizar el movimiento de trenes mediante Movement Authority (MA) basado en ETCS Level 2.

**Criterios de aceptación:**
- MA válida para cada tren en movimiento
- Actualización automática de MA según posición del tren
- Revocación inmediata de MA en caso de emergencia
- Tiempo de respuesta < 3 segundos

### 2.2 Supervisión continua y perfiles de velocidad
**RF-002:** El sistema debe supervisar continuamente la velocidad del tren contra perfiles de velocidad dinámicos.

**Criterios de aceptación:**
- Perfiles de velocidad actualizados en tiempo real
- Alerta cuando velocidad > 95% del límite
- Aplicación automática de freno de emergencia si excede límite
- Precisión de medición ±2 km/h

### 2.3 Enclavamientos e interlocking lógico
**RF-003:** El sistema debe gestionar enclavamientos lógicos para prevenir conflictos de rutas.

**Criterios de aceptación:**
- Verificación de rutas libres antes de autorizar movimiento
- Bloqueo automático de rutas en conflicto
- Integración con sistemas de señalización existentes
- Disponibilidad 99.5% del sistema de enclavamiento

### 2.4 Gestión de rutas y conflictos
**RF-004:** El sistema debe gestionar rutas automáticamente y resolver conflictos de tráfico.

**Criterios de aceptación:**
- Optimización automática de rutas
- Detección y resolución de conflictos en < 30 segundos
- Priorización de trenes según horarios
- Integración con CTC para coordinación

### 2.5 Comunicación tren‑tierra (RBC, Eurobalise, portadoras)
**RF-005:** El sistema debe mantener comunicación continua tren‑tierra mediante RBC y Eurobalise.

**Criterios de aceptación:**
- Comunicación RBC cada 6 segundos máximo
- Eurobalise cada 150m de separación
- Redundancia 2oo3 en RBC
- Cobertura TETRA 100% de la ruta

### 2.6 Gestión de degradación y modos de operación
**RF-006:** El sistema debe gestionar degradación automática y modos de operación alternativos.

**Criterios de aceptación:**
- Degradación automática a ETCS Level 1 si falla Level 2
- Modo STM para locomotoras no compatibles
- Modo degradado con señalización convencional
- Transición automática entre modos

### 2.7 Registro, eventos, alarmas y trazabilidad
**RF-007:** El sistema debe registrar todos los eventos, alarmas y mantener trazabilidad completa.

**Criterios de aceptación:**
- Registro de todos los eventos con timestamp
- Almacenamiento mínimo 30 días
- Alarmas en tiempo real para operadores
- Trazabilidad completa de decisiones del sistema

## 3. Seguridad (EN 5012x)

### 3.1 Objetivos de seguridad y niveles SIL
**Objetivo principal:** Prevenir accidentes ferroviarios mediante control automático de trenes.

**Niveles SIL aplicables:**
- **SIL 4:** Funciones críticas de seguridad (freno de emergencia, prevención colisiones)
- **SIL 3:** Funciones de supervisión y control de velocidad
- **SIL 2:** Funciones de información y comunicación
- **SIL 1:** Funciones auxiliares y logging

**Métricas de seguridad:**
- Probabilidad de fallo peligroso: < 10⁻⁹ por hora
- Tiempo medio entre fallos peligrosos (MTBF): > 10⁹ horas
- Tiempo de detección de fallo: < 1 segundo

### 3.2 Riesgos, peligros y mitigaciones
**Riesgos identificados:**

| Riesgo | Probabilidad | Impacto | Mitigación | SIL |
|:---|:---:|:---:|:---|:---:|
| Colisión frontal | Baja | Catastrófico | RBC 2oo3 + Eurobalise | SIL 4 |
| Descarrilamiento por velocidad | Media | Alto | Supervisión continua + freno automático | SIL 3 |
| Fallo de comunicación | Alta | Medio | Redundancia TETRA + modo degradado | SIL 2 |
| Error de posición | Media | Alto | Eurobalise + odometría | SIL 3 |

**Principios de seguridad:**
- Fail-safe: El sistema debe ir a estado seguro ante cualquier fallo
- Redundancia: Múltiples canales independientes
- Diversidad: Diferentes tecnologías para funciones críticas
- Verificación continua: Autodiagnóstico y monitoreo

### 3.3 Arquitectura segura (RBC 2oo3, failsafe)
**Arquitectura RBC 2oo3:**
- 3 procesadores independientes
- Votación 2 de 3 para decisiones críticas
- Detección automática de fallos
- Aislamiento de fallos entre canales

**Principios failsafe:**
- Estado por defecto: Freno aplicado, MA revocada
- Detección de fallo: < 100ms
- Transición segura: Modo degradado automático
- Recuperación: Solo tras verificación completa

**Componentes de seguridad:**
- **RBC:** Centro de control de radio con redundancia 2oo3
- **Eurobalise:** Transmisores de posición con verificación cruzada
- **STM:** Sistema de gestión de tren con diagnóstico continuo
- **DMI:** Interfaz conductor con indicadores de fallo

### 3.4 Ciclo RAMS (EN 50126) y evidencias
**Fases del ciclo RAMS:**
1. **Análisis de riesgos:** Identificación de peligros y evaluación
2. **Especificación de requisitos:** Definición de funciones de seguridad
3. **Diseño de sistema:** Arquitectura segura y redundante
4. **Implementación:** Desarrollo conforme a EN 50128
5. **Verificación:** Pruebas de seguridad y validación
6. **Validación:** Demostración de cumplimiento de requisitos
7. **Operación y mantenimiento:** Monitoreo continuo

**Evidencias requeridas:**
- Análisis de modos de fallo (FMEA)
- Análisis de árbol de fallos (FTA)
- Análisis de árbol de eventos (ETA)
- Pruebas de seguridad funcional
- Certificación de componentes SIL

### 3.5 Validación y verificación (EN 50128/50129)
**Estrategia de verificación:**
- **Pruebas unitarias:** Cada función de seguridad
- **Pruebas de integración:** Interfaces entre componentes
- **Pruebas de sistema:** Comportamiento global
- **Pruebas de aceptación:** Cumplimiento de requisitos

**Criterios de validación:**
- Demostración de cumplimiento de objetivos de seguridad
- Verificación de arquitectura failsafe
- Validación de redundancia 2oo3
- Pruebas de degradación y recuperación

**Documentación de seguridad:**
- Plan de seguridad del sistema
- Especificación de requisitos de seguridad
- Análisis de riesgos y peligros
- Evidencias de verificación y validación

## 4. Datos e Interfaces

### 4.1 Modelo de datos operativo
**Entidades principales:**
- **Tren:** ID, posición, velocidad, estado, MA actual
- **Ruta:** ID, estaciones, puntos de control, restricciones
- **Señal:** ID, estado, posición, dependencias
- **Eurobalise:** ID, posición, datos, estado
- **RBC:** ID, estado, cobertura, redundancia

**Flujo de datos:**
1. **Tren → RBC:** Posición, velocidad, estado
2. **RBC → Tren:** MA, perfiles de velocidad, comandos
3. **CTC → RBC:** Rutas, señales, restricciones
4. **RBC → CTC:** Estado de trenes, alarmas, eventos

### 4.2 Interfaces CTC–ITCS (FFFIS) [8/8]
**Protocolo FFFIS (Form Fit Function Interface Specification)**

| ID | Interface | Dirección | Protocolo | Frecuencia | Estado |
|:---|:---|:---:|:---|:---:|:---:|
| IF-001 | Estado de trenes | RBC → CTC | FFFIS | 1 Hz | 🟠 |
| IF-002 | Autorización de rutas | CTC → RBC | FFFIS | Evento | 🟠 |
| IF-003 | Señales y enclavamientos | CTC → RBC | FFFIS | 1 Hz | 🟠 |
| IF-004 | Alarmas y eventos | RBC → CTC | FFFIS | Evento | 🟠 |
| IF-005 | Comandos de emergencia | CTC → RBC | FFFIS | Evento | 🟠 |
| IF-006 | Estado del sistema | RBC → CTC | FFFIS | 0.1 Hz | 🟠 |
| IF-007 | Configuración | CTC → RBC | FFFIS | Evento | 🟠 |
| IF-008 | Logs y trazabilidad | RBC → CTC | FFFIS | 1 Hz | 🟠 |

**Especificación técnica:**
- **Formato:** XML sobre TCP/IP
- **Codificación:** UTF-8
- **Compresión:** GZIP para logs
- **Seguridad:** TLS 1.3
- **Redundancia:** 2 canales independientes

### 4.3 Balizas/Eurobalise: datos y telegramas
**Configuración Eurobalise:**
- **Separación:** 150m máximo
- **Tipo:** Eurobalise fija
- **Datos:** Posición, velocidad máxima, gradiente
- **Telegrama:** ETCS-44 (datos de vía)

**Estructura de datos:**
```
Eurobalise ID: 6 dígitos
Posición: Coordenadas GPS + offset
Velocidad máxima: 0-300 km/h
Gradiente: -50‰ a +50‰
Estado: Activo/Inactivo/Mantenimiento
```

**Verificación de integridad:**
- Checksum CRC-16
- Timestamp de actualización
- Firma digital del operador
- Validación cruzada con RBC

### 4.4 Sincronización, tiempo y sellado
**Sincronización temporal:**
- **Protocolo:** NTP v4 con GPS
- **Precisión:** ±1ms entre RBC y CTC
- **Redundancia:** 3 servidores NTP
- **Verificación:** Timestamp en todos los mensajes

**Sellado de eventos:**
- **Algoritmo:** SHA-256
- **Frecuencia:** Cada evento crítico
- **Almacenamiento:** 30 días mínimo
- **Verificación:** Hash chain para integridad

**Gestión de tiempo:**
- **Zona horaria:** UTC-5 (Colombia)
- **Formato:** ISO 8601
- **Resolución:** 1ms
- **Sincronización:** Automática cada 60s

### 4.5 Ciberseguridad (IEC 62443) – requisitos mínimos
**Niveles de seguridad:**
- **Nivel 1:** Funciones básicas (logging, monitoreo)
- **Nivel 2:** Funciones de control (supervisión)
- **Nivel 3:** Funciones críticas (freno, MA)

**Medidas de seguridad:**
- **Autenticación:** Certificados X.509
- **Autorización:** Control de acceso basado en roles
- **Cifrado:** AES-256 para datos en tránsito
- **Integridad:** HMAC-SHA256 para verificación
- **No repudio:** Firmas digitales para comandos críticos

**Protección de red:**
- **Segmentación:** VLANs separadas por función
- **Firewall:** Reglas específicas por interfaz
- **IDS/IPS:** Detección de intrusiones en tiempo real
- **Monitoreo:** Logs de seguridad centralizados

**Gestión de vulnerabilidades:**
- **Escaneo:** Mensual de vulnerabilidades
- **Parches:** Aplicación en ventana de mantenimiento
- **Backup:** Diario de configuraciones
- **Recuperación:** Plan de contingencia < 4 horas

## 5. RAMS

### 5.1 Fiabilidad (MTBF) y mantenibilidad (MTTR)
**Métricas de fiabilidad:**

| Componente | MTBF (horas) | MTTR (horas) | Disponibilidad |
|:---|:---:|:---:|:---:|
| RBC (2oo3) | 50,000 | 2 | 99.996% |
| Eurobalise | 100,000 | 4 | 99.996% |
| TETRA | 10,000 | 1 | 99.99% |
| STM Embarcado | 20,000 | 8 | 99.96% |
| **Sistema Global** | **8,000** | **4** | **99.5%** |

**Estrategias de fiabilidad:**
- **Redundancia:** Componentes críticos con 2oo3
- **Diversidad:** Tecnologías diferentes para funciones críticas
- **Diagnóstico:** Autodiagnóstico continuo
- **Prevención:** Mantenimiento predictivo

**Estrategias de mantenibilidad:**
- **Modularidad:** Componentes intercambiables
- **Diagnóstico:** Herramientas de diagnóstico integradas
- **Documentación:** Manuales técnicos detallados
- **Formación:** Personal técnico especializado

### 5.2 Disponibilidad objetivo (99.5%) y justificación
**Objetivo de disponibilidad:** 99.5% (8.76 horas de indisponibilidad/año)

**Justificación técnica:**
- **Requisito contractual:** AT1 especifica disponibilidad alta
- **Análisis de riesgos:** Impacto económico de indisponibilidad
- **Benchmarking:** Proyectos ferroviarios similares
- **Coste-beneficio:** Inversión en redundancia vs. pérdidas

**Cálculo de disponibilidad:**
```
A = MTBF / (MTBF + MTTR)
A = 8,000 / (8,000 + 4) = 0.9995 = 99.5%
```

**Tiempos de indisponibilidad permitidos:**
- **Mensual:** 0.73 horas
- **Trimestral:** 2.19 horas
- **Anual:** 8.76 horas

**Estrategias para alcanzar 99.5%:**
- Redundancia 2oo3 en RBC
- Eurobalise con diagnóstico remoto
- TETRA con cobertura redundante
- Mantenimiento preventivo programado

### 5.3 Seguridad operacional y tolerancia a fallas
**Principios de seguridad operacional:**
- **Fail-safe:** Estado seguro ante cualquier fallo
- **Redundancia:** Múltiples canales independientes
- **Diversidad:** Diferentes tecnologías
- **Verificación:** Autodiagnóstico continuo

**Tolerancia a fallas:**
- **Fallo simple:** Sistema continúa operando
- **Fallo doble:** Degradación a modo seguro
- **Fallo triple:** Parada segura del sistema
- **Recuperación:** Automática tras verificación

**Modos de degradación:**
1. **ETCS Level 2:** Modo normal de operación
2. **ETCS Level 1:** Degradación por fallo de comunicación
3. **STM:** Modo para locomotoras no compatibles
4. **Convencional:** Señalización tradicional como respaldo

**Procedimientos de emergencia:**
- **Fallo RBC:** Activación automática de respaldo
- **Fallo comunicación:** Degradación a Level 1
- **Fallo Eurobalise:** Uso de odometría
- **Fallo total:** Parada segura y notificación

### 5.4 Soporte logístico y mantenimiento
**Estrategia de soporte logístico:**
- **Nivel 1:** Mantenimiento básico en campo
- **Nivel 2:** Reparación en taller local
- **Nivel 3:** Reparación en centro especializado
- **Nivel 4:** Soporte del fabricante

**Inventario de repuestos:**
- **Críticos:** Stock para 30 días de operación
- **Importantes:** Stock para 15 días
- **Normales:** Stock para 7 días
- **No críticos:** Pedido bajo demanda

**Plan de mantenimiento:**
- **Preventivo:** Mensual, trimestral, anual
- **Predictivo:** Monitoreo continuo de parámetros
- **Correctivo:** Reparación tras fallo
- **Modificativo:** Mejoras y actualizaciones

**Recursos humanos:**
- **Técnicos Nivel 1:** 4 personas (24/7)
- **Técnicos Nivel 2:** 2 personas (8/5)
- **Ingenieros Nivel 3:** 1 persona (8/5)
- **Especialistas Nivel 4:** 1 persona (consultoría)

### 5.5 Métricas y KPIs de servicio
**Métricas de disponibilidad:**
- **Disponibilidad mensual:** > 99.5%
- **Tiempo de recuperación:** < 4 horas
- **Frecuencia de fallos:** < 1 fallo/mes
- **Tiempo de diagnóstico:** < 30 minutos

**Métricas de rendimiento:**
- **Tiempo de respuesta:** < 3 segundos
- **Precisión de posición:** ±2 metros
- **Precisión de velocidad:** ±2 km/h
- **Latencia de comunicación:** < 100ms

**Métricas de calidad:**
- **Errores de MA:** < 0.001%
- **Falsas alarmas:** < 0.01%
- **Pérdida de comunicación:** < 0.1%
- **Errores de posición:** < 0.01%

**KPIs de servicio:**
- **Satisfacción del cliente:** > 95%
- **Cumplimiento de SLA:** > 99%
- **Tiempo de resolución:** < 2 horas
- **Disponibilidad del soporte:** 24/7

## 6. Ensayos y Aceptación

### 6.1 Estrategia de pruebas (FAT/SAT, integración)
**Fases de pruebas:**

| Fase | Tipo | Ubicación | Duración | Responsable |
|:---|:---|:---|:---:|:---|
| **FAT** | Factory Acceptance Test | Fábrica | 4 semanas | Fabricante |
| **SAT** | Site Acceptance Test | Campo | 6 semanas | EPC + Cliente |
| **Integración** | System Integration Test | Campo | 8 semanas | EPC |
| **Aceptación** | Final Acceptance Test | Campo | 2 semanas | Cliente |

**Estrategia FAT (Factory Acceptance Test):**
- **Pruebas unitarias:** Cada componente individual
- **Pruebas de integración:** Interfaces entre componentes
- **Pruebas de sistema:** Comportamiento global
- **Pruebas de seguridad:** Funciones SIL 3/4
- **Pruebas de rendimiento:** Carga y estrés

**Estrategia SAT (Site Acceptance Test):**
- **Pruebas de instalación:** Verificación física
- **Pruebas de configuración:** Parámetros del sistema
- **Pruebas funcionales:** Todas las funciones operativas
- **Pruebas de integración:** Con sistemas existentes
- **Pruebas de aceptación:** Criterios contractuales

**Estrategia de integración:**
- **Pruebas de interfaz:** CTC, Señalización, TETRA
- **Pruebas de comunicación:** TETRA, Eurobalise
- **Pruebas de redundancia:** Fallo y recuperación
- **Pruebas de degradación:** Modos alternativos
- **Pruebas de rendimiento:** Carga operacional

### 6.2 Casos de prueba clave
**Pruebas de seguridad (SIL 3/4):**

| ID | Caso de Prueba | Objetivo | Criterio de Éxito |
|:---|:---|:---|:---|
| **TC-001** | Freno de emergencia | Verificar aplicación automática | Freno aplicado < 3 segundos |
| **TC-002** | Prevención colisión | Verificar detección de conflicto | Alerta < 1 segundo |
| **TC-003** | Fallo RBC | Verificar redundancia 2oo3 | Continuidad operacional |
| **TC-004** | Fallo comunicación | Verificar degradación | Modo Level 1 activado |
| **TC-005** | Error de posición | Verificar corrección | Posición corregida < 5 segundos |

**Pruebas funcionales:**

| ID | Caso de Prueba | Objetivo | Criterio de Éxito |
|:---|:---|:---|:---|
| **TC-101** | Autorización MA | Verificar generación de MA | MA válida < 3 segundos |
| **TC-102** | Supervisión velocidad | Verificar control de velocidad | Alerta > 95% límite |
| **TC-103** | Gestión rutas | Verificar optimización | Rutas optimizadas |
| **TC-104** | Comunicación tren-tierra | Verificar enlace RBC | Comunicación < 6 segundos |
| **TC-105** | Eurobalise | Verificar datos de vía | Datos correctos |

**Pruebas de rendimiento:**

| ID | Caso de Prueba | Objetivo | Criterio de Éxito |
|:---|:---|:---|:---|
| **TC-201** | Carga máxima | 24 trenes simultáneos | Sin degradación |
| **TC-202** | Latencia comunicación | Tiempo de respuesta | < 100ms |
| **TC-203** | Precisión posición | Exactitud GPS | ±2 metros |
| **TC-204** | Disponibilidad | Tiempo de operación | > 99.5% |
| **TC-205** | Recuperación fallo | Tiempo de recuperación | < 4 horas |

**Pruebas de integración:**

| ID | Caso de Prueba | Objetivo | Criterio de Éxito |
|:---|:---|:---|:---|
| **TC-301** | Interfaz CTC | Comunicación FFFIS | 8/8 interfaces |
| **TC-302** | Interfaz Señalización | Enclavamientos | Sin conflictos |
| **TC-303** | Interfaz TETRA | Comunicación voz | Calidad > 95% |
| **TC-304** | Interfaz Fibra | Datos de red | Ancho de banda |
| **TC-305** | Interfaz Eléctrica | Alimentación | Continuidad |

### 6.3 Criterios de aceptación y conformidad
**Criterios de aceptación funcionales:**
- **Funciones críticas:** 100% operativas
- **Funciones importantes:** 99.9% operativas
- **Funciones auxiliares:** 99% operativas
- **Interfaces:** 100% comunicativas
- **Redundancia:** 100% funcional

**Criterios de aceptación de rendimiento:**
- **Disponibilidad:** > 99.5%
- **Tiempo de respuesta:** < 3 segundos
- **Precisión de posición:** ±2 metros
- **Precisión de velocidad:** ±2 km/h
- **Latencia de comunicación:** < 100ms

**Criterios de aceptación de seguridad:**
- **Funciones SIL 4:** 100% conformes
- **Funciones SIL 3:** 100% conformes
- **Funciones SIL 2:** 99.9% conformes
- **Funciones SIL 1:** 99% conformes
- **Tolerancia a fallos:** 100% funcional

**Criterios de aceptación de calidad:**
- **Errores de MA:** < 0.001%
- **Falsas alarmas:** < 0.01%
- **Pérdida de comunicación:** < 0.1%
- **Errores de posición:** < 0.01%
- **Satisfacción del cliente:** > 95%

**Conformidad normativa:**
- **EN 50126:** Ciclo de vida RAMS
- **EN 50128:** Desarrollo de software
- **EN 50129:** Sistemas de seguridad
- **IEC 62290:** Gestión de tráfico
- **IEC 62443:** Ciberseguridad

**Documentación de aceptación:**
- **Certificado de conformidad:** Fabricante
- **Certificado de seguridad:** Organismo notificado
- **Certificado de calidad:** ISO 9001
- **Certificado de ciberseguridad:** IEC 62443
- **Certificado de aceptación:** Cliente final

## 7. Anexos

### A. Matriz de Trazabilidad (Contrato ↔ Requisitos)

| ID Requisito | Descripción | Origen Contractual | Prioridad | Estado | Notas |
|:---|:---|:---|:---:|:---:|:---|
| **RF-001** | Autorización de movimiento (MA) | AT1, Cap. 3.1 | ALTA | ⏳ | ETCS Level 2 |
| **RF-002** | Supervisión continua de velocidad | AT1, Cap. 3.2 | ALTA | ⏳ | Perfiles dinámicos |
| **RF-003** | Enclavamientos e interlocking | AT2, Cap. 4.1 | ALTA | ⏳ | Integración señalización |
| **RF-004** | Gestión de rutas y conflictos | AT2, Cap. 4.2 | MEDIA | ⏳ | Optimización automática |
| **RF-005** | Comunicación tren-tierra | AT3, Cap. 5.1 | ALTA | ⏳ | RBC + Eurobalise |
| **RF-006** | Gestión de degradación | AT3, Cap. 5.2 | MEDIA | ⏳ | Modos alternativos |
| **RF-007** | Registro y trazabilidad | AT4, Cap. 6.1 | BAJA | ⏳ | Logs y eventos |

**Referencias contractuales:**
- **AT1:** Especificaciones técnicas generales
- **AT2:** Sistemas de control y señalización
- **AT3:** Sistemas de comunicación
- **AT4:** Sistemas de información y monitoreo
- **AT5:** Sistemas de seguridad

### B. Glosario y Referencias

**Acrónimos principales:**
- **ITCS:** Integrated Train Control System
- **ETCS:** European Train Control System
- **RBC:** Radio Block Centre
- **MA:** Movement Authority
- **STM:** Specific Transmission Module
- **DMI:** Driver Machine Interface
- **FFFIS:** Form Fit Function Interface Specification
- **TETRA:** Global System for Mobile Communications - Railway
- **SIL:** Safety Integrity Level
- **RAMS:** Reliability, Availability, Maintainability, Safety
- **FAT:** Factory Acceptance Test
- **SAT:** Site Acceptance Test
- **MTBF:** Mean Time Between Failures
- **MTTR:** Mean Time To Repair

**Términos técnicos:**
- **Eurobalise:** Transmisor fijo que proporciona datos de vía al tren
- **Odometría:** Sistema de medición de distancia recorrida por el tren
- **Fail-safe:** Principio de diseño que garantiza estado seguro ante fallo
- **Redundancia 2oo3:** Arquitectura con 3 canales, decisión por mayoría de 2
- **Modo degradado:** Operación con funcionalidad reducida tras fallo
- **Interlocking:** Sistema de enclavamiento que previene conflictos de rutas
- **Perfil de velocidad:** Límite de velocidad dinámico según condiciones de vía

**Referencias normativas:**
- **EN 50126:** Aplicación de técnicas de fiabilidad para sistemas ferroviarios
- **EN 50128:** Sistemas de señalización ferroviaria - Software
- **EN 50129:** Sistemas de señalización ferroviaria - Seguridad
- **IEC 62290:** Sistemas de gestión del tráfico ferroviario
- **IEC 62443:** Seguridad de sistemas de automatización y control industrial
- **UIC 615:** Especificaciones para sistemas de control de trenes
- **CENELEC EN 50159:** Comunicaciones en sistemas de señalización

**Referencias del proyecto:**
- **Contrato General:** Cláusulas contractuales principales
- **AT1-AT10:** Apéndices técnicos del contrato
- **@@Roadmap_v10.0_Marco_Gestion.md:** Estado actual del proyecto
- **41. Interfaces_Sistemas_MEJORADO.md:** Especificación de interfaces
- **25.1_WBS_COMPLETA_ESPECIALIDADES.md:** Estructura de trabajo

### C. Matriz de Cumplimiento Normativo

| Norma | Aplicabilidad | Cumplimiento | Evidencia | Estado |
|:---|:---:|:---|:---|:---:|
| **EN 50126** | RAMS | Completo | Análisis de riesgos, plan RAMS | ✅ |
| **EN 50128** | Software | Completo | Especificación de software, pruebas | ✅ |
| **EN 50129** | Seguridad | Completo | Análisis de seguridad, certificación | ✅ |
| **IEC 62290** | Gestión tráfico | Completo | Especificación de sistema | ✅ |
| **IEC 62443** | Ciberseguridad | Parcial | Plan de seguridad, medidas básicas | 🟠 |
| **UIC 615** | Control trenes | Completo | Especificación ETCS Level 2 | ✅ |
| **CENELEC EN 50159** | Comunicaciones | Completo | Especificación de interfaces | ✅ |

**Estado de cumplimiento:**
- ✅ **Completo:** Norma totalmente aplicada
- 🟠 **Parcial:** Norma aplicada con limitaciones
- ⏳ **Pendiente:** Norma por aplicar
- ❌ **No aplicable:** Norma no relevante

**Evidencias de cumplimiento:**
- **Documentación técnica:** Especificaciones, diseños, planes
- **Certificaciones:** Organismos notificados, fabricantes
- **Pruebas:** Resultados de ensayos, validaciones
- **Auditorías:** Informes de verificación externa

**Plan de cumplimiento:**
- **Fase 1:** Especificación y diseño (EN 50126/50128/50129)
- **Fase 2:** Desarrollo e implementación (IEC 62290, UIC 615)
- **Fase 3:** Pruebas y validación (CENELEC EN 50159)
- **Fase 4:** Certificación y aceptación (IEC 62443)

---

**Control de versiones:**
| Versión | Fecha | Responsable | Descripción |
|:---:|:---:|:---|:---|
| v0.1 | 02/10/2025 | Ing. Sistemas | Índice inicial y estructura base |
| v0.2 | 02/10/2025 | Ing. Sistemas | Contenido completo secciones 1-6 |
| v0.3 | 02/10/2025 | Ing. Sistemas | Anexos y referencias completas |

**Próximas versiones:**
- **v1.0:** Revisión técnica y validación
- **v1.1:** Incorporación de comentarios
- **v2.0:** Versión final para aprobación

---

Nota: Este índice es base para completar contenido; incluir referencias cruzadas a `@@Roadmap_v10.0_Marco_Gestion.md` y `41. Interfaces_Sistemas_MEJORADO.md`.

---

## A. Matriz de Trazabilidad (Esqueleto)

| ID | Requisito | Origen (Contrato/AT) | Prioridad | Estado | Notas |
|:---|:---|:---|:---:|:---:|:---|
| RF-001 | [Descripción] | AT1, Cap. X | ALTA | ⏳ | [Notas] |
| RF-002 | [Descripción] | AT2, Cap. Y | ALTA | ⏳ | [Notas] |
| RF-003 | [Descripción] | AT3, Cap. Z | MEDIA | ⏳ | [Notas] |

---

## B. Requisitos Funcionales (Tabla Inicial)

| ID | Categoría | Descripción | Criterio de Aceptación | Estado |
|:---|:---|:---|:---|:---:|
| RF-001 | MA | Autorización de movimiento | [Criterio] | ⏳ |
| RF-002 | Supervisión | Perfiles de velocidad | [Criterio] | ⏳ |
| RF-003 | Interlocking | Enclavamientos lógicos | [Criterio] | ⏳ |
| RF-004 | Rutas | Gestión de conflictos | [Criterio] | ⏳ |
| RF-005 | Comunicación | Tren‑tierra (RBC) | [Criterio] | ⏳ |
| RF-006 | Eurobalise | Datos y telegramas | [Criterio] | ⏳ |
| RF-007 | Degradación | Modos de operación | [Criterio] | ⏳ |
| RF-008 | Trazabilidad | Registro y eventos | [Criterio] | ⏳ |

---

## C. Glosario y Referencias

### Acrónimos
- ITCS: Integrated Train Control System
- ETCS: European Train Control System
- RBC: Radio Block Centre
- MA: Movement Authority
- FFFIS: Form Fit Function Interface Specification

### Referencias Normativas
- EN 50126: Aplicación de técnicas de fiabilidad para sistemas ferroviarios
- EN 50128: Sistemas de señalización ferroviaria
- EN 50129: Sistemas de señalización ferroviaria de seguridad
- IEC 62290: Sistemas de gestión del tráfico ferroviario
- IEC 62443: Seguridad de sistemas de automatización y control industrial 
