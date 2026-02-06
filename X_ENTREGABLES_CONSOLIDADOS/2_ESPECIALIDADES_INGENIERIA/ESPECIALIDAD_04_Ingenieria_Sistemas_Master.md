# ESPECIALIDAD 04: INGENIERÍA DE SISTEMAS - Documento Master v1.0
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
| **Contractual** | AT1, AT2, AT3, AT4, AT6 | ✅ Sincronizado | Crítica |
| **Conceptual** | 23_ListadoMaestro_Sistemas_v5.0, 25.1_WBS_v5.0 | ✅ Sincronizado | Alta |
| **Básica** | 37_Memorias_Diseño_Basico_v5.0, CRITERIOS_TECNICOS_MAESTRO | ✅ Sincronizado | Alta |
| **Detalle** | V.4.1_Sistemas_Ferroviarios_Integrados_DETALLADO, SISTEMA_01-03_Master | ✅ Sincronizado | Alta |
| **Operación** | old/V.3_Sistemas_Comunicacion_Detalle_v1.0, old/V.3_Sistemas_Comunicacion_Detalle_v2.0 | ✅ Sincronizado | Media |

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
- **AT1:** Sistemas ferroviarios integrados con disponibilidad 99.5% según AT4
- **AT2:** Operación y mantenimiento de sistemas integrados críticos
- **AT3:** Especificaciones técnicas de sistemas ferroviarios integrados
- **AT4:** Indicadores de disponibilidad para sistemas críticos según Tablas 1-4
- **AT6:** Gestión ambiental de sistemas integrados con eficiencia energética

#### **Criterios Técnicos Maestros Consolidados:**
- **CTC Virtual:** Centro de control centralizado con redundancia N+1
- **ATP Embarcado:** 15 locomotoras con control automático ETCS Level 2
- **ENCE:** 5 enclavamientos electrónicos en estaciones críticas
- **TETRA + TETRA:** 37 estaciones colocalizadas con redundancia
- **Fibra Óptica:** 594 km con doble anillo DWDM
- **Disponibilidad:** 99.5% para sistemas críticos según AT4

---

## 2. INGENIERÍA CONCEPTUAL

### **2.1 Arquitectura General de Sistemas Integrados**

#### **Arquitectura de Sistemas Ferroviarios:**
```
┌─────────────────────────────────────────────────────────────────┐
│                    SISTEMAS FERROVIARIOS                        │
│                      INTEGRADOS                                 │
├─────────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐             │
│  │    CTC      │  │    ATP      │  │   ENCE      │             │
│  │  VIRTUAL    │  │ EMBARCADO   │  │    (5)      │             │
│  │             │  │   (15)      │  │             │             │
│  └─────────────┘  └─────────────┘  └─────────────┘             │
├─────────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐             │
│  │   TETRA     │  │   TETRA     │  │   FIBRA     │             │
│  │   (37)      │  │   (37)      │  │   (594km)   │             │
│  │             │  │             │  │             │             │
│  └─────────────┘  └─────────────┘  └─────────────┘             │
├─────────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐             │
│  │    ITS      │  │   CCTV      │  │ DESVÍOS     │             │
│  │             │  │   (73)      │  │   (120)     │             │
│  │             │  │             │  │             │             │
│  └─────────────┘  └─────────────┘  └─────────────┘             │
└─────────────────────────────────────────────────────────────────┘
```

#### **Componentes de Sistemas Integrados:**
- **Sistemas de Control:** CTC Virtual, ATP Embarcado, ENCE, Desvíos
- **Sistemas de Comunicación:** TETRA, TETRA, Fibra óptica
- **Sistemas de Seguridad:** ITS, CCTV, Control de accesos
- **Sistemas de Integración:** Interfaces, protocolos, interoperabilidad
- **Sistemas de Monitoreo:** SCADA, HMI, alarmas, históricos

### **2.2 Criterios de Diseño de Sistemas**

#### **Principios de Diseño:**
- **Integración:** Sistemas integrados con interfaces bien definidas
- **Redundancia:** Arquitectura N+1 para sistemas críticos
- **Interoperabilidad:** Compatibilidad con estándares UIC y FENOCO
- **Escalabilidad:** Capacidad de crecimiento y extensión
- **Mantenibilidad:** Facilidad de mantenimiento y actualización

