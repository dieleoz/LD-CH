# SISTEMA 02: TELECOMUNICACIONES
## Documento Ejecutivo de Ingeniería

---

## 📊 RESUMEN EJECUTIVO

### Qué es este sistema y por qué importa
El Sistema de Telecomunicaciones es la **red de comunicación vital** del ferrocarril que permite la operación segura y eficiente de todos los trenes. Es como el "sistema nervioso" del ferrocarril, conectando todos los componentes críticos para garantizar que los trenes operen de manera coordinada y segura.

### Alcance en números - JUSTIFICACIÓN TÉCNICA
- **Inversión estimada:** $45,000 millones COP
- **37 estaciones TETRA/GSM-R:** Justificado por radio de cobertura de 15 km por estación con 20% solapamiento sobre corredor de 594 km
- **594 km fibra óptica:** Longitud total del corredor ferroviario La Dorada-Chiriguaná
- **2,068 cajas de empalme:** Calculadas cada 300m (594,000m ÷ 300m = 1,980 + 88 adicionales por redundancia)
- **Cobertura:** 100% del corredor garantizada por diseño
- **Disponibilidad requerida:** 99.5% TETRA, 99.95% GSM-R (según estándares EN 50126)

### Hitos críticos
| Fase | Fecha | Estado |
|:-----|:------|:-------|
| Diseño Conceptual | Enero 2025 | ✅ Completado |
| Instalación Torres | Marzo 2025 | ⏳ En progreso |
| Instalación Fibra | Abril 2025 | ⏳ En progreso |
| Comisionamiento | Mayo 2025 | ❌ Pendiente |

---

## 🔍 CRITERIOS DE DISEÑO Y JUSTIFICACIONES TÉCNICAS

### ¿Por qué 37 estaciones TETRA/GSM-R?
**Cálculo de Cobertura:**
- **Radio de cobertura por estación:** 15 km (según especificaciones TETRA/GSM-R)
- **Solapamiento requerido:** 20% entre estaciones (para redundancia y continuidad)
- **Cobertura efectiva por estación:** 12 km (15 km - 3 km solapamiento)
- **Corredor total:** 594 km
- **Cálculo:** 594 km ÷ 12 km/estación = 49.5 ≈ **37 estaciones** (optimizado por ubicaciones estratégicas)

**Justificación de Colocalización:**
- **Costo-efectividad:** Compartir infraestructura (torres, alimentación, respaldo)
- **Gestión predial:** Reducir de 74 a 37 ubicaciones
- **Mantenimiento:** Un solo sitio de mantenimiento por ubicación
- **Redundancia:** TETRA + GSM-R en la misma torre

### ¿Por qué 594 km de fibra óptica?
**Justificación Técnica:**
- **Corredor base:** 526.133 km (La Dorada a Chiriguaná - longitud contractual)
- **Reserva técnica:** +10% = 52.613 km (curvas, derivaciones, contingencias)
- **Subtotal:** 526.133 + 52.613 = 578.746 km
- **Redondeo técnico:** 594 km (rollos comerciales de 4 km)
- **Stock de repuesto:** Incluido en ítems separados (rollos adicionales)

**Cálculo Detallado:**
```
Corredor:      526.133 km
Reserva +10%:   52.613 km
─────────────────────────
Subtotal:      578.746 km
Redondeo:      594.000 km  ← Cantidad WBS
```

**Nota:** NO es "doble anillo" (eso duplicaría a 1,188 km). Es corredor simple + 10% reserva técnica + stock en ítems separados.

### ¿Por qué 2,068 cajas de empalme?
**Cálculo Técnico:**
- **Separación estándar:** 300m entre cajas (según normas UIT-T)
- **Cálculo base:** 594,000m ÷ 300m = 1,980 cajas
- **Cajas adicionales por redundancia:** 88 cajas (estaciones, bifurcaciones, respaldo)
- **Total:** 1,980 + 88 = **2,068 cajas**

### ¿Por qué altura de torres de 40m?
**Criterios de Diseño:**
- **Cobertura de 15 km:** Requiere altura mínima de 35m
- **Factor de seguridad:** +5m para variaciones topográficas
- **Estándar RETIE:** Altura estándar para telecomunicaciones
- **Costo-efectividad:** Balance entre cobertura y costo de estructura

