# ESTUDIO DE REFERENCIA - ESCENARIO EUROBALISE (BENCHMARK)
## APP La Dorada-Chiriguaná - Documento de Consulta (No Vinculante)

**Estado:** ⚠️ **EN RE-LINEACIÓN (PHASE 7 - DESCONTAMINACIÓN TÉCNICA)**
**Fecha:** Enero 2025
**Responsable:** Ing. Sistemas - EPC
**Especialista:** Especialista Senior en Control de Trenes
**Estándar Base:** UIC 438, EN 50126, EN 50129
**Nota:** Este documento analiza un escenario tradicional basado en 8,801 Eurobalises, presentado únicamente como benchmark comparativo. No representa el diseño base del proyecto.

---

## 🎯 **PROPÓSITO Y ALCANCE**

### **1.1 PROPÓSITO**
Este documento define el **Plan de Eurobalise** para el sistema ITCS ETCS Level 2 del proyecto APP La Dorada-Chiriguaná, estableciendo la ubicación de balizas cada 150 metros para garantizar precisión de posicionamiento ±5 metros.

### **1.2 ALCANCE**
El plan de Eurobalise cubrirá:
- **Corredor completo:** La Dorada - Chiriguaná (1,291 km)
- **Ubicación estándar:** Cada 150 metros en tramos rectos
- **Ubicación especial:** Aproximaciones a estaciones y pasos a nivel
- **Integración:** Con sistemas de señalización y CTC
- **Mantenimiento:** Plan de inspección y reemplazo

### **1.3 REFERENCIAS NORMATIVAS**
- **UIC 438:** Especificaciones técnicas ETCS Level 2
- **EN 50126:** Aplicación de técnicas de confiabilidad
- **EN 50129:** Aplicación de técnicas de seguridad
- **IEC 62290:** Sistemas de control automático de trenes

---

## 📍 **ESTRATEGIA DE UBICACIÓN**

### **2.1 PRINCIPIOS DE UBICACIÓN**

#### **2.1.1 DISTANCIA ESTÁNDAR**
```
DISTANCIA ESTÁNDAR: 150 METROS

JUSTIFICACIÓN TÉCNICA:
- Precisión de posicionamiento: ±5 metros
- Velocidad máxima: 120 km/h
- Tiempo de lectura: 50 ms
- Margen de seguridad: 3x tiempo de lectura
- Distancia mínima segura: 150 metros
```

#### **2.1.2 UBICACIONES ESPECIALES**
```
UBICACIONES ESPECIALES:

1. APROXIMACIONES A ESTACIONES:
   - Distancia: 100 metros antes de señales de entrada
   - Propósito: Preparación para parada
   - Tipo: Eurobalise de aproximación

2. PASOS A NIVEL:
   - Distancia: 200 metros antes del paso
   - Propósito: Activación de sistemas de seguridad
   - Tipo: Eurobalise de seguridad

3. CAMBIOS DE VELOCIDAD:
   - Ubicación: En punto exacto de cambio
   - Propósito: Actualización de límites de velocidad
   - Tipo: Eurobalise de velocidad

4. INTERSECCIONES:
   - Distancia: 150 metros antes de cruce
   - Propósito: Confirmación de ruta
   - Tipo: Eurobalise de confirmación
```

### **2.2 MAPA DE UBICACIONES**

#### **2.2.1 CORREDOR PRINCIPAL**
```
CORREDOR LA DORADA - CHIRIGUANÁ (1,291 KM)

TRAMO 1: LA DORADA - PUERTO SALGAR (PK 0+000 - PK 45+000)
- Longitud: 45 km
- Eurobalises estándar: 300 unidades
- Eurobalises especiales: 12 unidades
- Total tramo 1: 312 unidades

TRAMO 2: PUERTO SALGAR - HONDA (PK 45+000 - PK 78+000)
- Longitud: 33 km
- Eurobalises estándar: 220 unidades
- Eurobalises especiales: 8 unidades
- Total tramo 2: 228 unidades

TRAMO 3: HONDA - MARIQUITA (PK 78+000 - PK 156+000)
- Longitud: 78 km
- Eurobalises estándar: 520 unidades
- Eurobalises especiales: 18 unidades
- Total tramo 3: 538 unidades

TRAMO 4: MARIQUITA - CHIRIGUANÁ (PK 156+000 - PK 1,291+000)
- Longitud: 1,135 km
- Eurobalises estándar: 7,567 unidades
- Eurobalises especiales: 156 unidades
- Total tramo 4: 7,723 unidades

TOTAL CORREDOR:
- Eurobalises estándar: 8,607 unidades
- Eurobalises especiales: 194 unidades
- TOTAL GENERAL: 8,801 unidades
```

