# V.3 Sistemas de Comunicación v2.0 - TETRA + GSM-R COLOCALIZADOS
## APP La Dorada - Chiriguaná

**Fecha de actualización:** Enero 2025  
**Proyecto:** APP La Dorada - Chiriguaná  
**Contrato:** Concesión No. 001 de 2025  
**Versión:** 2.0  
**Estado:** ✅ **ACTUALIZADO - TETRA + GSM-R COLOCALIZADOS**

---

## 🚨 **ACTUALIZACIÓN CRÍTICA v2.0 - TETRA + GSM-R COLOCALIZADOS**

### **📋 CAMBIO DE PARADIGMA COMPLETO:**

#### **🔴 FILOSOFÍA ANTERIOR (ELIMINADA):**
- **❌ TETRA:** 33 estaciones → **37 estaciones** (Ajuste a criterios maestros)
- **❌ GSM-R:** Sistema independiente → **Colocalizado con TETRA** (Redundancia operacional)
- **❌ Cobertura:** 146 km → **526.133 km** (Corredor completo)
- **❌ Capacidad:** 24 trenes → **15 trenes** (Alineación con ATP embarcado)

#### **✅ FILOSOFÍA NUEVA (IMPLEMENTADA):**
- **✅ TETRA:** 37 estaciones base con solapamiento 15-20%
- **✅ GSM-R:** 37 estaciones colocalizadas con TETRA
- **✅ Colocalización:** Misma torre para TETRA + GSM-R
- **✅ Redundancia:** Doble sistema de comunicaciones
- **✅ Integración:** CTC virtual + ATP embarcado

---

## 1. Resumen Ejecutivo

Este documento detalla la ingeniería de los **sistemas de comunicación colocalizados** para el proyecto APP La Dorada-Chiriguaná, basado en **TETRA + GSM-R colocalizados** en 37 estaciones con redundancia operacional.

### 1.1 Alcance del Sistema de Comunicaciones Colocalizadas
- **Sistema principal:** Red de comunicaciones ferroviarias colocalizadas
- **Componentes:** TETRA + GSM-R colocalizados, fibra óptica, VSAT, emergencias
- **Cobertura:** 526.133 km de vía, 5 estaciones ENCE, 146 pasos a nivel
- **Capacidad:** 15 trenes simultáneos + servicios auxiliares

### 1.2 Objetivos del Sistema Colocalizado
- **Comunicación tren-tierra:** Enlace crítico para ATP embarcado (sin RBC)
- **Comunicación operacional:** Voz y datos para operadores
- **Redundancia operacional:** TETRA + GSM-R como respaldo mutuo
- **Disponibilidad:** 99.9% de disponibilidad operacional
- **Seguridad:** Cumplimiento EN 50126/50128/50129

---

## 2. Arquitectura del Sistema Colocalizado

### 2.1 Arquitectura General Colocalizada
```
┌─────────────────────────────────────────────────────────────┐
│                SISTEMAS DE COMUNICACIÓN COLOCALIZADOS       │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │   TETRA     │  │   GSM-R     │  │   Fibra     │         │
│  │ + GSM-R     │  │ + TETRA     │  │  Óptica     │         │
│  │ Colocalizado│  │ Colocalizado│  │  (DWDM)     │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │  Satelital  │  │ Emergencia  │  │  Internet   │         │
│  │  Respaldo   │  │  (VHF/UHF)  │  │  Admin      │         │
│  │  (VSAT)     │  │             │  │  (MPLS)     │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │   Torre 1   │  │   Torre 2   │  │   Torre 3   │         │
│  │ TETRA+GSM-R │  │ TETRA+GSM-R │  │ TETRA+GSM-R │         │
│  │ (La Dorada) │  │(Puerto Salgar)│ │(Puerto Berrío)│     │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
└─────────────────────────────────────────────────────────────┘
                              │
                              │ 37 Torres Colocalizadas
                              │ (TETRA + GSM-R)
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    ATP EMBARCADO (15 LOCOMOTORAS)           │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │ Radio TETRA │  │ Radio GSM-R │  │   Display   │         │
│  │  Embarcado  │  │  Embarcado  │  │  Maquinista │         │
│  │ (Redundante)│  │ (Principal) │  │  (Virtual)  │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
└─────────────────────────────────────────────────────────────┘
```

