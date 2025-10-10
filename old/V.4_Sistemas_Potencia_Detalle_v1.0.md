# V.4 Sistemas de Potencia - Ingeniería de Detalle (v1.0)

**Versión:** 1.0  
**Fecha:** 02/10/2025  
**Sistema:** Sistemas de Potencia  
**Fase:** D. Ingeniería de Detalle  
**Referencias:** EN 50126/50128/50129, IEC 62290, UIC 615, IEEE 1547, IEC 61850

---

## 1. Resumen Ejecutivo

Este documento detalla la ingeniería de los sistemas de potencia para el proyecto APP La Dorada-Chiriguaná, abarcando la alimentación eléctrica, la distribución, la protección, la calidad de energía y la integración con sistemas críticos como ITCS y CTC.

### 1.1 Alcance del Sistema de Potencia
- **Sistema principal:** Alimentación eléctrica ferroviaria
- **Componentes:** Subestaciones, transformadores, UPS, generadores, protecciones
- **Cobertura:** 146 km de vía, 5 estaciones, 146 pasos a nivel
- **Capacidad:** 15 MVA total, 3 MVA por estación

### 1.2 Objetivos del Sistema
- **Alimentación confiable:** 99.95% de disponibilidad
- **Calidad de energía:** THD < 5%, regulación de voltaje ±2%
- **Protección:** Coordinación de protecciones, selectividad
- **Eficiencia:** Factor de potencia > 0.95, pérdidas < 3%
- **Seguridad:** Cumplimiento EN 50126/50128/50129

---

## 2. Arquitectura del Sistema

### 2.1 Arquitectura General
```
┌─────────────────────────────────────────────────────────────┐
│                    SISTEMAS DE POTENCIA                     │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │Subestación  │  │Subestación  │  │Subestación  │         │
│  │ Principal   │  │ Secundaria  │  │  Respaldo   │         │
│  │ (La Dorada) │  │(Puerto Salgar)│ │(Puerto Berrío)│       │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │Transformador│  │Transformador│  │Transformador│         │
│  │  Principal  │  │ Secundario  │  │  Respaldo   │         │
│  │   (5 MVA)   │  │   (3 MVA)   │  │   (2 MVA)   │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │     UPS     │  │  Generador  │  │  Protección │         │
│  │  (500 kVA)  │  │  (1 MVA)    │  │  (Relés)    │         │
│  │             │  │             │  │             │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
└─────────────────────────────────────────────────────────────┘
```

### 2.2 Componentes Principales

#### 2.2.1 Subestaciones
- **Subestación Principal:** La Dorada (5 MVA)
- **Subestación Secundaria:** Puerto Salgar (3 MVA)
- **Subestación Respaldo:** Puerto Berrío (2 MVA)
- **Subestaciones Auxiliares:** Puerto Nare, Chiriguaná (1 MVA cada una)

#### 2.2.2 Transformadores
- **Transformador Principal:** 5 MVA, 34.5/13.8 kV
- **Transformador Secundario:** 3 MVA, 13.8/0.48 kV
- **Transformador Respaldo:** 2 MVA, 13.8/0.48 kV
- **Transformadores Auxiliares:** 1 MVA, 13.8/0.48 kV

#### 2.2.3 Sistemas de Respaldo
- **UPS:** 500 kVA, 15 minutos de autonomía
- **Generadores:** 1 MVA, 8 horas de autonomía
- **Baterías:** 1000 Ah, 48 V DC
- **Inversores:** 100 kVA, 48 V DC / 480 V AC

---

## 3. Especificaciones Técnicas

### 3.1 Subestaciones

#### 3.1.1 Subestación Principal (La Dorada)
- **Potencia:** 5 MVA
- **Voltaje:** 34.5/13.8 kV
- **Transformador:** 5 MVA, 34.5/13.8 kV, Dyn11
- **Protecciones:** Relés digitales SEL-751A
- **Interruptores:** SF6, 34.5 kV, 630 A
- **Seccionadores:** Motorizados, 34.5 kV

#### 3.1.2 Subestación Secundaria (Puerto Salgar)
- **Potencia:** 3 MVA
- **Voltaje:** 13.8/0.48 kV
- **Transformador:** 3 MVA, 13.8/0.48 kV, Dyn11
- **Protecciones:** Relés digitales SEL-751A
- **Interruptores:** SF6, 13.8 kV, 400 A
- **Seccionadores:** Motorizados, 13.8 kV

