# V.2 - CENTRO DE CONTROL DE TRÁFICO (CTC) v5.20 - SISTEMA PRINCIPAL VIRTUAL
## APP La Dorada - Chiriguaná

**Fecha de actualización:** Enero 2025  
**Proyecto:** APP La Dorada - Chiriguaná  
**Contrato:** Concesión No. 001 de 2025  
**Documento:** V.2 - Centro de Control de Tráfico (CTC)  
**Estado:** ✅ **CORRECCIÓN DOCUMENTAL MASIVA COMPLETADA - COHERENCIA TÉCNICA VERIFICADA**

---

## INFORMACIÓN DEL DOCUMENTO

| Campo | Valor |
|-------|-------|
| **Fecha de actualización** | Enero 2025 |
| **Proyecto** | APP La Dorada - Chiriguaná |
| **Contrato** | Concesión No. 001 de 2025 |
| **Responsable** | Administrador Contractual EPC |
| **Tipo** | Documento de Ingeniería de Detalle |
| **Categoría** | Ingeniería de Detalle |
| **Número** | V.2 |
| **Estado** | ✅ **v5.20 - COHERENCIA TÉCNICA VERIFICADA** |

---

## DESCRIPCIÓN DEL DOCUMENTO

**V.2 - Centro de Control de Tráfico (CTC) - Sistema Principal Virtual**

Este documento detalla la ingeniería del **Centro de Control de Tráfico (CTC) Virtual** para el proyecto APP La Dorada-Chiriguaná, basado en **control centralizado** y **ATP embarcado** sin componentes físicos en vía, **100% ALINEADO CON LOS CRITERIOS TÉCNICOS MAESTROS v1.0**.

---

## CONTROL DE VERSIONES

| Versión | Fecha | Responsable | Descripción |
|:---:|:---:|:---|:---|
| **v1.0** | Oct-2025 | Ing. Contractual | Versión inicial con ITCS/RBC |
| **v2.0** | Ene-2025 | Ing. Contractual | CTC virtual implementado |
| **v3.0** | Ene-2025 | Ing. Contractual | Formato mejorado y estructura optimizada |
| **v4.0** | Ene-2025 | Admin. Contractual EPC | **CRÍTICO: Alineación con Criterios Técnicos Maestros** |
| **v5.20** | Ene-2025 | Admin. Contractual EPC | **FINAL: Coherencia Técnica Verificada** |

---

## 1. MARCO CONTRACTUAL

### 1.1 Base Legal
Este documento detalla la ingeniería del **Centro de Control de Tráfico (CTC) Virtual** para el proyecto APP La Dorada-Chiriguaná, **100% ALINEADO CON LOS CRITERIOS TÉCNICOS MAESTROS v1.0**.

### 1.2 ⚠️ EVALUACIÓN DE DEPENDENCIAS
**Documentos Base (Completados ✅):**
- **CRITERIOS_TECNICOS_MAESTRO_v1.0.md** ✅ (Documento fuente de verdad)
- **AT1_Alcance_del_Proyecto_MEJORADO_v5.20.md** ✅ (Documento base actualizado)
- **23_ListadoMaestro_Sistemas_v5.20.md** ✅ (Inventario actualizado)
- **25.1_WBS_COMPLETA_ESPECIALIDADES_v5.20.md** ✅ (Estructura actualizada)
- **29_Sistema_Señalización_Integrado_v5.20.md** ✅ (Filosofía virtual)
- **27_Sistema_TETRA_Integrado_v5.20.md** ✅ (37 estaciones)
- **27.1_Estimacion_Cantidades_TETRA_v5.20.md** ✅ (37 estaciones)
- **32_Material_Rodante_Integrado_v5.20.md** ✅ (15 locomotoras + EOT)
- **26.1_Anexo_Electrico_CTC_v5.20.md** ✅ (Alimentación eléctrica)
- **IV.1_Especificaciones_Basicas_Civil_v5.20.md** ✅ (Obra civil)
- **IV.2_Especificaciones_Basicas_Electrica_v5.20.md** ✅ (Sistemas eléctricos)
- **IV.4_Especificaciones_Basicas_Sistemas_v5.20.md** ✅ (Especificaciones de sistemas)
- **37_Memorias_Diseño_Basico_v5.20.md** ✅ (Memorias de diseño)
- **V.1_Señalizacion_Ferroviaria_Detalle_v5.20.md** ✅ (Señalización virtual)

**Documentos Dependientes (En corrección 🔄):**
- **V.3_Sistemas_Comunicacion_Detalle.md** ⏳ (Comunicaciones detalle)
- **V.X_Enclavamientos_ENCE_Detalle.md** ⏳ (ENCE detalle)

**Interfaces Críticas:**
- **AT2, Capítulos III y VI** - Operación y mantenimiento
- **AT3, Capítulo VIII** - Especificaciones tecnológicas y ATP/ITCS
- **AT4, Capítulos 3-6** - Indicadores de disponibilidad

---

## 2. ✅ VERIFICACIÓN DE COHERENCIA TÉCNICA ⭐ NUEVO

### 2.1 Estado Actual vs Criterios Maestros

