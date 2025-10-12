# MEJORAS PROPUESTAS - SISTEMA WBS INTERACTIVO v14.7
## Proyecto APP La Dorada-Chiriguaná

**Fecha de análisis:** 12 de Octubre 2025  
**Versión del sistema:** v14.7.1  
**Responsable:** PMO / Gestión de Calidad  
**Estado:** ✅ IMPLEMENTADAS (12-Oct-2025)

---

## 📋 RESUMEN EJECUTIVO

Este documento consolida las recomendaciones de mejora identificadas para el Sistema WBS Interactivo, priorizando **seguridad**, **claridad operativa**, **mantenibilidad** y **calidad técnica**.

**Categorías de mejoras:**
- 🔴 **Seguridad y Gestión de Acceso** (1 crítica)
- 📋 **Organización y Legibilidad** (2 importantes)
- ⚡ **Automatización y Aseguramiento** (2 importantes)
- 🌐 **Mantenibilidad del Portal Web** (2 recomendadas)

**Prioridad de implementación:**
1. **CRÍTICA** - Implementar inmediatamente
2. **ALTA** - Implementar en 1-2 días
3. **MEDIA** - Implementar en 1 semana
4. **BAJA** - Planificar para próximo sprint

---

## 🔴 1. SEGURIDAD Y GESTIÓN DE ACCESO (CRÍTICA)

### 1.1. Credenciales Publicadas en README ⚠️ **CRÍTICO**

**Problema identificado:**
```markdown
# Ubicación: README.md líneas 66-68
**Credenciales:**
- **Usuario:** `0rt1z`
- **Contraseña:** `0rt1z`
```

**Riesgo:**
- ✅ Portal público accesible en: https://dieleoz.github.io/LD-CH/
- ❌ Credenciales documentadas en repositorio público GitHub
- ❌ Acceso sin restricción a documentación técnica completa
- ❌ Exposición de datos sensibles del proyecto (presupuestos, especificaciones)

**Impacto:** 🔴 **CRÍTICO - SEGURIDAD**
- Cualquier persona con acceso al README puede acceder al portal
- Compromete confidencialidad de información contractual
- Incumplimiento potencial de cláusulas de confidencialidad

**Solución implementada:**
1. ✅ Eliminar credenciales del README.md
2. ✅ Crear archivo `CREDENCIALES_PORTAL.md` (excluido en .gitignore)
3. ✅ Crear `.env.example` con estructura de variables
4. ✅ Actualizar README con instrucciones de acceso seguro
5. ✅ Documentar proceso de provisión de credenciales

**Archivos afectados:**
- `README.md` (líneas 60-78)
- `.gitignore` (agregar CREDENCIALES_PORTAL.md)
- `.env.example` (nuevo)
- `CREDENCIALES_PORTAL.md` (nuevo, excluido de git)

**Estado:** ✅ **IMPLEMENTADO (12-Oct-2025)**

---

## 📋 2. ORGANIZACIÓN Y LEGIBILIDAD DE LA DOCUMENTACIÓN (ALTA)

### 2.1. Información Duplicada en Tableros de Métricas

**Problema identificado:**
```markdown
# Ubicación: README.md líneas 32-33
|| **Commits Git** | ✅ Actualizados | 18 commits v14.7.1 |
|| Commits Git | ✅ Actualizados | 20+ commits v14.7.2 |
```

**Riesgo:**
- ⚠️ Confusión sobre fuente de verdad (¿18 o 20+ commits?)
- ⚠️ Pérdida de credibilidad documental
- ⚠️ Errores en reportes gerenciales

**Impacto:** 🟡 **ALTA - CALIDAD DOCUMENTAL**

**Solución implementada:**
1. ✅ Consolidar métricas en tabla única
2. ✅ Eliminar filas duplicadas
3. ✅ Establecer regla: "Una métrica = Una fila"
4. ✅ Actualizar valor a cifra real actual

**Estado:** ✅ **IMPLEMENTADO (12-Oct-2025)**

---

### 2.2. Concentración de Instrucciones Operativas en README Único

**Problema identificado:**
- README.md actual: **1,554 líneas** (archivo monolítico)
- Mezcla de contenido para diferentes perfiles:
  - PMO / Gerencia
  - Especialistas técnicos
  - TI / DevOps
  - Stakeholders externos

**Riesgo:**
- ⚠️ Curva de aprendizaje alta para nuevos usuarios
- ⚠️ Dificultad para encontrar información específica
- ⚠️ Mantenimiento complejo (múltiples autores)

**Impacto:** 🟡 **ALTA - USABILIDAD**

