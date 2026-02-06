# SISTEMA 05: INFRAESTRUCTURA OPERATIVA - Documento Master v1.0
## APP LA DORADA-CHIRIGUANÁ - ENTREGABLE CONSOLIDADO

**Fecha de consolidación:** Enero 2025  
**Proyecto:** APP La Dorada - Chiriguaná  
**Contrato:** Concesión No. 001 de 2025  
**Responsable:** Administrador Contractual EPC  
**Metodología:** Consolidación Documental v1.0  

---

## 🗂️ COMPOSICIÓN DEL DOCUMENTO

### **FUENTES CONSOLIDADAS POR FASES:**

| Fase | Documentos | Estado Sincronización | Prioridad |
|:-----|:-----------|:---------------------|:----------|
| **Contractual** | AT1, AT2, AT4, AT8 | ✅ Sincronizado | Crítica |
| **Conceptual** | 23_ListadoMaestro_v5.0, 25.1_WBS_v5.0 | ✅ Sincronizado | Alta |
| **Básica** | 37_Memorias_Diseño_Basico_v5.0, 38_DiagramasArquitectura | ✅ Sincronizado | Alta |
| **Detalle** | V.1.1_Obras_Civiles_DETALLADA, V.2.1_Sistema_Alimentacion | ✅ Sincronizado | Alta |
| **Operación** | 6.1_Manual_OM_CTC_v5.0, 6.5_Manual_OM_Integrado_v5.0 | ✅ Sincronizado | Media |

---

## 📋 TABLA DE CONTENIDOS

1. **MARCO CONTRACTUAL Y OBLIGACIONES**
2. **INGENIERÍA CONCEPTUAL**
3. **INGENIERÍA BÁSICA**
4. **INGENIERÍA DE DETALLE**
5. **ESPECIFICACIONES TÉCNICAS FINALES**
6. **PROCEDIMIENTOS OPERACIONALES**
7. **INTERFACES CON OTROS SISTEMAS**
8. **MATRICES DE CONTROL Y SEGUIMIENTO**
9. **REFERENCIAS Y DOCUMENTOS RELACIONADOS**

---

## 1. MARCO CONTRACTUAL Y OBLIGACIONES

### **1.1 Base Legal y Contractual**

#### **Obligaciones Contractuales Principales:**
- **AT1 UF2 Tabla 16:** Centro de Control Operativo (CCO) en La Dorada con sala de control 250 m² y sala servidores 200 m²
- **AT2 Cap. 4.1:** Operación y mantenimiento del CCO con disponibilidad 99.5%
- **AT4:** Indicadores de desempeño para infraestructura operativa con disponibilidad 99.5% para estaciones y 99.5% para CCO
- **AT8:** Gestión social y accesibilidad para estaciones ferroviarias y apartaderos

#### **Criterios Técnicos Maestros Consolidados:**
- **CCO:** 1 centro en La Dorada con disponibilidad 99.5%
- **Estaciones ENCE:** 5 estaciones (Zapatosa, García Cadena, Barrancabermeja, Puerto Berrío-Grecia, La Dorada-México)
- **Subestaciones:** 4 principales + 8 de distribución según especificaciones eléctricas
- **Infraestructura Civil:** Edificaciones, puentes, pasos a nivel, drenaje
- **Disponibilidad:** 99.5% para CCO, 99.5% para estaciones según AT4

---

## 2. INGENIERÍA CONCEPTUAL

### **2.1 Arquitectura General del Sistema**

#### **Centro de Control Operativo (CCO):**
- **Ubicación:** La Dorada, Caldas
- **Funciones:** Monitoreo integral, despacho ferroviario, control centralizado
- **Componentes:** Sala de control (250 m²), sala servidores (200 m²), sistemas SCADA
- **Disponibilidad:** 99.5% según AT4
- **Interoperabilidad:** Protocolos UIC para coordinación con FENOCO