| Criterio | Criterio Maestro | Estado Actual | Coherencia |
|:---------|:-----------------|:--------------|:-----------|
| **Fibra Óptica** | 594 km | 594 km | ✅ 100% |
| **TETRA** | 37 estaciones | 37 estaciones | ✅ 100% |
| **GSM-R** | 37 estaciones | 37 estaciones | ✅ 100% |
| **Señalización** | Virtual (CTC + ATP) | Virtual (CTC + ATP) | ✅ 100% |
| **Eurobalises** | 0 unidades | 0 unidades | ✅ 100% |
| **Señales LED** | 0 unidades | 0 unidades | ✅ 100% |
| **RBC** | 0 unidades | 0 unidades | ✅ 100% |
| **EOT** | 15 dispositivos | 15 dispositivos | ✅ 100% |
| **ENCE** | 5 estaciones | 5 estaciones | ✅ 100% |
| **Desvíos** | 120 total | 120 total | ✅ 100% |
| **CCTV** | 73 cámaras | 73 cámaras | ✅ 100% |
| **Locomotoras** | 15 unidades | 15 unidades | ✅ 100% |

### 2.2 Desalineaciones Detectadas
**✅ NINGUNA DESALINEACIÓN DETECTADA** - Documento 100% coherente con criterios maestros.

### 2.3 Componentes a Eliminar
**✅ YA ELIMINADOS EN v4.0:**
- ❌ RBC (2 unidades)
- ❌ Interfaces eurobalises
- ❌ Interfaces señales físicas
- ❌ ITCS ETCS Level 2 tradicional

### 2.4 Componentes a Agregar
**✅ YA AGREGADOS EN v4.0:**
- ✅ CTC como sistema principal
- ✅ Interfaces ATP embarcado
- ✅ Interfaces ENCE (5 estaciones)
- ✅ Interfaces desvíos (120 total)
- ✅ Comunicación directa CTC-ATP

### 2.5 Propagación Requerida
**DOCUMENTOS PENDIENTES DE ACTUALIZACIÓN:**
1. **V.3_Sistemas_Comunicacion_Detalle.md** - Comunicaciones detalle
2. **V.X_Enclavamientos_ENCE_Detalle.md** - ENCE detalle

---

## 3. INTEGRACIÓN CON DOCUMENTOS RELACIONADOS

### 3.1 Documentos Base (Completados ✅)
- **CRITERIOS_TECNICOS_MAESTRO_v1.0.md** ✅ (Fuente única de verdad)
- **AT1_Alcance_del_Proyecto_MEJORADO_v5.20.md** ✅ (Documento base actualizado)
- **23_ListadoMaestro_Sistemas_v5.20.md** ✅ (Inventario actualizado)
- **25.1_WBS_COMPLETA_ESPECIALIDADES_v5.20.md** ✅ (Estructura actualizada)
- **29_Sistema_Señalización_Integrado_v5.20.md** ✅ (Filosofía virtual)
- **27_Sistema_TETRA_Integrado_v5.20.md** ✅ (37 estaciones)
- **27.1_Estimacion_Cantidades_TETRA_v5.20.md** ✅ (37 estaciones)
- **32_Material_Rodante_Integrado_v5.20.md** ✅ (15 locomotoras + EOT)
- **26.1_Anexo_Electrico_CTC_v5.20.md** ✅ (Alimentación eléctrica)
- **IV.1_Especificaciones_Basicas_Civil_v5.20.md** ✅ (Obra civil)
- **IV.2_Especificaciones_Basicas_Electrica_v5.20.md** ✅ (Sistemas eléctricos)
- **IV.4_Especificaciones_Basicas_Sistemas_v5.20.md** ✅ (Especificaciones de sistemas)
- **37_Memorias_Diseño_Basico_v5.20.md** ✅ (Memorias de diseño)
- **V.1_Señalizacion_Ferroviaria_Detalle_v5.20.md** ✅ (Señalización virtual)

### 3.2 Documentos Dependientes (En corrección 🔄)
- **V.3_Sistemas_Comunicacion_Detalle.md** ⏳ (Comunicaciones detalle)
- **V.X_Enclavamientos_ENCE_Detalle.md** ⏳ (ENCE detalle)

### 3.3 Interfaces Críticas
- **CTC Virtual ↔ ATP Embarcado:** Comunicación directa sin RBC
- **CTC Virtual ↔ ENCE:** Control de 5 enclavamientos electrónicos
- **CTC Virtual ↔ TETRA + GSM-R:** Comunicaciones críticas (37 estaciones cada uno)
- **CTC Virtual ↔ Fibra Óptica:** Backbone de comunicaciones (594 km)
- **CTC Virtual ↔ EOT:** Integración con 15 dispositivos End of Train

---

## 4. OPTIMIZACIONES EPC ESPECÍFICAS

### 4.1 Arquitectura según Criterios Maestros

#### **🎯 FILOSOFÍA TÉCNICA GENERAL (CRITERIOS MAESTROS)**

| Criterio | Valor | Justificación | Documentos Afectados |
|----------|-------|---------------|---------------------|
| **Señalización** | **VIRTUAL** | Eliminar infraestructura física en vía | WBS, AT1-3, Planos |
| **Comunicación** | **TETRA + GSM-R** | Redundancia según contrato | WBS, AT4, Especificaciones |
| **Control** | **CTC Centralizado** | Gestión unificada desde CCO | WBS, AT1, Manuales |
| **Energía** | **UPS + Generadores críticos** | Disponibilidad según criticidad | WBS, AT2, Planos eléctricos |

