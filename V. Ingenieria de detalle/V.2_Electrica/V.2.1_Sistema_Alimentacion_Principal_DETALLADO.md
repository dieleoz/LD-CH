# INGENIERÍA ELÉCTRICA DE DETALLE - SISTEMA DE ALIMENTACIÓN PRINCIPAL
## APP LA DORADA-CHIRIGUANÁ v10.1

**Fecha de desarrollo:** 27 de enero de 2025  
**Proyecto:** APP La Dorada - Chiriguaná  
**Contrato:** Concesión No. 001 de 2025  
**Responsable:** Administrador Contractual EPC

---

## 🎯 RESUMEN EJECUTIVO

Este documento presenta la **ingeniería eléctrica de detalle** para el sistema de alimentación principal del proyecto APP La Dorada-Chiriguaná, desarrollada para la construcción real de los sistemas eléctricos del corredor ferroviario de 178 km.

### **Base Técnica:**
- **Longitud total:** 178 km La Dorada-Chiriguaná
- **Tensión de tracción:** 25 kV AC, 50 Hz
- **Tensión auxiliar:** 13.8 kV, 480V, 220V, 110V
- **Estándares:** IEC, IEEE, NTC 2050, RETIE

---

## ⚡ SISTEMA DE ALIMENTACIÓN PRINCIPAL

### **1. SUBESTACIONES DE TRACCIÓN**

#### **1.1 Subestación La Dorada (Principal)**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Transformador principal** | 63 MVA, 230/25 kV | 2 unidades | Redundancia N+1 |
| **Interruptor 230 kV** | SF6, 40 kA | 2 unidades | Entrada principal |
| **Interruptor 25 kV** | SF6, 25 kA | 8 unidades | Salidas de tracción |
| **Interruptor 13.8 kV** | SF6, 12.5 kA | 6 unidades | Servicios auxiliares |
| **UPS** | 100 kVA, 30 min | 2 unidades | Redundancia |
| **Generador emergencia** | 500 kVA, diesel | 2 unidades | Redundancia |

#### **1.2 Subestación Puerto Berrío (Intermedia)**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Transformador principal** | 40 MVA, 230/25 kV | 2 unidades | Redundancia N+1 |
| **Interruptor 230 kV** | SF6, 40 kA | 2 unidades | Entrada principal |
| **Interruptor 25 kV** | SF6, 25 kA | 6 unidades | Salidas de tracción |
| **Interruptor 13.8 kV** | SF6, 12.5 kA | 4 unidades | Servicios auxiliares |
| **UPS** | 75 kVA, 30 min | 2 unidades | Redundancia |
| **Generador emergencia** | 350 kVA, diesel | 2 unidades | Redundancia |

#### **1.3 Subestación Barrancabermeja (Intermedia)**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Transformador principal** | 40 MVA, 230/25 kV | 2 unidades | Redundancia N+1 |
| **Interruptor 230 kV** | SF6, 40 kA | 2 unidades | Entrada principal |
| **Interruptor 25 kV** | SF6, 25 kA | 6 unidades | Salidas de tracción |
| **Interruptor 13.8 kV** | SF6, 12.5 kA | 4 unidades | Servicios auxiliares |
| **UPS** | 75 kVA, 30 min | 2 unidades | Redundancia |
| **Generador emergencia** | 350 kVA, diesel | 2 unidades | Redundancia |

#### **1.4 Subestación Chiriguaná (Terminal)**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Transformador principal** | 50 MVA, 230/25 kV | 2 unidades | Redundancia N+1 |
| **Interruptor 230 kV** | SF6, 40 kA | 2 unidades | Entrada principal |
| **Interruptor 25 kV** | SF6, 25 kA | 8 unidades | Salidas de tracción |
| **Interruptor 13.8 kV** | SF6, 12.5 kA | 6 unidades | Servicios auxiliares |
| **UPS** | 100 kVA, 30 min | 2 unidades | Redundancia |
| **Generador emergencia** | 450 kVA, diesel | 2 unidades | Redundancia |

---

## 🔌 SISTEMA DE DISTRIBUCIÓN 25 KV

### **2. CATENARIA Y ALIMENTACIÓN**

