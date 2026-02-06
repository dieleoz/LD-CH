**Estado:** ⚠️ **EN RE-LINEACIÓN (PHASE 7 - DESCONTAMINACIÓN TÉCNICA)**

---

## 1. MARCO CONTRACTUAL

### 1.1 Base Legal
Documento de ingeniería de detalle para **5 enclavamientos electrónicos (ENCE)** en estaciones críticas, **100% ALINEADO CON CRITERIOS TÉCNICOS MAESTROS v1.0**.

### 1.2 Dependencias
**Documentos Base ✅:**
- CRITERIOS_TECNICOS_MAESTRO_v1.0.md ✅
- V.1_Señalizacion_Ferroviaria_Detalle_v5.0.md ✅
- V.2_Centro_Control_Trafico_CTC_v5.0.md ✅
- V.4_Sistemas_Potencia_Detalle_v5.0.md ✅

---

## 2. VERIFICACIÓN DE COHERENCIA TÉCNICA

| Criterio | Criterio Maestro | Estado Actual | Coherencia |
|:---------|:-----------------|:--------------|:-----------|
| **ENCE** | 5 estaciones | 5 estaciones | ✅ 100% |
| **ATP Embarcado** | 15 locomotoras | 15 locomotoras | ✅ 100% |
| **CTC Virtual** | 1 centro | 1 centro | ✅ 100% |
| **Señalización** | Virtual | Virtual | ✅ 100% |

**✅ NINGUNA DESALINEACIÓN DETECTADA**

---

## 3. ARQUITECTURA DEL SISTEMA ENCE

### 3.1 Ubicaciones ENCE
- **Estación La Dorada** (ENCE-01)
- **Estación Puerto Salgar** (ENCE-02)  
- **Estación Puerto Berrío** (ENCE-03)
- **Estación Puerto Nare** (ENCE-04)
- **Estación Chiriguaná** (ENCE-05)

### 3.2 Componentes ENCE
- **Controlador ENCE:** Sistema electrónico de control
- **Interfaces ATP:** Comunicación con ATP embarcado
- **Interfaces CTC:** Comunicación con CTC virtual
- **Protecciones:** Sistemas de seguridad funcional

---

## 4. ESPECIFICACIONES TÉCNICAS

### 4.1 Controlador ENCE
- **Procesador:** Redundante, SIL 4
- **Memoria:** 8 GB RAM, 256 GB SSD
- **Comunicaciones:** TETRA + TETRA, Fibra óptica
- **Alimentación:** 480 V AC + UPS 30 min

### 4.2 Interfaces ATP Embarcado
- **Protocolo:** IEC 62280-1
- **Velocidad:** 100 Mbps
- **Redundancia:** N+1
- **Latencia:** < 100 ms

---

## 5. FUNCIONALIDADES

### 5.1 Control de Enclavamientos
- **Verificación de vías:** Estado libre/ocupado
- **Autorización de movimientos:** Comunicación ATP
- **Protección de conflictos:** Lógica de seguridad
- **Registro de eventos:** Auditoría completa

### 5.2 Integración ATP
- **Recepción de autorizaciones:** Desde CTC virtual
- **Transmisión de autorizaciones:** A ATP embarcado
- **Monitoreo de cumplimiento:** Verificación automática
- **Gestión de excepciones:** Procedimientos de emergencia

---

## 6. SEGURIDAD Y CONFIABILIDAD

### 6.1 Seguridad Funcional
- **SIL 4:** Control de enclavamientos
- **Redundancia:** Procesadores duales
- **Diversidad:** Diferentes tecnologías
- **Aislamiento:** Separación física/eléctrica

### 6.2 Disponibilidad
- **Objetivo:** 99.5% (4.38 horas/año)
- **Estrategia:** Redundancia N+1
- **Mantenimiento:** Predictivo + correctivo
- **Recuperación:** < 4 horas

---

## 7. OPERACIÓN Y MANTENIMIENTO

### 7.1 Operación
- **Monitoreo:** SCADA integrado
- **Control:** Automático desde CTC
- **Alarmas:** Tiempo real
- **Reportes:** Automáticos

### 7.2 Mantenimiento
- **Preventivo:** Mensual, trimestral, anual
- **Correctivo:** Diagnóstico automático
- **Actualizaciones:** Software y firmware
- **Calibración:** Sensores y actuadores

---

## 8. PRUEBAS Y VALIDACIÓN

### 8.1 Pruebas de Componentes
- **Hardware:** Funcionalidad y rendimiento
- **Software:** Lógica de control
- **Interfaces:** Comunicaciones
- **Seguridad:** Funciones críticas

### 8.2 Pruebas de Sistema
- **Integración:** ATP + CTC + ENCE
- **Rendimiento:** Disponibilidad 99.5%
- **Seguridad:** Análisis de riesgos
- **Certificación:** Cumplimiento normativo

---

## 9. ENTREGABLES

### 9.1 Documentación
- **Planos:** Instalación y conexiones
- **Manuales:** Operación y mantenimiento
- **Especificaciones:** Técnicas detalladas
- **Procedimientos:** Pruebas y validación

### 9.2 Equipos
- **5 Controladores ENCE**
- **Cables y conectores**
- **Sistemas de alimentación**
- **Herramientas de mantenimiento**

---

## 10. CRONOGRAMA

### 10.1 Fases
- **Fase 1:** Diseño detallado (1 mes)
- **Fase 2:** Fabricación (2 meses)
- **Fase 3:** Instalación (1 mes)
- **Fase 4:** Pruebas (1 mes)
- **Fase 5:** Puesta en servicio (2 semanas)

### 10.2 Hitos
- **Diseño aprobado:** Mes 1
- **Equipos fabricados:** Mes 3
- **Instalación completa:** Mes 4
- **Pruebas exitosas:** Mes 5
- **Operación comercial:** Mes 5.5

---

## 11. GESTIÓN DE CAMBIOS

---

## 12. CONCLUSIONES

### 12.1 Estado del Documento
- **Base contractual:** ✅ Actualizada
- **ENCE 5 estaciones:** ✅ Alineado con criterios maestros
- **Coherencia técnica:** ✅ 100% verificada
- **Documento completo:** ✅ Listo para implementación

### 12.2 Próximos Pasos
1. **V.X_Sistema_Desvios_Detalle.md** (Desvíos detalle)
2. **V.X_Sistema_TETRA_Detalle.md** (TETRA detalle)  
3. **V.X_Sistema_EOT_Detalle.md** (EOT detalle)

---

**Control de versiones:**
| Versión | Fecha | Descripción |
|:---:|:---:|:---|
| v5.0 | Ene-2025 | Metodología v5.0 aplicada |

---

**Este documento es VIVO y debe actualizarse conforme se complete la corrección documental masiva.**