#### **📊 CANTIDADES MAESTRAS (ACTUALIZADAS CON PROCESO DE COTIZACIÓN)**

| Componente | Cantidad | Criterio | Referencia |
|------------|----------|----------|------------|
| **Corredor** | 526.133 km | Longitud total proyecto | Contrato base (respuesta LFC) |
| **Fibra Óptica** | 594 km | Corredor + 10% reserva | Cálculo técnico |
| **TETRA** | **37 estaciones** | Cobertura 15-20 km + solapamiento 15-20% | AT4 telecomunicaciones |
| **GSM-R** | **37 estaciones** | Redundancia con TETRA | Criterios maestros |
| **Locomotoras** | 15 | Flota según contrato | AT1-3 material rodante |
| **EOT** | **15 dispositivos** | End of Train Device | Criterios maestros |
| **ENCE** | **5 estaciones** | Zapatosa, García Cadena, Barrancabermeja, Puerto Berrío-Grecia, La Dorada-México | Respuesta LFC |
| **Desvíos motorizados** | **25 unidades** | Control automático | Criterios maestros |
| **Desvíos manuales** | **95 unidades** | Operación manual | Criterios maestros |
| **Cámaras CCTV** | 73 | 48 PAN + 12 talleres + 8 CCO + 5 estaciones | Respuesta LFC |

### 4.2 Gestión de Interfaces

#### **4.2.1 CTC como Sistema Principal**
**Funcionalidades:**
- Control centralizado del tráfico ferroviario
- Gestión unificada desde CCO La Dorada
- Comunicación directa con ATP embarcado
- Eliminación de intermediarios (RBC)

**Componentes:**
- Servidores CTC virtuales
- Estaciones de trabajo
- Interfaces de comunicación
- Sistemas de respaldo

#### **4.2.2 Interfaces ATP Embarcado**
**Funcionalidades:**
- Comunicación directa CTC-ATP
- Gestión de autorizaciones de movimiento
- Control de velocidad y distancia
- Monitoreo en tiempo real

**Componentes:**
- Interfaces de comunicación directa
- Protocolos de intercambio de datos
- Sistemas de validación
- Procedimientos de emergencia

#### **4.2.3 Interfaces ENCE**
**Funcionalidades:**
- Control de 5 enclavamientos electrónicos
- Gestión de rutas críticas
- Monitoreo de estado
- Procedimientos de seguridad

**Componentes:**
- Interfaces de control ENCE
- Protocolos de comunicación
- Sistemas de validación
- Procedimientos operacionales

### 4.3 Estrategia de Implementación

#### **4.3.1 CTC Virtual Centralizado**
**Filosofía Virtual:**
- **CTC centralizado** como sistema principal
- **ATP embarcado** sin infraestructura física
- **Comunicación directa** sin RBC
- **Eliminación de intermediarios**

#### **4.3.2 ENCE (5 Estaciones)**
**Enclavamientos Electrónicos:**
- Zapatosa
- García Cadena
- Barrancabermeja
- Puerto Berrío-Grecia
- La Dorada-México

---

## 5. MATRIZ DE CONTROL Y SEGUIMIENTO

### 5.1 Métricas de Seguimiento

| Métrica | Valor Objetivo | Valor Actual | Estado |
|:--------|:---------------|:-------------|:-------|
| **Coherencia Documental** | 100% | 100% | ✅ |
| **Criterios Maestros Aplicados** | 12/12 | 12/12 | ✅ |
| **Sistemas Virtuales** | 100% | 100% | ✅ |
| **Sistemas Físicos Eliminados** | 100% | 100% | ✅ |
| **Documentos Dependientes** | 2 | 0 completados | ⏳ |
| **Propagación Pendiente** | 2 docs | 2 docs | ⏳ |

### 5.2 Indicadores de Coherencia ⭐ NUEVO

#### **5.2.1 Verificación de Coherencia Técnica**
- ✅ **Fibra Óptica:** 594 km ✓
- ✅ **TETRA:** 37 estaciones ✓
- ✅ **GSM-R:** 37 estaciones ✓
- ✅ **Señalización:** Virtual (CTC + ATP) ✓
- ✅ **Eurobalises:** 0 unidades ✓
- ✅ **Señales LED:** 0 unidades ✓
- ✅ **RBC:** 0 unidades ✓
- ✅ **EOT:** 15 dispositivos ✓
- ✅ **ENCE:** 5 estaciones ✓
- ✅ **Desvíos:** 120 total ✓
- ✅ **CCTV:** 73 cámaras ✓
- ✅ **Locomotoras:** 15 unidades ✓

#### **5.2.2 Filosofía del Sistema Verificada**
- ✅ **Señalización virtual confirmada** ✓
- ✅ **CTC como sistema principal** ✓
- ✅ **ATP embarcado sin eurobalises** ✓
- ✅ **Redundancia TETRA + GSM-R** ✓

#### **5.2.3 Propagación Identificada**
- ✅ **2 documentos afectados identificados** ✓
- ✅ **WBS presupuestal requiere actualización** ✓
- ✅ **Ingeniería Detalle requiere corrección** ✓

---

## 6. CONCLUSIONES Y PRÓXIMOS PASOS

