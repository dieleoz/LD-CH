# INTERLOCKING TABLES - 5 ESTACIONES PRINCIPALES
## APP La Dorada-Chiriguaná - Tablas de Enclavamiento

**Estado:** 🔄 **EN DESARROLLO - FASE 2 URGENTE**  
**Fecha:** 27 de Enero, 2025  
**Responsable:** Ing. Señalización - EPC  
**Especialista:** Especialista Senior en Control de Trenes  
**Estándar Base:** EN 50126, EN 50129, UIC 438

---

## 🎯 **PROPÓSITO Y ALCANCE**

### **1.1 PROPÓSITO**
Este documento define las **tablas de enclavamiento (interlocking tables)** para las 5 estaciones principales del proyecto APP La Dorada-Chiriguaná, estableciendo la lógica de seguridad para el control de rutas, señales y desvíos.

### **1.2 ALCANCE**
Las tablas de enclavamiento cubrirán:
- **5 estaciones principales:** La Dorada, Puerto Salgar, Honda, Mariquita, Chiriguaná
- **Lógica de rutas** y establecimiento de movimientos
- **Condiciones de seguridad** para cada ruta
- **Interfaces con ITCS** para autorizaciones de movimiento
- **Procedimientos de emergencia** y degradación

### **1.3 REFERENCIAS NORMATIVAS**
- **EN 50126:** Aplicación de técnicas de confiabilidad
- **EN 50129:** Aplicación de técnicas de seguridad
- **UIC 438:** Especificaciones técnicas ETCS Level 2
- **CENELEC EN 50128:** Software para sistemas de control ferroviario

---

## 🚉 **ESTACIONES PRINCIPALES**

### **2.1 LA DORADA (PK 0+000)**

#### **2.1.1 CONFIGURACIÓN DE VÍA**
```
CONFIGURACIÓN ESTACIÓN LA DORADA:

VÍAS PRINCIPALES:
- Vía 1: Principal norte-sur (1,435mm)
- Vía 2: Principal sur-norte (1,435mm)
- Vía 3: Estacionamiento (1,435mm)
- Vía 4: Estacionamiento (1,435mm)

DESVÍOS:
- Desvío 1: Vía 1 ↔ Vía 3
- Desvío 2: Vía 2 ↔ Vía 4
- Desvío 3: Vía 3 ↔ Vía 4

SEÑALES:
- Señal 1: Entrada norte (PK -500)
- Señal 2: Entrada sur (PK +500)
- Señal 3: Salida norte (PK -200)
- Señal 4: Salida sur (PK +200)
- Señal 5: Vía 3 (PK +100)
- Señal 6: Vía 4 (PK +100)
```

#### **2.1.2 TABLA DE ENCLAVAMIENTO LA DORADA**
```
TABLA DE ENCLAVAMIENTO LA DORADA:

RUTA 1: ENTRADA NORTE → VÍA 1
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 1 libre                  │ Libre            │ Detector   │
│ Desvío 1 en posición normal  │ Normal           │ Posición   │
│ Señal 1 en rojo              │ Rojo             │ Estado     │
│ Señal 3 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 1 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘

RUTA 2: ENTRADA NORTE → VÍA 3
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 3 libre                  │ Libre            │ Detector   │
│ Desvío 1 en posición desvío  │ Desvío           │ Posición   │
│ Señal 1 en rojo              │ Rojo             │ Estado     │
│ Señal 5 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 3 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘

RUTA 3: ENTRADA SUR → VÍA 2
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 2 libre                  │ Libre            │ Detector   │
│ Desvío 2 en posición normal  │ Normal           │ Posición   │
│ Señal 2 en rojo              │ Rojo             │ Estado     │
│ Señal 4 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 2 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘

RUTA 4: ENTRADA SUR → VÍA 4
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 4 libre                  │ Libre            │ Detector   │
│ Desvío 2 en posición desvío  │ Desvío           │ Posición   │
│ Señal 2 en rojo              │ Rojo             │ Estado     │
│ Señal 6 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 4 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘

RUTA 5: VÍA 3 → VÍA 4 (TRASBORDO)
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 3 libre                  │ Libre            │ Detector   │
│ Vía 4 libre                  │ Libre            │ Detector   │
│ Desvío 3 en posición normal  │ Normal           │ Posición   │
│ Señal 5 en rojo              │ Rojo             │ Estado     │
│ Señal 6 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 3 bloqueada              │ NO bloqueada     │ Estado     │
│ Vía 4 bloqueada              │ NO bloqueada     │ Estado     │
└─────────────────────────────────────────────────────────┘
```

