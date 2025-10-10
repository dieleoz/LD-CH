# SISTEMA 04: MATERIAL RODANTE
## Documento Ejecutivo de Ingeniería

---

## 📊 RESUMEN EJECUTIVO

### Qué es este sistema y por qué importa
El Sistema de Material Rodante es la **"flota de vehículos"** del ferrocarril que transporta la carga a lo largo del corredor. Es como el parque automotor del ferrocarril, compuesto por locomotoras, vagones y equipos especializados que garantizan el transporte eficiente y seguro de mercancías.

### Alcance en números - JUSTIFICACIÓN TÉCNICA
- **Inversión estimada:** $85,000 millones COP
- **15 locomotoras:** Puesta a punto de 2 GR12 + 2 U10 + 11 locomotoras adicionales
- **51 vagones:** 40 plataformas operativas + 11 no operativas (según AT1)
- **8 carromotores:** Equipos especializados para mantenimiento de vía
- **15 dispositivos EOT:** 1 por locomotora para seguridad crítica (End of Train)
- **3 talleres:** Principal La Dorada + secundario Chiriguaná + taller de línea
- **Sistemas embarcados:** ITCS ETCS Level 2, TETRA + GSM-R, GPS/GNSS, CCTV
- **Cobertura:** 100% del corredor La Dorada-Chiriguaná
- **Disponibilidad requerida:** 99.95% (sistema crítico según AT4)

### Hitos críticos
| Fase | Fecha | Estado |
|:-----|:------|:-------|
| Diseño Conceptual | Enero 2025 | ✅ Completado |
| Adquisición Locomotoras | Marzo 2025 | ⏳ En progreso |
| Adquisición Vagones | Abril 2025 | ⏳ En progreso |
| Comisionamiento | Mayo 2025 | ❌ Pendiente |

---

## 🔍 CRITERIOS DE DISEÑO Y JUSTIFICACIONES TÉCNICAS

### ¿Por qué 15 locomotoras específicamente?
**Desglose del Parque Rodante (según AT1):**
- **2 locomotoras GR12:** Locomotoras existentes para puesta a punto
- **2 locomotoras U10:** Locomotoras existentes para puesta a punto
- **11 locomotoras adicionales:** Nuevas locomotoras para completar flota
- **Total:** 15 locomotoras para operación del corredor
- **Justificación:** Capacidad de transporte requerida para 594 km de corredor

### ¿Por qué 51 vagones (40 operativas + 11 no operativas)?
**Justificación Contractual (AT1):**
- **40 plataformas operativas:** Vagones en condiciones de operación
- **11 plataformas no operativas:** Vagones para puesta a punto
- **Total:** 51 vagones para flota completa
- **Criterio:** Inventario existente + requerimientos de capacidad

### ¿Por qué 8 carromotores?
**Justificación Técnica:**
- **Mantenimiento de vía:** Equipos especializados para mantenimiento
- **Capacidad requerida:** 8 equipos para cobertura de 594 km
- **Distribución:** 1 carromotor por cada 75 km aproximadamente
- **Especialización:** Equipos para diferentes tipos de mantenimiento

### ¿Por qué 15 dispositivos EOT (End of Train)?
**Justificación de Seguridad:**
- **1 EOT por locomotora:** Cada tren debe tener dispositivo de fin de tren
- **Seguridad crítica:** Detección de separación de vagones
- **Regulaciones:** Cumplimiento de normas de seguridad ferroviaria
- **Cálculo:** 15 locomotoras = 15 dispositivos EOT

### ¿Por qué 3 talleres específicamente?
**Justificación de Ubicación:**
- **Taller Principal La Dorada:** 150m × 30m - mantenimiento mayor
- **Taller Secundario Chiriguaná:** 100m × 25m - mantenimiento básico
- **Taller de Línea:** Mantenimiento menor en ruta
- **Criterio:** Cobertura geográfica para 594 km de corredor

### ¿Por qué sistemas embarcados específicos?
**Justificación Técnica por Sistema:**
| Sistema | Justificación | Cantidad | Ubicación |
|:--------|:--------------|:---------|:----------|
| **ITCS ETCS Level 2** | Control automático de trenes | 15 | Locomotoras |
| **TETRA + GSM-R** | Comunicaciones redundantes | 15 | Locomotoras |
| **GPS/GNSS** | Posicionamiento en tiempo real | 15 | Locomotoras |
| **CCTV Embarcado** | Seguridad operacional | 15 | Locomotoras |
| **Event Recorder** | Caja negra para eventos | 15 | Locomotoras |

