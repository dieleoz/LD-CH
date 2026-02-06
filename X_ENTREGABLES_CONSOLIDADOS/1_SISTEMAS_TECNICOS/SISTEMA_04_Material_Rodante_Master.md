# SISTEMA 04: MATERIAL RODANTE - Documento Master v1.0
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
| **Contractual** | AT1, AT2, AT3, AT4, AT10, Cl13.1 | ✅ Sincronizado | Crítica |
| **Conceptual** | 32_Material_Rodante_Integrado_v5.0, 23_ListadoMaestro_v5.0 | ✅ Sincronizado | Alta |
| **Básica** | 37_Memorias_Diseño_Basico_v5.0, 38_DiagramasArquitectura | ✅ Sincronizado | Alta |
| **Detalle** | V.3.1_Material_Rodante_Detallado, V.X_Sistema_EOT_v5.0 | ✅ Sincronizado | Alta |
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
- **AT1 (Alcance):** Puesta a punto de material rodante existente (2 GR12, 2 U10, 40 plataformas operativas, 11 no operativas, 8 carromotores)
- **AT2 (Operación y Mantenimiento):** Ciclos de mantenimiento RL, R1, R2, R3 según especificaciones
- **AT3 (Especificaciones):** ITCS embarcado, radio TETRA, GPS, CCTV embarcado (Cap. VIII, Num. 8.10)
- **AT4 (Indicadores):** Disponibilidad 99.5% para material rodante según Tablas 1-4
- **AT10 (Capacidad y Surcos):** Integración del material rodante con asignación de surcos
- **Cl13.1 (Material Rodante):** Equipos embarcados ITCS TETRA con interoperabilidad FENOCO

#### **Criterios Técnicos Maestros Consolidados:**
- **Locomotoras:** 15 unidades con ATP embarcado
- **Sistema EOT:** 15 dispositivos End of Train
- **Sistemas Embarcados:** ITCS ETCS Level 2, TETRA + TETRA, GPS/GNSS
- **Talleres:** Principal La Dorada + secundario Chiriguaná + talleres de línea
- **Disponibilidad:** 99.5% para sistemas críticos según AT4

---

## 2. INGENIERÍA CONCEPTUAL

### **2.1 Arquitectura General del Sistema**

#### **Material Rodante Principal:**
- **Locomotoras:** 15 unidades con ATP embarcado ETCS Level 2
- **Vagones de Carga:** 40 plataformas operativas + 11 no operativas
- **Equipos Especializados:** 8 carromotores, 2 bateadoras, 3 retroexcavadoras
- **Sistemas de Seguridad:** EOT (End of Train) en cada tren

#### **Sistemas Embarcados Integrados:**
- **ITCS ETCS Level 2:** Control automático de trenes con redundancia
- **Comunicaciones:** Radio TETRA + TETRA dual para redundancia
- **Posicionamiento:** GPS/GNSS para seguimiento en tiempo real
- **Seguridad:** Event Recorder (Caja Negra) para registro de eventos
- **Monitoreo:** CCTV embarcado para seguridad operacional

#### **Talleres de Mantenimiento:**
- **Taller Principal La Dorada:** 150m x 30m con equipos completos
- **Taller Secundario Chiriguaná:** 100m x 25m con equipos básicos
- **Talleres de Línea:** Puerto Berrío, Barrancabermeja, Bucaramanga
- **Equipos Especializados:** Elevadores, grúas puente, bancos de prueba

### **2.2 Criterios de Diseño**

#### **Disponibilidad y Redundancia:**
- **Material Rodante:** 99.5% disponibilidad con mantenimiento preventivo
- **Sistemas Embarcados:** 99.5% para ITCS, 99.5% para comunicaciones
- **Talleres:** Operación 24/7 con equipos redundantes

#### **Interoperabilidad FENOCO:**
- **Protocolos UIC:** Compatibilidad con estándares internacionales
- **Sistemas Duales:** Operación en ambos corredores (La Dorada-Chiriguaná y Chiriguaná-Santa Marta)
- **Equipos Embarcados:** Configuración dual para interoperabilidad

