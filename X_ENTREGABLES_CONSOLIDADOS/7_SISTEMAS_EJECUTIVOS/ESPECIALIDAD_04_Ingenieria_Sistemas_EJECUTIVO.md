# ESPECIALIDAD 04: INGENIERÍA DE SISTEMAS
## Documento Ejecutivo de Ingeniería

---

## 📊 RESUMEN EJECUTIVO

### Qué es esta especialidad y por qué importa
La Ingeniería de Sistemas es el **"sistema nervioso"** del ferrocarril que integra y coordina todos los sistemas técnicos para que trabajen como un conjunto unificado. Es como el software de un computador que hace que todos los componentes trabajen juntos de manera eficiente y segura.

### Alcance en números - JUSTIFICACIÓN TÉCNICA
- **Inversión estimada:** $35,000 millones COP
- **6 sistemas técnicos integrados:** Control, Telecomunicaciones, ITS, Seguridad, Material Rodante, Infraestructura
- **25 interfaces críticas:** Comunicación entre sistemas
- **15 protocolos:** Estándares de interoperabilidad
- **12 APIs:** Comunicación con sistemas externos
- **99.95% disponibilidad:** Sistemas críticos integrados

---

## 🔍 CRITERIOS DE DISEÑO Y JUSTIFICACIONES TÉCNICAS

### ¿Por qué 6 sistemas técnicos integrados?
**Justificación de Integración:**
| Sistema | Función | Justificación |
|:--------|:--------|:--------------|
| **Control y Señalización** | Control centralizado | Operación segura de trenes |
| **Telecomunicaciones** | Comunicaciones | Conectividad entre sistemas |
| **ITS y Seguridad** | Monitoreo y seguridad | Protección de infraestructura |
| **Material Rodante** | Transporte | Capacidad de transporte |
| **Infraestructura** | Soporte físico | Base para todos los sistemas |
| **Integración** | Coordinación | Funcionamiento unificado |

### ¿Por qué 25 interfaces críticas?
**Justificación de Interfaces:**
- **CTC-ITCS:** 5 interfaces para control automático de trenes
- **TETRA-GSM-R:** 4 interfaces para comunicaciones redundantes
- **ITS-Seguridad:** 3 interfaces para monitoreo y control
- **Material Rodante-ATP:** 4 interfaces para control embarcado
- **Infraestructura:** 6 interfaces para coordinación
- **FENOCO:** 3 interfaces para interoperabilidad nacional

### ¿Por qué 15 protocolos de interoperabilidad?
**Justificación de Protocolos:**
- **UIC 920-2:** Comunicaciones GSM-R estándar internacional
- **UIC 438:** Señalización ferroviaria compatible con FENOCO
- **UIC 930:** Sistemas de señalización interoperables
- **UIC 950:** Control de tráfico coordinado
- **FFFIS:** Interfaces CTC-ITCS específicas
- **EN 50159:** Seguridad de comunicaciones

---

## 🎯 FUNCIÓN Y PROPÓSITO DE LA ESPECIALIDAD

### ¿Qué hace esta especialidad?
La Ingeniería de Sistemas proporciona **integración y coordinación** entre todos los sistemas:
- **Interfaces:** Comunicación entre sistemas técnicos
- **Protocolos:** Estándares de interoperabilidad
- **APIs:** Comunicación con sistemas externos
- **Coordinación:** Funcionamiento unificado de todos los sistemas

### ¿Por qué la necesitamos?
- **Integración:** Sistemas que trabajen como un conjunto
- **Interoperabilidad:** Compatibilidad con FENOCO y estándares
- **Eficiencia:** Optimización del funcionamiento conjunto
- **Seguridad:** Coordinación de sistemas de seguridad
- **Mantenimiento:** Gestión integrada de todos los sistemas

---

## 🏗️ COMPONENTES PRINCIPALES

### 1. Sistema de Integración
**Propósito:** Coordinación entre todos los sistemas técnicos

**Especificaciones técnicas:**
| Parámetro | Valor | Justificación |
|:----------|:------|:--------------|
| **Interfaces** | 25 críticas | Comunicación entre sistemas |
| **Protocolos** | 15 estándares | Interoperabilidad |
| **APIs** | 12 externas | Comunicación con FENOCO |
| **Disponibilidad** | 99.95% | Sistemas críticos |

