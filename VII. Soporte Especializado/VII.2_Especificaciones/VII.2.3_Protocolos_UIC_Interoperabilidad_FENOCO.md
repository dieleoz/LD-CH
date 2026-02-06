# PROTOCOLOS UIC PARA INTEROPERABILIDAD FENOCO
## APP LA DORADA-CHIRIGUANÁ v10.1

**Fecha de elaboración:** 27 de enero de 2025  
**Proyecto:** APP La Dorada - Chiriguaná  
**Contrato:** Concesión No. 001 de 2025  
**Responsable:** Administrador Contractual EPC

---

## 🎯 RESUMEN EJECUTIVO

Este documento establece los **protocolos UIC estándar** para garantizar la interoperabilidad entre el proyecto APP La Dorada-Chiriguaná y la red ferroviaria nacional FENOCO, basados en estándares internacionales UIC para permitir el avance inmediato de la Fase D.

### **Base Técnica:**
- **Estándares UIC:** UIC 920-2, UIC 438, UIC 930, UIC 950
- **Interoperabilidad:** Con red ferroviaria nacional FENOCO
- **Certificación:** UIC e homologación ANI
- **Cobertura:** 178 km con puntos de conexión estratégicos

---

## 🌐 ARQUITECTURA DE INTEROPERABILIDAD

### **1. PUNTOS DE CONEXIÓN CON FENOCO**

#### **1.1 Ubicaciones Estratégicas**
| Ubicación | PK | Tipo de Conexión | Función |
|:----------|:---|:------------------|:---------|
| **La Dorada** | 0+000 | Terminal principal | Conexión red nacional |
| **Puerto Berrío** | 0+450 | Punto intermedio | Acceso regional |
| **Barrancabermeja** | 0+970 | Punto intermedio | Acceso industrial |
| **Chiriguaná** | 1+780 | Terminal secundario | Conexión regional |

#### **1.2 Arquitectura de Interconexión**
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Red FENOCO    │◄──►│   Gateway UIC    │◄──►│   Red APP LDC   │
│   (Nacional)    │    │   (Conversión)   │    │   (Local)       │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Protocolos     │    │   Interfaces    │    │  Protocolos     │
│  FENOCO         │    │   Estándar UIC  │    │  APP LDC        │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 📡 PROTOCOLOS DE COMUNICACIÓN

### **2. TETRA CONFORME UIC 920-2**

#### **2.1 Especificaciones Técnicas**
| Parámetro | Especificación | Estándar |
|:----------|:---------------|:---------|
| **Estándar** | TETRA | UIC 920-2 |
| **Frecuencias** | 900 MHz (uplink/downlink) | UIC 920-2 |
| **Cobertura** | 100% corredor + 20 km FENOCO | UIC 920-2 |
| **Capacidad** | 100 canales simultáneos | UIC 920-2 |
| **Interoperabilidad** | Con red nacional FENOCO | UIC 920-2 |

#### **2.2 Configuración de Red**
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Estación Base │    │   Estación Base │    │   Estación Base │
│   La Dorada     │◄──►│   Puerto Berrío │◄──►│  Barrancabermeja│
│   (TETRA)       │    │   (TETRA)       │    │   (TETRA)       │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Gateway UIC   │    │   Gateway UIC   │    │   Gateway UIC   │
│   FENOCO-APP    │    │   FENOCO-APP    │    │   FENOCO-APP    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

#### **2.3 Funcionalidades de Interoperabilidad**
- **Llamadas de grupo:** Comunicación multi-usuario
- **Llamadas de emergencia:** Prioridad máxima
- **Transmisión de datos:** Información de trenes
- **Handover automático:** Entre redes APP-FENOCO

### **3. ETCS LEVEL 2 CONFORME UIC 438**

#### **3.1 Especificaciones de Interoperabilidad**
| Componente | Especificación | Interoperabilidad |
|:-----------|:---------------|:------------------|
| **Balizas Eurobalise** | UIC 438 estándar | Compatible FENOCO |
| **Radio Block Center** | UIC 438 estándar | Interfaz estándar |
| **Equipos embarcados** | UIC 438 estándar | Certificación UIC |
| **Protocolos de datos** | UIC 438 estándar | Formato estándar |

#### **3.2 Interfaces de Interoperabilidad**
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   RBC FENOCO    │◄──►│   Gateway UIC   │◄──►│   RBC APP LDC   │
│   (Nacional)    │    │   ETCS Bridge   │    │   (Local)       │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Trenes FENOCO  │    │   Eurobalise    │    │  Trenes APP LDC │
│  (ETCS Level 2) │    │   Compartidas   │    │  (ETCS Level 2) │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔗 INTERFACES ESTÁNDAR UIC 950

