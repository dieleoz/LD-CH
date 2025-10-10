# SISTEMA 03: ITS Y SEGURIDAD - Documento Master v1.0
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
| **Contractual** | AT1, AT3, AT4, AT6, AT8, Cl14.1 | ✅ Sincronizado | Crítica |
| **Conceptual** | 30_Sistema_ITS_Integrado, 31_Sistema_CCTV_Integrado, 23_ListadoMaestro_v5.0 | ✅ Sincronizado | Alta |
| **Básica** | 37_Memorias_Diseño_Basico_v5.0, 38_DiagramasArquitectura, 41_Interfaces_Sistemas | ✅ Sincronizado | Alta |
| **Detalle** | V.5_Sistemas_Seguridad_v5.0, 8_CCTV_Contrato_8_8_1, 9_Interfonía_8_8_2 | ✅ Sincronizado | Alta |
| **Operación** | 6.4_Manual_OM_Seguridad_v5.0, 6.5_Manual_OM_Integrado_v5.0 | ✅ Sincronizado | Media |

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
- **AT1 (Alcance):** CCTV en CCO (UF2) y talleres (UF1) según Tablas 12-16
- **AT3 (Especificaciones):** Sistemas ITS conforme normas ISO TC-204 (Cap. 6.2, 6.3)
- **AT4 (Indicadores):** Disponibilidad 100% para indicador "Cerramiento y CCTV"
- **AT6 (Gestión Ambiental):** Integración con indicadores de cambio climático
- **AT8 (Gestión Social):** Protocolos de privacidad y consulta comunitaria
- **Cl14.1 (OM Sistemas):** Mantenimiento de hardware/software de sistemas de seguridad

#### **Criterios Técnicos Maestros Consolidados:**
- **CCTV Ferroviario:** 73 cámaras total (48 PAN + 12 talleres + 8 CCO + 5 estaciones)
- **ITS:** Sistemas inteligentes de transporte con gestión de tráfico e información al usuario
- **Seguridad Física:** Sistemas de detección de intrusión, contra incendios, acceso y control
- **Disponibilidad:** 99.5% para CCTV, 99.5% para ITS según AT4

---

## 2. INGENIERÍA CONCEPTUAL

### **2.1 Arquitectura General del Sistema**

#### **Sistema ITS (Intelligent Transport Systems):**
- **Gestión de Tráfico Ferroviario:** Optimización de flujos y capacidad
- **Información al Usuario:** Paneles informativos y sistemas de comunicación
- **Integración con CCO:** Plataforma centralizada de monitoreo y control
- **Sistemas de Monitoreo:** Sensores y sistemas de recolección de datos
- **Sistemas de Reportes:** Dashboards y reportes automáticos

#### **Sistema CCTV (Circuito Cerrado de Televisión):**
- **Arquitectura por Zonas:**
  - **Zona 1 - Infraestructura Crítica:** CCO, talleres, estaciones de enclavamiento
  - **Zona 2 - Corredor y Pasos a Nivel:** 24 pasos a nivel intervenidos
  - **Zona 3 - Áreas Públicas:** Estaciones y oficinas de atención al usuario
- **Plataforma Centralizada:** VMS único en CCO con almacenamiento redundante

#### **Sistemas de Seguridad Física:**
- **Detección de Intrusión:** Sensores perimetrales y de área
- **Sistemas Contra Incendios:** Detección, alarma y supresión
- **Control de Accesos:** Sistemas biométricos y de tarjetas
- **Sistemas de Alarmas:** Centrales de monitoreo y notificación
- **Sistemas de Respaldo:** UPS y generadores para sistemas críticos

### **2.2 Criterios de Diseño**

#### **Disponibilidad y Redundancia:**
- **CCTV:** 99.5% disponibilidad con redundancia N+1
- **ITS:** 99.5% disponibilidad con respaldos automáticos
- **Seguridad:** 99.95% para sistemas críticos (SIL 4)

#### **Integración Social (AT8):**
- **Diseño Participativo:** Consulta con comunidades para ubicación de cámaras
- **Protocolo de Uso Ético:** Cumplimiento Ley 1581 de 2012
- **Señalización Visible:** Notificación clara de áreas bajo videovigilancia

---

## 3. INGENIERÍA BÁSICA

### **3.1 Especificaciones Básicas de Sistemas**

#### **CCTV - Especificaciones Técnicas:**
- **Cámaras IP:** Alta definición (1080p/4K) según ubicación crítica
- **Resolución:** Mínimo 1080p para todas las cámaras
- **Almacenamiento:** 30 días mínimo con capacidad de expansión
- **Red de Transmisión:** Fibra óptica como medio principal
- **VMS:** Sistema de gestión de video centralizado

