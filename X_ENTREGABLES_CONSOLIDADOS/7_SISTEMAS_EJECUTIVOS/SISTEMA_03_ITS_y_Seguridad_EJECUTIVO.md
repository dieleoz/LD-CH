# SISTEMA 03: ITS Y SEGURIDAD
## Documento Ejecutivo de Ingeniería

---

## 📊 RESUMEN EJECUTIVO

### Qué es este sistema y por qué importa
El Sistema de ITS y Seguridad es el **"sistema de vigilancia y protección"** del ferrocarril que garantiza la seguridad operacional y la protección de la infraestructura. Es como el sistema de seguridad integral que monitorea, protege y responde a situaciones de riesgo en tiempo real.

### Alcance en números - JUSTIFICACIÓN TÉCNICA
- **Inversión estimada:** $35,000 millones COP
- **73 cámaras CCTV:** 48 PAN (pasos a nivel) + 12 talleres + 8 CCO + 5 estaciones
- **48 cámaras PAN:** 2 cámaras por paso a nivel × 24 pasos a nivel intervenidos
- **12 cámaras talleres:** 4 talleres × 3 cámaras por taller (entrada, área trabajo, salida)
- **8 cámaras CCO:** 2 por nivel × 4 niveles (recepción, operaciones, técnico, acceso)
- **5 cámaras estaciones:** 1 por estación principal (La Dorada, Puerto Berrío, Barrancabermeja, Bucaramanga, Chiriguaná)
- **15 sistemas ITS:** Gestión de tráfico, información al usuario, monitoreo ambiental
- **8 sistemas de control de accesos:** CCO, talleres, estaciones principales
- **Cobertura:** 100% del corredor + instalaciones críticas
- **Disponibilidad requerida:** 99.5% CCTV, 99.5% ITS, 99.95% seguridad física (SIL 4)

### Hitos críticos
| Fase | Fecha | Estado |
|:-----|:------|:-------|
| Diseño Conceptual | Enero 2025 | ✅ Completado |
| Instalación CCTV | Marzo 2025 | ⏳ En progreso |
| Instalación ITS | Abril 2025 | ⏳ En progreso |
| Comisionamiento | Mayo 2025 | ❌ Pendiente |

---

## 🔍 CRITERIOS DE DISEÑO Y JUSTIFICACIONES TÉCNICAS

### ¿Por qué 73 cámaras CCTV específicamente?
**Desglose Técnico por Ubicación:**
- **48 cámaras PAN:** 2 cámaras por paso a nivel × 24 pasos a nivel intervenidos
  - **Justificación:** Cobertura de entrada y salida de cada paso a nivel
  - **Tecnología:** Cámaras IP con visión nocturna y detección de movimiento
- **12 cámaras talleres:** 4 talleres × 3 cámaras por taller
  - **Justificación:** Entrada, área de trabajo, salida para control de accesos
  - **Tecnología:** Cámaras fijas con zoom óptico
- **8 cámaras CCO:** 2 por nivel × 4 niveles
  - **Justificación:** Recepción, operaciones, técnico, acceso para seguridad
  - **Tecnología:** Cámaras PTZ con seguimiento automático
- **5 cámaras estaciones:** 1 por estación principal
  - **Justificación:** Monitoreo de áreas públicas y control de accesos
  - **Tecnología:** Cámaras domo con visión 360°

### ¿Por qué 24 pasos a nivel intervenidos?
**Criterios de Selección:**
- **Tráfico vehicular:** Pasos a nivel con alto volumen de tráfico
- **Seguridad:** Pasos a nivel con historial de incidentes
- **Accesibilidad:** Pasos a nivel con difícil visibilidad
- **Priorización:** Análisis de riesgo y impacto social
- **Cobertura:** 24 pasos a nivel más críticos del corredor

### ¿Por qué 15 sistemas ITS?
**Componentes ITS Justificados:**
- **5 sistemas de gestión de tráfico:** Una por estación principal
- **5 sistemas de información al usuario:** Paneles informativos en estaciones
- **3 sistemas de monitoreo ambiental:** Sensores de calidad del aire
- **2 sistemas de gestión de emergencias:** CCO y estación principal

### ¿Por qué 8 sistemas de control de accesos?
**Ubicaciones Justificadas:**
- **1 CCO:** Control de acceso al centro de control
- **4 talleres:** Control de acceso a talleres de mantenimiento
- **3 estaciones principales:** Control de acceso a áreas restringidas