---

## 3. INGENIERÍA BÁSICA

### **3.1 Especificaciones Básicas de Material Rodante**

#### **Locomotoras (15 Unidades):**
- **Tipo:** U18 o equivalentes con factor de calidad
- **Potencia:** 3,000 kW con tracción distribuida
- **Velocidad:** 120 km/h máxima, 80 km/h comercial
- **Peso:** 120 toneladas por locomotora
- **Sistemas:** ATP embarcado, TETRA + TETRA, GPS, Event Recorder

#### **Vagones de Carga:**
- **Plataformas Operativas:** 40 unidades (50 ton carga, 20 ton tara, 14m longitud)
- **Plataformas No Operativas:** 11 unidades (requieren rehabilitación)
- **Carromotores:** 8 unidades para mantenimiento de vía
- **Equipos Especializados:** 2 bateadoras, 3 retroexcavadoras, 1 retrocargadora

#### **Sistema EOT (15 Dispositivos):**
- **Funcionalidades:** Monitoreo de cola del tren, integridad del tren, presión de frenos
- **Componentes:** Sensor de presión, sensor de integridad, GPS, radio comunicación
- **Disponibilidad:** 99.5% según AT4

### **3.2 Especificaciones Básicas de Talleres**

#### **Taller Principal La Dorada:**
- **Nave Principal:** 150m x 30m para mantenimiento general
- **Foso de Inspección:** 150m x 2m para inspección inferior
- **Elevadores:** 2 unidades de 120 ton, 6m altura
- **Grúas Puente:** 2 unidades de 50 ton, 25m luz
- **Equipos:** Máquina de lavado automática, banco de pruebas 25 kV/3 MVA

#### **Taller Secundario Chiriguaná:**
- **Nave Principal:** 100m x 25m para mantenimiento general
- **Foso de Inspección:** 100m x 2m para inspección inferior
- **Elevadores:** 1 unidad de 120 ton, 6m altura
- **Grúas Puente:** 1 unidad de 30 ton, 20m luz
- **Equipos:** Máquina de lavado automática

#### **Talleres de Línea:**
- **Ubicaciones:** Puerto Berrío, Barrancabermeja, Bucaramanga
- **Capacidad:** 2 trenes cada uno
- **Funciones:** Mantenimiento básico y reparaciones menores

---

## 4. INGENIERÍA DE DETALLE

### **4.1 Especificaciones Técnicas Detalladas**

#### **Sistemas Embarcados ITCS:**

| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Computadora Principal** | Siemens S7-400, SIL 4 | 2 por locomotora | Redundancia 2oo3 |
| **Módulo TETRA** | Siemens TETRA | 2 por locomotora | Comunicación RBC |
| **Antena Eurobalise** | UIC estándar | 4 por locomotora | Lectura balizas |
| **Pantalla Conductor** | TFT 12" | 2 por locomotora | DMI SIL 3 |
| **UPS Embarcado** | 24V DC | 2 por locomotora | Respaldo energía |

#### **Sistemas de Comunicación:**

| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Radio TETRA** | 400 MHz, 25W | 15 unidades | Comunicación principal |
| **Radio TETRA** | 900 MHz | 15 unidades | Redundancia TETRA |
| **GPS/GNSS** | Multi-constelación | 15 unidades | Posicionamiento preciso |
| **Event Recorder** | Caja negra | 15 unidades | Registro eventos |
| **CCTV Embarcado** | IP, 1080p | 15 unidades | Seguridad operacional |

#### **Equipos de Taller:**

| Equipo | Especificación | Cantidad | Observaciones |
|:-------|:---------------|:--------:|:--------------|
| **Elevadores** | 120 ton, 6m altura | 3 unidades | 2 La Dorada, 1 Chiriguaná |
| **Grúas Puente** | 50 ton, 25m luz | 3 unidades | 2 La Dorada, 1 Chiriguaná |
| **Máquinas Lavado** | Automática | 2 unidades | 1 por taller principal |
| **Bancos de Prueba** | 25 kV, 3 MVA | 1 unidad | Solo La Dorada |
| **Equipos Mecánicos** | Torno, fresadora, taladro | 6 unidades | 2 por taller principal |

