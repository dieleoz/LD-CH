# DECISIÓN TÉCNICA - DT-[SISTEMA]-[NNN]

**Proyecto:** APP La Dorada-Chiriguaná  
**Sistema:** [Nombre del sistema]  
**Fecha:** [DD/MM/AAAA]  
**Responsable:** [Nombre del ingeniero/especialista]  
**Estado:** [🟡 En análisis | 🟢 Aprobada | 🔴 Rechazada]  
**Versión:** v1.0  

---

## 1. CONTEXTO Y ANTECEDENTES

### 1.1 Situación Actual
[Describe el estado actual del sistema/componente antes de la decisión]

### 1.2 Necesidad del Cambio
[Por qué surge la necesidad de tomar esta decisión]

### 1.3 Origen de la Observación
- **Fuente:** [Correo/Reunión/Validación/Construcción]
- **Responsable origen:** [Nombre]
- **Fecha observación:** [DD/MM/AAAA]
- **Referencia:** [ID de correo/minuta/documento]

---

## 2. DECISIÓN TÉCNICA PROPUESTA

### 2.1 Descripción del Cambio
**Valor Anterior:**
- [Especificación/valor actual]

**Valor Propuesto:**
- [Especificación/valor nuevo]

### 2.2 Justificación Técnica
[Argumentos técnicos que soportan la decisión]

### 2.3 Cumplimiento Contractual
- **Apéndices Técnicos aplicables:** [AT1, AT2, etc.]
- **Criterios contractuales:** [Referencias específicas]
- **Normativa aplicable:** [Normas técnicas]

---

## 3. ALTERNATIVAS EVALUADAS

| Alternativa | Descripción | Ventajas | Desventajas | Costo Estimado | Decisión |
|:------------|:------------|:---------|:------------|:---------------|:---------|
| **ALT-1** | [Desc] | [Pros] | [Cons] | $[X] | ❌ Rechazada |
| **ALT-2** | [Desc] | [Pros] | [Cons] | $[X] | ✅ **Seleccionada** |
| **ALT-3** | [Desc] | [Pros] | [Cons] | $[X] | ❌ Rechazada |

### 3.1 Matriz de Decisión
| Criterio | Peso | ALT-1 | ALT-2 | ALT-3 |
|:---------|:----:|:-----:|:-----:|:-----:|
| Costo CAPEX | 30% | 7 | 9 | 5 |
| Costo OPEX | 20% | 8 | 9 | 6 |
| Cumplimiento técnico | 25% | 9 | 9 | 7 |
| Facilidad construcción | 15% | 6 | 9 | 8 |
| Riesgo técnico | 10% | 7 | 8 | 5 |
| **TOTAL** | **100%** | **7.4** | **8.9** | **6.2** |

**Alternativa seleccionada:** ALT-2 (mayor puntaje)

---

## 4. IMPACTO DEL CAMBIO

### 4.1 Impacto en Cantidades
| Componente | Cantidad Anterior | Cantidad Nueva | Diferencia | % Cambio |
|:-----------|:-----------------|:---------------|:-----------|:---------|
| [Item 1] | [Cant] | [Cant] | +/- [Δ] | +/- [%] |
| [Item 2] | [Cant] | [Cant] | +/- [Δ] | +/- [%] |

### 4.2 Impacto Económico
| Concepto | CAPEX | OPEX (10 años) | Total |
|:---------|:------|:---------------|:------|
| **Costo Anterior** | $[X] | $[Y] | $[Z] |
| **Costo Nuevo** | $[X] | $[Y] | $[Z] |
| **Ahorro/(Sobrecosto)** | $[Δ] | $[Δ] | $[Δ] |

**Impacto neto:** [Positivo/Negativo] de $[X] COP

### 4.3 Impacto en Cronograma
| Actividad | Duración Anterior | Duración Nueva | Diferencia |
|:----------|:-----------------|:---------------|:-----------|
| [Act 1] | [X] días | [Y] días | +/- [Δ] días |

### 4.4 Archivos Afectados
**🔗 Usar MATRIZ_DEPENDENCIAS_DOCUMENTALES para identificar todos los archivos:**

