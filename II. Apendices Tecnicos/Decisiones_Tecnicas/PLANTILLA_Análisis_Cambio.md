# ANÁLISIS DE CAMBIO - AC-[SISTEMA]-[NNN]

**Proyecto:** APP La Dorada-Chiriguaná  
**Decisión Origen:** DT-[SISTEMA]-[NNN]  
**Fecha:** [DD/MM/AAAA]  
**Responsable:** [Nombre del especialista]  
**Tipo:** [Análisis previo a aprobación]  
**Versión:** v1.0  

---

## 1. CAMBIO PROPUESTO

### 1.1 Identificación
- **ID Decisión Técnica:** DT-[SISTEMA]-[NNN]
- **Sistema afectado:** [Nombre del sistema]
- **Componente específico:** [Componente/subsistema]

### 1.2 Descripción del Cambio
**Estado Actual:**
- [Especificación/valor/criterio actual]

**Estado Propuesto:**
- [Especificación/valor/criterio nuevo]

**Razón del cambio:**
- [Breve explicación de por qué se propone el cambio]

---

## 2. IMPACTO TÉCNICO

### 2.1 Archivos Afectados
**🔗 Consultar:** `VIII. Documentos Maestros y Metodologia/Matrices_Dependencias/MATRIZ_DEPENDENCIAS_DOCUMENTALES_v1.0.md`

| Archivo | Ubicación | Sección Afectada | Tipo de Cambio | Prioridad |
|:--------|:----------|:-----------------|:---------------|:----------|
| [Doc 1] | [Carpeta/archivo.md] | [Sección X.X, Línea Y] | Cantidades | 🔴 Alta |
| [Doc 2] | [Carpeta/archivo.md] | [Tabla Z] | Costos | 🔴 Alta |
| [Doc 3] | [Carpeta/archivo.md] | [Sección A.A] | Especificaciones | 🟡 Media |

### 2.2 Impacto en Cantidades
| Componente | Valor Actual | Valor Nuevo | Diferencia | % Cambio | Impacto |
|:-----------|:-------------|:------------|:-----------|:---------|:--------|
| [Item 1] | [Cant] | [Cant] | +/- [Δ] | +/- [%] | Positivo/Negativo |
| [Item 2] | [Cant] | [Cant] | +/- [Δ] | +/- [%] | Positivo/Negativo |
| **TOTAL** | **[Sum]** | **[Sum]** | **[Δ]** | **[%]** | **[Impacto]** |

### 2.3 Impacto en Especificaciones Técnicas
| Especificación | Valor Actual | Valor Nuevo | Cumplimiento Normativo |
|:---------------|:-------------|:------------|:-----------------------|
| [Spec 1] | [Val] | [Val] | ✅ / ⚠️ / ❌ |
| [Spec 2] | [Val] | [Val] | ✅ / ⚠️ / ❌ |

### 2.4 Impacto en Interfaces con Otros Sistemas
| Sistema Relacionado | Interfaz | Impacto | Acción Requerida |
|:-------------------|:---------|:--------|:-----------------|
| [Sistema A] | [Tipo interfaz] | Alto/Medio/Bajo | [Qué hacer] |

---

## 3. IMPACTO ECONÓMICO

### 3.1 Análisis de Costos
| Concepto | CAPEX Actual | CAPEX Nuevo | Δ CAPEX | OPEX Actual (10 años) | OPEX Nuevo (10 años) | Δ OPEX |
|:---------|:-------------|:------------|:--------|:---------------------|:---------------------|:-------|
| [Concepto 1] | $[X] | $[Y] | $[Δ] | $[A] | $[B] | $[Δ] |
| [Concepto 2] | $[X] | $[Y] | $[Δ] | $[A] | $[B] | $[Δ] |
| **TOTAL** | **$[X]** | **$[Y]** | **$[Δ]** | **$[A]** | **$[B]** | **$[Δ]** |

### 3.2 Resumen Económico
- **Ahorro/(Sobrecosto) CAPEX:** $[X] COP
- **Ahorro/(Sobrecosto) OPEX:** $[Y] COP
- **Impacto Total (VPN):** $[Z] COP
- **ROI:** [%] [Periodo de retorno]

### 3.3 Impacto en WBS Presupuestal
| Item WBS | Código | Costo Anterior | Costo Nuevo | Diferencia |
|:---------|:-------|:---------------|:------------|:-----------|
| [Item 1] | [3.1.5] | $[X] | $[Y] | $[Δ] |

**📊 Actualizar:** `IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md` (Items específicos listados)

---

## 4. IMPACTO EN CRONOGRAMA

### 4.1 Actividades Afectadas
| Actividad | Duración Actual | Duración Nueva | Diferencia | Ruta Crítica |
|:----------|:---------------|:---------------|:-----------|:-------------|
| [Act 1] | [X] días | [Y] días | +/- [Δ] días | Sí/No |
| [Act 2] | [X] días | [Y] días | +/- [Δ] | Sí/No |

### 4.2 Impacto en Hitos
| Hito | Fecha Actual | Fecha Nueva | Impacto |
|:-----|:------------|:------------|:--------|
| [H-1] | [Fecha] | [Fecha] | Adelanto/Retraso/Sin cambio |