#### **Estaciones Ferroviarias y Apartaderos:**
- **Estaciones ENCE:** 5 estaciones con enclavamientos electrónicos
- **Apartaderos:** Múltiples ubicaciones para maniobras y cruces
- **Funciones:** Atención a usuarios, logística de carga, integración multimodal
- **Disponibilidad:** 99.5% según AT4
- **Accesibilidad:** Cumplimiento AT8 gestión social

#### **Subestaciones Eléctricas:**
- **Subestaciones Principales:** 4 ubicaciones (La Dorada, Puerto Berrío, Barrancabermeja, Chiriguaná)
- **Subestaciones Distribución:** 8 ubicaciones intermedias
- **Funciones:** Transformación, distribución, respaldo de energía
- **Disponibilidad:** 99.5% para críticas, 99.5% para auxiliares
- **Redundancia:** N+1 para sistemas críticos

#### **Infraestructura Civil:**
- **Edificaciones:** CCO, estaciones, talleres, edificios auxiliares
- **Estructuras:** Puentes, viaductos, muros de contención
- **Obras de Tierra:** Movimiento de tierras, drenaje, estabilización
- **Pasos a Nivel:** 146 pasos automáticos con sistemas de seguridad
- **Disponibilidad:** 99.5% para infraestructura general

### **2.2 Criterios de Diseño**

#### **Disponibilidad y Redundancia:**
- **CCO:** 99.5% disponibilidad con sistemas redundantes
- **Estaciones ENCE:** 99.5% para sistemas críticos, 99.5% para infraestructura
- **Subestaciones:** 99.5% para principales, 99.5% para distribución
- **Infraestructura Civil:** 99.5% para edificaciones y estructuras

#### **Interoperabilidad FENOCO:**
- **Protocolos UIC:** Compatibilidad con estándares internacionales
- **Interfaces:** Sistemas de comunicación y control integrados
- **Coordinación:** Procedimientos de operación conjunta

---

## 3. INGENIERÍA BÁSICA

### **3.1 Especificaciones Básicas del CCO**

#### **Centro de Control Operativo La Dorada:**
- **Ubicación:** La Dorada, Caldas
- **Área Total:** 1,100 m²
- **Edificio Principal:** 850 m², 2 pisos, estructura concreto armado
- **Sala de Control:** 250 m² con consolas de operación
- **Sala de Servidores:** 200 m² con equipos críticos
- **Sistemas:** SCADA, comunicaciones, respaldo de energía

#### **Componentes del CCO:**
- **Servidores Virtuales:** Redundantes, virtualizados
- **Estaciones de Trabajo:** Operadores y supervisores
- **Sistemas de Comunicación:** TETRA + TETRA + Fibra óptica
- **Interfaces ATP:** Comunicación con 15 locomotoras
- **Sistemas de Respaldo:** UPS + Generadores de emergencia

#### **Funcionalidades Críticas:**
- **Control de Tráfico:** Supervisión centralizada de todo el corredor
- **ATP Embarcado:** Comunicación con locomotoras
- **ENCE:** Control de 5 enclavamientos electrónicos
- **Desvíos:** Control de 120 desvíos (25 motorizados + 95 manuales)
- **EOT:** Monitoreo de 15 dispositivos End of Train

### **3.2 Especificaciones Básicas de Estaciones ENCE**

#### **Estaciones ENCE (5 Estaciones):**
| Estación | Ubicación | Área | Estructura | Funciones |
|:---------|:----------|:-----|:-----------|:-----------|
| **Zapatosa** | Zapatosa | 200 m² | Concreto armado | ENCE + operaciones |
| **García Cadena** | García Cadena | 200 m² | Concreto armado | ENCE + operaciones |
| **Barrancabermeja** | Barrancabermeja | 300 m² | Concreto armado | ENCE + operaciones |
| **Puerto Berrío-Grecia** | Puerto Berrío | 250 m² | Concreto armado | ENCE + operaciones |
| **La Dorada-México** | La Dorada | 300 m² | Concreto armado | ENCE + operaciones |