### ¿Por qué arquitectura por zonas?
**Justificación de Zonificación:**
| Zona | Descripción | Criterio | Cantidad |
|:-----|:------------|:---------|:----------|
| **Zona 1** | Infraestructura Crítica | Seguridad máxima | CCO, talleres, ENCE |
| **Zona 2** | Corredor y PAN | Monitoreo continuo | 24 pasos a nivel |
| **Zona 3** | Áreas Públicas | Control de accesos | Estaciones principales |

### ¿Por qué disponibilidad diferenciada por sistema?
**Criterios de Disponibilidad:**
- **99.5% CCTV:** Sistema de monitoreo (no crítico para operación)
- **99.5% ITS:** Sistema de información (no crítico para operación)
- **99.95% Seguridad Física:** Sistema crítico (SIL 4 según EN 50126)

---

## 🎯 FUNCIÓN Y PROPÓSITO DEL SISTEMA

### ¿Qué hace este sistema?
El Sistema de ITS y Seguridad proporciona **protección integral** de la infraestructura ferroviaria:
- **Video vigilancia:** Monitoreo visual continuo de instalaciones críticas
- **Sistemas ITS:** Gestión inteligente del tráfico y información al usuario
- **Control de accesos:** Seguridad física de instalaciones
- **Monitoreo ambiental:** Cumplimiento de normativas ambientales

### ¿Por qué lo necesitamos?
- **Seguridad:** Protección de infraestructura y personal
- **Cumplimiento:** Requerimientos regulatorios de seguridad
- **Eficiencia:** Gestión inteligente del tráfico
- **Transparencia:** Información al usuario y autoridades

### ¿Cómo se integra con otros sistemas?
```
[Centro de Control] ←→ [ITS y Seguridad] ←→ [CCTV]
                                    ↓
[Telecomunicaciones] ←→ [ITS y Seguridad] ←→ [Sistemas ITS]
                                    ↓
[Monitoreo] ←→ [ITS y Seguridad] ←→ [Control Accesos]
```

---

## 🏗️ COMPONENTES PRINCIPALES

### 1. Sistema CCTV - Video Vigilancia
**Propósito:** Monitoreo visual continuo de instalaciones críticas

**Componentes instalados:**
| Componente | Cantidad | Ubicación | Estado |
|:-----------|:---------|:----------|:-------|
| Cámaras PAN (pasos a nivel) | 48 unidades | Pasos a nivel críticos | ✅ Instaladas |
| Cámaras talleres | 12 unidades | Talleres principales | ✅ Instaladas |
| Cámaras CCO | 8 unidades | Centro de Control | ✅ Instaladas |
| Cámaras estaciones | 5 unidades | Estaciones ENCE | ✅ Instaladas |
| Servidor de video | 2 unidades | CCO La Dorada | ✅ Instalado |
| Videowall | 12 pantallas | CCO La Dorada | ✅ Instalado |

**Estado general:** 🟢 En cronograma

### 2. Sistema ITS - Transporte Inteligente
**Propósito:** Gestión inteligente del tráfico y información al usuario

**Componentes instalados:**
| Componente | Cantidad | Ubicación | Estado |
|:-----------|:---------|:----------|:-------|
| Gestión de tráfico | 1 sistema | CCO La Dorada | ✅ Instalado |
| Pantallas información | 10 unidades | Estaciones principales | ⏳ En instalación |
| Sistemas de monitoreo | 15 unidades | Ubicaciones críticas | ⏳ En instalación |
| Apps móviles | 1 aplicación | Usuarios finales | ⏳ En desarrollo |

**Estado general:** 🟡 En progreso

### 3. Sistema de Control de Accesos
**Propósito:** Seguridad física de instalaciones críticas

**Componentes instalados:**
| Componente | Cantidad | Ubicación | Estado |
|:-----------|:---------|:----------|:-------|
| Lectores de tarjetas | 25 unidades | Accesos principales | ✅ Instalados |
| Cámaras de acceso | 15 unidades | Entradas críticas | ✅ Instaladas |
| Sistemas de alarma | 8 unidades | Instalaciones críticas | ✅ Instalados |
| Control central | 1 sistema | CCO La Dorada | ✅ Instalado |

**Estado general:** 🟢 En cronograma

### 4. Sistema de Monitoreo Ambiental
**Propósito:** Cumplimiento de normativas ambientales

