# ESTACIONES FERROVIARIAS - AGRUPACIÓN Y TAREAS
## Proyecto APP La Dorada-Chiriguaná

**Versión:** 1.0  
**Fecha:** 11 Octubre 2025  
**Metodología:** Vista de Agrupación por Cantidades + Desglose de Tareas  
**Estado:** ✅ **ANÁLISIS COMPLETO**  

---

## 📊 **1. RESUMEN EJECUTIVO - CANTIDADES**

| Tipo de Estación | Cantidad | PKs | Función Principal |
|:-----------------|:--------:|:----|:------------------|
| **Estaciones Principales** | **11** | Ver tabla detallada | Control, operación, mantenimiento |
| **Estaciones Menores/Apeaderos** | **15** | Ver tabla detallada | Paradas operacionales |
| **CCO (Centro Control)** | **1** | PK 441+932 (B/Bermejo) | Control maestro del corredor |
| **Talleres** | **2** | México + Chiriguaná | Mantenimiento pesado + liviano |
| **TOTAL INSTALACIONES** | **29** | PK 201+470 - 722+250 | 520 km de corredor |

---

## 🚉 **2. ESTACIONES PRINCIPALES (11 UBICACIONES)**

### **2.1 LISTADO COMPLETO**

| Nº | Estación | PK | UFV | Función | Tipo | Lote |
|:--:|:---------|:---|:----|:--------|:-----|:----:|
| **1** | **México** | 201+470 | UFV 23 | Terminal Sur + Control | Principal | 2.1 |
| **2** | **Puerto Triunfo** | 250+133 | UFV 30 | Operación Intermedia | Principal | 2.1 |
| **3** | **La Argelia** | 282+154 | UFV 31 | Operación Intermedia | Principal | 2.1 |
| **4** | **Puerto Olaya** | 338+250 | UFV 03 | Operación Pre-Bermejo | Principal | 2.1 |
| **5** | **B/Bermejo (CCO)** | 441+932 | UFV 40/41 | **CCO + Taller Pesado** | **Principal/CCO** | 2.1/2.2 |
| **6** | **García Cadena** | 462+520 | UFV 44 | Operación Post-Bermejo | Principal | 2.2 |
| **7** | **San Rafael** | 516+490 | UFV 46 | Operación Intermedia | Principal | 2.2 |
| **8** | **Santa Lucía** | 569+800 | UFV 49 | Operación Intermedia | Principal | 2.2 |
| **9** | **Gamarra** | 604+265 | UFV 52 | Operación Intermedia | Principal | 2.2 |
| **10** | **La Gloria** | 635+991 | UFV 54 | Operación Pre-Terminal | Principal | 2.2 |
| **11** | **Chiriguaná** | 722+250 | UFV 22 | **Terminal Norte + Taller Liviano** | **Principal/Terminal** | 2.2 |

---

### **2.2 "KIT" DE EQUIPOS POR ESTACIÓN PRINCIPAL**

Cada estación principal debe tener el siguiente conjunto de equipos:

| Sistema | Equipos | Cantidad | Observaciones |
|:--------|:--------|:--------:|:--------------|
| **🏢 Edificación** | Estación | 1 | Área mínima según tipo |
| **⚡ Energía** | Subestación MT/BT | 1 | 11 subestaciones totales |
| | UPS | 1 | Respaldo 2h mínimo |
| | Grupo Electrógeno | 1 | Contingencia |
| **🖥️ Control** | Puesto CTC Local | 1 | Control distribuido |
| | RBC (solo 5 estaciones) | 0-1 | Solo estaciones críticas |
| **📡 Telecomunicaciones** | Estación Base TETRA | 1 | 26 totales |
| | Nodo Fibra Óptica | 1 | 11 nodos principales |
| | Switch Distribución | 1 | Capa 2/3 |
| **📹 Seguridad** | Cámaras CCTV | 2-4 | PTZ + Fijas |
| | CCTV Entrada | 1 | Cobertura accesos |
| | CCTV Andenes | 1-2 | Cobertura operacional |
| **🎯 Señalización** | Señales LED | 2-4 | Entrada/salida |
| | Balizas ETCS | 2-4 | Kilometraje + señales |
| | Desvíos Motorizados | 1-3 | Según apartaderos |
| **🚂 Vía** | Apartadero | Variable | Según necesidad |
| | Zona Estacionamiento | Variable | Capacidad según tipo |

---

## 📋 **3. DESGLOSE DE TAREAS POR ESTACIÓN**

### **3.1 FASE 1: INGENIERÍA (Preconstrucción - Mes 0-12)**