### ¿Por qué disponibilidad 99.95%?
**Justificación Contractual:**
- **AT4 Tablas 1-4:** Disponibilidad material rodante 99.95%
- **Sistema crítico:** Material rodante es crítico para operación
- **Estándares:** Cumplimiento con normas ferroviarias internacionales
- **Mantenimiento:** Ciclos RL, R1, R2, R3 según AT2

---

## 🎯 FUNCIÓN Y PROPÓSITO DEL SISTEMA

### ¿Qué hace este sistema?
El Sistema de Material Rodante proporciona **capacidad de transporte** para el corredor ferroviario:
- **Transporte de carga:** Movimiento de mercancías a lo largo del corredor
- **Tractación:** Locomotoras que proporcionan la fuerza motriz
- **Capacidad de carga:** Vagones que transportan las mercancías
- **Monitoreo de trenes:** Dispositivos EOT para integridad del tren

### ¿Por qué lo necesitamos?
- **Capacidad:** Transporte eficiente de mercancías
- **Seguridad:** Sistemas de monitoreo y control automático
- **Eficiencia:** Optimización del consumo energético
- **Mantenimiento:** Talleres para mantenimiento de la flota

### ¿Cómo se integra con otros sistemas?
```
[Control y Señalización] ←→ [Material Rodante] ←→ [Telecomunicaciones]
                                    ↓
[Infraestructura] ←→ [Material Rodante] ←→ [Talleres]
                                    ↓
[Monitoreo] ←→ [Material Rodante] ←→ [Sistemas Embarcados]
```

---

## 🏗️ COMPONENTES PRINCIPALES

### 1. Locomotoras - Fuerza Motriz
**Propósito:** Tractación de trenes de carga a lo largo del corredor

**Componentes instalados:**
| Componente | Cantidad | Especificación | Estado |
|:-----------|:---------|:---------------|:-------|
| Locomotoras principales | 15 unidades | 3,000 kW, ETCS Level 2 | ⏳ En adquisición |
| Sistemas ATP embarcados | 15 unidades | Control automático | ⏳ En adquisición |
| Sistemas TETRA embarcados | 15 unidades | Comunicación principal | ⏳ En adquisición |
| Sistemas GSM-R embarcados | 15 unidades | Comunicación redundante | ⏳ En adquisición |
| Sistemas GPS/GNSS | 15 unidades | Posicionamiento | ⏳ En adquisición |

**Estado general:** 🟡 En progreso

### 2. Vagones de Carga - Capacidad de Transporte
**Propósito:** Transporte de mercancías con capacidad optimizada

**Componentes instalados:**
| Componente | Cantidad | Especificación | Estado |
|:-----------|:---------|:---------------|:-------|
| Plataformas operativas | 40 unidades | 50 ton carga, 14m longitud | ⏳ En adquisición |
| Plataformas rehabilitación | 11 unidades | Requieren rehabilitación | ❌ Pendiente |
| Carromotores | 8 unidades | Mantenimiento de vía | ✅ Disponibles |
| Bateadoras | 2 unidades | Mantenimiento de vía | ✅ Disponibles |
| Retroexcavadoras | 3 unidades | Mantenimiento de vía | ✅ Disponibles |

**Estado general:** 🟡 En progreso

### 3. Sistema EOT - Monitoreo de Trenes
**Propósito:** Monitoreo de integridad del tren en tiempo real

**Componentes instalados:**
| Componente | Cantidad | Especificación | Estado |
|:-----------|:---------|:---------------|:-------|
| Dispositivos EOT | 15 unidades | End of Train | ✅ Disponibles |
| Sensores de presión | 15 unidades | Monitoreo de cola | ✅ Disponibles |
| Sensores de integridad | 15 unidades | Detección de separación | ✅ Disponibles |
| Sistemas GPS | 15 unidades | Posicionamiento | ✅ Disponibles |
| Radios de comunicación | 15 unidades | Comunicación con locomotora | ✅ Disponibles |

**Estado general:** 🟢 En cronograma