### **2.2 PUERTO SALGAR (PK 45+000)**

#### **2.2.1 CONFIGURACIÓN DE VÍA**
```
CONFIGURACIÓN ESTACIÓN PUERTO SALGAR:

VÍAS PRINCIPALES:
- Vía 1: Principal norte-sur (1,435mm)
- Vía 2: Principal sur-norte (1,435mm)
- Vía 3: Estacionamiento (1,435mm)

DESVÍOS:
- Desvío 1: Vía 1 ↔ Vía 3
- Desvío 2: Vía 2 ↔ Vía 3

SEÑALES:
- Señal 1: Entrada norte (PK 44+500)
- Señal 2: Entrada sur (PK 45+500)
- Señal 3: Salida norte (PK 44+800)
- Señal 4: Salida sur (PK 45+200)
- Señal 5: Vía 3 (PK 45+100)
```

#### **2.2.2 TABLA DE ENCLAVAMIENTO PUERTO SALGAR**
```
TABLA DE ENCLAVAMIENTO PUERTO SALGAR:

RUTA 1: ENTRADA NORTE → VÍA 1
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 1 libre                  │ Libre            │ Detector   │
│ Desvío 1 en posición normal  │ Normal           │ Posición   │
│ Señal 1 en rojo              │ Rojo             │ Estado     │
│ Señal 3 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 1 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘

RUTA 2: ENTRADA NORTE → VÍA 3
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 3 libre                  │ Libre            │ Detector   │
│ Desvío 1 en posición desvío  │ Desvío           │ Posición   │
│ Señal 1 en rojo              │ Rojo             │ Estado     │
│ Señal 5 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 3 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘

RUTA 3: ENTRADA SUR → VÍA 2
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 2 libre                  │ Libre            │ Detector   │
│ Desvío 2 en posición normal  │ Normal           │ Posición   │
│ Señal 2 en rojo              │ Rojo             │ Estado     │
│ Señal 4 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 2 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘

RUTA 4: ENTRADA SUR → VÍA 3
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 3 libre                  │ Libre            │ Detector   │
│ Desvío 2 en posición desvío  │ Desvío           │ Posición   │
│ Señal 2 en rojo              │ Rojo             │ Estado     │
│ Señal 5 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 3 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘
```

### **2.3 HONDA (PK 78+000)**

#### **2.3.1 CONFIGURACIÓN DE VÍA**
```
CONFIGURACIÓN ESTACIÓN HONDA:

VÍAS PRINCIPALES:
- Vía 1: Principal norte-sur (1,435mm)
- Vía 2: Principal sur-norte (1,435mm)
- Vía 3: Estacionamiento (1,435mm)
- Vía 4: Estacionamiento (1,435mm)

DESVÍOS:
- Desvío 1: Vía 1 ↔ Vía 3
- Desvío 2: Vía 2 ↔ Vía 4
- Desvío 3: Vía 3 ↔ Vía 4

SEÑALES:
- Señal 1: Entrada norte (PK 77+500)
- Señal 2: Entrada sur (PK 78+500)
- Señal 3: Salida norte (PK 77+800)
- Señal 4: Salida sur (PK 78+200)
- Señal 5: Vía 3 (PK 78+100)
- Señal 6: Vía 4 (PK 78+100)
```

#### **2.3.2 TABLA DE ENCLAVAMIENTO HONDA**
```
TABLA DE ENCLAVAMIENTO HONDA:

RUTA 1: ENTRADA NORTE → VÍA 1
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 1 libre                  │ Libre            │ Detector   │
│ Desvío 1 en posición normal  │ Normal           │ Posición   │
│ Señal 1 en rojo              │ Rojo             │ Estado     │
│ Señal 3 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 1 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘

RUTA 2: ENTRADA NORTE → VÍA 3
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 3 libre                  │ Libre            │ Detector   │
│ Desvío 1 en posición desvío  │ Desvío           │ Posición   │
│ Señal 1 en rojo              │ Rojo             │ Estado     │
│ Señal 5 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 3 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘

RUTA 3: ENTRADA SUR → VÍA 2
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 2 libre                  │ Libre            │ Detector   │
│ Desvío 2 en posición normal  │ Normal           │ Posición   │
│ Señal 2 en rojo              │ Rojo             │ Estado     │
│ Señal 4 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 2 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘

RUTA 4: ENTRADA SUR → VÍA 4
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 4 libre                  │ Libre            │ Detector   │
│ Desvío 2 en posición desvío  │ Desvío           │ Posición   │
│ Señal 2 en rojo              │ Rojo             │ Estado     │
│ Señal 6 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 4 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘

RUTA 5: VÍA 3 → VÍA 4 (TRASBORDO)
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 3 libre                  │ Libre            │ Detector   │
│ Vía 4 libre                  │ Libre            │ Detector   │
│ Desvío 3 en posición normal  │ Normal           │ Posición   │
│ Señal 5 en rojo              │ Rojo             │ Estado     │
│ Señal 6 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 3 bloqueada              │ NO bloqueada     │ Estado     │
│ Vía 4 bloqueada              │ NO bloqueada     │ Estado     │
└─────────────────────────────────────────────────────────┘
```

