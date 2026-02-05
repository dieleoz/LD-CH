# PROMPT PARA AGENTE DE BÚSQUEDA - RESPUESTA TÉCNICA JOVEGA INGENIERÍA S.A.S.

**Fecha:** 15 de Octubre de 2025  
**Proyecto:** APP La Dorada-Chiriguaná  
**Destinatario:** JOVEGA Ingeniería S.A.S. (Posible contratista señalización y telecomunicaciones)  
**Objetivo:** Buscar información técnica para preparación de oferta preliminar  

---

## 🎯 CONTEXTO DE LA SOLICITUD

Has recibido una consulta de **JOVEGA Ingeniería S.A.S.** (empresa especializada en señalización y telecomunicaciones ferroviarias) solicitando información para preparar una **oferta preliminar** del proyecto APP La Dorada-Chiriguaná.

**Situación contractual:**
- ✅ Contrato de concesión firmado (No. 001 de 2025)
- ⏳ Diseño detallado de señalización **en proceso de licitación** (aún no adjudicado)
- ✅ Especificaciones técnicas contractuales disponibles (AT1-AT10)
- ✅ Ingeniería conceptual y básica completada

---

## 📋 MISIÓN DEL AGENTE

Buscar en el repositorio de ingeniería del proyecto **la información disponible** que permita responder a la "Lista de Chequeo para Preparación de Oferta" de JOVEGA. El objetivo es proporcionarles información suficiente para una **cotización paramétrica preliminar**, reconociendo que **los detalles definitivos dependen del diseño en licitación**.

---

## 🔍 1. INFORMACIÓN PRIORITARIA A BUSCAR

### 1.1 **CRÍTICO** - Topología de Vía (sin esto no pueden estimar nada)
```
BUSCAR:
- Planos de trazado general del corredor
- Ubicación de estaciones principales
- Ubicación de pasos a nivel
- Ubicación de máquinas de cambio/desvíos
- PKs (Puntos kilométricos) de elementos clave
- Longitud total del corredor

CARPETAS OBJETIVO:
- III. Ingenieria conceptual/
- IV. Ingenieria básica/
- VIII. Documentos Maestros y Metodologia/
- IX. WBS y Planificacion/
```

### 1.2 **ALTO** - Cantidades de Equipos de Señalización y Tipos
```
BUSCAR:
- Cantidad de enclavamientos electrónicos (ENCE)
- Ubicación de estaciones con ENCE
- Cantidad y tipos de desvíos (motorizados vs manuales)
- Sistema de señalización (física vs virtual)
- Especificaciones de semáforos y señales
- Casetas de señalización (cantidad y ubicaciones)
- Sistema CTC/ITCS implementado

DOCUMENTOS CLAVE:
- AT1 - Alcance del Proyecto
- V. Ingenieria de detalle/V.1_Señalizacion*.md
- V. Ingenieria de detalle/V.2_CTC*.md
- III. Ingenieria conceptual/29_Sistema_Senalizacion*.md
```

### 1.3 **MEDIO** - Especificaciones de Comunicaciones y Energía
```
BUSCAR:
- Arquitectura de red TETRA (cantidad de torres, ubicaciones)
- Arquitectura de red GSM-R (si aplica)
- Especificaciones de fibra óptica (longitud, topología)
- Ubicaciones de torres/mástiles de comunicaciones
- Integración con sistema FENOCO
- Puntos de conexión eléctrica
- Especificaciones de respaldo (UPS/solar/generadores)
- Requisitos de media y baja tensión

DOCUMENTOS CLAVE:
- AT1 - Alcance del Proyecto
- III. Ingenieria conceptual/27_Sistema_TETRA*.md
- III. Ingenieria conceptual/28_Sistema_FibraOptica*.md
- V. Ingenieria de detalle/V.3_Sistemas_Comunicacion*.md
- V. Ingenieria de detalle/V.4_Sistemas_Potencia*.md
```

### 1.4 **BAJO** - Detalles de Obras Civiles Complementarias
```
BUSCAR:
- Canalizaciones para cableado
- Bases de concreto para casetas, semáforos, barreras PN
- Especificaciones de casetas (dimensiones, materiales)

DOCUMENTOS CLAVE:
- V. Ingenieria de detalle/V.1_Civil/*.md
```

---

## 🗂️ 2. DOCUMENTOS CLAVE A REVISAR (POR ORDEN DE PRIORIDAD)

