# PROMPT PARA TRANSFORMACIÓN DE DOCUMENTOS TÉCNICOS A FORMATO EJECUTIVO/USUARIO FINAL

## 📋 CONTEXTO Y OBJETIVO

**Propósito:** Crear documentos ejecutivos basados en documentos técnicos consolidados de la Carpeta X para usuarios finales no técnicos (directivos, stakeholders, personal no ingeniero).

**Metodología:** "SERVIR Y ADORNAR" - Transformar documentos técnicos complejos en formatos accesibles y profesionales.

**Problema actual:** Los documentos técnicos consolidados están estructurados para ingenieros EPC y contienen:
- Demasiadas referencias cruzadas técnicas
- Estructura orientada a metodología interna (Punto 42)
- Exceso de detalle operacional
- Formato poco amigable para lectura ejecutiva

**Objetivo:** Crear versiones "ejecutivas" que mantengan la trazabilidad técnica pero presenten la información de forma clara, visual y práctica.

---

## 🎯 INSTRUCCIONES PARA LA TRANSFORMACIÓN

### **1. ESTRUCTURA PROPUESTA (REEMPLAZO COMPLETO)**

Transforma el documento técnico en esta nueva estructura:

```markdown
# SISTEMA [XX]: [NOMBRE DEL SISTEMA]
## Documento Ejecutivo de Ingeniería

---

## 📊 RESUMEN EJECUTIVO (NUEVA SECCIÓN - CRÍTICA)
### Qué es este sistema y por qué importa
[Descripción en lenguaje claro de qué hace el sistema]

### Alcance en números
- **Inversión estimada:** [Si está disponible]
- **Componentes principales:** [Lista consolidada]
- **Cobertura:** [Porcentaje del corredor]
- **Disponibilidad requerida:** [Porcentaje]

### Hitos críticos
| Fase | Fecha | Estado |
|:-----|:------|:-------|
| Diseño | [Fecha] | ✅/⏳/❌ |
| Instalación | [Fecha] | ✅/⏳/❌ |
| Comisionamiento | [Fecha] | ✅/⏳/❌ |

---

## 🎯 FUNCIÓN Y PROPÓSITO DEL SISTEMA

### ¿Qué hace este sistema?
[Descripción funcional en lenguaje natural]

### ¿Por qué lo necesitamos?
[Beneficios operacionales y de seguridad]

### ¿Cómo se integra con otros sistemas?
[Descripción visual de integraciones principales]

---

## 🏗️ COMPONENTES PRINCIPALES

### 1. [Componente 1]
**Propósito:** [Descripción clara]
**Componentes:**
- [Listar componentes con descripciones simples]
**Estado actual:** [Estado]

### 2. [Componente 2]
**Propósito:** [Descripción clara]
**Componentes:**
- [Listar componentes con descripciones simples]
**Estado actual:** [Estado]

---

## 📐 ESPECIFICACIONES TÉCNICAS CLAVE

### Tabla consolidada de especificaciones
| Parámetro | Valor | Estándar Aplicable |
|:----------|:------|:-------------------|
| [Spec 1] | [Valor] | [Norma] |
| [Spec 2] | [Valor] | [Norma] |

### Criterios de aceptación
- ✅ [Criterio 1]
- ✅ [Criterio 2]

---

## 📍 UBICACIÓN Y DESPLIEGUE

### Mapa de despliegue
[Descripción de ubicaciones principales]

### Tabla de sitios
| Sitio | Componentes | Coordenadas | Estado |
|:------|:------------|:------------|:-------|
| [Sitio 1] | [Comp] | [GPS] | ✅/⏳ |

---

## ⚙️ OPERACIÓN Y MANTENIMIENTO

### Operación normal
[Descripción simple del día a día]

### Mantenimiento preventivo
- **Diario:** [Actividades]
- **Semanal:** [Actividades]
- **Mensual:** [Actividades]

### Respuesta a fallas
[Procedimiento simplificado]

---

## 🔗 INTERFACES CON OTROS SISTEMAS

### Diagrama de interfaces
[Sistema A] ←→ [Sistema Actual] ←→ [Sistema B]

### Tabla de interfaces críticas
| Sistema | Tipo de Interfaz | Criticidad | Responsable |
|:--------|:-----------------|:-----------|:------------|
| [Sist 1] | [Tipo] | Alta/Media/Baja | [Resp] |

---

## ⚠️ RIESGOS Y MITIGACIONES

| Riesgo | Probabilidad | Impacto | Mitigación | Estado |
|:-------|:-------------|:---------|:-----------|:-------|
| [Riesgo 1] | Alta/Media/Baja | Alto/Medio/Bajo | [Estrategia] | ✅/⏳ |

---

## 📋 CUMPLIMIENTO CONTRACTUAL

### Obligaciones clave del contrato
- ✅ [Obligación 1] - Cumplida
- ⏳ [Obligación 2] - En progreso
- ❌ [Obligación 3] - Pendiente

### Referencias contractuales
- **Apéndice Técnico X:** [Breve descripción]
- **Cláusula X.X:** [Breve descripción]

---

## 📚 DOCUMENTACIÓN DE SOPORTE

### Documentos técnicos disponibles
| Documento | Fase | Versión | Ubicación |
|:----------|:-----|:--------|:----------|
| [Doc 1] | [Fase] | [Ver] | [Ruta] |

### Para más información técnica
[Indicar dónde encontrar documentos técnicos detallados]

---

## 📞 CONTACTOS Y RESPONSABLES

| Rol | Responsable | Contacto |
|:----|:------------|:---------|
| Líder Técnico | [Nombre] | [Email/Tel] |
| Coordinador EPC | [Nombre] | [Email/Tel] |

---

## 📊 INDICADORES DE DESEMPEÑO (KPIs)

| Indicador | Meta | Actual | Estado |
|:----------|:-----|:-------|:-------|
| Disponibilidad | 99.5% | [Actual] | 🟢/🟡/🔴 |
| Cobertura | 100% | [Actual] | 🟢/🟡/🔴 |

---

## 🔄 CONTROL DE VERSIONES

| Versión | Fecha | Cambios Principales | Responsable |
|:--------|:------|:--------------------|:------------|
| 1.0 | [Fecha] | Versión inicial ejecutiva | [Nombre] |

---

**Documento preparado por:** [Nombre]  
**Última actualización:** [Fecha]  
**Próxima revisión:** [Fecha]
```