#### **2.2.2 ESTACIONES PRINCIPALES**
```
ESTACIONES Y EUROBALISES:

1. LA DORADA (PK 0+000):
   - Eurobalise entrada: PK 0-100
   - Eurobalise plataforma: PK 0+000
   - Eurobalise salida: PK 0+100
   - Total estación: 3 unidades

2. PUERTO SALGAR (PK 45+000):
   - Eurobalise entrada: PK 44+900
   - Eurobalise plataforma: PK 45+000
   - Eurobalise salida: PK 45+100
   - Total estación: 3 unidades

3. HONDA (PK 78+000):
   - Eurobalise entrada: PK 77+900
   - Eurobalise plataforma: PK 78+000
   - Eurobalise salida: PK 78+100
   - Total estación: 3 unidades

4. MARIQUITA (PK 156+000):
   - Eurobalise entrada: PK 155+900
   - Eurobalise plataforma: PK 156+000
   - Eurobalise salida: PK 156+100
   - Total estación: 3 unidades

5. CHIRIGUANÁ (PK 1,291+000):
   - Eurobalise entrada: PK 1,290+900
   - Eurobalise plataforma: PK 1,291+000
   - Eurobalise salida: PK 1,291+100
   - Total estación: 3 unidades

TOTAL ESTACIONES: 15 unidades
```

---

## 🔧 **ESPECIFICACIONES TÉCNICAS**

### **3.1 ESPECIFICACIONES HARDWARE**

#### **3.1.1 EUROBALISE ESTÁNDAR**
```
ESPECIFICACIONES EUROBALISE:

Tipo: Eurobalise Clase A (transmisión unidireccional)
Frecuencia: 27.095 MHz
Potencia: 4W (transmisión)
Alcance: 0.5m - 1.5m
Antena: Antena de bucle rectangular
Dimensiones: 490mm x 350mm x 50mm
Peso: 3.5 kg

CARACTERÍSTICAS ELÉCTRICAS:
- Alimentación: 24V DC
- Consumo: 2W en standby, 8W en transmisión
- Impedancia: 50 ohmios
- VSWR: < 1.5:1

CARACTERÍSTICAS MECÁNICAS:
- Material: Acero inoxidable AISI 316L
- Protección: IP67
- Temperatura: -40°C a +85°C
- Humedad: 0-95% sin condensación
- Vibración: 5-500 Hz, 2g RMS

CARACTERÍSTICAS DE TRANSMISIÓN:
- Velocidad de datos: 564.48 kbps
- Modulación: FSK (Frequency Shift Keying)
- Codificación: Manchester
- Tiempo de transmisión: 50 ms
- Ciclo de transmisión: 100 ms
```

#### **3.1.2 EUROBALISE ESPECIAL**
```
ESPECIFICACIONES EUROBALISE ESPECIAL:

Tipo: Eurobalise Clase B (transmisión bidireccional)
Frecuencia: 27.095 MHz
Potencia: 8W (transmisión)
Alcance: 0.5m - 2.0m
Antena: Antena de bucle rectangular mejorada
Dimensiones: 490mm x 350mm x 60mm
Peso: 4.2 kg

CARACTERÍSTICAS ADICIONALES:
- Comunicación bidireccional
- Almacenamiento de datos: 1MB Flash
- Procesador: ARM Cortex-M4
- Interface: RS-485, Ethernet
- Redundancia: N+1

APLICACIONES:
- Estaciones principales
- Pasos a nivel críticos
- Cambios de velocidad
- Interseciones importantes
```

### **3.2 ESPECIFICACIONES DE INSTALACIÓN**

#### **3.2.1 UBICACIÓN EN VÍA**
```
UBICACIÓN EN VÍA:

POSICIÓN LONGITUDINAL:
- Distancia estándar: 150 metros
- Tolerancia: ±5 metros
- Referencia: PK (Punto Kilométrico)

POSICIÓN TRANSVERSAL:
- Centro de vía: ±10 cm
- Altura: 50mm sobre nivel de riel
- Inclinación: 0° (horizontal)

POSICIÓN VERTICAL:
- Nivel de riel: Referencia
- Altura baliza: 50mm
- Tolerancia: ±5mm
```

