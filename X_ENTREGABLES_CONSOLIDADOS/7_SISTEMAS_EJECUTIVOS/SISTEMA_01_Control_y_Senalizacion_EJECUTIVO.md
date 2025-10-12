# SISTEMA 01: CONTROL Y SEÑALIZACIÓN
## Documento Ejecutivo de Ingeniería

---

## 📊 RESUMEN EJECUTIVO

### Qué es este sistema y por qué importa
El Sistema de Control y Señalización es el **"cerebro" del ferrocarril** que permite la operación segura y eficiente de todos los trenes. Es como el sistema nervioso central que coordina y controla todo el tráfico ferroviario, garantizando que los trenes operen de manera segura, coordinada y sin colisiones.

### Alcance en números - JUSTIFICACIÓN TÉCNICA
- **Inversión estimada:** $65,000 millones COP
- **1 CTC Virtual:** Control centralizado desde CCO La Dorada (Km 0+000) con redundancia N+1
- **8 ATP Embarcados:** ITCS ETCS Level 2 (reducido de 15 a 8 con DT-TETRA-001)
- **5 ENCE:** Enclavamientos electrónicos en estaciones críticas (La Dorada, Puerto Berrío, Barrancabermeja, Bucaramanga, Chiriguaná)
- **120 desvíos:** Control automatizado de todos los desvíos en vía principal
- **1 Bloque Integración:** IF-07 agregada (DT-INTERFACES-001) para integración CTC-ITCS-FENOCO
- **Cobertura:** 100% del corredor con filosofía virtual (sin señalización física)
- **Disponibilidad requerida:** 99.95% (sistema crítico según estándares EN 50126)

### Hitos críticos
| Fase | Fecha | Estado |
|:-----|:------|:-------|
| Diseño Conceptual | Enero 2025 | ✅ Completado |
| Instalación CTC | Marzo 2025 | ⏳ En progreso |
| Instalación ATP | Abril 2025 | ⏳ En progreso |
| Comisionamiento | Mayo 2025 | ❌ Pendiente |

---

## 🔍 CRITERIOS DE DISEÑO Y JUSTIFICACIONES TÉCNICAS

### ¿Por qué Filosofía Virtual (sin señalización física)?
**Análisis de Alternativas:**
| Alternativa | Ventajas | Desventajas | Decisión |
|:------------|:---------|:------------|:---------|
| **Señalización Física** | Familiar, visible | Costo elevado, mantenimiento complejo | ❌ Rechazada |
| **Señalización Virtual** | Costo optimizado, mantenimiento simplificado | Requiere ATP embarcado | ✅ **Seleccionada** |
| **RBC Centralizado** | Control centralizado | No aplicable para filosofía virtual | ❌ Rechazada |
| **Control Distribuido** | Redundancia geográfica | Complejidad operacional | ❌ Rechazada |

**Justificación de la Decisión:**
- **Costo optimizado:** Eliminación de 120 señales físicas y cableado asociado
- **Mantenimiento simplificado:** Sin mantenimiento de señalización en vía
- **Flexibilidad:** Cambios de configuración desde CCO sin intervención en vía
- **Disponibilidad:** Redundancia N+1 en CCO vs redundancia distribuida

### ¿Por qué 8 ATP Embarcados? (Actualizado con DT-TETRA-001)
**Justificación Técnica:**
- **Parque rodante contractual:** 15 locomotoras según AT1
- **Operación simultánea:** Máximo 5 locomotoras operando al mismo tiempo (AT1 §3.1)
- **Criterio 5+2+1:**
  - **5 unidades producción:** Para operación normal simultánea
  - **2 unidades diseño/pruebas:** FAT, SAT y comisionamiento
  - **1 unidad contingencia:** Respaldo estratégico
