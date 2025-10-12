# 🗺️ INTEGRACIÓN DE LAYOUT EN SISTEMA "COCINAR → SERVIR"

**Versión:** 2.0  
**Fecha:** 11 de Octubre 2025  
**Tipo:** Documentación Técnica  
**Estado:** ✅ OPERATIVO

---

## 📋 RESUMEN EJECUTIVO

La **integración de Layout** permite que los documentos ejecutivos incluyan automáticamente tablas con el inventario de equipos físicos ubicados por PK (Punto Kilométrico) y UFV (Unidad Funcional de Vía), extraídos del **Layout Maestro** del proyecto.

### ¿Qué problema resuelve?

**ANTES:**
- Documentos técnicos describían sistemas pero NO mostraban dónde estaban físicamente
- Layout separado del resto de documentación
- Cliente tenía que consultar múltiples archivos para ubicar equipos

**DESPUÉS:**
- Documentos ejecutivos incluyen **automáticamente** el layout relevante
- Filtrado inteligente por tipo de equipo (CONTROL, TELECOMUNICACIONES, etc.)
- Una sola fuente de verdad: `LAYOUT_MAESTRO_EQUIPOS_v1.0.md`
- Cliente ve QUÉ hay y DÓNDE está en un solo documento

---

## 🎯 CÓMO FUNCIONA

### Arquitectura del Flujo

```
┌──────────────────────────────────────────────────────┐
│  LAYOUT MAESTRO (Fuente Única)                      │
│  VIII/LAYOUT_MAESTRO_EQUIPOS_v1.0.md                │
│  800+ equipos con UFV, PK, Tipo_Equipo, etc.        │
└──────────────────────────────────────────────────────┘
                        ↓
                 (servir.ps1 lee)
                        ↓
┌──────────────────────────────────────────────────────┐
│  DOCUMENTOS EJECUTIVOS (Cocina)                      │
│  X/7_SISTEMAS_EJECUTIVOS/*.md                        │
│  Contienen marcadores: <!-- INJECT_LAYOUT: ... -->   │
└──────────────────────────────────────────────────────┘
                        ↓
              (servir.ps1 procesa)
                        ↓
        1. Detecta marcadores en .md
        2. Filtra layout según criterio
        3. Inyecta tabla Markdown
        4. Genera Word/HTML
                        ↓
┌──────────────────────────────────────────────────────┐
│  DOCUMENTOS SERVIDOS (Platos)                        │
│  X/8_DOCUMENTOS_SERVIDOS/                           │
│  Word + HTML con layout integrado automáticamente    │
└──────────────────────────────────────────────────────┘
```

---

## 📝 SINTAXIS DE MARCADORES

### Formato General

```markdown
<!-- INJECT_LAYOUT: <criterio_filtro> -->
```

### Ejemplos de Marcadores

#### 1. Filtrar por Tipo de Equipo (uno o varios)

```markdown
<!-- INJECT_LAYOUT: Tipo_Equipo=CONTROL -->
<!-- INJECT_LAYOUT: Tipo_Equipo=CONTROL,SEÑALIZACION -->
<!-- INJECT_LAYOUT: Tipo_Equipo=TELECOMUNICACIONES -->
<!-- INJECT_LAYOUT: Tipo_Equipo=EQUIPO ITS,SEGURIDAD -->
```

**Resultado:** Muestra solo los equipos cuyo campo `Tipo_Equipo` coincida con los valores especificados.

#### 2. Mostrar TODO el Layout

```markdown
<!-- INJECT_LAYOUT: ALL -->
```

**Resultado:** Muestra todos los 800+ equipos del layout maestro.

---

## 🛠️ GUÍA DE USO PASO A PASO

### Paso 1: Agregar Marcador al Documento Ejecutivo

Edita el archivo `.md` en `X/7_SISTEMAS_EJECUTIVOS/` y agrega una sección al final:

```markdown
---

## 📋 ANEXO: Layout de Equipos de [Nombre del Sistema]

<!-- INJECT_LAYOUT: Tipo_Equipo=CONTROL,SEÑALIZACION -->

---

**Documento preparado por:** ...
```

**Ubicación recomendada:** Justo antes del footer del documento.