### 2.2 Componentes Principales Colocalizados

#### 2.2.1 TETRA + GSM-R Colocalizados (37 Estaciones)
- **TETRA:** 37 estaciones base con solapamiento 15-20%
- **GSM-R:** 37 estaciones base colocalizadas con TETRA
- **Torres:** 37 torres compartidas (TETRA + GSM-R)
- **Redundancia:** Respaldo mutuo entre sistemas
- **Cobertura:** 526.133 km de vía con solapamiento

#### 2.2.2 Fibra Óptica (594 km)
- **Tecnología:** DWDM (Dense Wavelength Division Multiplexing)
- **Capacidad:** 100 Gbps por canal, 80 canales
- **Cobertura:** 594 km de vía con redundancia
- **Aplicaciones:** Datos críticos, video, telemetría

#### 2.2.3 Comunicaciones Satelitales (Respaldo)
- **Tecnología:** VSAT (Very Small Aperture Terminal)
- **Banda:** Ku-band (12-14 GHz)
- **Cobertura:** Nacional e internacional
- **Aplicaciones:** Respaldo, emergencias, administración

---

## 3. Especificaciones Técnicas Colocalizadas

### 3.1 TETRA + GSM-R Colocalizados

#### 3.1.1 Estaciones Base Colocalizadas (37 Torres)
- **Fabricante TETRA:** Motorola (TETRA)
- **Fabricante GSM-R:** Nokia (BSC, BTS)
- **Potencia TETRA:** 25W por sector
- **Potencia GSM-R:** 40W por sector
- **Antenas:** Sectoriales 120° (3 sectores por sistema)
- **Altura:** 30-50 metros (torres compartidas)
- **Cobertura:** 15-20 km por estación (con solapamiento)

#### 3.1.2 Equipos Embarcados Duales (15 Locomotoras)
- **Radio TETRA:** Motorola (MTM800)
- **Radio GSM-R:** Thales (Cab Radio)
- **Potencia TETRA:** 3W (móvil), 1W (portátil)
- **Potencia GSM-R:** 8W (móvil), 2W (portátil)
- **Antenas:** Omnidireccionales duales
- **Batería:** 12 horas de autonomía (TETRA), 8 horas (GSM-R)
- **Interfaz:** ATP embarcado compatible

#### 3.1.3 Red Core Colocalizada
- **TETRA Core:** Motorola (TETRA Core)
- **GSM-R Core:** Nokia (MSC, BSC, HLR, VLR)
- **Integración:** Gateway TETRA-GSM-R
- **Redundancia:** N+1 en ambos sistemas
- **Conmutación:** Automática entre sistemas

### 3.2 Fibra Óptica (594 km)

#### 3.2.1 Cable Óptico
- **Tipo:** G.652.D (SMF-28)
- **Fibras:** 144 fibras (72 pares)
- **Atenuación:** 0.35 dB/km @ 1550 nm
- **Dispersión:** 18 ps/nm/km @ 1550 nm
- **Instalación:** Enterrado + aéreo
- **Longitud:** 594 km (corredor completo)

#### 3.2.2 Equipos DWDM
- **Fabricante:** Ciena (WaveLogic)
- **Canales:** 80 canales (100 GHz spacing)
- **Capacidad:** 100 Gbps por canal
- **Amplificadores:** EDFA (Erbium Doped Fiber Amplifier)
- **Regeneradores:** 3R (Reamplify, Reshape, Retime)

#### 3.2.3 Equipos de Terminal
- **ROADM:** Reconfigurable Optical Add-Drop Multiplexer
- **OTN:** Optical Transport Network
- **SDH:** Synchronous Digital Hierarchy
- **Ethernet:** 10/100/1000/10000 Mbps