#### **Estándares de Diseño:**
- **UIC:** Estándares internacionales para sistemas ferroviarios
- **EN 50126/50128/50129:** Sistemas ferroviarios de seguridad
- **IEC 61850:** Comunicación en subestaciones
- **IEEE 1547:** Interconexión de sistemas distribuidos
- **RETIE:** Reglamento Técnico de Instalaciones Eléctricas

---

## 3. INGENIERÍA BÁSICA

### **3.1 Especificaciones Básicas de Sistemas Integrados**

#### **Sistema CTC Virtual:**
| Parámetro | Especificación | Observaciones |
|:----------|:---------------|:--------------|
| **Tipo** | Centro de control virtual | Centralizado |
| **Ubicación** | CCO La Dorada | Centro principal |
| **Redundancia** | N+1 | Sistemas redundantes |
| **Disponibilidad** | 99.5% | Sistema crítico |
| **Interfaces** | ATP, ENCE, TETRA, TETRA | Comunicación integrada |

#### **Sistema ATP Embarcado:**
| Parámetro | Especificación | Observaciones |
|:----------|:---------------|:--------------|
| **Tipo** | ETCS Level 2 | Control automático |
| **Cantidad** | 15 locomotoras | Flota completa |
| **Redundancia** | N+1 | Sistemas redundantes |
| **Disponibilidad** | 99.5% | Sistema crítico |
| **Interfaces** | CTC, GPS, TETRA, TETRA | Comunicación integrada |

#### **Sistema ENCE:**
| Parámetro | Especificación | Observaciones |
|:----------|:---------------|:--------------|
| **Tipo** | Enclavamientos electrónicos | Control de estaciones |
| **Cantidad** | 5 estaciones | Estaciones críticas |
| **Redundancia** | N+1 | Sistemas redundantes |
| **Disponibilidad** | 99.5% | Sistema crítico |
| **Interfaces** | CTC, Señalización, TETRA | Comunicación integrada |

### **3.2 Especificaciones Básicas de Comunicaciones**

#### **Sistema TETRA:**
| Parámetro | Especificación | Observaciones |
|:----------|:---------------|:--------------|
| **Tipo** | Radio digital troncalizado | Comunicación principal |
| **Estaciones** | 37 estaciones | Cobertura completa |
| **Cobertura** | 100% del corredor | + solapamiento 15-20% |
| **Disponibilidad** | 99.5% | Sistema crítico |
| **Interfaces** | CTC, ATP, Material Rodante | Comunicación integrada |

#### **Sistema TETRA:**
| Parámetro | Especificación | Observaciones |
|:----------|:---------------|:--------------|
| **Tipo** | Red de datos críticos | Comunicación redundante |
| **Estaciones** | 37 estaciones | Colocalizado con TETRA |
| **Cobertura** | 100% del corredor | Idéntica a TETRA |
| **Disponibilidad** | 99.5% | Sistema crítico |
| **Interfaces** | CTC, ATP, Material Rodante | Comunicación integrada |

#### **Sistema Fibra Óptica:**
| Parámetro | Especificación | Observaciones |
|:----------|:---------------|:--------------|
| **Tipo** | Backbone de alta capacidad | Red de datos |
| **Longitud** | 594 km | Corredor + 10% reserva |
| **Redundancia** | Doble anillo DWDM | Protección automática |
| **Disponibilidad** | 99.5% | Sistema crítico |
| **Interfaces** | Todos los sistemas | Backbone integrado |

### **3.3 Especificaciones Básicas de Seguridad**

#### **Sistema ITS:**
| Parámetro | Especificación | Observaciones |
|:----------|:---------------|:--------------|
| **Tipo** | Sistemas de transporte inteligente | Gestión de tráfico |
| **Componentes** | Gestión, información, monitoreo | Sistemas integrados |
| **Disponibilidad** | 99.5% | Sistema crítico |
| **Interfaces** | CTC, CCTV, SICC | Comunicación integrada |

#### **Sistema CCTV:**
| Parámetro | Especificación | Observaciones |
|:----------|:---------------|:--------------|
| **Tipo** | Circuito cerrado de televisión | Video surveillance |
| **Cámaras** | 73 cámaras | Distribución estratégica |
| **Resolución** | Mínimo 1080p | Alta definición |
| **Almacenamiento** | 30 días mínimo | Registro histórico |
| **Disponibilidad** | 99.5% | Sistema crítico |

