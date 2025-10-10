# PLAN DE INTEGRACIÓN DE SISTEMAS - COMPLETO
## APP LA DORADA-CHIRIGUANÁ v10.1

**Fecha de desarrollo:** 27 de enero de 2025  
**Proyecto:** APP La Dorada - Chiriguaná  
**Contrato:** Concesión No. 001 de 2025  
**Responsable:** Administrador Contractual EPC

---

## 🎯 RESUMEN EJECUTIVO

Este documento presenta el **plan de integración de sistemas completo** para el proyecto APP La Dorada-Chiriguaná, desarrollado para coordinar la integración de todos los sistemas ferroviarios, eléctricos, mecánicos y civiles del corredor ferroviario de 178 km.

### **Base Técnica:**
- **Longitud total:** 178 km La Dorada-Chiriguaná
- **Sistemas integrados:** Civil, Eléctrico, Mecánico, Sistemas
- **Estándares:** UIC, EN, IEEE, normas colombianas
- **Interoperabilidad:** Con red FENOCO

---

## 🔗 ARQUITECTURA DE INTEGRACIÓN

### **1. MODELO DE INTEGRACIÓN**

#### **1.1 Arquitectura de Sistemas**
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   SISTEMAS      │    │   SISTEMAS      │    │   SISTEMAS      │
│   CIVILES       │◄──►│   ELÉCTRICOS    │◄──►│   MECÁNICOS     │
│                 │    │                 │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   GATEWAY DE    │    │   SISTEMA DE    │    │   SISTEMA DE    │
│   INTEGRACIÓN   │    │   MONITOREO     │    │   CONTROL       │
│   PRINCIPAL     │    │   INTEGRADO     │    │   INTEGRADO     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   SISTEMAS      │    │   SISTEMAS      │    │   SISTEMAS      │
│   FERROVIARIOS  │    │   DE DATOS      │    │   DE SEGURIDAD  │
│   INTEGRADOS    │    │   INTEGRADOS    │    │   INTEGRADOS    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

#### **1.2 Componentes de Integración**
| Componente | Función | Ubicación | Observaciones |
|:-----------|:---------|:----------|:--------------|
| **Gateway principal** | Integración general | La Dorada | Redundancia N+1 |
| **Gateway secundario** | Integración local | Chiriguaná | Redundancia N+1 |
| **Sistema de monitoreo** | Monitoreo integrado | La Dorada | Redundancia N+1 |
| **Sistema de control** | Control integrado | La Dorada | Redundancia N+1 |

---

## 🏗️ INTEGRACIÓN CIVIL-ELÉCTRICA

### **2. INTERFACES CIVIL-ELÉCTRICA**

#### **2.1 Canalizaciones Eléctricas**
| Ubicación | Tipo | Cantidad | Observaciones |
|:----------|:-----|:--------:|:--------------|
| **Vía principal** | Canalización subterránea | 178 km | 25 kV + servicios |
| **Estaciones** | Canalización subterránea | 8 estaciones | 25 kV + servicios |
| **Puentes** | Canalización aérea | 8 puentes | 25 kV + servicios |
| **Túneles** | Canalización aérea | 4 túneles | 25 kV + servicios |

#### **2.2 Bases de Equipos Eléctricos**
| Equipo | Base | Cantidad | Observaciones |
|:-------|:-----|:--------:|:--------------|
| **Postes catenaria** | Base de concreto | 2,967 unidades | Anclaje estructural |
| **Postes distribución** | Base de concreto | 1,483 unidades | Anclaje estructural |
| **Subestaciones** | Base de concreto | 4 subestaciones | Anclaje estructural |
| **Equipos de línea** | Base de concreto | 500 unidades | Anclaje estructural |