### **2.4 MARIQUITA (PK 156+000)**

#### **2.4.1 CONFIGURACIÓN DE VÍA**
```
CONFIGURACIÓN ESTACIÓN MARIQUITA:

VÍAS PRINCIPALES:
- Vía 1: Principal norte-sur (1,435mm)
- Vía 2: Principal sur-norte (1,435mm)
- Vía 3: Estacionamiento (1,435mm)

DESVÍOS:
- Desvío 1: Vía 1 ↔ Vía 3
- Desvío 2: Vía 2 ↔ Vía 3

SEÑALES:
- Señal 1: Entrada norte (PK 155+500)
- Señal 2: Entrada sur (PK 156+500)
- Señal 3: Salida norte (PK 155+800)
- Señal 4: Salida sur (PK 156+200)
- Señal 5: Vía 3 (PK 156+100)
```

#### **2.4.2 TABLA DE ENCLAVAMIENTO MARIQUITA**
```
TABLA DE ENCLAVAMIENTO MARIQUITA:

RUTA 1: ENTRADA NORTE → VÍA 1
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 1 libre                  │ Libre            │ Detector   │
│ Desvío 1 en posición normal  │ Normal           │ Posición   │
│ Señal 1 en rojo              │ Rojo             │ Estado     │
│ Señal 3 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 1 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘

RUTA 2: ENTRADA NORTE → VÍA 3
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 3 libre                  │ Libre            │ Detector   │
│ Desvío 1 en posición desvío  │ Desvío           │ Posición   │
│ Señal 1 en rojo              │ Rojo             │ Estado     │
│ Señal 5 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 3 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘

RUTA 3: ENTRADA SUR → VÍA 2
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 2 libre                  │ Libre            │ Detector   │
│ Desvío 2 en posición normal  │ Normal           │ Posición   │
│ Señal 2 en rojo              │ Rojo             │ Estado     │
│ Señal 4 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 2 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘

RUTA 4: ENTRADA SUR → VÍA 3
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 3 libre                  │ Libre            │ Detector   │
│ Desvío 2 en posición desvío  │ Desvío           │ Posición   │
│ Señal 2 en rojo              │ Rojo             │ Estado     │
│ Señal 5 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 3 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘
```

### **2.5 CHIRIGUANÁ (PK 1,291+000)**

#### **2.5.1 CONFIGURACIÓN DE VÍA**
```
CONFIGURACIÓN ESTACIÓN CHIRIGUANÁ:

VÍAS PRINCIPALES:
- Vía 1: Principal norte-sur (1,435mm)
- Vía 2: Principal sur-norte (1,435mm)
- Vía 3: Estacionamiento (1,435mm)
- Vía 4: Estacionamiento (1,435mm)

DESVÍOS:
- Desvío 1: Vía 1 ↔ Vía 3
- Desvío 2: Vía 2 ↔ Vía 4
- Desvío 3: Vía 3 ↔ Vía 4

SEÑALES:
- Señal 1: Entrada norte (PK 1,290+500)
- Señal 2: Entrada sur (PK 1,291+500)
- Señal 3: Salida norte (PK 1,290+800)
- Señal 4: Salida sur (PK 1,291+200)
- Señal 5: Vía 3 (PK 1,291+100)
- Señal 6: Vía 4 (PK 1,291+100)
```

