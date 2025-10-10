# REPORTE EJECUTIVO PARA ANI - SOLICITUDES URGENTES

**Proyecto:** APP La Dorada - Chiriguaná  
**Contrato:** Concesión No. 001 de 2025  
**De:** PMO / Gestión de Riesgos  
**Para:** ANI - Agencia Nacional de Infraestructura  
**Fecha:** 9 de Octubre 2025 (Mes 4/12 Ingeniería)  
**Prioridad:** 🔴 URGENTE - BLOCKERS CRÍTICOS IDENTIFICADOS

---

## 🎯 **RESUMEN EJECUTIVO**

### **Estado del Proyecto:**
- ✅ Ingeniería: Mes 4/12 (33% completado)
- ✅ WBS: 123 ítems, $264,901M COP validados
- ❌ **3 BLOCKERS identificados** requieren resolución urgente
- ⚠️ **$153,098M COP en riesgo** (58% del proyecto)

### **Análisis Realizado:**
- ✅ Revisión completa Apéndices Técnicos AT1-AT10
- ✅ Análisis documentos contractuales (II.A/)
- ✅ Validación contra cocina técnica (carpetas I-VI)
- ✅ **13 riesgos totales identificados** (1 crítico, 2 altos, 9 medios, 1 bajo)

---

## 🔴 **BLOCKERS CRÍTICOS - SOLICITUDES URGENTES**

### **SOLICITUD 1: DEFINICIÓN SISTEMA ITCS/ETCS L2** 🔴 **URGENTE**

**REF:** AT3 - Capítulo VIII (Sistemas de Señalización y Control de Trenes)

**HALLAZGO:**

AT3 menciona sistemas diferentes sin definir cuál implementar:
- **PTC** (Positive Train Control - AAR Americano) - Línea 289 AT3
- **CTC** con protocolo Adif (Español) - Líneas 529-532 AT3
- **Enclavamientos** normas Adif ET/NAS (Español) - Líneas 506-524 AT3
- ❌ **NO menciona:** ITCS (Incremental Train Control System)
- ❌ **NO menciona:** ETCS Level 2 (European Train Control System)

**Análisis A.1 (línea 49):**
> "Diseñar 5 enclavamientos electrónicos y un sistema **PTC**"

**Análisis A.3 - Riesgo R-TEC-002:**
> "Indefinición de especificaciones ITCS en AT3 bloquea diseño de material rodante"

**PROBLEMA:**
- Normas de 3 países diferentes (USA, España, Europa)
- **NO hay definición clara** de cuál sistema prevalece
- Base datos proyecto dice "ITCS ETCS Level 2" (NO en contrato)

**IMPACTO:**
- 🔴 60% de Capítulo 1 (Control y Señalización) **BLOQUEADO**
- 🔴 Valor en riesgo: **$132,228M COP**
- 🔴 Diseño de detalle **SUSPENDIDO**
- 🔴 Especificaciones de compra **NO SE PUEDEN ELABORAR**

**SOLICITUD FORMAL:**

**¿Qué sistema de control de trenes debe implementarse?**

**Opciones identificadas:**
1. **PTC** (Positive Train Control - AAR americano)
   - Costo estimado: $8M USD
   - Lead time: 10 meses
   - Normativa: AAR, FRA

2. **ETCS Level 2** (European Train Control System)
   - Costo estimado: $12M USD ⭐ RECOMENDADO PMO
   - Lead time: 12 meses
   - Normativa: UIC, CENELEC

3. **CTC Adif** (Sistema español)
   - Costo estimado: $10M USD
   - Lead time: 11 meses
   - Normativa: Adif (España)

4. **Solución Híbrida** (definir arquitectura específica)
   - Costo estimado: Por definir
   - Lead time: Por definir

**PLAZO RESPUESTA SOLICITADO:** 15 de Diciembre 2025 (Mes 6)  
**60 días desde HOY**

**PLAN B (si no hay respuesta Mes 6):**
PMO asumirá normas mixtas con diseño de gateway interoperable según UIC 918-4, documentando supuestos formales. Cliente asume riesgo de compatibilidad futura.

