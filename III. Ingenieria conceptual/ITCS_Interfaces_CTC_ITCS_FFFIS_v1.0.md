# ITCS —# ESTUDIO DE REFERENCIA - INTERFACES CTC-ITCS (REFERENCIA TÉCNICA NO PRESCRIPTIVA)
## APP La Dorada - Chiriguaná

**Versión:** 1.0 (Phase 7 - Archivo de Referencia)  
**ESTADO: ✅ APROBADO (PHASE 7)**

- Versión: 1.0
- Fecha: 02/10/2025
- Sistema: Interfaces CTC–ITCS usando protocolo FFFIS
- Referencias: FFFIS, ETCS Level 2, EN 50159

---

## 1. Alcance y Objetivo

### 1.1 Propósito
Este documento especifica las 8 interfaces críticas entre el Centro de Control de Tráfico (CTC) y el sistema ITCS usando el protocolo FFFIS (Form Fit Function Interface Specification).

### 1.2 Objetivos de las interfaces
- **Comunicación bidireccional:** CTC ↔ RBC en tiempo real
- **Protocolo estándar:** FFFIS conforme a ETCS Level 2
- **Alta disponibilidad:** 99.99% de disponibilidad de comunicación
- **Seguridad:** Autenticación y cifrado de datos
- **Trazabilidad:** Log completo de todas las comunicaciones

### 1.3 Contexto operacional
- **CTC:** Centro de control de tráfico ferroviario
- **RBC:** Radio Block Centre del sistema ITCS
- **Protocolo:** FFFIS sobre TCP/IP
- **Redundancia:** 2 canales independientes
- **Latencia:** < 100ms para comandos críticos

---

## 2. Arquitectura de Comunicación

### 2.1 Topología de red
```
CTC (Centro de Control)
    ↕ TCP/IP (Red principal)
    ↕ TCP/IP (Red de respaldo)
RBC (Radio Block Centre)
```

**Características de red:**
- **Protocolo:** TCP/IP con QoS prioritario
- **Ancho de banda:** 100 Mbps mínimo
- **Latencia:** < 50ms en red local
- **Redundancia:** 2 enlaces independientes
- **Seguridad:** VLANs segregadas

### 2.2 Protocolo FFFIS
**Form Fit Function Interface Specification:**
- **Formato:** XML estructurado
- **Codificación:** UTF-8
- **Compresión:** GZIP para logs
- **Seguridad:** TLS 1.3
- **Validación:** XSD Schema

**Estructura de mensaje:**
```xml
<?xml version="1.0" encoding="UTF-8"?>
<FFFIS_Message>
    <Header>
        <MessageID>unique_id</MessageID>
        <Timestamp>ISO_8601</Timestamp>
        <Source>CTC/RBC</Source>
        <Destination>RBC/CTC</Destination>
        <Priority>1-5</Priority>
    </Header>
    <Body>
        <!-- Contenido específico del mensaje -->
    </Body>
    <Security>
        <Signature>HMAC-SHA256</Signature>
        <Checksum>CRC-32</Checksum>
    </Security>
</FFFIS_Message>
```

---

## 3. Especificación de Interfaces (8/8)

### 3.1 IF-001: Estado de Trenes (RBC → CTC)
**Propósito:** Transmisión del estado actual de todos los trenes controlados.

**Frecuencia:** 1 Hz (cada segundo)

**Estructura de datos:**
```xml
<Body>
    <TrainStatus>
        <Train>
            <TrainID>string</TrainID>
            <Position>
                <Kilometer>float</Kilometer>
                <Offset>float</Offset>
                <Direction>enum</Direction>
            </Position>
            <Speed>float</Speed>
            <MA>
                <Valid>boolean</Valid>
                <EndPosition>float</EndPosition>
                <SpeedLimit>float</SpeedLimit>
            </MA>
            <Status>enum</Status>
            <Mode>enum</Mode>
        </Train>
    </TrainStatus>
</Body>
```

**Campos:**
- **TrainID:** Identificador único del tren
- **Position:** Posición actual (km + offset)
- **Speed:** Velocidad actual (km/h)
- **MA:** Movement Authority actual
- **Status:** Estado operacional del tren
- **Mode:** Modo ETCS (Level 2, Level 1, STM)