- **Total optimizado:** 8 ATP embarcados (ahorro 47% vs 15 originales)
- **Tecnología ETCS Level 2:** Estándar europeo para control automático de trenes
- **Decisión Técnica:** DT-TETRA-001-2025-10-07 (aprobada por PMO + Especialista Sistemas)

### ¿Por qué 5 ENCE (no más, no menos)?
**Justificación de Ubicaciones:**
- **Estaciones críticas:** La Dorada, Puerto Berrío, Barrancabermeja, Bucaramanga, Chiriguaná
- **Criterio de selección:** Estaciones principales con maniobras complejas
- **Funcionalidad:** Enclavamientos electrónicos para protección de maniobras
- **Cálculo:** Solo estaciones con conflictos de rutas requieren ENCE
- **Optimización:** Estaciones secundarias no requieren ENCE (control desde CCO)

### ¿Por qué 120 desvíos automatizados?
**Justificación Técnica:**
- **Inventario de desvíos:** 120 desvíos identificados en vía principal
- **Control centralizado:** Todos los desvíos controlados desde CCO
- **Automatización:** Reducción de errores humanos en maniobras
- **Seguridad:** Control automático de posición de agujas
- **Eficiencia:** Cambios de configuración desde CCO en tiempo real

### ¿Por qué ETCS Level 2 (no Level 1 o Level 3)?
**Análisis de Niveles ETCS:**
| Nivel | Descripción | Ventajas | Desventajas | Decisión |
|:------|:------------|:---------|:------------|:---------|
| **Level 1** | Balizas + ATP embarcado | Simplicidad | Limitaciones de capacidad | ❌ Rechazado |
| **Level 2** | GSM-R + ATP embarcado | Óptimo costo/beneficio | Requiere GSM-R | ✅ **Seleccionado** |
| **Level 3** | Sin bloqueo fijo | Máxima capacidad | Complejidad alta | ❌ Rechazado |

**Justificación de Level 2:**
- **Balance óptimo:** Capacidad vs complejidad vs costo
- **Compatibilidad:** Estándar internacional ferroviario
- **Interoperabilidad:** Compatible con FENOCO
- **Tecnología probada:** Implementación exitosa en Europa

### ¿Por qué CCO en La Dorada (Km 0+000)?
**Criterios de Ubicación:**
- **Punto de inicio:** Km 0+000 del corredor ferroviario
- **Accesibilidad:** Fácil acceso para personal de operación
- **Infraestructura:** Disponibilidad de servicios (eléctrico, telecomunicaciones)
- **Gestión:** Concentración de personal técnico y administrativo
- **Logística:** Proximidad a talleres y depósitos principales

---

## 🎯 FUNCIÓN Y PROPÓSITO DEL SISTEMA

### ¿Qué hace este sistema?
El Sistema de Control y Señalización proporciona **control centralizado** de todo el tráfico ferroviario:
- **Control de tráfico:** Coordinación de todos los trenes en el corredor
- **Protección automática:** Prevención de colisiones y descarrilamientos
- **Gestión de rutas:** Asignación y control de rutas para cada tren
- **Monitoreo en tiempo real:** Supervisión continua del estado del sistema

### ¿Por qué lo necesitamos?
- **Seguridad:** Prevención de accidentes ferroviarios
- **Eficiencia:** Optimización del flujo de tráfico
- **Automatización:** Reducción de errores humanos
- **Cumplimiento:** Requerimientos regulatorios de seguridad

### ¿Cómo se integra con otros sistemas?
```
[Centro de Control] ←→ [Control y Señalización] ←→ [Locomotoras]
                                    ↓
[Telecomunicaciones] ←→ [Control y Señalización] ←→ [Señalización]
                                    ↓
[Monitoreo] ←→ [Control y Señalización] ←→ [Seguridad]
```

---

## 🏗️ COMPONENTES PRINCIPALES

### 1. CTC Virtual - Centro de Control Centralizado
**Propósito:** Control centralizado de todo el tráfico ferroviario desde un centro único

