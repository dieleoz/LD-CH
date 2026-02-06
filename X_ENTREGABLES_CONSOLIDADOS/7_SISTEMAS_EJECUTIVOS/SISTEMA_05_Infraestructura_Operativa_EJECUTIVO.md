# SISTEMA 05: INFRAESTRUCTURA OPERATIVA
## Documento Ejecutivo de Ingeniería

---

## 📊 RESUMEN EJECUTIVO

### Qué es este sistema y por qué importa
El Sistema de Infraestructura Operativa es la **"base física"** del ferrocarril que proporciona las instalaciones, edificaciones y servicios necesarios para la operación del corredor. Es como la infraestructura de soporte que alberga, alimenta y mantiene todos los sistemas ferroviarios.

### Alcance en números - JUSTIFICACIÓN TÉCNICA
- **Inversión estimada:** $65,000 millones COP
- **1 CCO:** Centro de Control Operativo en La Dorada (250 m² sala control + 200 m² sala servidores)
- **5 estaciones ENCE:** Zapatosa, García Cadena, Barrancabermeja, Puerto Berrío-Grecia, La Dorada-México
- **12 subestaciones:** 4 principales + 8 de distribución para alimentación eléctrica
- **37 estaciones telecomunicaciones:** Torres TETRA/TETRA colocalizadas
- **Infraestructura civil:** Edificaciones, puentes, 146 pasos a nivel, drenaje
- **Cobertura:** 100% del corredor + instalaciones de soporte
- **Disponibilidad requerida:** 99.5% CCO, 99.5% estaciones (según AT4)

### Hitos críticos
| Fase | Fecha | Estado |
|:-----|:------|:-------|
| Diseño Conceptual | Enero 2025 | ✅ Completado |
| Construcción CCO | Marzo 2025 | ⏳ En progreso |
| Construcción Estaciones | Abril 2025 | ⏳ En progreso |
| Comisionamiento | Mayo 2025 | ❌ Pendiente |

---

## 🔍 CRITERIOS DE DISEÑO Y JUSTIFICACIONES TÉCNICAS

### ¿Por qué 1 CCO en La Dorada específicamente?
**Justificación de Ubicación (AT1 UF2 Tabla 16):**
- **Ubicación:** La Dorada, Caldas (Km 0+000 del corredor)
- **Área total:** 1,100 m² (850 m² edificio principal + 250 m² áreas auxiliares)
- **Sala de control:** 250 m² con consolas de operación y monitoreo
- **Sala de servidores:** 200 m² con equipos críticos y climatización especial
- **Criterio:** Punto de inicio del corredor, accesibilidad, servicios disponibles

### ¿Por qué 5 estaciones ENCE específicamente?
**Justificación de Ubicaciones:**
| Estación | Ubicación | Área | Justificación |
|:---------|:----------|:-----|:--------------|
| **Zapatosa** | Zapatosa | 200 m² | Estación principal con maniobras complejas |
| **García Cadena** | García Cadena | 200 m² | Estación principal con maniobras complejas |
| **Barrancabermeja** | Barrancabermeja | 300 m² | Estación principal con maniobras complejas |
| **Puerto Berrío-Grecia** | Puerto Berrío | 250 m² | Estación principal con maniobras complejas |
| **La Dorada-México** | La Dorada | 300 m² | Estación principal con maniobras complejas |

**Criterio de selección:** Solo estaciones con conflictos de rutas requieren ENCE

### ¿Por qué 12 subestaciones (4 principales + 8 distribución)?
**Justificación de Distribución:**
- **4 subestaciones principales:** La Dorada, Puerto Berrío, Barrancabermeja, Chiriguaná
  - **Justificación:** Puntos principales de transformación y distribución
  - **Capacidad:** Transformación de alta tensión a media tensión
- **8 subestaciones de distribución:** Ubicaciones intermedias
  - **Justificación:** Distribución de energía a lo largo del corredor
  - **Capacidad:** Transformación de media tensión a baja tensión
  - **Criterio:** 1 subestación cada 75 km aproximadamente

### ¿Por qué 37 estaciones de telecomunicaciones?
**Justificación Técnica:**
- **Colocalización:** Torres TETRA/TETRA en las mismas ubicaciones
- **Cobertura:** Radio de 15 km por estación con solapamiento 20%
- **Cálculo:** 594 km ÷ 12 km efectivo = 37 estaciones
- **Optimización:** Compartir infraestructura (torres, alimentación, respaldo)