### **PRIORIDAD 1 - Documentos Contractuales Base**
1. **`01. contrato en .md/FORMATEADO_APENDICE TECNICO 1.md`** 
   - Señalización y Telecomunicaciones (especificaciones contractuales)
   
2. **`01. contrato en .md/FORMATEADO_APENDICE TECNICO 2.md`**
   - Infraestructura Ferroviaria (topología, pasos a nivel)
   
3. **`01. contrato en .md/FORMATEADO_APENDICE TECNICO 3.md`**
   - Especificaciones Generales (estándares técnicos)
   
4. **`01. contrato en .md/FORMATEADO_APENDICE TECNICO 4.md`**
   - Indicadores de Desempeño (disponibilidad de sistemas)
   
5. **`01. contrato en .md/FORMATEADO_APENDICE TECNICO 6.md`**
   - Material Rodante (equipos embarcados)

### **PRIORIDAD 2 - Apéndices Técnicos Mejorados**
6. **`II. Apendices Tecnicos/11. AT1_Alcance_del_Proyecto_MEJORADO_v5.0.md`**
   - Alcance completo del proyecto con cantidades maestras
   
7. **`II. Apendices Tecnicos/12. AT2_Operacion_y_Mantenimiento_MEJORADO.md`**
   - Requerimientos operacionales
   
8. **`II. Apendices Tecnicos/13. AT3_Especificaciones_Generales_MEJORADO.md`**
   - Especificaciones técnicas detalladas

### **PRIORIDAD 3 - Ingeniería Conceptual**
9. **`III. Ingenieria conceptual/23_ListadoMaestro_Sistemas_v5.0.md`**
   - Inventario completo de sistemas y cantidades
   
10. **`III. Ingenieria conceptual/25.1_WBS_COMPLETA_ESPECIALIDADES_v5.0.md`**
    - Estructura detallada de trabajo por especialidades
    
11. **`III. Ingenieria conceptual/29_Sistema_Senalizacion_Integrado_v5.0.md`**
    - Filosofía de señalización virtual (CRÍTICO)
    
12. **`III. Ingenieria conceptual/27_Sistema_TETRA_Integrado_v5.0.md`**
    - Sistema TETRA con 37 estaciones
    
13. **`III. Ingenieria conceptual/28_Sistema_FibraOptica_Integrado*.md`**
    - Red de fibra óptica 594 km

### **PRIORIDAD 4 - Ingeniería de Detalle**
14. **`V. Ingenieria de detalle/V.1_Señalizacion_Ferroviaria_Detalle_v*.md`**
    - Detalles de señalización
    
15. **`V. Ingenieria de detalle/V.2_Centro_Control_Trafico_CTC_Detalle_v*.md`**
    - Sistema CTC centralizado
    
16. **`V. Ingenieria de detalle/V.3_Sistemas_Comunicacion_Detalle_v*.md`**
    - Sistemas de comunicación
    
17. **`V. Ingenieria de detalle/V.4_Sistemas_Potencia_Detalle_v*.md`**
    - Sistemas eléctricos y respaldo
    
18. **`V. Ingenieria de detalle/V.4_Sistemas/3_Pasos_a_nivel_Contrato_8_3.md`**
    - **146 pasos a nivel** detallados (9 Tipo C + 15 Tipo B + 122 Tipo A)

### **PRIORIDAD 5 - Documentos Maestros y WBS**
19. **`VIII. Documentos Maestros y Metodologia/CRITERIOS_TECNICOS_MAESTRO_APP_La_Dorada_Chiriguaná_v1.0.md`**
    - Fuente única de verdad técnica
    
20. **`IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md`**
    - Cantidades de obra detalladas
    
21. **`IX. WBS y Planificacion/datos_wbs_TODOS_items.json`**
    - Datos completos de cantidades
    
22. **`VIII. Documentos Maestros y Metodologia/Datos_Layout_Temporales/ESTACIONES_Agrupacion_y_Tareas_v1.0.md`**
    - **Listado de 11 estaciones principales + 15 menores + CCO**

### **PRIORIDAD 6 - Documentos Ejecutivos Consolidados**
23. **`X_ENTREGABLES_CONSOLIDADOS/7_SISTEMAS_EJECUTIVOS/SISTEMA_01_Control_y_Senalizacion_EJECUTIVO.md`**
    