#### **2.1 Sistema de Catenaria**
| Parámetro | Especificación | Observaciones |
|:----------|:---------------|:--------------|
| **Tensión nominal** | 25 kV AC, 50 Hz | Sistema estándar |
| **Cable de contacto** | Cobre 120 mm² | Conductor principal |
| **Cable portador** | Acero-aluminio 240 mm² | Soporte mecánico |
| **Postes** | Concreto pretensado 15m | Cada 60m promedio |
| **Aisladores** | Porcelana, 25 kV | Aislación principal |

#### **2.2 Seccionadores y Protecciones**
| Ubicación | Tipo | Cantidad | Función |
|:----------|:-----|:--------:|:--------|
| **Cada 10 km** | Seccionador 25 kV | 18 unidades | Seccionamiento |
| **Cada 5 km** | Interruptor 25 kV | 36 unidades | Protección |
| **Cada 2 km** | Fusible 25 kV | 89 unidades | Protección secundaria |
| **Cada estación** | Interruptor principal | 8 unidades | Protección estación |

#### **2.3 Sistema de Puesta a Tierra**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Electrodo principal** | Varilla cobre 3m | 356 unidades | Cada 500m |
| **Cable de tierra** | Cobre 70 mm² | 178 km | A lo largo de vía |
| **Conectores** | Cobre forjado | 712 unidades | Conexiones |
| **Resistencia** | < 10 ohmios | - | Medición cada 1km |

---

## 🏭 SISTEMA DE DISTRIBUCIÓN 13.8 KV

### **3. SERVICIOS AUXILIARES**

#### **3.1 Líneas de Distribución 13.8 kV**
| Tramo | Longitud | Carga (kW) | Conductor | Observaciones |
|:------|:---------|:----------:|:----------|:--------------|
| **La Dorada - Puerto Berrío** | 45 km | 850 | ACSR 4/0 | Servicios auxiliares |
| **Puerto Berrío - Barrancabermeja** | 52 km | 920 | ACSR 4/0 | Servicios auxiliares |
| **Barrancabermeja - Bucaramanga** | 38 km | 680 | ACSR 4/0 | Servicios auxiliares |
| **Bucaramanga - Chiriguaná** | 43 km | 750 | ACSR 4/0 | Servicios auxiliares |

#### **3.2 Subestaciones de Distribución**
| Ubicación | Capacidad | Carga (kW) | Transformadores | Observaciones |
|:----------|:----------|:----------:|:---------------|:--------------|
| **PK 15+200** | 500 kVA | 420 | 13.8/0.48 kV | Servicios locales |
| **PK 35+400** | 500 kVA | 380 | 13.8/0.48 kV | Servicios locales |
| **PK 55+600** | 630 kVA | 450 | 13.8/0.48 kV | Servicios locales |
| **PK 75+800** | 500 kVA | 420 | 13.8/0.48 kV | Servicios locales |
| **PK 95+200** | 630 kVA | 480 | 13.8/0.48 kV | Servicios locales |
| **PK 115+400** | 500 kVA | 380 | 13.8/0.48 kV | Servicios locales |
| **PK 135+600** | 630 kVA | 450 | 13.8/0.48 kV | Servicios locales |
| **PK 155+800** | 500 kVA | 420 | 13.8/0.48 kV | Servicios locales |

---

## 🔋 SISTEMAS UPS Y RESPALDO

### **4. SISTEMAS DE RESPALDO**

#### **4.1 UPS por Ubicación**
| Ubicación | Capacidad | Autonomía | Tipo | Observaciones |
|:----------|:----------|:----------|:-----|:--------------|
| **La Dorada** | 100 kVA | 30 min | Online | Cargas críticas |
| **Puerto Berrío** | 75 kVA | 30 min | Online | Cargas críticas |
| **Barrancabermeja** | 75 kVA | 30 min | Online | Cargas críticas |
| **Chiriguaná** | 100 kVA | 30 min | Online | Cargas críticas |
| **PK 15+200** | 25 kVA | 15 min | Online | Señales críticas |
| **PK 35+400** | 25 kVA | 15 min | Online | Señales críticas |
| **PK 55+600** | 25 kVA | 15 min | Online | Señales críticas |
| **PK 75+800** | 25 kVA | 15 min | Online | Señales críticas |