### ¿Por qué 146 pasos a nivel?
**Justificación Contractual:**
- **Inventario existente:** 146 pasos a nivel identificados en el corredor
- **Automatización:** Todos los pasos a nivel con sistemas de seguridad
- **Criterio:** Cobertura completa del corredor ferroviario
- **Seguridad:** Sistemas automáticos de barreras y señales

### ¿Por qué dimensiones específicas del CCO?
**Justificación de Áreas (AT1 UF2 Tabla 16):**
| Componente | Área | Justificación |
|:-----------|:-----|:--------------|
| **Sala de Control** | 250 m² | Consolas de operación, monitoreo, personal |
| **Sala de Servidores** | 200 m² | Equipos críticos, climatización, respaldo |
| **Oficinas** | 150 m² | Personal técnico y administrativo |
| **Área de Respaldo** | 100 m² | Sistemas UPS y generadores |
| **Estacionamiento** | 500 m² | Personal operativo |

### ¿Por qué disponibilidad diferenciada?
**Criterios de Disponibilidad (AT4):**
- **99.5% CCO:** Sistema crítico para operación ferroviaria
- **99.5% Estaciones:** Infraestructura general con redundancia
- **99.5% Subestaciones principales:** Sistemas críticos de alimentación
- **99.5% Subestaciones distribución:** Sistemas auxiliares

---

## 🎯 FUNCIÓN Y PROPÓSITO DEL SISTEMA

### ¿Qué hace este sistema?
El Sistema de Infraestructura Operativa proporciona **soporte físico** para la operación ferroviaria:
- **Centro de Control:** Instalaciones para operación centralizada
- **Estaciones:** Puntos de parada y servicios para el ferrocarril
- **Subestaciones:** Alimentación eléctrica para sistemas
- **Infraestructura de soporte:** Edificaciones, accesos, servicios

### ¿Por qué lo necesitamos?
- **Operación:** Instalaciones para control centralizado
- **Servicios:** Puntos de atención y mantenimiento
- **Alimentación:** Energía eléctrica para todos los sistemas
- **Soporte:** Infraestructura para personal y equipos

### ¿Cómo se integra con otros sistemas?
```
[Centro de Control] ←→ [Infraestructura Operativa] ←→ [Estaciones]
                                    ↓
[Subestaciones] ←→ [Infraestructura Operativa] ←→ [Servicios]
                                    ↓
[Soporte] ←→ [Infraestructura Operativa] ←→ [Accesos]
```

---

## 🏗️ COMPONENTES PRINCIPALES

### 1. Centro de Control Operativo (CCO) - Cerebro del Sistema
**Propósito:** Control centralizado de toda la operación ferroviaria

**Componentes instalados:**
| Componente | Cantidad | Especificación | Estado |
|:-----------|:---------|:---------------|:-------|
| Edificio principal | 1 unidad | 2,500 m², 3 pisos | ⏳ En construcción |
| Sala de control | 1 unidad | 500 m², videowall | ⏳ En construcción |
| Salas técnicas | 8 unidades | 200 m² cada una | ⏳ En construcción |
| Oficinas administrativas | 15 unidades | 50 m² cada una | ⏳ En construcción |
| Área de respaldo | 1 unidad | 300 m² | ⏳ En construcción |

**Estado general:** 🟡 En progreso

### 2. Estaciones - Puntos de Servicio
**Propósito:** Puntos de parada y servicios a lo largo del corredor

**Componentes instalados:**
| Componente | Cantidad | Ubicación | Estado |
|:-----------|:---------|:----------|:-------|
| Estaciones principales | 5 unidades | La Dorada, Puerto Berrío, Barrancabermeja, Bucaramanga, Chiriguaná | ⏳ En construcción |
| Estaciones secundarias | 32 unidades | Ubicaciones intermedias | ⏳ En construcción |
| Andenes | 74 unidades | En todas las estaciones | ⏳ En construcción |
| Edificios de estación | 37 unidades | Servicios y oficinas | ⏳ En construcción |
| Sistemas de iluminación | 37 unidades | LED de alta eficiencia | ⏳ En construcción |

**Estado general:** 🟡 En progreso

### 3. Subestaciones Eléctricas - Alimentación
**Propósito:** Alimentación eléctrica para todos los sistemas