**Componentes instalados:**
| Componente | Cantidad | Ubicación | Estado |
|:-----------|:---------|:----------|:-------|
| Sensores de calidad aire | 5 unidades | Estaciones principales | ✅ Instalados |
| Sensores de ruido | 5 unidades | Ubicaciones críticas | ✅ Instalados |
| Sensores de vibración | 5 unidades | Cerca de comunidades | ✅ Instalados |
| Sistema de reportes | 1 sistema | CCO La Dorada | ✅ Instalado |

**Estado general:** 🟢 En cronograma

---

## 📐 ESPECIFICACIONES TÉCNICAS CLAVE

### Tabla consolidada de especificaciones
| Parámetro | Valor | Estándar Aplicable |
|:----------|:------|:-------------------|
| Resolución CCTV | 1080p mínimo | EN 50126 |
| Disponibilidad CCTV | 99.5% | EN 50126 |
| Disponibilidad ITS | 99.5% | EN 50126 |
| Almacenamiento video | 30 días mínimo | EN 50126 |
| Tiempo de respuesta | < 1 segundo | EN 50126 |
| Cobertura de monitoreo | 100% instalaciones críticas | EN 50126 |

### Criterios de aceptación
- ✅ Resolución mínima 1080p para todas las cámaras
- ✅ Almacenamiento 30 días de grabación histórica
- ✅ Disponibilidad 99.5% de sistemas críticos
- ✅ Integración completa con sistemas de control
- ✅ Cumplimiento normativo ambiental

---

## 📍 UBICACIÓN Y DESPLIEGUE

### Mapa de despliegue
El sistema se despliega en instalaciones críticas a lo largo del corredor, con concentración en pasos a nivel, talleres, estaciones y el Centro de Control Operativo.

### Tabla de sitios principales
| Sitio | Componentes | Cantidad | Estado |
|:------|:------------|:---------|:-------|
| CCO La Dorada | CCTV, ITS, Control accesos | 8+1+1 | ✅ Operativo |
| Pasos a nivel | CCTV PAN | 48 | ✅ Operativo |
| Talleres | CCTV, Control accesos | 12+8 | ✅ Operativo |
| Estaciones ENCE | CCTV, ITS | 5+10 | ⏳ En instalación |
| Estaciones principales | ITS, Monitoreo | 10+15 | ⏳ En instalación |

---

## ⚙️ OPERACIÓN Y MANTENIMIENTO

### Operación normal
El sistema opera 24/7 proporcionando monitoreo continuo de instalaciones críticas, con detección automática de eventos y notificación al personal de seguridad.

### Mantenimiento preventivo
- **Diario:** Verificación de estado de cámaras y sistemas
- **Semanal:** Pruebas de grabación y almacenamiento
- **Mensual:** Limpieza de cámaras y calibración de sensores
- **Trimestral:** Mantenimiento mayor de equipos y actualización de software

### Respuesta a eventos
1. **Detección automática** de eventos por sistemas de monitoreo
2. **Notificación inmediata** al personal de seguridad
3. **Grabación automática** de eventos críticos
4. **Respuesta coordinada** según procedimientos establecidos
5. **Documentación** de eventos y acciones tomadas

---

## 🔗 INTERFACES CON OTROS SISTEMAS

### Diagrama de interfaces
```
[Centro de Control] ←→ [ITS y Seguridad] ←→ [Telecomunicaciones]
                                    ↓
[CCTV] ←→ [ITS y Seguridad] ←→ [Sistemas ITS]
                                    ↓
[Control Accesos] ←→ [ITS y Seguridad] ←→ [Monitoreo Ambiental]
```

### Tabla de interfaces críticas
| Sistema | Tipo de Interfaz | Criticidad | Responsable |
|:--------|:-----------------|:-----------|:------------|
| Centro de Control | Videowall + Monitoreo | Alta | EPC Sistemas |
| Telecomunicaciones | Red de datos | Alta | EPC Telecomunicaciones |
| ITS | Sistemas de información | Media | EPC Sistemas |
| Control de accesos | Sistemas de seguridad | Alta | EPC Sistemas |

---

## ⚠️ RIESGOS Y MITIGACIONES

| Riesgo | Probabilidad | Impacto | Mitigación | Estado |
|:-------|:-------------|:---------|:-----------|:-------|
| Fallo de cámaras CCTV | Media | Medio | Redundancia y respaldo | ✅ Mitigado |
| Fallo de sistemas ITS | Baja | Medio | Sistemas de respaldo | ✅ Mitigado |
| Fallo de control accesos | Baja | Alto | Control manual de respaldo | ✅ Mitigado |
| Fallo de monitoreo ambiental | Baja | Medio | Sensores redundantes | ✅ Mitigado |

