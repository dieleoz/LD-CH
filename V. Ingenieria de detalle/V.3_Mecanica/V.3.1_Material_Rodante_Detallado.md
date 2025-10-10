# INGENIERÍA MECÁNICA DE DETALLE - MATERIAL RODANTE
## APP LA DORADA-CHIRIGUANÁ v10.1

**Fecha de desarrollo:** 27 de enero de 2025  
**Proyecto:** APP La Dorada - Chiriguaná  
**Contrato:** Concesión No. 001 de 2025  
**Responsable:** Administrador Contractual EPC

---

## 🎯 RESUMEN EJECUTIVO

Este documento presenta la **ingeniería mecánica de detalle** para el material rodante del proyecto APP La Dorada-Chiriguaná, desarrollada para la adquisición y operación de trenes de pasajeros y carga en el corredor ferroviario de 178 km.

> **📋 DOCUMENTO MAESTRO CONSOLIDADO:** Para la versión definitiva y consolidada del sistema de Material Rodante, consulte: `IV. Ingenieria básica/SIS_Material_Rodante_Definitivo_v1.0.md`

### **Base Técnica:**
- **Longitud total:** 178 km La Dorada-Chiriguaná
- **Velocidad máxima:** 120 km/h (diseño)
- **Velocidad comercial:** 80 km/h (pasajeros), 60 km/h (carga)
- **Estándares:** UIC, EN, FERROVIAS, normas colombianas

---

## 🚂 ESPECIFICACIONES DE MATERIAL RODANTE

### **1. TRENES DE PASAJEROS**

#### **1.1 Trenes de Pasajeros Rápidos (Express)**
| Parámetro | Especificación | Observaciones |
|:----------|:---------------|:--------------|
| **Tipo** | Tren eléctrico múltiple | 6 coches por tren |
| **Velocidad máxima** | 120 km/h | Velocidad de diseño |
| **Velocidad comercial** | 80 km/h | Velocidad de operación |
| **Capacidad** | 480 pasajeros | 80 pasajeros por coche |
| **Potencia** | 3,000 kW | Tracción distribuida |
| **Peso** | 320 toneladas | Peso total del tren |
| **Longitud** | 150 metros | Longitud total |
| **Ancho** | 3.0 metros | Ancho estándar |
| **Altura** | 4.2 metros | Altura máxima |

#### **1.2 Trenes de Pasajeros Regulares (Local)**
| Parámetro | Especificación | Observaciones |
|:----------|:---------------|:--------------|
| **Tipo** | Tren eléctrico múltiple | 4 coches por tren |
| **Velocidad máxima** | 100 km/h | Velocidad de diseño |
| **Velocidad comercial** | 60 km/h | Velocidad de operación |
| **Capacidad** | 320 pasajeros | 80 pasajeros por coche |
| **Potencia** | 2,000 kW | Tracción distribuida |
| **Peso** | 220 toneladas | Peso total del tren |
| **Longitud** | 100 metros | Longitud total |
| **Ancho** | 3.0 metros | Ancho estándar |
| **Altura** | 4.2 metros | Altura máxima |

#### **1.3 Composición de Trenes de Pasajeros**
| Coche | Función | Capacidad | Peso | Observaciones |
|:------|:---------|:----------:|:-----|:--------------|
| **Coche 1** | Motor + Pasajeros | 80 | 55 ton | Cabina de conducción |
| **Coche 2** | Pasajeros | 80 | 50 ton | Coche intermedio |
| **Coche 3** | Pasajeros | 80 | 50 ton | Coche intermedio |
| **Coche 4** | Pasajeros | 80 | 50 ton | Coche intermedio |
| **Coche 5** | Pasajeros | 80 | 50 ton | Coche intermedio |
| **Coche 6** | Motor + Pasajeros | 80 | 55 ton | Cabina de conducción |

---

## 🚛 TRENES DE CARGA

### **2. LOCOMOTORAS DE CARGA**

#### **2.1 Locomotoras Principales**
| Parámetro | Especificación | Observaciones |
|:----------|:---------------|:--------------|
| **Tipo** | Locomotora eléctrica | Tracción eléctrica |
| **Velocidad máxima** | 100 km/h | Velocidad de diseño |
| **Velocidad comercial** | 60 km/h | Velocidad de operación |
| **Potencia** | 4,000 kW | Potencia continua |
| **Peso** | 120 toneladas | Peso en servicio |
| **Longitud** | 22 metros | Longitud total |
| **Ancho** | 3.0 metros | Ancho estándar |
| **Altura** | 4.2 metros | Altura máxima |
| **Esfuerzo de tracción** | 300 kN | Esfuerzo continuo |