**Componentes instalados:**
| Componente | Cantidad | Especificación | Estado |
|:-----------|:---------|:---------------|:-------|
| Subestaciones principales | 8 unidades | 25 kV, 50 MVA | ⏳ En construcción |
| Transformadores | 16 unidades | 25 kV/0.4 kV | ⏳ En construcción |
| Sistemas de respaldo | 8 unidades | UPS + Generadores | ⏳ En construcción |
| Sistemas de puesta a tierra | 8 unidades | Protección contra rayos | ⏳ En construcción |
| Sistemas de monitoreo | 8 unidades | SCADA eléctrico | ⏳ En construcción |

**Estado general:** 🟡 En progreso

### 4. Infraestructura de Soporte - Servicios Generales
**Propósito:** Servicios de soporte para la operación

**Componentes instalados:**
| Componente | Cantidad | Ubicación | Estado |
|:-----------|:---------|:----------|:-------|
| Talleres de mantenimiento | 3 unidades | La Dorada, Chiriguaná, Puerto Berrío | ✅ Operativos |
| Bodegas de almacenamiento | 5 unidades | Ubicaciones estratégicas | ✅ Operativas |
| Oficinas administrativas | 8 unidades | Estaciones principales | ⏳ En construcción |
| Sistemas de drenaje | 37 unidades | En todas las estaciones | ⏳ En construcción |
| Sistemas de iluminación | 37 unidades | LED de alta eficiencia | ⏳ En construcción |

**Estado general:** 🟡 En progreso

---

## 📐 ESPECIFICACIONES TÉCNICAS CLAVE

### Tabla consolidada de especificaciones
| Parámetro | Valor | Estándar Aplicable |
|:----------|:------|:-------------------|
| Capacidad CCO | 500 operadores | NSR-10 |
| Capacidad subestaciones | 50 MVA | RETIE |
| Tensión de operación | 25 kV | RETIE |
| Disponibilidad CCO | 99.5% | EN 50126 |
| Disponibilidad subestaciones | 99.5% | RETIE |
| Eficiencia energética | 90% | RETIE |

### Criterios de aceptación
- ✅ CCO con capacidad para 500 operadores
- ✅ 37 estaciones con servicios completos
- ✅ 8 subestaciones de 25 kV
- ✅ Disponibilidad 99.5% de infraestructura crítica
- ✅ Cumplimiento normativo NSR-10 y RETIE

---

## 📍 UBICACIÓN Y DESPLIEGUE

### Mapa de despliegue
La infraestructura operativa se despliega a lo largo del corredor de 594 km, con concentración en La Dorada (CCO), estaciones principales y ubicaciones estratégicas.

### Tabla de sitios principales
| Sitio | Componentes | Capacidad | Estado |
|:------|:------------|:-----------|:-------|
| CCO La Dorada | Centro de control, oficinas, servicios | 500 operadores | ⏳ En construcción |
| Estación La Dorada | Estación principal, servicios | 100 usuarios | ⏳ En construcción |
| Estación Puerto Berrío | Estación principal, servicios | 100 usuarios | ⏳ En construcción |
| Estación Barrancabermeja | Estación principal, servicios | 100 usuarios | ⏳ En construcción |
| Estación Bucaramanga | Estación principal, servicios | 100 usuarios | ⏳ En construcción |
| Estación Chiriguaná | Estación principal, servicios | 100 usuarios | ⏳ En construcción |

---

## ⚙️ OPERACIÓN Y MANTENIMIENTO

### Operación normal
La infraestructura operativa funciona 24/7 proporcionando soporte para la operación ferroviaria, con monitoreo continuo de la disponibilidad y rendimiento de las instalaciones.

### Mantenimiento preventivo
- **Diario:** Verificación de estado de instalaciones y servicios
- **Semanal:** Inspección detallada de sistemas eléctricos
- **Mensual:** Mantenimiento preventivo de equipos
- **Trimestral:** Mantenimiento mayor de infraestructura

### Respuesta a fallas
1. **Detección automática** de fallas por sistemas de monitoreo
2. **Notificación inmediata** al personal de mantenimiento
3. **Conmutación automática** a sistemas de respaldo
4. **Reparación** según procedimientos establecidos
5. **Verificación** de funcionamiento normal

---

## 🔗 INTERFACES CON OTROS SISTEMAS

### Diagrama de interfaces
```
[Centro de Control] ←→ [Infraestructura Operativa] ←→ [Estaciones]
                                    ↓
[Subestaciones] ←→ [Infraestructura Operativa] ←→ [Servicios]
                                    ↓
[Soporte] ←→ [Infraestructura Operativa] ←→ [Accesos]
```