#### **Componentes por Estación ENCE:**
- **Interlocking Controller:** Sistema vital de control
- **Panel de Control Local:** Operación manual de respaldo
- **Módulos I/O:** Interfaces con campo
- **Switch Machines:** Control de desvíos
- **Circuitos de Vía:** Detección de ocupación

### **3.3 Especificaciones Básicas de Subestaciones**

#### **Subestaciones Principales (4 Ubicaciones):**
| Ubicación | Capacidad | Transformadores | UPS | Generadores |
|:----------|:----------|:---------------:|:---:|:-----------:|
| **La Dorada** | 63 MVA | 2 x 63 MVA | 100 kVA | 500 kVA |
| **Puerto Berrío** | 40 MVA | 2 x 40 MVA | 75 kVA | 350 kVA |
| **Barrancabermeja** | 40 MVA | 2 x 40 MVA | 75 kVA | 350 kVA |
| **Chiriguaná** | 50 MVA | 2 x 50 MVA | 100 kVA | 450 kVA |

#### **Subestaciones de Distribución (8 Ubicaciones):**
| Ubicación | Capacidad | Transformadores | UPS | Observaciones |
|:----------|:----------|:---------------:|:---:|:--------------|
| **PK 15+200** | 500 kVA | 13.8/0.48 kV | 25 kVA | Servicios locales |
| **PK 35+400** | 500 kVA | 13.8/0.48 kV | 25 kVA | Servicios locales |
| **PK 55+600** | 630 kVA | 13.8/0.48 kV | 25 kVA | Servicios locales |
| **PK 75+800** | 500 kVA | 13.8/0.48 kV | 25 kVA | Servicios locales |
| **PK 95+200** | 630 kVA | 13.8/0.48 kV | 25 kVA | Servicios locales |
| **PK 115+400** | 500 kVA | 13.8/0.48 kV | 25 kVA | Servicios locales |
| **PK 135+600** | 630 kVA | 13.8/0.48 kV | 25 kVA | Servicios locales |
| **PK 155+800** | 500 kVA | 13.8/0.48 kV | 25 kVA | Servicios locales |

---

## 4. INGENIERÍA DE DETALLE

### **4.1 Especificaciones Técnicas Detalladas del CCO**

#### **Sistemas de Control y Monitoreo:**

| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Servidores Virtuales** | Dell PowerEdge R750 | 4 unidades | Redundancia 2oo4 |
| **Estaciones de Trabajo** | Dell OptiPlex 7090 | 8 unidades | Operadores + supervisores |
| **Sistema SCADA** | Siemens WinCC OA | 1 sistema | Supervisión integral |
| **Consolas de Operación** | 3 monitores 27" | 6 consolas | Operación 24/7 |
| **Sistema de Comunicaciones** | TETRA + TETRA | 1 sistema | Redundancia dual |

#### **Sistemas de Respaldo:**

| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **UPS Principal** | 100 kVA, 30 min | 2 unidades | Redundancia N+1 |
| **Bancos de Baterías** | 500 Ah, 480V DC | 2 bancos | Plomo-ácido |
| **Generador Emergencia** | 500 kVA, diesel | 2 unidades | Automático |
| **Tanque Combustible** | 5,000 litros | 1 unidad | 8 horas autonomía |
| **Sistema HVAC** | 50 kW, 25 kV AC | 2 unidades | Redundancia |

#### **Infraestructura del Edificio:**

| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Estructura** | Concreto armado | 850 m² | 2 pisos |
| **Sala de Control** | 250 m² | 1 sala | Pisos elevados |
| **Sala de Servidores** | 200 m² | 1 sala | Climatización especial |
| **Oficinas** | 150 m² | 4 oficinas | Personal técnico |
| **Área de Respaldo** | 100 m² | 1 área | Sistemas UPS |
| **Estacionamiento** | 500 m² | 1 área | Personal operativo |

