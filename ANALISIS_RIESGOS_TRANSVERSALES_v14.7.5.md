# ANÁLISIS: RIESGOS TRANSVERSALES → ITEMS WBS ESPECÍFICOS
## Sistema WBS Interactivo v14.7.5
## Fecha: 12 de Octubre 2025

---

## 📋 OBJETIVO

Asignar **items WBS específicos** a los 5 riesgos actualmente marcados como "Transversal" para mejorar trazabilidad y análisis.

**Beneficio:** Permitir calcular exposición económica real por ítem WBS y filtrar riesgos por sistema.

---

## 🔍 RIESGOS TRANSVERSALES IDENTIFICADOS

### 1️⃣ R-AT4-01: Cumplimiento Disponibilidad AT4

**Descripción:** Cumplimiento disponibilidad AT4  
**Categoría:** Contractual  
**Prob × Impacto:** Media × Alto  
**Estrategia:** Mitigar: N+1, monitoreo

**Análisis:**
- Afecta todos los sistemas críticos que requieren redundancia N+1
- AT4 establece KPI de disponibilidad 99.95%
- Implica sistemas con equipamiento electrónico redundante

**Items WBS Afectados:**
| Código | Descripción | Razón |
|:-------|:------------|:------|
| **1.1.100** | Servidores CTC principales | Requiere redundancia N+1 |
| **1.1.101** | Servidores CTC respaldo | Sistema redundante crítico |
| **1.1.106** | Switches core CTC | Infraestructura de red crítica |
| **2.1.100** | Estaciones base TETRA | Sistema de comunicaciones crítico |
| **3.1.100** | Servidores CCTV/ITS | Sistema de seguridad crítico |
| **5.1.100** | Sistema SCADA energía | Monitoreo de disponibilidad |

**Recomendación:** `1.1.100, 1.1.101, 1.1.106, 2.1.100, 3.1.100, 5.1.100`

---

### 2️⃣ R-CYB-01: Ciberseguridad IEC 62443

**Descripción:** Ciberseguridad IEC 62443  
**Categoría:** Técnico  
**Prob × Impacto:** Media × Alto  
**Estrategia:** Mitigar: Defensa en profundidad

**Análisis:**
- Afecta todos los sistemas con componentes digitales y conectividad
- IEC 62443 es estándar de seguridad industrial
- Requiere firewall, segmentación, control de acceso

**Items WBS Afectados:**
| Código | Descripción | Razón |
|:-------|:------------|:------|
| **1.1.100** | Servidores CTC | Sistema crítico SCADA |
| **1.1.105** | Software CTC/RBC | Software crítico de seguridad |
| **1.1.106** | Switches y routers | Infraestructura de red |
| **1.1.108** | Firewall y ciberseguridad | Componente directo |
| **2.1.100** | Estaciones TETRA | Red de comunicaciones |
| **3.1.100** | Servidores CCTV | Sistema de video |
| **5.1.100** | SCADA energía | Sistema de monitoreo |

**Recomendación:** `1.1.100, 1.1.105, 1.1.106, 1.1.108, 2.1.100, 3.1.100, 5.1.100`

---

### 3️⃣ R-FM-001: Fuerza Mayor (Huelgas, Problemas FENOCO)

**Descripción:** Huelgas transporte, problemas FENOCO, paros sector  
**Categoría:** Fuerza Mayor  
**Prob × Impacto:** Media × Alto  
**Estrategia:** MITIGAR - Plan contingencia, proveedores alternativos

**Análisis:**
- Afecta principalmente ítems que requieren transporte de materiales
- Impacta obra civil y sistemas instalados en vía
- Items con mayor exposición a logística

**Items WBS Afectados:**
| Código | Descripción | Razón |
|:-------|:------------|:------|
| **2.3.100** | Cable fibra óptica 594 km | Requiere transporte masivo |
| **2.3.103** | Cajas de empalme fibra (1,823) | Volumen significativo |
| **2.1.100** | Torres TETRA (37) | Instalación en campo |
| **3.2.100** | Equipos PANs (24-146) | Instalación en sitio |
| **4.1.100** | Traviesas y elementos vía | Depende de acceso FENOCO |
| **6.1.100** | Material rodante | Coordinación FENOCO crítica |