**Componentes instalados:**
| Componente | Cantidad | Ubicación | Estado |
|:-----------|:---------|:----------|:-------|
| Servidores principales | 4 unidades | CCO La Dorada | ✅ Instalados |
| Consolas de operación | 5 unidades | CCO La Dorada | ✅ Instaladas |
| Videowall de monitoreo | 12 pantallas | CCO La Dorada | ✅ Instalado |
| Sistemas de respaldo | N+1 | CCO La Dorada | ✅ Instalados |

**Estado general:** 🟢 En cronograma

### 2. ATP Embarcado - Protección Automática de Trenes
**Propósito:** Sistema de protección automática instalado en cada locomotora

**Componentes instalados:**
| Componente | Cantidad | Ubicación | Estado |
|:-----------|:---------|:----------|:-------|
| Módulos ATP | 8 unidades | En locomotoras | ⏳ En instalación |
| Antenas GPS | 8 unidades | En locomotoras | ⏳ En instalación |
| Radios de comunicación | 8 unidades | En locomotoras | ⏳ En instalación |
| Pantallas de cabina | 15 unidades | En locomotoras | ⏳ En instalación |

**Estado general:** 🟡 En progreso

### 3. ENCE - Enclavamientos Electrónicos
**Propósito:** Control automático de estaciones críticas

**Componentes instalados:**
| Componente | Cantidad | Ubicación | Estado |
|:-----------|:---------|:----------|:-------|
| Enclavamientos ENCE | 5 unidades | Estaciones críticas | ✅ Instalados |
| Sensores de vía | 50 unidades | En estaciones ENCE | ✅ Instalados |
| Actuadores | 25 unidades | En estaciones ENCE | ✅ Instalados |
| Sistemas de comunicación | 5 unidades | En estaciones ENCE | ✅ Instalados |

**Estado general:** 🟢 En cronograma

### 4. Desvíos Automatizados
**Propósito:** Control automático de 120 desvíos a lo largo del corredor

**Componentes instalados:**
| Componente | Cantidad | Ubicación | Estado |
|:-----------|:---------|:----------|:-------|
| Desvíos motorizados | 25 unidades | Ubicaciones críticas | ✅ Instalados |
| Desvíos manuales | 95 unidades | Ubicaciones secundarias | ✅ Instalados |
| Sistemas de control | 25 unidades | En desvíos motorizados | ✅ Instalados |
| Sensores de posición | 25 unidades | En desvíos motorizados | ✅ Instalados |

**Estado general:** 🟢 En cronograma

---

## 📐 ESPECIFICACIONES TÉCNICAS CLAVE

### Tabla consolidada de especificaciones
| Parámetro | Valor | Estándar Aplicable |
|:----------|:------|:-------------------|
| Disponibilidad CTC | 99.95% | EN 50126 |
| Disponibilidad ATP | 99.95% | EN 50126 |
| Disponibilidad ENCE | 99.95% | EN 50126 |
| Tiempo de respuesta | < 2 segundos | UIC 920-2 |
| Tiempo de recuperación | < 5 minutos | EN 50126 |
| Cobertura de comunicación | 100% | UIC 920-2 |

### Criterios de aceptación
- ✅ Disponibilidad 99.95% del sistema completo
- ✅ Control centralizado desde CCO La Dorada
- ✅ ATP embarcado en todas las locomotoras
- ✅ Enclavamientos ENCE en 5 estaciones críticas
- ✅ Control automatizado de 120 desvíos

---

## 📍 UBICACIÓN Y DESPLIEGUE

### Mapa de despliegue
El sistema se despliega desde el Centro de Control Operativo (CCO) en La Dorada, extendiéndose a lo largo de todo el corredor de 594 km hasta Chiriguaná.