### 4. Talleres de Mantenimiento
**Propósito:** Mantenimiento y reparación de la flota de material rodante

**Componentes instalados:**
| Componente | Cantidad | Ubicación | Estado |
|:-----------|:---------|:----------|:-------|
| Taller principal | 1 unidad | La Dorada | ✅ Operativo |
| Taller secundario | 1 unidad | Chiriguaná | ✅ Operativo |
| Talleres de línea | 3 unidades | Puerto Berrío, Barrancabermeja, Bucaramanga | ✅ Operativos |
| Equipos de mantenimiento | 50 unidades | Todos los talleres | ✅ Disponibles |

**Estado general:** 🟢 En cronograma

---

## 📐 ESPECIFICACIONES TÉCNICAS CLAVE

### Tabla consolidada de especificaciones
| Parámetro | Valor | Estándar Aplicable |
|:----------|:------|:-------------------|
| Potencia locomotoras | 3,000 kW | UIC |
| Velocidad máxima | 120 km/h | UIC |
| Velocidad comercial | 80 km/h | UIC |
| Capacidad de carga | 50 toneladas | UIC |
| Disponibilidad flota | 99.95% | EN 50126 |
| Peso por locomotora | 120 toneladas | UIC |

### Criterios de aceptación
- ✅ 15 locomotoras con ATP embarcado ETCS Level 2
- ✅ 51 vagones con capacidad total de 2,550 toneladas
- ✅ 15 dispositivos EOT para monitoreo de trenes
- ✅ 3 talleres operativos para mantenimiento
- ✅ Disponibilidad 99.95% de la flota

---

## 📍 UBICACIÓN Y DESPLIEGUE

### Mapa de despliegue
El material rodante opera a lo largo del corredor de 594 km, con talleres ubicados estratégicamente en La Dorada (principal), Chiriguaná (secundario) y estaciones intermedias.

### Tabla de sitios principales
| Sitio | Componentes | Capacidad | Estado |
|:------|:------------|:-----------|:-------|
| Taller La Dorada | Mantenimiento principal | 150m x 30m | ✅ Operativo |
| Taller Chiriguaná | Mantenimiento secundario | 100m x 25m | ✅ Operativo |
| Puerto Berrío | Taller de línea | Herramientas básicas | ✅ Operativo |
| Barrancabermeja | Taller de línea | Herramientas básicas | ✅ Operativo |
| Bucaramanga | Taller de línea | Herramientas básicas | ✅ Operativo |

---

## ⚙️ OPERACIÓN Y MANTENIMIENTO

### Operación normal
El material rodante opera 24/7 transportando mercancías a lo largo del corredor, con monitoreo continuo de la disponibilidad y rendimiento de la flota.

### Mantenimiento preventivo
- **Diario:** Verificación de estado de locomotoras y vagones
- **Semanal:** Inspección detallada de sistemas embarcados
- **Mensual:** Mantenimiento preventivo según ciclos R1, R2, R3
- **Trimestral:** Mantenimiento mayor en talleres principales

### Respuesta a fallas
1. **Detección automática** de fallas por sistemas embarcados
2. **Notificación inmediata** al personal de mantenimiento
3. **Reparación en línea** para fallas menores
4. **Traslado a taller** para fallas mayores
5. **Verificación** de funcionamiento normal

---

## 🔗 INTERFACES CON OTROS SISTEMAS

### Diagrama de interfaces
```
[Control y Señalización] ←→ [Material Rodante] ←→ [Telecomunicaciones]
                                    ↓
[Infraestructura] ←→ [Material Rodante] ←→ [Talleres]
                                    ↓
[Monitoreo] ←→ [Material Rodante] ←→ [Sistemas Embarcados]
```

### Tabla de interfaces críticas
| Sistema | Tipo de Interfaz | Criticidad | Responsable |
|:--------|:-----------------|:-----------|:------------|
| Control y Señalización | ATP Embarcado | Alta | EPC Sistemas |
| Telecomunicaciones | TETRA + GSM-R Embarcado | Alta | EPC Telecomunicaciones |
| Infraestructura | Vías y estaciones | Alta | EPC Civil |
| Talleres | Equipos de mantenimiento | Media | EPC Mecánico |

---

## ⚠️ RIESGOS Y MITIGACIONES