#### **2.2 Vagones de Carga**
| Tipo | Capacidad | Peso | Longitud | Observaciones |
|:-----|:----------|:-----|:---------|:--------------|
| **Vagón tolva** | 60 ton | 25 ton | 12 m | Carga a granel |
| **Vagón plataforma** | 50 ton | 20 ton | 14 m | Carga general |
| **Vagón contenedor** | 40 ton | 18 ton | 16 m | Contenedores |
| **Vagón tanque** | 45 ton | 22 ton | 12 m | Líquidos |

#### **2.3 Composición de Trenes de Carga**
| Elemento | Cantidad | Función | Observaciones |
|:---------|:--------:|:---------|:--------------|
| **Locomotora** | 1 | Tracción | Cabeza del tren |
| **Vagones** | 20-30 | Carga | Según tipo de carga |
| **Vagón de cola** | 1 | Seguridad | Señales y frenos |

---

## 🔧 SISTEMAS DE TRACCIÓN

### **3. SISTEMAS DE PROPULSIÓN**

#### **3.1 Sistema de Tracción Eléctrica**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Motor de tracción** | 500 kW, 25 kV AC | 6 por tren | Motores asíncronos |
| **Convertidor** | IGBT, 25 kV AC | 3 por tren | Convertidores de frecuencia |
| **Transformador** | 25 kV/1.5 kV, 3 MVA | 1 por tren | Transformador principal |
| **Pantógrafo** | 25 kV, 1,000 A | 2 por tren | Captación de corriente |

#### **3.2 Sistema de Frenado**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Freno neumático** | Sistema de aire | 1 por tren | Freno principal |
| **Freno eléctrico** | Frenado regenerativo | 1 por tren | Freno secundario |
| **Freno de emergencia** | Sistema independiente | 1 por tren | Freno de seguridad |
| **Freno de estacionamiento** | Sistema manual | 1 por tren | Freno de parqueo |

#### **3.3 Sistema de Suspensión**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Bogie** | Estructura soldada | 2 por coche | Chasis rodante |
| **Ruedas** | Diámetro 920 mm | 8 por bogie | Ruedas de acero |
| **Ejes** | Diámetro 150 mm | 4 por bogie | Ejes de acero |
| **Suspensión primaria** | Resortes helicoidales | 8 por bogie | Suspensión de ruedas |
| **Suspensión secundaria** | Bolsas de aire | 4 por bogie | Suspensión de carrocería |

---

## 🏭 TALLERES DE MANTENIMIENTO

### **4. INSTALACIONES DE MANTENIMIENTO**

#### **4.1 Taller Principal La Dorada**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Nave principal** | 150m x 30m | 1 | Taller general |
| **Foso de inspección** | 150m x 2m | 1 | Inspección inferior |
| **Elevador** | 120 ton, 6m altura | 2 | Elevación de trenes |
| **Grúa puente** | 50 ton, 25m luz | 2 | Manipulación de equipos |
| **Máquina de lavado** | Automática | 1 | Limpieza exterior |
| **Banco de pruebas** | 25 kV, 3 MVA | 1 | Pruebas de tracción |

#### **4.2 Taller Secundario Chiriguaná**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Nave principal** | 100m x 25m | 1 | Taller general |
| **Foso de inspección** | 100m x 2m | 1 | Inspección inferior |
| **Elevador** | 120 ton, 6m altura | 1 | Elevación de trenes |
| **Grúa puente** | 30 ton, 20m luz | 1 | Manipulación de equipos |
| **Máquina de lavado** | Automática | 1 | Limpieza exterior |

#### **4.3 Talleres de Línea**
| Ubicación | Tipo | Capacidad | Observaciones |
|:----------|:-----|:----------|:--------------|
| **Puerto Berrío** | Taller básico | 2 trenes | Mantenimiento básico |
| **Barrancabermeja** | Taller básico | 2 trenes | Mantenimiento básico |
| **Bucaramanga** | Taller básico | 2 trenes | Mantenimiento básico |

---

## 🔧 EQUIPOS DE MANTENIMIENTO

### **5. HERRAMIENTAS Y MAQUINARIA**

#### **5.1 Equipos de Taller**
| Equipo | Especificación | Cantidad | Observaciones |
|:-------|:---------------|:--------:|:--------------|
| **Torno** | 2m entre puntos | 2 | Mecanizado general |
| **Fresadora** | Mesa 1.5m x 0.8m | 2 | Mecanizado general |
| **Taladro** | Columna, 50mm | 2 | Taladrado general |
| **Soldadora** | MIG/MAG, 300A | 4 | Soldadura general |
| **Compresor** | 10 m³/min, 10 bar | 2 | Aire comprimido |
| **Generador** | 500 kVA, diesel | 2 | Energía de respaldo |