**Solución propuesta:**

#### 2.2.1. Crear Índice Temático por Perfiles

```
📁 @@Guias_Usuario/ (NUEVO)
├── GUIA_PMO_Gestion_Proyecto.md
│   ├── Gestión de riesgos
│   ├── Ejecución de DTs
│   ├── Sincronización de matrices
│   └── Reportes gerenciales
│
├── GUIA_ESPECIALISTA_Tecnico.md
│   ├── Uso de interfaces WBS
│   ├── Generación de DTs
│   ├── Layout Maestro
│   └── Criterios técnicos
│
├── GUIA_TI_DevOps.md
│   ├── Scripts PowerShell
│   ├── Sincronización automática
│   ├── Cocinar y Servir
│   └── Mantenimiento del sistema
│
└── GUIA_STAKEHOLDER_Cliente.md
    ├── Acceso al portal web
    ├── Descarga de documentos
    ├── Visualización de interfaces
    └── Exportación de reportes
```

#### 2.2.2. Actualizar README.md Principal

**Nuevo contenido (reducido a ~300 líneas):**
- Resumen ejecutivo
- Estado del proyecto
- Acceso rápido por perfil
- Enlaces a guías específicas
- Métricas clave

**Estado:** ⏳ **PLANIFICADO - Sprint Próximo**

---

## ⚡ 3. AUTOMATIZACIÓN Y ASEGURAMIENTO DE SCRIPTS (ALTA)

### 3.1. Ausencia de Pruebas Automatizadas para Scripts PowerShell

**Problema identificado:**
- **58 scripts activos** en `scripts/`
- **0 scripts con tests automatizados** documentados
- Workflows críticos sin validación:
  - `cocinar.ps1`
  - `servir.ps1`
  - `servir_ingenieria_completo.ps1`
  - `sincronizar_SISTEMA_COMPLETO_v14.3.ps1`
  - `regenerar_fibra_1824_cajas.ps1`

**Riesgo:**
- ⚠️ Regresiones silenciosas al modificar scripts
- ⚠️ Cambios rompen flujos sin detección temprana
- ⚠️ Tiempo de depuración manual alto

**Impacto:** 🟡 **ALTA - CALIDAD DE SOFTWARE**

**Solución propuesta:**

#### 3.1.1. Implementar Pester Tests (Framework PowerShell)

```powershell
# Estructura propuesta
scripts/
├── tests/
│   ├── cocinar.Tests.ps1
│   ├── servir.Tests.ps1
│   ├── sincronizar.Tests.ps1
│   └── regenerar_fibra.Tests.ps1
│
└── run_all_tests.ps1 (ejecutor maestro)
```

#### 3.1.2. Tests Críticos a Implementar

**Para `cocinar.ps1`:**
- ✅ Verificar que lee DTs desde `II. Apendices Tecnicos/Decisiones_Tecnicas/`
- ✅ Validar que genera archivos en `X_ENTREGABLES_CONSOLIDADOS/7_SISTEMAS_EJECUTIVOS/`
- ✅ Confirmar que detecta `impacto_layout: true` en YAML
- ✅ Verificar que ejecuta script especializado correcto

**Para `servir.ps1`:**
- ✅ Confirmar que Pandoc está instalado
- ✅ Validar conversión .md → .docx exitosa
- ✅ Verificar conversión .md → .html exitosa
- ✅ Confirmar que archivos se guardan en destino correcto

**Para `sincronizar_SISTEMA_COMPLETO_v14.3.ps1`:**
- ✅ Verificar que lee `WBS_Presupuestal_v2.0.md`
- ✅ Validar que genera todos los archivos JSON/JS
- ✅ Confirmar tiempo de ejecución < 15 segundos
- ✅ Verificar que actualiza cache-busting

#### 3.1.3. Validaciones en Seco (Dry-Run)

```powershell
# Ejemplo: cocinar.ps1 -DryRun
# NO ejecuta cambios, solo valida:
# - Archivos existen
# - YAML es válido
# - Rutas son correctas
# - Permisos de escritura
```

**Estado:** ⏳ **PLANIFICADO - Sprint Próximo**

**Tiempo estimado:** 3-4 días (2 dev-days)

---

### 3.2. Requisitos por Plataforma No Documentados

**Problema identificado:**
- Scripts PowerShell sin documentar:
  - Versión mínima de PowerShell requerida
  - Módulos necesarios (Pester, PSExcel, etc.)
  - Compatibilidad Windows/Linux (PowerShell Core)
  - Dependencias externas (Pandoc, Git, Node.js)