#### **2.3 Sistemas de Puesta a Tierra**
| Ubicación | Sistema | Cantidad | Observaciones |
|:----------|:---------|:--------:|:--------------|
| **Vía principal** | Electrodo principal | 356 unidades | Cada 500m |
| **Estaciones** | Electrodo principal | 8 unidades | 1 por estación |
| **Subestaciones** | Electrodo principal | 4 unidades | 1 por subestación |
| **Equipos críticos** | Electrodo secundario | 200 unidades | Equipos específicos |

---

## ⚡ INTEGRACIÓN ELÉCTRICA-MECÁNICA

### **3. INTERFACES ELÉCTRICA-MECÁNICA**

#### **3.1 Alimentación de Trenes**
| Sistema | Tensión | Potencia | Observaciones |
|:--------|:---------|:----------|:--------------|
| **Tracción** | 25 kV AC | 3,000 kW | Trenes de pasajeros |
| **Servicios auxiliares** | 480V AC | 200 kW | Servicios del tren |
| **Sistemas críticos** | 110V DC | 50 kW | Sistemas de seguridad |
| **Sistemas de respaldo** | 24V DC | 10 kW | Sistemas de emergencia |

#### **3.2 Sistemas de Frenado**
| Sistema | Tipo | Potencia | Observaciones |
|:--------|:-----|:----------|:--------------|
| **Freno neumático** | Aire comprimido | 10 bar | Freno principal |
| **Freno eléctrico** | Frenado regenerativo | 3,000 kW | Freno secundario |
| **Freno de emergencia** | Sistema independiente | 10 bar | Freno de seguridad |
| **Freno de estacionamiento** | Sistema manual | 10 bar | Freno de parqueo |

#### **3.3 Sistemas HVAC**
| Sistema | Tipo | Potencia | Observaciones |
|:--------|:-----|:----------|:--------------|
| **Climatización** | Eléctrica | 50 kW | Climatización principal |
| **Ventilación** | Eléctrica | 10 kW | Ventilación general |
| **Calefacción** | Eléctrica | 30 kW | Calefacción de emergencia |
| **Sistemas de respaldo** | Eléctrica | 20 kW | Sistemas de respaldo |

---

## 🚂 INTEGRACIÓN MECÁNICA-SISTEMAS

### **4. INTERFACES MECÁNICA-SISTEMAS**

#### **4.1 Sistemas Embarcados**
| Sistema | Ubicación | Función | Observaciones |
|:--------|:----------|:---------|:--------------|
| **ITCS ETCS Level 2** | Cada tren | Control de tren | 40 unidades |
| **TETRA** | Cada tren | Comunicaciones | 40 unidades |
| **CCTV** | Cada tren | Video seguridad | 40 unidades |
| **Sistemas de datos** | Cada tren | Transmisión datos | 40 unidades |

#### **4.2 Sistemas de Monitoreo**
| Sistema | Ubicación | Función | Observaciones |
|:--------|:----------|:---------|:--------------|
| **Monitoreo de tracción** | Cada tren | Monitoreo tracción | 40 unidades |
| **Monitoreo de frenos** | Cada tren | Monitoreo frenos | 40 unidades |
| **Monitoreo de HVAC** | Cada tren | Monitoreo climatización | 40 unidades |
| **Monitoreo de seguridad** | Cada tren | Monitoreo seguridad | 40 unidades |

#### **4.3 Sistemas de Diagnóstico**
| Sistema | Ubicación | Función | Observaciones |
|:--------|:----------|:---------|:--------------|
| **Diagnóstico de tracción** | Cada tren | Diagnóstico tracción | 40 unidades |
| **Diagnóstico de frenos** | Cada tren | Diagnóstico frenos | 40 unidades |
| **Diagnóstico de HVAC** | Cada tren | Diagnóstico climatización | 40 unidades |
| **Diagnóstico de seguridad** | Cada tren | Diagnóstico seguridad | 40 unidades |

---

## 🌐 INTEGRACIÓN DE SISTEMAS DE DATOS

### **5. ARQUITECTURA DE DATOS**