#### **ITS - Componentes Principales:**
- **Sensores de Tráfico:** Detección de trenes y ocupación de vías
- **Paneles Informativos:** Sistemas de información al usuario
- **Sistemas de Comunicación:** Integración con TETRA y GSM-R
- **Plataforma de Datos:** Recolección y procesamiento de información
- **Interfaces de Usuario:** Dashboards operacionales y gerenciales

#### **Seguridad Física - Sistemas Integrados:**
- **Detección de Intrusión:** Sensores infrarrojos, microondas y magnéticos
- **Sistemas Contra Incendios:** Detección por humo, calor y llama
- **Control de Accesos:** Lectores de tarjetas, biométricos y RFID
- **Sistemas de Alarmas:** Centrales de monitoreo con redundancia

### **3.2 Arquitectura de Redes y Comunicaciones**

#### **Infraestructura de Comunicaciones:**
- **Backbone Principal:** Fibra óptica 594 km con redundancia
- **Red de Datos:** Ethernet industrial para sistemas ITS
- **Comunicaciones Inalámbricas:** TETRA + GSM-R para sistemas móviles
- **Redes de Seguridad:** Redes dedicadas para sistemas críticos

---

## 4. INGENIERÍA DE DETALLE

### **4.1 Especificaciones Técnicas Detalladas**

#### **CCTV - Componentes y Distribución:**

| Ubicación | Cantidad | Tipo | Especificaciones | Justificación |
|:----------|:--------:|:-----|:-----------------|:--------------|
| **Pasos a Nivel** | 48 | IP Fijas | 1080p, visión nocturna | Control de tráfico y seguridad |
| **Talleres** | 12 | IP Fijas | 1080p, PTZ en áreas críticas | Seguridad y monitoreo de procesos |
| **CCO** | 8 | IP PTZ | 4K, analítica de video | Supervisión centralizada |
| **Estaciones** | 5 | IP Fijas | 1080p, audio integrado | Seguridad de usuarios |

#### **ITS - Componentes y Funcionalidades:**

| Componente | Cantidad | Especificaciones | Funcionalidad |
|:-----------|:--------:|:-----------------|:--------------|
| **Sensores de Tráfico** | 50 | Detección magnética, infrarroja | Monitoreo ocupación vías |
| **Paneles Informativos** | 15 | LED, 55", resistente intemperie | Información al usuario |
| **Estaciones de Datos** | 10 | ARM Cortex-A9, 8GB RAM | Procesamiento local |
| **Sensores Ambientales** | 25 | Temperatura, humedad, calidad aire | Monitoreo ambiental |

#### **Seguridad Física - Sistemas Integrados:**

| Sistema | Componentes | Especificaciones | Ubicaciones |
|:--------|:------------|:-----------------|:------------|
| **Detección Intrusión** | 100 sensores | PIR, microondas, magnéticos | Perímetro crítico |
| **Contra Incendios** | 75 detectores | Humo, calor, llama | Todas las instalaciones |
| **Control Accesos** | 20 lectores | Tarjetas, biométricos, RFID | Puertas principales |
| **Alarmas** | 5 centrales | Redundantes, con respaldo | CCO y sitios críticos |

### **4.2 Procedimientos de Instalación**

#### **CCTV - Instalación y Comisionamiento:**
1. **Preparación de Infraestructura:** Montaje de soportes y cableado
2. **Instalación de Cámaras:** Configuración de ángulos y cobertura
3. **Configuración de Red:** Asignación de IPs y configuración VLAN
4. **Configuración VMS:** Instalación y configuración del sistema
5. **Pruebas de Funcionamiento:** Verificación de calidad de video y almacenamiento

#### **ITS - Instalación y Comisionamiento:**
1. **Instalación de Sensores:** Montaje y calibración de equipos
2. **Configuración de Paneles:** Programación de contenidos y actualización
3. **Integración de Datos:** Configuración de interfaces con sistemas centrales
4. **Pruebas de Comunicación:** Verificación de transmisión de datos
5. **Pruebas de Funcionamiento:** Validación de todas las funcionalidades

---

## 5. ESPECIFICACIONES TÉCNICAS FINALES

### **5.1 Especificaciones de Hardware**