#### 3.1.3 Subestación Respaldo (Puerto Berrío)
- **Potencia:** 2 MVA
- **Voltaje:** 13.8/0.48 kV
- **Transformador:** 2 MVA, 13.8/0.48 kV, Dyn11
- **Protecciones:** Relés digitales SEL-751A
- **Interruptores:** SF6, 13.8 kV, 400 A
- **Seccionadores:** Motorizados, 13.8 kV

### 3.2 Transformadores

#### 3.2.1 Transformador Principal
- **Potencia:** 5 MVA
- **Voltaje:** 34.5/13.8 kV
- **Conexión:** Dyn11
- **Refrigeración:** ONAN (aceite natural)
- **Temperatura:** 65°C (aceite), 80°C (devanados)
- **Eficiencia:** 99.2% a plena carga

#### 3.2.2 Transformador Secundario
- **Potencia:** 3 MVA
- **Voltaje:** 13.8/0.48 kV
- **Conexión:** Dyn11
- **Refrigeración:** ONAN (aceite natural)
- **Temperatura:** 65°C (aceite), 80°C (devanados)
- **Eficiencia:** 99.0% a plena carga

#### 3.2.3 Transformador Respaldo
- **Potencia:** 2 MVA
- **Voltaje:** 13.8/0.48 kV
- **Conexión:** Dyn11
- **Refrigeración:** ONAN (aceite natural)
- **Temperatura:** 65°C (aceite), 80°C (devanados)
- **Eficiencia:** 98.8% a plena carga

### 3.3 Sistemas de Respaldo

#### 3.3.1 UPS (Uninterruptible Power Supply)
- **Potencia:** 500 kVA
- **Voltaje:** 480 V AC, 3 fases
- **Autonomía:** 15 minutos
- **Baterías:** 1000 Ah, 48 V DC
- **Eficiencia:** 95% (modo normal), 90% (modo batería)
- **THD:** < 3% (entrada), < 5% (salida)

#### 3.3.2 Generadores
- **Potencia:** 1 MVA
- **Voltaje:** 480 V AC, 3 fases
- **Combustible:** Diesel
- **Autonomía:** 8 horas
- **Arranque:** Automático (30 segundos)
- **Regulación:** ±1% (voltaje), ±0.5% (frecuencia)

#### 3.3.3 Baterías
- **Capacidad:** 1000 Ah
- **Voltaje:** 48 V DC
- **Tipo:** Plomo-ácido, selladas
- **Vida útil:** 10 años
- **Temperatura:** 20-25°C (óptima)
- **Mantenimiento:** Libre de mantenimiento

---

## 4. Funcionalidades del Sistema

### 4.1 Alimentación Principal

#### 4.1.1 Red de Distribución
- **Voltaje:** 34.5 kV (primario), 13.8 kV (secundario)
- **Frecuencia:** 60 Hz
- **Factor de potencia:** > 0.95
- **THD:** < 5%
- **Regulación:** ±2% (voltaje), ±0.1% (frecuencia)

#### 4.1.2 Cargas Críticas
- **ITCS:** 200 kVA (ETCS Level 2)
- **CTC:** 100 kVA (Centro de Control)
- **Comunicaciones:** 50 kVA (GSM-R, TETRA)
- **Señalización:** 150 kVA (Señales, enclavamientos)
- **Iluminación:** 100 kVA (Estaciones, vías)

### 4.2 Sistemas de Respaldo

#### 4.2.1 UPS
- **Cargas críticas:** ITCS, CTC, comunicaciones
- **Tiempo de transferencia:** < 4 ms
- **Modo normal:** Rectificador + inversor
- **Modo batería:** Inversor + baterías
- **Modo bypass:** Alimentación directa

#### 4.2.2 Generadores
- **Cargas totales:** Todas las cargas
- **Tiempo de arranque:** 30 segundos
- **Tiempo de transferencia:** < 10 segundos
- **Modo automático:** Arranque automático
- **Modo manual:** Arranque manual

### 4.3 Protecciones

#### 4.3.1 Protecciones Primarias
- **Sobrecorriente:** Relés SEL-751A
- **Diferencial:** Relés SEL-751A
- **Sobretensión:** Relés SEL-751A
- **Subtensión:** Relés SEL-751A
- **Frecuencia:** Relés SEL-751A