#### **5.1 Red de Datos Principal**
| Ubicación | Tipo | Capacidad | Observaciones |
|:----------|:-----|:----------|:--------------|
| **La Dorada** | Switch principal | 10 Gbps | Redundancia N+1 |
| **Puerto Berrío** | Switch intermedio | 1 Gbps | Redundancia N+1 |
| **Barrancabermeja** | Switch intermedio | 1 Gbps | Redundancia N+1 |
| **Chiriguaná** | Switch principal | 10 Gbps | Redundancia N+1 |

#### **5.2 Servidores de Datos**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Servidor de datos** | Dell PowerEdge R750 | 8 unidades | Redundancia N+1 |
| **Base de datos** | Oracle 19c | 8 unidades | Redundancia N+1 |
| **Servidor de aplicaciones** | Dell PowerEdge R750 | 8 unidades | Redundancia N+1 |
| **Servidor de respaldo** | Dell PowerEdge R750 | 4 unidades | Respaldo completo |

#### **5.3 Sistemas de Seguridad**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Firewall** | Cisco ASA 5525 | 8 unidades | Redundancia N+1 |
| **Antivirus** | Symantec Endpoint | 200 licencias | Protección endpoints |
| **VPN** | Cisco AnyConnect | 100 licencias | Acceso remoto |
| **IDS/IPS** | Cisco FirePOWER | 4 unidades | Detección intrusos |

---

## 📊 SISTEMA DE MONITOREO INTEGRADO

### **6. MONITOREO DE SISTEMAS**

#### **6.1 Monitoreo de Sistemas Civiles**
| Sistema | Parámetro | Frecuencia | Observaciones |
|:--------|:----------|:------------|:--------------|
| **Estructuras** | Deformaciones | Continua | Sensores estructurales |
| **Puentes** | Vibraciones | Continua | Sensores de vibración |
| **Túneles** | Deformaciones | Continua | Sensores estructurales |
| **Vía férrea** | Geometría | Diaria | Medición de vía |

#### **6.2 Monitoreo de Sistemas Eléctricos**
| Sistema | Parámetro | Frecuencia | Observaciones |
|:--------|:----------|:------------|:--------------|
| **Subestaciones** | Tensión, corriente | Continua | Medidores digitales |
| **Catenaria** | Tensión, corriente | Continua | Medidores digitales |
| **Distribución** | Tensión, corriente | Continua | Medidores digitales |
| **Puesta a tierra** | Resistencia | Mensual | Medición de resistencia |

#### **6.3 Monitoreo de Sistemas Mecánicos**
| Sistema | Parámetro | Frecuencia | Observaciones |
|:--------|:----------|:------------|:--------------|
| **Trenes** | Posición, velocidad | Continua | Sistemas embarcados |
| **Frenos** | Presión, temperatura | Continua | Sensores de frenos |
| **HVAC** | Temperatura, humedad | Continua | Sensores ambientales |
| **Vibraciones** | Aceleración | Continua | Sensores de vibración |

#### **6.4 Monitoreo de Sistemas Ferroviarios**
| Sistema | Parámetro | Frecuencia | Observaciones |
|:--------|:----------|:------------|:--------------|
| **CTC** | Estado de señales | Continua | Sistemas de control |
| **ITCS** | Estado de trenes | Continua | Sistemas embarcados |
| **TETRA** | Calidad de comunicación | Continua | Sistemas de radio |
| **CCTV** | Estado de cámaras | Continua | Sistemas de video |

---

## 🔧 SISTEMAS DE CONTROL INTEGRADO

### **7. CONTROL DE SISTEMAS**

#### **7.1 Control de Sistemas Civiles**
| Sistema | Función | Ubicación | Observaciones |
|:--------|:---------|:----------|:--------------|
| **Control de estructuras** | Monitoreo estructural | La Dorada | Control centralizado |
| **Control de puentes** | Monitoreo de puentes | Cada puente | Control local |
| **Control de túneles** | Monitoreo de túneles | Cada túnel | Control local |
| **Control de vía** | Monitoreo de vía | Cada 10 km | Control distribuido |