24. **`X_ENTREGABLES_CONSOLIDADOS/7_SISTEMAS_EJECUTIVOS/SISTEMA_02_Telecomunicaciones_EJECUTIVO.md`**

---

## 🔎 3. ESTRATEGIA DE BÚSQUEDA POR TEMA

### **TEMA 1: Topología de Vía** ⭐ CRÍTICO
```bash
BÚSQUEDA 1: "topología vía" OR "planos ferroviarios" OR "layout estaciones" OR "PKs"
BÚSQUEDA 2: "estaciones principales" AND "ubicación" OR "PK"
BÚSQUEDA 3: "longitud corredor" OR "526 km" OR "594 km"
```

**DATOS ESPERADOS:**
- ✅ Longitud corredor: **520.78 km** (PK 201+470 México → PK 722+250 Chiriguaná)
- ✅ Estaciones principales: **11 ubicaciones**
- ✅ Estaciones menores: **15 apeaderos**
- ✅ CCO: **1 centro** (Barrancabermeja)
- ✅ Talleres: **2 ubicaciones** (México + Chiriguaná)

### **TEMA 2: Máquinas de Cambio y Desvíos** ⭐ ALTO
```bash
BÚSQUEDA 1: "desvíos" OR "máquinas de cambio" OR "agujas" AND "cantidad"
BÚSQUEDA 2: "desvíos motorizados" OR "desvíos manuales"
BÚSQUEDA 3: "ENCE" OR "enclavamiento electrónico" AND "estaciones"
```

**DATOS ESPERADOS:**
- ✅ Total desvíos: **120 unidades**
  - Motorizados: **25 unidades** (control automático CTC)
  - Manuales: **95 unidades** (operación local)
- ✅ Enclavamientos electrónicos (ENCE): **5 estaciones**
  - Zapatosa, García Cadena, Barrancabermeja, Puerto Berrío-Grecia, La Dorada-México

### **TEMA 3: Pasos a Nivel** ⭐ ALTO
```bash
BÚSQUEDA 1: "pasos a nivel" OR "PN" AND "cantidad" OR "ubicación"
BÚSQUEDA 2: "barreras automáticas" OR "Tipo C" OR "Tipo B" OR "Tipo A"
BÚSQUEDA 3: "146 pasos a nivel"
```

**DATOS ESPERADOS:**
- ✅ Total pasos a nivel: **146 unidades**
  - **Tipo C** (barreras automáticas): **9 PN** (alto tráfico vehicular)
  - **Tipo B** (señales luminosas/acústicas): **15 PN** (tráfico medio)
  - **Tipo A** (señalización fija): **122 PN** (bajo tráfico)

### **TEMA 4: Señalización Ferroviaria** ⭐ ALTO
```bash
BÚSQUEDA 1: "señalización virtual" OR "CTC" OR "ATP embarcado"
BÚSQUEDA 2: "semáforos" OR "señales LED" AND "cantidad"
BÚSQUEDA 3: "casetas de señalización" OR "gabinetes"
```

**DATOS ESPERADOS:**
- ✅ Filosofía: **Señalización VIRTUAL** (eliminada infraestructura física en vía)
- ✅ Sistema CTC: **1 centro centralizado** (La Dorada/Barrancabermeja)
- ✅ ATP embarcado: **15 locomotoras** (sin eurobalises en vía)
- ✅ Señales luminosas ENCE: **10 unidades** (2 por estación ENCE, solo entrada/salida)
- ✅ Eurobalises: **0 unidades** (reemplazado por ATP embarcado)
- ✅ Señales LED en vía: **0 unidades** (reemplazado por CTC virtual)

### **TEMA 5: Comunicaciones TETRA** ⭐ ALTO
```bash
BÚSQUEDA 1: "TETRA" AND "37 estaciones" OR "torres"
BÚSQUEDA 2: "torres comunicaciones" OR "mástiles" AND "ubicación"
BÚSQUEDA 3: "radio cobertura" OR "15 km" OR "solapamiento"
```

**DATOS ESPERADOS:**
- ✅ Estaciones TETRA: **37 torres**
- ✅ Altura torres: **40 metros** (estándar)
- ✅ Radio cobertura: **15 km** por estación
- ✅ Solapamiento: **20%** mínimo
- ✅ Espaciamiento: **~14.47 km** entre torres
- ✅ Colocalización GSM-R: **37 estaciones** (misma torre)
- ✅ Radios embarcados: **30 unidades** (15 locomotoras × 2 sistemas redundantes)
- ✅ Radios portátiles: **80 unidades**
- ✅ Consolas despacho CCO: **3 unidades**