#### **4.2 Bancos de Baterías**
| Ubicación | Capacidad | Voltaje | Autonomía | Tipo |
|:----------|:----------|:---------|:----------|:-----|
| **La Dorada** | 500 Ah | 480V DC | 30 min | Plomo-ácido |
| **Puerto Berrío** | 400 Ah | 480V DC | 30 min | Plomo-ácido |
| **Barrancabermeja** | 400 Ah | 480V DC | 30 min | Plomo-ácido |
| **Chiriguaná** | 500 Ah | 480V DC | 30 min | Plomo-ácido |

#### **4.3 Generadores de Emergencia**
| Ubicación | Potencia | Combustible | Autonomía | Observaciones |
|:----------|:---------|:------------|:----------|:--------------|
| **La Dorada** | 500 kVA | Diesel | 8 horas | Automático |
| **Puerto Berrío** | 350 kVA | Diesel | 8 horas | Automático |
| **Barrancabermeja** | 350 kVA | Diesel | 8 horas | Automático |
| **Chiriguaná** | 450 kVA | Diesel | 8 horas | Automático |

---

## 🛡️ SISTEMAS DE PROTECCIÓN

### **5. PROTECCIONES ELÉCTRICAS**

#### **5.1 Protecciones de Tracción 25 kV**
| Tipo | Ubicación | Ajuste | Función | Observaciones |
|:-----|:----------|:-------|:---------|:--------------|
| **Sobrecorriente** | Cada interruptor | 125% In | Protección térmica | Relé digital |
| **Diferencial** | Cada sección | 20% In | Protección diferencial | Relé digital |
| **Distancia** | Cada 10 km | Zona 1,2,3 | Protección de distancia | Relé digital |
| **Sobretensión** | Cada sección | 110% Vn | Protección sobretensión | Relé digital |

#### **5.2 Protecciones de Distribución 13.8 kV**
| Tipo | Ubicación | Ajuste | Función | Observaciones |
|:-----|:----------|:-------|:---------|:--------------|
| **Sobrecorriente** | Cada interruptor | 125% In | Protección térmica | Relé digital |
| **Diferencial** | Cada transformador | 20% In | Protección diferencial | Relé digital |
| **Sobretensión** | Cada barra | 110% Vn | Protección sobretensión | Relé digital |
| **Substensión** | Cada barra | 85% Vn | Protección substensión | Relé digital |

#### **5.3 Protecciones de Baja Tensión**
| Tipo | Ubicación | Ajuste | Función | Observaciones |
|:-----|:----------|:-------|:---------|:--------------|
| **Interruptor diferencial** | Cada tablero | 30 mA | Protección personas | Tipo A |
| **Interruptor magnetotérmico** | Cada circuito | 125% In | Protección térmica | Tipo B |
| **Sobretensión** | Cada tablero | 110% Vn | Protección sobretensión | Varistor |
| **Substensión** | Cada tablero | 85% Vn | Protección substensión | Relé |

---

## 📊 TABLEROS DE DISTRIBUCIÓN

### **6. TABLEROS PRINCIPALES**

#### **6.1 Tableros de Tracción 25 kV**
| Ubicación | Tipo | Cantidad | Observaciones |
|:----------|:-----|:--------:|:--------------|
| **La Dorada** | Tablero principal | 1 | 8 salidas |
| **Puerto Berrío** | Tablero principal | 1 | 6 salidas |
| **Barrancabermeja** | Tablero principal | 1 | 6 salidas |
| **Chiriguaná** | Tablero principal | 1 | 8 salidas |

#### **6.2 Tableros de Distribución 13.8 kV**
| Ubicación | Tipo | Cantidad | Observaciones |
|:----------|:-----|:--------:|:--------------|
| **La Dorada** | Tablero distribución | 1 | 6 salidas |
| **Puerto Berrío** | Tablero distribución | 1 | 4 salidas |
| **Barrancabermeja** | Tablero distribución | 1 | 4 salidas |
| **Chiriguaná** | Tablero distribución | 1 | 6 salidas |

#### **6.3 Tableros de Baja Tensión 480V**
| Ubicación | Tipo | Cantidad | Observaciones |
|:----------|:-----|:--------:|:--------------|
| **La Dorada** | Tablero principal | 1 | 20 salidas |
| **Puerto Berrío** | Tablero principal | 1 | 16 salidas |
| **Barrancabermeja** | Tablero principal | 1 | 16 salidas |
| **Chiriguaná** | Tablero principal | 1 | 20 salidas |
| **Cada estación** | Tablero local | 8 | 12 salidas c/u |