#### **2.5.2 TABLA DE ENCLAVAMIENTO CHIRIGUANÁ**
```
TABLA DE ENCLAVAMIENTO CHIRIGUANÁ:

RUTA 1: ENTRADA NORTE → VÍA 1
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 1 libre                  │ Libre            │ Detector   │
│ Desvío 1 en posición normal  │ Normal           │ Posición   │
│ Señal 1 en rojo              │ Rojo             │ Estado     │
│ Señal 3 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 1 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘

RUTA 2: ENTRADA NORTE → VÍA 3
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 3 libre                  │ Libre            │ Detector   │
│ Desvío 1 en posición desvío  │ Desvío           │ Posición   │
│ Señal 1 en rojo              │ Rojo             │ Estado     │
│ Señal 5 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 3 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘

RUTA 3: ENTRADA SUR → VÍA 2
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 2 libre                  │ Libre            │ Detector   │
│ Desvío 2 en posición normal  │ Normal           │ Posición   │
│ Señal 2 en rojo              │ Rojo             │ Estado     │
│ Señal 4 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 2 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘

RUTA 4: ENTRADA SUR → VÍA 4
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 4 libre                  │ Libre            │ Detector   │
│ Desvío 2 en posición desvío  │ Desvío           │ Posición   │
│ Señal 2 en rojo              │ Rojo             │ Estado     │
│ Señal 6 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 4 bloqueada              │ NO bloqueada     │ Estado     │
│ Mantenimiento activo         │ NO activo        │ Estado     │
└─────────────────────────────────────────────────────────┘

RUTA 5: VÍA 3 → VÍA 4 (TRASBORDO)
┌─────────────────────────────────────────────────────────┐
│ Condición                    │ Estado Requerido │ Validación │
├─────────────────────────────────────────────────────────┤
│ Vía 3 libre                  │ Libre            │ Detector   │
│ Vía 4 libre                  │ Libre            │ Detector   │
│ Desvío 3 en posición normal  │ Normal           │ Posición   │
│ Señal 5 en rojo              │ Rojo             │ Estado     │
│ Señal 6 en rojo              │ Rojo             │ Estado     │
│ ITCS autorización            │ Autorizada       │ RBC        │
│ CTC autorización             │ Autorizada       │ CTC        │
│ Vía 3 bloqueada              │ NO bloqueada     │ Estado     │
│ Vía 4 bloqueada              │ NO bloqueada     │ Estado     │
└─────────────────────────────────────────────────────────┘
```

---

## 🔧 **LÓGICA DE ENCLAVAMIENTO**

### **3.1 PRINCIPIOS DE SEGURIDAD**

#### **3.1.1 PRINCIPIO DE EXCLUSIÓN MUTUA**
```
PRINCIPIO DE EXCLUSIÓN MUTUA:

DEFINICIÓN:
- Solo una ruta puede estar establecida a la vez
- Rutas conflictivas no pueden coexistir
- Desvíos deben estar en posición correcta
- Señales deben estar en estado correcto

IMPLEMENTACIÓN:
- Validación de todas las condiciones
- Bloqueo automático de rutas conflictivas
- Liberación automática al completar ruta
- Monitoreo continuo de estado
```

#### **3.1.2 PRINCIPIO DE INTEGRIDAD DE VÍA**
```
PRINCIPIO DE INTEGRIDAD DE VÍA:

DEFINICIÓN:
- Vía debe estar libre antes de autorizar movimiento
- Detección de presencia de tren
- Validación de integridad de vía
- Confirmación de liberación de vía

IMPLEMENTACIÓN:
- Detectores de tren en cada sección
- Validación de integridad de vía
- Confirmación de liberación
- Monitoreo continuo de estado
```

### **3.2 INTERFACES CON SISTEMAS**

#### **3.2.1 INTERFACE CON ITCS**
```
INTERFACE CON ITCS:

MENSAJES RECIBIDOS:
- Autorización de movimiento (MA)
- Estado del tren
- Posición del tren
- Velocidad del tren

MENSAJES ENVIADOS:
- Estado de vía
- Estado de señales
- Estado de desvíos
- Confirmación de ruta

PROTOCOLO:
- Formato: FFFIS
- Frecuencia: Cada 10 segundos
- Prioridad: Alta
- Validación: Checksum + CRC32
```

#### **3.2.2 INTERFACE CON CTC**
```
INTERFACE CON CTC:

MENSAJES RECIBIDOS:
- Comando de establecimiento de ruta
- Comando de liberación de ruta
- Comando de cambio de desvío
- Comando de cambio de señal

MENSAJES ENVIADOS:
- Estado de rutas
- Estado de señales
- Estado de desvíos
- Alertas y alarmas

PROTOCOLO:
- Formato: SCI-CC-A
- Frecuencia: Cada 5 segundos
- Prioridad: Media
- Validación: Checksum + CRC32
```

---