**Criterios de aceptación:**
- Actualización cada 1 segundo
- Precisión de posición ±2 metros
- Latencia < 100ms
- Disponibilidad > 99.99%

### 3.2 IF-002: Autorización de Rutas (CTC → RBC)
**Propósito:** Autorización de rutas y cambios de configuración.

**Frecuencia:** Evento (cuando se requiere)

**Estructura de datos:**
```xml
<Body>
    <RouteAuthorization>
        <RouteID>string</RouteID>
        <TrainID>string</TrainID>
        <StartPosition>float</StartPosition>
        <EndPosition>float</EndPosition>
        <SpeedLimit>float</SpeedLimit>
        <ValidityTime>
            <Start>ISO_8601</Start>
            <End>ISO_8601</End>
        </ValidityTime>
        <Priority>integer</Priority>
        <Conditions>
            <Signal>enum</Signal>
            <Track>enum</Track>
            <Other>string</Other>
        </Conditions>
    </RouteAuthorization>
</Body>
```

**Campos:**
- **RouteID:** Identificador único de la ruta
- **TrainID:** Tren autorizado
- **StartPosition/EndPosition:** Límites de la ruta
- **SpeedLimit:** Límite de velocidad
- **ValidityTime:** Ventana temporal de validez
- **Priority:** Prioridad de la ruta
- **Conditions:** Condiciones de autorización

**Criterios de aceptación:**
- Procesamiento < 3 segundos
- Validación automática de conflictos
- Confirmación de recepción
- Log de todas las autorizaciones

### 3.3 IF-003: Señales y Enclavamientos (CTC → RBC)
**Propósito:** Estado de señales y enclavamientos del sistema.

**Frecuencia:** 1 Hz (cada segundo)

**Estructura de datos:**
```xml
<Body>
    <SignalsAndInterlocking>
        <Signal>
            <SignalID>string</SignalID>
            <Position>float</Position>
            <Aspect>enum</Aspect>
            <State>enum</State>
            <Dependencies>
                <Route>string</Route>
                <Track>string</Track>
            </Dependencies>
        </Signal>
        <Interlocking>
            <RouteID>string</RouteID>
            <State>enum</State>
            <LockedElements>
                <Track>string</Track>
                <Signal>string</Signal>
                <Point>string</Point>
            </LockedElements>
        </Interlocking>
    </SignalsAndInterlocking>
</Body>
```

**Campos:**
- **SignalID:** Identificador de la señal
- **Aspect:** Aspecto de la señal (verde, amarillo, rojo)
- **State:** Estado operacional
- **Dependencies:** Dependencias de la señal
- **Interlocking:** Estado de enclavamientos
- **LockedElements:** Elementos bloqueados

**Criterios de aceptación:**
- Sincronización temporal ±1ms
- Estado consistente entre CTC y RBC
- Detección de discrepancias
- Recuperación automática

### 3.4 IF-004: Alarmas y Eventos (RBC → CTC)
**Propósito:** Transmisión de alarmas y eventos del sistema ITCS.

**Frecuencia:** Evento (inmediato)

**Estructura de datos:**
```xml
<Body>
    <AlarmsAndEvents>
        <Alarm>
            <AlarmID>string</AlarmID>
            <Timestamp>ISO_8601</Timestamp>
            <Severity>enum</Severity>
            <Category>enum</Category>
            <Description>string</Description>
            <Source>string</Source>
            <Acknowledged>boolean</Acknowledged>
            <Actions>
                <Action>string</Action>
            </Actions>
        </Alarm>
        <Event>
            <EventID>string</EventID>
            <Timestamp>ISO_8601</Timestamp>
            <Type>enum</Type>
            <Description>string</Description>
            <Data>string</Data>
        </Event>
    </AlarmsAndEvents>
</Body>
```

**Campos:**
- **AlarmID/EventID:** Identificador único
- **Timestamp:** Momento del evento
- **Severity:** Nivel de severidad
- **Category:** Categoría del evento
- **Description:** Descripción detallada
- **Source:** Origen del evento
- **Acknowledged:** Estado de reconocimiento
- **Actions:** Acciones requeridas

**Criterios de aceptación:**
- Transmisión inmediata (< 1 segundo)
- Priorización por severidad
- Confirmación de recepción
- Escalación automática

### 3.5 IF-005: Comandos de Emergencia (CTC → RBC)
**Propósito:** Comandos de emergencia y parada de trenes.