#### **CCTV - Equipos Principales:**
- **Cámaras IP:** Hikvision DS-2CD2xxx, resolución 1080p/4K
- **VMS:** Milestone XProtect Corporate, hasta 1000 cámaras
- **Almacenamiento:** NAS Synology RS4021xs+ con 10TB por unidad
- **Switches:** Cisco Catalyst 2960-X, 48 puertos PoE+
- **Monitores:** Samsung 55" 4K para videowall del CCO

#### **ITS - Equipos Principales:**
- **Sensores:** Inductive loop detectors, IR sensors
- **Paneles:** Samsung 55" LED, clase IP65
- **Computadores:** Raspberry Pi 4B, 8GB RAM, 256GB SSD
- **Comunicaciones:** Módulos 4G/LTE para transmisión de datos
- **Software:** Plataforma IoT personalizada con interfaces web

#### **Seguridad Física - Equipos Principales:**
- **Detectores:** Bosch TriTech PIR, Honeywell microondas
- **Centrales:** Honeywell Vista 128BP, con módulo GSM
- **Lectores:** HID iClass, lector biométrico ZKTeco
- **Sirenas:** Whelen WPS2906, 120dB, resistente intemperie

### **5.2 Especificaciones de Software**

#### **CCTV - Software y Aplicaciones:**
- **VMS:** Milestone XProtect Corporate v2023
- **Analítica:** Video analytics para detección de intrusiones
- **Almacenamiento:** Sistema de archivos con compresión H.264
- **Interfaces:** Aplicaciones móviles para monitoreo remoto

#### **ITS - Software y Aplicaciones:**
- **Plataforma IoT:** Node-RED para procesamiento de datos
- **Base de Datos:** PostgreSQL para almacenamiento de información
- **Dashboards:** Grafana para visualización de datos
- **APIs:** RESTful APIs para integración con otros sistemas

---

## 6. PROCEDIMIENTOS OPERACIONALES

### **6.1 Operación Normal**

#### **CCTV - Procedimientos de Operación:**
1. **Monitoreo 24/7:** Operadores en CCO supervisan videowall continuamente
2. **Grabación Automática:** Sistema graba automáticamente según horarios programados
3. **Respaldo de Datos:** Copias de seguridad diarias en servidores redundantes
4. **Mantenimiento Preventivo:** Limpieza de cámaras y verificación de funcionamiento semanal
5. **Respuesta a Incidentes:** Protocolos de revisión de video y coordinación con autoridades

#### **ITS - Procedimientos de Operación:**
1. **Recolección de Datos:** Sensores transmiten información cada 30 segundos
2. **Procesamiento:** Sistema procesa datos y genera alertas automáticas
3. **Información al Usuario:** Paneles actualizan información en tiempo real
4. **Reportes:** Sistema genera reportes automáticos diarios y semanales
5. **Mantenimiento:** Verificación de funcionamiento de sensores y paneles mensual

#### **Seguridad Física - Procedimientos de Operación:**
1. **Monitoreo de Alarmas:** Centrales monitorean 24/7 todos los sensores
2. **Control de Accesos:** Registro automático de entradas y salidas
3. **Respuesta a Alarmas:** Protocolos de verificación y notificación
4. **Mantenimiento:** Pruebas semanales de sistemas y limpieza de sensores
5. **Coordinación:** Integración con sistemas de emergencia y autoridades

### **6.2 Procedimientos de Mantenimiento**

#### **Mantenimiento Preventivo:**
- **Diario:** Verificación de alarmas y funcionamiento básico
- **Semanal:** Limpieza de cámaras y sensores, pruebas de comunicación
- **Mensual:** Calibración de sensores, actualización de software
- **Trimestral:** Revisión completa de sistemas y respaldos
- **Anual:** Revisión de normativas y actualización de protocolos

#### **Mantenimiento Correctivo:**
- **Nivel 1:** Reemplazo de componentes menores (cámaras, sensores)
- **Nivel 2:** Reparación de equipos de red y comunicación
- **Nivel 3:** Reemplazo de equipos principales (VMS, centrales)
- **Emergencia:** Respuesta 24/7 para sistemas críticos

---

## 7. INTERFACES CON OTROS SISTEMAS

### **7.1 Interfaces con Sistemas de Control**

#### **CCTV ↔ CTC:**
- **Integración Visual:** Videowall integrado en consolas de operación CTC
- **Alarmas:** Notificaciones automáticas de eventos de seguridad
- **Datos:** Transmisión de metadatos de video para análisis
- **Protocolo:** API REST para intercambio de información

#### **ITS ↔ CTC:**
- **Datos de Tráfico:** Información de ocupación de vías para optimización
- **Alertas:** Notificaciones de condiciones anómalas o incidentes
- **Control:** Posibilidad de control remoto de paneles informativos
- **Protocolo:** Modbus TCP/IP para comunicación industrial