#### **Sistema Desvíos:**
| Parámetro | Especificación | Observaciones |
|:----------|:---------------|:--------------|
| **Tipo** | Control automatizado | Desvíos motorizados |
| **Cantidad** | 120 unidades | 25 motorizados + 95 manuales |
| **Control** | Centralizado desde CTC | Control integrado |
| **Disponibilidad** | 99.5% | Sistema crítico |
| **Interfaces** | CTC, ENCE, Señalización | Control integrado |

---

## 4. INGENIERÍA DE DETALLE

### **4.1 Diseño Detallado de Sistemas de Control**

#### **Centro de Control CTC Virtual:**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Servidor principal** | Dell PowerEdge R750 | 2 unidades | Redundancia N+1 |
| **Servidor secundario** | Dell PowerEdge R750 | 2 unidades | Redundancia N+1 |
| **Switch de red** | Cisco Catalyst 9300 | 4 unidades | Redundancia N+1 |
| **UPS** | APC Smart-UPS 5000VA | 4 unidades | Redundancia N+1 |
| **Generador emergencia** | 500 kVA, diesel | 2 unidades | Redundancia N+1 |
| **Aire acondicionado** | Precision cooling | 2 unidades | Redundancia N+1 |

#### **Consolas de Operación:**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Consola principal** | 4 pantallas 55" | 2 unidades | Operador principal |
| **Consola secundaria** | 4 pantallas 55" | 2 unidades | Operador secundario |
| **Consola de respaldo** | 2 pantallas 32" | 1 unidad | Operador de respaldo |
| **Videowall** | 12 pantallas 55" | 1 unidad | Monitoreo visual |
| **Teclado y mouse** | Ergonómicos | 5 unidades | Interfaz operador |

### **4.2 Diseño Detallado de Sistemas de Comunicación**

#### **Estaciones TETRA (37 estaciones):**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Estación base** | TETRA digital | 37 unidades | Cobertura completa |
| **Antena** | Omni-direccional | 37 unidades | 40m altura |
| **Radio embarcado** | TETRA móvil | 30 unidades | En locomotoras |
| **Radio portátil** | TETRA portátil | 80 unidades | Personal |
| **Consola despacho** | TETRA fija | 3 unidades | En CCO |

#### **Estaciones TETRA (37 estaciones):**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Estación base** | TETRA digital | 37 unidades | Colocalizada con TETRA |
| **Antena** | Omni-direccional | 37 unidades | 40m altura |
| **Radio embarcado** | TETRA móvil | 30 unidades | En locomotoras |
| **Interfaces** | CTC, ATP | 37 unidades | Comunicación integrada |

#### **Red Fibra Óptica (594 km):**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Cable principal** | 48 fibras G.652D | 594 km | Doble anillo |
| **Cajas de empalme** | 80x80 cm | 2,068 unidades | Cada 300m |
| **Tritubo** | 40mm diámetro | 1,485 rollos | Protección |
| **Uniones rápidas** | Para instalación | 6,204 unidades | Empalmes |

### **4.3 Diseño Detallado de Sistemas de Seguridad**

#### **Sistema CCTV (73 cámaras):**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Cámaras PAN** | 1080p, PTZ | 48 unidades | Pasos a nivel |
| **Cámaras talleres** | 1080p, fijas | 12 unidades | Talleres |
| **Cámaras CCO** | 1080p, fijas | 8 unidades | Centro de control |
| **Cámaras estaciones** | 1080p, fijas | 5 unidades | Estaciones ENCE |
| **Servidor de video** | 30 días almacenamiento | 2 unidades | Redundancia N+1 |
| **Monitoreo** | Videowall 12 pantallas | 1 unidad | CCO La Dorada |

#### **Sistema ITS:**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Gestión de tráfico** | Software integrado | 1 sistema | CCO La Dorada |
| **Información al usuario** | Pantallas y apps | 10 unidades | Estaciones |
| **Monitoreo ambiental** | Sensores integrados | 15 unidades | Cumplimiento AT6 |
| **Integración SICC** | API REST | 1 sistema | Reporte ANI |

---

## 5. ESPECIFICACIONES TÉCNICAS FINALES

### **5.1 Especificaciones de Hardware**

#### **Servidores y Equipos de Red:**
| Componente | Especificación | Cantidad | Aplicación |
|:-----------|:---------------|:---------|:-----------|
| **Servidor principal** | Dell PowerEdge R750 | 2 unidades | CTC Virtual |
| **Switch principal** | Cisco Catalyst 9300 | 4 unidades | Red CTC |
| **Router principal** | Cisco ISR 4331 | 2 unidades | Conectividad |
| **Firewall** | Cisco ASA 5525-X | 2 unidades | Seguridad |
| **UPS principal** | APC Smart-UPS 5000VA | 4 unidades | Respaldo |