### **TEMA 6: Fibra Óptica** ⭐ MEDIO
```bash
BÚSQUEDA 1: "fibra óptica" AND "594 km"
BÚSQUEDA 2: "cajas empalme" OR "cajas de paso" AND "300m"
BÚSQUEDA 3: "domos fusión" OR "fusionadora" OR "OTDR"
```

**DATOS ESPERADOS:**
- ✅ Longitud fibra: **594 km** (526 km corredor + 10% reserva)
- ✅ Cajas empalme 80x80: **1,823 unidades** (cada 300m + 88 en puentes)
- ✅ Domos fusión: **130 unidades** (cada 4 km, por rollo)
- ✅ Fusionadora: **1 equipo**
- ✅ OTDR: **1 equipo** (certificación)
- ✅ Rollos fibra: **149 rollos** de 4 km
- ✅ Topología: **Red redundante paralela a vía**

### **TEMA 7: Alimentación Eléctrica y Respaldo** ⭐ MEDIO
```bash
BÚSQUEDA 1: "subestaciones" OR "transformadores" AND "cantidad"
BÚSQUEDA 2: "UPS" OR "baterías" OR "generadores" AND "señalización"
BÚSQUEDA 3: "panel solar" OR "respaldo energético"
```

**DATOS ESPERADOS:**
- ✅ Subestaciones principales: **4 ubicaciones** (La Dorada, Puerto Berrío, Barrancabermeja, Chiriguaná)
- ✅ Subestaciones distribución: **8 ubicaciones** (cada ~75 km)
- ✅ UPS torres TETRA: **37 unidades** (3kVA, autonomía mínima)
- ✅ UPS enclavamientos: **5 unidades** (5kVA, 8 horas autonomía)
- ✅ Paneles solares PN Tipo C: **18 unidades** (2 por PN)
- ✅ Paneles solares PN Tipo B: **15 unidades** (1 por PN)

---

## 📊 4. FORMATO DE SALIDA ESPERADO

Para cada ítem de la lista de chequeo JOVEGA, reportar en formato estructurado:

```markdown
### [CATEGORÍA - Ej: SEÑALIZACIÓN]

#### 1. [ÍTEM ESPECÍFICO - Ej: Equipos de detección de trenes]

**✅ INFORMACIÓN DISPONIBLE:**
- **Fuente:** [Documento específico + sección]
- **Especificación:** [Detalle técnico]
- **Cantidad:** [Número de unidades]
- **Ubicaciones:** [Si aplica]
- **Estado:** Especificación contractual / Ingeniería conceptual / Diseño básico

**🔄 INFORMACIÓN PARCIAL:**
- **Disponible:** [Lo que existe]
- **Faltante:** [Lo que depende del diseño en licitación]
- **Observaciones:** [Aclaraciones]

**❌ NO DISPONIBLE:**
- **Razón:** [Por qué no está disponible]
- **Fuente alternativa:** [Dónde podría estar cuando esté disponible]
```

---

## 🎯 5. ESTRUCTURA DE RESPUESTA RECOMENDADA