#### **3.2.2 FUNDACIÓN Y ANCLAJE**
```
ESPECIFICACIONES DE FUNDACIÓN:

MATERIAL:
- Concreto: C25/30
- Acero de refuerzo: B500B
- Dimensiones: 600mm x 400mm x 200mm

ANCLAJE:
- Tipo: Anclajes químicos
- Material: Acero inoxidable AISI 316
- Diámetro: M12
- Longitud: 150mm
- Cantidad: 4 unidades por baliza

INSTALACIÓN:
- Excavación: 700mm x 500mm x 250mm
- Compactación: 95% Proctor
- Curado: 28 días mínimo
- Pruebas: Resistencia y nivelación
```

---

## 📡 **SISTEMA DE COMUNICACIÓN**

### **4.1 PROTOCOLO DE COMUNICACIÓN**

#### **4.1.1 MENSAJES EUROBALISE**
```
MENSAJES TRANSMITIDOS:

1. MENSAJE BÁSICO (ETCS-44):
   - Identificación de baliza
   - Información de posición
   - Datos de vía
   - Checksum de validación

2. MENSAJE DE VELOCIDAD (ETCS-27):
   - Límites de velocidad
   - Distancia hasta próximo límite
   - Tipo de limitación
   - Tiempo de validez

3. MENSAJE DE AUTORIZACIÓN (ETCS-16):
   - Autorización de movimiento
   - Distancia hasta fin de autorización
   - Condiciones especiales
   - Próxima baliza

4. MENSAJE DE SEGURIDAD (ETCS-23):
   - Alertas de seguridad
   - Restricciones temporales
   - Estado de la vía
   - Instrucciones especiales
```

#### **4.1.2 PROCESAMIENTO DE DATOS**
```
PROCESAMIENTO EN TREN:

1. LECTURA DE BALIZA:
   - Tiempo de lectura: 50 ms
   - Validación de datos: 10 ms
   - Procesamiento: 20 ms
   - Actualización de posición: 5 ms

2. VALIDACIÓN DE DATOS:
   - Checksum: Verificación de integridad
   - Timestamp: Validación de tiempo
   - Secuencia: Verificación de orden
   - Consistencia: Validación lógica

3. ACTUALIZACIÓN DE POSICIÓN:
   - Cálculo de posición: ±5 metros
   - Actualización de odometría
   - Corrección de deriva
   - Validación de movimiento
```

### **4.2 INTEGRACIÓN CON SISTEMAS**

#### **4.2.1 INTEGRACIÓN CON ITCS**
```
INTEGRACIÓN ITCS:

1. STM (Specific Transmission Module):
   - Lectura de balizas
   - Procesamiento de mensajes
   - Validación de datos
   - Comunicación con RBC

2. RBC (Radio Block Center):
   - Configuración de balizas
   - Actualización de mensajes
   - Monitoreo de estado
   - Gestión de fallos

3. CTC (Centro de Control):
   - Monitoreo de balizas
   - Configuración de mensajes
   - Alertas de mantenimiento
   - Reportes de estado
```

#### **4.2.2 INTEGRACIÓN CON SEÑALIZACIÓN**
```
INTEGRACIÓN SEÑALIZACIÓN:

1. PASOS A NIVEL:
   - Activación de sistemas
   - Cierre de barreras
   - Activación de señales
   - Monitoreo de estado

2. ENCLAVAMIENTOS:
   - Confirmación de rutas
   - Validación de movimientos
   - Coordinación de señales
   - Seguridad de operaciones

3. SEÑALES LUMINOSAS:
   - Actualización de aspectos
   - Coordinación de cambios
   - Monitoreo de estado
   - Alertas de fallos
```

---

## 🔧 **PLAN DE INSTALACIÓN**

### **5.1 CRONOGRAMA DE INSTALACIÓN**

#### **5.1.1 FASES DE INSTALACIÓN**
```
FASE 1: PREPARACIÓN (4 semanas)
- Estudio topográfico detallado
- Marcación de ubicaciones
- Preparación de fundaciones
- Procura de materiales

FASE 2: INSTALACIÓN (16 semanas)
- Instalación de fundaciones
- Montaje de balizas
- Conexiones eléctricas
- Pruebas de funcionamiento

FASE 3: PRUEBAS (4 semanas)
- Pruebas de comunicación
- Validación de posicionamiento
- Pruebas de integración
- Certificación del sistema
```