### Paso 2: Ejecutar servir.ps1

```powershell
# Servir todos los documentos
.\scripts\servir.ps1 -Todo

# O servir solo un sistema específico
.\scripts\servir.ps1 -Sistema 01
```

### Paso 3: Verificar el Resultado

**En el Word/HTML generado verás:**

```
## 📋 ANEXO: Layout de Equipos de Control y Señalización

| UFV | Implementacion | Nombre_Tablero | Ubicacion_PK | Descripcion | ... |
|:----|:---------------|:---------------|:-------------|:------------|-----|
| UFV23 | 2.1 | CTC_MEXICO | 201+470 | Puesto Control CTC | ... |
| UFV23 | 2.1 | BALIZA_MEX_01 | 201+470 | Baliza ETCS Entrada | ... |
| UFV23 | 2.1 | SEÑAL_MEX_01 | 201+500 | Señal Salida Norte | ... |
...

> **Total de equipos listados:** 285
> **Última actualización:** 11/10/2025 10:30
```

---

## 📁 MAPEO DE FILTROS POR SISTEMA

### Sistema 01: Control y Señalización

```markdown
<!-- INJECT_LAYOUT: Tipo_Equipo=CONTROL,SEÑALIZACION -->
```

**Incluye:**
- RBC (Radio Block Centers)
- CTC (Control de Tráfico Centralizado)
- Balizas ETCS
- Señales LED
- Enclavamientos

---

### Sistema 02: Telecomunicaciones

```markdown
<!-- INJECT_LAYOUT: Tipo_Equipo=TELECOMUNICACIONES -->
```

**Incluye:**
- Estaciones Base TETRA
- Nodos Fibra Óptica
- Empalmes FO
- Switches de acceso
- ODF (Optical Distribution Frame)

---

### Sistema 03: ITS y Seguridad

```markdown
<!-- INJECT_LAYOUT: Tipo_Equipo=EQUIPO ITS,SEGURIDAD -->
```

**Incluye:**
- Cámaras CCTV (PTZ, Fijas, Térmicas)
- HBD (Hot Box Detectors)
- WILD (Wheel Impact Load Detectors)
- Control de acceso biométrico
- Detección de incendio

---

### Sistema 05: Infraestructura Operativa

```markdown
<!-- INJECT_LAYOUT: Tipo_Equipo=ENERGIA,EDIFICACION,VIA,INFRAESTRUCTURA -->
```

**Incluye:**
- Subestaciones eléctricas
- UPS/SAI
- Estaciones, talleres, CCO
- Desvíos motorizados
- Puentes prioritarios

---

### Especialidad 04: Ingeniería de Sistemas (Layout Completo)

```markdown
<!-- INJECT_LAYOUT: ALL -->
```

**Incluye:** Todos los equipos del proyecto (800+)

---

## 🔧 FUNCIONES TÉCNICAS DE servir.ps1 v2.0

### 1. Parse-MarkdownTable

**Propósito:** Leer y parsear la tabla del layout maestro a objetos PowerShell

**Input:** Ruta al archivo `LAYOUT_MAESTRO_EQUIPOS_v1.0.md`

**Output:** Array de objetos con propiedades:
- UFV
- Implementacion
- Nombre_Tablero
- Ubicacion_PK
- Descripcion
- Ubicacion_Lado
- Direccion
- Tipo_Equipo
- Dispositivo
- Switch_Acceso
- Tipo_ITS
- Latitud_X
- Longitud_Y

**Lógica:**
```powershell
# Busca patrón: ## 📍 TABLA MAESTRA - EQUIPOS POR PK
# Extrae header de columnas
# Parsea cada fila como objeto
# Retorna array de objetos
```

---

### 2. Filter-Layout

**Propósito:** Filtrar equipos según criterio del marcador

**Input:** 
- `$LayoutData`: Array de objetos
- `$FilterString`: Ej. "Tipo_Equipo=CONTROL,SEÑALIZACION"

**Output:** Array filtrado de objetos