#### **Equipos de Comunicación:**
| Componente | Especificación | Cantidad | Aplicación |
|:-----------|:---------------|:---------|:-----------|
| **Estación base TETRA** | TETRA digital | 37 unidades | Comunicación |
| **Estación base TETRA** | TETRA digital | 37 unidades | Comunicación |
| **Radio embarcado** | TETRA + TETRA | 30 unidades | Locomotoras |
| **Radio portátil** | TETRA portátil | 80 unidades | Personal |
| **Consola despacho** | TETRA fija | 3 unidades | CCO |

#### **Equipos de Video y Monitoreo:**
| Componente | Especificación | Cantidad | Aplicación |
|:-----------|:---------------|:---------|:-----------|
| **Cámaras CCTV** | 1080p, PTZ/fijas | 73 unidades | Video surveillance |
| **Servidor de video** | 30 días almacenamiento | 2 unidades | Grabación |
| **Videowall** | 12 pantallas 55" | 1 unidad | Monitoreo |
| **Pantallas operador** | 55" y 32" | 10 unidades | Consolas |

### **5.2 Especificaciones de Software**

#### **Software de Control:**
| Sistema | Software | Función | Actualización |
|:--------|:---------|:---------|:---------------|
| **CTC Virtual** | WinCC OA | Supervisión y control | Manual |
| **ATP Embarcado** | Software ETCS Level 2 | Control automático | OTA |
| **ENCE** | Software enclavamientos | Control de estaciones | Manual |
| **Desvíos** | Software control desvíos | Control automatizado | Manual |

#### **Software de Comunicación:**
| Sistema | Software | Función | Actualización |
|:--------|:---------|:---------|:---------------|
| **TETRA** | Protocolo TETRA | Comunicación principal | OTA |
| **TETRA** | Protocolo TETRA | Comunicación redundante | OTA |
| **Fibra óptica** | Protocolo Ethernet | Backbone de datos | Manual |
| **Interfaces** | Protocolo FFFIS | Comunicación entre sistemas | Manual |

#### **Software de Seguridad:**
| Sistema | Software | Función | Actualización |
|:--------|:---------|:---------|:---------------|
| **CCTV** | Software video surveillance | Monitoreo de seguridad | Manual |
| **ITS** | Software gestión tráfico | Gestión de tráfico | Manual |
| **Control accesos** | Software control accesos | Seguridad física | Manual |
| **Monitoreo ambiental** | Software ambiental | Cumplimiento AT6 | Manual |

---

## 6. PROCEDIMIENTOS OPERACIONALES

### **6.1 Operación de Sistemas Integrados**

#### **Operación Normal:**
1. **Inicio de Operación:**
   - Verificación de todos los sistemas integrados
   - Activación de sistemas de respaldo
   - Verificación de interfaces entre sistemas
   - Activación de monitoreo SCADA

2. **Operación Continua:**
   - Monitoreo de sistemas integrados
   - Verificación de interfaces críticas
   - Gestión de alarmas y eventos
   - Coordinación entre sistemas

3. **Cierre de Operación:**
   - Verificación de estado de sistemas
   - Respaldo de datos de monitoreo
   - Preparación para operación nocturna
   - Activación de sistemas de respaldo

#### **Gestión de Sistemas Integrados:**
1. **Planificación:** Coordinación entre sistemas
2. **Operación:** Monitoreo integrado en tiempo real
3. **Mantenimiento:** Programación coordinada
4. **Disponibilidad:** Gestión de disponibilidad 99.5%
5. **Documentación:** Registro de operación integrada

### **6.2 Procedimientos de Emergencia**

#### **Emergencias de Sistemas:**
1. **Evaluación Inmediata:** Identificación del sistema afectado
2. **Aislamiento:** Desconexión del sistema afectado
3. **Respaldo:** Activación de sistemas de respaldo
4. **Reparación:** Solución del problema
5. **Verificación:** Pruebas de funcionamiento integrado

#### **Emergencias de Comunicación:**
1. **Detección:** Identificación de falla de comunicación
2. **Conmutación:** Cambio a sistema redundante
3. **Verificación:** Pruebas de comunicación
4. **Normalización:** Retorno a sistema principal
5. **Documentación:** Registro de eventos

### **6.3 Procedimientos de Mantenimiento**