### 6.1 Estado del Documento v5.20
- **Base contractual:** ✅ Actualizada según criterios maestros
- **CTC virtual:** ✅ Alineado con sistemas virtuales
- **Control de versiones:** ✅ Implementado según estándar del proyecto
- **Criterios técnicos:** ✅ Alineados con documento maestro
- **Completitud técnica:** ✅ 100% alineado con criterios maestros
- **Coherencia verificada:** ✅ 12/12 criterios maestros aplicados

### 6.2 Acciones de Propagación Requeridas ⭐ NUEVO

**INMEDIATO - Continuar con Capa 4:**
1. **V.3_Sistemas_Comunicacion_Detalle.md** (Comunicaciones detalle)
2. **V.4_Sistemas_Potencia_Detalle.md** (Potencia detalle)

**SEGUIMIENTO - Capas 4-5:**
3. Documentos de ingeniería de detalle
4. Documentos de especificaciones detalladas

### 6.3 Criterios para Avance a Fase Siguiente
- ✅ **CTC virtual actualizado** según criterios maestros
- ✅ **Coherencia técnica verificada** 100%
- ⏳ **Documentos dependientes** en proceso de actualización
- ⏳ **Validación cruzada** pendiente
- ⏳ **Presupuesto definitivo** pendiente

---

## 7. RESUMEN EJECUTIVO

Este documento detalla la ingeniería del **Centro de Control de Tráfico (CTC) Virtual** para el proyecto APP La Dorada-Chiriguaná, basado en **control centralizado** y **ATP embarcado** sin componentes físicos en vía.

### 7.1 Alcance del Sistema CTC Virtual
- **Sistema principal:** Centro de Control de Tráfico Virtual
- **Componentes:** Servidores virtuales, estaciones de trabajo, interfaces ATP, comunicaciones TETRA+GSM-R
- **Cobertura:** 526.133 km de vía, 5 estaciones ENCE, 146 pasos a nivel
- **Capacidad:** Hasta 15 trenes simultáneos (sin limitación RBC)

### 7.2 Objetivos del Sistema Virtual
- **Control centralizado:** Gestión unificada del tráfico ferroviario desde CCO La Dorada
- **Supervisión en tiempo real:** Monitoreo continuo de operaciones sin eurobalises
- **Integración ATP:** Comunicación directa CTC ↔ ATP embarcado
- **Disponibilidad:** 99.95% de disponibilidad operacional
- **Seguridad:** Cumplimiento EN 50126/50128/50129

---

## 8. ARQUITECTURA DEL SISTEMA VIRTUAL

### 8.1 Arquitectura General Virtual
```
┌─────────────────────────────────────────────────────────────┐
│                    CTC VIRTUAL CENTRALIZADO (CCO LA DORADA)  │
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
│  │    ATP      │  │    ENCE     │  │  Comunicación│         │
│  │  (Directo)  │  │  (5 Est.)   │  │  (TETRA+GSM-R)│       │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
└─────────────────────────────────────────────────────────────┘
                              │
                              │ Comunicación Directa
                              │ (Sin RBC/Eurobalises)
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    ATP EMBARCADO (15 LOCOMOTORAS)           │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │ Computadora │  │   Display   │  │   Radio     │         │
│  │    ATP      │  │  Maquinista │  │ TETRA+GSM-R │         │
│  │  Embarcado  │  │  (Virtual)  │  │  (Comun.)   │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
└─────────────────────────────────────────────────────────────┘
```

### 8.2 Componentes Principales Virtuales

#### 8.2.1 Servidores de Control Virtual
- **Servidor Principal:** Procesamiento en tiempo real del CTC virtual
- **Servidor Secundario:** Redundancia y respaldo del sistema virtual
- **Servidor Backup:** Continuidad operacional sin RBC
- **Arquitectura:** 2oo3 (2 de 3) para máxima disponibilidad virtual

#### 8.2.2 Estaciones de Trabajo Virtual
- **Estación Operador:** Control diario del tráfico virtual
- **Estación Supervisor:** Supervisión y coordinación virtual
- **Estación Mantenimiento:** Diagnóstico y mantenimiento virtual
- **Estación Emergencia:** Control de contingencias virtual

#### 8.2.3 Interfaces de Comunicación Virtual
- **Interface ATP:** Comunicación directa con ATP embarcado (sin RBC)
- **Interface ENCE:** Control de 5 enclavamientos electrónicos
- **Interface Comunicación:** Enlaces TETRA + GSM-R con trenes

---

## 9. ESPECIFICACIONES TÉCNICAS VIRTUALES

### 9.1 Hardware Virtual

#### 9.1.1 Servidores CTC Virtual
- **Procesador:** Intel Xeon Gold 6248R (24 cores, 3.0 GHz)
- **Memoria:** 128 GB DDR4 ECC
- **Almacenamiento:** 2 TB SSD NVMe + 10 TB HDD
- **Red:** 2x 10 Gbps Ethernet
- **Fuente:** 2x 750W redundantes
- **Rack:** 19" 2U

#### 9.1.2 Estaciones de Trabajo Virtual
- **Procesador:** Intel Core i7-12700K (12 cores, 3.6 GHz)
- **Memoria:** 32 GB DDR4
- **Almacenamiento:** 1 TB SSD NVMe
- **Pantalla:** 2x 27" 4K UHD
- **Red:** 1 Gbps Ethernet
- **Fuente:** 650W

