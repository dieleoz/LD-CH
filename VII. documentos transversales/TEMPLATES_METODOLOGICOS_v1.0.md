# TEMPLATES METODOLÓGICOS - PROYECTOS EPC FERROVIARIOS
## Versión 1.0 - Basados en Proyecto APP La Dorada-Chiriguaná

**Versión:** 1.0  
**Fecha:** Enero 2025  
**Proyecto Base:** APP La Dorada-Chiriguaná  
**Propósito:** Templates validados para replicar metodología en nuevos proyectos

---

## 📋 TEMPLATE T01: FICHA DE SISTEMA

**Archivo:** `METODOLOGIA/Templates/T01_Ficha_Sistema.md`

```markdown
# FICHA DE SISTEMA: [NOMBRE DEL SISTEMA]

**Proyecto:** [NOMBRE_PROYECTO]  
**Fecha:** [DD/MM/AAAA]  
**Responsable:** [NOMBRE]  
**Estado:** [Draft/Review/Approved]

---

## 1. IDENTIFICACIÓN

| Campo | Valor |
|:------|:------|
| **Código WBS** | [ej: 1.1.1] |
| **Nombre completo** | [ej: Control de Tráfico Centralizado] |
| **Sigla** | [ej: CTC] |
| **Categoría** | [Control/Telecomunicaciones/ITS/Civil/etc.] |
| **Prioridad** | [ALTA/MEDIA/BAJA] |
| **Dependencias críticas** | [Lista de sistemas de los que depende] |

---

## 2. REFERENCIAS CONTRACTUALES

| Documento | Capítulo/Cláusula | Página | Contenido |
|:----------|:------------------|:-------|:----------|
| Contrato  | Cap. [X.Y]        | [N]    | [Descripción breve] |
| AT[N]     | Cap. [X.Y]        | [N-N]  | [Descripción breve] |
| [Otro]    | [Referencia]      | [N]    | [Descripción breve] |

---

## 3. REQUISITOS FUNCIONALES

### 3.1 MUST HAVE (Críticos contractuales)
1. **[Requisito funcional 1]**
   - Fuente: [Contrato, Cap X / AT[N], Cap Y]
   - Descripción: [Descripción detallada]
   - Criterio de aceptación: [Cómo se verifica]

2. **[Requisito funcional 2]**
   - Fuente: [Fuente específica]
   - Descripción: [Descripción detallada]
   - Criterio de aceptación: [Cómo se verifica]

### 3.2 SHOULD HAVE (Importantes)
1. **[Requisito funcional 1]**
   - Fuente: [Fuente específica]
   - Descripción: [Descripción detallada]

### 3.3 COULD HAVE (Deseables)
1. **[Requisito funcional 1]**
   - Fuente: [Fuente específica]
   - Descripción: [Descripción detallada]

---

## 4. REQUISITOS TÉCNICOS

| Requisito | Valor Requerido | Fuente | Criticidad | Método de Verificación |
|:----------|:----------------|:-------|:-----------|:----------------------|
| Disponibilidad | [XX.XX]% | [AT[N], Cap Y] | CRÍTICA | Monitoreo 24/7 |
| Latencia | <[X]ms | [Fuente] | ALTA | Pruebas de carga |
| Capacidad | [X] operaciones/seg | [Fuente] | MEDIA | Pruebas de estrés |
| [Otro] | [Valor] | [Fuente] | [Nivel] | [Método] |

---

## 5. REQUISITOS DE INTEGRACIÓN

| Sistema Externo | Tipo Interface | Protocolo | Datos Intercambiados | Criticidad |
|:----------------|:---------------|:----------|:---------------------|:-----------|
| [Sistema 1] | [Ethernet/Serial/etc.] | [Protocolo] | [Descripción datos] | [ALTA/MEDIA/BAJA] |
| [Sistema 2] | [Tipo] | [Protocolo] | [Descripción datos] | [ALTA/MEDIA/BAJA] |
| FENOCO | [Tipo] | UIC-[A/B/C] | [Estados vía/trenes] | CRÍTICA |

---

## 6. NORMATIVAS APLICABLES

| Normativa | Aplicabilidad | Sección Relevante | Cumplimiento Requerido |
|:----------|:--------------|:------------------|:---------------------|
| [EN 50126] | RAMS ferroviario | [Sección específica] | SIL [X] |
| [IEC 62443] | Ciberseguridad OT | [Sección específica] | Nivel [X] |
| [RETIE] | Reglamento eléctrico | [Sección específica] | Obligatorio |
| [Otro] | [Descripción] | [Sección] | [Nivel requerido] |

---

## 7. INDEFINICIONES CRÍTICAS

### 7.1 Indefiniciones Identificadas
1. **[Indefinición 1]**
   - **Descripción:** [Qué no está definido]
   - **Impacto:** [ALTO/MEDIO/BAJO] - [Descripción del impacto]
   - **Sistema afectado:** [Qué partes del sistema se ven afectadas]
   - **Estrategia de avance:** [Cómo se va a resolver o trabajar alrededor]
   - **Responsable de gestión:** [Quién debe resolverla]
   - **Plazo estimado:** [Cuándo se espera resolver]
   - **Alternativas:** [Opciones si no se resuelve]

2. **[Indefinición 2]**
   - [Seguir mismo formato]

### 7.2 Supuestos Iniciales
1. **[Supuesto 1]:** [Descripción del supuesto]
   - **Justificación:** [Por qué se hace este supuesto]
   - **Riesgo si es incorrecto:** [Qué pasa si el supuesto es falso]
   - **Validación:** [Cómo se validará el supuesto]

2. **[Supuesto 2]:** [Descripción]
   - [Seguir mismo formato]

---

## 8. INTERFACES IDENTIFICADAS

### 8.1 Interfaces con Otros Sistemas
- **Con [Sistema X]:** [Descripción de interface, protocolo, datos]
- **Con [Sistema Y]:** [Descripción de interface, protocolo, datos]
- **Con FENOCO:** [Protocolos UIC, coordinación, intercambio de datos]

### 8.2 Interfaces con Sistemas Externos
- **Con [Sistema Externo 1]:** [Descripción, protocolo, responsabilidades]
- **Con [Sistema Externo 2]:** [Descripción, protocolo, responsabilidades]

---

## 9. RIESGOS INICIALES IDENTIFICADOS

| ID | Riesgo | Probabilidad | Impacto | Mitigación Inicial | Responsable |
|:---|:-------|:------------|:--------|:-------------------|:------------|
| R-[SIGLA]-001 | [Descripción riesgo] | [Alta/Media/Baja] | [Alto/Medio/Bajo] | [Estrategia mitigación] | [Rol/Persona] |
| R-[SIGLA]-002 | [Descripción riesgo] | [Alta/Media/Baja] | [Alto/Medio/Bajo] | [Estrategia mitigación] | [Rol/Persona] |

---

## 10. PRÓXIMOS PASOS

### 10.1 Acciones Inmediatas
- [ ] Definir arquitectura conceptual
- [ ] Identificar proveedores potenciales
- [ ] Estimar recursos necesarios
- [ ] Validar interfaces con sistemas dependientes
- [ ] [Otra acción específica]

### 10.2 Dependencias Críticas
1. **[Dependencia 1]:** [Descripción] - Estado: [En desarrollo/Completado/Pendiente]
2. **[Dependencia 2]:** [Descripción] - Estado: [Estado actual]

### 10.3 Plazos Críticos
- **Definición arquitectura:** [Fecha]
- **Selección proveedor:** [Fecha]
- **Validación interfaces:** [Fecha]
- **Ingeniería básica:** [Fecha]

---

## 11. INFORMACIÓN ADICIONAL

### 11.1 Notas Técnicas
[Información adicional relevante que no encaje en secciones anteriores]

### 11.2 Referencias Adicionales
- [Referencia 1]: [Descripción y enlace si aplica]
- [Referencia 2]: [Descripción y enlace si aplica]

### 11.3 Contactos Clave
| Rol | Nombre | Organización | Contacto |
|:----|:-------|:-------------|:---------|
| Líder técnico | [Nombre] | [Organización] | [Email/Tel] |
| Especialista | [Nombre] | [Organización] | [Email/Tel] |

---

**INSTRUCCIONES DE USO:**
1. Completar todas las secciones marcadas con [CORCHETES]
2. Eliminar secciones no aplicables al sistema
3. Agregar secciones adicionales si es necesario
4. Validar referencias contractuales
5. Documentar indefiniciones inmediatamente al detectarlas
6. Actualizar estado del documento según avance

**CONTROL DE VERSIONES:**
| Versión | Fecha | Autor | Descripción |
|:--------|:------|:------|:------------|
| 0.1 | [Fecha] | [Nombre] | Versión inicial |
| 1.0 | [Fecha] | [Nombre] | Versión completada |
```