```markdown
## RESPUESTA TÉCNICA PARA JOVEGA INGENIERÍA S.A.S.

### 1. TOPOLOGÍA Y LAYOUT DE VÍA ✅ DISPONIBLE
- Plano de trazado general: [Fuente]
- Estaciones: 11 principales + 15 menores + 1 CCO
- Pasos a nivel: 146 identificados
- Longitud corredor: 520.78 km
- [Detallar ubicaciones clave con PKs]

### 2. ESPECIFICACIONES TÉCNICAS DE SEÑALIZACIÓN ✅ PARCIAL
#### 2.1 Sistema de Control ✅
- CTC Centralizado: [Especificaciones AT1]
- ATP ETCS Level 2: [Especificaciones]
- Disponibilidad: 99.95%
- [Más detalles]

#### 2.2 Sistemas de Detección 🔄
- Tecnología: [Especificada/Por definir]
- Contadores de ejes vs circuitos de vía: [Estado]
- [Detalles disponibles]

#### 2.3 Máquinas de Cambio y Candados ✅
- Cantidad total: 120 desvíos
- Motorizados: 25 unidades
- Manuales: 95 unidades
- [Especificaciones]

### 3. COMUNICACIONES ✅ DISPONIBLE
#### 3.1 Sistema TETRA ✅
- Estaciones: 37 torres
- Cobertura: 100% corredor
- [Detalles técnicos]

#### 3.2 Fibra Óptica ✅
- Longitud: 594 km
- Arquitectura: Red redundante
- [Detalles técnicos]

### 4. SUMINISTRO ELÉCTRICO 🔄 PARCIAL
[Detalles disponibles + pendientes]

### 5. PASOS A NIVEL ✅ DISPONIBLE
- Total: 146 PN
- Tipo C: 9 PN (barreras automáticas)
- Tipo B: 15 PN (señales luminosas)
- Tipo A: 122 PN (señalización fija)
- [Ubicaciones aproximadas]

### 6. CASETAS DE SEÑALIZACIÓN 🔄 PARCIAL
- ENCE: 5 estaciones
- [Especificaciones disponibles]

## INFORMACIÓN EN DESARROLLO ⚠️
[Listado de elementos que dependen del diseño en licitación]

## DOCUMENTOS DISPONIBLES PARA COMPARTIR
[Listado de documentos técnicos que se pueden proporcionar]
```

---

## ⚠️ 6. RESTRICCIONES Y CONSIDERACIONES IMPORTANTES

### **NIVEL DE DETALLE DISPONIBLE:**
```
✅ NIVEL CONTRACTUAL (100% disponible):
- Especificaciones técnicas mínimas (AT1-AT10)
- Cantidades globales
- Estándares aplicables
- Indicadores de desempeño

✅ NIVEL CONCEPTUAL/BÁSICO (90% disponible):
- Arquitectura de sistemas
- Cantidades estimativas
- Criterios de diseño
- Ubicaciones aproximadas

🔄 NIVEL DETALLE (30% disponible - EN LICITACIÓN):
- Ubicación precisa de cada equipo
- Especificaciones de marca/modelo
- Planos constructivos
- Cronograma detallado
```

### **INFORMACIÓN QUE NO ESTARÁ DISPONIBLE (Por estar en licitación):**
- ❌ Ubicación exacta de cada semáforo/señal
- ❌ Cantidades exactas de equipos por estación/tramo
- ❌ Longitudes exactas de cableado y canalización
- ❌ Dimensiones específicas de casetas
- ❌ Especificaciones de marca/modelo de equipos
- ❌ Cronograma de implementación por fases
- ❌ Planos constructivos detallados

### **ESTRATEGIA DE COMUNICACIÓN CON JOVEGA:**
1. **Transparencia:** Ser claro sobre qué información es preliminar vs definitiva
2. **Trazabilidad:** Siempre referenciar la fuente documental
3. **Flexibilidad:** Indicar que cantidades pueden variar según diseño final
4. **Próximos pasos:** Proponer reunión técnica cuando diseño esté adjudicado

---

## 📑 7. DOCUMENTOS A ANEXAR EN RESPUESTA A JOVEGA

### **ANEXO A: Extracto Ejecutivo AT1** (2-3 páginas)
Contenido:
- Sistemas principales (CTC, ATP, TETRA, GSM-R)
- Criterios de disponibilidad (99.95%)
- Estándares técnicos aplicables (AREMA, UIC, RETIE, IEC)
- Interfaces con FENOCO

### **ANEXO B: Plano Topología Simplificada**
Contenido:
- Esquema unifilar del corredor
- Estaciones principales (11) con PKs
- Pasos a nivel (146) agrupados por zona
- Puntos de control (5 ENCE)
- Distancias aproximadas

### **ANEXO C: Matriz de Requerimientos Preliminares**
Tabla con:
| Sistema/Subsistema | Especificación Técnica Mínima | Disponibilidad Requerida | Normativa Aplicable |
|:---|:---|:---:|:---|
| CTC | Control centralizado, protocolo UIC | 99.95% | AREMA, UIC |
| TETRA | 37 estaciones, 15 km cobertura | 99.95% | ETSI EN 300 392 |
| ... | ... | ... | ... |

### **ANEXO D: Cantidades Globales WBS**
Extracto de:
- `IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md`
Con cantidades de:
- Señalización
- Comunicaciones
- Energía
- Obras civiles

---

## 🚀 8. PROCESO DE EJECUCIÓN DEL AGENTE