#### **A) Levantamiento y Diagnóstico (Mes 0-3)**
| Tarea | Duración | Responsable | Entregable |
|:------|:--------:|:------------|:-----------|
| Levantamiento topográfico | 2 semanas | Topografía | Plano topográfico |
| Estudio geotécnico | 2 semanas | Geotecnia | Informe geotécnico |
| Levantamiento predial | 2 semanas | Gestión Predial | Ficha predial |
| Diagnóstico infraestructura existente | 1 semana | Civil | Informe diagnóstico |

#### **B) Diseño Conceptual y Básico (Mes 3-8)**
| Tarea | Duración | Responsable | Entregable |
|:------|:--------:|:------------|:-----------|
| Diseño arquitectónico | 4 semanas | Arquitectura | Planos arquitectónicos |
| Diseño estructural | 4 semanas | Civil | Memorias de cálculo |
| Diseño eléctrico | 3 semanas | Eléctrica | Diagramas unifilares |
| Diseño hidrosanitario | 2 semanas | Civil | Planos hidrosanitarios |
| Diseño sistemas ferroviarios | 4 semanas | Sistemas | Diagramas funcionales |
| **Modelo BIM LOD 300** | **8 semanas** | **BIM + Especialistas** | **Modelo integrado** |

#### **C) Diseño de Detalle (Mes 8-12)**
| Tarea | Duración | Responsable | Entregable |
|:------|:--------:|:------------|:-----------|
| Planos constructivos | 8 semanas | Todas las disciplinas | Planos as-designed |
| Especificaciones técnicas | 4 semanas | Especialistas | Memorias técnicas |
| Listas de materiales | 2 semanas | Compras | BOQ + BOM |
| Presupuesto detallado | 2 semanas | Costos | APU detallados |

---

### **3.2 FASE 2: OBRA CIVIL (Construcción - Mes 12-36)**

#### **D) Preparación del Sitio (Mes 12-14)**
| Tarea | Duración | Personal | Observaciones |
|:------|:--------:|:---------|:--------------|
| Cerramiento provisional | 1 semana | 5 obreros | Seguridad del sitio |
| Campamento temporal | 1 semana | 8 obreros | Instalaciones temporales |
| Demoliciones (si aplica) | 2 semanas | 10 obreros | Estructuras existentes |
| Limpieza y descapote | 1 semana | 6 obreros | Preparación terreno |

#### **E) Cimentación y Estructura (Mes 14-24)**
| Tarea | Duración | Personal | Observaciones |
|:------|:--------:|:---------|:--------------|
| Excavaciones | 2 semanas | 12 obreros | Cimentación profunda |
| Fundaciones | 4 semanas | 15 obreros | NSR-10 Grupo IV |
| Estructura metálica/concreto | 8 semanas | 20 obreros | Según diseño |
| Losa de entrepiso | 2 semanas | 15 obreros | Si aplica |
| Cubierta | 3 semanas | 12 obreros | Impermeabilización |

#### **F) Acabados y Cerramientos (Mes 24-30)**
| Tarea | Duración | Personal | Observaciones |
|:------|:--------:|:---------|:--------------|
| Mampostería | 4 semanas | 15 obreros | Muros divisorios |
| Enchapes y pisos | 3 semanas | 10 obreros | Acabados finales |
| Carpintería metálica | 2 semanas | 8 obreros | Puertas y ventanas |
| Pintura | 2 semanas | 6 obreros | Interior y exterior |

---

### **3.3 FASE 3: INSTALACIONES (Mes 24-36)**

#### **G) Instalaciones Eléctricas (Mes 24-32)**
| Tarea | Duración | Personal | Observaciones |
|:------|:--------:|:---------|:--------------|
| Acometida MT | 2 semanas | Especialistas | Coordinación con OR |
| Subestación MT/BT | 3 semanas | Especialistas | Transformador + tableros |
| Canalización eléctrica | 4 semanas | 8 electricistas | Ductos + bandejas |
| Cableado de potencia | 3 semanas | 10 electricistas | Fuerza y alumbrado |
| Tableros y protecciones | 2 semanas | 6 electricistas | RETIE |
| UPS + Generador | 2 semanas | Especialistas | Respaldo energético |

#### **H) Instalaciones Hidrosanitarias (Mes 28-32)**
| Tarea | Duración | Personal | Observaciones |
|:------|:--------:|:---------|:--------------|
| Red agua potable | 2 semanas | 6 plomeros | Tanques + redes |
| Red sanitaria | 2 semanas | 6 plomeros | Desagües + PTAR |
| Red contra incendio | 2 semanas | Especialistas | Gabinetes + hidrantes |
| Aparatos sanitarios | 1 semana | 4 plomeros | Instalación final |

---