#### 4.3.2 Protecciones Secundarias
- **Coordinación:** Selectividad temporal
- **Backup:** Protecciones de respaldo
- **Comunicación:** IEC 61850
- **Monitoreo:** SCADA integrado
- **Alarmas:** SMS, email, pager

---

## 5. Seguridad y Confiabilidad

### 5.1 Seguridad Funcional (EN 50126/50128/50129)

#### 5.1.1 Objetivos de Seguridad
- **SIL 4:** Alimentación ITCS
- **SIL 3:** Alimentación CTC
- **SIL 2:** Alimentación comunicaciones
- **SIL 1:** Alimentación auxiliar

#### 5.1.2 Arquitectura de Seguridad
- **Redundancia:** N+1 en componentes críticos
- **Diversidad:** Diferentes fuentes de alimentación
- **Aislamiento:** Separación física y eléctrica
- **Monitoreo:** Supervisión continua

### 5.2 Ciberseguridad (IEC 62443)

#### 5.2.1 Zonas de Seguridad
- **Zona 0:** Red de control crítico
- **Zona 1:** Red de supervisión
- **Zona 2:** Red administrativa
- **Zona 3:** Red externa

#### 5.2.2 Medidas de Protección
- **Firewall:** Protección perimetral
- **IDS/IPS:** Detección de intrusiones
- **Criptografía:** AES-256, RSA-2048
- **VPN:** Túneles seguros
- **Backup:** Respaldo y recuperación

### 5.3 Disponibilidad

#### 5.3.1 Objetivos de Disponibilidad
- **Alimentación principal:** 99.95% (4.38 horas/año)
- **UPS:** 99.9% (8.76 horas/año)
- **Generadores:** 99.5% (43.8 horas/año)
- **Baterías:** 99.0% (87.6 horas/año)

#### 5.3.2 Estrategias de Redundancia
- **Fuentes:** N+1 con transferencia automática
- **Equipos:** Redundancia en componentes críticos
- **Alimentación:** UPS + generadores
- **Comunicación:** Enlaces múltiples

---

## 6. Integración y Comunicaciones

### 6.1 Integración ITCS

#### 6.1.1 Alimentación ETCS Level 2
- **Potencia:** 200 kVA
- **Voltaje:** 480 V AC, 3 fases
- **Frecuencia:** 60 Hz
- **THD:** < 3%
- **Regulación:** ±1% (voltaje), ±0.1% (frecuencia)

#### 6.1.2 Protecciones Específicas
- **Sobrecorriente:** 125% de la corriente nominal
- **Sobretensión:** 110% del voltaje nominal
- **Subtensión:** 90% del voltaje nominal
- **Frecuencia:** 59.5-60.5 Hz
- **THD:** < 5%

### 6.2 Integración CTC

#### 6.2.1 Alimentación Centro de Control
- **Potencia:** 100 kVA
- **Voltaje:** 480 V AC, 3 fases
- **Frecuencia:** 60 Hz
- **THD:** < 3%
- **Regulación:** ±1% (voltaje), ±0.1% (frecuencia)

#### 6.2.2 Protecciones Específicas
- **Sobrecorriente:** 125% de la corriente nominal
- **Sobretensión:** 110% del voltaje nominal
- **Subtensión:** 90% del voltaje nominal
- **Frecuencia:** 59.5-60.5 Hz
- **THD:** < 5%

---

## 7. Operación y Mantenimiento

### 7.1 Operación

#### 7.1.1 Centro de Control de Potencia
- **Ubicación:** La Dorada (Colombia)
- **Personal:** 24/7 (3 turnos)
- **Equipos:** SCADA, HMI, alarmas
- **Monitoreo:** Voltaje, corriente, potencia, frecuencia
- **Alertas:** SMS, email, pager

#### 7.1.2 Procedimientos Operacionales
- **Inicio de Turno:** Checklist de verificación
- **Operación Normal:** Monitoreo continuo
- **Emergencias:** Procedimientos de emergencia
- **Cierre de Turno:** Handover y reportes

### 7.2 Mantenimiento

#### 7.2.1 Mantenimiento Preventivo
- **Diario:** Verificaciones básicas
- **Semanal:** Limpieza y calibración
- **Mensual:** Pruebas funcionales
- **Anual:** Revisión completa

#### 7.2.2 Mantenimiento Correctivo
- **Nivel 1:** Operadores (básico)
- **Nivel 2:** Técnicos (intermedio)
- **Nivel 3:** Especialistas (avanzado)
- **Nivel 4:** Fabricante (crítico)

