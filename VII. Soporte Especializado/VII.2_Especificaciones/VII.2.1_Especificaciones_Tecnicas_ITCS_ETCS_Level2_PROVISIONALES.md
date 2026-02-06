# ESPECIFICACIONES TÉCNICAS ITCS ETCS Level 2 - PROVISIONALES
## APP LA DORADA-CHIRIGUANÁ v10.1

**Fecha de elaboración:** 27 de enero de 2025  
**Proyecto:** APP La Dorada - Chiriguaná  
**Contrato:** Concesión No. 001 de 2025  
**Responsable:** Administrador Contractual EPC

---

## 🎯 RESUMEN EJECUTIVO

Este documento establece las **especificaciones técnicas provisionales** para el sistema ITCS ETCS Level 2 del proyecto APP La Dorada-Chiriguaná, basadas en estándares internacionales UIC y EN para permitir el avance inmediato de la Fase D.

### **Base Técnica:**
- **Estándar:** UIC 438 (ETCS Level 2)
- **Normas:** EN 50126/50128/50129 (SIL 4)
- **Protocolo:** TETRA conforme UIC 920-2
- **Cobertura:** 178 km La Dorada-Chiriguaná

---

## 🚂 ESPECIFICACIONES TÉCNICAS ITCS ETCS Level 2

### **1. ARQUITECTURA DEL SISTEMA**

#### **1.1 Componentes Principales**
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Radio Block   │    │    Balizas      │    │   Equipos       │
│   Center (RBC)  │◄──►│   Eurobalise    │◄──►│   Embarcados    │
│                 │    │                 │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Red TETRA     │    │   Infraestructura│   │   Interfaces    │
│   (UIC 920-2)   │    │   Terrestre     │    │   CTC/Sistemas  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

#### **1.2 Características Técnicas**
| Parámetro | Especificación | Estándar |
|:----------|:---------------|:---------|
| **Nivel ETCS** | Level 2 | UIC 438 |
| **Comunicación** | TETRA + Eurobalise | UIC 920-2 |
| **Redundancia** | N+1 | EN 50126 |
| **SIL** | SIL 4 | EN 50128 |
| **Cobertura** | 178 km | Corredor completo |
| **Velocidad máxima** | 120 km/h | Diseño del corredor |

---

## 📡 ESPECIFICACIONES DE INFRAESTRUCTURA TERRESTRE

### **2.1 Radio Block Center (RBC)**

#### **Especificaciones Técnicas:**
- **Ubicación:** Centro de Control La Dorada
- **Capacidad:** 50 trenes simultáneos
- **Redundancia:** Sistema dual con conmutación automática
- **Comunicaciones:** TETRA según UIC 920-2
- **Interfaces:** CTC, TETRA, Fibra Óptica

#### **Equipamiento:**
| Componente | Especificación | Cantidad |
|:-----------|:---------------|:--------:|
| **Servidores RBC** | Dell PowerEdge R750 | 4 unidades |
| **Switches de red** | Cisco Catalyst 9300 | 6 unidades |
| **UPS** | APC Smart-UPS 5000VA | 4 unidades |
| **Aire acondicionado** | Precision cooling | 2 unidades |

### **2.2 Balizas Eurobalise**

#### **Especificaciones Técnicas:**
- **Tipo:** Balizas pasivas estándar UIC
- **Frecuencia:** 27.095 MHz
- **Potencia:** 2 W (transmisión)
- **Distancia:** Cada 500m en vía principal
- **Cantidad total:** 356 balizas

#### **Distribución por Tramo:**
| Tramo | Longitud | Balizas | Ubicación |
|:------|:---------|:--------:|:----------|
| **La Dorada - Puerto Berrío** | 45 km | 90 | Vía principal |
| **Puerto Berrío - Barrancabermeja** | 52 km | 104 | Vía principal |
| **Barrancabermeja - Bucaramanga** | 38 km | 76 | Vía principal |
| **Bucaramanga - Chiriguaná** | 43 km | 86 | Vía principal |

### **2.3 Red TETRA**

#### **Especificaciones Técnicas:**
- **Estándar:** UIC 920-2 (TETRA)
- **Frecuencias:** 900 MHz (uplink/downlink)
- **Cobertura:** 100% del corredor
- **Capacidad:** 100 canales simultáneos
- **Redundancia:** N+1 con conmutación automática