**⚠️ Impacto en ruta crítica:** [Sí/No - explicar]

---

## 5. RIESGOS Y MITIGACIONES

### 5.1 Riesgos Nuevos Generados
| ID | Descripción | Probabilidad | Impacto | Estrategia | Responsable | Hito Verificación |
|:---|:------------|:-------------|:--------|:-----------|:------------|:------------------|
| R-[SIS]-[N] | [Desc] | Alta/Media/Baja | Alto/Medio/Bajo | Mitigar/Aceptar | [Nombre] | H-[SIS]-[X] |

**⚠️ Registrar en:** `00. Gobernanza PMO/Matriz_Riesgos_PMO_Consolidada_v1.0.md`  
**Campo Origen_Decisión:** DT-[SISTEMA]-[NNN]

### 5.2 Riesgos Eliminados/Mitigados
| ID Riesgo Anterior | Cómo esta decisión lo mitiga | Nuevo Estado |
|:-------------------|:----------------------------|:-------------|
| R-[X] | [Explicación] | Cerrado/Mitigado |

### 5.3 Supuestos Críticos
**🔗 Registrar en:** `VIII. Documentos Maestros y Metodologia/36.2_Metodologia_Gestion_Supuestos.md`

| ID | Supuesto | Probabilidad de cumplirse | Impacto si no se cumple |
|:---|:---------|:-------------------------|:------------------------|
| SUP-[N] | [Desc] | Alta/Media/Baja | Alto/Medio/Bajo |

---

## 6. ANÁLISIS DE DEPENDENCIAS

### 6.1 Dependencias con Otros Sistemas
| Sistema | Tipo Dependencia | Acción Requerida |
|:--------|:----------------|:-----------------|
| [Sistema A] | Técnica/Operacional | [Qué coordinación se necesita] |

### 6.2 Dependencias con Proveedores
| Proveedor/Contratista | Aspecto | Impacto |
|:---------------------|:--------|:--------|
| [Proveedor A] | [Qué afecta] | [Impacto] |

---

## 7. RECOMENDACIÓN TÉCNICA

### 7.1 Decisión Recomendada
- [ ] ✅ **APROBAR** - Cambio es beneficioso y viable
- [ ] ⚠️ **APROBAR CON CONDICIONES** - Requiere mitigaciones adicionales
- [ ] ❌ **RECHAZAR** - Riesgos superan beneficios

### 7.2 Justificación de la Recomendación
[2-3 párrafos explicando la recomendación basada en análisis anterior]

### 7.3 Condiciones para Aprobación (si aplica)
1. [Condición 1]
2. [Condición 2]
3. [Condición 3]

### 7.4 Plan de Mitigación de Riesgos
| Riesgo ID | Acción de Mitigación | Responsable | Plazo |
|:----------|:--------------------|:------------|:------|
| R-[X] | [Acción] | [Nombre] | [Fecha] |

---

## 8. PLAN DE IMPLEMENTACIÓN (Si se aprueba)

### 8.1 Secuencia de Actualización de Documentos
| Orden | Archivo | Cambio | Responsable | Estimado |
|:-----:|:--------|:-------|:------------|:---------|
| 1 | [Doc crítico 1] | [Cambio] | [Nombre] | [Horas] |
| 2 | [Doc crítico 2] | [Cambio] | [Nombre] | [Horas] |
| 3 | [WBS Presupuestal] | [Recalcular] | [Nombre] | [Horas] |

### 8.2 Checklist de Implementación
- [ ] Actualizar archivos en carpetas I-VI
- [ ] Actualizar control de versiones en cada archivo
- [ ] Agregar riesgos a Matriz PMO
- [ ] Recalcular WBS (si aplica)
- [ ] Actualizar cronograma (si aplica)
- [ ] Validar coherencia cruzada
- [ ] Consolidar en Carpeta X (SOLO si es entrega formal)

### 8.3 Tiempo Estimado Total
- **Actualización documentos:** [X] horas
- **Validación cruzada:** [Y] horas
- **Consolidación (si aplica):** [Z] horas
- **TOTAL:** [X+Y+Z] horas

---

## 9. LECCIONES APRENDIDAS Y MEJORA CONTINUA

### 9.1 Lecciones de este Análisis
[¿Qué aprendiste durante este análisis?]

### 9.2 Mejoras a la Metodología
[¿Qué se puede mejorar en el proceso?]

---

## 10. CONTROL DE CAMBIOS DE ESTE DOCUMENTO

| Versión | Fecha | Cambios | Responsable |
|:-------:|:------|:--------|:------------|
| v1.0 | [Fecha] | Análisis inicial | [Nombre] |
| v1.1 | [Fecha] | [Ajustes tras feedback] | [Nombre] |

---

**Elaborado por:** [Nombre del especialista]  
**Fecha elaboración:** [DD/MM/AAAA]  
**Estado:** [En análisis/Aprobado/Rechazado]  
**Para aprobación de:** [Cargo/Nombre]  

---

## 📋 ANEXOS

### Anexo A: Cálculos Detallados
[Incluir cálculos técnicos de soporte]

### Anexo B: Cotizaciones/Referencias
[Incluir cotizaciones u otra evidencia de costos]

### Anexo C: Correspondencia Relacionada
[Referencias a correos, minutas, documentos origen]