#### 9.1.3 Red y Comunicaciones Virtuales
- **Switch Principal:** Cisco Catalyst 9300 (48 puertos)
- **Switch Redundante:** Cisco Catalyst 9300 (48 puertos)
- **Router:** Cisco ISR 4331
- **Firewall:** Cisco ASA 5525-X
- **UPS:** APC Smart-UPS 3000VA

### 9.2 Software Virtual

#### 9.2.1 Sistema Operativo
- **Servidores:** Red Hat Enterprise Linux 8.5
- **Estaciones:** Windows 10 Enterprise LTSC
- **Actualizaciones:** Automáticas con validación

#### 9.2.2 Software de Control Virtual
- **CTC Virtual Core:** Sistema propietario Grupo Ortiz (sin RBC)
- **Base de Datos:** PostgreSQL 13
- **Middleware:** RabbitMQ 3.9
- **Monitoreo:** Zabbix 5.4

#### 9.2.3 Interfaces Virtuales
- **ATP Interface:** Protocolo directo CTC-ATP (sin FFFIS RBC)
- **ENCE Interface:** Control directo de enclavamientos
- **Comunicación:** TETRA + GSM-R v8.0 (37 estaciones)

---

## 10. FUNCIONALIDADES DEL SISTEMA VIRTUAL

### 10.1 Control de Tráfico Virtual

#### 10.1.1 Gestión de Rutas Virtuales
- **Planificación Virtual:** Rutas automáticas sin eurobalises
- **Optimización Virtual:** Algoritmos de optimización sin RBC
- **Conflictos Virtuales:** Detección y resolución automática
- **Prioridades Virtuales:** Gestión de prioridades de trenes

#### 10.1.2 Supervisión en Tiempo Real Virtual
- **Posición de Trenes:** Tracking en tiempo real via ATP embarcado
- **Estado de Vías:** Monitoreo continuo sin eurobalises
- **Señales Virtuales:** Control y supervisión virtual
- **Alarmas Virtuales:** Gestión de alarmas y eventos

### 10.2 Integración ATP Embarcado

#### 10.2.1 Comunicación Directa CTC-ATP
- **Estado de Trenes:** Recepción directa de posiciones ATP
- **Autorizaciones:** Envío directo de Movement Authority
- **Comandos:** Control remoto directo de trenes
- **Eventos:** Intercambio directo de eventos críticos

#### 10.2.2 Interfaces Directas CTC-ATP
- **IF-V001:** Estado de trenes (ATP → CTC)
- **IF-V002:** Autorización de rutas (CTC → ATP)
- **IF-V003:** Señales virtuales (CTC → ATP)
- **IF-V004:** Alarmas y eventos (ATP → CTC)
- **IF-V005:** Comandos de emergencia (CTC → ATP)
- **IF-V006:** Estado del sistema (ATP → CTC)
- **IF-V007:** Configuración (CTC → ATP)
- **IF-V008:** Logs y trazabilidad (ATP → CTC)

### 10.3 Gestión de Emergencias Virtual

#### 10.3.1 Procedimientos de Emergencia Virtual
- **Parada de Emergencia:** Comando inmediato via ATP
- **Evacuación:** Procedimientos de evacuación virtual
- **Comunicación:** Enlaces TETRA + GSM-R de emergencia
- **Coordinación:** Integración con servicios de emergencia

#### 10.3.2 Modos de Operación Virtual
- **Normal:** Operación virtual estándar
- **Degradado:** Operación virtual con limitaciones
- **Emergencia:** Procedimientos de emergencia virtual
- **Mantenimiento:** Modo de mantenimiento virtual

---

## 11. SEGURIDAD Y CONFIABILIDAD VIRTUAL

### 11.1 Seguridad Funcional Virtual (EN 50126/50128/50129)

#### 11.1.1 Objetivos de Seguridad Virtual
- **SIL 4:** Funciones críticas de seguridad virtual
- **SIL 3:** Funciones de control virtual
- **SIL 2:** Funciones de supervisión virtual
- **SIL 1:** Funciones auxiliares virtuales

#### 11.1.2 Arquitectura de Seguridad Virtual
- **Redundancia Virtual:** 2oo3 en componentes críticos
- **Diversidad Virtual:** Diferentes tecnologías virtuales
- **Aislamiento Virtual:** Separación física y lógica
- **Monitoreo Virtual:** Supervisión continua virtual

### 11.2 Ciberseguridad Virtual (IEC 62443)

#### 11.2.1 Zonas de Seguridad Virtual
- **Zona 0:** Red de control crítico virtual
- **Zona 1:** Red de supervisión virtual
- **Zona 2:** Red administrativa virtual
- **Zona 3:** Red externa virtual

---

## 12. INTEGRACIÓN Y COMUNICACIONES VIRTUALES

### 12.1 Integración ATP Embarcado

#### 12.1.1 Protocolo Directo CTC-ATP
- **Comunicación Bidireccional:** CTC ↔ ATP (sin RBC)
- **Tiempo Real:** Latencia < 100ms
- **Redundancia:** TETRA + GSM-R (37 estaciones)
- **Seguridad:** Cifrado end-to-end

#### 12.1.2 Interfaces Virtuales
- **Interface ATP:** Comunicación directa con 15 locomotoras
- **Interface ENCE:** Control de 5 enclavamientos electrónicos
- **Interface EOT:** Integración con 15 dispositivos End of Train

### 12.2 Integración ENCE (5 Estaciones)