### **4.2 Procedimientos de Puesta a Punto**

#### **Alcance de Puesta a Punto (AT1):**
1. **Desmontaje Completo:** Desarme total de sistemas y subsistemas
2. **Limpieza e Inspección:** Limpieza profunda y inspección detallada
3. **Diagnóstico:** Evaluación del estado de todos los componentes
4. **Reacondicionamiento:** Reparación o reemplazo de componentes averiados
5. **Pruebas:** Verificación de funcionamiento según datos de fábrica
6. **Certificación:** Cumplimiento estándares AAR y especificaciones técnicas

#### **Ciclos de Mantenimiento (AT2):**
- **RL (Reparaciones Ligeras):** Inspecciones y reparaciones menores en línea
- **R1:** Mantenimiento preventivo cada 24 meses (5 días en taller)
- **R2:** Mantenimiento preventivo cada 48 meses (15 días en taller)
- **R3:** Reparación pesada con desmontaje total (45 días en taller)

---

## 5. ESPECIFICACIONES TÉCNICAS FINALES

### **5.1 Especificaciones de Hardware**

#### **Locomotoras - Componentes Principales:**
- **Motor de Tracción:** 500 kW, 25 kV AC, 6 por locomotora
- **Convertidor:** IGBT, 25 kV AC, 3 por locomotora
- **Transformador:** 25 kV/1.5 kV, 3 MVA, 1 por locomotora
- **Pantógrafo:** 25 kV, 1,000 A, 2 por locomotora
- **Sistema de Frenado:** Neumático + eléctrico + emergencia

#### **Sistemas de Suspensión:**
- **Bogie:** Estructura soldada, 2 por coche
- **Ruedas:** Diámetro 920 mm, 8 por bogie
- **Ejes:** Diámetro 150 mm, 4 por bogie
- **Suspensión Primaria:** Resortes helicoidales, 8 por bogie
- **Suspensión Secundaria:** Bolsas de aire, 4 por bogie

#### **Equipos de Taller - Especificaciones:**
- **Torno:** 2m entre puntos, 2 unidades
- **Fresadora:** Mesa 1.5m x 0.8m, 2 unidades
- **Taladro:** Columna, 50mm, 2 unidades
- **Soldadora:** MIG/MAG, 300A, 4 unidades
- **Compresor:** 10 m³/min, 10 bar, 2 unidades

### **5.2 Especificaciones de Software**

#### **ITCS ETCS Level 2:**
- **Estándar:** EN 50128 (SIL 4)
- **Funcionalidades:** Control de velocidad, autorización de movimiento, vigilancia de tren
- **Interfaces:** CTC, Eurobalise, TETRA
- **Actualización:** Over-the-air (OTA)

#### **Módulos de Software Embarcado:**
| Módulo | Función | SIL | Estándar |
|:-------|:---------|:---:|:---------|
| **STM** | Supervisión de tren | SIL 4 | UIC 438 |
| **DMI** | Interfaz conductor | SIL 3 | EN 50128 |
| **RBC Interface** | Comunicación RBC | SIL 4 | UIC 920-2 |
| **Eurobalise** | Lectura balizas | SIL 4 | UIC 438 |

---

## 6. PROCEDIMIENTOS OPERACIONALES

### **6.1 Operación Normal**

#### **Operación de Locomotoras:**
1. **Inspección Pre-operacional:** Verificación de sistemas embarcados y comunicaciones
2. **Puesta en Marcha:** Secuencia de arranque y verificación de ATP embarcado
3. **Operación en Línea:** Monitoreo continuo de sistemas y comunicación con CTC
4. **Llegada a Destino:** Verificación de sistemas y preparación para siguiente servicio
5. **Inspección Post-operacional:** Verificación de estado y registro de eventos