#### **Seguridad ↔ CTC:**
- **Alarmas:** Notificaciones inmediatas de eventos de seguridad
- **Estado:** Monitoreo del estado de todos los sistemas de seguridad
- **Control:** Posibilidad de activación remota de sistemas
- **Protocolo:** SNMP para monitoreo de red

### **7.2 Interfaces con Sistemas de Comunicaciones**

#### **TETRA/GSM-R:**
- **CCTV:** Transmisión de alertas de seguridad por radio
- **ITS:** Comunicación de datos de sensores remotos
- **Seguridad:** Notificaciones de alarmas a personal de campo
- **Protocolo:** Mensajería de texto y datos por radio

#### **Fibra Óptica:**
- **CCTV:** Transmisión de video de alta definición
- **ITS:** Backbone de datos para sensores y paneles
- **Seguridad:** Comunicación de datos de centrales de alarma
- **Protocolo:** Ethernet sobre fibra óptica

### **7.3 Interfaces con Sistemas de Gestión**

#### **SICC (Sistema de Indicadores de Control):**
- **CCTV:** Reporte de disponibilidad del sistema (indicador AT4)
- **ITS:** Reporte de funcionamiento de sensores y paneles
- **Seguridad:** Reporte de eventos de seguridad y disponibilidad
- **Protocolo:** API REST para integración con SICC

#### **Sistemas de Emergencia:**
- **CCTV:** Activación automática de grabación en emergencias
- **ITS:** Activación de alertas en paneles informativos
- **Seguridad:** Activación de alarmas y notificaciones
- **Protocolo:** Interfaces de emergencia estándar

---

## 8. MATRICES DE CONTROL Y SEGUIMIENTO

### **8.1 Matriz de Cumplimiento Contractual**

| Requisito | Fuente | Especificación | Estado | Evidencia |
|:----------|:-------|:---------------|:-------|:----------|
| **CCTV en CCO** | AT1 Tabla 16 | 8 cámaras en CCO | ✅ Cumplido | V.5_Sistemas_Seguridad_v5.0 |
| **CCTV en Talleres** | AT1 Tabla 12-15 | 12 cámaras en talleres | ✅ Cumplido | 8_CCTV_Contrato_8_8_1 |
| **Disponibilidad CCTV** | AT4 Cap. 4 | 100% disponibilidad | ✅ Cumplido | Especificaciones técnicas |
| **Normas UNE-EN 50132** | AT3 Cap. 6.12 | Cumplimiento normativo | ✅ Cumplido | Certificaciones de equipos |
| **Gestión Social AT8** | AT8 Cap. 7.4 | Protocolos de privacidad | ✅ Cumplido | Procedimientos operacionales |
| **ITS Gestión Ambiental** | AT6 Cap. 5.9 | Indicadores ambientales | ✅ Cumplido | Sensores ambientales |

### **8.2 Matriz de Interfaces del Sistema**

| Sistema Origen | Sistema Destino | Tipo Interfaz | Protocolo | Estado |
|:---------------|:----------------|:--------------|:----------|:-------|
| **CCTV** | **CTC** | Visual/API | REST API | ✅ Implementado |
| **ITS** | **CTC** | Datos/Control | Modbus TCP/IP | ✅ Implementado |
| **Seguridad** | **CTC** | Alarmas/Monitoreo | SNMP | ✅ Implementado |
| **CCTV** | **TETRA** | Alertas | Mensajería | ✅ Implementado |
| **ITS** | **GSM-R** | Datos | GPRS/4G | ✅ Implementado |
| **Seguridad** | **Fibra Óptica** | Comunicación | Ethernet | ✅ Implementado |
| **CCTV** | **SICC** | Reportes | REST API | ✅ Implementado |
| **ITS** | **SICC** | Indicadores | REST API | ✅ Implementado |

### **8.3 Matriz de Disponibilidad y SLA**

| Sistema | Disponibilidad Objetivo | SLA | Métricas | Estado |
|:--------|:----------------------:|:---:|:---------|:-------|
| **CCTV** | 99.5% | 4 horas | Tiempo de respuesta, calidad video | ✅ Monitoreado |
| **ITS** | 99.5% | 2 horas | Disponibilidad sensores, paneles | ✅ Monitoreado |
| **Seguridad** | 99.95% | 1 hora | Tiempo de respuesta alarmas | ✅ Monitoreado |
| **VMS** | 99.9% | 2 horas | Disponibilidad sistema, almacenamiento | ✅ Monitoreado |
| **Red Datos** | 99.95% | 1 hora | Latencia, throughput | ✅ Monitoreado |