## 📊 **PROCEDIMIENTOS DE EMERGENCIA**

### **4.1 PROCEDIMIENTOS DE DEGRADACIÓN**

#### **4.1.1 MODO DEGRADADO**
```
MODO DEGRADADO:

CONDICIONES DE ACTIVACIÓN:
- Fallo de comunicación con ITCS
- Fallo de comunicación con CTC
- Fallo de detectores de vía
- Fallo de sistema de señales

PROCEDIMIENTOS:
1. Activación automática de modo degradado
2. Notificación a operadores
3. Implementación de procedimientos manuales
4. Monitoreo continuo de seguridad
5. Restauración automática cuando sea posible

CARACTERÍSTICAS:
- Operación manual de señales
- Procedimientos de seguridad mantenidos
- Comunicación alternativa disponible
- Monitoreo continuo de estado
```

#### **4.1.2 MODO DE EMERGENCIA**
```
MODO DE EMERGENCIA:

CONDICIONES DE ACTIVACIÓN:
- Fallo crítico del sistema
- Situación de emergencia
- Orden de parada de emergencia
- Fallo de seguridad

PROCEDIMIENTOS:
1. Activación inmediata de parada de emergencia
2. Señales en rojo automáticamente
3. Notificación a todos los operadores
4. Implementación de procedimientos de emergencia
5. Evaluación de situación por personal especializado

CARACTERÍSTICAS:
- Parada inmediata de todos los movimientos
- Señales en rojo en todas las rutas
- Comunicación de emergencia activada
- Personal de emergencia desplegado
```

### **4.2 PROCEDIMIENTOS DE RECUPERACIÓN**

#### **4.2.1 RECUPERACIÓN AUTOMÁTICA**
```
RECUPERACIÓN AUTOMÁTICA:

CONDICIONES:
- Restauración de comunicación
- Reparación de fallos menores
- Validación de integridad del sistema
- Confirmación de seguridad

PROCEDIMIENTOS:
1. Detección automática de restauración
2. Validación de integridad del sistema
3. Pruebas automáticas de funcionamiento
4. Restauración gradual de funciones
5. Confirmación de operación normal

CARACTERÍSTICAS:
- Recuperación automática sin intervención
- Validación completa antes de restauración
- Notificación de restauración
- Monitoreo continuo post-restauración
```

#### **4.2.2 RECUPERACIÓN MANUAL**
```
RECUPERACIÓN MANUAL:

CONDICIONES:
- Fallos críticos del sistema
- Fallos de seguridad
- Fallos de comunicación prolongados
- Situaciones de emergencia

PROCEDIMIENTOS:
1. Evaluación manual de la situación
2. Implementación de procedimientos manuales
3. Reparación de fallos identificados
4. Pruebas manuales de funcionamiento
5. Restauración gradual con validación

CARACTERÍSTICAS:
- Intervención de personal especializado
- Procedimientos manuales detallados
- Validación exhaustiva
- Documentación completa del proceso
```

---

## 📋 **PLAN DE IMPLEMENTACIÓN**

### **5.1 CRONOGRAMA DE DESARROLLO**

#### **5.1.1 FASES DE DESARROLLO**
```
FASE 1: ESPECIFICACIÓN (1 semana)
- Desarrollo de tablas de enclavamiento
- Validación de lógica de seguridad
- Definición de interfaces
- Especificación de procedimientos

FASE 2: IMPLEMENTACIÓN (2 semanas)
- Desarrollo de software de enclavamiento
- Implementación de interfaces
- Pruebas unitarias
- Integración con sistemas

FASE 3: PRUEBAS (1 semana)
- Pruebas de integración
- Pruebas de seguridad
- Pruebas de rendimiento
- Validación de procedimientos

FASE 4: PUESTA EN SERVICIO (1 semana)
- Instalación en campo
- Pruebas de aceptación
- Capacitación de operadores
- Documentación final
```

#### **5.1.2 CRONOGRAMA DETALLADO**
```
SEMANA 1: Especificación detallada
- Día 1-2: Desarrollo de tablas
- Día 3-4: Validación de lógica
- Día 5: Definición de interfaces

SEMANA 2: Implementación inicial
- Día 1-3: Desarrollo de software
- Día 4-5: Implementación de interfaces

SEMANA 3: Implementación final
- Día 1-2: Pruebas unitarias
- Día 3-5: Integración con sistemas

SEMANA 4: Pruebas y validación
- Día 1-2: Pruebas de integración
- Día 3-4: Pruebas de seguridad
- Día 5: Validación final
```