#### **5.1.2 CRONOGRAMA DETALLADO**
```
CRONOGRAMA POR TRAMO:

TRAMO 1 (LA DORADA - PUERTO SALGAR):
- Semana 1-2: Preparación
- Semana 3-6: Instalación
- Semana 7-8: Pruebas
- Total: 8 semanas

TRAMO 2 (PUERTO SALGAR - HONDA):
- Semana 9-10: Preparación
- Semana 11-14: Instalación
- Semana 15-16: Pruebas
- Total: 8 semanas

TRAMO 3 (HONDA - MARIQUITA):
- Semana 17-18: Preparación
- Semana 19-22: Instalación
- Semana 23-24: Pruebas
- Total: 8 semanas

TRAMO 4 (MARIQUITA - CHIRIGUANÁ):
- Semana 25-26: Preparación
- Semana 27-30: Instalación
- Semana 31-32: Pruebas
- Total: 8 semanas

TOTAL PROYECTO: 32 semanas
```

### **5.2 RECURSOS REQUERIDOS**

#### **5.2.1 PERSONAL TÉCNICO**
```
PERSONAL REQUERIDO:

1. EQUIPO DE INSTALACIÓN (4 equipos):
   - Supervisor: 1 por equipo
   - Técnico eléctrico: 2 por equipo
   - Técnico mecánico: 2 por equipo
   - Operario: 3 por equipo
   - Total por equipo: 8 personas
   - Total general: 32 personas

2. EQUIPO DE PRUEBAS (2 equipos):
   - Ingeniero de pruebas: 1 por equipo
   - Técnico de pruebas: 2 por equipo
   - Operario: 2 por equipo
   - Total por equipo: 5 personas
   - Total general: 10 personas

3. EQUIPO DE SUPERVISIÓN:
   - Ingeniero supervisor: 1
   - Inspector de calidad: 1
   - Coordinador de seguridad: 1
   - Total: 3 personas

TOTAL PERSONAL: 45 personas
```

#### **5.2.2 EQUIPOS Y HERRAMIENTAS**
```
EQUIPOS REQUERIDOS:

1. EQUIPOS DE INSTALACIÓN:
   - Perforadora de concreto: 4 unidades
   - Mezcladora de concreto: 4 unidades
   - Soldadora: 4 unidades
   - Multímetro: 8 unidades
   - Nivel láser: 4 unidades

2. EQUIPOS DE PRUEBAS:
   - Analizador de espectro: 2 unidades
   - Generador de señales: 2 unidades
   - Osciloscopio: 2 unidades
   - Medidor de campo: 2 unidades

3. HERRAMIENTAS MANUALES:
   - Juego de llaves: 8 juegos
   - Destornilladores: 16 unidades
   - Alicates: 16 unidades
   - Martillos: 8 unidades
```

---

## 🔧 **PLAN DE MANTENIMIENTO**

### **6.1 ESTRATEGIA DE MANTENIMIENTO**

#### **6.1.1 MANTENIMIENTO PREVENTIVO**
```
MANTENIMIENTO PREVENTIVO:

FRECUENCIA: MENSUAL
- Inspección visual de balizas
- Verificación de conexiones
- Limpieza de antenas
- Pruebas de comunicación

FRECUENCIA: TRIMESTRAL
- Medición de parámetros eléctricos
- Verificación de nivelación
- Pruebas de resistencia
- Actualización de software

FRECUENCIA: ANUAL
- Reemplazo de componentes
- Calibración de equipos
- Pruebas de rendimiento
- Actualización de configuración
```

#### **6.1.2 MANTENIMIENTO CORRECTIVO**
```
MANTENIMIENTO CORRECTIVO:

RESPUESTA: INMEDIATA (< 2 horas)
- Fallos críticos de comunicación
- Daños por vandalismo
- Fallos de alimentación
- Problemas de seguridad

RESPUESTA: 24 HORAS
- Fallos de comunicación
- Problemas de posicionamiento
- Fallos de software
- Problemas de integración

RESPUESTA: 72 HORAS
- Fallos menores
- Problemas de rendimiento
- Actualizaciones de software
- Mejoras de configuración
```