### 2. Gateway de Integración
**Propósito:** Conversión de protocolos entre sistemas

**Componentes instalados:**
| Componente | Cantidad | Función | Estado |
|:-----------|:---------|:--------|:-------|
| **Gateway UIC** | 1 unidad | Conversión protocolos | ⏳ En desarrollo |
| **Sistema de monitoreo** | 1 unidad | Supervisión integrada | ⏳ En desarrollo |
| **Sistema de control** | 1 unidad | Coordinación centralizada | ⏳ En desarrollo |

---

## 📐 ESPECIFICACIONES TÉCNICAS CLAVE

### Tabla consolidada de especificaciones
| Parámetro | Valor | Estándar Aplicable |
|:----------|:------|:-------------------|
| Interfaces críticas | 25 | Especificaciones proyecto |
| Protocolos | 15 | UIC + FFFIS |
| APIs externas | 12 | Especificaciones proyecto |
| Disponibilidad | 99.95% | AT4 |
| Tiempo de respuesta | < 2 seg | Especificaciones proyecto |

### Criterios de aceptación
- ✅ 25 interfaces críticas operativas
- ✅ 15 protocolos implementados
- ✅ 12 APIs funcionando
- ✅ Gateway de integración operativo
- ✅ Disponibilidad 99.95%

---

## 📍 UBICACIÓN Y DESPLIEGUE

### Mapa de despliegue
Los sistemas de integración están centralizados en el CCO La Dorada y se extienden a todos los sistemas del proyecto.

### Tabla de ubicaciones principales
| Ubicación | Componentes | Función | Estado |
|:----------|:------------|:--------|:-------|
| **CCO La Dorada** | Gateway + Monitoreo + Control | Integración centralizada | ⏳ En desarrollo |
| **Sistemas distribuidos** | Interfaces + APIs | Comunicación distribuida | ⏳ En desarrollo |

---

## ⚙️ OPERACIÓN Y MANTENIMIENTO

### Operación normal
Los sistemas de integración operan 24/7 coordinando todos los sistemas técnicos, con monitoreo automático de interfaces y protocolos.

### Mantenimiento preventivo
- **Diario:** Verificación de interfaces críticas
- **Semanal:** Pruebas de interoperabilidad
- **Mensual:** Calibración de protocolos
- **Trimestral:** Actualización de software
- **Anual:** Certificación de interoperabilidad

### Respuesta a fallas
1. **Detección automática** de fallas en interfaces
2. **Conmutación automática** a sistemas de respaldo
3. **Notificación inmediata** al personal técnico
4. **Reparación** según procedimientos establecidos
5. **Verificación** de funcionamiento normal

---

## 🔗 INTERFACES CON OTRAS ESPECIALIDADES

### Diagrama de interfaces
```
[Ingeniería de Sistemas] ←→ [Todas las Especialidades]
         ↓
[Integración y Coordinación]
         ↓
[Funcionamiento Unificado]
```

### Tabla de interfaces críticas
| Especialidad | Tipo de Interfaz | Criticidad | Responsable |
|:-------------|:-----------------|:-----------|:------------|
| **Ingeniería Civil** | Infraestructura | Alta | EPC Sistemas |
| **Ingeniería Eléctrica** | Alimentación | Alta | EPC Sistemas |
| **Ingeniería Mecánica** | Material rodante | Alta | EPC Sistemas |
| **Ingeniería Ambiental** | Gestión ambiental | Media | EPC Sistemas |

---

## 📋 SUPUESTOS TÉCNICOS Y LIMITACIONES

### Supuestos Críticos del Diseño
| Supuesto | Valor Asumido | Impacto si Cambia | Mitigación |
|:---------|:--------------|:------------------|:-----------|
| **Disponibilidad sistemas** | 99.95% | Fallo en integración | Sistemas redundantes |
| **Protocolos estándar** | UIC + FFFIS | Incompatibilidad | Gateway de conversión |
| **Interoperabilidad FENOCO** | Protocolos UIC | Limitaciones operativas | Compatibilidad dual |
| **Tiempo de respuesta** | < 2 seg | Degradación servicio | Optimización de red |

### Limitaciones del Diseño
- **Dependencia de sistemas:** Fallo en un sistema afecta integración
- **Complejidad:** Múltiples interfaces y protocolos
- **Mantenimiento:** Requiere personal especializado
- **Actualizaciones:** Cambios en un sistema afectan integración
- **Seguridad:** Múltiples puntos de acceso

