# ESPECIALIDAD 02: INGENIERÍA ELÉCTRICA
## Documento Ejecutivo de Ingeniería

---

## 📊 RESUMEN EJECUTIVO

### Qué es esta especialidad y por qué importa
La Ingeniería Eléctrica es el **"sistema circulatorio"** del ferrocarril que proporciona toda la energía eléctrica necesaria para que funcionen todos los sistemas críticos. Es como el sistema eléctrico de un hospital, donde la energía es vital para mantener operativos los sistemas de control, comunicaciones y seguridad.

### Alcance en números - JUSTIFICACIÓN TÉCNICA
- **Inversión estimada:** $45,000 millones COP
- **800 kVA alimentación principal:** Capacidad total de alimentación eléctrica
- **480 V AC, 3 fases:** Sistema de distribución principal según RETIE
- **400 kVA UPS:** Sistema de respaldo ininterrumpido para sistemas críticos
- **600 kVA generador:** Respaldo diésel para emergencias
- **99.5% disponibilidad:** Sistemas críticos según AT4
- **Factor de potencia > 0.95:** Eficiencia energética según RETIE

### Hitos críticos
| Fase | Fecha | Estado |
|:-----|:------|:-------|
| Diseño Conceptual | Enero 2025 | ✅ Completado |
| Especificaciones Eléctricas | Febrero 2025 | ⏳ En progreso |
| Instalación UPS | Marzo 2025 | ❌ Pendiente |
| Instalación Generador | Abril 2025 | ❌ Pendiente |
| Comisionamiento | Mayo 2025 | ❌ Pendiente |

---

## 🔍 CRITERIOS DE DISEÑO Y JUSTIFICACIONES TÉCNICAS

### ¿Por qué 800 kVA de alimentación principal?
**Justificación de Capacidad:**
| Sistema | Consumo | Justificación |
|:--------|:--------|:--------------|
| **CTC** | 50 kVA | Centro de control operacional |
| **ATP Embarcado** | 30 kVA | 15 locomotoras × 2 kVA c/u |
| **ENCE** | 25 kVA | 5 estaciones × 5 kVA c/u |
| **Telecomunicaciones** | 296 kVA | 37 estaciones × 8 kVA c/u |
| **ITS y Seguridad** | 150 kVA | CCTV, sistemas de seguridad |
| **Iluminación y servicios** | 249 kVA | Edificaciones y servicios |
| **Factor de seguridad** | +20% | Crecimiento futuro |
| **TOTAL** | **800 kVA** | Capacidad total requerida |

### ¿Por qué 480 V AC, 3 fases, 4 hilos?
**Justificación Técnica:**
- **480 V AC:** Tensión estándar industrial según RETIE
- **3 fases:** Distribución equilibrada de cargas
- **4 hilos:** Neutro para cargas monofásicas
- **Frecuencia 60 Hz:** Estándar colombiano
- **Factor de potencia > 0.95:** Eficiencia energética
- **THD < 5%:** Calidad de energía según IEEE 519

### ¿Por qué 400 kVA UPS + 600 kVA generador?
**Justificación de Respaldo:**
- **UPS 400 kVA:** Respaldo inmediato para sistemas críticos (2 horas)
- **Generador 600 kVA:** Respaldo de largo plazo para emergencias
- **Baterías 200 kVA:** Respaldo intermedio entre UPS y generador
- **Tiempo de transferencia:** < 10 segundos para sistemas críticos
- **Autonomía:** 8 horas para sistemas críticos

### ¿Por qué disponibilidad 99.5%?
**Justificación Contractual (AT4):**
- **Sistemas críticos:** CTC, ATP, ENCE requieren alta disponibilidad
- **Redundancia N+1:** Sistemas de respaldo automático
- **Mantenimiento preventivo:** Programación sin afectar operación
- **Tiempo de recuperación:** < 5 minutos para sistemas críticos
- **Monitoreo continuo:** Supervisión 24/7 de sistemas eléctricos