#### **7.2 Control de Sistemas Eléctricos**
| Sistema | Función | Ubicación | Observaciones |
|:--------|:---------|:----------|:--------------|
| **Control de subestaciones** | Control de subestaciones | Cada subestación | Control local |
| **Control de catenaria** | Control de catenaria | Cada 10 km | Control distribuido |
| **Control de distribución** | Control de distribución | Cada estación | Control local |
| **Control de puesta a tierra** | Monitoreo de puesta a tierra | Cada 1 km | Control distribuido |

#### **7.3 Control de Sistemas Mecánicos**
| Sistema | Función | Ubicación | Observaciones |
|:--------|:---------|:----------|:--------------|
| **Control de trenes** | Control de trenes | Cada tren | Control embarcado |
| **Control de frenos** | Control de frenos | Cada tren | Control embarcado |
| **Control de HVAC** | Control de climatización | Cada tren | Control embarcado |
| **Control de mantenimiento** | Control de mantenimiento | Cada taller | Control local |

#### **7.4 Control de Sistemas Ferroviarios**
| Sistema | Función | Ubicación | Observaciones |
|:--------|:---------|:----------|:--------------|
| **Control CTC** | Control de tráfico | La Dorada | Control centralizado |
| **Control ITCS** | Control de trenes | Cada tren | Control embarcado |
| **Control TETRA** | Control de comunicaciones | La Dorada | Control centralizado |
| **Control CCTV** | Control de video | La Dorada | Control centralizado |

---

## 📋 PROCEDIMIENTOS DE INTEGRACIÓN

### **8. METODOLOGÍA DE INTEGRACIÓN**

#### **8.1 Fases de Integración**
1. **Fase 1:** Integración civil-eléctrica (2 meses)
2. **Fase 2:** Integración eléctrica-mecánica (2 meses)
3. **Fase 3:** Integración mecánica-sistemas (2 meses)
4. **Fase 4:** Integración de sistemas de datos (1 mes)
5. **Fase 5:** Integración de monitoreo (1 mes)
6. **Fase 6:** Integración de control (1 mes)

#### **8.2 Control de Calidad de Integración**
- **Pruebas de interfaz:** 100% de interfaces
- **Pruebas de funcionamiento:** 100% de sistemas
- **Pruebas de integración:** 100% de integraciones
- **Pruebas de aceptación:** 100% de funcionalidades
- **Pruebas de interoperabilidad:** 100% con FENOCO

#### **8.3 Gestión de Cambios**
- **Control de versiones:** Sistema de control de versiones
- **Gestión de cambios:** Proceso de gestión de cambios
- **Documentación:** Documentación actualizada
- **Comunicación:** Comunicación de cambios

---

## 📊 CANTIDADES Y PRESUPUESTO

### **9. CANTIDADES DE INTEGRACIÓN**

#### **9.1 Equipos de Integración**
- **Gateways de integración:** 8 unidades
- **Servidores de integración:** 16 unidades
- **Switches de integración:** 24 unidades
- **Equipos de monitoreo:** 50 unidades
- **Equipos de control:** 30 unidades

#### **9.2 Cables de Integración**
- **Cable de datos:** 89 km
- **Cable de alimentación:** 267 km
- **Cable de tierra:** 356 km
- **Cable de comunicación:** 178 km

#### **9.3 Estructuras de Integración**
- **Racks de integración:** 50 unidades
- **Armarios de integración:** 100 unidades
- **Postes de integración:** 500 unidades
- **Bases de integración:** 200 unidades

### **10. PRESUPUESTO DE INTEGRACIÓN**

#### **10.1 Costos por Rubro**
| Rubro | Costo (COP) | % del Total |
|:------|:------------|:------------|
| **Equipos de integración** | $25,000 M | 40% |
| **Cables de integración** | $15,000 M | 24% |
| **Estructuras de integración** | $10,000 M | 16% |
| **Software de integración** | $8,000 M | 13% |
| **Pruebas de integración** | $4,000 M | 7% |
| **TOTAL** | **$62,000 M** | **100%** |