### 3.3 Comunicaciones Satelitales (Respaldo)

#### 3.3.1 Terminales VSAT
- **Fabricante:** Hughes (HN7740)
- **Antena:** 1.2 metros (Ku-band)
- **Potencia:** 2W (transmisión)
- **Velocidad:** 2 Mbps (downlink), 512 kbps (uplink)
- **Protocolo:** IP over satellite

#### 3.3.2 Hub Satelital
- **Ubicación:** Bogotá (Colombia)
- **Antena:** 7.3 metros
- **Potencia:** 100W
- **Capacidad:** 100 Mbps
- **Redundancia:** 2+1

---

## 4. Funcionalidades del Sistema Colocalizado

### 4.1 Comunicación Tren-Tierra Colocalizada

#### 4.1.1 ATP Embarcado (Sin RBC)
- **Movement Authority:** Autorización de movimiento via CTC virtual
- **Position Report:** Reporte de posición via TETRA/GSM-R
- **Emergency Stop:** Parada de emergencia via doble sistema
- **Data Logging:** Registro de datos via redundancia
- **Latencia:** < 100ms (TETRA), < 500ms (GSM-R)

#### 4.1.2 Servicios de Voz Duales
- **Driver-Controller:** Comunicación directa via TETRA/GSM-R
- **Group Call:** Llamadas grupales redundantes
- **Emergency Call:** Llamadas de emergencia duales
- **Priority Call:** Llamadas prioritarias con respaldo
- **Call Recording:** Grabación de llamadas duales

### 4.2 Comunicación Operacional Colocalizada

#### 4.2.1 CTC-ATP Virtual
- **Interface Directa:** CTC ↔ ATP (sin RBC)
- **Protocolo:** XML/JSON over IP
- **Frecuencia:** 1 Hz (tiempo real)
- **Latencia:** < 100 ms
- **Confiabilidad:** 99.99% (doble sistema)

#### 4.2.2 SCADA Colocalizado
- **Protocolo:** OPC UA
- **Datos:** Telemetría, alarmas, control
- **Frecuencia:** 0.1 Hz (supervisión)
- **Latencia:** < 1 s
- **Confiabilidad:** 99.9% (redundante)

### 4.3 Comunicación de Emergencia Colocalizada

#### 4.3.1 Enlaces de Respaldo Múltiples
- **TETRA:** Radio principal
- **GSM-R:** Radio de respaldo
- **VSAT:** Satelital de emergencia
- **VHF/UHF:** Radio local
- **Internet:** Enlace administrativo
- **Redundancia:** N+2 (TETRA + GSM-R + VSAT)

#### 4.3.2 Procedimientos de Emergencia Colocalizados
- **Activación automática:** Failover automático entre sistemas
- **Activación manual:** Procedimientos manuales duales
- **Coordinación:** Integración con servicios de emergencia
- **Comunicación:** Enlaces múltiples con respaldo

---

## 5. Seguridad y Confiabilidad Colocalizada

### 5.1 Seguridad Funcional Colocalizada (EN 50126/50128/50129)

#### 5.1.1 Objetivos de Seguridad Colocalizados
- **SIL 4:** Comunicación ATP embarcado (TETRA + GSM-R)
- **SIL 3:** Comunicación operacional dual
- **SIL 2:** Comunicación de supervisión redundante
- **SIL 1:** Comunicación administrativa

#### 5.1.2 Arquitectura de Seguridad Colocalizada
- **Redundancia:** N+1 en enlaces críticos (TETRA + GSM-R)
- **Diversidad:** Diferentes tecnologías (TETRA, GSM-R, VSAT)
- **Aislamiento:** Separación física y lógica
- **Monitoreo:** Supervisión continua dual

### 5.2 Ciberseguridad Colocalizada (IEC 62443)

#### 5.2.1 Zonas de Seguridad Colocalizadas
- **Zona 0:** Red de control crítico (TETRA + GSM-R)
- **Zona 1:** Red de supervisión (Fibra)
- **Zona 2:** Red administrativa (Internet)
- **Zona 3:** Red externa (Satelital)