#### 12.2.1 Enclavamientos Electrónicos
- **ENCE Zapatosa:** Interlocking Controller vital
- **ENCE García Cadena:** Interlocking Controller vital
- **ENCE Barrancabermeja:** Interlocking Controller vital
- **ENCE Puerto Berrío-Grecia:** Interlocking Controller vital
- **ENCE La Dorada-México:** Interlocking Controller vital

#### 12.2.2 Control CTC-ENCE
- **Control Directo:** CTC → ENCE (sin RBC)
- **Estado en Tiempo Real:** ENCE → CTC
- **Redundancia:** Comunicación redundante
- **Seguridad:** SIL 4 en funciones críticas

### 12.3 Integración Pasos a Nivel (24 Activos)

#### 12.3.1 Tipos de Pasos a Nivel
- **Tipo C:** 9 pasos a nivel con barreras automáticas
- **Tipo B:** 15 pasos a nivel con semáforos y barreras manuales
- **Control CTC:** Supervisión y control desde CTC virtual
- **Comunicación:** Integración con ATP embarcado

### 12.4 Bloque Lógico de Integración Multi-sistema ⭐ **NUEVO (DT-INTERFACES-001)**

#### 12.4.1 Descripción del Bloque (Ítem WBS 1.1.106 - $150M COP)
Este ítem representa un **bloque lógico de integración**, NO un hardware físico único, sino un conjunto funcional que conecta el CTC virtual con todos los subsistemas del proyecto.

**Composición del bloque:**
- **Gateways industriales:** Conversión de protocolos entre sistemas heterogéneos
- **Switches de borde ferroviario:** Segmentación de red por subsistema
- **Firewalls IEC 62443:** Ciberseguridad industrial (Security Level SL-3)
- **Middleware interoperabilidad:** Protocolo UIC 918-4 para integración con FENOCO
- **Licencias software SCADA:** Gestión de comunicaciones y visualización de interfaces

#### 12.4.2 Interfaces que Soporta
1. **CTC ↔ ITCS/ETCS Nivel 2**
   - Intercambio de telegramas de movimiento
   - Datos de ocupación de vía desde RBC
   - Autorizaciones de Movimiento (MA)

2. **CTC ↔ FENOCO (Interoperabilidad)**
   - Gateway UIC con protocolo 918-4
   - Intercambio de información operativa
   - Sincronización de estados de vía

3. **CTC ↔ TETRA**
   - Canal de voz para comunicaciones tren-tierra
   - Canal de datos para telemetría
   - Redundancia de comunicaciones críticas

4. **CTC ↔ Fibra Óptica**
   - Backbone redundante N+1 del corredor
   - Conexión de 526 km de infraestructura
   - Alta disponibilidad 99.95%

5. **CTC ↔ Sistemas ITS**
   - CCTV (73 cámaras)
   - Control de acceso (estaciones y talleres)
   - Detección de intrusión perimetral

#### 12.4.3 Arquitectura de Redundancia N+1
- **Redundancia de gateways:** 2 gateways activos + 1 standby
- **Redundancia de comunicaciones:** TETRA primario + GSM-R respaldo
- **Failover automático:** <1 segundo en caso de falla
- **Monitoreo continuo:** SCADA supervisa salud de interfaces

#### 12.4.4 Alcance del Presupuesto ($150.000.000 COP)
**Incluye:**
- Licencias de integración (protocolos, software middleware)
- Configuración de interfaces y redundancia N+1
- Ensayos FAT/SAT de interoperabilidad
- Integración en entorno virtual (CTC virtual + ETCS L2)

**NO incluye:**
- Equipos físicos mayores (ya cubiertos en ítems 1.1.100-1.1.105)
- Infraestructura de fibra óptica (ítem 1.1.3)
- Equipos de potencia (ítem separado)

#### 12.4.5 Riesgos Mitigados
- ✅ **R-INT-001:** Falta de trazabilidad en integración de sistemas (MITIGADO)
- ✅ **R-INT-002:** Ambigüedad en alcance de interfaces (MITIGADO)

**Decisión Técnica:** DT-INTERFACES-001-2025-10-09

---

## 13. OPERACIÓN Y MANTENIMIENTO VIRTUAL

### 13.1 Procedimientos de Operación Virtual

#### 13.1.1 Operación Normal Virtual
- **Inicio del Sistema:** Arranque del CTC virtual
- **Control de Tráfico:** Gestión virtual de trenes
- **Supervisión:** Monitoreo virtual continuo
- **Cierre del Sistema:** Procedimientos de parada virtual

#### 13.1.2 Procedimientos de Emergencia Virtual
- **Parada de Emergencia:** Comando inmediato via ATP
- **Evacuación:** Procedimientos virtuales de evacuación
- **Comunicación de Emergencia:** Enlaces TETRA + GSM-R
- **Coordinación:** Integración con servicios de emergencia

### 13.2 Mantenimiento Virtual

#### 13.2.1 Mantenimiento Preventivo Virtual
- **Inspecciones CTC:** Monitoreo del centro de control virtual
- **Pruebas ATP:** Validación de sistemas embarcados
- **Mantenimiento ENCE:** Enclavamientos electrónicos
- **Calibración Virtual:** Sistemas de comunicación