---

## ⚠️ RIESGOS Y MITIGACIONES

### **11. RIESGOS DE INTEGRACIÓN**

#### **11.1 Riesgos Identificados**
| Riesgo | Probabilidad | Impacto | Mitigación |
|:-------|:------------:|:-------:|:-----------|
| **Fallas de interfaz** | Media | Alto | Pruebas exhaustivas |
| **Fallas de integración** | Media | Alto | Redundancia N+1 |
| **Fallas de comunicación** | Baja | Alto | Comunicaciones redundantes |
| **Fallas de monitoreo** | Baja | Medio | Monitoreo redundante |

#### **11.2 Plan de Contingencia**
- **Reservas:** 15% del presupuesto
- **Cronograma:** 20% de holgura
- **Materiales:** Stock de seguridad
- **Personal:** Equipos de respaldo

---

## 🎯 CRONOGRAMA DE INTEGRACIÓN

### **12. CRONOGRAMA DETALLADO**

#### **12.1 Fases de Integración**
| Fase | Duración | Actividades Principales | Recursos |
|:-----|:---------|:----------------------|:---------|
| **Fase 1** | 2 meses | Integración civil-eléctrica | 40 operarios |
| **Fase 2** | 2 meses | Integración eléctrica-mecánica | 40 operarios |
| **Fase 3** | 2 meses | Integración mecánica-sistemas | 40 operarios |
| **Fase 4** | 1 mes | Integración de sistemas de datos | 20 operarios |
| **Fase 5** | 1 mes | Integración de monitoreo | 20 operarios |
| **Fase 6** | 1 mes | Integración de control | 20 operarios |

#### **12.2 Hitos Principales**
- **Mes 2:** Terminación integración civil-eléctrica
- **Mes 4:** Terminación integración eléctrica-mecánica
- **Mes 6:** Terminación integración mecánica-sistemas
- **Mes 7:** Terminación integración de sistemas de datos
- **Mes 8:** Terminación integración de monitoreo
- **Mes 9:** Terminación integración de control

---

## ✅ CRITERIOS DE ACEPTACIÓN

### **13. CRITERIOS TÉCNICOS**

#### **13.1 Integración Civil-Eléctrica**
- **Interfaces:** 100% funcionales
- **Canalizaciones:** 100% instaladas
- **Bases de equipos:** 100% instaladas
- **Puesta a tierra:** 100% funcional

#### **13.2 Integración Eléctrica-Mecánica**
- **Alimentación:** 100% funcional
- **Frenado:** 100% funcional
- **HVAC:** 100% funcional
- **Sistemas de respaldo:** 100% funcionales

#### **13.3 Integración Mecánica-Sistemas**
- **Sistemas embarcados:** 100% funcionales
- **Monitoreo:** 100% funcional
- **Diagnóstico:** 100% funcional
- **Comunicaciones:** 100% funcionales

---

## 🎯 PRÓXIMOS PASOS

### **14. ACCIONES INMEDIATAS**

#### **14.1 Esta Semana:**
1. **Aprobar plan** de integración de sistemas
2. **Iniciar licitación** de equipos de integración
3. **Contratar estudios** de integración
4. **Definir proveedores** de materiales

#### **14.2 Próximas 4 Semanas:**
1. **Finalizar especificaciones** de integración
2. **Obtener permisos** necesarios
3. **Contratar personal** especializado
4. **Preparar equipos** de integración

---

**Documento de plan de integración según Metodología Punto 42**  
**Fecha de desarrollo:** 27 de enero de 2025  
**Responsable:** Administrador Contractual EPC  
**Estado:** ✅ **PLAN DE INTEGRACIÓN DE SISTEMAS COMPLETADO**