---

## 📋 TEMPLATE T02: ANÁLISIS DE REQUISITOS

**Archivo:** `METODOLOGIA/Templates/T02_Analisis_Requisitos.md`

```markdown
# ANÁLISIS DE REQUISITOS: [SISTEMA]

**Proyecto:** [NOMBRE_PROYECTO]  
**Sistema:** [NOMBRE_SISTEMA]  
**Fecha:** [DD/MM/AAAA]  
**Responsable:** [NOMBRE]  
**Estado:** [Draft/Review/Approved]

---

## 1. REQUISITOS FUNCIONALES PRIORIZADOS

### 1.1 MUST HAVE (Críticos contractuales)
1. **[Requisito]**
   - **Fuente:** [Contrato, Cap X / AT[N], Cap Y]
   - **Descripción:** [Descripción detallada]
   - **Criterio de aceptación:** [Cómo se verifica]
   - **Prioridad:** CRÍTICA
   - **Comentarios:** [Observaciones adicionales]

2. **[Requisito]**
   - [Seguir mismo formato]

### 1.2 SHOULD HAVE (Importantes)
1. **[Requisito]**
   - **Fuente:** [Fuente específica]
   - **Descripción:** [Descripción detallada]
   - **Criterio de aceptación:** [Cómo se verifica]
   - **Prioridad:** ALTA

### 1.3 COULD HAVE (Deseables)
1. **[Requisito]**
   - **Fuente:** [Fuente específica]
   - **Descripción:** [Descripción detallada]
   - **Prioridad:** MEDIA

---

## 2. REQUISITOS DE DESEMPEÑO

| Métrica | Valor Requerido | Fuente | Criticidad | Método de Medición | Criterio de Aceptación |
|:--------|:----------------|:-------|:-----------|:-------------------|:----------------------|
| Disponibilidad | [XX.XX]% | [AT[N], Cap Y] | CRÍTICA | Monitoreo continuo | ≥[XX.XX]% mensual |
| Latencia | <[X]ms | [Fuente] | ALTA | Pruebas de carga | ≤[X]ms en 95% casos |
| Capacidad | [X] ops/seg | [Fuente] | ALTA | Pruebas de estrés | ≥[X] ops/seg sostenido |
| MTBF | ≥[X] horas | [Fuente] | MEDIA | Registro histórico | ≥[X] horas promedio |
| MTTR | ≤[X] horas | [Fuente] | MEDIA | Registro de fallas | ≤[X] horas promedio |

---

## 3. REQUISITOS DE INTEGRACIÓN

### 3.1 Integración con Sistemas Internos
| Sistema | Tipo Interface | Protocolo | Datos | Criticidad | Responsable |
|:--------|:---------------|:----------|:------|:-----------|:------------|
| [Sistema 1] | [Ethernet/Serial/etc.] | [Protocolo] | [Descripción] | [ALTA/MEDIA/BAJA] | [Rol] |
| [Sistema 2] | [Tipo] | [Protocolo] | [Descripción] | [ALTA/MEDIA/BAJA] | [Rol] |

### 3.2 Integración con FENOCO
| Interface | Protocolo UIC | Datos Intercambiados | Frecuencia | Criticidad |
|:----------|:--------------|:---------------------|:-----------|:-----------|
| CTC | UIC-A | Estados de vía, señales | Tiempo real | CRÍTICA |
| ITCS | UIC-B | Posición trenes, autorizaciones | Tiempo real | CRÍTICA |
| Comunicaciones | UIC-C | Coordinación operativa | Según necesidad | ALTA |

---

## 4. NORMATIVAS Y ESTÁNDARES

### 4.1 Normativas Obligatorias
| Normativa | Sección | Aplicabilidad | Cumplimiento Requerido | Responsable Validación |
|:----------|:--------|:--------------|:----------------------|:----------------------|
| [EN 50126] | RAMS ferroviario | [Sección específica] | SIL [X] | [Rol/Organización] |
| [IEC 62443] | Ciberseguridad OT | [Sección específica] | Nivel [X] | [Rol/Organización] |
| [RETIE] | Reglamento eléctrico | [Sección específica] | Obligatorio | [Rol/Organización] |

### 4.2 Estándares de Referencia
| Estándar | Aplicabilidad | Uso | Observaciones |
|:---------|:--------------|:----|:--------------|
| [IEEE 802.3] | Ethernet | Comunicaciones | Estándar de referencia |
| [IEC 61850] | Sistemas eléctricos | Interoperabilidad | Si aplica al sistema |

---

## 5. RESTRICCIONES IDENTIFICADAS

### 5.1 Restricciones Técnicas
1. **[Restricción técnica]**
   - **Descripción:** [Qué limita]
   - **Impacto:** [Cómo afecta el diseño]
   - **Justificación:** [Por qué existe la restricción]
   - **Mitigación:** [Cómo se maneja]

### 5.2 Restricciones Temporales
1. **[Restricción temporal]**
   - **Descripción:** [Qué limita en tiempo]
   - **Impacto:** [Cómo afecta la programación]
   - **Fecha crítica:** [Cuándo se debe cumplir]

### 5.3 Restricciones Presupuestales
1. **[Restricción presupuestal]**
   - **Descripción:** [Qué limita económicamente]
   - **Impacto:** [Cómo afecta las opciones]
   - **Rango:** [Límites presupuestales]

---

## 6. AMBIGÜEDADES Y CLARIFICACIONES REQUERIDAS

### 6.1 Ambigüedades Identificadas
1. **[Ambigüedad 1]**
   - **Descripción:** [Qué no está claro]
   - **Impacto:** [Cómo afecta el diseño]
   - **Estrategia de avance:** [Cómo se va a proceder]
   - **Responsable de clarificación:** [Quién debe aclarar]
   - **Plazo:** [Cuándo se necesita la clarificación]

### 6.2 Información Faltante
1. **[Información faltante 1]**
   - **Descripción:** [Qué información falta]
   - **Por qué es necesaria:** [Para qué se necesita]
   - **Fuente propuesta:** [Dónde obtenerla]
   - **Alternativa:** [Qué hacer si no se obtiene]

---

## 7. CONFLICTOS IDENTIFICADOS

### 7.1 Conflictos entre Requisitos
| Requisito 1 | Requisito 2 | Conflicto | Resolución Propuesta | Responsable |
|:------------|:------------|:----------|:---------------------|:------------|
| [Descripción] | [Descripción] | [Naturaleza conflicto] | [Cómo resolver] | [Rol] |

### 7.2 Conflictos con Otros Sistemas
| Sistema | Conflicto | Impacto | Resolución Propuesta | Responsable |
|:--------|:----------|:--------|:---------------------|:------------|
| [Sistema] | [Descripción conflicto] | [Cómo afecta] | [Cómo resolver] | [Rol] |

---

## 8. SUPUESTOS Y DEPENDENCIAS

### 8.1 Supuestos Críticos
1. **[Supuesto 1]**
   - **Descripción:** [Qué se asume]
   - **Justificación:** [Por qué se hace el supuesto]
   - **Riesgo si es incorrecto:** [Qué pasa si es falso]
   - **Validación:** [Cómo se validará]
   - **Fecha validación:** [Cuándo se validará]

### 8.2 Dependencias Críticas
1. **[Dependencia 1]**
   - **Sistema/Componente:** [Qué se necesita]
   - **Estado actual:** [En desarrollo/Completado/Pendiente]
   - **Fecha requerida:** [Cuándo se necesita]
   - **Impacto si se retrasa:** [Cómo afecta al proyecto]
   - **Responsable:** [Quién gestiona la dependencia]

---

## 9. ANÁLISIS DE RIESGOS INICIAL

### 9.1 Riesgos Técnicos
| ID | Riesgo | Probabilidad | Impacto | Mitigación Inicial | Responsable |
|:---|:-------|:------------|:--------|:-------------------|:------------|
| R-[SIGLA]-001 | [Descripción] | [Alta/Media/Baja] | [Alto/Medio/Bajo] | [Estrategia] | [Rol] |

### 9.2 Riesgos de Integración
| ID | Riesgo | Probabilidad | Impacto | Mitigación Inicial | Responsable |
|:---|:-------|:------------|:--------|:-------------------|:------------|
| R-[SIGLA]-002 | [Descripción] | [Alta/Media/Baja] | [Alto/Medio/Bajo] | [Estrategia] | [Rol] |

---

## 10. PRÓXIMOS PASOS

### 10.1 Acciones Inmediatas
- [ ] [Acción 1]: [Descripción] - Responsable: [Rol] - Plazo: [Fecha]
- [ ] [Acción 2]: [Descripción] - Responsable: [Rol] - Plazo: [Fecha]

### 10.2 Validaciones Requeridas
- [ ] Validar requisitos con [Stakeholder 1] - Plazo: [Fecha]
- [ ] Validar interfaces con [Sistema 1] - Plazo: [Fecha]

### 10.3 Entregables Siguientes
- [ ] Arquitectura conceptual del sistema
- [ ] Especificaciones técnicas preliminares
- [ ] Plan de pruebas de requisitos

---

**INSTRUCCIONES DE USO:**
1. Completar todas las secciones marcadas con [CORCHETES]
2. Priorizar requisitos usando MoSCoW (Must/Should/Could/Won't)
3. Documentar conflictos y ambigüedades inmediatamente
4. Validar requisitos con stakeholders relevantes
5. Mantener trazabilidad con fuentes contractuales

**CONTROL DE VERSIONES:**
| Versión | Fecha | Autor | Descripción |
|:--------|:------|:------|:------------|
| 0.1 | [Fecha] | [Nombre] | Versión inicial |
| 1.0 | [Fecha] | [Nombre] | Versión completada |
```