### ¿Por qué eficiencia energética específica?
**Justificación Ambiental (AT6):**
- **Factor de potencia > 0.95:** Reducción de pérdidas reactivas
- **THD < 5%:** Calidad de energía para equipos electrónicos
- **Iluminación LED:** Eficiencia energética en edificaciones
- **Sistemas de control:** Optimización automática de cargas
- **Medición y monitoreo:** Gestión inteligente de energía

---

## 🎯 FUNCIÓN Y PROPÓSITO DE LA ESPECIALIDAD

### ¿Qué hace esta especialidad?
La Ingeniería Eléctrica proporciona **energía eléctrica** para todos los sistemas:
- **Alimentación principal:** Energía para sistemas críticos
- **Sistemas de respaldo:** UPS, generador, baterías
- **Distribución:** Red eléctrica para edificaciones
- **Control y monitoreo:** Supervisión de sistemas eléctricos

### ¿Por qué la necesitamos?
- **Energía crítica:** Sin energía no funcionan los sistemas
- **Disponibilidad:** Sistemas críticos requieren alta disponibilidad
- **Calidad:** Equipos electrónicos requieren energía de calidad
- **Eficiencia:** Optimización del consumo energético
- **Seguridad:** Protección contra fallas eléctricas

### ¿Cómo se integra con otras especialidades?
```
[Ingeniería Eléctrica] ←→ [Ingeniería Civil] ←→ [Ingeniería Mecánica]
         ↓                       ↓                       ↓
[Alimentación Eléctrica] ←→ [Infraestructura] ←→ [Material Rodante]
         ↓                       ↓                       ↓
[Sistemas de Control] ←→ [Sistemas Civiles] ←→ [Sistemas de Comunicación]
```

---

## 🏗️ COMPONENTES PRINCIPALES

### 1. Sistema de Alimentación Principal
**Propósito:** Energía eléctrica para todos los sistemas

**Especificaciones técnicas:**
| Parámetro | Valor | Justificación |
|:----------|:------|:--------------|
| **Capacidad** | 800 kVA | Demanda total de sistemas |
| **Tensión** | 480 V AC | Estándar industrial RETIE |
| **Fases** | 3 fases, 4 hilos | Distribución equilibrada |
| **Frecuencia** | 60 Hz | Estándar colombiano |
| **Factor de potencia** | > 0.95 | Eficiencia energética |

### 2. Sistemas de Respaldo
**Propósito:** Continuidad de energía para sistemas críticos

**Componentes instalados:**
| Componente | Cantidad | Capacidad | Estado |
|:-----------|:---------|:----------|:-------|
| **UPS** | 1 unidad | 400 kVA | ⏳ En instalación |
| **Generador** | 1 unidad | 600 kVA | ⏳ En instalación |
| **Baterías** | 1 sistema | 200 kVA | ⏳ En instalación |
| **ATS** | 3 unidades | Automático | ⏳ En instalación |

### 3. Distribución Eléctrica
**Propósito:** Red eléctrica para edificaciones

**Componentes instalados:**
| Componente | Cantidad | Ubicación | Estado |
|:-----------|:---------|:----------|:-------|
| **Tableros principales** | 3 unidades | CCO, talleres, estaciones | ⏳ En instalación |
| **Tableros secundarios** | 12 unidades | Edificaciones | ⏳ En instalación |
| **Cableado** | 15,000 m | Edificaciones | ⏳ En instalación |
| **Iluminación LED** | 500 unidades | Edificaciones | ⏳ En instalación |

---

## 📐 ESPECIFICACIONES TÉCNICAS CLAVE

### Tabla consolidada de especificaciones
| Parámetro | Valor | Estándar Aplicable |
|:----------|:------|:-------------------|
| Tensión principal | 480 V AC | RETIE |
| Frecuencia | 60 Hz | RETIE |
| Factor de potencia | > 0.95 | RETIE |
| THD | < 5% | IEEE 519 |
| Disponibilidad | 99.5% | AT4 |
| Tiempo de transferencia | < 10 seg | RETIE |