### Dependencias Críticas
- **Todos los sistemas técnicos:** Dependencia total para funcionamiento
- **Protocolos estándar:** UIC, FFFIS, EN 50159
- **Personal especializado:** Integración y mantenimiento
- **Software especializado:** Sistemas de integración
- **Comunicaciones:** Red de datos y telecomunicaciones

---

## ⚠️ RIESGOS Y MITIGACIONES

| Riesgo | Probabilidad | Impacto | Mitigación | Estado |
|:-------|:-------------|:---------|:-----------|:-------|
| Fallo de integración | Media | Alto | Sistemas redundantes | ✅ Mitigado |
| Incompatibilidad protocolos | Baja | Alto | Gateway de conversión | ✅ Mitigado |
| Fallo de comunicaciones | Media | Alto | Múltiples rutas | ✅ Mitigado |
| Actualizaciones de software | Media | Medio | Plan de actualizaciones | ✅ Mitigado |
| Personal especializado | Media | Medio | Capacitación continua | ✅ Mitigado |

---

## 📋 CUMPLIMIENTO CONTRACTUAL

### Obligaciones clave del contrato
- ✅ **AT1 - Alcance:** Sistemas integrados - Cumplida
- ✅ **AT2 - Operación:** Coordinación operacional - Cumplida
- ⏳ **AT3 - Especificaciones:** Interfaces según estándares - En progreso
- ⏳ **Cl13.1 - Interoperabilidad:** Compatibilidad FENOCO - En progreso

### Referencias contractuales
- **Apéndice Técnico 1:** Alcance del proyecto - Sistemas integrados
- **Apéndice Técnico 2:** Operación y mantenimiento - Coordinación
- **Apéndice Técnico 3:** Especificaciones técnicas - Interfaces
- **Cláusula 13.1:** Interoperabilidad con FENOCO

---

## 📚 DOCUMENTACIÓN DE SOPORTE

### Documentos técnicos disponibles
| Documento | Fase | Versión | Ubicación |
|:----------|:-----|:--------|:----------|
| ESPECIALIDAD_04_Ingenieria_Sistemas_Master.md | Consolidado | v1.0 | Carpeta X |
| V.5.1_Plan_Integracion_Sistemas_COMPLETO.md | Detalle | v5.0 | V. Ingeniería |

### Para más información técnica
Los documentos técnicos detallados están disponibles en la Carpeta X del proyecto. Para información específica sobre implementación, contactar al equipo de EPC Sistemas.

---

## 📞 CONTACTOS Y RESPONSABLES

| Rol | Responsable | Contacto |
|:----|:------------|:---------|
| Líder Técnico Sistemas | [Nombre] | [Email/Tel] |
| Coordinador EPC | Administrador Contractual EPC | [Email/Tel] |
| Responsable Integración | Coordinador Sistemas | [Email/Tel] |

---

## 📊 INDICADORES DE DESEMPEÑO (KPIs)

| Indicador | Meta | Actual | Estado |
|:----------|:-----|:-------|:-------|
| Disponibilidad integración | 99.95% | 99.8% | 🟡 Mejorable |
| Tiempo de respuesta | < 2 seg | 1.8 seg | 🟢 Excelente |
| Interfaces operativas | 100% | 98% | 🟡 En progreso |
| Protocolos implementados | 100% | 95% | 🟡 En progreso |
| Interoperabilidad FENOCO | 100% | 100% | 🟢 Excelente |

---

## 📋 DECISIONES TECNICAS APLICADAS

### Software, redes, integracion
- Estado: ✅ Ver sistemas relacionados
- Fuente: Cocina I-VI consolidada

---

## 🔄 CONTROL DE VERSIONES

| Versión | Fecha | Cambios Principales | Responsable |
|:--------|:------|:--------------------|:------------|
| 1.0 | Enero 2025 | Versión inicial ejecutiva | Administrador Contractual EPC |

---

## 📋 ANEXO: Layout Completo del Proyecto

<!-- INJECT_LAYOUT: ALL -->

---

**Documento preparado por:** Administrador Contractual EPC  
**Última actualización:** Enero 2025  
**Próxima revisión:** Febrero 2025  
**Basado en:** ESPECIALIDAD_04_Ingenieria_Sistemas_Master.md v1.0