**Recomendación:** `2.3.100, 2.3.103, 2.1.100, 3.2.100, 4.1.100, 6.1.100`

---

### 4️⃣ R-GES-004: Desfase Aprobación Diseños vs Cronograma

**Descripción:** Desfase aprobación diseños vs cronograma Plan Obras  
**Categoría:** Gestión  
**Prob × Impacto:** Media × Alto  
**Estrategia:** MITIGAR - Integrar cronograma entregables ingeniería con Plan Obras

**Análisis:**
- Afecta ítems que requieren aprobación de diseño antes de ejecutar
- Mayor impacto en sistemas complejos con lead time largo
- Ruta crítica del proyecto

**Items WBS Afectados:**
| Código | Descripción | Razón |
|:-------|:------------|:------|
| **1.1.100** | Servidores CTC | Requiere diseño detallado aprobado |
| **1.1.103** | Sistema ATP/ITCS | Indefinición tecnológica (BLOCKER) |
| **1.2.100** | Enclavamientos 5 estaciones | Diseño complejo, aprobación ANI |
| **2.1.100** | Red TETRA 37 estaciones | Diseño RF requiere aprobación |
| **2.3.100** | Fibra óptica 594 km | Diseño de ruta crítico |
| **3.1.100** | Sistema CCTV/ITS | Diseño de arquitectura |
| **5.1.100** | SCADA energía | Integración con sistemas existentes |

**Recomendación:** `1.1.100, 1.1.103, 1.2.100, 2.1.100, 2.3.100, 3.1.100, 5.1.100`

---

### 5️⃣ R-CAL-001: Calidad Materiales/Mano de Obra

**Descripción:** Calidad materiales/mano obra no cumple estándares  
**Categoría:** Gestión  
**Prob × Impacto:** Media × Alto  
**Estrategia:** MITIGAR - Control calidad estricto, certificaciones

**Análisis:**
- Afecta ítems con alta criticidad de calidad
- Mayor impacto en sistemas de seguridad y control
- Requiere certificaciones específicas

**Items WBS Afectados:**
| Código | Descripción | Razón |
|:-------|:------------|:------|
| **1.1.100** | Servidores CTC | SIL 4, certificación ferroviaria |
| **1.1.103** | ATP/ITCS | SIL 4, estándar CENELEC |
| **1.2.100** | Enclavamientos | SIL 4, vital safety |
| **2.3.100** | Cable fibra óptica | Certificación G.652D |
| **2.3.103** | Cajas empalme (1,823) | IP66, calidad construcción |
| **3.2.100** | Equipos PANs | Certificación seguridad vial |
| **4.1.100** | Material vía | Estándares AREMA/UIC |
| **6.1.100** | Material rodante | Certificación ferroviaria |

**Recomendación:** `1.1.100, 1.1.103, 1.2.100, 2.3.100, 2.3.103, 3.2.100, 4.1.100, 6.1.100`

---

## 📊 RESUMEN DE ASIGNACIONES

| Riesgo ID | Nombre Corto | Items WBS Actuales | Items WBS Propuestos | Cantidad |
|:----------|:-------------|:-------------------|:---------------------|:---------|
| R-AT4-01 | Disponibilidad | **Transversal** | 1.1.100, 1.1.101, 1.1.106, 2.1.100, 3.1.100, 5.1.100 | **6** |
| R-CYB-01 | Ciberseguridad | **Transversal** | 1.1.100, 1.1.105, 1.1.106, 1.1.108, 2.1.100, 3.1.100, 5.1.100 | **7** |
| R-FM-001 | Fuerza Mayor | **Transversal** | 2.3.100, 2.3.103, 2.1.100, 3.2.100, 4.1.100, 6.1.100 | **6** |
| R-GES-004 | Aprobación Diseños | **Transversal** | 1.1.100, 1.1.103, 1.2.100, 2.1.100, 2.3.100, 3.1.100, 5.1.100 | **7** |
| R-CAL-001 | Calidad | **Transversal** | 1.1.100, 1.1.103, 1.2.100, 2.3.100, 2.3.103, 3.2.100, 4.1.100, 6.1.100 | **8** |