**Responsable PMO:** Gerencia Técnica + PMO  
**Requiere Decisión:** ANI + Concesionario

---

### **SOLICITUD 2: CRONOGRAMA ENTREGA MATERIAL RODANTE** 🟡 **MEDIA**

**REF:** AT9 §(h) + AT10 Capítulo III

**HALLAZGO:**

**AT9 §(h) - Plan de Obras:**
> "Se debe incluir el tiempo estimado para realizar la **Puesta a Punto
> de cada unidad de Material Rodante** (Locomotoras y Plataformas)
> **entregada por parte de la Nación**."

**AT10 §3.1:**
> "El Concesionario hará uso de los Surcos de Movilización que correspondan
> a la Capacidad Asignada del **Material Rodante del Proyecto**."

**PROBLEMA:**
- ✅ Material Rodante entregado por "la Nación" (confirmado)
- ❌ **Cronograma entrega NO especificado**
- ❌ Cantidad exacta NO especificada
- ❌ Responsable entrega NO claro (¿ANI? ¿FENOCO? ¿Otro?)

**IMPACTO:**
- 🟡 Cronograma Puesta a Punto indefinido
- 🟡 Secuencia pruebas sistemas embarcados indefinida
- 🟡 No se puede planificar instalación ATP/TETRA embarcado

**SOLICITUD FORMAL:**

**Información requerida sobre Material Rodante:**

1. **Cantidad exacta** de locomotoras a entregar
2. **Cronograma entrega escalonada** (fechas comprometidas)
3. **Especificaciones técnicas** (modelo, potencia, sistemas actuales)
4. **Responsable entrega** (¿ANI? ¿FENOCO? ¿Ministerio Transporte?)
5. **Estado actual** locomotoras (¿existen? ¿en adquisición?)

**PLAZO RESPUESTA SOLICITADO:** 15 de Noviembre 2025 (Mes 5)  
**45 días desde HOY**

**PLAN B (si no hay respuesta Mes 5):**
PMO asumirá cronograma genérico: Entrega M20 (escalonada M20-30), diseñando secuencia de Puesta a Punto adaptable a cronograma real. Certificación en banco de pruebas si MR no está disponible.

**Responsable PMO:** PMO + Gerencia Operaciones

---

### **SOLICITUD 3: ESPECIFICACIONES TÉCNICAS FENOCO** 🟠 **ALTA**

**REF:** AT10 §4.1-4.2 (Compatibilidad Material Rodante)

**HALLAZGO:**

**AT10 §4.1:**
> "El Concesionario elaborará el documento 'Requerimientos técnicos para
> la compatibilidad exitosa y condiciones de prueba del Material Rodante'."

**AT10 §4.2:**
> Plazo: **90 días desde Fecha de Inicio**

**PROBLEMA:**
- ✅ Concesionario debe crear documento compatibilidad (90 días)
- ❌ **NO tiene especificaciones operadores existentes** (ej: FENOCO)
- ❌ **Protocolos comunicación NO especificados**
- ❌ **Requisitos técnicos interoperabilidad indefinidos**

**IMPACTO:**
- 🟠 Documento compatibilidad será **INCOMPLETO**
- 🟠 Gateway interoperabilidad sin especificaciones ($350M COP)
- 🟠 Riesgo de incompatibilidad operativa futura

**SOLICITUD FORMAL:**

**Información requerida de operadores existentes (FENOCO u otros):**

1. **Especificaciones técnicas sistemas actuales**
   - ¿Siemens Trainguard? ¿Otro sistema?
   - Versión, arquitectura, protocolos

2. **Protocolos de comunicación**
   - ¿UIC 918-4? ¿Propietario? ¿Otro?
   - Formato mensajes, APIs (si existen)

3. **Requisitos de interoperabilidad**
   - ¿Qué información debe intercambiarse?
   - Frecuencia, redundancia, seguridad

4. **Plan de pruebas conjuntas**
   - Shutdowns requeridos
   - Procedimiento certificación