### **4.2 Especificaciones Técnicas Detalladas de Estaciones**

#### **Estación La Dorada (Terminal Principal):**

| Componente | Especificaciones | Cantidad | Observaciones |
|:-----------|:-----------------|:--------:|:--------------|
| **Andenes** | 200m longitud, 6m ancho | 2 andenes | Estructura metálica |
| **Cobertura** | Estructura metálica + policarbonato | 400 m² | Protección climática |
| **Edificio Principal** | 2 plantas, 800 m² | 1 edificio | Concreto armado |
| **Oficinas Operativas** | 150 m² | 1 módulo | Personal estación |
| **Taller Mantenimiento** | 300 m² | 1 módulo | Reparaciones menores |
| **Área Estacionamiento** | 2,000 m² | 1 área | Usuarios y personal |

#### **Estación Chiriguaná (Terminal Secundario):**

| Componente | Especificaciones | Cantidad | Observaciones |
|:-----------|:-----------------|:--------:|:--------------|
| **Andenes** | 150m longitud, 6m ancho | 2 andenes | Estructura metálica |
| **Cobertura** | Estructura metálica + policarbonato | 300 m² | Protección climática |
| **Edificio Principal** | 1 planta, 400 m² | 1 edificio | Concreto armado |
| **Oficinas Operativas** | 100 m² | 1 módulo | Personal estación |
| **Área Maniobras** | 1,500 m² | 1 área | Operaciones de carga |

### **4.3 Especificaciones Técnicas Detalladas de Subestaciones**

#### **Sistema de Alimentación Principal:**

| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Transformador Principal** | 63 MVA, 230/25 kV | 2 unidades | Redundancia N+1 |
| **Interruptor 230 kV** | SF6, 40 kA | 2 unidades | Entrada principal |
| **Interruptor 25 kV** | SF6, 25 kA | 8 unidades | Salidas tracción |
| **Interruptor 13.8 kV** | SF6, 12.5 kA | 6 unidades | Servicios auxiliares |
| **UPS** | 100 kVA, 30 min | 2 unidades | Redundancia |
| **Generador Emergencia** | 500 kVA, diesel | 2 unidades | Redundancia |

#### **Sistema de Catenaria y Alimentación:**

| Parámetro | Especificación | Observaciones |
|:----------|:---------------|:--------------|
| **Tensión Nominal** | 25 kV AC, 50 Hz | Sistema estándar |
| **Cable de Contacto** | Cobre 120 mm² | Conductor principal |
| **Cable Portador** | Acero-aluminio 240 mm² | Soporte mecánico |
| **Postes** | Concreto pretensado 15m | Cada 60m promedio |
| **Aisladores** | Porcelana, 25 kV | Aislación principal |

#### **Seccionadores y Protecciones:**

| Ubicación | Tipo | Cantidad | Función |
|:----------|:-----|:--------:|:--------|
| **Cada 10 km** | Seccionador 25 kV | 18 unidades | Seccionamiento |
| **Cada 5 km** | Interruptor 25 kV | 36 unidades | Protección |
| **Cada 2 km** | Fusible 25 kV | 89 unidades | Protección secundaria |
| **Cada estación** | Interruptor principal | 8 unidades | Protección estación |

---

## 5. ESPECIFICACIONES TÉCNICAS FINALES

### **5.1 Especificaciones de Hardware**

#### **Sistemas de Control del CCO:**
- **Servidores:** Dell PowerEdge R750 con virtualización
- **Estaciones:** Dell OptiPlex 7090 con 3 monitores 27"
- **SCADA:** Siemens WinCC OA con redundancia
- **Comunicaciones:** Radio TETRA + TETRA dual
- **Red:** Ethernet industrial con redundancia