**Lógica:**
```powershell
# Si FilterString = "ALL" → Retorna todo
# Si FilterString = "Campo=Valor1,Valor2" →
#   1. Extrae campo y valores
#   2. Filtra objetos donde objeto.Campo está en [Valor1, Valor2]
#   3. Retorna objetos filtrados
```

---

### 3. ConvertTo-MarkdownTable

**Propósito:** Convertir objetos de PowerShell a tabla Markdown

**Input:** Array de objetos

**Output:** String con tabla Markdown formateada

**Lógica:**
```powershell
# Extrae nombres de propiedades → Header
# Genera línea separadora (|:---|:---|)
# Convierte cada objeto a fila (| valor1 | valor2 |)
# Agrega footer con total y fecha
```

---

### 4. Process-LayoutInjection

**Propósito:** Detectar marcadores en contenido Markdown y reemplazarlos con layout

**Input:** 
- `$ContenidoMd`: Contenido completo del documento
- `$LayoutData`: Datos del layout maestro

**Output:** Contenido con marcadores reemplazados por tablas

**Lógica:**
```powershell
# Regex busca: <!-- INJECT_LAYOUT: (.+?) -->
# Para cada marcador encontrado:
#   1. Extrae criterio de filtro
#   2. Filtra layout según criterio
#   3. Convierte a tabla Markdown
#   4. Reemplaza marcador con tabla
# Retorna contenido modificado
```

---

## 📊 EJEMPLO COMPLETO DE EJECUCIÓN

### Archivo Ejecutivo ANTES (SISTEMA_02_Telecomunicaciones_EJECUTIVO.md)

```markdown
...

## 📋 CUMPLIMIENTO CONTRACTUAL
- ✅ AT1: Alcance - Cumplida
...

<!-- INJECT_LAYOUT: Tipo_Equipo=TELECOMUNICACIONES -->

---

**Documento preparado por:** Admin. Contractual EPC
```

### Ejecutar Script

```powershell
PS> .\scripts\servir.ps1 -Sistema 02

================================================================
  SERVIR v2.0 - Documentos + Layout Integrado
================================================================

Modo: SERVIR SOLO SISTEMA_02
Documentos a servir: 1

Cargando Layout Maestro...
  Cargando layout maestro...
  Layout cargado: 634 equipos

Sirviendo: SISTEMA_02_Telecomunicaciones_EJECUTIVO
  Procesando 1 marcador(es) de layout...
  Inyectando layout: Tipo_Equipo=TELECOMUNICACIONES
  Filtro: Tipo_Equipo en [TELECOMUNICACIONES]
  Equipos filtrados: 87
  Layout inyectado exitosamente
  Word: 142.3 KB
  HTML: 198.5 KB

================================================================
  PLATOS SERVIDOS CON LAYOUT
================================================================

Documentos servidos:
  Word: 1 platos
  HTML: 1 platos
  Total: 2 archivos

Layout integrado:
  Documentos con layout: 1
  Equipos en layout maestro: 634

PLATOS SERVIDOS Y LISTOS PARA CLIENTE!
```

### Documento Servido DESPUÉS (SISTEMA_02_Telecomunicaciones_EJECUTIVO.docx)

```markdown
...

## 📋 ANEXO: Layout de Equipos de Telecomunicaciones

| UFV | Implementacion | Nombre_Tablero | Ubicacion_PK | Descripcion | Ubicacion_Lado | Direccion | Tipo_Equipo | Dispositivo | Switch_Acceso | Tipo_ITS | Latitud_X | Longitud_Y |
|:----|:---------------|:---------------|:-------------|:------------|:---------------|:----------|:------------|:------------|:--------------|:---------|:----------|:-----------|
| UFV23 | 2.1 | EBT_01_MEXICO | 201+470 | Estación Base TETRA 01 | Derecha | PK201+470 Derecha | TELECOMUNICACIONES | TETRA BS | SWA_MEX_01 | TIPO 5 | TBD | TBD |
| UFV23 | 2.1 | NODO_FO_MEXICO | 201+470 | Nodo Fibra Óptica | Centro | PK201+470 Centro | TELECOMUNICACIONES | ODF 48 hilos | SWA_MEX_01 | TIPO 5 | TBD | TBD |
| UFV23 | 2.1 | EMPALME_FO_01 | 210+000 | Empalme Fibra Óptica | Derecha | PK210+000 Derecha | TELECOMUNICACIONES | Caja Empalme | N/A | N/A | TBD | TBD |
| UFV23 | 2.1 | EMPALME_FO_02 | 225+000 | Empalme Fibra Óptica | Izquierda | PK225+000 Izquierda | TELECOMUNICACIONES | Caja Empalme | N/A | N/A | TBD | TBD |
...
(87 filas totales)

> **Total de equipos listados:** 87
> **Última actualización:** 11/10/2025 10:45

---

**Documento preparado por:** Admin. Contractual EPC
```