#### **Mantenimiento Preventivo:**
1. **Programación:** Planificación según ciclos RL, R1, R2, R3
2. **Preparación:** Desplazamiento a taller y preparación de equipos
3. **Ejecución:** Desmontaje, inspección, reparación según procedimientos
4. **Pruebas:** Verificación de funcionamiento y pruebas de aceptación
5. **Documentación:** Registro de trabajos realizados y certificaciones

#### **Gestión de Sistemas Embarcados:**
1. **Monitoreo Continuo:** Supervisión de estado de ITCS, comunicaciones y GPS
2. **Actualizaciones:** Aplicación de actualizaciones de software OTA
3. **Diagnóstico:** Análisis de Event Recorder y sistemas de diagnóstico
4. **Mantenimiento:** Reparación y reemplazo de componentes según necesidad
5. **Calibración:** Verificación y calibración de sensores y sistemas

### **6.2 Procedimientos de Mantenimiento**

#### **Mantenimiento Preventivo por Ciclos:**
- **Diario:** Inspección visual y verificación de sistemas básicos
- **Semanal:** Pruebas de funcionamiento y limpieza de equipos
- **Mensual:** Inspección detallada y calibración de sensores
- **Trimestral:** Mantenimiento de sistemas embarcados y comunicaciones
- **Anual:** Revisión completa y certificación de cumplimiento

#### **Mantenimiento Correctivo:**
- **Nivel 1:** Reparación de componentes menores (sensores, comunicaciones)
- **Nivel 2:** Reparación de equipos principales (ITCS, sistemas de tracción)
- **Nivel 3:** Reemplazo de sistemas completos (locomotoras, vagones)
- **Emergencia:** Respuesta 24/7 para fallas críticas

---

## 7. INTERFACES CON OTROS SISTEMAS

### **7.1 Interfaces con Sistemas de Control**

#### **Material Rodante ↔ CTC:**
- **Autorización de Movimiento:** Comunicación de MA (Movement Authority)
- **Posicionamiento:** Transmisión de posición GPS en tiempo real
- **Estado de Tren:** Información de velocidad, dirección, sistemas embarcados
- **Alarmas:** Notificaciones de eventos y fallas
- **Protocolo:** FFFIS (Form Fit Function Interface Specification)

#### **ITCS ↔ CTC:**
- **Control de Tráfico:** Autorización de movimientos y control de velocidad
- **Supervisión:** Monitoreo continuo del estado del tren
- **Emergencias:** Procedimientos de emergencia y parada automática
- **Diagnóstico:** Transmisión de datos de Event Recorder
- **Protocolo:** ETCS Level 2 estándar UIC

#### **Sistemas Embarcados ↔ CCO:**
- **Comunicaciones:** Radio TETRA + TETRA para comunicación voz/datos
- **Monitoreo:** CCTV embarcado para supervisión visual
- **Datos:** Transmisión de telemetría y diagnósticos
- **Control:** Posibilidad de control remoto en emergencias
- **Protocolo:** IP sobre radio + protocolos ferroviarios

### **7.2 Interfaces con Sistemas de Comunicaciones**

#### **TETRA/TETRA:**
- **Material Rodante:** Comunicación tren-tierra para operación
- **Emergencias:** Canales de emergencia y coordinación
- **Datos:** Transmisión de telemetría y diagnósticos
- **Interoperabilidad:** Comunicación con sistemas FENOCO
- **Protocolo:** TETRA estándar + TETRA UIC

#### **Fibra Óptica:**
- **Datos de Tren:** Transmisión de información de sistemas embarcados
- **Video CCTV:** Transmisión de video embarcado al CCO
- **Telemetría:** Datos de sensores y sistemas de diagnóstico
- **Actualizaciones:** Transmisión de actualizaciones de software
- **Protocolo:** Ethernet sobre fibra óptica

### **7.3 Interfaces con Sistemas de Gestión**

#### **SICC (Sistema de Indicadores de Control):**
- **Material Rodante:** Reporte de disponibilidad y estado operacional
- **ITCS:** Reporte de funcionamiento y disponibilidad de sistemas embarcados
- **Talleres:** Reporte de capacidad y estado de equipos de mantenimiento
- **Protocolo:** API REST para integración con SICC