### **4. ESPECIFICACIONES DE INTERFACES**

#### **4.1 Interfaz CTC-CTC**
| Parámetro | Especificación | Estándar |
|:----------|:---------------|:---------|
| **Protocolo** | TCP/IP | UIC 950 |
| **Velocidad** | 1 Gbps full duplex | UIC 950 |
| **Redundancia** | Enlaces duales | UIC 950 |
| **Seguridad** | VPN con cifrado | UIC 950 |

#### **4.2 Información Intercambiada**
| Tipo de Datos | Frecuencia | Formato | Estándar |
|:---------------|:-----------|:---------|:----------|
| **Posición de tren** | Cada 5 segundos | XML UIC | UIC 950 |
| **Autorización movimiento** | Bajo demanda | XML UIC | UIC 950 |
| **Estado de vía** | Tiempo real | XML UIC | UIC 950 |
| **Emergencias** | Inmediato | XML UIC | UIC 950 |

#### **4.3 Estructura de Datos UIC**
```xml
<?xml version="1.0" encoding="UTF-8"?>
<TrainData xmlns="http://www.uic.org/950">
  <Train>
    <TrainID>APP001</TrainID>
    <Position>
      <Kilometer>45.2</Kilometer>
      <Direction>1</Direction>
    </Position>
    <Speed>80</Speed>
    <MovementAuthority>
      <StartKM>45.2</StartKM>
      <EndKM>52.0</EndKM>
    </MovementAuthority>
  </Train>
</TrainData>
```

---

## 📊 PROTOCOLOS DE INTEROPERABILIDAD UIC 930

### **5. GESTIÓN DE TRÁFICO INTEGRADO**

#### **5.1 Coordinación de Operaciones**
| Función | Protocolo | Estándar | Interoperabilidad |
|:--------|:----------|:---------|:------------------|
| **Planificación horarios** | UIC 930 | Estándar | FENOCO-APP |
| **Control de tráfico** | UIC 930 | Estándar | FENOCO-APP |
| **Gestión de conflictos** | UIC 930 | Estándar | FENOCO-APP |
| **Emergencias** | UIC 930 | Estándar | FENOCO-APP |

#### **5.2 Flujo de Información Integrado**
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Centro Control │    │  Centro Control │    │  Centro Control │
│  FENOCO         │◄──►│  Coordinación   │◄──►│  APP LDC        │
│  (Nacional)     │    │  UIC 930        │    │  (Local)        │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Información   │    │   Coordinación  │    │   Información   │
│   Tráfico       │    │   Centralizada  │    │   Tráfico       │
│   Nacional      │    │   UIC 930       │    │   Local         │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### **6. PROTOCOLOS DE SEGURIDAD**

#### **6.1 Seguridad de Comunicaciones**
| Aspecto | Especificación | Estándar |
|:--------|:---------------|:---------|
| **Cifrado** | AES-256 | UIC 950 |
| **Autenticación** | Certificados digitales | UIC 950 |
| **Integridad** | HMAC-SHA256 | UIC 950 |
| **No repudio** | Firmas digitales | UIC 950 |

#### **6.2 Gestión de Certificados**
- **Autoridad certificadora:** UIC certificada
- **Validez:** 2 años renovables
- **Alcance:** Sistemas críticos únicamente
- **Revocación:** Lista de certificados revocados (CRL)

---

## 🏭 SISTEMAS DE GATEWAY UIC

### **7. ARQUITECTURA DE GATEWAY**

#### **7.1 Especificaciones Técnicas**
| Parámetro | Especificación | Observaciones |
|:----------|:---------------|:--------------|
| **Procesador** | Intel Xeon Gold 6248R | Alta disponibilidad |
| **Memoria** | 128 GB RAM DDR4 | Cache de datos |
| **Almacenamiento** | 2x 1TB SSD RAID1 | Redundancia |
| **Red** | 4x 10 Gbps Ethernet | Alta velocidad |
| **Redundancia** | Sistema dual N+1 | 99.5% disponibilidad |

#### **7.2 Funcionalidades del Gateway**
- **Conversión de protocolos:** FENOCO ↔ APP
- **Traducción de datos:** Formato estándar UIC
- **Gestión de sesiones:** Control de conexiones
- **Monitoreo:** Estado de interoperabilidad
- **Diagnóstico:** Herramientas de troubleshooting

#### **7.3 Ubicaciones de Gateway**
| Ubicación | Función | Redundancia |
|:----------|:---------|:------------|
| **La Dorada** | Gateway principal | Dual |
| **Puerto Berrío** | Gateway secundario | Single |
| **Barrancabermeja** | Gateway secundario | Single |
| **Chiriguaná** | Gateway secundario | Single |