---

## 🔍 VENTAJAS DE ESTA INTEGRACIÓN

### Para el Cliente

✅ **Un solo documento**: Descripción técnica + ubicación física de equipos  
✅ **Actualización automática**: Cambios en layout → automáticos en documentos  
✅ **Trazabilidad completa**: QUÉ equipo, DÓNDE está, QUÉ PK, QUÉ UFV  
✅ **Formato profesional**: Tabla Word/HTML lista para imprimir/compartir  

### Para el Equipo Técnico

✅ **Cero trabajo manual**: No copiar/pegar layout en cada documento  
✅ **Fuente única de verdad**: Layout maestro actualizado = todos los docs actualizados  
✅ **Filtrado inteligente**: Solo muestra equipos relevantes por sistema  
✅ **Escalable**: Fácil agregar nuevos sistemas o filtros  

### Para el PMO

✅ **Coherencia garantizada**: Layout siempre sincronizado con documentos  
✅ **Auditoría simplificada**: Un archivo layout → múltiples docs  
✅ **Entregables completos**: Cliente recibe descripción + ubicación en un solo archivo  

---

## 🎯 CASOS DE USO

### Caso 1: Ingeniero de Detalle Revisa SISTEMA_01

**Necesidad:** "Quiero ver dónde están todas las balizas ETCS"

**Solución:**
1. Abre `SISTEMA_01_Control_y_Senalizacion_EJECUTIVO.docx`
2. Va a sección "📋 ANEXO: Layout de Equipos"
3. Ve tabla con todas las balizas, PK, UFV, tipo

**Beneficio:** No necesita buscar en Excel ni otros archivos.

---

### Caso 2: Cliente (ANI) Audita Telecomunicaciones

**Necesidad:** "Necesito validar que las 37 estaciones TETRA están ubicadas correctamente"

**Solución:**
1. Abre `SISTEMA_02_Telecomunicaciones_EJECUTIVO.docx`
2. Revisa "§ ¿Por qué 37 estaciones TETRA?"
3. Valida con tabla de layout integrada (PK, coordenadas)

**Beneficio:** Un solo documento para descripción técnica + ubicación física.

---

### Caso 3: PMO Genera Entrega Mensual

**Necesidad:** "Debo entregar 6 sistemas con layout actualizado"

**Solución:**
1. Ejecuta `.\scripts\servir.ps1 -Todo`
2. Script automáticamente inyecta layout en todos los docs
3. Genera 13 Word + 13 HTML en 2 minutos

**Beneficio:** Cero trabajo manual, layout siempre actualizado.

---

## ⚠️ NOTAS IMPORTANTES

### 1. Layout Maestro es la Fuente de Verdad

**Regla:** NUNCA editar layout en documentos ejecutivos. Siempre actualizar `LAYOUT_MAESTRO_EQUIPOS_v1.0.md` y regenerar documentos.

### 2. Marcadores NO Son Visibles en Word/HTML

Los marcadores `<!-- INJECT_LAYOUT: ... -->` son comentarios HTML, por lo que:
- ✅ Se procesan automáticamente en `servir.ps1`
- ✅ NO aparecen en Word/HTML final
- ✅ Cliente ve solo la tabla inyectada

### 3. Layout se Inyecta al "Servir", NO al "Cocinar"

**Flujo correcto:**
1. `cocinar.ps1`: Regenera ejecutivos desde fuentes (sin layout)
2. `servir.ps1`: Inyecta layout y genera Word/HTML

**Razón:** Layout es información de despliegue, no de diseño técnico.