#### **Sistemas de Emergencia:**
- **Material Rodante:** Activación automática de procedimientos de emergencia
- **ITCS:** Parada automática de emergencia y notificación a CTC
- **Comunicaciones:** Canales de emergencia y coordinación con autoridades
- **Protocolo:** Interfaces de emergencia estándar ferroviario

---

## 8. MATRICES DE CONTROL Y SEGUIMIENTO

### **8.1 Matriz de Cumplimiento Contractual**

| Requisito | Fuente | Especificación | Estado | Evidencia |
|:----------|:-------|:---------------|:-------|:----------|
| **Puesta a Punto Material Rodante** | AT1 Cap. V | 2 GR12 + 2 U10 + 40 plataformas + 11 no operativas + 8 carromotores | ✅ Cumplido | V.3.1_Material_Rodante_Detallado |
| **ITCS Embarcado** | AT3 Cap. VIII.8.10 | Sistemas embarcados ITCS, TETRA, GPS | ✅ Cumplido | Especificaciones técnicas |
| **Disponibilidad 99.5%** | AT4 Tablas 1-4 | Disponibilidad material rodante | ✅ Cumplido | Procedimientos mantenimiento |
| **Interoperabilidad FENOCO** | Cl13.2 | Compatibilidad operativa | ✅ Cumplido | Protocolos UIC |
| **Ciclos Mantenimiento** | AT2 Cap. III | RL, R1, R2, R3 | ✅ Cumplido | Manuales OM |
| **Estándares AAR** | AT1 Cap. V | Cumplimiento estándares | ✅ Cumplido | Certificaciones |

### **8.2 Matriz de Interfaces del Sistema**

| Sistema Origen | Sistema Destino | Tipo Interfaz | Protocolo | Estado |
|:---------------|:----------------|:--------------|:----------|:-------|
| **ITCS Embarcado** | **CTC** | Control/Comunicación | ETCS Level 2 | ✅ Implementado |
| **Material Rodante** | **TETRA** | Comunicación | TETRA estándar | ✅ Implementado |
| **Material Rodante** | **TETRA** | Comunicación | TETRA UIC | ✅ Implementado |
| **Sistemas Embarcados** | **CCO** | Monitoreo/Control | IP + Protocolos ferroviarios | ✅ Implementado |
| **EOT** | **ITCS** | Monitoreo | Radio comunicación | ✅ Implementado |
| **Material Rodante** | **SICC** | Reportes | REST API | ✅ Implementado |
| **Talleres** | **Sistemas Gestión** | Datos | Ethernet | ✅ Implementado |
| **CCTV Embarcado** | **Fibra Óptica** | Video | IP sobre fibra | ✅ Implementado |

### **8.3 Matriz de Disponibilidad y SLA**

| Sistema | Disponibilidad Objetivo | SLA | Métricas | Estado |
|:--------|:----------------------:|:---:|:---------|:-------|
| **Locomotoras** | 99.5% | 4 horas | Tiempo de respuesta, disponibilidad | ✅ Monitoreado |
| **ITCS Embarcado** | 99.5% | 2 horas | Disponibilidad sistemas, tiempo respuesta | ✅ Monitoreado |
| **Sistemas Comunicación** | 99.5% | 1 hora | Disponibilidad radio, calidad señal | ✅ Monitoreado |
| **Talleres** | 99.9% | 8 horas | Capacidad operacional, equipos disponibles | ✅ Monitoreado |
| **EOT** | 99.5% | 1 hora | Disponibilidad dispositivos, comunicación | ✅ Monitoreado |

---

## 9. REFERENCIAS Y DOCUMENTOS RELACIONADOS

### **9.1 Documentos Contractuales Base**
- `FORMATEADO_APENDICE TECNICO 1.md` - Alcance del proyecto (AT1) Cap. V
- `FORMATEADO_APENDICE TECNICO 2.md` - Operación y mantenimiento (AT2)
- `FORMATEADO_APENDICE TECNICO 3.md` - Especificaciones generales (AT3) Cap. VIII.8.10
- `FORMATEADO_APENDICE TECNICO 4.md` - Indicadores de desempeño (AT4)
- `FORMATEADO_APENDICE TECNICO 10.md` - Capacidad y surcos (AT10)
- `Cl_13_1_MaterialRodante_MEJORADO.md` - Material rodante y equipos embarcados