### **6.2 INVENTARIO DE REPUESTOS**

#### **6.2.1 REPUESTOS CRÍTICOS**
```
REPUESTOS CRÍTICOS:

1. BALIZAS COMPLETAS:
   - Eurobalise estándar: 50 unidades
   - Eurobalise especial: 10 unidades
   - Total: 60 unidades

2. COMPONENTES ELECTRÓNICOS:
   - Antenas: 100 unidades
   - Módulos de comunicación: 50 unidades
   - Fuentes de alimentación: 30 unidades
   - Cables: 5,000 metros

3. COMPONENTES MECÁNICOS:
   - Fundaciones: 20 unidades
   - Anclajes: 100 unidades
   - Tornillería: 500 unidades
   - Sellos: 200 unidades
```

#### **6.2.2 ALMACENAMIENTO**
```
ALMACENAMIENTO DE REPUESTOS:

UBICACIÓN: CENTRO DE MANTENIMIENTO (LA DORADA)
- Área: 200 m²
- Temperatura: 15°C - 25°C
- Humedad: 40% - 60%
- Seguridad: Acceso controlado

DISTRIBUCIÓN:
- Repuestos críticos: 50%
- Repuestos estándar: 30%
- Herramientas: 20%

ROTACIÓN:
- Inventario mensual
- Reabastecimiento automático
- Control de caducidad
- Trazabilidad completa
```

---

## 📊 **MÉTRICAS Y KPI**

### **7.1 MÉTRICAS DE RENDIMIENTO**

| Métrica | Objetivo | Medición | Frecuencia |
|:---|:---:|:---:|:---:|
| **Disponibilidad** | ≥ 99.5% | Balizas operativas/Total | Diaria |
| **Precisión posición** | ±5m | Error de posicionamiento | Por viaje |
| **Tiempo lectura** | ≤ 50ms | Tiempo de lectura | Continua |
| **Tasa de fallos** | ≤ 0.1% | Fallos/Total balizas | Mensual |

### **7.2 MÉTRICAS DE MANTENIMIENTO**

| Métrica | Objetivo | Medición | Frecuencia |
|:---|:---:|:---:|:---:|
| **Tiempo respuesta** | ≤ 2h | Tiempo hasta reparación | Por fallo |
| **MTBF** | ≥ 8760h | Tiempo entre fallos | Mensual |
| **MTTR** | ≤ 4h | Tiempo de reparación | Por fallo |
| **Costo mantenimiento** | ≤ $100/baliza/año | Costo total/Total balizas | Anual |

---

## 📋 **CONTROL DE VERSIONES**

| Versión | Fecha | Responsable | Descripción |
|:---:|:---:|:---|:---|
| **v1.1** | 27/01/2025 | Ing. Sistemas EPC | **Plan Eurobalise 150m** - Fase 1 crítica en desarrollo |
| **v1.0** | 27/01/2025 | Ing. Sistemas EPC | **Plan Eurobalise inicial** - Ubicación cada 150m especificada |
| **v0.1** | 27/01/2025 | Admin. Contractual EPC | **Especificaciones provisionales** - Desarrollo inicial |

---

## ✅ **CONCLUSIONES Y PRÓXIMOS PASOS**

### **🎯 ESTADO ACTUAL**
- ✅ **Plan de Eurobalise desarrollado** con ubicación cada 150m
- ✅ **8,801 balizas especificadas** para el corredor completo
- ✅ **Especificaciones técnicas detalladas** para instalación y mantenimiento
- ✅ **Plan de implementación** con cronograma de 32 semanas

### **🔄 PRÓXIMOS PASOS INMEDIATOS**
1. **Validación técnica** del plan con especialistas
2. **Desarrollo de especificaciones detalladas** de instalación
3. **Plan de pruebas** para validar funcionamiento
4. **Procura de materiales** y equipos

### **📞 CONTACTOS**
- **Responsable Técnico:** Ing. Sistemas EPC
- **Especialista Senior:** Control de Trenes
- **Revisión:** Cada 2 semanas durante desarrollo

---

**Documento desarrollado según estándares UIC 438 y EN 50126/50129**  
**Fecha:** 27 de Enero, 2025  
**Estado:** 🔄 **EN DESARROLLO - FASE 1 CRÍTICA**  
**Próxima actualización:** 3 de Febrero, 2025