### 4. Filtros Deben Coincidir con Valores en Layout

**Correcto:**
```markdown
<!-- INJECT_LAYOUT: Tipo_Equipo=TELECOMUNICACIONES -->
```

**Incorrecto (no coincide con layout):**
```markdown
<!-- INJECT_LAYOUT: Tipo_Equipo=TELECOM -->  ← TELECOM no existe en layout
```

**Solución:** Revisar valores exactos de `Tipo_Equipo` en `LAYOUT_MAESTRO_EQUIPOS_v1.0.md`.

---

## 🔄 ACTUALIZAR EL LAYOUT MAESTRO

### Cuándo Actualizar

- ✅ Nueva DT modifica cantidad de equipos
- ✅ Cambio de ubicación de equipos
- ✅ Nuevos equipos agregados al proyecto
- ✅ Levantamiento topográfico actualiza coordenadas

### Cómo Actualizar

1. Editar `VIII. Documentos Maestros y Metodologia/LAYOUT_MAESTRO_EQUIPOS_v1.0.md`
2. Modificar tabla en sección "## 📍 TABLA MAESTRA - EQUIPOS POR PK"
3. Actualizar versión en header (v1.0 → v1.1)
4. Ejecutar `.\scripts\servir.ps1 -Todo`
5. Verificar que layout se refleja en documentos generados

---

## 📚 ARCHIVOS RELACIONADOS

| Archivo | Propósito | Ubicación |
|:--------|:----------|:----------|
| **LAYOUT_MAESTRO_EQUIPOS_v1.0.md** | Fuente de verdad del layout | VIII. Documentos Maestros y Metodologia/ |
| **servir.ps1 v2.0** | Script que inyecta layout | scripts/ |
| **SISTEMA_XX_EJECUTIVO.md** | Documentos con marcadores | X/7_SISTEMAS_EJECUTIVOS/ |
| **SISTEMA_XX_EJECUTIVO.docx** | Word con layout inyectado | X/8_DOCUMENTOS_SERVIDOS/WORD/ |
| **SISTEMA_XX_EJECUTIVO.html** | HTML con layout inyectado | X/8_DOCUMENTOS_SERVIDOS/HTML/ |

---

## 🎓 GLOSARIO

| Término | Definición |
|:--------|:-----------|
| **Layout Maestro** | Archivo `LAYOUT_MAESTRO_EQUIPOS_v1.0.md` con inventario completo de equipos por PK |
| **Marcador INJECT_LAYOUT** | Comentario HTML `<!-- INJECT_LAYOUT: ... -->` que indica dónde inyectar layout |
| **Filtro** | Criterio para seleccionar equipos (ej. `Tipo_Equipo=CONTROL`) |
| **PK (Punto Kilométrico)** | Ubicación en el corredor (ej. PK201+470) |
| **UFV (Unidad Funcional de Vía)** | Segmento geográfico del proyecto (ej. UFV23) |
| **Tipo_Equipo** | Categoría de equipo (CONTROL, TELECOMUNICACIONES, EQUIPO ITS, etc.) |

---

## 📞 SOPORTE

### Para preguntas sobre layout:
- **Responsable Layout:** Admin. Contractual EPC
- **Coordinador Topografía:** Equipo Topografía

### Para preguntas técnicas sobre script:
- **PMO:** Gestión de scripts
- **DevOps:** Soporte técnico PowerShell

---

**Documento creado:** 11 de Octubre 2025  
**Autor:** Admin. Contractual EPC  
**Versión:** 1.0  
**Estado:** ✅ OPERATIVO

---

## 🎉 CONCLUSIÓN

La **integración de Layout** en el sistema "Cocinar → Servir" representa un **salto cualitativo** en la calidad de los entregables del proyecto:

- ✅ **Automatización completa**: Layout se inyecta automáticamente
- ✅ **Fuente única de verdad**: Un archivo layout → todos los docs
- ✅ **Cliente satisfecho**: Documentos completos con QUÉ y DÓNDE
- ✅ **Trazabilidad total**: DT → Layout → Documentos → Cliente

**Replicable a cualquier proyecto de infraestructura con múltiples equipos distribuidos geográficamente.** 🚀