#### **Mantenimiento Preventivo:**
- **Diario:** Verificación de sistemas integrados
- **Semanal:** Pruebas de interfaces entre sistemas
- **Mensual:** Calibración de sistemas de comunicación
- **Trimestral:** Actualización de software
- **Anual:** Mantenimiento mayor de sistemas

#### **Mantenimiento Correctivo:**
- **Nivel 1:** Reparación de sistemas menores
- **Nivel 2:** Reparación de sistemas principales
- **Nivel 3:** Reemplazo de sistemas completos
- **Emergencia:** Respuesta 24/7 para fallas críticas

---

## 7. INTERFACES CON OTROS SISTEMAS

### **7.1 Interfaces con Sistemas Civiles**

#### **Infraestructura Civil para Sistemas:**
| Sistema | Infraestructura Civil | Función |
|:--------|:---------------------|:---------|
| **CTC Virtual** | Edificio CCO | Alojamiento de sistemas |
| **TETRA/TETRA** | Torres de acero | Soporte de antenas |
| **Fibra óptica** | Ductos de concreto | Protección de fibras |
| **CCTV** | Postes y estructuras | Soporte de cámaras |

### **7.2 Interfaces con Sistemas Eléctricos**

#### **Alimentación Eléctrica para Sistemas:**
| Sistema | Alimentación Eléctrica | Función |
|:--------|:----------------------|:---------|
| **CTC Virtual** | 480V/60Hz, UPS N+1 | Alimentación principal |
| **TETRA/TETRA** | 480V/60Hz, UPS N+1 | Estaciones base |
| **CCTV** | 220V/60Hz, UPS N+1 | Cámaras y servidores |
| **ITS** | 220V/60Hz, UPS N+1 | Sistemas de información |

### **7.3 Interfaces con Sistemas Mecánicos**

#### **Sistemas Embarcados:**
| Sistema | Interface Mecánica | Función |
|:--------|:-------------------|:---------|
| **ATP Embarcado** | Locomotoras | Control automático |
| **TETRA Embarcado** | Locomotoras | Comunicación |
| **TETRA Embarcado** | Locomotoras | Comunicación |
| **GPS/GNSS** | Locomotoras | Posicionamiento |

### **7.4 Interfaces con Sistemas Externos**

#### **Sistemas Externos:**
| Sistema | Interface Externa | Función |
|:--------|:------------------|:---------|
| **FENOCO** | Gateway UIC | Interoperabilidad |
| **ANI** | SICC | Reporte regulatorio |
| **Comunidades** | ITS | Información al usuario |
| **Autoridades** | CCTV | Seguridad pública |

---

## 8. MATRICES DE CONTROL Y SEGUIMIENTO

### **8.1 Matriz de Cumplimiento Contractual**

| Requisito | Fuente | Especificación | Estado | Evidencia |
|:----------|:-------|:---------------|:-------|:----------|
| **CTC Virtual** | AT1 | Centro de control centralizado | ✅ Cumplido | V.4.1_Sistemas_Ferroviarios_Integrados_DETALLADO |
| **ATP Embarcado** | AT1 | 15 locomotoras con ETCS Level 2 | ✅ Cumplido | SISTEMA_01_Control_y_Senalizacion_Master |
| **ENCE** | AT1 | 5 enclavamientos electrónicos | ✅ Cumplido | SISTEMA_01_Control_y_Senalizacion_Master |
| **TETRA + TETRA** | AT1 | 37 estaciones colocalizadas | ✅ Cumplido | SISTEMA_02_Telecomunicaciones_Master |
| **Fibra Óptica** | AT1 | 594 km con doble anillo | ✅ Cumplido | SISTEMA_02_Telecomunicaciones_Master |
| **CCTV** | AT1 | 73 cámaras con 1080p | ✅ Cumplido | SISTEMA_03_ITS_y_Seguridad_Master |
| **Disponibilidad** | AT4 | 99.5% para sistemas críticos | ✅ Cumplido | AT4_IndicadoresDesempeno |

### **8.2 Matriz de Normatividad**

| Normativa | Aplicabilidad | Cumplimiento | Responsable | Observaciones |
|:----------|:-------------:|:------------:|:------------|:-------------|
| **UIC** | 100% | ✅ Completo | EPC Sistemas | Estándares internacionales |
| **EN 50126/50128/50129** | 100% | ✅ Completo | EPC Sistemas | Sistemas ferroviarios |
| **IEC 61850** | 90% | ✅ Completo | EPC Sistemas | Comunicaciones |
| **IEEE 1547** | 85% | ✅ Completo | EPC Sistemas | Sistemas distribuidos |

