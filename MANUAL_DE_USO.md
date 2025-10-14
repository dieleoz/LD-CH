# MANUAL DE USO - SISTEMA WBS INTERACTIVO
## APP La Dorada-Chiriguaná
## Para Usuarios No Técnicos

**Versión:** 1.0  
**Fecha:** 12 de Octubre 2025  
**Audiencia:** Especialistas, PMO, Gerencia, Stakeholders

---

## 🎯 ¿QUÉ ES ESTE SISTEMA?

El **Sistema WBS Interactivo** es una herramienta web que te permite:

✅ Ver el presupuesto del proyecto ($307.5B COP)  
✅ Consultar 2,186 equipos del layout con filtros  
✅ Analizar 17 riesgos del proyecto  
✅ Ver el cronograma de 60 meses  
✅ Proponer cambios técnicos mediante "Decisiones Técnicas" (DTs)  
✅ Descargar documentos en Word o HTML

**NO necesitas saber programar para usarlo.**

---

## 🚀 INICIO RÁPIDO (3 PASOS)

### PASO 1: Acceder al Sistema

**Opción A: Portal Web (Recomendado)**
1. Abrir navegador (Chrome, Edge, Firefox)
2. Ir a: https://dieleoz.github.io/LD-CH/
3. Ingresar credenciales (solicitar a PMO si no las tienes)
4. Click en "Acceder al Sistema"

**Opción B: Archivo Local**
1. Abrir carpeta del proyecto
2. Doble click en: `IX. WBS y Planificacion/WBS_Menu_Principal.html`
3. Se abre en tu navegador

---

### PASO 2: Explorar las Interfaces

Verás **6 tarjetas** con opciones:

| Tarjeta | ¿Para qué sirve? |
|:--------|:----------------|
| 🎛️ **Portal WBS Principal** | Acceso a todas las interfaces (empezar aquí) |
| 📘 **Documentación** | Ver el README completo |
| ⚠️ **Análisis de Riesgos** | Ver los 17 riesgos y sus planes |
| 📊 **Reporte Gerencial** | Ver Pareto 80/20 y Ruta Crítica |
| 📅 **Cronograma** | Ver planificación de 60 meses |
| 📄 **Documentos Servidos** | Descargar documentos en Word |

**Click en la que necesites** → Se abre en una nueva pestaña

---

### PASO 3: Usar la Interfaz

**Cada interfaz tiene:**
- 📊 **Visualización de datos** (tablas, gráficos)
- 🔍 **Filtros** (buscar lo que necesitas)
- 📤 **Botones de exportación** (PDF, Excel, Imprimir)
- 🏠 **Botón Inicio** (volver al menú)

---

## 📚 GUÍA POR PERFIL DE USUARIO

### 👷 **Si eres ESPECIALISTA TÉCNICO:**

**Usa principalmente:**
1. 🗺️ **Layout Maestro** - Ver/proponer cambios en equipos
2. 💰 **Presupuesto** - Ver cantidades y costos
3. 📋 **WBS Completa** - Ver todos los items con criterios

**Puedes:**
- ✅ Filtrar equipos por sistema, UFV, PK
- ✅ Generar Decisiones Técnicas (DTs) con 1 click
- ✅ Ver justificaciones técnicas de cantidades
- ✅ Ver alternativas evaluadas