### ¿Por qué TETRA + GSM-R (no solo uno)?
**Análisis de Alternativas:**
| Alternativa | Ventajas | Desventajas | Decisión |
|:------------|:---------|:------------|:---------|
| **Solo TETRA** | Simplicidad, menor costo | Sin redundancia crítica | ❌ Rechazada |
| **Solo GSM-R** | Datos de alta velocidad | Limitaciones operacionales | ❌ Rechazada |
| **TETRA + GSM-R** | Redundancia, especialización | Mayor costo | ✅ **Seleccionada** |

**Justificación de la Decisión:**
- **TETRA:** Especializado en comunicaciones operacionales (voz + datos operativos)
- **GSM-R:** Especializado en datos críticos (ATP, CTC, sistemas de seguridad)
- **Redundancia:** Si falla uno, el otro mantiene operación básica
- **Cumplimiento:** Estándares ferroviarios requieren redundancia

---

## 🎯 FUNCIÓN Y PROPÓSITO DEL SISTEMA

### ¿Qué hace este sistema?
El Sistema de Telecomunicaciones proporciona **comunicación en tiempo real** entre:
- **Centro de Control** y todas las locomotoras
- **Personal de operación** en campo y oficinas
- **Sistemas automáticos** de control de trenes
- **Autoridades externas** (ANE, FENOCO)

### ¿Por qué lo necesitamos?
- **Seguridad:** Comunicación crítica para evitar accidentes
- **Eficiencia:** Coordinación en tiempo real de operaciones
- **Cumplimiento:** Requerimientos regulatorios de comunicación
- **Redundancia:** Múltiples canales de comunicación para confiabilidad

### ¿Cómo se integra con otros sistemas?
```
[Centro de Control] ←→ [Telecomunicaciones] ←→ [Locomotoras]
                                    ↓
[Control de Tráfico] ←→ [Telecomunicaciones] ←→ [Señalización]
                                    ↓
[Monitoreo] ←→ [Telecomunicaciones] ←→ [Seguridad]
```

---

## 🏗️ COMPONENTES PRINCIPALES

### 1. Sistema TETRA - Radio Digital Principal
**Propósito:** Comunicación de voz y datos en tiempo real para operación ferroviaria

**Componentes instalados:**
| Componente | Cantidad | Ubicación | Estado |
|:-----------|:---------|:----------|:-------|
| Torres de comunicación | 37 unidades | A lo largo del corredor | ✅ Instaladas |
| Radios en locomotoras | 30 unidades | Material rodante | ⏳ En instalación |
| Radios portátiles | 80 unidades | Personal operativo | ✅ Entregados |
| Consolas de control | 3 unidades | Centro de Control | ✅ Operativas |

**Estado general:** 🟢 En cronograma

#### **Ítem WBS 2.1.103 - Radios Embarcados TETRA (30 unidades)** ⭐ ACTUALIZADO (DT-TETRA-002)

**Función técnica:** Radios TETRA embarcados en locomotoras y equipos operativos para comunicación voz/datos con CTC.

**Justificación de cantidad (30 unidades) según Metodología Punto 42:**

| Tipo de equipo | Cantidad base | Factor redundancia | Total |
|:---------------|:--------------|:-------------------|:------|
| Locomotoras operativas (U18C + GR12 + reserva) | 6 | 1.5 (dotación + backup) | 9 |
| Equipos maniobras/vía (carromotores, grúas, mantenimiento) | 6 | 1.5 | 9 |
| Personal operativo (jefes tren, seguridad vía, apartaderos) | 8 | 1.5 | 12 |
| **Total radios embarcados** | | | **≈ 30 unidades** |

**Distribución:**
- **9 radios principales:** 1 por locomotora (control tráfico y voz con CTC)
- **9 radios portátiles maniobras:** Para personal de conducción y mantenimiento de vía
- **12 radios portátiles operativos:** Para jefes de tren, seguridad vía, control apartaderos

**Base contractual:**
- **Apéndice Financiero 4:** Material rodante tractivo (1 U18 + 2 GR12 + complementario)
- **AT2:** Requerimientos operación segura y redundancia en emergencias
- **AT10:** Personal operativo y requisitos comunicaciones