**Riesgo:**
- ⚠️ Nuevos usuarios no pueden replicar entorno
- ⚠️ Errores de ejecución por versiones incompatibles
- ⚠️ Tiempo de setup inicial alto

**Impacto:** 🟡 **ALTA - USABILIDAD**

**Solución implementada:**

#### 3.2.1. Crear `scripts/REQUISITOS_SISTEMA.md`

Contenido:
- ✅ Versión PowerShell mínima: 7.2+
- ✅ Módulos requeridos: Pester 5.3+, PSExcel
- ✅ Herramientas externas: Pandoc 2.19+, Git 2.38+
- ✅ Sistema operativo: Windows 10+ / Ubuntu 20.04+ / macOS 12+
- ✅ Permisos: Ejecución de scripts habilitada

#### 3.2.2. Script de Validación de Entorno

```powershell
# scripts/validar_entorno.ps1
# Verifica todas las dependencias antes de ejecutar
# Reporta qué falta instalar
```

**Estado:** ✅ **IMPLEMENTADO (12-Oct-2025)**

---

## 🌐 4. MANTENIBILIDAD DEL PORTAL WEB (MEDIA)

### 4.1. Estilos CSS Embebidos en HTML

**Problema identificado:**
- `index.html` (portal de login): CSS embebido (~200 líneas)
- Múltiples interfaces HTML con estilos duplicados:
  - `WBS_Menu_Principal.html`
  - `WBS_Layout_Maestro.html`
  - `WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguaná.html`
  - 5 interfaces adicionales

**Riesgo:**
- ⚠️ Duplicación de código CSS (mantenimiento complejo)
- ⚠️ Cambios de estilo requieren editar múltiples archivos
- ⚠️ Sin caché de estilos (recarga completa en cada vista)
- ⚠️ Tamaño de archivos HTML innecesariamente grande

**Impacto:** 🟢 **MEDIA - MANTENIBILIDAD**

**Solución propuesta:**

#### 4.1.1. Extraer Estilos a Archivos Dedicados

```
IX. WBS y Planificacion/
├── assets/
│   ├── css/
│   │   ├── global.css (estilos comunes)
│   │   ├── menu.css (menu principal)
│   │   ├── layout.css (layout maestro)
│   │   └── presupuesto.css (presupuesto)
│   └── js/
│       └── (archivos JS existentes)
```

#### 4.1.2. Actualizar Referencias en HTML

```html
<!-- Antes (embebido) -->
<style>
  body { font-family: Arial; }
  /* 200 líneas más... */
</style>

<!-- Después (externo) -->
<link rel="stylesheet" href="assets/css/global.css?v=20251012">
<link rel="stylesheet" href="assets/css/menu.css?v=20251012">
```

**Beneficios:**
- ✅ Mantenimiento centralizado de estilos
- ✅ Caché del navegador para CSS (mejora rendimiento)
- ✅ Reducción 30-40% tamaño archivos HTML
- ✅ Facilita cambios de diseño globales

**Estado:** ⏳ **PLANIFICADO - Sprint Próximo**

**Tiempo estimado:** 1-2 días

---

### 4.2. Endurecimiento de la Capa de Cliente

**Problema identificado:**
- Portal de login (`index.html`) sin protecciones:
  - ❌ Sin límite de intentos de login (fuerza bruta)
  - ❌ Sin timeout de sesión
  - ❌ Sin validación de tokens (solo usuario/contraseña)
  - ❌ Credenciales validadas en cliente (inseguro)

**Riesgo:**
- ⚠️ Ataques de fuerza bruta sin mitigación
- ⚠️ Sesiones perpetuas sin expiración
- ⚠️ Código JavaScript visible (lógica de autenticación)

**Impacto:** 🟢 **MEDIA - SEGURIDAD**

**Solución propuesta:**

#### 4.2.1. Implementar Límite de Intentos

```javascript
// Agregar a index.html
let intentosLogin = 0;
const MAX_INTENTOS = 5;
const TIMEOUT_BLOQUEO = 300000; // 5 minutos

function validarLogin(user, pass) {
    if (intentosLogin >= MAX_INTENTOS) {
        mostrarError("Demasiados intentos. Espera 5 minutos.");
        return false;
    }
    
    // Lógica de validación...
    
    if (!esValido) {
        intentosLogin++;
    }
}
```

#### 4.2.2. Implementar Timeout de Sesión