**Ver guía:** [Guía de Decisiones Técnicas](#) (abajo)

---

### 📊 **Si eres PMO o GERENCIA:**

**Usa principalmente:**
1. ⚠️ **Análisis de Riesgos** - Monitorear 17 riesgos
2. 📊 **Reporte Gerencial** - Ver Pareto y Ruta Crítica
3. 📅 **Cronograma** - Ver planificación 60 meses
4. 💰 **Presupuesto** - Ver distribución de $307.5B

**Puedes:**
- ✅ Filtrar riesgos por nivel (Crítica/Alta/Media/Baja)
- ✅ Ver items WBS afectados por cada riesgo
- ✅ Identificar hitos críticos del cronograma
- ✅ Analizar Pareto (80% presupuesto en 29 items)

---

### 💼 **Si eres STAKEHOLDER o CLIENTE:**

**Usa principalmente:**
1. 📄 **Documentos Servidos** - Descargar entregables
2. 📊 **Reporte Gerencial** - Resumen ejecutivo
3. 💰 **Presupuesto** - Ver inversión total

**Puedes:**
- ✅ Descargar documentos en Word (.docx)
- ✅ Ver documentos en HTML (navegador)
- ✅ Imprimir reportes en PDF
- ✅ Ver estado general del proyecto

---

## 🗺️ CÓMO USAR EL LAYOUT MAESTRO

### ¿Qué es el Layout Maestro?

Es una interfaz que muestra **todos los 2,186 equipos** del proyecto con su ubicación, especificaciones y sistema al que pertenecen.

---

### Abrir el Layout:

1. Ir a: `IX. WBS y Planificacion/WBS_Layout_Maestro.html`
2. O desde Portal WBS Principal → Click "Layout Maestro"

---

### Usar los Filtros:

#### **Paso 1: Filtrar por Tipo de Equipo**
```
┌──────────────────────────┐
│ Tipo de Equipo:          │
│ ▼ TELECOMUNICACIONES     │
└──────────────────────────┘
```
**Opciones:**
- TELECOMUNICACIONES
- CONTROL
- EQUIPO ITS
- ENERGIA
- CIVIL

#### **Paso 2: Filtrar por Sistema** (se actualiza automáticamente)
```
┌──────────────────────────┐
│ Sistema:                 │
│ ▼ Fibra                  │
└──────────────────────────┘
```
**Ejemplo:** Si elegiste TELECOMUNICACIONES, verás:
- Fibra
- TETRA
- GSM-R
- ODF
- Nodo

#### **Paso 3: Filtrar por UFV** (opcional)
```
┌──────────────────────────┐
│ UFV:                     │
│ ▼ UFVF26                 │
└──────────────────────────┘
```

#### **Paso 4: Buscar por PK** (opcional)
```
┌──────────────────────────┐
│ Buscar PK:               │
│ [  201+500           ]   │
└──────────────────────────┘
```

---

### Leer la Tabla de Resultados:

**Columnas:**
| Columna | ¿Qué muestra? |
|:--------|:-------------|
| **Tipo** | Categoría del equipo (TELECOMUNICACIONES, CONTROL, etc.) |
| **Sistema** | Sistema específico (Fibra, TETRA, CTC, CCTV, etc.) |
| **Descripción** | Nombre completo del equipo |
| **UFV** | Unidad Funcional de Vía (sector del corredor) |
| **PK** | Progresiva kilométrica (ubicación exacta) |
| **Especificaciones** | Detalles técnicos del equipo |
| **Acciones** | Botón para generar DT |

---

### Generar una Decisión Técnica (DT):

**Ver sección completa:** [Guía de Decisiones Técnicas](#-guía-de-decisiones-técnicas)

---

## 💰 CÓMO USAR EL PRESUPUESTO INTERACTIVO

### Abrir:
1. Ir a: `IX. WBS y Planificacion/WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguaná.html`
2. O desde Portal → Click "Presupuesto Interactivo"

---

### Navegar:

**Vista por Capítulos:**
- Capítulo 1: CONTROL Y SEÑALIZACIÓN
- Capítulo 2: TELECOMUNICACIONES
- Capítulo 3: ITS Y SEGURIDAD
- Capítulo 4: MATERIAL RODANTE
- Capítulo 5: INFRAESTRUCTURA OPERATIVA
- Capítulo 6: INTEGRACIÓN Y COORDINACIÓN

**Click en un capítulo** → Se expande mostrando items

---

### Entender las Columnas:

| Columna | ¿Qué significa? |
|:--------|:---------------|
| **Item** | Código WBS (ej: 1.1.100) |
| **Descripción** | Qué es el item |
| **Unidad** | Unidad de medida (UND, km, GL) |
| **Cantidad** | Cuántos necesitas |
| **VU (Valor Unitario)** | Precio por unidad |
| **Total** | Cantidad × VU |
| **Tipo** | SUMINISTRO / OBRA / SERVICIO |

---

### Exportar:

**Botones disponibles:**
- 📄 **Imprimir PDF** → Abre ventana de impresión
- 📊 **Exportar Excel** → Descarga archivo .xlsx
- 🏠 **Inicio** → Volver al menú principal

---

## ⚠️ CÓMO USAR EL ANÁLISIS DE RIESGOS

### Abrir:
1. Ir a: `IX. WBS y Planificacion/WBS_Analisis_Riesgos.html`

---

### Ver Riesgos:

**Tabla principal muestra:**
- **ID:** Identificador único (R-FIBRA-001, R-ITCS-001, etc.)
- **Descripción:** Qué puede salir mal
- **Probabilidad:** Alta / Media / Baja
- **Impacto:** Alto / Medio / Bajo
- **Exposición:** Prob × Impacto (calculado automáticamente)
- **Nivel:** CRÍTICA 🔴 / ALTA 🟡 / MEDIA 🟠 / BAJA 🟢
- **Estrategia:** EVITAR / MITIGAR / TRANSFERIR / ACEPTAR / ASUMIR
- **Items WBS:** Qué items están afectados
- **Plan de Acción:** Qué hacer AHORA

---

### Filtrar por Nivel:

**Botones en la parte superior:**
- 🔴 **CRÍTICA** → Muestra solo riesgos críticos (3)
- 🟡 **ALTA** → Muestra riesgos altos (2)
- 🟠 **MEDIA** → Muestra riesgos medios (9)
- 🟢 **BAJA** → Muestra riesgos bajos (3)
- ⚪ **TODOS** → Muestra los 17 riesgos

---

## 📅 CÓMO USAR EL CRONOGRAMA

### Abrir:
1. Ir a: `IX. WBS y Planificacion/WBS_Cronograma_Propuesta.html`

---

### Información Mostrada:

#### **Fases del Proyecto (8 fases):**
1. INGENIERÍA (Meses 0-12)
2. ADQUISICIONES URGENTES (Meses 12-14)
3. OBRA - PREPARACIÓN (Meses 13-18)
4. INSTALACIÓN PRIMARIA (Meses 19-26)
5. INSTALACIÓN SECUNDARIA (Meses 25-34)
6. INTEGRACIÓN Y PRUEBAS (Meses 32-44)
7. PUESTA EN MARCHA (Meses 44-48)
8. BUFFER RIESGOS (Meses 49-60)

#### **Hitos Críticos (11 hitos):**
- H1: Aprobación ANI Diseños (Mes 12) 🔴 EXTERNO
- H2: Órdenes Lote 1-2 Emitidas (Mes 13)
- H4: Edificio CCO Entregado (Mes 18) 🔴 EXTERNO
- H5: Material Rodante Certificado (Mes 20) 🔴 EXTERNO
- H10: SAT Completo (Mes 44) 🔴 EXTERNO
- H11: Entrega Final (Mes 48) 🔴 EXTERNO

**🔴 EXTERNO:** Depende de terceros (ANI, FENOCO, proveedores)

#### **Ruta Crítica:**
```
M12: Aprobación ANI
  ↓
M13: Orden ATP/ITCS (lead 12m) + Fibra (lead 9m)
  ↓
M18: Edificio CCO (EXT-01)
  ↓
M20: Material Rodante (EXT-02)
  ↓
M44: SAT
  ↓
M48: ENTREGA FINAL
```

**Duración total:** 60 meses (48 base + 12 buffer)

---

## 📤 CÓMO DESCARGAR DOCUMENTOS

### Paso 1: Ir a Documentos Servidos

1. Desde Portal WBS → Click "Documentos Servidos"
2. O abrir: `X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/index.html`

---

### Paso 2: Seleccionar Documento

**Documentos disponibles (28):**
- 13 Documentos base
- 6 Sistemas ejecutivos
- 5 Especialidades
- 2 Gestión
- 2 Actualizados con DTs

**Cada documento muestra:**
- 📅 Fecha de actualización
- 📄 Nombre del documento
- 🔽 Botón "Descargar Word"
- 👁️ Botón "Ver HTML"

---

### Paso 3: Descargar

**Para Word (.docx):**
- Click en "📥 Descargar Word"
- Se descarga archivo .docx
- Abrir con Microsoft Word

**Para HTML:**
- Click en "👁️ Ver HTML"
- Se abre en navegador
- Puedes imprimir con Ctrl+P

---

## 🆘 PREGUNTAS FRECUENTES

### ❓ ¿Cómo actualizo las cantidades del presupuesto?

**Respuesta:**
1. Las cantidades se actualizan desde el **archivo Excel** (fuente oficial)
2. Luego se ejecuta: `.\scripts\sync_wbs_simple.ps1`
3. Esto regenera todos los archivos JSON/JS automáticamente
4. Recargar las interfaces HTML (Ctrl+Shift+F5)

**Nota:** Si no tienes acceso a Excel, genera una **Decisión Técnica (DT)** para proponer el cambio.

---

### ❓ ¿Cómo propongo un cambio técnico?

**Respuesta:** Genera una **Decisión Técnica (DT)**

**Ver guía completa:** [Guía de Decisiones Técnicas](#) (sección siguiente)

**Resumen:**
1. Abrir Layout Maestro
2. Filtrar elementos afectados
3. Click "Crear DT desde Filtro"
4. Completar observación y justificación
5. Descargar archivo DT.md
6. Enviar a PMO para aprobación

---

### ❓ ¿Cómo veo qué items están en riesgo?

**Respuesta:**
1. Abrir: WBS_Analisis_Riesgos.html
2. Ver columna "Items WBS Afectados"
3. Ejemplo: R-ITCS-001 afecta items 1.1.100, 1.1.103, 1.2.100

**Para ver detalle de un item:**
1. Abrir: WBS_Presupuesto.html
2. Buscar el código (ej: 1.1.100)
3. Ver descripción, cantidad, costo

---

### ❓ ¿Por qué mis cambios no se ven en las interfaces?

**Razón:** Cache del navegador

**Solución:**
1. Presionar **Ctrl + Shift + F5** (recarga forzada)
2. O cerrar navegador y volver a abrir
3. O abrir en modo incógnito (Ctrl+Shift+N)

---

### ❓ ¿Cómo sé cuándo fue la última actualización?

**Respuesta:**
- Abrir cualquier interfaz HTML
- Abrir consola del navegador (F12)
- Ver mensajes como:
  ```
  ✅ Cronograma PMO cargado
  📅 Última actualización: 2025-10-12
  ```

O revisar el archivo:
- `IX. WBS y Planificacion/datos_wbs_TODOS_items.json`
- Primera línea: `"fecha_actualizacion": "2025-10-12"`

---

### ❓ ¿A quién contacto si tengo problemas?

**Soporte técnico:**
- Email: pmo@proyecto-ld-ch.com
- Para problemas de acceso: Contactar PMO
- Para problemas técnicos: Equipo TI

---

## 🎓 TUTORIALES PASO A PASO

### Tutorial 1: Buscar un Equipo Específico en el Layout

**Objetivo:** Encontrar información de una caja de empalme en PK 350+200

1. Abrir `WBS_Layout_Maestro.html`
2. En **"Tipo de Equipo"** → Seleccionar: TELECOMUNICACIONES
3. En **"Sistema"** → Seleccionar: Fibra
4. En **"Buscar PK"** → Escribir: 350+200
5. Presionar Enter
6. La tabla muestra solo elementos cercanos a ese PK
7. Ver especificaciones en la columna correspondiente

---

### Tutorial 2: Ver Riesgos de un Sistema Específico

**Objetivo:** Ver todos los riesgos que afectan al sistema de Fibra Óptica

1. Abrir `WBS_Analisis_Riesgos.html`
2. Buscar en la columna "Items WBS Afectados"
3. Buscar items que empiecen con "2.3." (capítulo de Fibra)
4. Identificados:
   - R-FIBRA-001 → Items 2.3.100, 2.3.103
   - R-FIBRA-006 → Items 2.3.100, 2.3.103
   - R-FM-001 → Items 2.3.100, 2.3.103 (entre otros)
   - R-GES-004 → Items 2.3.100 (entre otros)
   - R-CAL-001 → Items 2.3.100, 2.3.103 (entre otros)

**Resultado:** 5 riesgos afectan la Fibra Óptica

---

### Tutorial 3: Descargar Reporte Gerencial en PDF

**Objetivo:** Imprimir el Reporte Gerencial para una reunión

1. Abrir `WBS_Reporte_Gerencial.html`
2. Click en botón "📄 Imprimir PDF" (esquina superior derecha)
3. Se abre ventana de impresión del navegador
4. Seleccionar:
   - Destino: "Guardar como PDF"
   - Diseño: Horizontal (recomendado)
   - Márgenes: Mínimos
5. Click "Guardar"
6. Elegir ubicación y nombre
7. Listo para presentar

---

## 🔄 FLUJO DE TRABAJO TÍPICO

### Para Especialista Técnico:

```
1. Recibo solicitud de revisar cantidades de TETRA
   ↓
2. Abro Layout Maestro → Filtro por TETRA
   ↓
3. Veo 37 estaciones (correcto según diseño)
   ↓
4. Si necesito cambiar → Genero DT
   ↓
5. Envío DT a PMO para aprobación
   ↓
6. PMO ejecuta DT → Sistema se actualiza
   ↓
7. Verifico en Layout → Todo actualizado ✅
```

---

### Para PMO:

```
1. Recibo DT del especialista
   ↓
2. Reviso justificación técnica
   ↓
3. Si apruebo → Ejecuto:
   .\scripts\servir_ingenieria_completo.ps1
   ↓
4. Sistema detecta DT → Ejecuta cambios
   ↓
5. Verifico log de ejecución
   ↓
6. Sincronizo interfaces:
   .\scripts\sincronizar_SISTEMA_COMPLETO_v14.3.ps1
   ↓
7. Notifico al especialista ✅
```

---

## ⚙️ COMANDOS PRINCIPALES

**Para usuarios técnicos que usan la terminal:**

### Sincronizar Sistema Completo:
```powershell
.\scripts\sincronizar_SISTEMA_COMPLETO_v14.3.ps1
```
**Qué hace:** Actualiza riesgos, reporte y cronograma (~6 segundos)

---

### Cocinar y Servir Documentos:
```powershell
.\scripts\servir_ingenieria_completo.ps1
```
**Qué hace:** Workflow completo (detecta DTs → cocina → sirve → genera Word/HTML)

---

### Validar Entorno:
```powershell
.\scripts\validar_entorno.ps1
```
**Qué hace:** Verifica que tengas PowerShell 7.2+, Pandoc, módulos necesarios

---

### Cocinar Solo un Sistema:
```powershell
.\scripts\cocinar_v2.ps1 -Sistema 02 -ConLogs
```
**Qué hace:** Consolida solo Sistema 02 (Telecomunicaciones) con logging

---

## 📞 CONTACTO Y SOPORTE

**PMO del Proyecto:**
- Email: pmo@proyecto-ld-ch.com
- Para: Solicitud de credenciales, aprobación de DTs

**Soporte Técnico:**
- Email: ti@proyecto-ld-ch.com
- Para: Problemas técnicos, errores del sistema

**Gerencia:**
- Para: Aprobaciones gerenciales, cambios >10% presupuesto

---

## 📚 DOCUMENTOS RELACIONADOS

**Guías:**
- `GUIA_DECISIONES_TECNICAS.md` - Cómo generar y usar DTs
- `ARCHITECTURE.md` - Arquitectura técnica del sistema
- `README.md` - Documentación completa

**Técnicos:**
- `scripts/REQUISITOS_SISTEMA.md` - Requisitos de instalación
- `scripts/DOCUMENTACION_LOGGER.md` - Uso del módulo Logger
- `.cursorrules` - Reglas de ejecución de DTs

---

**Manual creado:** 12 de Octubre 2025  
**Versión:** 1.0  
**Audiencia:** Usuarios finales (no técnicos)  
**Próxima actualización:** Según feedback de usuarios