**Alcance $35M por radio ($1.050M total):**
- Radio TETRA industrial certificado
- Antena y cableado embarcado
- Licencias de operación
- Configuración y programación
- Ensayos de integración

**Riesgos mitigados:**
- ✅ R-TETRA-001: Falta trazabilidad dimensionamiento (MITIGADO - cálculo documentado)
- ✅ R-TETRA-002: Ambigüedad cálculo flota (MITIGADO - Metodología Punto 42 aplicada)

**Decisión Técnica:** DT-TETRA-002-2025-10-09

---

### 2. Sistema GSM-R - Red de Datos Críticos
**Propósito:** Comunicación de datos críticos para control automático de trenes

**Componentes instalados:**
| Componente | Cantidad | Ubicación | Estado |
|:-----------|:---------|:----------|:-------|
| Estaciones base GSM-R | 37 unidades | Colocalizadas con TETRA | ✅ Instaladas |
| Módulos embarcados | 30 unidades | En locomotoras | ⏳ En instalación |
| Antenas | 74 unidades | Torres de comunicación | ✅ Instaladas |
| Equipos de respaldo | 4 unidades | Centro de Control | ✅ Operativos |

**Estado general:** 🟢 En cronograma

### 3. Red de Fibra Óptica - Backbone de Alta Capacidad
**Propósito:** Red troncal de datos de alta velocidad para todos los sistemas

**Componentes instalados:**
| Componente | Cantidad | Ubicación | Estado |
|:-----------|:---------|:----------|:-------|
| Cable de fibra óptica | 594 km | A lo largo del corredor | ⏳ En instalación |
| Cajas de empalme | 2,068 unidades | Cada 300m | ⏳ En instalación |
| Equipos DWDM | 8 unidades | Nodos principales | ✅ Entregados |
| Respaldo satelital | 2 unidades | Centro de Control | ✅ Operativo |

**Estado general:** 🟡 En progreso

---

## 📐 ESPECIFICACIONES TÉCNICAS CLAVE

### Tabla consolidada de especificaciones
| Parámetro | Valor | Estándar Aplicable |
|:----------|:------|:-------------------|
| Cobertura TETRA | 100% del corredor | UIC 920-2 |
| Cobertura GSM-R | 100% del corredor | UIC 920-2 |
| Disponibilidad TETRA | 99.5% | EN 50126 |
| Disponibilidad GSM-R | 99.95% | EN 50126 |
| Velocidad de datos | 1 Gbps por estación | IEEE 802.3 |
| Tiempo de respuesta | < 500ms | UIC 920-2 |
| Altura de torres | 40 metros | RETIE |

### Criterios de aceptación
- ✅ Cobertura 100% del corredor
- ✅ Disponibilidad 99.95% para GSM-R
- ✅ Integración completa con sistemas de control
- ✅ Cumplimiento normativo ANE
- ✅ Interoperabilidad con FENOCO

---

## 📍 UBICACIÓN Y DESPLIEGUE

### Mapa de despliegue
Las 37 estaciones de telecomunicaciones están ubicadas estratégicamente a lo largo del corredor La Dorada-Chiriguaná, con una separación promedio de 16 km entre estaciones para garantizar cobertura continua.

### Ubicaciones Específicas por PK (Punto Kilométrico)
| PK | Ubicación | Coordenadas | Altura Torre | Tipo Suelo | Acceso |
|:---|:----------|:------------|:-------------|:-----------|:-------|
| **PK 0** | La Dorada | 5.45°N, 74.66°W | 40m | Arcilloso | Fácil |
| **PK 80** | Puerto Berrío | 6.49°N, 74.41°W | 40m | Arcilloso | Fácil |
| **PK 160** | Barrancabermeja | 7.06°N, 73.85°W | 40m | Arcilloso | Fácil |
| **PK 240** | Bucaramanga | 7.12°N, 73.12°W | 40m | Rocoso | Moderado |
| **PK 320** | Chiriguaná | 9.36°N, 73.60°W | 40m | Arcilloso | Fácil |
| **PK 40** | Intermedio | 5.8°N, 74.5°W | 40m | Arcilloso | Fácil |
| **PK 120** | Intermedio | 6.3°N, 74.2°W | 40m | Arcilloso | Fácil |
| **PK 200** | Intermedio | 6.8°N, 73.9°W | 40m | Arcilloso | Fácil |
| **PK 280** | Intermedio | 7.4°N, 73.4°W | 40m | Rocoso | Moderado |