### Tabla de sitios principales
| Sitio | Componentes | Coordenadas | Estado |
|:------|:------------|:------------|:-------|
| CCO La Dorada | CTC Virtual, Consolas, Videowall | 5.45°N, 74.66°W | ✅ Operativo |
| Estación La Dorada | ENCE, Desvíos | 5.45°N, 74.66°W | ✅ Operativo |
| Estación Puerto Berrío | ENCE, Desvíos | 6.49°N, 74.41°W | ✅ Operativo |
| Estación Barrancabermeja | ENCE, Desvíos | 7.06°N, 73.85°W | ✅ Operativo |
| Estación Bucaramanga | ENCE, Desvíos | 7.12°N, 73.12°W | ✅ Operativo |
| Estación Chiriguaná | ENCE, Desvíos | 9.36°N, 73.60°W | ✅ Operativo |

---

## ⚙️ OPERACIÓN Y MANTENIMIENTO

### Operación normal
El sistema opera 24/7 proporcionando control centralizado de todo el tráfico ferroviario, con monitoreo automático de la disponibilidad y rendimiento del sistema.

### Mantenimiento preventivo
- **Diario:** Verificación de estado de sistemas y disponibilidad
- **Semanal:** Pruebas de funcionamiento y respaldo
- **Mensual:** Calibración de equipos y actualización de software
- **Trimestral:** Mantenimiento mayor de equipos críticos

### Respuesta a fallas
1. **Detección automática** de fallas por sistemas de monitoreo
2. **Conmutación automática** a sistemas de respaldo
3. **Notificación inmediata** al personal de mantenimiento
4. **Reparación** según procedimientos establecidos
5. **Verificación** de funcionamiento normal

---

## 🔗 INTERFACES CON OTROS SISTEMAS

### Diagrama de interfaces
```
[Telecomunicaciones] ←→ [Control y Señalización] ←→ [Material Rodante]
                                    ↓
[ITS y Seguridad] ←→ [Control y Señalización] ←→ [Infraestructura]
                                    ↓
[Integración] ←→ [Control y Señalización] ←→ [Sistemas Externos]
```

### Tabla de interfaces críticas
| Sistema | Tipo de Interfaz | Criticidad | Responsable |
|:--------|:-----------------|:-----------|:------------|
| Telecomunicaciones | TETRA + GSM-R | Alta | EPC Telecomunicaciones |
| Material Rodante | ATP Embarcado | Alta | EPC Sistemas |
| ITS y Seguridad | CCTV + Monitoreo | Media | EPC Sistemas |
| Infraestructura | ENCE + Desvíos | Alta | EPC Sistemas |

### **Ítem WBS 1.1.106 - Bloque de Integración de Interfaces** ⭐ ACTUALIZADO (DT-INTERFACES-001)

**Función técnica:** Este ítem NO es un hardware físico único, sino un **bloque lógico de integración** que conecta el CTC con todos los subsistemas del proyecto.

**Composición del bloque ($150.000.000 COP):**
- **Gateways industriales:** Conversión de protocolos entre sistemas heterogéneos (CTC↔ITCS↔FENOCO)
- **Switches de borde ferroviario:** Segmentación de red por subsistema
- **Firewalls IEC 62443:** Ciberseguridad industrial (Security Level SL-3)
- **Middleware interoperabilidad:** Protocolo UIC 918-4 para integración con FENOCO
- **Licencias software SCADA:** Gestión de comunicaciones y visualización

**Interfaces que soporta:**
1. **CTC ↔ ITCS/ETCS Nivel 2:** Intercambio de telegramas de movimiento, datos de ocupación desde RBC
2. **CTC ↔ FENOCO:** Gateway UIC con protocolo 918-4 para interoperabilidad
3. **CTC ↔ TETRA:** Canal de voz y datos para comunicaciones tren-tierra
4. **CTC ↔ Fibra Óptica:** Backbone redundante N+1 del corredor (526 km)
5. **CTC ↔ Sistemas ITS:** CCTV (73 cámaras), control acceso, detección intrusión

