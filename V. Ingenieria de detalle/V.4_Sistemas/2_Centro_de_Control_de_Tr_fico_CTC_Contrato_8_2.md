﻿﻿# CENTRO DE CONTROL DE TRÁFICO CTC - CONTRATO 8.2
## APP La Dorada - Chiriguaná

---

### INFORMACION DEL DOCUMENTO
- Fecha de actualización: 27 de enero de 2025
- Proyecto: APP La Dorada - Chiriguaná
- Contrato: Concesión No. 001 de 2025
- Responsable: Administrador Contractual EPC
- Tipo: Documento de Ingeniería de Detalle
- Categoria: Centro de Control de Tráfico (CTC)
- Numero: 8.2

## CONTROL DE VERSIONES

| Versión | Fecha | Responsable | Descripción |
|:---:|:---:|:---|:---|
| **v1.0** | Sep-2025 | Ing. Contractual | Versión inicial con contenido técnico básico. |
| **v2.0** | Sep-2025 | Ing. Contractual | Revisión técnica y ampliación de alcance. |
| **v3.0** | Ene-2025 | Ing. Contractual | Formato mejorado y estructura optimizada. |
| **v4.1** | Ene-2025 | Ing. de Sistemas | **Regenerado a estándar de Ingeniería de Detalle.** |

---

## 1. OBJETIVO Y ALCANCE

### 1.1 Objetivo
Este documento define las especificaciones técnicas de detalle para el diseño, construcción, equipamiento y puesta en marcha del **Centro de Control de Operaciones (CCO)** y el **Sistema de Control de Tráfico Centralizado (CTC)** del proyecto.

### 1.2 Alcance
El alcance de este documento cubre los siguientes componentes:
- **Infraestructura Civil y Eléctrica:** Diseño del edificio del CCO, salas técnicas, sistemas de energía y climatización.
- **Hardware:** Especificaciones de servidores, estaciones de trabajo, videowall y equipamiento de red.
- **Software:** Módulos funcionales del sistema CTC, SCADA y sistemas de gestión.
- **Interfaces:** Especificación detallada de las interfaces con otros sistemas ferroviarios.

---

## 2. ESPECIFICACIONES TÉCNICAS DE DISEÑO

**Basado en:** `26. Sistem_CTC_Int...md` y `37. MemoriasDiseño_Basico_v5.0_Validado_Riesgos.md`.

### 2.1 Infraestructura Civil y Eléctrica del CCO
- **Ubicación:** UF2 - La Dorada (Tabla 16, AT1).
- **Diseño Sismorresistente:** Cumplimiento de la norma NSR-10 para edificaciones críticas.
- **Sistema de Energía:**
    - Doble acometida eléctrica de media tensión.
    - Sistema UPS en configuración N+1 con autonomía mínima de 4 horas para cargas críticas (servidores, consolas).
    - Generador diésel de respaldo con transferencia automática (ATS).
- **Climatización (HVAC):** Sistema de precisión redundante (N+1) para el Data Center y la Sala de Control, garantizando temperatura (21°C ± 2°C) y humedad (45% ± 5%) constantes.
- **Sistema Contra Incendios:** Detección temprana (VESDA) y extinción con agente limpio (Novec 1230 o similar) en Data Center y salas técnicas, conforme a NFPA 75 y 2001.

### 2.2 Especificaciones de Hardware

| Componente | Especificación Mínima | Cantidad |
|:---|:---|:---:|
| **Servidores CTC** | Configuración clúster Activo/Pasivo, CPU Xeon (o equiv.), 128 GB RAM, SSD RAID-10. | 2 |
| **Servidor B.D.** | Servidor de alta disponibilidad, 256 GB RAM, almacenamiento SAN. | 2 |
| **Estaciones de Operador** | CPU Core i7 (o equiv.), 32 GB RAM, GPU profesional para 4 monitores 4K. | 5 |
| **Videowall** | Módulos LED de 2.5mm pitch o cubos de retroproyección, 10m x 2.5m. | 1 |
| **Controlador Videowall** | Procesador de video dedicado, redundante, capaz de gestionar múltiples fuentes. | 1 |
| **Switches Core de Red** | Switches de Data Center, 10/40 Gbps, modulares, con fuentes redundantes. | 2 |

### 2.3 Especificaciones de Software
- **Plataforma SCADA:** Sistema de supervisión y control con arquitectura cliente-servidor, redundante.
- **Módulos Funcionales del CTC:**
    - **Gestión de Tráfico:** Creación y modificación de rutas, gestión de itinerarios.
    - **Sinóptico Interactivo:** Representación gráfica de toda la red ferroviaria en tiempo real.
    - **Sistema de Enclavamiento Lógico:** Verificación de seguridad de todas las órdenes.
    - **Gestión de Alarmas:** Priorización, registro y reconocimiento de alarmas.
    - **Registro y Reproducción (Playback):** Grabación de todos los eventos y comunicaciones para análisis post-incidente.
    - **Interfaz SICC (AT4):** API para el envío de datos en tiempo real al Sistema de Indicadores.

---

## 3. DISEÑO Y LAYOUT DEL CENTRO DE CONTROL DE OPERACIONES (CCO)