| Archivo | Ubicación | Sección Afectada | Tipo de Cambio |
|:--------|:----------|:-----------------|:---------------|
| [Doc 1] | [Carpeta/archivo] | [Sección X.X] | Cantidades |
| [Doc 2] | [Carpeta/archivo] | [Tabla X] | Costos |
| [Doc 3] | [Carpeta/archivo] | [Sección Y.Y] | Especificaciones |

---

## 5. RIESGOS IDENTIFICADOS

### 5.1 Riesgos Nuevos Generados por esta Decisión
| ID | Descripción | Probabilidad | Impacto | Estrategia | Responsable |
|:---|:------------|:-------------|:--------|:-----------|:------------|
| R-[SIS]-[N] | [Desc] | Alta/Media/Baja | Alto/Medio/Bajo | Mitigar/Aceptar/Transferir | [Nombre] |

**⚠️ Registrar en:** `00. Gobernanza PMO/Matriz_Riesgos_PMO_Consolidada_v1.0.md` con campo `Origen_Decisión: DT-[SISTEMA]-[NNN]`

### 5.2 Riesgos Eliminados/Mitigados
[Lista de riesgos que esta decisión elimina o reduce]

---

## 6. VALIDACIÓN Y APROBACIÓN

### 6.1 Revisores Requeridos
- [ ] **Especialista técnico:** [Nombre]
- [ ] **Coordinador EPC:** [Nombre]
- [ ] **PMO:** [Nombre]
- [ ] **Construcción (si aplica):** [Nombre]

### 6.2 Criterios de Aprobación
- [ ] Cumple criterios contractuales (AT)
- [ ] Impacto económico aceptable
- [ ] Riesgos identificados y mitigados
- [ ] Cronograma no afectado negativamente
- [ ] Archivos afectados identificados

### 6.3 Registro de Aprobación
- **Fecha aprobación:** [DD/MM/AAAA]
- **Aprobado por:** [Nombre y cargo]
- **Observaciones:** [Comentarios del aprobador]

---

## 7. IMPLEMENTACIÓN

### 7.1 Plan de Actualización de Documentos
| # | Archivo a Actualizar | Cambio Específico | Responsable | Estado |
|:-:|:---------------------|:------------------|:------------|:-------|
| 1 | [Doc 1] | [Cambio] | [Nombre] | ⏳ Pendiente |
| 2 | [Doc 2] | [Cambio] | [Nombre] | ⏳ Pendiente |

### 7.2 Verificación Post-Implementación
- [ ] Todos los archivos listados actualizados
- [ ] Control de versiones actualizado en cada archivo
- [ ] Riesgos agregados a Matriz PMO
- [ ] WBS recalculada (si aplica)
- [ ] Carpeta X actualizada (si es entrega formal)

---

## 8. REFERENCIAS Y DOCUMENTOS RELACIONADOS

### 8.1 Documentos Contractuales
- [AT1, AT2, etc. - especificar secciones relevantes]

### 8.2 Documentos Técnicos
- [Lista de documentos de referencia]

### 8.3 Decisiones Relacionadas
- [Otras DT relacionadas]

---

## 9. CONTROL DE VERSIONES

| Versión | Fecha | Cambios | Responsable | Estado |
|:-------:|:------|:--------|:------------|:-------|
| v1.0 | [Fecha] | Versión inicial | [Nombre] | 🟡 En análisis |
| v1.1 | [Fecha] | [Ajustes menores] | [Nombre] | 🟡 En análisis |
| v2.0 | [Fecha] | **Versión aprobada** | [Nombre] | 🟢 **Aprobada** |

---

## ⚠️ ADVERTENCIA

Esta decisión técnica debe ser validada y aprobada antes de implementarse. La implementación sin aprobación puede generar desviaciones contractuales o sobrecostos no autorizados.

---

**Elaborado por:** [Nombre del especialista]  
**Fecha elaboración:** [DD/MM/AAAA]  
**Próxima revisión:** [Fecha + 30 días o según necesidad]  
**Estado actual:** [En análisis/Aprobada/Rechazada]  

