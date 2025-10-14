# ARQUITECTURA DEL SISTEMA WBS INTERACTIVO
## Proyecto APP La Dorada-Chiriguaná
## Versión: v14.7.6

**Fecha de actualización:** 14 de Octubre 2025  
**Responsable:** Equipo Técnico / Arquitectura de Software  
**Estado:** ✅ Sistema en producción - Bugs críticos corregidos

---

## 📋 TABLA DE CONTENIDOS

1. [Visión General](#-visión-general)
2. [Arquitectura en 4 Capas](#-arquitectura-en-4-capas)
3. [Flujo de Datos](#-flujo-de-datos)
4. [Componentes Principales](#-componentes-principales)
5. [Metáfora Cocinar → Servir](#-metáfora-cocinar--servir)
6. [Sistema de Decisiones Técnicas (DT)](#-sistema-de-decisiones-técnicas-dt)
7. [Sincronización Automática](#-sincronización-automática)
8. [Módulos Reutilizables](#-módulos-reutilizables)
9. [Seguridad](#-seguridad)
10. [Escalabilidad](#-escalabilidad)

---

## 🎯 VISIÓN GENERAL

El **Sistema WBS Interactivo** es una plataforma integral de gestión de proyectos EPC (Engineering, Procurement, Construction) que combina:

- 📊 **WBS Presupuestal** con $307.5B COP (159 items)
- 🗺️ **Layout de Equipamiento** con 2,182 elementos (9 tipos)
- ⚠️ **Gestión de Riesgos** con 17 riesgos activos
- 📋 **Decisiones Técnicas** (Event Sourcing)
- 🔄 **Sincronización Automática** desde Excel
- 🎨 **8 Interfaces HTML** dinámicas
- ✅ **Encoding UTF-8** corregido en criterios técnicos

**Objetivo:** Mantener coherencia técnica entre presupuesto, ingeniería, layout y documentación mediante automatización completa.

---

## 🏗️ ARQUITECTURA EN 4 CAPAS

El sistema sigue el patrón **Clean Architecture** con separación clara de responsabilidades:

```
┌─────────────────────────────────────────────────────────────────┐
│  CAPA 1: FUENTES DE VERDAD (Inmutables)                        │
├─────────────────────────────────────────────────────────────────┤
│  • Excel Presupuestal (externa - única fuente de cantidades)   │
│  • Contrato y Apéndices Técnicos (I-II)                        │
│  • Ingeniería Conceptual/Básica/Detalle (III-V)                │
│  • Decisiones Técnicas .md (eventos inmutables)                 │
│  • Matrices Maestras (VIII/)                                    │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│  CAPA 2: TRANSFORMACIÓN (Scripts PowerShell)                   │
├─────────────────────────────────────────────────────────────────┤
│  • sync_wbs_simple.ps1 (Excel → JSON)                          │
│  • cocinar.ps1 / cocinar_v2.ps1 (Consolidación)                │
│  • servir.ps1 (Markdown → Word/HTML)                           │
│  • Sincronizadores (cronograma, riesgos, reporte)              │
│  • Scripts especializados (regenerar_fibra, TETRA, etc.)       │
│  • Módulos reutilizables (5 módulos)                           │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│  CAPA 3: DATOS INTERMEDIOS (Generados - No Editar)            │
├─────────────────────────────────────────────────────────────────┤
│  • datos_wbs_TODOS_items.json / .js (159 items)                │
│  • layout_datos.js (477 KB - 2,182 elementos)                  │
│  • criterios_tecnicos_base.json / .js (UTF-8)                  │
│  • cronograma_datos.json / .js (60 meses)                      │
│  • riesgos_wbs.json / .js (17 riesgos)                         │
│  • reporte_gerencial_data.js (Pareto 80/20)                    │
│  • wbs_metadata_enriquecida.js (metadata técnica)              │
│  • Logs JSON (auditoría)                                        │
│                                                                  │
│  ⚠️ NUNCA editar manualmente - regenerar con scripts            │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│  CAPA 4: VISUALIZACIÓN (Interfaces de Usuario)                 │
├─────────────────────────────────────────────────────────────────┤
│  • WBS_Menu_Principal.html (Dashboard)                         │
│  • WBS_Presupuesto_SCC.html (Presupuesto interactivo)         │
│  • WBS_Layout_Maestro.html (2,182 equipos - 9 tipos) ✅       │
│  • WBS_Cronograma_Propuesta.html (Gantt 60 meses)             │
│  • WBS_Analisis_Riesgos.html (17 riesgos)                     │
│  • WBS_Reporte_Gerencial.html (Pareto + Ruta Crítica)         │
│  • WBS_EDT_Detalle.html (Metadata enriquecida)                │
│  • WBS_COMPLETA_TODO_Interactiva_v4.0.html (134 items) ✅     │
│                                                                  │
│  • Portal Web (index.html) con autenticación segura            │
│  • Documentos .docx / .html para cliente                       │
│                                                                  │
│  ✅ v14.7.6: Bugs corregidos - Visualización completa          │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🔄 FLUJO DE DATOS

### Flujo Principal (Excel → Interfaces):

```
┌─────────────┐
│   EXCEL     │ ← Usuario actualiza cantidades/costos
│ (Fuente de  │
│   Verdad)   │
└──────┬──────┘
       │
       ↓ [sync_wbs_simple.ps1]
       │
┌──────▼────────────────────┐
│ datos_wbs_TODOS_items.json│ ← Fuente única centralizada
│          (95 KB)          │
└──────┬────────────────────┘
       │
       ├──→ [sincronizar_cronograma.ps1] → cronograma_datos.js → WBS_Cronograma.html
       │
       ├──→ [sincronizar_riesgos.ps1] → riesgos_wbs.js → WBS_Analisis_Riesgos.html
       │
       ├──→ [generar_reporte.ps1] → reporte_gerencial_data.js → WBS_Reporte.html
       │
       └──→ [transformación] → Carga directa en:
                              • WBS_Presupuesto.html
                              • WBS_COMPLETA_TODO.html
                              • WBS_EDT_Detalle.html
```

**Tiempo total de sincronización:** ~6 segundos (3 scripts en paralelo)

---

### Flujo Secundario (Decisiones Técnicas → Documentación):

```
┌──────────────────────┐
│   ESPECIALISTA       │
│  Genera DT en HTML   │
│  (Layout Maestro)    │
└──────┬───────────────┘
       │
       ↓
┌──────▼────────────────────────────────┐
│ DT-SISTEMA-NNN-FECHA.md               │
│ con YAML embebido                     │
│                                       │
│ dt_metadata:                          │
│   sistema: "FIBRA"                    │
│   impacto_layout: true                │
│                                       │
│ archivos_actualizar:                  │
│   - file: "WBS_Presupuestal_v2.0.md"  │
│     cambios: [...]                    │
└──────┬────────────────────────────────┘
       │
       ↓ [Cursor ejecuta DT según .cursorrules]
       │
┌──────▼─────────────────────────────────────────┐
│  PROPAGACIÓN EN 6 NIVELES:                     │
│                                                 │
│  1. IX/ WBS y Planificación                    │
│     ├─ WBS_Presupuestal_v2.0.md (cantidades)   │
│     ├─ layout.md (elementos físicos)           │
│     └─ datos JSON/JS regenerados                │
│                                                 │
│  2. V/ Ingeniería de Detalle                   │
│     └─ V.X_Sistema_vN.N.md (versionado auto)   │
│                                                 │
│  3. III/ Ingeniería Conceptual                 │
│     └─ Sistema_Integrado.md (criterios)        │
│                                                 │
│  4. VIII/ Documentos Maestros                  │
│     ├─ CRITERIOS_TECNICOS_MAESTRO.md           │
│     ├─ MATRIZ_TRAZABILIDAD_TECNICA.md          │
│     └─ MATRIZ_DEPENDENCIAS_DOCUMENTALES.md     │
│                                                 │
│  5. X/ Entregables Consolidados                │
│     ├─ SISTEMA_NN_EJECUTIVO.md (cocinar)       │
│     ├─ .docx (servir con Pandoc)               │
│     └─ .html (servir con Pandoc)               │
│                                                 │
│  6. Índices y Referencias                      │
│     └─ Indice_Maestro_Consolidado_v1.0.md      │
│                                                 │
│  + Log JSON (auditoría completa)               │
└─────────────────────────────────────────────────┘
```

**Tiempo de propagación:** ~30 segundos (detección + regeneración + cocinar + servir)

---

## 🧩 COMPONENTES PRINCIPALES

### 1️⃣ **Portal Web (index.html)**

**Ubicación:** Raíz del proyecto  
**URL Producción:** https://dieleoz.github.io/LD-CH/

**Componentes:**
- Formulario de login con validación
- Dashboard con 4 métricas principales
- 6 accesos rápidos a interfaces
- Sistema de sesión con timeout (30 min)

**Seguridad:**
- ✅ Límite 5 intentos de login (bloqueo 5 min)
- ✅ Timeout automático por inactividad
- ✅ Credenciales en archivo externo (no en git)
- ✅ CSS externo (assets/css/portal-login.css)

---

### 2️⃣ **Menú Principal (WBS_Menu_Principal.html)**

**Ubicación:** `IX. WBS y Planificacion/WBS_Menu_Principal.html`

**Funcionalidad:**
- Dashboard central con acceso a 8 interfaces
- Navegación unificada
- Botón de sincronización rápida
- Botón de servir ingeniería

**Interfaces Disponibles:**
1. 💰 Presupuesto Interactivo ($307.5B)
2. 🗺️ Layout Maestro (2,186 equipos)
3. 📊 Reporte Gerencial (Pareto + Ruta Crítica)
4. 📅 Cronograma (60 meses)
5. 🔴 Análisis de Riesgos (17 riesgos)
6. 📋 EDT Detallado (Metadata)
7. 📄 Documentos Servidos (Word/HTML)
8. 🎯 WBS Completa Interactiva (124 items)

---

### 3️⃣ **Sistema de Sincronización**

**Script Maestro:** `scripts/sincronizar_SISTEMA_COMPLETO_v14.3.ps1`

**Componentes:**
```powershell
# Ejecuta en secuencia:
1. sincronizar_riesgos_wbs_v3.ps1      # ~2 segundos
2. generar_reporte_gerencial.ps1       # ~2 segundos  
3. sincronizar_cronograma.ps1          # ~2 segundos

# Total: ~6 segundos
```

**Comandos:**
```powershell
# Sincronizar todo
.\scripts\sincronizar_SISTEMA_COMPLETO_v14.3.ps1

# Sincronizar selectivamente
.\scripts\sincronizar_SISTEMA_COMPLETO_v14.3.ps1 -SoloRiesgos
.\scripts\sincronizar_SISTEMA_COMPLETO_v14.3.ps1 -SoloReporte
.\scripts\sincronizar_SISTEMA_COMPLETO_v14.3.ps1 -SoloCronograma
```

---

### 4️⃣ **Sistema Cocinar → Servir**

**Metáfora arquitectónica:**

```
📁 LA COCINA (I-VII): Documentos de Trabajo
├─ I.    Contrato General
├─ II.   Apéndices Técnicos (+ Decisiones Técnicas)
├─ III.  Ingeniería Conceptual
├─ IV.   Ingeniería Básica
├─ V.    Ingeniería de Detalle
├─ VI.   Operación y Mantenimiento
└─ VII.  Soporte Especializado
       ↓
🔧 COCINAR (Consolidación)
   Script: cocinar.ps1 / cocinar_v2.ps1
   • Detecta DTs recientes
   • Ejecuta scripts de layout
   • Consolida por sistema
       ↓
🍽️ SERVIR (Exportación)
   Script: servir.ps1
   • Convierte .md → .docx (Pandoc)
   • Convierte .md → .html (Pandoc)
   • Genera índice interactivo
       ↓
📦 EL RESTAURANTE (X/): Entregables Cliente
└─ X_ENTREGABLES_CONSOLIDADOS/
   ├─ 7_SISTEMAS_EJECUTIVOS/ (13 .md)
   └─ 8_DOCUMENTOS_SERVIDOS/ (28 archivos)
      ├─ Word/ (14 .docx)
      └─ HTML/ (14 .html)
```

**Comandos:**
```powershell
# Workflow completo
.\scripts\servir_ingenieria_completo.ps1

# O paso a paso:
.\scripts\cocinar.ps1 -Sistema 02
.\scripts\servir.ps1 -Sistema 02
```

---

### 5️⃣ **Layout Maestro Interactivo**

**Archivo:** `IX. WBS y Planificacion/WBS_Layout_Maestro.html`  
**Fuente de datos:** `layout_datos.js` (532 KB, 2,186 elementos)

**Arquitectura de filtros:**

```javascript
┌────────────────────────────────────────────┐
│  FILTROS EN CASCADA                        │
├────────────────────────────────────────────┤
│                                            │
│  [Tipo de Equipo] → TELECOMUNICACIONES     │
│          ↓ (filtra dinámicamente)          │
│  [Sistema] → Fibra, TETRA, GSM-R, ODF...   │
│          ↓ (búsqueda)                      │
│  [UFV] → UFVF02, UFVF03, ... UFVF41        │
│          ↓                                 │
│  [PK] → Búsqueda por progresiva            │
│                                            │
│  Resultado: Lista filtrada + estadísticas  │
└────────────────────────────────────────────┘
```

**Funcionalidades:**
- ✅ Filtrado inteligente de 2,186 elementos
- ✅ Estadísticas dinámicas por tipo
- ✅ Generación de DTs desde interfaz
- ✅ Descarga de DTs en formato .md con YAML

---

## 🔄 METÁFORA COCINAR → SERVIR

### Concepto Central:

```
┌────────────────────────────────────────────────────────┐
│ LA COCINA (I-VII)                                      │
│ Documentos de trabajo técnico (Markdown)              │
│ • Actualizados diariamente por especialistas          │
│ • Modificados por Decisiones Técnicas (DTs)           │
│ • Formato: .md (Markdown técnico)                     │
│ • Versionamiento continuo                             │
└────────────────────────────────────────────────────────┘
                        ↓
              🔧 PROCESO: COCINAR
                 (Consolidar)
                        ↓
┌────────────────────────────────────────────────────────┐
│ PLATOS PREPARADOS                                      │
│ Documentos ejecutivos consolidados (.md)              │
│ • Un documento por sistema (6 sistemas)               │
│ • Formato ejecutivo (sin tecnicismos excesivos)       │
│ • Listo para "servir" al cliente                      │
└────────────────────────────────────────────────────────┘
                        ↓
              🍽️ PROCESO: SERVIR
           (Exportar a Word/HTML)
                        ↓
┌────────────────────────────────────────────────────────┐
│ EL RESTAURANTE (X/)                                    │
│ Documentos formales para cliente                       │
│ • Formato: .docx (Word) y .html                       │
│ • Presentación profesional                            │
│ • Listos para entrega formal                          │
│ • Snapshots en hitos (no cambian diariamente)         │
└────────────────────────────────────────────────────────┘
```

**Ventajas de la metáfora:**
- ✅ Fácil de entender para no técnicos
- ✅ Separación clara cocina (trabajo) vs restaurante (entregas)
- ✅ Workflow claro: cocinar → servir → entregar

---

## 📋 SISTEMA DE DECISIONES TÉCNICAS (DT)

### Arquitectura de Event Sourcing:

```
┌─────────────────────────────────────────────────────┐
│  DECISIÓN TÉCNICA (DT-SISTEMA-NNN-FECHA.md)         │
│  Evento inmutable que documenta un cambio técnico   │
├─────────────────────────────────────────────────────┤
│                                                      │
│  § 1-9: CONTEXTO TÉCNICO                           │
│  ├─ Ítem WBS afectado                              │
│  ├─ Justificación técnica                          │
│  ├─ Criterios de diseño                            │
│  ├─ Alternativas evaluadas                         │
│  └─ Riesgos identificados                          │
│                                                      │
│  § 10: YAML DE INSTRUCCIONES ⚙️                     │
│  ```yaml                                            │
│  dt_metadata:                                       │
│    dt_id: "DT-FIBRA-641"                           │
│    sistema: "FIBRA"                                │
│    impacto_layout: true                            │
│                                                      │
│  archivos_actualizar:                              │
│    - file: "WBS_Presupuestal_v2.0.md"              │
│      cambios:                                       │
│        - campo: "cantidad"                          │
│          buscar: "2068"                             │
│          reemplazar: "1823"                         │
│  ```                                                │
│                                                      │
│  § 11: CHECKBOX DE EJECUCIÓN                       │
│  - [ ] Ejecutado por Cursor                        │
│                                                      │
│  § 12: LOG DE EJECUCIÓN                            │
│  (Se completa automáticamente)                      │
└─────────────────────────────────────────────────────┘
```

**Flujo de ejecución:**
1. Especialista genera DT (interfaz HTML o manual)
2. DT incluye YAML con instrucciones
3. Cursor lee YAML y ejecuta cambios
4. Propagación automática en 6 niveles
5. Log de ejecución completado
6. Auditoría completa mantenida

---

## 🔄 SINCRONIZACIÓN AUTOMÁTICA

### Componentes Sincronizados:

| Componente | Fuente | Script | Destino | Frecuencia |
|:-----------|:-------|:-------|:--------|:-----------|
| **WBS Operativa** | Excel | sync_wbs_simple.ps1 | datos_wbs_TODOS_items.json | Manual |
| **Cronograma** | WBS JSON | sincronizar_cronograma.ps1 | cronograma_datos.js | Automática |
| **Riesgos** | MATRIZ_RIESGOS_PMO | sincronizar_riesgos_wbs_v3.ps1 | riesgos_wbs.js | Automática |
| **Reporte** | WBS JSON | generar_reporte_gerencial.ps1 | reporte_gerencial_data.js | Automática |
| **Layout** | DTs | Scripts especializados | layout_datos.js | Con DTs |

**Comando único:**
```powershell
.\scripts\sincronizar_SISTEMA_COMPLETO_v14.3.ps1
```

**Resultado:** 3 interfaces sincronizadas en ~6 segundos

---

## 🧩 MÓDULOS REUTILIZABLES (v14.7.5)

### Módulos Creados:

```
scripts/modules/
├─ Logger.psm1 (262 líneas)
│  └─ 8 funciones de logging estructurado JSON
│
├─ SistemaMapper.psm1 (15 líneas)
│  └─ Mapeo de 6 sistemas
│
├─ DTDetector.psm1 (47 líneas)
│  └─ Detección de DTs recientes/con impacto layout
│
├─ LayoutExecutor.psm1 (52 líneas)
│  └─ Ejecución de scripts especializados (FIBRA, TETRA, BALIZA)
│
└─ Consolidator.psm1 (72 líneas)
   └─ Consolidación de documentos ejecutivos
```

**Total:** 448 líneas de código reutilizable

**Uso:**
```powershell
# Importar módulo
Import-Module ".\scripts\modules\Logger.psm1"

# Usar funciones
$log = Start-ActionLog -Accion "MI_SCRIPT"
Add-LogMetric -LogContext $log -Nombre "items" -Valor 100
Complete-ActionLog -LogContext $log -Exitoso $true
```

---

## 🔒 SEGURIDAD

### Capas de Seguridad Implementadas:

#### 1. Portal Web (index.html)
```javascript
// Límite de intentos
MAX_INTENTOS = 5
TIMEOUT_BLOQUEO = 300000 // 5 minutos

// Timeout de sesión
TIMEOUT_SESION = 1800000 // 30 minutos

// Monitoreo de actividad
ultimaActividad = Date.now()
```

#### 2. Credenciales
```
CREDENCIALES_PORTAL.md (local, excluido de git)
├─ Usuario y contraseña actuales
├─ Política de rotación (90 días)
└─ Proceso de solicitud

.gitignore
├─ CREDENCIALES_PORTAL.md
├─ config/local.config.ps1
├─ *.credentials.json
└─ .env*
```

#### 3. Archivos Sensibles
- ✅ Excluidos de git automáticamente
- ✅ Documentación pública sin secretos
- ✅ Variables de entorno documentadas

---

## 📈 ESCALABILIDAD

### Capacidades Actuales vs Límites:

| Recurso | Actual | Límite Teórico | Margen |
|:--------|:-------|:---------------|:-------|
| **Items WBS** | 124 | ~1,000 | **8x** |
| **Layout Elementos** | 2,186 | ~10,000 | **4.5x** |
| **DTs Ejecutadas** | 25 | ~500 | **20x** |
| **Documentos** | 201 | ~1,000 | **5x** |
| **Riesgos** | 17 | ~100 | **6x** |

**Conclusión:** Sistema preparado para crecer 4-20x sin degradación.

---

## 🔧 TECNOLOGÍAS Y HERRAMIENTAS

### Stack Tecnológico:

| Capa | Tecnología | Versión Mínima | Uso |
|:-----|:-----------|:---------------|:----|
| **Backend** | PowerShell | 7.2+ | Scripts de transformación |
| **Frontend** | HTML5 + JavaScript | ES6+ | Interfaces dinámicas |
| **Estilos** | CSS3 | - | Diseño responsive |
| **Datos** | JSON | - | Datos estructurados |
| **Conversión** | Pandoc | 2.19+ | Markdown → Word/HTML |
| **Control de versiones** | Git | 2.38+ | Gestión de cambios |
| **Módulos PS** | Pester, PSExcel | 5.3+, 1.0+ | Tests y Excel |

---

## 📊 PATRONES DE DISEÑO APLICADOS

### 1️⃣ **Clean Architecture**
- Separación en 4 capas independientes
- Dependencias apuntan hacia adentro
- Capa de negocio aislada de UI

### 2️⃣ **Event Sourcing**
- Decisiones Técnicas como eventos inmutables
- Reconstrucción de estado desde eventos
- Auditoría completa del historial

### 3️⃣ **Repository Pattern**
- datos_wbs_TODOS_items.json como repositorio central
- Scripts acceden a través de interfaz uniforme
- Fuente única de verdad

### 4️⃣ **Module Pattern**
- 5 módulos PowerShell (.psm1)
- Exportación explícita de funciones públicas
- Encapsulación de lógica interna

### 5️⃣ **Cache-Busting Pattern**
- Versionamiento automático de archivos JS
- `archivo.js?v=timestamp`
- Previene errores por caché del navegador

---

## 🔍 FLUJO COMPLETO DE UNA DT

### Ejemplo: Cambio de Cantidad de Cajas de Fibra

```
PASO 1: ESPECIALISTA (Layout Maestro HTML)
├─ Filtra por "Fibra"
├─ Ve 1,953 elementos
├─ Click "Crear DT desde Filtro"
├─ Completa observación técnica
└─ Descarga: DT-FIBRA-641-2025-10-11.md

PASO 2: GUARDAR DT
└─ Mover a: II. Apendices Tecnicos/Decisiones_Tecnicas/

PASO 3: EJECUTAR (Automático o Manual)
│
├─ OPCIÓN A: Automático (Cursor con .cursorrules)
│   └─ Cursor detecta DT → Lee YAML → Ejecuta
│
└─ OPCIÓN B: Manual (Script)
    └─ .\scripts\servir_ingenieria_completo.ps1 -Sistema 02

PASO 4: DETECCIÓN (cocinar.ps1)
├─ Detecta DT con impacto_layout: true
├─ Lee sistema: "FIBRA"
└─ Ejecuta: regenerar_fibra_1824_cajas.ps1

PASO 5: REGENERACIÓN LAYOUT
├─ Limpia elementos antiguos
├─ Genera 1,735 cajas lineales (cada 300m)
├─ Genera 88 cajas en puentes (22 × 4)
├─ Genera 130 domos de fusión (cada 4km)
├─ Actualiza layout.md
├─ Regenera layout_datos.js (532 KB)
└─ Actualiza LAYOUT_INTEGRAL_COMPLETO_v1.0.json

PASO 6: CONSOLIDACIÓN (cocinar.ps1)
├─ Lee fuentes de cocina (III, V)
├─ Consolida en SISTEMA_02_Telecomunicaciones_EJECUTIVO.md
└─ Agrega nota de DT aplicada

PASO 7: EXPORTACIÓN (servir.ps1)
├─ Lee SISTEMA_02_...EJECUTIVO.md
├─ Pandoc genera .docx
├─ Pandoc genera .html
└─ Guarda en X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/

PASO 8: VERIFICACIÓN
├─ Abrir WBS_Layout_Maestro.html
├─ Ctrl+Shift+F5 (limpiar cache)
├─ Filtrar por "Fibra"
└─ Verificar: 1,953 elementos (1,823 cajas + 130 domos)

PASO 9: LOG (Si usa cocinar_v2.ps1 -ConLogs)
└─ Genera: logs/cocinar_YYYYMMDD_HHMMSS.json
   ├─ DTs procesadas: 1
   ├─ Archivos modificados: 15
   ├─ Duración: 30 segundos
   └─ Métricas: elementos_procesados=1953
```

**Tiempo total:** ~30 segundos (automático)  
**Intervención manual:** Solo 1 comando

---

## 📚 REFERENCIAS

**Documentos relacionados:**
- `README.md` - Documentación principal
- `MANUAL_DE_USO.md` - Guía práctica de usuario
- `GUIA_DECISIONES_TECNICAS.md` - Cómo usar DTs
- `ANALISIS_ARQUITECTURA_SISTEMA_v14.7.5_FINAL.md` - Análisis completo
- `scripts/REQUISITOS_SISTEMA.md` - Requisitos técnicos
- `scripts/DOCUMENTACION_LOGGER.md` - Módulo Logger

**Diagramas:**
- Este documento incluye diagramas ASCII de arquitectura
- Para diagramas visuales: Ver `38. DiagramasArquitectura_v1.0.md`

---

**Documento creado:** 12 de Octubre 2025  
**Versión:** 1.0  
**Estado:** ✅ COMPLETADO  
**Responsable:** Equipo Técnico / Arquitectura  
**Próxima revisión:** Enero 2026