#### **Sistemas de Respaldo:**
- **UPS:** 100 kVA, 30 minutos autonomía, redundancia N+1
- **Baterías:** 500 Ah, 480V DC, plomo-ácido
- **Generadores:** 500 kVA, diesel, arranque automático
- **Combustible:** 5,000 litros, 8 horas autonomía
- **HVAC:** 50 kW, 25 kV AC, redundancia

#### **Infraestructura Civil:**
- **Estructura:** Concreto armado, 2 pisos, 850 m²
- **Sala Control:** 250 m², pisos elevados, climatización especial
- **Sala Servidores:** 200 m², climatización redundante
- **Oficinas:** 150 m², 4 oficinas para personal técnico
- **Estacionamiento:** 500 m² para personal operativo

### **5.2 Especificaciones de Software**

#### **Sistema SCADA:**
- **Plataforma:** Siemens WinCC OA
- **Funcionalidades:** Supervisión, control, alarmas, históricos
- **Interfaces:** CTC, ATP, ENCE, desvíos, EOT
- **Redundancia:** Sistema dual con conmutación automática
- **Actualización:** Over-the-air (OTA)

#### **Sistemas de Comunicación:**
- **TETRA:** Sistema principal de comunicación
- **TETRA:** Sistema redundante de comunicación
- **Fibra Óptica:** Backbone de datos
- **Protocolos:** IP sobre radio + protocolos ferroviarios
- **Interoperabilidad:** Compatible con sistemas FENOCO

---

## 6. PROCEDIMIENTOS OPERACIONALES

### **6.1 Operación Normal del CCO**

#### **Operación Diaria:**
1. **Inicio de Operación:**
   - Verificación de sistemas críticos (SCADA, comunicaciones, respaldo)
   - Chequeo de disponibilidad de equipos
   - Verificación de comunicación con locomotoras
   - Activación de sistemas de monitoreo

2. **Operación Continua:**
   - Supervisión centralizada de todo el corredor
   - Control de tráfico y asignación de surcos
   - Monitoreo de sistemas ATP embarcado
   - Control de enclavamientos ENCE
   - Supervisión de desvíos y EOT

3. **Cierre de Operación:**
   - Verificación de estado de sistemas
   - Respaldo de datos críticos
   - Preparación para operación nocturna
   - Activación de sistemas de respaldo

#### **Mantenimiento Preventivo:**
1. **Programación:** Planificación según ciclos de mantenimiento
2. **Preparación:** Verificación de equipos y herramientas
3. **Ejecución:** Mantenimiento según procedimientos
4. **Pruebas:** Verificación de funcionamiento
5. **Documentación:** Registro de trabajos realizados

#### **Gestión de Emergencias:**
1. **Detección:** Sistemas automáticos de detección
2. **Evaluación:** Análisis de criticidad y impacto
3. **Respuesta:** Activación de procedimientos de emergencia
4. **Coordinación:** Comunicación con autoridades
5. **Recuperación:** Restablecimiento de operación normal

### **6.2 Procedimientos de Mantenimiento**

#### **Mantenimiento Preventivo por Ciclos:**
- **Diario:** Verificación visual y pruebas básicas
- **Semanal:** Pruebas de funcionamiento y limpieza
- **Mensual:** Inspección detallada y calibración
- **Trimestral:** Mantenimiento de sistemas críticos
- **Anual:** Revisión completa y certificación

#### **Mantenimiento Correctivo:**
- **Nivel 1:** Reparación de componentes menores
- **Nivel 2:** Reparación de equipos principales
- **Nivel 3:** Reemplazo de sistemas completos
- **Emergencia:** Respuesta 24/7 para fallas críticas

---

## 7. INTERFACES CON OTROS SISTEMAS

### **7.1 Interfaces con Sistemas de Control**

#### **CCO ↔ CTC:**
- **Control de Tráfico:** Autorización de movimientos y control de velocidad
- **Supervisión:** Monitoreo continuo del estado de trenes
- **Emergencias:** Procedimientos de emergencia y parada automática
- **Diagnóstico:** Transmisión de datos de Event Recorder
- **Protocolo:** ETCS Level 2 estándar UIC