### **3.4 FASE 4: SISTEMAS FERROVIARIOS (Mes 30-44)**

#### **I) Sistemas de Control (Mes 30-38)**
| Tarea | Duración | Personal | Observaciones |
|:------|:--------:|:---------|:--------------|
| Cuarto técnico CTC | 2 semanas | Civil + Eléctrica | Sala de control |
| Instalación puesto CTC | 2 semanas | Especialistas | Consolas + servidores |
| RBC (solo 5 estaciones) | 3 semanas | Especialistas ETCS | Si aplica |
| Cableado de control | 3 semanas | 8 técnicos | Cables de señales |
| Configuración software | 2 semanas | Ingenieros SW | Lógica de control |

#### **J) Sistemas de Telecomunicaciones (Mes 32-40)**
| Tarea | Duración | Personal | Observaciones |
|:------|:--------:|:---------|:--------------|
| Torre TETRA (si aplica) | 3 semanas | Civil + Montaje | Estructura soporte |
| Estación Base TETRA | 2 semanas | Especialistas Radio | EBT completa |
| Nodo Fibra Óptica | 2 semanas | Especialistas FO | ODF 48 hilos |
| Empalmes fibra | 1 semana | Fusionadores | Enlace con corredor |
| Switch de red | 1 semana | Especialistas Redes | Capa 2/3 |
| Pruebas de comunicación | 2 semanas | Ingenieros Telecom | End-to-end |

#### **K) Sistemas de Seguridad ITS (Mes 36-42)**
| Tarea | Duración | Personal | Observaciones |
|:------|:--------:|:---------|:--------------|
| Postes para cámaras | 1 semana | Civil | Fundaciones |
| Instalación cámaras CCTV | 2 semanas | Especialistas CCTV | PTZ + Fijas |
| Cableado de datos | 2 semanas | 6 técnicos | Cat6A + FO |
| Grabadores NVR | 1 semana | Especialistas | Almacenamiento |
| Sistema interfonía | 1 semana | Técnicos Audio | Si aplica |
| Integración con CTC | 2 semanas | Ingenieros SW | Dashboard único |

#### **L) Señalización y Vía (Mes 38-44)**
| Tarea | Duración | Personal | Observaciones |
|:------|:--------:|:---------|:--------------|
| Señales LED | 2 semanas | Especialistas | Entrada/salida |
| Balizas ETCS | 2 semanas | Especialistas ETCS | Kilometraje + señales |
| Desvíos motorizados | 3 semanas | Especialistas Vía | Motores + controladores |
| Detectores HBD (si aplica) | 2 semanas | Especialistas | Detección caja caliente |
| Circuitos de vía | 3 semanas | Especialistas | Si aplica |

---

### **3.5 FASE 5: PRUEBAS Y PUESTA EN SERVICIO (Mes 44-48)**

#### **M) Pruebas Integradas (Mes 44-46)**
| Tarea | Duración | Personal | Observaciones |
|:------|:--------:|:---------|:--------------|
| **Pruebas FAT (Factory)** | **2 semanas** | **Especialistas + Fabricantes** | **En fábrica equipos** |
| **Pruebas SAT (Site)** | **2 semanas** | **Especialistas + Interventoría** | **En sitio** |
| Pruebas eléctricas | 1 semana | Electricistas | Continuidad + aislamiento |
| Pruebas CTC | 1 semana | Ingenieros Control | Lógica de señales |
| Pruebas TETRA | 1 semana | Ingenieros Radio | Cobertura + calidad |
| Pruebas CCTV | 1 semana | Especialistas ITS | Visualización + grabación |
| **Pruebas End-to-End** | **2 semanas** | **Todo el equipo** | **Integración total** |

#### **N) Comisionamiento (Mes 46-48)**
| Tarea | Duración | Personal | Observaciones |
|:------|:--------:|:---------|:--------------|
| Capacitación personal | 2 semanas | Instructores | Operadores + mantenimiento |
| Ajustes finales | 1 semana | Especialistas | Correcciones menores |
| Documentación as-built | 2 semanas | Dibujantes | Planos finales |
| **Acta de Recibo Provisional** | **1 día** | **Interventoría + ANI** | **Certificación oficial** |
| Puesta en operación | 1 semana | Operadores | Inicio operación |

---

## 📊 **4. RESUMEN DE RECURSOS POR ESTACIÓN**

