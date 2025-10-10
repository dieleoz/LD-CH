# V.X Sistema Desvíos v5.0 - CONTROL AUTOMATIZADO DE DESVÍOS
## APP La Dorada - Chiriguaná

**Fecha:** Enero 2025  
**Versión:** 5.0  
**Estado:** ✅ **COMPLETADO - METODOLOGÍA v5.0**

---

## 1. MARCO CONTRACTUAL

### 1.1 Base Legal
Documento de ingeniería de detalle para **120 desvíos automatizados** en el corredor ferroviario, **100% ALINEADO CON CRITERIOS TÉCNICOS MAESTROS v1.0**.

### 1.2 Dependencias
**Documentos Base ✅:**
- CRITERIOS_TECNICOS_MAESTRO_v1.0.md ✅
- V.1_Señalizacion_Ferroviaria_Detalle_v5.0.md ✅
- V.2_Centro_Control_Trafico_CTC_v5.0.md ✅
- V.X_Enclavamientos_ENCE_Detalle_v5.0.md ✅

---

## 2. VERIFICACIÓN DE COHERENCIA TÉCNICA

| Criterio | Criterio Maestro | Estado Actual | Coherencia |
|:---------|:-----------------|:--------------|:-----------|
| **Desvíos** | 120 total | 120 total | ✅ 100% |
| **Control** | Automatizado | Automatizado | ✅ 100% |
| **ATP Embarcado** | 15 locomotoras | 15 locomotoras | ✅ 100% |
| **CTC Virtual** | 1 centro | 1 centro | ✅ 100% |

**✅ NINGUNA DESALINEACIÓN DETECTADA**

---

## 3. ARQUITECTURA DEL SISTEMA DE DESVÍOS

### 3.1 Distribución de Desvíos
- **Desvíos principales:** 45 unidades (estaciones)
- **Desvíos secundarios:** 50 unidades (patios)
- **Desvíos de servicio:** 25 unidades (mantenimiento)

### 3.2 Componentes por Desvío
- **Motor de desvío:** Accionamiento eléctrico
- **Detectores de posición:** Sensores de estado
- **Cerradura:** Sistema de seguridad
- **Interfaces:** Comunicación CTC + ATP

---

## 4. ESPECIFICACIONES TÉCNICAS

### 4.1 Motor de Desvío
- **Potencia:** 3 kW
- **Voltaje:** 480 V AC, 3 fases
- **Velocidad:** 5 segundos cambio
- **Par:** 2000 Nm
- **Protección:** IP65

### 4.2 Detectores de Posición
- **Tipo:** Contactos de posición
- **Precisión:** ±1 mm
- **Redundancia:** Doble contacto
- **Comunicación:** Digital I/O

### 4.3 Sistema de Cerradura
- **Tipo:** Cerradura electromagnética
- **Fuerza:** 50 kN
- **Tiempo:** < 2 segundos
- **Seguridad:** SIL 4

---

## 5. FUNCIONALIDADES

### 5.1 Control Automatizado
- **Comando desde CTC:** Control centralizado
- **Verificación de posición:** Confirmación automática
- **Protección de conflictos:** Lógica de seguridad
- **Registro de operaciones:** Auditoría completa

### 5.2 Integración ATP
- **Autorización de cambio:** Desde ATP embarcado
- **Transmisión de posición:** A locomotoras
- **Verificación de cumplimiento:** Monitoreo automático
- **Gestión de excepciones:** Procedimientos de emergencia

### 5.3 Operación Local
- **Control manual:** Panel local
- **Indicación visual:** LEDs de estado
- **Alarmas:** Sonoras y visuales
- **Mantenimiento:** Modo servicio

---

## 6. SEGURIDAD Y CONFIABILIDAD

### 6.1 Seguridad Funcional
- **SIL 4:** Control de desvíos críticos
- **SIL 2:** Desvíos de servicio
- **Redundancia:** Detectores dobles
- **Diversidad:** Diferentes tecnologías

### 6.2 Disponibilidad
- **Objetivo:** 99.9% (8.76 horas/año)
- **Estrategia:** Mantenimiento predictivo
- **Recuperación:** < 2 horas
- **Respaldo:** Operación manual

---

## 7. OPERACIÓN Y MANTENIMIENTO

### 7.1 Operación
- **Monitoreo:** SCADA integrado
- **Control:** Automático desde CTC
- **Alarmas:** Tiempo real
- **Reportes:** Estadísticas de uso

### 7.2 Mantenimiento
- **Preventivo:** Mensual, trimestral
- **Correctivo:** Diagnóstico automático
- **Lubricación:** Automática programada
- **Calibración:** Sensores y actuadores

---

## 8. PRUEBAS Y VALIDACIÓN

### 8.1 Pruebas de Componentes
- **Motor:** Funcionalidad y rendimiento
- **Detectores:** Precisión y confiabilidad
- **Cerradura:** Fuerza y tiempo
- **Comunicaciones:** Interfaces digitales

### 8.2 Pruebas de Sistema
- **Integración:** CTC + ATP + Desvíos
- **Rendimiento:** Disponibilidad 99.9%
- **Seguridad:** Funciones críticas
- **Certificación:** Cumplimiento normativo

---

## 9. ENTREGABLES

### 9.1 Documentación
- **Planos:** Instalación y conexiones
- **Manuales:** Operación y mantenimiento
- **Especificaciones:** Técnicas detalladas
- **Procedimientos:** Pruebas y validación

### 9.2 Equipos
- **120 Motores de desvío**
- **240 Detectores de posición**
- **120 Sistemas de cerradura**
- **Cables y conectores**

---

## 10. CRONOGRAMA

### 10.1 Fases
- **Fase 1:** Diseño detallado (2 meses)
- **Fase 2:** Fabricación (3 meses)
- **Fase 3:** Instalación (4 meses)
- **Fase 4:** Pruebas (2 meses)
- **Fase 5:** Puesta en servicio (1 mes)

### 10.2 Hitos
- **Diseño aprobado:** Mes 2
- **Equipos fabricados:** Mes 5
- **Instalación completa:** Mes 9
- **Pruebas exitosas:** Mes 11
- **Operación comercial:** Mes 12

---

## 11. IMPACTO PRESUPUESTAL

### 11.1 Componentes Desvíos
- **120 Motores:** $2,400,000,000 COP
- **240 Detectores:** $600,000,000 COP
- **120 Cerraduras:** $1,200,000,000 COP
- **Instalación:** $800,000,000 COP
- **TOTAL:** $5,000,000,000 COP

---

## 12. CONCLUSIONES

### 12.1 Estado del Documento
- **Base contractual:** ✅ Actualizada
- **120 desvíos automatizados:** ✅ Alineado con criterios maestros
- **Coherencia técnica:** ✅ 100% verificada
- **Documento completo:** ✅ Listo para implementación

### 12.2 Próximos Pasos
1. **V.X_Sistema_GSM-R_Detalle.md** (GSM-R detalle)
2. **V.X_Sistema_EOT_Detalle.md** (EOT detalle)

---

**Control de versiones:**
| Versión | Fecha | Descripción |
|:---:|:---:|:---|
| v5.0 | Ene-2025 | **COMPLETADO - Metodología v5.0 aplicada** |

---

**Este documento es VIVO y debe actualizarse conforme se complete la corrección documental masiva.**