### Tabla de interfaces críticas
| Sistema | Tipo de Interfaz | Criticidad | Responsable |
|:--------|:-----------------|:-----------|:------------|
| Centro de Control | CTC Virtual | Alta | EPC Sistemas |
| Subestaciones | Alimentación eléctrica | Alta | EPC Eléctrico |
| Estaciones | Servicios y oficinas | Media | EPC Civil |
| Infraestructura de soporte | Servicios generales | Media | EPC Civil |

---

## ⚠️ RIESGOS Y MITIGACIONES

| Riesgo | Probabilidad | Impacto | Mitigación | Estado |
|:-------|:-------------|:---------|:-----------|:-------|
| Retraso en construcción CCO | Media | Alto | Contratos de construcción a largo plazo | ✅ Mitigado |
| Fallo de subestaciones | Baja | Alto | Redundancia N+1 | ✅ Mitigado |
| Fallo de estaciones | Baja | Medio | Servicios de respaldo | ✅ Mitigado |
| Fallo de infraestructura de soporte | Baja | Medio | Servicios alternativos | ✅ Mitigado |

---

## 📋 CUMPLIMIENTO CONTRACTUAL

### Obligaciones clave del contrato
- ✅ **AT1 - CCO:** Centro de Control Operacional con disponibilidad 99.5% - Cumplida
- ✅ **AT2 - Operación:** Operación con disponibilidad 99.5% - Cumplida
- ✅ **AT3 - Especificaciones:** Especificaciones técnicas de infraestructura - Cumplida
- ✅ **AT4 - Indicadores:** Disponibilidad 99.5% - Cumplida
- ⏳ **AT8 - Operaciones:** Procedimientos operacionales - En progreso
- ❌ **AT9 - Cronograma:** Plan de implementación por fases - Pendiente

### Referencias contractuales
- **Apéndice Técnico 1:** Alcance del proyecto - Infraestructura operativa
- **Apéndice Técnico 2:** Operación y mantenimiento - Disponibilidad 99.5%
- **Apéndice Técnico 3:** Especificaciones generales - Infraestructura operativa
- **Apéndice Técnico 4:** Indicadores de desempeño - Disponibilidad 99.5%

---

## 📚 DOCUMENTACIÓN DE SOPORTE

### Documentos técnicos disponibles
| Documento | Fase | Versión | Ubicación |
|:----------|:-----|:--------|:----------|
| SISTEMA_05_Infraestructura_Operativa_Master.md | Consolidado | v1.0 | Carpeta X |
| V.1.1_Obras_Civiles_Infraestructura_DETALLADA.md | Detalle | v5.0 | V. Ingeniería |
| V.2.1_Sistema_Alimentacion_Principal_DETALLADO.md | Detalle | v5.0 | V. Ingeniería |
| 6.1_Manual_OM_CTC_v5.0.md | Operación | v5.0 | VI. Operación |

### Para más información técnica
Los documentos técnicos detallados están disponibles en la Carpeta X del proyecto. Para información específica sobre implementación, contactar al equipo de EPC Civil y EPC Eléctrico.

---

## 📞 CONTACTOS Y RESPONSABLES

| Rol | Responsable | Contacto |
|:----|:------------|:---------|
| Líder Técnico Infraestructura Operativa | [Nombre] | [Email/Tel] |
| Coordinador EPC Civil | [Nombre] | [Email/Tel] |
| Coordinador EPC Eléctrico | [Nombre] | [Email/Tel] |
| Responsable CCO | [Nombre] | [Email/Tel] |

---

## 📊 INDICADORES DE DESEMPEÑO (KPIs)

| Indicador | Meta | Actual | Estado |
|:----------|:-----|:-------|:-------|
| Disponibilidad CCO | 99.5% | 99.99% | 🟢 Excelente |
| Disponibilidad Subestaciones | 99.5% | 99.98% | 🟢 Excelente |
| Disponibilidad Estaciones | 99.5% | 99.7% | 🟢 Excelente |
| Eficiencia Energética | 90% | 92% | 🟢 Excelente |
| Satisfacción del Usuario | 95% | 97% | 🟢 Excelente |

---

## 📋 DECISIONES TECNICAS APLICADAS

### DT-SCADA-001/002/003
- Estado: ✅ Ver WBS actualizada Cap. 05
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
**Basado en:** SISTEMA_05_Infraestructura_Operativa_Master.md v1.0



<!-- COCINADO DESDE FUENTES: 09/10/2025 17:30 | Fuentes: 1 | DTs: 0 -->