```javascript
// Expirar sesión después de 30 minutos de inactividad
const TIMEOUT_SESION = 1800000; // 30 minutos
let ultimaActividad = Date.now();

setInterval(() => {
    if (Date.now() - ultimaActividad > TIMEOUT_SESION) {
        cerrarSesion();
    }
}, 60000); // Verificar cada minuto
```

#### 4.2.3. Implementar Backend de Autenticación (Futuro)

**Recomendación a largo plazo:**
- Migrar autenticación a backend (Node.js / PHP)
- Implementar tokens JWT
- Usar variables de entorno para credenciales
- Integrar con Active Directory / SSO

**Estado:** ⏳ **PLANIFICADO - Backlog**

**Prioridad:** BAJA (funcionalidad actual suficiente para uso interno)

---

## 📊 RESUMEN DE IMPLEMENTACIÓN

### Estado de Mejoras (12-Oct-2025)

| # | Mejora | Prioridad | Estado | Fecha |
|:--|:-------|:----------|:-------|:------|
| 1.1 | Externalizar credenciales | 🔴 CRÍTICA | ✅ IMPLEMENTADO | 12-Oct-2025 |
| 2.1 | Eliminar duplicación métricas | 🟡 ALTA | ✅ IMPLEMENTADO | 12-Oct-2025 |
| 2.2 | Separar guías por perfil | 🟡 ALTA | ⏳ PLANIFICADO | Sprint próximo |
| 3.1 | Tests automatizados scripts | 🟡 ALTA | ⏳ PLANIFICADO | Sprint próximo |
| 3.2 | Documentar requisitos | 🟡 ALTA | ✅ IMPLEMENTADO | 12-Oct-2025 |
| 4.1 | Extraer CSS a archivos | 🟢 MEDIA | ⏳ PLANIFICADO | Sprint próximo |
| 4.2 | Endurecer capa cliente | 🟢 MEDIA | ⏳ BACKLOG | Futuro |

### Métricas de Implementación

| Métrica | Valor |
|:--------|:------|
| **Mejoras identificadas** | 7 |
| **Implementadas inmediatamente** | 3 (43%) |
| **Planificadas sprint próximo** | 3 (43%) |
| **En backlog** | 1 (14%) |
| **Tiempo implementación inmediata** | 2 horas |
| **Tiempo estimado planificadas** | 6-8 días dev |

---

## 📝 PRÓXIMOS PASOS

### Inmediatos (Hoy - 12-Oct-2025)
- [x] Crear documento MEJORAS_PROPUESTAS.md
- [x] Eliminar credenciales de README.md
- [x] Crear .env.example
- [x] Crear CREDENCIALES_PORTAL.md (excluido git)
- [x] Corregir duplicación métricas README
- [x] Crear scripts/REQUISITOS_SISTEMA.md
- [x] Actualizar roadmap v14.7.2

### Sprint Próximo (15-22 Oct 2025)
- [ ] Crear guías por perfil (PMO, Especialista, TI, Stakeholder)
- [ ] Implementar tests Pester para scripts críticos
- [ ] Extraer CSS a archivos dedicados
- [ ] Implementar cache-busting para CSS

### Backlog (Futuro)
- [ ] Migrar autenticación a backend
- [ ] Implementar tokens JWT
- [ ] Integrar con SSO corporativo
- [ ] CI/CD para tests automatizados

---

## 🔗 REFERENCIAS

**Documentos relacionados:**
- `README.md` - Documentación principal del proyecto
- `@@Roadmap_v14.7_Marco_Gestion_Consolidado.md` - Roadmap del proyecto
- `.cursorrules` - Reglas de ejecución automática
- `scripts/README_SCRIPTS.md` - Documentación de scripts

**Estándares aplicados:**
- PMI PMBOK 7th Edition - Gestión de riesgos
- OWASP Top 10 - Seguridad web
- PowerShell Best Practices - Scripting
- Markdown Style Guide - Documentación

---

**Documento creado:** 12 de Octubre 2025  
**Versión:** 1.0  
**Responsable:** PMO / Gestión de Calidad  
**Próxima revisión:** 22 de Octubre 2025 (fin de sprint)

---

## 🎯 CONCLUSIONES

Las mejoras propuestas abordan aspectos críticos de **seguridad**, **usabilidad** y **mantenibilidad** del Sistema WBS Interactivo. La implementación inmediata de las mejoras críticas (seguridad de credenciales, limpieza documental) garantiza la continuidad segura del proyecto.

Las mejoras planificadas para el próximo sprint fortalecerán la **robustez técnica** (tests automatizados) y la **experiencia de usuario** (guías específicas, CSS modular).

**Recomendación PMO:** Aprobar para implementación según calendario propuesto.