### **PASO 1: LECTURA DE DOCUMENTOS BASE** (15 minutos)
```
1. Leer AT1 completo (señalización y telecomunicaciones)
2. Leer AT2 (infraestructura y pasos a nivel)
3. Leer CRITERIOS_TECNICOS_MAESTRO (fuente de verdad)
4. Leer WBS_Presupuestal (cantidades)
5. Leer ESTACIONES_Agrupacion (topología)
```

### **PASO 2: BÚSQUEDA POR TEMA** (30 minutos)
```
Para cada tema de JOVEGA:
  1. Ejecutar búsquedas específicas
  2. Consolidar información encontrada
  3. Clasificar: Disponible / Parcial / No disponible
  4. Anotar fuentes documentales
```

### **PASO 3: CONSOLIDACIÓN** (20 minutos)
```
1. Agrupar información por categoría JOVEGA
2. Crear tablas de cantidades
3. Generar esquemas/diagramas simples
4. Identificar gaps críticos
```

### **PASO 4: GENERACIÓN DE ANEXOS** (25 minutos)
```
1. Extraer extracto ejecutivo AT1
2. Crear plano topología simplificada
3. Generar matriz de requerimientos
4. Exportar cantidades WBS relevantes
```

### **PASO 5: REDACCIÓN DE RESPUESTA** (30 minutos)
```
1. Estructura según formato recomendado
2. Incluir referencias documentales
3. Agregar advertencias sobre información preliminar
4. Proponer próximos pasos
```

**TIEMPO TOTAL ESTIMADO:** 2 horas

---

## ✅ 9. CRITERIOS DE ÉXITO

La búsqueda será exitosa si logra proporcionar a JOVEGA:

1. ✅ **Topología clara del corredor** con estaciones y PKs
2. ✅ **Cantidades globales** de equipos principales
3. ✅ **Especificaciones técnicas contractuales** (AT1-AT10)
4. ✅ **Identificación clara** de información disponible vs pendiente
5. ✅ **Documentos anexos** para cotización preliminar
6. ✅ **Propuesta de próximos pasos** para oferta definitiva

---

## 📌 10. NOTAS FINALES PARA EL AGENTE

### **PRIORIDADES:**
1. **TOPOLOGÍA** (sin esto no hay cotización posible)
2. **CANTIDADES** (para estimación paramétrica)
3. **ESPECIFICACIONES** (para cumplimiento contractual)
4. **GAPS** (transparencia sobre lo que falta)

### **TONO DE LA RESPUESTA:**
- ✅ Profesional y técnico
- ✅ Transparente sobre limitaciones actuales
- ✅ Proactivo en proponer soluciones
- ✅ Orientado a facilitar cotización preliminar

### **EVITAR:**
- ❌ Inventar información no disponible
- ❌ Prometer detalles que dependen del diseño en licitación
- ❌ Omitir referencias a fuentes documentales
- ❌ Subestimar complejidad del proyecto

---

**FIN DEL PROMPT**

---

## 🔗 REFERENCIAS RÁPIDAS

**Documentos clave del repositorio:**
- `/01. contrato en .md/FORMATEADO_APENDICE TECNICO 1.md` → AT1
- `/II. Apendices Tecnicos/11. AT1_Alcance_del_Proyecto_MEJORADO_v5.0.md` → AT1 Mejorado
- `/VIII. Documentos Maestros y Metodologia/CRITERIOS_TECNICOS_MAESTRO_APP_La_Dorada_Chiriguaná_v1.0.md` → Fuente de verdad
- `/IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md` → Cantidades
- `/VIII. Documentos Maestros y Metodologia/Datos_Layout_Temporales/ESTACIONES_Agrupacion_y_Tareas_v1.0.md` → Topología
- `/V. Ingenieria de detalle/V.4_Sistemas/3_Pasos_a_nivel_Contrato_8_3.md` → 146 PN detallados

**Valores clave a recordar:**
- Corredor: **520.78 km** (PK 201+470 → PK 722+250)
- Estaciones ENCE: **5**
- Desvíos: **120** (25 motorizados + 95 manuales)
- Torres TETRA: **37**
- Fibra óptica: **594 km**
- Pasos a nivel: **146** (9 Tipo C + 15 Tipo B + 122 Tipo A)
- Señalización: **VIRTUAL** (0 eurobalises, 0 señales LED en vía)