---

## 🎨 DIRECTRICES DE ESTILO Y FORMATO

### **1. Lenguaje**
- ❌ **Evitar:** Jerga técnica excesiva, referencias internas complejas
- ✅ **Usar:** Lenguaje claro, explicaciones funcionales, analogías cuando sea útil

### **2. Visualización**
- **Priorizar:** Tablas consolidadas, diagramas simples, estado visual (✅⏳❌)
- **Minimizar:** Texto denso, listas excesivas, referencias cruzadas complejas

### **3. Navegación**
- Cada sección debe ser autocontenida
- Máximo 2 niveles de profundidad en encabezados
- Usar negritas para destacar conceptos clave, no para decoración

### **4. Información técnica**
- Consolidar especificaciones en tablas
- Referenciar documentos técnicos detallados sin reproducir su contenido
- Explicar el "qué" y el "por qué" antes del "cómo"

---

## 🔍 CRITERIOS DE CALIDAD PARA LA TRANSFORMACIÓN

Un documento ejecutivo exitoso debe cumplir:

✅ **Comprensible en 10 minutos:** Un directivo puede entender el sistema completo  
✅ **Accionable:** Identificar rápidamente hitos, riesgos y responsables  
✅ **Trazable:** Mantener referencias a documentación técnica detallada  
✅ **Visual:** Priorizar tablas y diagramas sobre texto  
✅ **Actualizable:** Estructura que facilite actualizaciones futuras  

---

## 📝 EJEMPLO DE TRANSFORMACIÓN

### ❌ ANTES (Estilo actual - técnico):
```
### 3.1 Diseño Básico
**Consolidado de documentos IV/**

**Sistema TETRA:**
- **37 Estaciones Base:** Ubicadas estratégicamente en el corredor
- **Altura Torres:** 40m estándar para cobertura óptima
- **Radios Embarcados:** 30 unidades en locomotoras
- **Radios Portátiles:** 80 unidades para personal
- **Consolas Despacho:** 3 unidades en CCO
```

### ✅ DESPUÉS (Estilo ejecutivo):
```
## 🏗️ COMPONENTES PRINCIPALES

### Sistema TETRA - Radio Digital para Operaciones
**¿Qué hace?** Sistema de comunicación de voz y datos en tiempo real para operación segura del ferrocarril.

**Componentes instalados:**
| Componente | Cantidad | Ubicación | Estado |
|:-----------|:---------|:----------|:-------|
| Torres de comunicación | 37 unidades | A lo largo del corredor | ✅ Instaladas |
| Radios en locomotoras | 30 unidades | Material rodante | ⏳ En instalación |
| Radios portátiles | 80 unidades | Personal operativo | ✅ Entregados |
| Consolas de control | 3 unidades | Centro de Control | ✅ Operativas |

**Estado general:** 🟢 En cronograma
```

---

## 🚀 PRÓXIMOS PASOS

Una vez creado el documento ejecutivo:

1. **Validación:** Revisar con un no-ingeniero para confirmar claridad
2. **Complementos visuales:** Añadir diagramas si es necesario
3. **Actualización:** Establecer proceso de actualización periódica
4. **Replicación:** Aplicar esta estructura a otros sistemas (01, 03, 04, etc.)

---

## 📋 CHECKLIST DE APLICACIÓN

- [ ] Leer el documento técnico original completo
- [ ] Extraer información clave sin perder precisión técnica
- [ ] Aplicar estructura ejecutiva propuesta
- [ ] Consolidar especificaciones en tablas
- [ ] Simplificar lenguaje sin perder contenido
- [ ] Añadir estados visuales (✅⏳❌)
- [ ] Referenciar documento técnico original
- [ ] Validar con usuario no técnico
- [ ] Guardar como documento independiente

---

**Metodología:** "SERVIR Y ADORNAR" - Transformación de documentos técnicos a formato ejecutivo  
**Versión:** v1.0  
**Fecha:** Enero 2025  
**Aplicable a:** Todos los documentos de la Carpeta X