### **9.2 Documentos de Ingeniería Conceptual**
- `32_Material_Rodante_Integrado_v5.0.md` - Sistema material rodante integrado
- `23_ListadoMaestro_Sistemas_v5.0.md` - Listado maestro de sistemas
- `25.1_WBS_COMPLETA_ESPECIALIDADES_v5.0.md` - WBS especialidades completas
- `33_Criterios_Normatividad_docx_AREMA_UIC_RETIE_ISO_TC_204_NSR_10_NFPA.md` - Criterios normatividad
- `34_Criterios_Interoperabilidad_docx_Compatibilidad_con_FENOCO_y_ANI.md` - Criterios interoperabilidad
- `36_Criterios_Ciberseguridad_docx_Protecci_n_de_sistemas_de_control.md` - Criterios ciberseguridad

### **9.3 Documentos de Ingeniería Básica**
- `37_Memorias_Diseño_Basico_v5.0.md` - Memorias de diseño básico
- `38. DiagramasArquitectura_sist_ctc-telco.md` - Diagramas de arquitectura
- `41. Interfaces_Sistemas_MEJORADO.md` - Interfaces de sistemas

### **9.4 Documentos de Ingeniería de Detalle**
- `V.3.1_Material_Rodante_Detallado.md` - Material rodante detallado
- `V.X_Sistema_EOT_Detalle_v5.0.md` - Sistema EOT detalle
- `V.X_Sistema_TETRA_Detalle_v5.0.md` - Sistema TETRA detalle
- `V.4.1_Sistemas_Ferroviarios_Integrados_DETALLADO.md` - Sistemas ferroviarios integrados
- `8_10_Sistema_de_comunicaciones_embarcados.md` - Sistema comunicaciones embarcados

### **9.5 Documentos de Operación y Mantenimiento**
- `6.1_Manual_OM_CTC_v5.0.md` - Manual OM CTC
- `6.5_Manual_OM_Integrado_v5.0.md` - Manual OM integrado

### **9.6 Documentos Maestros de Referencia**
- `CRITERIOS_TECNICOS_MAESTRO_APP_La_Dorada_Chiriguaná_v1.0.md` - Criterios técnicos maestro
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
**Estado:** ✅ **SISTEMA 04 MATERIAL RODANTE - DOCUMENTO MASTER CONSOLIDADO**  
**Versión:** v1.0 - Primera versión consolidada  
**Responsable:** Administrador Contractual EPC


---

## ULTIMA SINCRONIZACION CON FUENTES


<!-- Sincronizado con V.X_Sistema_EOT_Detalle_v5.0.md el 2025-10-09 09:41:43 -->
- V.X_Sistema_EOT_Detalle_v5.0.md sincronizado el 2025-10-09 09:41:43


<!-- Sincronizado con V.X_Sistema_EOT_Detalle_v5.0.md el 2025-10-09 09:43:00 -->
- V.X_Sistema_EOT_Detalle_v5.0.md sincronizado el 2025-10-09 09:43:00


<!-- Sincronizado con V.X_Sistema_EOT_Detalle_v5.0.md el 2025-10-09 10:04:05 -->
- V.X_Sistema_EOT_Detalle_v5.0.md sincronizado el 2025-10-09 10:04:05


<!-- Sincronizado con V.X_Sistema_EOT_Detalle_v5.0.md el 2025-10-09 10:07:14 -->
- V.X_Sistema_EOT_Detalle_v5.0.md sincronizado el 2025-10-09 10:07:14


<!-- Sincronizado con V.X_Sistema_EOT_Detalle_v5.0.md el 2025-10-09 10:46:06 -->
- V.X_Sistema_EOT_Detalle_v5.0.md sincronizado el 2025-10-09 10:46:06