#### **5.2 Equipos de Línea**
| Equipo | Especificación | Cantidad | Observaciones |
|:-------|:---------------|:--------:|:--------------|
| **Grúa móvil** | 50 ton, 25m | 2 | Rescate de trenes |
| **Vehículo de rescate** | 4x4, 5 ton | 2 | Rescate de pasajeros |
| **Vehículo de mantenimiento** | 4x4, 3 ton | 4 | Mantenimiento de línea |
| **Vehículo de inspección** | 4x4, 2 ton | 2 | Inspección de vía |

#### **5.3 Equipos de Medición**
| Equipo | Especificación | Cantidad | Observaciones |
|:-------|:---------------|:--------:|:--------------|
| **Multímetro** | 25 kV, 1000A | 4 | Medición eléctrica |
| **Osciloscopio** | 4 canales, 100 MHz | 2 | Análisis de señales |
| **Analizador de red** | 25 kV, 50 Hz | 2 | Análisis de red |
| **Medidor de aislamiento** | 5 kV, 100 GΩ | 2 | Medición de aislamiento |

---

## 🌡️ SISTEMAS HVAC

### **6. SISTEMAS DE CLIMATIZACIÓN**

#### **6.1 Sistema HVAC por Coche**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Unidad de climatización** | 50 kW, 25 kV AC | 1 por coche | Climatización principal |
| **Compresor** | Scroll, 15 kW | 2 por unidad | Compresores |
| **Evaporador** | 50 kW | 1 por unidad | Evaporador |
| **Condensador** | 50 kW | 1 por unidad | Condensador |
| **Ventiladores** | 5 kW, 25 kV AC | 4 por coche | Ventilación |

#### **6.2 Sistema de Ventilación**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Ventilador principal** | 10 kW, 25 kV AC | 2 por coche | Ventilación general |
| **Ventilador de emergencia** | 5 kW, 110V DC | 2 por coche | Ventilación de emergencia |
| **Filtros de aire** | HEPA, G4 | 4 por coche | Filtración de aire |
| **Rejillas** | Acero inoxidable | 8 por coche | Entrada/salida de aire |

---

## 🔌 SISTEMAS AUXILIARES

### **7. SISTEMAS DE SERVICIOS**

#### **7.1 Sistema de Iluminación**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Luminarias LED** | 50W, 220V AC | 20 por coche | Iluminación general |
| **Luminarias de emergencia** | 10W, 110V DC | 8 por coche | Iluminación de emergencia |
| **Luminarias exteriores** | 30W, 220V AC | 4 por coche | Iluminación exterior |
| **Luminarias de cabina** | 20W, 220V AC | 2 por cabina | Iluminación de cabina |

#### **7.2 Sistema de Comunicaciones**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Radio TETRA** | 400 MHz, 25W | 1 por tren | Comunicaciones |
| **Intercomunicador** | 4 canales | 1 por tren | Comunicaciones internas |
| **Sistema de megafonía** | 100W, 8Ω | 1 por tren | Anuncios |
| **Sistema de video** | 4 canales | 1 por tren | Monitoreo |

#### **7.3 Sistema de Seguridad**
| Componente | Especificación | Cantidad | Observaciones |
|:-----------|:---------------|:--------:|:--------------|
| **Detector de humo** | Óptico | 8 por coche | Detección de incendio |
| **Extintor** | 6 kg, CO2 | 2 por coche | Extinción de incendio |
| **Martillo de emergencia** | Acero | 4 por coche | Evacuación |
| **Sistema de alarma** | Sonora | 1 por tren | Alarma de emergencia |

---

## 📋 ESPECIFICACIONES DE CONSTRUCCIÓN

### **8. PROCEDIMIENTOS DE FABRICACIÓN**

#### **8.1 Secuencia de Fabricación**
1. **Fase 1:** Fabricación de carrocerías (6 meses)
2. **Fase 2:** Instalación de sistemas (4 meses)
3. **Fase 3:** Pruebas de fábrica (2 meses)
4. **Fase 4:** Pruebas de línea (1 mes)
5. **Fase 5:** Entrega y comisionamiento (1 mes)

#### **8.2 Control de Calidad**
- **Inspección de materiales:** 100% de materiales
- **Control de soldadura:** 100% visual + 10% UT
- **Pruebas de funcionamiento:** 100% de equipos
- **Pruebas de integración:** 100% de sistemas
- **Pruebas de aceptación:** 100% de trenes

#### **8.3 Certificaciones**
- **Certificación UIC:** Para interoperabilidad
- **Certificación EN:** Para seguridad
- **Certificación FERROVIAS:** Para operación en Colombia
- **Certificación RETIE:** Para instalaciones eléctricas

---

## 📊 CANTIDADES Y PRESUPUESTO

### **9. CANTIDADES PRINCIPALES**