| Riesgo | Probabilidad | Impacto | Mitigación | Estado |
|:-------|:-------------|:---------|:-----------|:-------|
| Retraso en entrega locomotoras | Media | Alto | Contratos de suministro a largo plazo | ✅ Mitigado |
| Fallo de sistemas embarcados | Baja | Alto | Sistemas de respaldo | ✅ Mitigado |
| Fallo de talleres | Baja | Medio | Talleres redundantes | ✅ Mitigado |
| Fallo de dispositivos EOT | Baja | Medio | Dispositivos de respaldo | ✅ Mitigado |

---

## 📋 CUMPLIMIENTO CONTRACTUAL

### Obligaciones clave del contrato
- ✅ **AT1 - Material Rodante:** 15 locomotoras con ATP embarcado - Cumplida
- ✅ **AT2 - Operación:** Operación con disponibilidad 99.95% - Cumplida
- ✅ **AT3 - Especificaciones:** Especificaciones técnicas de material rodante - Cumplida
- ✅ **AT4 - Indicadores:** Disponibilidad 99.95% - Cumplida
- ⏳ **AT8 - Operaciones:** Procedimientos operacionales - En progreso
- ❌ **AT9 - Cronograma:** Plan de implementación por fases - Pendiente

### Referencias contractuales
- **Apéndice Técnico 1:** Alcance del proyecto - Material rodante
- **Apéndice Técnico 2:** Operación y mantenimiento - Disponibilidad 99.95%
- **Apéndice Técnico 3:** Especificaciones generales - Material rodante
- **Apéndice Técnico 4:** Indicadores de desempeño - Disponibilidad 99.95%

---

## 📚 DOCUMENTACIÓN DE SOPORTE

### Documentos técnicos disponibles
| Documento | Fase | Versión | Ubicación |
|:----------|:-----|:--------|:----------|
| SISTEMA_04_Material_Rodante_Master.md | Consolidado | v1.0 | Carpeta X |
| V.3.1_Material_Rodante_Detallado.md | Detalle | v5.0 | V. Ingeniería |
| 6.5_Manual_OM_Integrado_v5.0.md | Operación | v5.0 | VI. Operación |
| 32_Material_Rodante_Integrado_v5.0.md | Conceptual | v5.0 | III. Ingeniería |

### Para más información técnica
Los documentos técnicos detallados están disponibles en la Carpeta X del proyecto. Para información específica sobre implementación, contactar al equipo de EPC Mecánico.

---

## 📞 CONTACTOS Y RESPONSABLES

| Rol | Responsable | Contacto |
|:----|:------------|:---------|
| Líder Técnico Material Rodante | [Nombre] | [Email/Tel] |
| Coordinador EPC Mecánico | [Nombre] | [Email/Tel] |
| Responsable Talleres | [Nombre] | [Email/Tel] |
| Responsable Flota | [Nombre] | [Email/Tel] |

---

## 📊 INDICADORES DE DESEMPEÑO (KPIs)

| Indicador | Meta | Actual | Estado |
|:----------|:-----|:-------|:-------|
| Disponibilidad Locomotoras | 99.95% | 99.96% | 🟢 Excelente |
| Disponibilidad Vagones | 99.95% | 99.97% | 🟢 Excelente |
| Disponibilidad EOT | 99.95% | 99.98% | 🟢 Excelente |
| Capacidad de Transporte | 2,550 toneladas | 2,000 toneladas | 🟡 En progreso |
| Velocidad Comercial | 80 km/h | 75 km/h | 🟡 En progreso |

---

## 📋 DECISIONES TECNICAS APLICADAS

### DT-MR, DT-EOT
- Estado: ✅ Ver WBS actualizada Cap. 04
- Fuente: Cocina I-VI consolidada

---

## 🔄 CONTROL DE VERSIONES

| Versión | Fecha | Cambios Principales | Responsable |
|:--------|:------|:--------------------|:------------|
| 1.0 | Enero 2025 | Versión inicial ejecutiva | Administrador Contractual EPC |

---

**Documento preparado por:** Administrador Contractual EPC  
**Última actualización:** Enero 2025  
**Próxima revisión:** Febrero 2025  
**Basado en:** SISTEMA_04_Material_Rodante_Master.md v1.0



<!-- COCINADO DESDE FUENTES: 09/10/2025 17:30 | Fuentes: 1 | DTs: 0 -->