**PLAZO RESPUESTA SOLICITADO:** 15 de Diciembre 2025 (Mes 6)  
**60 días desde HOY**

**PLAN B (si no hay respuesta Mes 6):**
Concesionario entregará documento "Compatibilidad MR" con gateway UIC 918-4 estándar genérico, sin integración específica con sistemas FENOCO. Responsabilidad de integración futura será de FENOCO/Concesionario post-entrega.

**Responsable PMO:** Gerencia Técnica + Gerencia Operaciones

---

### **SOLICITUD 4: Clarificación Sistema GSM-R** 🟡 **MEDIA**

**REF:** AT3 §8.4-8.5 (Comunicaciones y Radio)

**HALLAZGO:**

**AT3 §8.5 - Radio:**
- Menciona normas **TETRA** (EN 300 xxx) detalladamente
- ❌ **NO menciona GSM-R** (Global System for Mobile Communications - Railway)

**Base Datos WBS:**
- Incluye ítems GSM-R (Capítulo 2 - Telecomunicaciones)

**PROBLEMA:**
- ⚠️ GSM-R en base datos pero NO en AT3
- ¿GSM-R es obligatorio o es un error de la base datos?

**SOLICITUD FORMAL:**

**¿Sistema GSM-R es parte del alcance contractual?**
- Si SÍ → Actualizar AT3 con normas GSM-R
- Si NO → Eliminar ítems GSM-R de WBS

**PLAZO RESPUESTA:** Mes 6 (15-Dic-2025)

---

## 📊 **RIESGOS CONSOLIDADOS - MATRIZ ACTUALIZADA**

### **Total Riesgos Activos: 13**

| Categoría | Cantidad | Exposición |
|:----------|:--------:|:----------:|
| **Técnicos** | 4 | 1 CRÍTICA, 2 ALTA, 1 MEDIA |
| **Contractuales** | 4 | 3 ALTA, 1 MEDIA |
| **Cronograma** | 2 | 1 CRÍTICA, 1 MEDIA |
| **Gestión** | 2 | 2 MEDIA |
| **Fuerza Mayor** | 1 | 1 MEDIA |

**Distribución Exposición:**
- 🔴 CRÍTICA: 1 (R-FIBRA-001 Lead time 9m)
- 🟠 ALTA: 2 (R-AT3-01 ITCS, R-IF-01 Interfaces)
- 🟡 MEDIA: 9 (incluye 4 nuevos: R-GES-004, R-CON-001, R-OPE-001, R-CAL-001)
- 🟢 BAJA: 1 (R-FIBRA-006)

---

## ✅ **CRONOGRAMA CONTRACTUAL vs PMO**

### **Cronograma Contractual (AT9):**
- Estudios y Diseños: 12 meses
- Obras Civiles: 24 meses
- Instalación Sistemas: 18 meses
- Pruebas: 6 meses
- **TOTAL:** **60 meses**

### **Plan PMO Agresivo (generado HOY):**
- Ingeniería: 12 meses (Mes 0-12) ✅
- Obra base: 36 meses (Mes 13-48) ← Agresivo (vs 48m contractual)
- Buffer riesgos: 12 meses (Mes 49-60) ← Contingencia
- **TOTAL:** **60 meses** ✅ CUMPLE CONTRATO

**Estrategia:** Entregar en 48m usando plan agresivo, dejar 12m buffer para riesgos

---

## 🎯 **ACCIONES SOLICITADAS A ANI**

### **Urgente (Respuesta Mes 6 - 60 días):**
1. 🔴 Definir sistema control trenes (PTC/ETCS L2/CTC Adif/Híbrido)
2. 🟠 Facilitar especificaciones FENOCO para doc compatibilidad
3. 🟡 Clarificar si GSM-R es parte del alcance

### **Media (Respuesta Mes 5 - 45 días):**
4. 🟡 Cronograma entrega Material Rodante (cantidad, fechas, responsable)

---

## 📋 **CONSECUENCIAS SI NO HAY RESPUESTA**