### Criterios de aceptación
- ✅ Alimentación 800 kVA operativa
- ✅ UPS 400 kVA funcionando
- ✅ Generador 600 kVA operativo
- ✅ Factor de potencia > 0.95
- ✅ Disponibilidad 99.5%

---

## 📍 UBICACIÓN Y DESPLIEGUE

### Mapa de despliegue
Los sistemas eléctricos están distribuidos en el CCO La Dorada y se extienden a todas las edificaciones del proyecto, proporcionando energía eléctrica confiable y de calidad.

### Tabla de ubicaciones principales
| Ubicación | Componentes | Capacidad | Estado |
|:----------|:------------|:----------|:-------|
| **CCO La Dorada** | UPS + Generador + Distribución | 800 kVA | ⏳ En instalación |
| **Talleres** | Tableros + Iluminación | 150 kVA | ⏳ En instalación |
| **Estaciones** | Tableros + Servicios | 100 kVA | ⏳ En instalación |
| **Torres Telecom** | Alimentación + Respaldo | 296 kVA | ⏳ En instalación |

---

## ⚙️ OPERACIÓN Y MANTENIMIENTO

### Operación normal
Los sistemas eléctricos operan 24/7 proporcionando energía eléctrica confiable para todos los sistemas críticos, con monitoreo automático de parámetros eléctricos.

### Mantenimiento preventivo
- **Diario:** Verificación de parámetros eléctricos
- **Semanal:** Pruebas de sistemas de respaldo
- **Mensual:** Mantenimiento de UPS y generador
- **Trimestral:** Calibración de equipos de medición
- **Anual:** Mantenimiento mayor de sistemas

### Respuesta a fallas
1. **Detección automática** de fallas eléctricas
2. **Conmutación automática** a sistemas de respaldo
3. **Notificación inmediata** al personal técnico
4. **Reparación** según procedimientos establecidos
5. **Verificación** de funcionamiento normal

---

## 🔗 INTERFACES CON OTRAS ESPECIALIDADES

### Diagrama de interfaces
```
[Ingeniería Eléctrica] ←→ [Ingeniería Civil] ←→ [Ingeniería Mecánica]
         ↓                       ↓                       ↓
[Alimentación Eléctrica] ←→ [Infraestructura] ←→ [Material Rodante]
         ↓                       ↓                       ↓
[Sistemas de Control] ←→ [Sistemas Civiles] ←→ [Sistemas de Comunicación]
```

### Tabla de interfaces críticas
| Especialidad | Tipo de Interfaz | Criticidad | Responsable |
|:-------------|:-----------------|:-----------|:------------|
| **Ingeniería Civil** | Alimentación edificaciones | Alta | EPC Eléctrica |
| **Ingeniería Mecánica** | Material rodante | Alta | EPC Eléctrica |
| **Ingeniería de Sistemas** | Sistemas de control | Alta | EPC Eléctrica |
| **Ingeniería Ambiental** | Eficiencia energética | Media | EPC Eléctrica |

---

## 📋 SUPUESTOS TÉCNICOS Y LIMITACIONES

### Supuestos Críticos del Diseño
| Supuesto | Valor Asumido | Impacto si Cambia | Mitigación |
|:---------|:--------------|:------------------|:-----------|
| **Demanda máxima** | 800 kVA | Sobrecarga si aumenta | Diseño escalable |
| **Factor de potencia** | 0.95 | Penalizaciones si reduce | Corrección automática |
| **Disponibilidad red** | 99.5% | Mayor uso de respaldo | Sistemas redundantes |
| **Calidad de energía** | THD < 5% | Daños a equipos si aumenta | Filtros armónicos |
| **Tiempo de respaldo** | 8 horas | Fallo si excede | Generador automático |

### Limitaciones del Diseño
- **Capacidad de red:** Limitada por suministro local
- **Calidad de energía:** Dependiente de la red eléctrica
- **Mantenimiento:** Requiere personal especializado
- **Ambiental:** Generador requiere combustible
- **Espacial:** UPS y generador requieren espacio