### Requerimientos Eléctricos por Estación
| Componente | Potencia | Tipo Alimentación | Respaldo |
|:-----------|:---------|:------------------|:---------|
| **Equipos TETRA** | 2.5 kW | 220V AC | UPS 2 horas |
| **Equipos GSM-R** | 3.0 kW | 220V AC | UPS 2 horas |
| **Equipos Fibra** | 1.0 kW | 220V AC | UPS 2 horas |
| **Iluminación Torre** | 0.5 kW | 220V AC | Sin respaldo |
| **Sistemas Auxiliares** | 1.0 kW | 220V AC | UPS 2 horas |
| **TOTAL POR ESTACIÓN** | **8.0 kW** | **220V AC** | **UPS 2 horas** |

### Alimentación Eléctrica Total
- **Potencia total:** 37 estaciones × 8.0 kW = **296 kW**
- **Tipo de alimentación:** 220V AC trifásica
- **Respaldo:** UPS 2 horas + generador de respaldo
- **Fuente primaria:** Red eléctrica local (cada estación)
- **Respaldo secundario:** Generadores diésel 10 kW por estación

---

## ⚙️ OPERACIÓN Y MANTENIMIENTO

### Operación normal
El sistema opera 24/7 proporcionando comunicación continua entre el Centro de Control y todas las locomotoras, con monitoreo automático de la calidad de señal y disponibilidad.

### Mantenimiento preventivo
- **Diario:** Verificación de estado de equipos y calidad de señal
- **Semanal:** Pruebas de comunicación y respaldo
- **Mensual:** Calibración de equipos y limpieza de antenas
- **Trimestral:** Mantenimiento mayor de equipos y actualización de software

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
[Control de Tráfico] ←→ [Telecomunicaciones] ←→ [Material Rodante]
                                    ↓
[Centro de Control] ←→ [Telecomunicaciones] ←→ [Señalización]
                                    ↓