### **5.2 RECURSOS REQUERIDOS**

#### **5.2.1 PERSONAL TÉCNICO**
```
PERSONAL REQUERIDO:

1. EQUIPO DE DESARROLLO:
   - Ingeniero de Señalización: 1
   - Desarrollador de Software: 2
   - Especialista en Seguridad: 1
   - Técnico de Pruebas: 1
   - Total: 5 personas

2. EQUIPO DE VALIDACIÓN:
   - Especialista en Enclavamientos: 1
   - Especialista en ITCS: 1
   - Especialista en CTC: 1
   - Total: 3 personas

3. EQUIPO DE IMPLEMENTACIÓN:
   - Técnico de Campo: 2
   - Especialista en Integración: 1
   - Total: 3 personas

TOTAL PERSONAL: 11 personas
```

#### **5.2.2 EQUIPOS Y HERRAMIENTAS**
```
EQUIPOS REQUERIDOS:

1. EQUIPOS DE DESARROLLO:
   - Servidores de desarrollo: 2
   - Estaciones de trabajo: 4
   - Software de desarrollo: Licencias
   - Herramientas de simulación: Licencias

2. EQUIPOS DE PRUEBAS:
   - Simulador de ITCS: 1
   - Simulador de CTC: 1
   - Equipos de prueba: 2
   - Herramientas de medición: 4

3. EQUIPOS DE CAMPO:
   - Equipos de instalación: 2
   - Herramientas de campo: 4
   - Equipos de prueba: 2
   - Vehículos: 2
```

---

## 📊 **MÉTRICAS Y KPI**

### **6.1 MÉTRICAS DE RENDIMIENTO**

| Métrica | Objetivo | Medición | Frecuencia |
|:---|:---:|:---:|:---:|
| **Disponibilidad** | ≥ 99.95% | Uptime/Tiempo total | Diaria |
| **Tiempo establecimiento** | ≤ 30s | Tiempo de establecimiento | Por ruta |
| **Tiempo liberación** | ≤ 15s | Tiempo de liberación | Por ruta |
| **Tasa de fallos** | ≤ 0.1% | Fallos/Total rutas | Mensual |

### **6.2 MÉTRICAS DE SEGURIDAD**

| Métrica | Objetivo | Medición | Frecuencia |
|:---|:---:|:---:|:---:|
| **Detección de fallos** | ≤ 1s | Tiempo detección | Por fallo |
| **Respuesta emergencia** | ≤ 5s | Tiempo respuesta | Por evento |
| **SIL compliance** | 100% | Cumplimiento SIL | Mensual |
| **MTBF** | ≥ 8760h | Tiempo entre fallos | Mensual |

---

## 📋 **CONTROL DE VERSIONES**

| Versión | Fecha | Responsable | Descripción |
|:---:|:---:|:---|:---|
| **v1.1** | 27/01/2025 | Ing. Señalización EPC | **Interlocking Tables 5 Estaciones** - Fase 2 urgente en desarrollo |
| **v1.0** | 27/01/2025 | Ing. Señalización EPC | **Interlocking Tables inicial** - 5 estaciones especificadas |
| **v0.1** | 27/01/2025 | Admin. Contractual EPC | **Especificaciones provisionales** - Desarrollo inicial |

---

## ✅ **CONCLUSIONES Y PRÓXIMOS PASOS**

### **🎯 ESTADO ACTUAL**
- ✅ **Tablas de enclavamiento desarrolladas** para 5 estaciones principales
- ✅ **Lógica de seguridad especificada** con principios de exclusión mutua
- ✅ **Interfaces con ITCS y CTC** definidas y especificadas
- ✅ **Procedimientos de emergencia** y degradación establecidos

### **🔄 PRÓXIMOS PASOS INMEDIATOS**
1. **Validación técnica** de las tablas con especialistas
2. **Desarrollo de software** de enclavamiento
3. **Implementación de interfaces** con sistemas externos
4. **Pruebas de integración** y validación

### **📞 CONTACTOS**
- **Responsable Técnico:** Ing. Señalización EPC
- **Especialista Senior:** Control de Trenes
- **Revisión:** Cada 2 semanas durante desarrollo

---

**Documento desarrollado según estándares EN 50126, EN 50129 y UIC 438**  
**Fecha:** 27 de Enero, 2025  
**Estado:** 🔄 **EN DESARROLLO - FASE 2 URGENTE**  
**Próxima actualización:** 3 de Febrero, 2025