#### 5.2.2 Medidas de Protección Colocalizadas
- **Firewall:** Protección perimetral dual
- **IDS/IPS:** Detección de intrusiones redundante
- **Criptografía:** AES-256, RSA-2048 (ambos sistemas)
- **VPN:** Túneles seguros duales
- **Backup:** Respaldo y recuperación múltiple

### 5.3 Disponibilidad Colocalizada

#### 5.3.1 Objetivos de Disponibilidad Colocalizados
- **TETRA:** 99.9% (8.76 horas/año)
- **GSM-R:** 99.9% (8.76 horas/año)
- **Sistema Combinado:** 99.99% (0.88 horas/año)
- **Fibra Óptica:** 99.95% (4.38 horas/año)
- **VSAT:** 99.0% (87.6 horas/año)

#### 5.3.2 Estrategias de Redundancia Colocalizadas
- **Enlaces:** N+2 con failover automático (TETRA + GSM-R + VSAT)
- **Equipos:** Redundancia en componentes críticos
- **Alimentación:** UPS + generador (ambas torres)
- **Comunicación:** Enlaces múltiples con respaldo mutuo

---

## 6. Integración y Comunicaciones Colocalizadas

### 6.1 Integración ATP Embarcado

#### 6.1.1 Protocolo TETRA + GSM-R
- **Estándar TETRA:** ETSI EN 300 392-2
- **Estándar GSM-R:** EIRENE v15.4
- **Formato:** Voz + Datos
- **Frecuencia:** 1 Hz (tiempo real)
- **Latencia:** < 100ms (TETRA), < 500ms (GSM-R)
- **Confiabilidad:** 99.99% (combinada)

#### 6.1.2 Datos Intercambiados Colocalizados
- **Position Report:** Coordenadas GPS via TETRA/GSM-R
- **Movement Authority:** Autorización de movimiento via CTC virtual
- **Emergency Stop:** Parada de emergencia via doble sistema
- **System Status:** Estado del sistema via redundancia
- **Alarms:** Alarmas y eventos via doble canal

### 6.2 Comunicaciones Externas Colocalizadas

#### 6.2.1 Enlaces Nacionales Colocalizados
- **Fibra Óptica:** Enlace principal (594 km)
- **TETRA:** Enlace de respaldo
- **GSM-R:** Enlace de respaldo
- **VSAT:** Enlace de emergencia
- **Internet:** Enlace administrativo

#### 6.2.2 Enlaces Internacionales Colocalizados
- **VSAT:** Enlace satelital
- **Internet:** Enlace IP
- **Roaming:** GSM-R internacional
- **Backup:** Enlaces múltiples con respaldo

---

## 7. Operación y Mantenimiento Colocalizada

### 7.1 Procedimientos de Operación Colocalizada

#### 7.1.1 Operación Normal Colocalizada
- **Inicio del Sistema:** Arranque dual (TETRA + GSM-R)
- **Control de Tráfico:** Gestión dual de comunicaciones
- **Supervisión:** Monitoreo dual continuo
- **Cierre del Sistema:** Procedimientos de parada dual

#### 7.1.2 Procedimientos de Emergencia Colocalizada
- **Failover Automático:** Conmutación automática TETRA ↔ GSM-R
- **Failover Manual:** Procedimientos manuales duales
- **Coordinación:** Integración con servicios de emergencia
- **Comunicación:** Enlaces múltiples con respaldo

### 7.2 Mantenimiento Colocalizado

#### 7.2.1 Mantenimiento Preventivo Colocalizado
- **Inspecciones TETRA:** Monitoreo del sistema TETRA
- **Inspecciones GSM-R:** Monitoreo del sistema GSM-R
- **Inspecciones Torres:** Mantenimiento de torres compartidas
- **Calibración Dual:** Sistemas de comunicación duales