---

## 🎯 ITEMS WBS MÁS EXPUESTOS

**Análisis de frecuencia:**

| Item WBS | Descripción | Riesgos Asociados | Frecuencia |
|:---------|:------------|:------------------|:-----------|
| **1.1.100** | Servidores CTC | R-AT4-01, R-CYB-01, R-GES-004, R-CAL-001 | **4/5** 🔴 |
| **1.1.103** | ATP/ITCS | R-GES-004, R-CAL-001 (+ R-ITCS-001) | **3/5** 🟡 |
| **2.1.100** | TETRA | R-AT4-01, R-CYB-01, R-FM-001, R-GES-004 | **4/5** 🔴 |
| **2.3.100** | Fibra 594km | R-FM-001, R-GES-004, R-CAL-001 (+ R-FIBRA-001) | **4/5** 🔴 |
| **2.3.103** | Cajas empalme | R-FM-001, R-CAL-001 (+ R-FIBRA-001, R-FIBRA-006) | **4/5** 🔴 |
| **3.1.100** | CCTV/ITS | R-AT4-01, R-CYB-01, R-GES-004 | **3/5** 🟡 |
| **5.1.100** | SCADA | R-AT4-01, R-CYB-01, R-GES-004 | **3/5** 🟡 |

**Conclusión:** Items **1.1.100 (CTC), 2.1.100 (TETRA), 2.3.100 y 2.3.103 (Fibra)** son los más críticos con exposición a 4+ riesgos.

---

## 💰 EXPOSICIÓN ECONÓMICA ESTIMADA

### Ejemplo: Item 1.1.100 (Servidores CTC)

**Valor WBS:** $360,000,000 COP

**Riesgos asociados:**
1. R-AT4-01 (Prob 0.5 × Impacto 0.8) = Exp 0.40 → $144M
2. R-CYB-01 (Prob 0.5 × Impacto 0.8) = Exp 0.40 → $144M
3. R-GES-004 (Prob 0.5 × Impacto 0.8) = Exp 0.40 → $144M
4. R-CAL-001 (Prob 0.5 × Impacto 0.8) = Exp 0.40 → $144M

**Exposición agregada:** $576M COP (160% del valor base) 🔴 **CRÍTICO**

*Nota: No es suma simple, requiere análisis Monte Carlo para considerar correlaciones.*

---

## ✅ RECOMENDACIÓN FINAL

### Actualizar Matriz de Riesgos:

```markdown
| R-AT4-01 | ... | Transversal | → | 1.1.100, 1.1.101, 1.1.106, 2.1.100, 3.1.100, 5.1.100 |
| R-CYB-01 | ... | Transversal | → | 1.1.100, 1.1.105, 1.1.106, 1.1.108, 2.1.100, 3.1.100, 5.1.100 |
| R-FM-001 | ... | Transversal | → | 2.3.100, 2.3.103, 2.1.100, 3.2.100, 4.1.100, 6.1.100 |
| R-GES-004 | ... | Transversal | → | 1.1.100, 1.1.103, 1.2.100, 2.1.100, 2.3.100, 3.1.100, 5.1.100 |
| R-CAL-001 | ... | Transversal | → | 1.1.100, 1.1.103, 1.2.100, 2.3.100, 2.3.103, 3.2.100, 4.1.100, 6.1.100 |
```

### Beneficios:
- ✅ Trazabilidad completa (100% riesgos con items WBS)
- ✅ Análisis de exposición económica por ítem
- ✅ Filtrado de riesgos por sistema/capítulo
- ✅ Priorización de mitigación basada en valor en riesgo

---

## 📝 PRÓXIMOS PASOS

1. ✅ Actualizar `MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md`
2. ✅ Regenerar `riesgos_wbs.json` y `riesgos_wbs.js`
3. ✅ Actualizar interfaz `WBS_Analisis_Riesgos.html` para mostrar items
4. ✅ Validar con PMO

---

**Documento creado:** 12 de Octubre 2025  
**Versión:** 1.0  
**Estado:** ✅ ANÁLISIS COMPLETADO  
**Responsable:** Equipo Técnico / PMO  
**Siguiente paso:** Implementar cambios en matriz