---

## 🔌 INSTALACIONES DE BAJA TENSIÓN

### **7. SISTEMAS DE BAJA TENSIÓN**

#### **7.1 Distribución 480V**
| Ubicación | Carga (kW) | Conductor | Observaciones |
|:----------|:----------:|:----------|:--------------|
| **La Dorada** | 420 | 3x500 MCM | Cargas principales |
| **Puerto Berrío** | 380 | 3x400 MCM | Cargas principales |
| **Barrancabermeja** | 380 | 3x400 MCM | Cargas principales |
| **Chiriguaná** | 420 | 3x500 MCM | Cargas principales |

#### **7.2 Distribución 220V**
| Ubicación | Carga (kW) | Conductor | Observaciones |
|:----------|:----------:|:----------|:--------------|
| **Cada estación** | 50 | 3x4 AWG | Servicios generales |
| **Cada paso a nivel** | 15 | 3x8 AWG | Señales y barreras |
| **Cada señal** | 5 | 3x12 AWG | Iluminación y control |

#### **7.3 Distribución 110V**
| Ubicación | Carga (kW) | Conductor | Observaciones |
|:----------|:----------:|:----------|:--------------|
| **Cada estación** | 25 | 2x6 AWG | Servicios auxiliares |
| **Cada paso a nivel** | 8 | 2x10 AWG | Control y monitoreo |
| **Cada señal** | 3 | 2x12 AWG | Control local |

---

## 🌐 SISTEMA DE COMUNICACIONES ELÉCTRICAS

### **8. COMUNICACIONES Y CONTROL**

#### **8.1 Sistema SCADA**
| Componente | Ubicación | Función | Observaciones |
|:-----------|:----------|:---------|:--------------|
| **Servidor principal** | La Dorada | Control central | Redundancia N+1 |
| **Servidor secundario** | Chiriguaná | Control local | Redundancia N+1 |
| **RTU** | Cada subestación | Adquisición datos | 8 unidades |
| **RTU** | Cada estación | Adquisición datos | 8 unidades |

#### **8.2 Red de Comunicaciones**
| Tipo | Ubicación | Velocidad | Observaciones |
|:-----|:----------|:----------|:--------------|
| **Fibra óptica** | A lo largo de vía | 1 Gbps | Comunicaciones principales |
| **Radio** | Cada 10 km | 100 Mbps | Comunicaciones de respaldo |
| **Ethernet** | Cada subestación | 100 Mbps | Comunicaciones locales |
| **RS485** | Cada RTU | 9.6 kbps | Comunicaciones de campo |

---

## 📋 ESPECIFICACIONES DE CONSTRUCCIÓN

### **9. PROCEDIMIENTOS CONSTRUCTIVOS**

#### **9.1 Secuencia de Instalación**
1. **Fase 1:** Instalación de subestaciones (4 meses)
2. **Fase 2:** Instalación de catenaria (6 meses)
3. **Fase 3:** Instalación de distribución 13.8 kV (3 meses)
4. **Fase 4:** Instalación de baja tensión (2 meses)
5. **Fase 5:** Pruebas y comisionamiento (1 mes)

#### **9.2 Control de Calidad**
- **Pruebas de aislamiento:** Cada cable instalado
- **Pruebas de continuidad:** Cada circuito
- **Pruebas de puesta a tierra:** Cada electrodo
- **Pruebas de funcionamiento:** Cada equipo
- **Pruebas de coordinación:** Cada sistema de protección

#### **9.3 Seguridad y Medio Ambiente**
- **Plan de seguridad:** Conforme RETIE
- **Plan ambiental:** Conforme ley 99/1993
- **Manejo de residuos:** Clasificación y disposición
- **Control de emisiones:** Monitoreo continuo

---

## 📊 CANTIDADES Y PRESUPUESTO

### **10. CANTIDADES PRINCIPALES**

#### **10.1 Equipos Principales**
- **Transformadores 230/25 kV:** 8 unidades
- **Interruptores 230 kV:** 8 unidades
- **Interruptores 25 kV:** 28 unidades
- **Interruptores 13.8 kV:** 20 unidades
- **UPS:** 16 unidades
- **Generadores:** 8 unidades

#### **10.2 Cables y Conductores**
- **Cable 25 kV:** 356 km
- **Cable 13.8 kV:** 178 km
- **Cable 480V:** 89 km
- **Cable 220V:** 267 km
- **Cable 110V:** 356 km
- **Cable de tierra:** 356 km