#### 7.2.2 Mantenimiento Correctivo Colocalizado
- **Diagnóstico TETRA:** Fallas del sistema TETRA
- **Diagnóstico GSM-R:** Fallas del sistema GSM-R
- **Reparación Torres:** Mantenimiento de torres compartidas
- **Pruebas Post-Reparación:** Validación dual de funcionamiento

---

## 8. Pruebas y Validación Colocalizada

### 8.1 Pruebas de Componentes Colocalizados

#### 8.1.1 Pruebas TETRA + GSM-R
- **Pruebas de Fábrica (FAT):** TETRA + GSM-R
- **Pruebas de Recepción:** Sistemas colocalizados
- **Pruebas de Instalación:** Torres compartidas
- **Pruebas de Funcionamiento:** Operación dual

#### 8.1.2 Pruebas ATP Embarcado
- **Pruebas de Fábrica (FAT):** Radios duales embarcados
- **Pruebas de Instalación:** Sistemas embarcados duales
- **Pruebas de Integración:** CTC-ATP via doble sistema
- **Pruebas de Funcionamiento:** Operación embarcada dual

### 8.2 Pruebas de Sistema Colocalizado

#### 8.2.1 Pruebas de Integración Colocalizada
- **TETRA-GSM-R:** Integración colocalizada
- **CTC-ATP:** Integración via doble sistema
- **Redundancia:** Pruebas de failover automático
- **Comunicaciones:** TETRA + GSM-R + VSAT

#### 8.2.2 Pruebas de Rendimiento Colocalizado
- **Latencia:** < 100ms (TETRA), < 500ms (GSM-R)
- **Disponibilidad:** 99.99% (sistema combinado)
- **Capacidad:** 15 trenes simultáneos
- **Redundancia:** N+2 (TETRA + GSM-R + VSAT)

### 8.3 Validación de Seguridad Colocalizada

#### 8.3.1 Análisis de Riesgos Colocalizado
- **Análisis de Riesgos:** Sistemas colocalizados
- **Validación de Funciones:** Seguridad ferroviaria dual
- **Pruebas de Disponibilidad:** 99.99% según AT4
- **Certificación de Seguridad:** Cumplimiento normativo dual

---

## 9. Entregables Colocalizados

### 9.1 Documentación Técnica Colocalizada
- **Planos TETRA + GSM-R:** Sistemas colocalizados
- **Especificaciones Torres:** Torres compartidas
- **Manuales ATP:** Sistemas embarcados duales
- **Manuales Colocalizados:** Operación y mantenimiento dual

### 9.2 Software y Configuración Colocalizada
- **Software TETRA:** Sistema TETRA
- **Software GSM-R:** Sistema GSM-R
- **Configuraciones Torres:** Torres compartidas
- **Interfaces Colocalizadas:** Sistemas de usuario duales

### 9.3 Equipos y Materiales Colocalizados
- **Equipos TETRA:** Sistema TETRA
- **Equipos GSM-R:** Sistema GSM-R
- **Equipos Torres:** Torres compartidas
- **Cables y Accesorios:** Sistemas de comunicación colocalizados

---

## 10. Cronograma de Implementación Colocalizada

### 10.1 Fases del Proyecto Colocalizado
- **Fase 1:** TETRA + GSM-R Colocalizados (3 meses)
- **Fase 2:** Torres Compartidas (2 meses)
- **Fase 3:** ATP Embarcado Dual (3 meses)
- **Fase 4:** Pruebas Colocalizadas (2 meses)
- **Fase 5:** Puesta en Servicio (1 mes)

### 10.2 Hitos Principales Colocalizados
- **37 Torres Colocalizadas:** TETRA + GSM-R completadas
- **ATP Embarcado Dual:** Sistemas en 15 locomotoras
- **Redundancia Operacional:** TETRA + GSM-R funcionando
- **Pruebas Colocalizadas:** Validación completa
- **Puesta en Servicio:** Operación comercial colocalizada

---

## 11. Gestión de Calidad Colocalizada

### 11.1 Control de Calidad Colocalizado
- **Inspecciones TETRA:** Sistema TETRA
- **Inspecciones GSM-R:** Sistema GSM-R
- **Validación Torres:** Torres compartidas
- **Certificados Colocalizados:** Documentación de calidad dual