---

## 🧪 PRUEBAS DE INTEROPERABILIDAD

### **8. PROTOCOLO DE PRUEBAS**

#### **8.1 Pruebas de Conectividad**
| Prueba | Objetivo | Criterio | Duración |
|:-------|:---------|:----------|:----------|
| **Ping básico** | Conectividad red | < 10 ms | 1 hora |
| **Transferencia datos** | Ancho de banda | > 100 Mbps | 2 horas |
| **Handover TETRA** | Movilidad | < 2 segundos | 4 horas |
| **Failover gateway** | Redundancia | < 30 segundos | 2 horas |

#### **8.2 Pruebas Funcionales**
| Prueba | Objetivo | Criterio | Duración |
|:-------|:---------|:----------|:----------|
| **Intercambio datos tren** | Interoperabilidad | 100% éxito | 8 horas |
| **Control tráfico integrado** | Coordinación | Sin conflictos | 12 horas |
| **Emergencias** | Respuesta crítica | < 5 segundos | 4 horas |
| **Actualizaciones OTA** | Mantenimiento | Sin interrupciones | 2 horas |

#### **8.3 Pruebas de Carga**
| Prueba | Objetivo | Criterio | Duración |
|:-------|:---------|:----------|:----------|
| **50 trenes simultáneos** | Capacidad máxima | Sin degradación | 4 horas |
| **100 canales TETRA** | Comunicaciones | Sin pérdidas | 2 horas |
| **1000 mensajes/segundo** | Procesamiento | Latencia < 1s | 1 hora |

---

## 📋 CERTIFICACIONES REQUERIDAS

### **9. CERTIFICACIÓN UIC**

#### **9.1 Certificaciones de Sistemas**
| Sistema | Certificación | Estándar | Validez |
|:--------|:--------------|:---------|:--------|
| **TETRA** | UIC 920-2 | UIC 920-2 | 5 años |
| **ETCS Level 2** | UIC 438 | UIC 438 | 5 años |
| **Interfaces** | UIC 950 | UIC 950 | 3 años |
| **Interoperabilidad** | UIC 930 | UIC 930 | 3 años |

#### **9.2 Proceso de Certificación**
1. **Pruebas de conformidad** según estándares UIC
2. **Validación técnica** por organismo certificador
3. **Emisión de certificados** UIC oficiales
4. **Registro en base de datos** UIC internacional

### **10. HOMOLOGACIÓN ANI**

#### **10.1 Requisitos de Homologación**
| Requisito | Especificación | Responsable |
|:----------|:---------------|:------------|
| **Certificación UIC** | Válida y vigente | Proveedor |
| **Pruebas locales** | Conforme normativa colombiana | ANI |
| **Documentación técnica** | Completa y actualizada | EPC |
| **Capacitación operadores** | Personal certificado | EPC |

#### **10.2 Proceso de Homologación**
1. **Solicitud formal** a ANI
2. **Revisión documentación** técnica
3. **Pruebas de campo** en condiciones reales
4. **Emisión homologación** ANI

---

## 📊 MÉTRICAS DE INTEROPERABILIDAD

### **11. INDICADORES DE DESEMPEÑO**

#### **11.1 Métricas Técnicas**
| Métrica | Objetivo | Método de Medición |
|:--------|:---------|:-------------------|
| **Disponibilidad interoperabilidad** | 99.5% | Tiempo operativo vs total |
| **Latencia comunicaciones** | < 1 segundo | Tiempo respuesta end-to-end |
| **Éxito handover** | > 99% | Transiciones exitosas |
| **Disponibilidad gateway** | 99.5% | Tiempo operativo vs total |

#### **11.2 Métricas Operacionales**
| Métrica | Objetivo | Método de Medición |
|:--------|:---------|:-------------------|
| **Puntualidad integrada** | > 95% | Tiempo llegada vs programado |
| **Eficiencia coordinación** | > 90% | Conflictos resueltos |
| **Satisfacción operadores** | > 85% | Encuestas periódicas |
| **Tiempo respuesta emergencias** | < 30 segundos | Tiempo activación |

---

## ⚠️ RIESGOS Y MITIGACIONES

### **12. RIESGOS DE INTEROPERABILIDAD**

#### **12.1 Riesgos Técnicos**
| Riesgo | Probabilidad | Impacto | Mitigación |
|:-------|:------------:|:-------:|:-----------|
| **Incompatibilidad protocolos** | Media | Alto | Certificación UIC previa |
| **Fallas de gateway** | Baja | Alto | Redundancia N+1 |
| **Problemas de sincronización** | Media | Medio | Sistemas de tiempo UTC |
| **Degradación rendimiento** | Baja | Medio | Monitoreo continuo |