#### **Infraestructura:**
| Componente | Especificación | Cantidad |
|:-----------|:---------------|:--------:|
| **Estaciones base** | Ericsson RBS 6000 | 8 estaciones |
| **Antenas** | Sectoriales 900 MHz | 24 antenas |
| **Repetidores** | TETRA específicos | 4 repetidores |
| **Cableado** | Fibra óptica | 178 km |

---

## 🚃 ESPECIFICACIONES DE EQUIPOS EMBARCADOS

### **3.1 Unidad de Control de Tren (TCR)**

#### **Especificaciones Técnicas:**
- **Estándar:** UIC 438 (ETCS Level 2)
- **SIL:** SIL 4 conforme EN 50128
- **Interfaces:** Eurobalise, TETRA, CTC
- **Redundancia:** Sistema dual

#### **Componentes:**
| Componente | Especificación | Cantidad |
|:-----------|:---------------|:--------:|
| **Computadora principal** | Siemens S7-400 | 2 unidades |
| **Módulo TETRA** | Siemens TETRA | 2 unidades |
| **Antena Eurobalise** | UIC estándar | 4 antenas |
| **Pantalla de conductor** | TFT 12" | 2 pantallas |
| **UPS embarcado** | 24V DC | 2 unidades |

### **3.2 Software Embarcado**

#### **Especificaciones Técnicas:**
- **Estándar:** EN 50128 (SIL 4)
- **Funcionalidades:** Control de velocidad, Autorización de movimiento, Vigilancia de tren
- **Interfaces:** CTC, Eurobalise, TETRA
- **Actualización:** Over-the-air (OTA)

#### **Módulos de Software:**
| Módulo | Función | SIL | Estándar |
|:-------|:---------|:---:|:---------|
| **STM** | Supervisión de tren | SIL 4 | UIC 438 |
| **DMI** | Interfaz conductor | SIL 3 | EN 50128 |
| **RBC Interface** | Comunicación RBC | SIL 4 | UIC 920-2 |
| **Eurobalise** | Lectura balizas | SIL 4 | UIC 438 |

---

## 🔗 ESPECIFICACIONES DE INTERFACES

### **4.1 Interfaz CTC-ITCS**

#### **Protocolo de Comunicación:**
- **Estándar:** UIC 950 (Interfaces estándar)
- **Protocolo:** TCP/IP sobre fibra óptica
- **Velocidad:** 1 Gbps full duplex
- **Redundancia:** Enlaces duales

#### **Información Intercambiada:**
| Tipo | Descripción | Frecuencia |
|:-----|:------------|:-----------|
| **Posición de tren** | PK, velocidad, dirección | Cada 5 segundos |
| **Autorización** | MA (Movement Authority) | Bajo demanda |
| **Estado de vía** | Ocupación, señales | Tiempo real |
| **Emergencias** | Alarms, fallos | Inmediato |

### **4.2 Interfaz TETRA-ITCS**

#### **Esunicaciones de Emergencia:**
- **Protocolo:** TETRA con ITCS
- **Funcionalidad:** Comunicación voz/datos en emergencias
- **Redundancia:** Backup para TETRA
- **Cobertura:** 100% del corredor

---

## 🧪 ESPECIFICACIONES DE PRUEBAS

### **5.1 Pruebas FAT (Factory Acceptance Test)**

#### **Pruebas de Equipos:**
| Equipo | Prueba | Criterio | Duración |
|:-------|:-------|:----------|:----------|
| **RBC** | Funcionalidad completa | 100% casos de prueba | 2 semanas |
| **TCR** | Comportamiento SIL 4 | EN 50128 | 1 semana |
| **Eurobalise** | Transmisión/recepción | UIC 438 | 3 días |
| **TETRA** | Comunicación RBC-Tren | UIC 920-2 | 1 semana |

### **5.2 Pruebas SAT (Site Acceptance Test)**

#### **Pruebas de Integración:**
| Sistema | Prueba | Criterio | Duración |
|:--------|:-------|:----------|:----------|
| **ITCS-CTC** | Interfaz completa | 100% funcional | 2 semanas |
| **ITCS-TETRA** | Comunicaciones | Cobertura 100% | 1 semana |
| **End-to-End** | Operación completa | SIL 4 | 3 semanas |

---

## 📋 PLAN DE IMPLEMENTACIÓN

### **6.1 Cronograma de Implementación**