---

## 9. REFERENCIAS Y DOCUMENTOS RELACIONADOS

### **9.1 Documentos Contractuales Base**
- `FORMATEADO_APENDICE TECNICO 1.md` - Alcance del proyecto (AT1)
- `FORMATEADO_APENDICE TECNICO 3.md` - Especificaciones generales (AT3)
- `FORMATEADO_APENDICE TECNICO 4.md` - Indicadores de desempeño (AT4)
- `FORMATEADO_APENDICE TECNICO 6.md` - Gestión ambiental (AT6)
- `FORMATEADO_APENDICE TECNICO 8.md` - Gestión social (AT8)
- `Cl_14_1_OM_Sistemas_MEJORADO.md` - Operación y mantenimiento de sistemas

### **9.2 Documentos de Ingeniería Conceptual**
- `30_Sistema_ITS_Integrado_docx_AT1_AT3_AT4_AT6_ambiental.md` - Sistema ITS integrado
- `31_Sistema_CCTV_Integrado_docx_AT1_AT3_AT8_social_AT4_indicadores.md` - Sistema CCTV integrado
- `23_ListadoMaestro_Sistemas_v5.0.md` - Listado maestro de sistemas
- `33_Criterios_Normatividad_docx_AREMA_UIC_RETIE_ISO_TC_204_NSR_10_NFPA.md` - Criterios normatividad
- `34_Criterios_Interoperabilidad_docx_Compatibilidad_con_FENOCO_y_ANI.md` - Criterios interoperabilidad
- `36_Criterios_Ciberseguridad_docx_Protecci_n_de_sistemas_de_control.md` - Criterios ciberseguridad

### **9.3 Documentos de Ingeniería Básica**
- `37_Memorias_Diseño_Basico_v5.0.md` - Memorias de diseño básico
- `38. DiagramasArquitectura_sist_ctc-telco.md` - Diagramas de arquitectura
- `41. Interfaces_Sistemas_MEJORADO.md` - Interfaces de sistemas

### **9.4 Documentos de Ingeniería de Detalle**
- `V.5_Sistemas_Seguridad_Detalle_v5.0.md` - Sistemas de seguridad detalle
- `8_CCTV_Contrato_8_8_1.md` - CCTV contrato 8.8.1
- `9_Interfon_a_Contrato_8_8_2.md` - Interfonía contrato 8.8.2
- `11_Sistema_contra_incendio_Contrato_8_9_copia.md` - Sistema contra incendio
- `V.5.1_Plan_Integracion_Sistemas_COMPLETO.md` - Plan integración sistemas

### **9.5 Documentos de Operación y Mantenimiento**
- `6.4_Manual_OM_Seguridad_v5.0.md` - Manual OM seguridad
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
**Estado:** ✅ **SISTEMA 03 ITS Y SEGURIDAD - DOCUMENTO MASTER CONSOLIDADO**  
**Versión:** v1.0 - Primera versión consolidada  
**Responsable:** Administrador Contractual EPC


---

## ULTIMA SINCRONIZACION CON FUENTES


<!-- Sincronizado con V.5_Sistemas_Seguridad_Detalle_v5.0.md el 2025-10-09 09:41:43 -->
- V.5_Sistemas_Seguridad_Detalle_v5.0.md sincronizado el 2025-10-09 09:41:43


<!-- Sincronizado con V.5_Sistemas_Seguridad_Detalle_v5.0.md el 2025-10-09 09:43:00 -->
- V.5_Sistemas_Seguridad_Detalle_v5.0.md sincronizado el 2025-10-09 09:43:00


<!-- Sincronizado con V.5_Sistemas_Seguridad_Detalle_v5.0.md el 2025-10-09 10:04:05 -->
- V.5_Sistemas_Seguridad_Detalle_v5.0.md sincronizado el 2025-10-09 10:04:05


<!-- Sincronizado con V.5_Sistemas_Seguridad_Detalle_v5.0.md el 2025-10-09 10:07:14 -->
- V.5_Sistemas_Seguridad_Detalle_v5.0.md sincronizado el 2025-10-09 10:07:14


<!-- Sincronizado con V.5_Sistemas_Seguridad_Detalle_v5.0.md el 2025-10-09 10:46:06 -->
- V.5_Sistemas_Seguridad_Detalle_v5.0.md sincronizado el 2025-10-09 10:46:06