#### **10.3 Estructuras y Soportería**
- **Postes catenaria:** 2,967 unidades
- **Postes distribución:** 1,483 unidades
- **Tableros principales:** 20 unidades
- **Tableros secundarios:** 80 unidades

### **11. PRESUPUESTO ESTIMADO**

#### **11.1 Costos por Rubro**
| Rubro | Costo (COP) | % del Total |
|:------|:------------|:------------|
| **Subestaciones** | $45,000 M | 40% |
| **Catenaria** | $25,000 M | 22% |
| **Distribución 13.8 kV** | $18,000 M | 16% |
| **Baja tensión** | $15,000 M | 13% |
| **Comunicaciones** | $8,000 M | 7% |
| **Pruebas** | $2,000 M | 2% |
| **TOTAL** | **$113,000 M** | **100%** |

---

## ⚠️ RIESGOS Y MITIGACIONES

### **12. RIESGOS ELÉCTRICOS**

#### **12.1 Riesgos Identificados**
| Riesgo | Probabilidad | Impacto | Mitigación |
|:-------|:------------:|:-------:|:-----------|
| **Fallas de suministro** | Media | Alto | Redundancia N+1 |
| **Sobrecargas** | Baja | Medio | Protecciones adecuadas |
| **Cortocircuitos** | Baja | Alto | Coordinación protecciones |
| **Acceso a materiales** | Media | Medio | Contratos anticipados |

#### **12.2 Plan de Contingencia**
- **Reservas:** 15% del presupuesto
- **Cronograma:** 20% de holgura
- **Materiales:** Stock de seguridad
- **Personal:** Equipos de respaldo

---

## 🎯 CRONOGRAMA DE EJECUCIÓN

### **13. CRONOGRAMA DETALLADO**

#### **13.1 Fases de Instalación**
| Fase | Duración | Actividades Principales | Recursos |
|:-----|:---------|:----------------------|:---------|
| **Fase 1** | 4 meses | Subestaciones | 80 operarios |
| **Fase 2** | 6 meses | Catenaria | 120 operarios |
| **Fase 3** | 3 meses | Distribución 13.8 kV | 60 operarios |
| **Fase 4** | 2 meses | Baja tensión | 40 operarios |
| **Fase 5** | 1 mes | Pruebas y comisionamiento | 20 operarios |

#### **13.2 Hitos Principales**
- **Mes 4:** Terminación subestaciones
- **Mes 10:** Terminación catenaria
- **Mes 13:** Terminación distribución 13.8 kV
- **Mes 15:** Terminación baja tensión
- **Mes 16:** Terminación total proyecto

---

## ✅ CRITERIOS DE ACEPTACIÓN

### **14. CRITERIOS TÉCNICOS**

#### **14.1 Subestaciones**
- **Disponibilidad:** 99.95%
- **Eficiencia:** > 95%
- **Protecciones:** Funcionales 100%
- **Comunicaciones:** Funcionales 100%

#### **14.2 Catenaria**
- **Tensión:** 25 kV ±5%
- **Frecuencia:** 50 Hz ±1%
- **Continuidad:** 100%
- **Aislación:** > 25 kV

#### **14.3 Distribución**
- **Tensión:** 13.8 kV ±5%
- **Continuidad:** 100%
- **Protecciones:** Funcionales 100%
- **Comunicaciones:** Funcionales 100%

---

## 🎯 PRÓXIMOS PASOS

### **15. ACCIONES INMEDIATAS**

#### **15.1 Esta Semana:**
1. **Aprobar ingeniería** eléctrica de detalle
2. **Iniciar licitación** de equipos principales
3. **Contratar estudios** de coordinación de protecciones
4. **Definir proveedores** de materiales eléctricos

#### **15.2 Próximas 4 Semanas:**
1. **Finalizar planos** de instalación
2. **Obtener permisos** de conexión
3. **Contratar personal** especializado
4. **Preparar equipos** de instalación

---

**Documento de ingeniería eléctrica según Metodología Punto 42**  
**Fecha de desarrollo:** 27 de enero de 2025  
**Responsable:** Administrador Contractual EPC  
**Estado:** ✅ **INGENIERÍA ELÉCTRICA DE DETALLE COMPLETADA**