### 3.1 Distribución de Áreas
| Área | Descripción | Requisitos Clave |
|:---|:---|:---|
| **Sala de Control** | Espacio principal con puestos de operador y videowall. | Diseño ergonómico, control de iluminación y acústica, visibilidad total del videowall. |
| **Data Center** | Alojamiento de servidores y equipos de red. | Piso técnico, racks de alta densidad, control de acceso biométrico, HVAC de precisión. |
| **Sala de Crisis** | Espacio para coordinación de emergencias. | Conectividad con sala de control, sistemas de videoconferencia, pizarras interactivas. |
| **Oficinas y Áreas de Soporte** | Oficinas para personal de operación y mantenimiento. | Espacios de trabajo, salas de reuniones, áreas de descanso. |
| **Salas Técnicas** | Cuartos de energía (UPS, tableros) y telecomunicaciones. | Acceso restringido, ventilación adecuada, sistemas de extinción de incendios. |

### 3.2 Planos de Diseño
Esta sección contendrá las referencias a los planos de detalle generados en formato DWG y PDF.

| ID Plano | Nombre del Plano | Versión | Enlace al Archivo |
|:---|:---|:---:|:---|
| **CCO-ARQ-001** | Layout General del CCO | 1.0 | `../Planos/CCO-ARQ-001.pdf` |
| **CCO-ELE-001** | Diagrama Unifilar Eléctrico del CCO | 1.0 | `../Planos/CCO-ELE-001.dwg` |
| **CCO-NET-001** | Diagrama de Red del CCO | 1.0 | `../Planos/CCO-NET-001.pdf` |

---

## 4. ESPECIFICACIÓN DETALLADA DE INTERFACES

**Basado en:** `41. Interfaces_Sistemas_MEJORADO.md`.

### 4.1 Interfaz IF-01: CTC ↔ Enclavamiento
- **Protocolo:** SCI-CC-A (NAS 830) sobre TCP/IP.
- **Medio Físico:** Doble enlace de Fibra Óptica a través de switches de red redundantes.
- **Mensajería Clave:**
    - **CTC → ENCL:** `Set_Route`, `Cancel_Route`.
    - **ENCL → CTC:** `Route_Status`, `Track_Section_Occupancy`, `Signal_Aspect`.
- **Seguridad:** La comunicación debe estar en una VLAN aislada y protegida por firewall.

### 4.2 Interfaz IF-06: CTC ↔ CTC FENOCO
- **Protocolo:** EULYNX (Propuesto) o API REST/JSON sobre HTTPS.
- **Medio Físico:** Conexión a través de la DMZ Industrial.
- **Mensajería Clave:**
    - **Handover de Tren:** `Request_Handover`, `Accept_Handover`, `Confirm_Handover`.
    - **Sincronización de Surcos:** `Update_Timetable`, `Query_Slot_Availability`.
- **Seguridad:** Autenticación mutua con certificados digitales y cifrado TLS 1.3.

---

## 5. PROCEDIMIENTOS DE INSTALACIÓN Y PRUEBAS

### 5.1 Procedimiento de Instalación
La instalación seguirá el **Plan de Obras (AT9)** y los manuales del fabricante. Se realizarán inspecciones de calidad en cada hito: obra civil del CCO, instalación de racks, tendido de cableado estructurado, montaje de equipos y conexionado.

### 5.2 Plan de Pruebas (FAT/SAT/SIT)
Las pruebas se regirán por el `42. Plan_Pruebas_MEJORADO.md`.
- **Pruebas FAT:** Se realizarán en un laboratorio para validar la configuración de servidores, software CTC y la correcta operación de las interfaces en un entorno simulado.
- **Pruebas SAT:** Se ejecutarán en el CCO para verificar la correcta instalación y funcionamiento de cada componente (servidores, consolas, videowall, red).
- **Pruebas SIT:** Se realizarán pruebas de integración completas para validar la comunicación CTC-Enclavamientos, CTC-FENOCO y la operación segura de todo el sistema ferroviario desde el CCO.

---

## 6. GESTIÓN DE RIESGOS Y DEPENDENCIAS

| ID | Categoría | Probabilidad | Impacto | Descripción | Estrategia de Mitigación |
|:---:|:---:|:---:|:---:|:---|:---|
| **R-090** | Técnico | Alta | Alto | Dependencia AT3 para especificaciones ITCS en CTC. | Desarrollar interfaces de CTC basadas en ETCS Level 2 hasta disponibilidad de AT3. |
| **R-091** | Técnico | Media | Alto | Fallo en interoperabilidad FENOCO por interfaces de CTC incompatibles. | Establecer protocolos de CTC compatibles con sistemas FENOCO existentes (EULYNX). |
| **R-092** | Contractual | Media | Alto | Incumplimiento de disponibilidad 99.5% en CTC según AT4. | Implementar sistemas de monitoreo y redundancia N+1 para garantizar cumplimiento. |
| **R-093** | Operacional | Media | Medio | Falla en sistema de energía o HVAC del CCO. | Diseñar infraestructura de CCO con redundancia 2N en energía y climatización. |
| **R-094** | Integración | Media | Alto | Complejidad en la integración del CTC con 12 sistemas distintos. | Utilizar el ICD (`41. Interfaces_Sistemas_MEJORADO.md`) como documento rector. |