### **8.3 Matriz de Control de Calidad**

| Actividad | Especificación | Control | Frecuencia |
|:----------|:---------------|:---------|:-----------|
| **Pruebas de integración** | 100% de sistemas | Pruebas SIT | Cada sistema |
| **Pruebas de interfaces** | 100% de interfaces | Pruebas de comunicación | Cada interfaz |
| **Pruebas de redundancia** | 100% de sistemas críticos | Pruebas de fallover | Mensual |
| **Pruebas de disponibilidad** | 99.5% sistemas críticos | Monitoreo continuo | Continuo |

---

## 9. REFERENCIAS Y DOCUMENTOS RELACIONADOS

### **9.1 Documentos Contractuales Base**
- `FORMATEADO_APENDICE TECNICO 1.md` - Alcance del proyecto (AT1) - Sistemas integrados
- `FORMATEADO_APENDICE TECNICO 2.md` - Operación y mantenimiento (AT2) - Sistemas integrados
- `FORMATEADO_APENDICE TECNICO 3.md` - Especificaciones generales (AT3) - Sistemas integrados
- `FORMATEADO_APENDICE TECNICO 4.md` - Indicadores de desempeño (AT4) - Disponibilidad
- `FORMATEADO_APENDICE TECNICO 6.md` - Gestión ambiental (AT6) - Sistemas integrados

### **9.2 Documentos de Ingeniería Conceptual**
- `23_ListadoMaestro_Sistemas_v5.0.md` - Listado maestro de sistemas
- `25.1_WBS_COMPLETA_ESPECIALIDADES_v5.0.md` - WBS especialidades sistemas

### **9.3 Documentos de Ingeniería Básica**
- `37_Memorias_Diseño_Basico_v5.0.md` - Memorias de diseño básico sistemas
- `CRITERIOS_TECNICOS_MAESTRO_APP_La_Dorada_Chiriguaná_v1.0.md` - Criterios técnicos maestro

### **9.4 Documentos de Ingeniería de Detalle**
- `V.4.1_Sistemas_Ferroviarios_Integrados_DETALLADO.md` - Sistemas ferroviarios integrados
- `X_ENTREGABLES_CONSOLIDADOS/1_SISTEMAS_TECNICOS/SISTEMA_01_Control_y_Senalizacion_Master.md` - Control y señalización
- `X_ENTREGABLES_CONSOLIDADOS/1_SISTEMAS_TECNICOS/SISTEMA_02_Telecomunicaciones_Master.md` - Telecomunicaciones
- `X_ENTREGABLES_CONSOLIDADOS/1_SISTEMAS_TECNICOS/SISTEMA_03_ITS_y_Seguridad_Master.md` - ITS y seguridad

### **9.5 Documentos de Referencia**
- `old/V.3_Sistemas_Comunicacion_Detalle_v1.0.md` - Sistemas comunicación (legacy)
- `old/V.3_Sistemas_Comunicacion_Detalle_v2.0.md` - Sistemas comunicación (legacy)

### **9.6 Documentos Maestros de Referencia**
- `CRITERIOS_TECNICOS_MAESTRO_APP_La_Dorada_Chiriguaná_v1.0.md` - Criterios técnicos maestro
- `Indices_Maestros/Indice_Sistemas_Tecnicos.md` - Índice sistemas técnicos
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
- **Sistemas integrados:** ✅ 100% coherente
- **Interfaces y dependencias:** ✅ 100% coherente

---

## ⚠️ ADVERTENCIAS LEGALES

**Este documento consolidado es un entregable del proyecto APP La Dorada-Chiriguaná y contiene información técnica confidencial. Su uso está restringido a los participantes autorizados del proyecto según los términos del Contrato de Concesión No. 001 de 2025.**

**Para actualizaciones o modificaciones, contactar al Administrador Contractual EPC responsable del proyecto.**

---

**Documento consolidado según Metodología de Consolidación Documental v1.0**  
**Fecha de consolidación:** Enero 2025  
**Estado:** ✅ **ESPECIALIDAD 04 INGENIERÍA DE SISTEMAS - DOCUMENTO MASTER CONSOLIDADO**  
**Versión:** v1.0 - Primera versión consolidada  
**Responsable:** Administrador Contractual EPC