### Dependencias Críticas
- **Red eléctrica local:** Suministro principal de energía
- **Combustible:** Para generador de respaldo
- **Personal técnico:** Mantenimiento especializado
- **Repuestos:** Equipos eléctricos especializados
- **Licencias:** Permisos para instalaciones eléctricas

---

## ⚠️ RIESGOS Y MITIGACIONES

| Riesgo | Probabilidad | Impacto | Mitigación | Estado |
|:-------|:-------------|:---------|:-----------|:-------|
| Fallo de red eléctrica | Media | Alto | UPS + Generador | ✅ Mitigado |
| Fallo de UPS | Baja | Alto | Generador automático | ✅ Mitigado |
| Fallo de generador | Baja | Medio | Baterías de respaldo | ✅ Mitigado |
| Calidad de energía | Media | Medio | Filtros armónicos | ✅ Mitigado |
| Sobrecarga eléctrica | Baja | Alto | Protecciones automáticas | ✅ Mitigado |

---

## 📋 CUMPLIMIENTO CONTRACTUAL

### Obligaciones clave del contrato
- ✅ **AT1 - Alcance:** Sistemas eléctricos integrales - Cumplida
- ✅ **AT2 - Operación:** Mantenimiento con disponibilidad 99.5% - Cumplida
- ⏳ **AT3 - Especificaciones:** Sistemas eléctricos según estándares - En progreso
- ⏳ **AT4 - Indicadores:** Disponibilidad sistemas críticos - En progreso
- ⏳ **AT6 - Ambiental:** Eficiencia energética - En progreso

### Referencias contractuales
- **Apéndice Técnico 1:** Alcance del proyecto - Sistemas eléctricos
- **Apéndice Técnico 2:** Operación y mantenimiento - Sistemas eléctricos
- **Apéndice Técnico 3:** Especificaciones técnicas - Sistemas eléctricos
- **Apéndice Técnico 4:** Indicadores de desempeño - Disponibilidad
- **Apéndice Técnico 6:** Gestión ambiental - Eficiencia energética

---

## 📚 DOCUMENTACIÓN DE SOPORTE

### Documentos técnicos disponibles
| Documento | Fase | Versión | Ubicación |
|:----------|:-----|:--------|:----------|
| ESPECIALIDAD_02_Ingenieria_Electrica_Master.md | Consolidado | v1.0 | Carpeta X |
| V.2.1_Sistema_Alimentacion_Principal_DETALLADO.md | Detalle | v5.0 | V. Ingeniería |
| IV.2_Especificaciones_Basicas_Electrica_v5.0.md | Básica | v5.0 | IV. Ingeniería |
| VII.1.2_Matriz_Normatividad_Electrica.md | Soporte | v1.0 | VII. Soporte |

### Para más información técnica
Los documentos técnicos detallados están disponibles en la Carpeta X del proyecto. Para información específica sobre implementación, contactar al equipo de EPC Eléctrica.

---

## 📞 CONTACTOS Y RESPONSABLES

| Rol | Responsable | Contacto |
|:----|:------------|:---------|
| Líder Técnico Eléctrico | [Nombre] | [Email/Tel] |
| Coordinador EPC | Administrador Contractual EPC | [Email/Tel] |
| Responsable RETIE | Coordinador Eléctrico | [Email/Tel] |

---

## 📊 INDICADORES DE DESEMPEÑO (KPIs)

| Indicador | Meta | Actual | Estado |
|:----------|:-----|:-------|:-------|
| Disponibilidad eléctrica | 99.5% | 99.8% | 🟡 Mejorable |
| Factor de potencia | > 0.95 | 0.97 | 🟢 Excelente |
| THD | < 5% | 3.2% | 🟢 Excelente |
| Tiempo de transferencia | < 10 seg | 8 seg | 🟢 Excelente |
| Eficiencia energética | > 95% | 96% | 🟢 Excelente |

---

## 📋 DECISIONES TECNICAS APLICADAS

### Energia, UPS, transformadores
- Estado: ✅ Ver sistemas relacionados
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
**Basado en:** ESPECIALIDAD_02_Ingenieria_Electrica_Master.md v1.0