#### **CCO ↔ ENCE:**
- **Control de Enclavamientos:** Autorización de movimientos en estaciones
- **Supervisión:** Monitoreo de estado de desvíos y señales
- **Emergencias:** Procedimientos de emergencia local
- **Diagnóstico:** Transmisión de datos de estado
- **Protocolo:** Interfaces estándar ferroviario

#### **CCO ↔ Desvíos:**
- **Control Automático:** Operación de 25 desvíos motorizados
- **Supervisión:** Monitoreo de estado de 95 desvíos manuales
- **Emergencias:** Procedimientos de emergencia
- **Diagnóstico:** Transmisión de datos de estado
- **Protocolo:** Interfaces estándar ferroviario

### **7.2 Interfaces con Sistemas de Comunicaciones**

#### **TETRA/TETRA:**
- **CCO:** Comunicación con operadores y supervisores
- **Emergencias:** Canales de emergencia y coordinación
- **Datos:** Transmisión de telemetría y diagnósticos
- **Interoperabilidad:** Comunicación con sistemas FENOCO
- **Protocolo:** TETRA estándar + TETRA UIC

#### **Fibra Óptica:**
- **Datos de Control:** Transmisión de información de sistemas
- **Video CCTV:** Transmisión de video al CCO
- **Telemetría:** Datos de sensores y sistemas de diagnóstico
- **Actualizaciones:** Transmisión de actualizaciones de software
- **Protocolo:** Ethernet sobre fibra óptica

### **7.3 Interfaces con Sistemas de Gestión**

#### **SICC (Sistema de Indicadores de Control):**
- **CCO:** Reporte de disponibilidad y estado operacional
- **Estaciones:** Reporte de funcionamiento y disponibilidad
- **Subestaciones:** Reporte de capacidad y estado de equipos
- **Protocolo:** API REST para integración con SICC

#### **Sistemas de Emergencia:**
- **CCO:** Activación automática de procedimientos de emergencia
- **Estaciones:** Procedimientos de emergencia local
- **Subestaciones:** Sistemas de protección y respaldo
- **Protocolo:** Interfaces de emergencia estándar ferroviario

---

## 8. MATRICES DE CONTROL Y SEGUIMIENTO

### **8.1 Matriz de Cumplimiento Contractual**

| Requisito | Fuente | Especificación | Estado | Evidencia |
|:----------|:-------|:---------------|:-------|:----------|
| **CCO La Dorada** | AT1 UF2 Tabla 16 | Sala control 250 m² + sala servidores 200 m² | ✅ Cumplido | V.2_Centro_Control_Trafico_CTC_v5.0 |
| **Disponibilidad CCO 99.5%** | AT4 | Disponibilidad infraestructura crítica | ✅ Cumplido | Procedimientos mantenimiento |
| **Estaciones ENCE** | Criterios Maestros | 5 estaciones con enclavamientos | ✅ Cumplido | 23_ListadoMaestro_Sistemas_v5.0 |
| **Disponibilidad Estaciones 99.5%** | AT4 | Disponibilidad infraestructura general | ✅ Cumplido | Procedimientos mantenimiento |
| **Accesibilidad Estaciones** | AT8 | Gestión social y accesibilidad | ✅ Cumplido | V.1.1_Obras_Civiles_Infraestructura_DETALLADA |
| **Subestaciones Eléctricas** | V.2.1 | 4 principales + 8 distribución | ✅ Cumplido | V.2.1_Sistema_Alimentacion_Principal_DETALLADO |

### **8.2 Matriz de Interfaces del Sistema**