### 11.2 Gestión de Cambios Colocalizada
- **Procedimientos Colocalizados:** Cambios en sistemas duales
- **Control de Versiones:** Software y configuración dual
- **Aprobaciones Colocalizadas:** Cambios de sistema dual
- **Documentación Colocalizada:** Registro de cambios duales

---

## 12. Referencias y Documentación

### 12.1 Documentos del Proyecto Actualizados
- **`CRITERIOS_TECNICOS_MAESTRO_v1.0.md`:** TETRA 37 + GSM-R colocalizado
- **`AT1_Alcance_del_Proyecto_MEJORADO_v4.0.md`:** Alcance actualizado
- **`27_Sistema_TETRA_Integrado_v5.0.md`:** 37 estaciones + GSM-R
- **`29_Sistema_Senalizacion_Integrado_v5.0.md`:** Filosofía virtual

### 12.2 Referencias del Proyecto
- **`@@Roadmap_v12.0_Marco_Gestion_Consolidado.md`:** Estado del proyecto
- **`MATRIZ_IMPACTO_DOCUMENTOS_AFECTADOS_v1.0.md`:** Análisis de desalineación
- **`III. Ingenieria conceptual/23_ListadoMaestro_Sistemas_v4.0.md`:** Inventario actualizado

---

## 13. Impacto Presupuestal de TETRA + GSM-R Colocalizados

### 13.1 Ajustes de Cantidades
- **TETRA:** 33 → 37 estaciones (+4 estaciones)
- **GSM-R:** 0 → 37 estaciones (+37 estaciones)
- **Torres:** 33 → 37 torres (+4 torres)
- **Colocalización:** Optimización de costos

### 13.2 Impacto Presupuestal Neto
- **TETRA +4 estaciones:** +$2,000,000,000 COP
- **GSM-R +37 estaciones:** +$3,484,000,000 COP
- **Optimización colocalización:** -$1,000,000,000 COP
- **IMPACTO NETO:** +$4,484,000,000 COP

---

## 14. Interfaces Documentales v2.0

### 14.1 Documentos Actualizados (v2.0)
- **AT1 v4.0:** ✅ Actualizado - TETRA 37 + GSM-R colocalizado
- **Listado Maestro v4.0:** ✅ Actualizado - Sistemas colocalizados
- **WBS v4.0:** ✅ Actualizado - Estructura colocalizada
- **27_Sistema_TETRA v5.0:** ✅ Actualizado - 37 estaciones + GSM-R
- **V.3_Comunicaciones v2.0:** ✅ Actualizado - TETRA + GSM-R colocalizados

### 14.2 Documentos Dependientes (Por Actualizar)
- **V.4_Sistemas_Potencia_Detalle_v1.0.md** ⏳ (Alimentación torres)
- **V.5_Sistemas_Seguridad_Detalle_v1.0.md** ⏳ (Seguridad colocalizada)

---

**Control de versiones:**
| Versión | Fecha | Responsable | Descripción |
|:---:|:---:|:---|:---|
| v1.0 | 02/10/2025 | Ing. Comunicaciones | Especificación inicial con GSM-R independiente |
| **v2.0** | **Ene-2025** | **Admin. Contractual EPC** | **CRÍTICO: TETRA + GSM-R colocalizados** |

---

**Estado del documento:** ✅ **COMPLETADO - TETRA + GSM-R COLOCALIZADOS**  
**Fecha de consolidación:** Enero 2025  
**Responsable:** Administrador Contractual EPC  
**Próxima revisión:** Febrero 2025

---

**Este documento es VIVO y debe actualizarse conforme se complete la corrección documental masiva.**

**Próximo paso:** Actualizar V.4_Sistemas_Potencia_Detalle_v1.0.md (Alimentación torres)

---

Esta información es únicamente de carácter informativo. Se recomienda su revisión y validación por el equipo jurídico del proyecto antes de ser utilizada formalmente.