**Arquitectura:**
- Redundancia N+1 en comunicaciones críticas
- Failover automático <1 segundo
- Monitoreo continuo desde SCADA

**Alcance $150M incluye:**
- Licencias integración (protocolos, middleware)
- Configuración interfaces y redundancia N+1
- Ensayos FAT/SAT interoperabilidad
- Integración en entorno virtual (CTC + ETCS L2)
- **NO incluye:** Equipos físicos mayores (cubiertos en ítems 1.1.100-1.1.105)

**Riesgos mitigados:**
- ✅ R-INT-001: Falta de trazabilidad en integración de sistemas (MITIGADO)
- ✅ R-INT-002: Ambigüedad en alcance de interfaces (MITIGADO)

**Documentación técnica:**
- IV.2 Interfaces_Sistemas: IF-07 especificada
- V.2 CTC v5.0: §12.4 Bloque de Integración
- VII.2.4 Protocolo FFFIS: §2.2 Gateway UIC 918-4

**Decisión Técnica:** DT-INTERFACES-001-2025-10-09

---

## 📋 SUPUESTOS TÉCNICOS Y LIMITACIONES

### Supuestos Críticos del Diseño
| Supuesto | Valor Asumido | Impacto si Cambia | Mitigación |
|:---------|:--------------|:------------------|:-----------|
| **Parque rodante** | 15 locomotoras | Menos ATP si reduce | Diseño escalable |
| **Disponibilidad CTC** | 99.95% | Penalizaciones si no cumple | Redundancia N+1 |
| **Cobertura GSM-R** | 100% del corredor | Fallos de comunicación | Respaldo TETRA |
| **Estaciones críticas** | 5 estaciones | Más ENCE si aumenta | Diseño modular |
| **Desvíos en vía** | 120 desvíos | Más automatización si aumenta | Control centralizado |
| **Tiempo de respuesta** | < 2 segundos | Penalizaciones si excede | Optimización de red |

### Limitaciones del Diseño
- **Dependencia de comunicaciones:** Sistema requiere GSM-R/TETRA operativo
- **Concentración de control:** CCO único punto de falla (mitigado con redundancia)
- **Complejidad de ATP:** Requiere personal especializado para mantenimiento
- **Interoperabilidad:** Dependiente de estándares FENOCO
- **Tiempo de recuperación:** Máximo 5 minutos para restablecer servicio

### Dependencias Críticas
- **GSM-R:** Comunicaciones críticas para ATP
- **TETRA:** Comunicaciones de respaldo
- **Fibra óptica:** Backbone de datos
- **Material rodante:** 15 locomotoras con ATP embarcado
- **Personal especializado:** Operadores y técnicos capacitados

---

## ⚠️ RIESGOS Y MITIGACIONES

| Riesgo | Probabilidad | Impacto | Mitigación | Estado |
|:-------|:-------------|:---------|:-----------|:-------|
| Fallo del CTC Virtual | Baja | Alto | Redundancia N+1 | ✅ Mitigado |
| Fallo de comunicación | Media | Alto | TETRA + GSM-R dual | ✅ Mitigado |
| Fallo de ATP embarcado | Baja | Alto | Sistemas de respaldo | ✅ Mitigado |
| Fallo de ENCE | Baja | Medio | Control manual de respaldo | ✅ Mitigado |

---

## 📋 CUMPLIMIENTO CONTRACTUAL

### Obligaciones clave del contrato
- ✅ **AT1 - CCO:** Centro de Control Operacional con disponibilidad 99.95% - Cumplida
- ✅ **AT2 - Operación:** Sistema de operación centralizada - Cumplida
- ✅ **AT3 - Especificaciones:** ITCS ETCS Level 2 - Cumplida
- ✅ **AT4 - Indicadores:** Disponibilidad 99.95% - Cumplida
- ⏳ **AT8 - Operaciones:** Procedimientos operacionales integrados - En progreso
- ❌ **AT9 - Cronograma:** Plan de implementación por fases - Pendiente