#### **12.2 Riesgos Operacionales**
| Riesgo | Probabilidad | Impacto | Mitigación |
|:-------|:------------:|:-------:|:-----------|
| **Conflicto jurisdiccional** | Baja | Alto | Acuerdos contractuales claros |
| **Cambios en FENOCO** | Media | Medio | Interfaces adaptables |
| **Capacitación insuficiente** | Media | Medio | Programa de capacitación |
| **Mantenimiento diferido** | Baja | Alto | Contratos de mantenimiento |

---

## 🎯 PLAN DE IMPLEMENTACIÓN

### **13. CRONOGRAMA DE DESARROLLO**

#### **13.1 Fase 1: Preparación (2-3 semanas)**
- **Semana 1:** Especificaciones técnicas detalladas
- **Semana 2:** Diseño de gateway UIC
- **Semana 3:** Adquisición de equipos certificados

#### **13.2 Fase 2: Implementación (4-6 semanas)**
- **Semanas 1-2:** Instalación gateway principal
- **Semanas 3-4:** Instalación gateway secundarios
- **Semanas 5-6:** Configuración de protocolos

#### **13.3 Fase 3: Pruebas (3-4 semanas)**
- **Semanas 1-2:** Pruebas de conectividad
- **Semanas 3-4:** Pruebas funcionales y de carga

#### **13.4 Fase 4: Certificación (2-3 semanas)**
- **Semanas 1-2:** Certificación UIC
- **Semana 3:** Homologación ANI

---

## 📋 RECURSOS REQUERIDOS

### **14. PERSONAL TÉCNICO**

#### **14.1 Especialistas Requeridos**
| Especialidad | Cantidad | Duración | Responsabilidades |
|:-------------|:--------:|:--------:|:------------------|
| **Ingenieros TETRA** | 3 | 12 semanas | Implementación y pruebas |
| **Ingenieros ETCS** | 2 | 10 semanas | Sistemas de señalización |
| **Especialistas UIC** | 2 | 8 semanas | Certificaciones |
| **Técnicos gateway** | 4 | 12 semanas | Instalación y configuración |

#### **14.2 Equipamiento Especializado**
- **Equipos de prueba** TETRA y ETCS
- **Herramientas de certificación** UIC
- **Software de simulación** de interoperabilidad
- **Equipos de medición** y diagnóstico

---

## ✅ CRITERIOS DE ACEPTACIÓN

### **15. CRITERIOS TÉCNICOS**

#### **15.1 Interoperabilidad**
- ✅ **Conectividad:** 100% entre redes APP-FENOCO
- ✅ **Protocolos:** Conformes UIC 920-2, 438, 930, 950
- ✅ **Certificación:** UIC válida y vigente
- ✅ **Homologación:** ANI aprobada

#### **15.2 Rendimiento**
- ✅ **Latencia:** < 1 segundo end-to-end
- ✅ **Disponibilidad:** > 99.5%
- ✅ **Capacidad:** 50 trenes simultáneos
- ✅ **Handover:** < 2 segundos

---

## 🎯 PRÓXIMOS PASOS

### **16. ACCIONES INMEDIATAS**

#### **16.1 Esta Semana:**
1. **Aprobar protocolos** UIC para interoperabilidad
2. **Solicitar cotizaciones** de gateway UIC
3. **Contactar FENOCO** para coordinación
4. **Iniciar proceso** de certificación UIC

#### **16.2 Próximas 4 Semanas:**
1. **Finalizar especificaciones** técnicas detalladas
2. **Adquirir equipos** certificados UIC
3. **Iniciar implementación** de gateway
4. **Preparar pruebas** de interoperabilidad

---

## ✅ CONCLUSIONES

### **17. BENEFICIOS DE LA INTEROPERABILIDAD**

#### **17.1 Beneficios Técnicos:**
- **Conectividad total:** Integración con red nacional
- **Estándares internacionales:** Cumplimiento UIC
- **Redundancia:** Sistemas de respaldo
- **Escalabilidad:** Crecimiento futuro

#### **17.2 Beneficios Operacionales:**
- **Coordinación:** Gestión integrada de tráfico
- **Eficiencia:** Optimización de recursos
- **Seguridad:** Protocolos de emergencia
- **Mantenimiento:** Gestión centralizada

---

**Documento de protocolos según Metodología Punto 42**  
**Fecha de elaboración:** 27 de enero de 2025  
**Responsable:** Administrador Contractual EPC  
**Estado:** ✅ **PROTOCOLOS UIC COMPLETADOS - LISTO PARA IMPLEMENTACIÓN**