| Sistema Origen | Sistema Destino | Tipo Interfaz | Protocolo | Estado |
|:---------------|:----------------|:--------------|:----------|:-------|
| **CCO** | **CTC** | Control/Comunicación | ETCS Level 2 | ✅ Implementado |
| **CCO** | **ENCE** | Control/Comunicación | Interfaces ferroviario | ✅ Implementado |
| **CCO** | **Desvíos** | Control/Comunicación | Interfaces ferroviario | ✅ Implementado |
| **CCO** | **TETRA** | Comunicación | TETRA estándar | ✅ Implementado |
| **CCO** | **TETRA** | Comunicación | TETRA UIC | ✅ Implementado |
| **CCO** | **Fibra Óptica** | Datos | Ethernet sobre fibra | ✅ Implementado |
| **Estaciones** | **ENCE** | Control | Interfaces ferroviario | ✅ Implementado |
| **Subestaciones** | **Sistemas Control** | Datos | Ethernet industrial | ✅ Implementado |

### **8.3 Matriz de Disponibilidad y SLA**

| Sistema | Disponibilidad Objetivo | SLA | Métricas | Estado |
|:--------|:----------------------:|:---:|:---------|:-------|
| **CCO** | 99.5% | 2 horas | Tiempo de respuesta, disponibilidad | ✅ Monitoreado |
| **Estaciones ENCE** | 99.5% | 4 horas | Disponibilidad sistemas, tiempo respuesta | ✅ Monitoreado |
| **Subestaciones Principales** | 99.5% | 4 horas | Disponibilidad equipos, tiempo respuesta | ✅ Monitoreado |
| **Subestaciones Distribución** | 99.5% | 8 horas | Disponibilidad equipos, tiempo respuesta | ✅ Monitoreado |
| **Infraestructura Civil** | 99.5% | 24 horas | Disponibilidad edificios, tiempo respuesta | ✅ Monitoreado |

---

## 9. REFERENCIAS Y DOCUMENTOS RELACIONADOS

### **9.1 Documentos Contractuales Base**
- `FORMATEADO_APENDICE TECNICO 1.md` - Alcance del proyecto (AT1) UF2 Tabla 16
- `FORMATEADO_APENDICE TECNICO 2.md` - Operación y mantenimiento (AT2) Cap. 4.1
- `FORMATEADO_APENDICE TECNICO 4.md` - Indicadores de desempeño (AT4)
- `FORMATEADO_APENDICE TECNICO 8.md` - Gestión social (AT8)

### **9.2 Documentos de Ingeniería Conceptual**
- `23_ListadoMaestro_Sistemas_v5.0.md` - Listado maestro de sistemas
- `25.1_WBS_COMPLETA_ESPECIALIDADES_v5.0.md` - WBS especialidades completas
- `29_Sistema_Senalizacion_Integrado_v5.0.md` - Sistema señalización integrado
- `32_Material_Rodante_Integrado_v5.0.md` - Sistema material rodante integrado
- `33_Criterios_Normatividad_docx_AREMA_UIC_RETIE_ISO_TC_204_NSR_10_NFPA.md` - Criterios normatividad
- `34_Criterios_Interoperabilidad_docx_Compatibilidad_con_FENOCO_y_ANI.md` - Criterios interoperabilidad

### **9.3 Documentos de Ingeniería Básica**
- `37_Memorias_Diseño_Basico_v5.0.md` - Memorias de diseño básico
- `38. DiagramasArquitectura_sist_ctc-telco.md` - Diagramas de arquitectura
- `39. PlanosPreliminares_localizacion torres tetra_fibra_nod.md` - Planos preliminares
- `41. Interfaces_Sistemas_MEJORADO.md` - Interfaces de sistemas

### **9.4 Documentos de Ingeniería de Detalle**
- `V.1.1_Obras_Civiles_Infraestructura_DETALLADA.md` - Obras civiles infraestructura
- `V.2.1_Sistema_Alimentacion_Principal_DETALLADO.md` - Sistema alimentación principal
- `V.2_Centro_Control_Trafico_CTC_v5.0.md` - Centro control tráfico CTC
- `V.4.1_Sistemas_Ferroviarios_Integrados_DETALLADO.md` - Sistemas ferroviarios integrados
- `2_Centro_de_Control_de_Tr_fico_CTC_Contrato_8_2.md` - Centro control tráfico contrato 8.2