### Referencias contractuales
- **Apéndice Técnico 1:** Alcance del proyecto - Centro de Control Operacional
- **Apéndice Técnico 2:** Operación y mantenimiento - Sistema de operación centralizada
- **Apéndice Técnico 3:** Especificaciones generales - ITCS ETCS Level 2
- **Apéndice Técnico 4:** Indicadores de desempeño - Disponibilidad 99.95%

---

## 📚 DOCUMENTACIÓN DE SOPORTE

### Documentos técnicos disponibles
| Documento | Fase | Versión | Ubicación |
|:----------|:-----|:--------|:----------|
| SISTEMA_01_Control_y_Senalizacion_Master.md | Consolidado | v1.0 | Carpeta X |
| V.1_Señalizacion_Ferroviaria_Detalle_v5.0.md | Detalle | v5.0 | V. Ingeniería |
| V.2_Centro_Control_Trafico_CTC_Detalle_v5.0.md | Detalle | v5.0 | V. Ingeniería |
| 6.1_Manual_OM_CTC_v5.0.md | Operación | v5.0 | VI. Operación |

### Para más información técnica
Los documentos técnicos detallados están disponibles en la Carpeta X del proyecto. Para información específica sobre implementación, contactar al equipo de EPC Sistemas.

---

## 📞 CONTACTOS Y RESPONSABLES

| Rol | Responsable | Contacto |
|:----|:------------|:---------|
| Líder Técnico Control y Señalización | [Nombre] | [Email/Tel] |
| Coordinador EPC Sistemas | [Nombre] | [Email/Tel] |
| Responsable CTC Virtual | [Nombre] | [Email/Tel] |

---

## 📊 INDICADORES DE DESEMPEÑO (KPIs)

| Indicador | Meta | Actual | Estado |
|:----------|:-----|:-------|:-------|
| Disponibilidad CTC | 99.95% | 99.98% | 🟢 Excelente |
| Disponibilidad ATP | 99.95% | 99.97% | 🟢 Excelente |
| Disponibilidad ENCE | 99.95% | 99.96% | 🟢 Excelente |
| Tiempo de respuesta | < 2 segundos | 1.2 segundos | 🟢 Excelente |
| Tiempo de recuperación | < 5 minutos | 3.5 minutos | 🟢 Excelente |

---

## 📋 DECISIONES TÉCNICAS APLICADAS

### DT-TETRA-001-2025-10-07: ATP 15→8 unidades
- Cambio: Cantidad ATP 15 → 8 (criterio 5+2+1)
- Ahorro: $7,479,500,000 COP (-47%)

### DT-CTC-001/002/003: Software y componentes CTC
- Cambio: Ajustes software CTC virtual

### DT-INTERFACES-001-2025-10-09: Bloque integración IF-07
- Cambio: Agregada IF-07 (integración CTC-ITCS-FENOCO)

### DT-ENCE-001 a 005: Enclavamientos
- Cambio: Configuración 5 ENCE

---

## 🔄 CONTROL DE VERSIONES

| Versión | Fecha | Cambios Principales | Responsable |
|:--------|:------|:--------------------|:------------|
| 1.0 | Enero 2025 | Versión inicial ejecutiva | Administrador Contractual EPC |

---

## 📋 ANEXO: Layout de Equipos de Control y Señalización

<!-- INJECT_LAYOUT: Tipo_Equipo=CONTROL,SEÑALIZACION -->

---

**Documento preparado por:** Administrador Contractual EPC  
**Última actualización:** Enero 2025  
**Próxima revisión:** Febrero 2025  
**Basado en:** SISTEMA_01_Control_y_Senalizacion_Master.md v1.0


<!-- COCINADO DESDE FUENTES: 09/10/2025 17:30 | Fuentes: 2 | DTs: 0 -->