#### **Fase 1: Infraestructura Terrestre (8 semanas)**
- **Semanas 1-2:** Instalación RBC y equipamiento
- **Semanas 3-4:** Instalación estaciones base TETRA
- **Semanas 5-6:** Instalación balizas Eurobalise
- **Semanas 7-8:** Cableado y conexiones

#### **Fase 2: Equipos Embarcados (6 semanas)**
- **Semanas 1-2:** Instalación TCR en material rodante
- **Semanas 3-4:** Configuración software embarcado
- **Semanas 5-6:** Pruebas FAT de equipos embarcados

#### **Fase 3: Integración y Pruebas (8 semanas)**
- **Semanas 1-2:** Integración ITCS-CTC
- **Semanas 3-4:** Pruebas SAT de interfaces
- **Semanas 5-6:** Pruebas end-to-end
- **Semanas 7-8:** Validación final y comisionamiento

### **6.2 Recursos Requeridos**

#### **Personal Técnico:**
| Especialidad | Cantidad | Duración |
|:-------------|:--------:|:--------:|
| **Ingenieros ITCS** | 4 | 22 semanas |
| **Técnicos TETRA** | 6 | 16 semanas |
| **Técnicos embarcados** | 4 | 14 semanas |
| **Especialistas pruebas** | 3 | 8 semanas |

#### **Equipamiento y Herramientas:**
- **Equipos de prueba** TETRA y ETCS
- **Herramientas de diagnóstico** especializadas
- **Software de simulación** y pruebas
- **Equipos de medición** y calibración

---

## ⚠️ RIESGOS Y MITIGACIONES

### **Riesgos Técnicos:**
| Riesgo | Probabilidad | Impacto | Mitigación |
|:-------|:------------:|:-------:|:-----------|
| **Incompatibilidad equipos** | Media | Alto | Certificación UIC previa |
| **Fallas TETRA** | Baja | Alto | Redundancia N+1 |
| **Problemas integración CTC** | Media | Medio | Interfaces estándar UIC |
| **Retrasos en pruebas** | Media | Medio | Cronograma con reservas |

### **Plan de Contingencia:**
1. **Si ITCS Level 2 falla:** Implementar ETCS Level 1 como respaldo
2. **Si TETRA falla:** Usar TETRA como sistema de respaldo
3. **Si integración falla:** Operación manual con supervisión CTC

---

## ✅ CRITERIOS DE ACEPTACIÓN

### **Criterios Técnicos:**
- ✅ **Funcionalidad:** 100% de casos de prueba aprobados
- ✅ **Disponibilidad:** 99.5% (conforme AT4)
- ✅ **SIL:** Nivel 4 conforme EN 50128
- ✅ **Interoperabilidad:** Certificación UIC

### **Criterios Operacionales:**
- ✅ **Velocidad:** Control hasta 120 km/h
- ✅ **Capacidad:** 50 trenes simultáneos
- ✅ **Cobertura:** 100% del corredor
- ✅ **Tiempo de respuesta:** < 1 segundo

---

## 📊 MÉTRICAS DE SEGUIMIENTO

### **Métricas Técnicas:**
| Métrica | Objetivo | Frecuencia | Responsable |
|:--------|:---------|:-----------|:------------|
| **Disponibilidad ITCS** | 99.5% | Diaria | Ing. Sistemas |
| **Tiempo respuesta RBC** | < 1 seg | Continua | Ing. ITCS |
| **Cobertura TETRA** | 100% | Semanal | Ing. Telecom |
| **Disponibilidad embarcados** | 99.9% | Diaria | Ing. Embarcados |

---

## 🎯 PRÓXIMOS PASOS

### **Acción Inmediata (Esta semana):**
1. **Aprobar especificaciones** provisionales
2. **Solicitar cotizaciones** de equipos principales
3. **Definir proveedores** certificados UIC
4. **Iniciar diseño detallado** de instalaciones

### **Seguimiento (Próximas 4 semanas):**
1. **Finalizar especificaciones** detalladas
2. **Obtener aprobación** técnica de ANI
3. **Iniciar proceso** de adquisición
4. **Preparar instalaciones** terrestres

---

**Documento de especificaciones según Metodología Punto 42**  
**Fecha de elaboración:** 27 de enero de 2025  
**Responsable:** Administrador Contractual EPC  
**Estado:** ✅ **ESPECIFICACIONES PROVISIONALES COMPLETADAS - LISTO PARA APROBACIÓN**