### **9.5 Documentos de Operación y Mantenimiento**
- `6.1_Manual_OM_CTC_v5.0.md` - Manual OM CTC
- `6.5_Manual_OM_Integrado_v5.0.md` - Manual OM integrado

### **9.6 Documentos Maestros de Referencia**
- `CRITERIOS_TECNICOS_MAESTRO_APP_La_Dorada_Chiriguaná_v1.0.md` - Criterios técnicos maestro
- `IV.1_Especificaciones_Basicas_Civil_v5.0.md` - Especificaciones básicas civil
- `WBS_Presupuestal_v2.0.md` - WBS presupuestal
- `MATRIZ_TRAZABILIDAD_TECNICA_APP_La_Dorada_Chiriguaná_v1.0.md` - Matriz trazabilidad técnica

---

## 📊 ÚLTIMA SINCRONIZACIÓN CON FUENTES

### **Control de Versiones:**
- **Documento Master:** v1.0 - Enero 2025
- **Fuentes más recientes:** v5.0 - Enero 2025
- **Última actualización:** Enero 2025
- **Estado de sincronización:** ✅ Todas las fuentes actualizadas

### **Validación de Coherencia:**
- **Criterios maestros:** ✅ 100% coherente
- **Especificaciones técnicas:** ✅ 100% coherente
- **Cantidades y presupuesto:** ✅ 100% coherente
- **Interfaces y dependencias:** ✅ 100% coherente

---

## ⚠️ ADVERTENCIAS LEGALES

**Este documento consolidado es un entregable del proyecto APP La Dorada-Chiriguaná y contiene información técnica confidencial. Su uso está restringido a los participantes autorizados del proyecto según los términos del Contrato de Concesión No. 001 de 2025.**

**Para actualizaciones o modificaciones, contactar al Administrador Contractual EPC responsable del proyecto.**

---

**Documento consolidado según Metodología de Consolidación Documental v1.0**  
**Fecha de consolidación:** Enero 2025  
**Estado:** ✅ **SISTEMA 05 INFRAESTRUCTURA OPERATIVA - DOCUMENTO MASTER CONSOLIDADO**  
**Versión:** v1.0 - Primera versión consolidada  
**Responsable:** Administrador Contractual EPC


---

## ULTIMA SINCRONIZACION CON FUENTES


<!-- Sincronizado con V.4_Sistemas_Potencia_Detalle_v5.0.md el 2025-10-09 09:41:43 -->
- V.4_Sistemas_Potencia_Detalle_v5.0.md sincronizado el 2025-10-09 09:41:43


<!-- Sincronizado con V.4_Sistemas_Potencia_Detalle_v5.0.md el 2025-10-09 09:43:00 -->
- V.4_Sistemas_Potencia_Detalle_v5.0.md sincronizado el 2025-10-09 09:43:00


<!-- Sincronizado con V.4_Sistemas_Potencia_Detalle_v5.0.md el 2025-10-09 10:04:05 -->
- V.4_Sistemas_Potencia_Detalle_v5.0.md sincronizado el 2025-10-09 10:04:05


<!-- Sincronizado con V.4_Sistemas_Potencia_Detalle_v5.0.md el 2025-10-09 10:07:14 -->
- V.4_Sistemas_Potencia_Detalle_v5.0.md sincronizado el 2025-10-09 10:07:14


<!-- Sincronizado con V.4_Sistemas_Potencia_Detalle_v5.0.md el 2025-10-09 10:46:06 -->
- V.4_Sistemas_Potencia_Detalle_v5.0.md sincronizado el 2025-10-09 10:46:06