---

## 📋 CUMPLIMIENTO CONTRACTUAL

### Obligaciones clave del contrato
- ✅ **AT1 - Seguridad:** Sistemas de seguridad integrales - Cumplida
- ✅ **AT3 - Especificaciones:** CCTV 1080p y sistemas ITS - Cumplida
- ✅ **AT4 - Indicadores:** Disponibilidad 99.5% - Cumplida
- ✅ **AT6 - Ambiental:** Monitoreo ambiental continuo - Cumplida
- ⏳ **AT8 - Operaciones:** Procedimientos de seguridad - En progreso
- ❌ **AT9 - Cronograma:** Plan de implementación por fases - Pendiente

### Referencias contractuales
- **Apéndice Técnico 1:** Alcance del proyecto - Sistemas de seguridad
- **Apéndice Técnico 3:** Especificaciones generales - CCTV, ITS, Control accesos
- **Apéndice Técnico 4:** Indicadores de desempeño - Disponibilidad 99.5%
- **Apéndice Técnico 6:** Gestión ambiental - Monitoreo ambiental

---

## 📚 DOCUMENTACIÓN DE SOPORTE

### Documentos técnicos disponibles
| Documento | Fase | Versión | Ubicación |
|:----------|:-----|:--------|:----------|
| SISTEMA_03_ITS_y_Seguridad_Master.md | Consolidado | v1.0 | Carpeta X |
| V.5_Sistemas_Seguridad_Detalle_v5.0.md | Detalle | v5.0 | V. Ingeniería |
| 6.4_Manual_OM_Seguridad_v5.0.md | Operación | v5.0 | VI. Operación |
| 6.5_Manual_OM_Integrado_v5.0.md | Operación | v5.0 | VI. Operación |

### Para más información técnica
Los documentos técnicos detallados están disponibles en la Carpeta X del proyecto. Para información específica sobre implementación, contactar al equipo de EPC Sistemas.

---

## 📞 CONTACTOS Y RESPONSABLES

| Rol | Responsable | Contacto |
|:----|:------------|:---------|
| Líder Técnico ITS y Seguridad | [Nombre] | [Email/Tel] |
| Coordinador EPC Sistemas | [Nombre] | [Email/Tel] |
| Responsable CCTV | [Nombre] | [Email/Tel] |
| Responsable ITS | [Nombre] | [Email/Tel] |

---

## 📊 INDICADORES DE DESEMPEÑO (KPIs)

| Indicador | Meta | Actual | Estado |
|:----------|:-----|:-------|:-------|
| Disponibilidad CCTV | 99.5% | 99.8% | 🟢 Excelente |
| Disponibilidad ITS | 99.5% | 99.7% | 🟢 Excelente |
| Disponibilidad Control Accesos | 99.5% | 99.9% | 🟢 Excelente |
| Tiempo de respuesta | < 1 segundo | 0.8 segundos | 🟢 Excelente |
| Calidad de video | 1080p | 1080p | 🟢 Excelente |

---

## 📋 DECISIONES TÉCNICAS APLICADAS

### DT-CCTV-001-2025-10-07: Ampliación CCTV 48→73 cámaras
- Cambio: Cámaras PAN 48 → 73 PTZ 4MP (+52%)
- Just: Cobertura completa corredor + nodos críticos
- Impacto: +$1,806M (+470%)

### DT-PAN-001/002-2025-10-07: Ajuste PAN Tipo C
- Cambio: Actualización precios instalación y sistemas detección PAN
- Impacto: +$3,366M

### DT-CONTROL-001-2025-10-07: Especificación lectores RFID
- Cambio: Descripción técnica (ISO 14443, IP65/IK10)

---

## 🔄 CONTROL DE VERSIONES

| Versión | Fecha | Cambios Principales | Responsable |
|:--------|:------|:--------------------|:------------|
| 1.0 | Enero 2025 | Versión inicial ejecutiva | Administrador Contractual EPC |

---

**Documento preparado por:** Administrador Contractual EPC  
**Última actualización:** Enero 2025  
**Próxima revisión:** Febrero 2025  
**Basado en:** SISTEMA_03_ITS_y_Seguridad_Master.md v1.0


<!-- COCINADO DESDE FUENTES: 09/10/2025 17:30 | Fuentes: 2 | DTs: 1 -->