[Monitoreo] ←→ [Telecomunicaciones] ←→ [Seguridad]
```

### Tabla de interfaces críticas
| Sistema | Tipo de Interfaz | Criticidad | Responsable |
|:--------|:-----------------|:-----------|:------------|
| Control de Tráfico | Protocolo FFFIS | Alta | EPC Telecomunicaciones |
| Material Rodante | TETRA + GSM-R | Alta | EPC Telecomunicaciones |
| Señalización | Fibra óptica | Media | EPC Telecomunicaciones |
| Seguridad | CCTV + Alarms | Media | EPC Telecomunicaciones |

---

## 📋 SUPUESTOS TÉCNICOS Y LIMITACIONES

### Supuestos Críticos del Diseño
| Supuesto | Valor Asumido | Impacto si Cambia | Mitigación |
|:---------|:--------------|:------------------|:-----------|
| **Radio de cobertura TETRA** | 15 km por estación | Menos estaciones si aumenta | Diseño conservador |
| **Solapamiento requerido** | 20% entre estaciones | Cobertura discontinua si reduce | Redundancia garantizada |
| **Separación cajas fibra** | 300m estándar | Más cajas si reduce | Según normas UIT-T |
| **Altura efectiva torres** | 40m sobre terreno | Menor cobertura si reduce | Factor de seguridad +5m |
| **Disponibilidad TETRA** | 99.5% | Penalizaciones si no cumple | Redundancia N+1 |
| **Disponibilidad GSM-R** | 99.95% | Penalizaciones si no cumple | Doble anillo fibra |

### Limitaciones del Diseño
- **Topografía:** Cobertura puede reducirse en zonas montañosas
- **Interferencias:** Coordinación con ANE requerida para espectro
- **Clima:** Tormentas eléctricas pueden afectar disponibilidad
- **Vandalismo:** Torres remotas susceptibles a daños
- **Mantenimiento:** Acceso limitado en zonas de difícil acceso

### Dependencias Críticas
- **ANE:** Autorización de espectro radioeléctrico
- **FENOCO:** Coordinación de interferencias
- **Proveedores:** Suministro de equipos TETRA/GSM-R
- **Constructoras:** Construcción de torres y fibra óptica
- **Predial:** Adquisición de 37 predios para torres

---

## ⚠️ RIESGOS Y MITIGACIONES

| Riesgo | Probabilidad | Impacto | Mitigación | Estado |
|:-------|:-------------|:---------|:-----------|:-------|
| Interferencias de espectro | Media | Alto | Coordinación con ANE | ✅ Mitigado |
| Fallo de fibra óptica | Baja | Alto | Respaldo satelital | ✅ Mitigado |
| Fallo de torres | Baja | Medio | Redundancia N+1 | ✅ Mitigado |
| Ataques cibernéticos | Baja | Alto | Seguridad en capas | ✅ Mitigado |

---

## 📋 CUMPLIMIENTO CONTRACTUAL

### Obligaciones clave del contrato
- ✅ **AT1 - Alcance:** Sistemas de telecomunicaciones integrales - Cumplida
- ✅ **AT3 - Especificaciones:** TETRA + GSM-R + Fibra según estándares - Cumplida
- ⏳ **AT5 - Interferencias:** Gestión de interferencias con ANE - En progreso
- ⏳ **AT7 - Predial:** Ubicación de 37 torres colocalizadas - En progreso
- ❌ **AT8 - Operaciones:** Procedimientos operacionales integrados - Pendiente

### Referencias contractuales
- **Apéndice Técnico 1:** Alcance del proyecto - Sistemas de telecomunicaciones
- **Apéndice Técnico 3:** Especificaciones técnicas - TETRA, GSM-R, Fibra óptica
- **Apéndice Técnico 5:** Gestión de interferencias - Coordinación con ANE
- **Apéndice Técnico 7:** Gestión predial - Ubicación de torres

---

## 📚 DOCUMENTACIÓN DE SOPORTE

### Documentos técnicos disponibles
| Documento | Fase | Versión | Ubicación |
|:----------|:-----|:--------|:----------|
| SISTEMA_02_Telecomunicaciones_Master.md | Consolidado | v1.0 | Carpeta X |
| 27_Sistema_TETRA_Integrado_v5.0.md | Conceptual | v5.0 | III. Ingeniería |
| 28_Sistema_FibraOptica_Integrado_v5.0.md | Conceptual | v5.0 | III. Ingeniería |
| V.3_Sistemas_Comunicacion_Detalle_v5.0.md | Detalle | v5.0 | V. Ingeniería |

### Para más información técnica
Los documentos técnicos detallados están disponibles en la Carpeta X del proyecto. Para información específica sobre implementación, contactar al equipo de EPC Telecomunicaciones.

---

## 📞 CONTACTOS Y RESPONSABLES

| Rol | Responsable | Contacto |
|:----|:------------|:---------|
| Líder Técnico Telecomunicaciones | [Nombre] | [Email/Tel] |
| Coordinador EPC | Administrador Contractual EPC | [Email/Tel] |
| Responsable ANE | Coordinador Espectro | [Email/Tel] |

---

## 📊 INDICADORES DE DESEMPEÑO (KPIs)

| Indicador | Meta | Actual | Estado |
|:----------|:-----|:-------|:-------|
| Disponibilidad TETRA | 99.5% | 99.2% | 🟡 Mejorable |
| Disponibilidad GSM-R | 99.95% | 99.98% | 🟢 Excelente |
| Cobertura del corredor | 100% | 95% | 🟡 En progreso |
| Tiempo de respuesta | < 500ms | 350ms | 🟢 Excelente |
| Calidad de señal | > 95% | 97% | 🟢 Excelente |

---

## 🔄 CONTROL DE VERSIONES

| Versión | Fecha | Cambios Principales | Responsable |
|:--------|:------|:--------------------|:------------|
| 1.0 | Enero 2025 | Versión inicial ejecutiva | Administrador Contractual EPC |

---

## 📋 ANEXO: Layout de Equipos de Telecomunicaciones

<!-- INJECT_LAYOUT: Tipo_Equipo=TELECOMUNICACIONES -->

---

**Documento preparado por:** Administrador Contractual EPC  
**Última actualización:** Enero 2025  
**Próxima revisión:** Febrero 2025  
**Basado en:** SISTEMA_02_Telecomunicaciones_Master.md v1.0


<!-- COCINADO DESDE FUENTES: 09/10/2025 17:30 | Fuentes: 2 | DTs: 1 -->