**Frecuencia:** Evento (emergencia)

**Estructura de datos:**
```xml
<Body>
    <EmergencyCommands>
        <Command>
            <CommandID>string</CommandID>
            <Timestamp>ISO_8601</Timestamp>
            <Type>enum</Type>
            <Scope>
                <TrainID>string</TrainID>
                <Area>string</Area>
                <Global>boolean</Global>
            </Scope>
            <Action>enum</Action>
            <Parameters>
                <Parameter>string</Parameter>
            </Parameters>
            <Priority>integer</Priority>
        </Command>
    </EmergencyCommands>
</Body>
```

**Campos:**
- **CommandID:** Identificador único del comando
- **Type:** Tipo de comando de emergencia
- **Scope:** Alcance del comando (tren, área, global)
- **Action:** Acción a ejecutar
- **Parameters:** Parámetros específicos
- **Priority:** Prioridad del comando

**Criterios de aceptación:**
- Procesamiento < 1 segundo
- Confirmación inmediata
- Ejecución automática
- Log de todas las acciones

### 3.6 IF-006: Estado del Sistema (RBC → CTC)
**Propósito:** Estado general del sistema ITCS y componentes.

**Frecuencia:** 0.1 Hz (cada 10 segundos)

**Estructura de datos:**
```xml
<Body>
    <SystemStatus>
        <RBC>
            <Status>enum</Status>
            <Channels>
                <Channel>
                    <ID>integer</ID>
                    <Status>enum</Status>
                    <Health>float</Health>
                </Channel>
            </Channels>
            <Performance>
                <CPU>float</CPU>
                <Memory>float</Memory>
                <Network>float</Network>
            </Performance>
        </RBC>
        <Communication>
            <GSM_R>
                <Status>enum</Status>
                <Signal>float</Signal>
                <Quality>float</Quality>
            </GSM_R>
            <Eurobalise>
                <Active>integer</Active>
                <Failed>integer</Failed>
                <Maintenance>integer</Maintenance>
            </Eurobalise>
        </Communication>
    </SystemStatus>
</Body>
```

**Campos:**
- **RBC Status:** Estado general del RBC
- **Channels:** Estado de canales 2oo3
- **Performance:** Métricas de rendimiento
- **GSM-R:** Estado de comunicación
- **Eurobalise:** Estado de balizas

**Criterios de aceptación:**
- Actualización cada 10 segundos
- Métricas precisas
- Detección de degradación
- Alertas automáticas

### 3.7 IF-007: Configuración (CTC → RBC)
**Propósito:** Configuración y parámetros del sistema.

**Frecuencia:** Evento (cambio de configuración)

**Estructura de datos:**
```xml
<Body>
    <Configuration>
        <Parameter>
            <Name>string</Name>
            <Value>string</Value>
            <Type>enum</Type>
            <ValidRange>string</ValidRange>
            <Description>string</Description>
        </Parameter>
        <Validation>
            <Required>boolean</Required>
            <Format>string</Format>
            <Constraints>string</Constraints>
        </Validation>
        <Application>
            <Scope>enum</Scope>
            <Restart>boolean</Restart>
            <Backup>boolean</Backup>
        </Application>
    </Configuration>
</Body>
```

**Campos:**
- **Name:** Nombre del parámetro
- **Value:** Valor a configurar
- **Type:** Tipo de dato
- **ValidRange:** Rango válido
- **Description:** Descripción del parámetro
- **Validation:** Reglas de validación
- **Application:** Alcance de aplicación

**Criterios de aceptación:**
- Validación automática
- Confirmación de aplicación
- Rollback en caso de error
- Log de cambios

### 3.8 IF-008: Logs y Trazabilidad (RBC → CTC)
**Propósito:** Transmisión de logs y eventos para trazabilidad.

**Frecuencia:** 1 Hz (cada segundo)

**Estructura de datos:**
```xml
<Body>
    <LogsAndTraceability>
        <LogEntry>
            <LogID>string</LogID>
            <Timestamp>ISO_8601</Timestamp>
            <Level>enum</Level>
            <Component>string</Component>
            <Message>string</Message>
            <Data>string</Data>
            <Context>
                <TrainID>string</TrainID>
                <RouteID>string</RouteID>
                <UserID>string</UserID>
            </Context>
        </LogEntry>
        <Traceability>
            <EventID>string</EventID>
            <Chain>string</Chain>
            <Hash>string</Hash>
            <Previous>string</Previous>
        </Traceability>
    </LogsAndTraceability>
</Body>
```