### **Si BLOCKER-001 no se resuelve Mes 6:**
- ⏸️ Diseño de detalle Cap 1 permanece BLOQUEADO
- 🔴 Retraso mínimo: 3 meses
- 💰 Sobrecostos estimados: $2M-$7M USD
- ⚠️ Riesgo incumplimiento contractual

### **Si BLOCKER-002 no se resuelve Mes 6:**
- ⏸️ Documento compatibilidad M3 será INCOMPLETO
- 🟠 Gateway sin especificaciones específicas
- 💰 Sobrecostos: $1M-$2M USD (desarrollo custom)
- ⚠️ Interoperabilidad "teórica" (sin pruebas reales)

### **Si BLOCKER-004 no se resuelve Mes 5:**
- ⏸️ Plan de Obras con cronograma MR GENÉRICO
- 🟡 Secuencia Puesta a Punto indefinida
- ⚠️ Certificación en banco sin MR real

---

## 📄 **ANEXOS TÉCNICOS**

1. `@@ANALISIS_CONTRACTUAL_COMPLETO_VALIDADO_v1.0.md`
2. `@@VALIDACION_BLOCKERS_vs_CONTRATO_REAL_09Oct2025.md`
3. `@@HALLAZGOS_CONTRACTUALES_VALIDADOS_TODOS_ATs_v1.0.md`
4. `BLOCKER-001_Indefinicion_ITCS.md`
5. `BLOCKER-002_Protocolos_FENOCO.md`
6. `BLOCKER-004_Material_Rodante_Cronograma.md`
7. `MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md` (13 riesgos)

---

## 🎯 **SOLICITUD DE REUNIÓN TÉCNICA**

**Fecha Propuesta:** 15 de Noviembre 2025 (Mes 5)  
**Duración:** 3 horas  
**Lugar:** Oficinas ANI o virtual

**Participantes:**
- ANI (Gerencia Técnica)
- Concesionario (Gerencia General + Técnica)
- FENOCO (Gerente Técnico + Especialista) - Invitado
- PMO Proyecto
- Interventoría

**Agenda:**
1. Presentación análisis contractual (20 min)
2. Discusión BLOCKER-001 - Sistema Control (40 min)
3. Discusión BLOCKER-002 - FENOCO (40 min)
4. Discusión BLOCKER-004 - Material Rodante (30 min)
5. Definición acciones y responsables (30 min)
6. Cierre y acuerdos (20 min)

**Entregable:** Acta de reunión con decisiones formales

---

## ✅ **PLAN B DOCUMENTADO (Si no hay respuesta)**

### **Para BLOCKER-001 (ITCS):**
- Diseñar con normas mixtas AAR + Adif + UIC
- Gateway interoperable multi-protocolo
- Documentación completa de supuestos
- Costo adicional: $0 (incluido en contingencia)

### **Para BLOCKER-002 (FENOCO):**
- Gateway UIC 918-4 genérico
- Sin integración específica Trainguard
- Interoperabilidad "teórica" documentada
- Responsabilidad integración: FENOCO post-entrega

### **Para BLOCKER-004 (MR):**
- Cronograma genérico M20-30
- Secuencia Puesta a Punto adaptable
- Certificación en banco sin MR real
- Pruebas in-situ cuando MR disponible

---

## 📊 **MÉTRICAS DE PROYECTO**

### **Estado Actual:**
- Mes actual: 4/60 (6.7% tiempo transcurrido)
- Avance ingeniería: 33%
- Riesgos identificados: 13
- BLOCKERS activos: 3
- Valor en riesgo: $153,098M (58%)

### **Objetivos Mes 6:**
- ✅ Resolver 100% BLOCKERS críticos
- ✅ Exposición riesgos <2.5 (actual: 3.2)
- ✅ Avance ingeniería 50%
- ✅ AT3 completado y aprobado

---

**Elaborado por:** PMO - Gestión de Riesgos  
**Aprobado por:** [Pendiente Gerente Proyecto]  
**Requiere:** Acción ANI urgente (60 días)  
**Próximo seguimiento:** Mes 5 (Reunión técnica)