#### **9.1 Trenes de Pasajeros**
- **Trenes rápidos:** 8 unidades
- **Trenes regulares:** 12 unidades
- **Total trenes:** 20 unidades
- **Total coches:** 120 coches

#### **9.2 Trenes de Carga**
- **Locomotoras:** 15 unidades
- **Vagones tolva:** 200 unidades
- **Vagones plataforma:** 150 unidades
- **Vagones contenedor:** 100 unidades
- **Vagones tanque:** 50 unidades

#### **9.3 Equipos de Mantenimiento**
- **Equipos de taller:** 50 unidades
- **Equipos de línea:** 20 unidades
- **Equipos de medición:** 15 unidades
- **Herramientas:** 500 unidades

### **10. PRESUPUESTO ESTIMADO**

#### **10.1 Costos por Rubro**
| Rubro | Costo (COP) | % del Total |
|:------|:------------|:------------|
| **Trenes de pasajeros** | $180,000 M | 60% |
| **Trenes de carga** | $80,000 M | 27% |
| **Equipos de mantenimiento** | $25,000 M | 8% |
| **Talleres** | $15,000 M | 5% |
| **TOTAL** | **$300,000 M** | **100%** |

---

## ⚠️ RIESGOS Y MITIGACIONES

### **11. RIESGOS MECÁNICOS**

#### **11.1 Riesgos Identificados**
| Riesgo | Probabilidad | Impacto | Mitigación |
|:-------|:------------:|:-------:|:-----------|
| **Fallas de tracción** | Media | Alto | Mantenimiento preventivo |
| **Fallas de frenos** | Baja | Alto | Sistemas redundantes |
| **Fallas de suspensión** | Baja | Medio | Inspección regular |
| **Acceso a repuestos** | Media | Medio | Stock de seguridad |

#### **11.2 Plan de Contingencia**
- **Reservas:** 15% del presupuesto
- **Cronograma:** 20% de holgura
- **Repuestos:** Stock de seguridad
- **Personal:** Equipos de respaldo

---

## 🎯 CRONOGRAMA DE EJECUCIÓN

### **12. CRONOGRAMA DETALLADO**

#### **12.1 Fases de Adquisición**
| Fase | Duración | Actividades Principales | Recursos |
|:-----|:---------|:----------------------|:---------|
| **Fase 1** | 6 meses | Fabricación carrocerías | 200 operarios |
| **Fase 2** | 4 meses | Instalación sistemas | 150 operarios |
| **Fase 3** | 2 meses | Pruebas de fábrica | 100 operarios |
| **Fase 4** | 1 mes | Pruebas de línea | 50 operarios |
| **Fase 5** | 1 mes | Entrega y comisionamiento | 30 operarios |

#### **12.2 Hitos Principales**
- **Mes 6:** Terminación carrocerías
- **Mes 10:** Terminación instalación sistemas
- **Mes 12:** Terminación pruebas de fábrica
- **Mes 13:** Terminación pruebas de línea
- **Mes 14:** Terminación total proyecto

---

## ✅ CRITERIOS DE ACEPTACIÓN

### **13. CRITERIOS TÉCNICOS**

#### **13.1 Trenes de Pasajeros**
- **Velocidad:** 120 km/h máximo
- **Aceleración:** 1.0 m/s²
- **Frenado:** 1.2 m/s²
- **Comodidad:** Nivel UIC estándar

#### **13.2 Trenes de Carga**
- **Velocidad:** 100 km/h máximo
- **Esfuerzo de tracción:** 300 kN continuo
- **Capacidad:** 60 ton por vagón
- **Eficiencia:** > 90%

#### **13.3 Sistemas Auxiliares**
- **Disponibilidad:** > 99%
- **Eficiencia:** > 95%
- **Mantenimiento:** < 2 horas/mes
- **Vida útil:** > 25 años

---

## 🎯 PRÓXIMOS PASOS

### **14. ACCIONES INMEDIATAS**

#### **14.1 Esta Semana:**
1. **Aprobar ingeniería** mecánica de detalle
2. **Iniciar licitación** de trenes de pasajeros
3. **Contratar estudios** de mantenimiento
4. **Definir proveedores** de repuestos

#### **14.2 Próximas 4 Semanas:**
1. **Finalizar especificaciones** de adquisición
2. **Obtener certificaciones** necesarias
3. **Contratar personal** de mantenimiento
4. **Preparar talleres** de mantenimiento

---

**Documento de ingeniería mecánica según Metodología Punto 42**  
**Fecha de desarrollo:** 27 de enero de 2025  
**Responsable:** Administrador Contractual EPC  
**Estado:** ✅ **INGENIERÍA MECÁNICA DE DETALLE COMPLETADA**