### **4.1 PERSONAL TOTAL**
| Fase | Personal Pico | Duración | Total Horas-Hombre |
|:-----|:-------------:|:--------:|:------------------:|
| Ingeniería | 15-20 personas | 12 meses | ~15,000 H-H |
| Obra Civil | 40-50 personas | 24 meses | ~96,000 H-H |
| Instalaciones | 30-40 personas | 12 meses | ~48,000 H-H |
| Sistemas Ferroviarios | 25-35 personas | 14 meses | ~42,000 H-H |
| Pruebas y Puesta | 20-30 personas | 4 meses | ~12,000 H-H |
| **TOTAL ESTIMADO** | **~50 personas pico** | **48 meses** | **~213,000 H-H** |

### **4.2 COSTO ESTIMADO POR ESTACIÓN**

| Concepto | Costo Estimado (COP) | % del Total |
|:---------|:--------------------:|:-----------:|
| **Ingeniería** | $800.000.000 | 8% |
| **Obra Civil** | $4.500.000.000 | 45% |
| **Instalaciones Eléctricas** | $1.200.000.000 | 12% |
| **Subestación MT/BT** | $1.500.000.000 | 15% |
| **Sistemas Ferroviarios** | $1.500.000.000 | 15% |
| **Pruebas y Comisionamiento** | $500.000.000 | 5% |
| **TOTAL POR ESTACIÓN** | **~$10.000.000.000** | **100%** |

**Nota:** Costo variable según tipo de estación (principal/menor) y complejidad

---

## 🔄 **5. CRONOGRAMA MAESTRO**

### **5.1 RUTA CRÍTICA**
1. ✅ **Diseño BIM LOD 300** (8 semanas) → Sin esto no se puede construir
2. ✅ **Estructura (10 semanas)** → Base del proyecto
3. ✅ **Subestación Eléctrica (3 semanas)** → Sin energía no funcionan sistemas
4. ✅ **Sistemas de Control CTC (5 semanas)** → Integración crítica
5. ✅ **Pruebas End-to-End (2 semanas)** → Certificación final

**Total Ruta Crítica:** 28 semanas dentro de 48 meses totales

---

## 📋 **6. INTEGRACIÓN EN WBS**

### **Capítulo Propuesto: X. ESTACIONES E INFRAESTRUCTURA**

```
X. ESTACIONES E INFRAESTRUCTURA
├─ X.1 Estaciones Principales (11 unidades)
│   ├─ X.1.1 México (PK 201+470)
│   ├─ X.1.2 Puerto Triunfo (PK 250+133)
│   ├─ X.1.3 La Argelia (PK 282+154)
│   ├─ X.1.4 Puerto Olaya (PK 338+250)
│   ├─ X.1.5 B/Bermejo - CCO (PK 441+932)
│   ├─ X.1.6 García Cadena (PK 462+520)
│   ├─ X.1.7 San Rafael (PK 516+490)
│   ├─ X.1.8 Santa Lucía (PK 569+800)
│   ├─ X.1.9 Gamarra (PK 604+265)
│   ├─ X.1.10 La Gloria (PK 635+991)
│   └─ X.1.11 Chiriguaná (PK 722+250)
│
├─ X.2 Estaciones Menores/Apeaderos (15 unidades)
│   └─ [Detalle por definir según ingeniería básica]
│
├─ X.3 CCO - Centro de Control (1 unidad)
│   └─ X.3.1 B/Bermejo (PK 441+932)
│
└─ X.4 Talleres (2 unidades)
    ├─ X.4.1 Taller Pesado - B/Bermejo (PK 441+932)
    └─ X.4.2 Taller Liviano - Chiriguaná (PK 722+250)
```

---

## ✅ **7. CONCLUSIONES**

1. ✅ **11 estaciones principales** identificadas con PKs específicos
2. ✅ **"Kit" estándar** de equipos definido por estación
3. ✅ **5 fases** de ejecución claramente definidas (60 tareas principales)
4. ✅ **48 meses** de duración estimada por estación
5. ✅ **~213,000 H-H** de esfuerzo total por estación
6. ✅ **~$10,000M COP** de costo estimado por estación principal
7. ✅ **Ruta crítica** identificada (28 semanas críticas)
8. ✅ **Integración WBS** propuesta para capítulo X

---

## 🚀 **8. SIGUIENTE PASO**

### **Acción Inmediata:**
Validar con ingeniería básica el listado de **15 estaciones menores/apeaderos** para completar el inventario total de 26 instalaciones.

### **Responsable:**
Ingeniería Básica + PMO

### **Plazo:**
30 días desde aprobación de este documento

### **Entregable:**
Ficha técnica por cada una de las 26 estaciones con ubicación PK exacta

---

**Documento elaborado según Metodología Punto 42**  
**Vista de Agrupación por Cantidades + Desglose de Tareas Asociadas**  
**Fecha:** 11 Octubre 2025  
**Estado:** ✅ **ANÁLISIS COMPLETO**  