---

## 8. Pruebas y Validación

### 8.1 Pruebas de Fábrica (FAT)

#### 8.1.1 Pruebas de Hardware
- **Transformadores:** Pruebas de aislamiento y rendimiento
- **Interruptores:** Pruebas de apertura y cierre
- **Protecciones:** Pruebas de relés y coordinación
- **UPS:** Pruebas de autonomía y transferencia

#### 8.1.2 Pruebas de Software
- **SCADA:** Pruebas de supervisión y control
- **Protecciones:** Pruebas de lógica y comunicación
- **Alarmas:** Pruebas de notificación
- **Comunicación:** Pruebas de enlaces

### 8.2 Pruebas de Sitio (SAT)

#### 8.2.1 Pruebas de Integración
- **ITCS:** Pruebas de alimentación ETCS
- **CTC:** Pruebas de alimentación centro de control
- **Comunicaciones:** Pruebas de alimentación sistemas
- **Emergencias:** Pruebas de procedimientos

#### 8.2.2 Pruebas de Aceptación
- **Funcionales:** Cumplimiento de requisitos
- **Rendimiento:** Objetivos de disponibilidad
- **Seguridad:** Cumplimiento normativo
- **Usabilidad:** Interfaz de usuario

---

## 9. Entregables y Cronograma

### 9.1 Entregables Fase D

#### 9.1.1 Documentos de Ingeniería
- **Especificación Técnica:** Sistemas de potencia
- **Plan de Pruebas:** FAT/SAT
- **Manual de Operación:** Procedimientos
- **Manual de Mantenimiento:** Mantenimiento

#### 9.1.2 Equipos y Configuración
- **Subestaciones:** Transformadores, interruptores, protecciones
- **UPS:** Sistemas de respaldo
- **Generadores:** Sistemas de emergencia
- **SCADA:** Supervisión y control

### 9.2 Cronograma de Implementación

#### 9.2.1 Fase de Desarrollo
- **Mes 1-2:** Especificación y diseño
- **Mes 3-4:** Adquisición de equipos
- **Mes 5-6:** Pruebas de fábrica
- **Mes 7-8:** Instalación y configuración

#### 9.2.2 Fase de Puesta en Servicio
- **Mes 9:** Pruebas de integración
- **Mes 10:** Pruebas de aceptación
- **Mes 11:** Puesta en servicio
- **Mes 12:** Operación y mantenimiento

---

## 10. Anexos

### 10.1 Matriz de Trazabilidad
| Requisito | Especificación | Prueba | Estado |
|:---|:---|:---|:---:|
| POT-001 | Alimentación ITCS | FAT-001 | 🟢 |
| POT-002 | Alimentación CTC | FAT-002 | 🟢 |
| POT-003 | Sistemas de respaldo | FAT-003 | 🟢 |
| POT-004 | Disponibilidad 99.95% | SAT-001 | 🟢 |
| POT-005 | Calidad de energía | SAT-002 | 🟢 |

### 10.2 Glosario de Términos
- **UPS:** Uninterruptible Power Supply
- **THD:** Total Harmonic Distortion
- **SCADA:** Supervisory Control and Data Acquisition
- **HMI:** Human Machine Interface
- **IEC 61850:** Comunicación en subestaciones
- **SEL:** Schweitzer Engineering Laboratories
- **SF6:** Hexafluoruro de azufre
- **ONAN:** Oil Natural Air Natural

### 10.3 Referencias Normativas
- **EN 50126:** Aplicación de técnicas de confiabilidad para sistemas ferroviarios
- **EN 50128:** Software para sistemas de control y protección ferroviarios
- **EN 50129:** Sistemas de señalización ferroviaria
- **IEC 62290:** Sistemas de gestión ferroviaria
- **IEC 62443:** Seguridad de sistemas de automatización industrial
- **IEEE 1547:** Interconexión de recursos de energía distribuida
- **IEC 61850:** Comunicación en subestaciones

### 10.4 Control de Versiones
| Versión | Fecha | Autor | Cambios |
|:---|:---|:---|:---|
| 0.1 | 02/10/2025 | Grupo Ortiz | Versión inicial |

---

**Documento:** V.4 Sistemas de Potencia - Ingeniería de Detalle  
**Estado:** ✅ **COMPLETADO**  
**Próximo:** V.5 Sistemas de Seguridad - Ingeniería de Detalle