**Campos:**
- **LogID:** Identificador único del log
- **Level:** Nivel de log (DEBUG, INFO, WARN, ERROR)
- **Component:** Componente que genera el log
- **Message:** Mensaje del log
- **Data:** Datos adicionales
- **Context:** Contexto del evento
- **Traceability:** Cadena de trazabilidad
- **Hash:** Hash de integridad

**Criterios de aceptación:**
- Transmisión continua
- Integridad garantizada
- Compresión de datos
- Almacenamiento seguro

---

## 4. Especificaciones Técnicas

### 4.1 Protocolo de comunicación
**TCP/IP Configuration:**
- **Puerto principal:** 8080
- **Puerto de respaldo:** 8081
- **Timeout de conexión:** 30 segundos
- **Timeout de lectura:** 60 segundos
- **Timeout de escritura:** 60 segundos
- **Buffer size:** 64 KB
- **Keep-alive:** Activado

**TLS Configuration:**
- **Versión:** TLS 1.3
- **Cifrado:** AES-256-GCM
- **Autenticación:** Certificados X.509
- **Renovación:** Automática
- **Validación:** CRL y OCSP

### 4.2 Gestión de errores
**Tipos de error:**
- **Error de conexión:** Reconexión automática
- **Error de protocolo:** Validación y rechazo
- **Error de datos:** Log y notificación
- **Error de sistema:** Escalación automática

**Procedimientos de recuperación:**
- **Reconexión automática:** 3 intentos
- **Fallback a canal de respaldo:** Automático
- **Degradación de servicio:** Controlado
- **Notificación de fallo:** Inmediata

### 4.3 Monitoreo y diagnóstico
**Métricas de comunicación:**
- **Latencia:** < 100ms
- **Throughput:** > 1000 msg/s
- **Disponibilidad:** > 99.99%
- **Pérdida de paquetes:** < 0.01%

**Herramientas de diagnóstico:**
- **Ping:** Verificación de conectividad
- **Traceroute:** Análisis de ruta
- **Packet capture:** Análisis de tráfico
- **Log analysis:** Análisis de logs

---

## 5. Plan de Pruebas

### 5.1 Pruebas de unidad
**Cada interfaz individualmente:**
- **Validación de formato:** XSD Schema
- **Pruebas de carga:** 1000 msg/s
- **Pruebas de estrés:** 24 horas continuas
- **Pruebas de fallo:** Simulación de errores

### 5.2 Pruebas de integración
**Interfaces en conjunto:**
- **Pruebas de sincronización:** Múltiples interfaces
- **Pruebas de concurrencia:** Acceso simultáneo
- **Pruebas de redundancia:** Fallo de canal
- **Pruebas de rendimiento:** Carga completa

### 5.3 Pruebas de aceptación
**Criterios contractuales:**
- **Disponibilidad:** > 99.99%
- **Latencia:** < 100ms
- **Throughput:** > 1000 msg/s
- **Seguridad:** Autenticación y cifrado

---

## 6. Referencias y Anexos

### 6.1 Referencias normativas
- **FFFIS:** Form Fit Function Interface Specification
- **EN 50159:** Comunicaciones en sistemas de señalización
- **ETCS Level 2:** Especificación técnica
- **IEC 62290:** Sistemas de gestión del tráfico ferroviario

### 6.2 Referencias del proyecto
- **ITCS_SRS_Indice_v0.1.md:** Especificación de requisitos
- **ITCS_Arquitectura_RBC_2oo3_v0.1.md:** Arquitectura RBC
- **@@Roadmap_v10.0_Marco_Gestion.md:** Estado del proyecto

---

**Control de versiones:**
| Versión | Fecha | Responsable | Descripción |
|:---:|:---:|:---|:---|
| v0.1 | 02/10/2025 | Ing. Integración | Especificación inicial de 8 interfaces FFFIS |

**Próximas versiones:**
- **v0.2:** Esquemas XSD detallados
- **v0.3:** Plan de pruebas completo
- **v1.0:** Versión final para implementación