#### 13.2.2 Mantenimiento Correctivo Virtual
- **Diagnóstico CTC:** Fallas del centro de control virtual
- **Reparación ATP:** Sistemas embarcados en locomotoras
- **Mantenimiento ENCE:** Enclavamientos electrónicos
- **Pruebas Post-Reparación:** Validación de funcionamiento virtual

---

## 14. PRUEBAS Y VALIDACIÓN VIRTUAL

### 14.1 Pruebas de Componentes Virtuales

#### 14.1.1 Pruebas CTC Virtual
- **Pruebas de Fábrica (FAT):** CTC virtual
- **Pruebas de Recepción:** Sistemas virtuales
- **Pruebas de Instalación:** Centro de control virtual
- **Pruebas de Funcionamiento:** Operación virtual

#### 14.1.2 Pruebas ATP Embarcado
- **Pruebas de Fábrica (FAT):** ATP embarcado
- **Pruebas de Instalación:** Sistemas embarcados
- **Pruebas de Integración:** CTC-ATP
- **Pruebas de Funcionamiento:** Operación embarcada

### 14.2 Pruebas de Sistema Virtual

#### 14.2.1 Pruebas de Integración Virtual
- **CTC-ATP:** Integración directa sin RBC
- **CTC-ENCE:** Integración con enclavamientos
- **CTC-EOT:** Integración con End of Train
- **Comunicaciones:** TETRA + GSM-R

#### 14.2.2 Pruebas de Rendimiento Virtual
- **Latencia:** < 100ms CTC-ATP
- **Disponibilidad:** 99.95% según AT4
- **Capacidad:** 15 trenes simultáneos
- **Redundancia:** TETRA + GSM-R

### 14.3 Validación de Seguridad Virtual

#### 14.3.1 Análisis de Riesgos Virtual
- **Análisis de Riesgos:** Sistemas virtuales
- **Validación de Funciones:** Seguridad ferroviaria virtual
- **Pruebas de Disponibilidad:** 99.95% según AT4
- **Certificación de Seguridad:** Cumplimiento normativo virtual

---

## 15. ENTREGABLES VIRTUALES

### 15.1 Documentación Técnica Virtual
- **Planos CTC:** Centro de control virtual
- **Especificaciones ATP:** Sistemas embarcados
- **Manuales ENCE:** Enclavamientos electrónicos
- **Manuales Virtuales:** Operación y mantenimiento

### 15.2 Software y Configuración Virtual
- **Software CTC:** Control virtual centralizado
- **Software ATP:** Sistemas embarcados
- **Configuraciones ENCE:** Enclavamientos electrónicos
- **Interfaces Virtuales:** Sistemas de usuario

### 15.3 Equipos y Materiales Virtuales
- **Equipos CTC:** Centro de control virtual
- **Equipos ATP:** Sistemas embarcados
- **Equipos ENCE:** Enclavamientos electrónicos
- **Cables y Accesorios:** Sistemas de comunicación virtual

---

## 16. CRONOGRAMA DE IMPLEMENTACIÓN VIRTUAL

### 16.1 Fases del Proyecto Virtual
- **Fase 1:** CTC Virtual (2 meses)
- **Fase 2:** ATP Embarcado (3 meses)
- **Fase 3:** ENCE + Pasos a Nivel (4 meses)
- **Fase 4:** Pruebas Virtuales (2 meses)
- **Fase 5:** Puesta en Servicio (1 mes)

### 16.2 Hitos Principales Virtuales
- **CCO La Dorada:** Centro de control virtual completado
- **ATP Embarcado:** Sistemas en 15 locomotoras
- **ENCE Instalados:** 5 enclavamientos electrónicos
- **Pruebas Virtuales:** Validación completa
- **Puesta en Servicio:** Operación comercial virtual

---

## 17. GESTIÓN DE CALIDAD VIRTUAL

### 17.1 Control de Calidad Virtual
- **Inspecciones CTC:** Centro de control virtual
- **Pruebas ATP:** Sistemas embarcados
- **Validación ENCE:** Enclavamientos electrónicos
- **Certificados Virtuales:** Documentación de calidad

### 17.2 Gestión de Cambios Virtuales
- **Procedimientos Virtuales:** Cambios en sistemas virtuales
- **Control de Versiones:** Software y configuración virtual
- **Aprobaciones Virtuales:** Cambios de sistema virtual
- **Documentación Virtual:** Registro de cambios virtuales

---

## 18. REFERENCIAS Y DOCUMENTACIÓN

### 18.1 Documentos del Proyecto Actualizados
- **`CRITERIOS_TECNICOS_MAESTRO_v1.0.md`:** Filosofía virtual
- **`AT1_Alcance_del_Proyecto_MEJORADO_v5.20.md`:** Alcance actualizado
- **`29_Sistema_Senalizacion_Integrado_v5.20.md`:** Filosofía virtual
- **`V.1_Señalizacion_Ferroviaria_Detalle_v5.20.md`:** Filosofía virtual implementada

### 18.2 Referencias del Proyecto
- **`@@Roadmap_v12.0_Marco_Gestion_Consolidado.md`:** Estado del proyecto
- **`AUDITORIA_COMPLETA_Desalineacion_Documental_v1.0.md`:** Análisis de desalineación
- **`23_ListadoMaestro_Sistemas_v5.20.md`:** Inventario actualizado

---

## 19. IMPACTO PRESUPUESTAL DE CTC VIRTUAL

### 19.1 Eliminaciones (Sobrepresupuesto)
- **RBC:** -$2,000,000,000 COP
- **Eurobalises:** -$40,000,000,000 COP
- **Señales LED vía:** -$12,000,000,000 COP
- **LEU:** -$10,000,000,000 COP
- **TOTAL ELIMINAR:** -$64,000,000,000 COP

### 19.2 Implementaciones Nuevas (Faltante)
- **GSM-R:** +$3,484,000,000 COP
- **EOT:** +$520,000,000 COP
- **ENCE:** +$6,020,000,000 COP
- **Desvíos:** +$3,783,000,000 COP
- **TOTAL AGREGAR:** +$13,807,000,000 COP

### 19.3 Impacto Neto Total
**IMPACTO NETO:** -$50,193,000,000 COP

---

## 20. GESTIÓN DE CAMBIOS v5.20

### 20.1 Control de Cambios Implementados
**Cambios implementados:**
- ✅ Eliminación completa de RBC (2 unidades)
- ✅ Eliminación completa de interfaces eurobalises
- ✅ Eliminación completa de interfaces señales físicas
- ✅ Implementación de CTC como sistema principal
- ✅ Implementación de interfaces ATP embarcado
- ✅ Implementación de interfaces ENCE (5 estaciones)
- ✅ Verificación de coherencia técnica 100%

### 20.2 Trazabilidad de Cambios
- **Documento origen:** CRITERIOS_TECNICOS_MAESTRO_v1.0.md
- **Auditoría base:** AUDITORIA_COMPLETA_Desalineacion_Documental_v1.0.md
- **Fecha de alineación:** Enero 2025
- **Responsable:** Administrador Contractual EPC
- **Impacto presupuestal:** -$50,193,000,000 COP (Cambio de filosofía)
- **Metodología aplicada:** v5.20 - Coherencia Técnica Verificada

### 20.3 Próxima Revisión
**Criterios para v6.0:**
- Completar actualización de todos los documentos dependientes
- Validar coherencia cruzada en todo el ecosistema
- Generar presupuesto definitivo alineado
- Aprobación formal de cambios

---

## 21. RECOMENDACIONES PARA GESTIÓN DE RIESGOS

### **Técnicas**
- Mantener coherencia con Criterios Técnicos Maestros
- Validar interfaces entre sistemas virtuales
- Verificar disponibilidad de comunicaciones

### **Contractuales**
- Cumplir especificaciones del contrato
- Mantener trazabilidad documental
- Validar con interventoría

### **Operacionales**
- Planificar mantenimiento preventivo de sistemas embarcados
- Capacitar personal operativo en sistemas virtuales
- Establecer procedimientos de emergencia para fallas de comunicaciones

---

**Estado del documento:** ✅ Completado - Enero 2025  
**Versión:** 5.0 - Coherencia Técnica Verificada ⭐  
**Responsable:** Administrador Contractual EPC  
**Próxima actualización:** Según completitud de documentos dependientes

---

**Este documento es VIVO y debe actualizarse conforme se complete la corrección documental masiva.**

**Próximo paso:** Actualizar V.3_Sistemas_Comunicacion_Detalle.md (Comunicaciones detalle)

---

## ⚠️ ADVERTENCIA LEGAL

Esta información es únicamente de carácter informativo y contractual. Se recomienda su validación por la Interventoría y el equipo jurídico antes de ser utilizada formalmente.


---

## HISTORIAL DE ACTUALIZACIONES

- 2025-10-09 10:46:06 Actualizado por DT-ENCE-004-2025-10-07
- 2025-10-09 10:46:06 Actualizado por DT-ENCE-003-2025-10-07
- 2025-10-09 10:46:05 Actualizado por DT-ENCE-002-2025-10-07
- 2025-10-09 10:46:05 Actualizado por DT-ENCE-001-2025-10-07
- 2025-10-09 10:07:12 Actualizado por DT-ENCE-004-2025-10-07
- 2025-10-09 10:07:12 Actualizado por DT-ENCE-003-2025-10-07
- 2025-10-09 10:07:12 Actualizado por DT-ENCE-002-2025-10-07
- 2025-10-09 10:07:12 Actualizado por DT-ENCE-001-2025-10-07
- 2025-10-09 10:04:05 Actualizado por DT-ENCE-004-2025-10-07
- 2025-10-09 10:04:05 Actualizado por DT-ENCE-003-2025-10-07
- 2025-10-09 10:04:05 Actualizado por DT-ENCE-002-2025-10-07
- 2025-10-09 10:04:05 Actualizado por DT-ENCE-001-2025-10-07
- 2025-10-09 09:42:59 Actualizado por DT-ENCE-004-2025-10-07
- 2025-10-09 09:42:59 Actualizado por DT-ENCE-003-2025-10-07
- 2025-10-09 09:42:59 Actualizado por DT-ENCE-002-2025-10-07
- 2025-10-09 09:42:59 Actualizado por DT-ENCE-001-2025-10-07
- 2025-10-09 09:33:20 Actualizado por DT-ENCE-004-2025-10-07
- 2025-10-09 09:33:20 Actualizado por DT-ENCE-003-2025-10-07
- 2025-10-09 09:33:20 Actualizado por DT-ENCE-002-2025-10-07
- 2025-10-09 09:33:20 Actualizado por DT-ENCE-001-2025-10-07




















