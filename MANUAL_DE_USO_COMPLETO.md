# GUÍA COMPLETA: DECISIONES TÉCNICAS (DT)
## Sistema WBS Interactivo - Para Usuarios
## Proyecto APP La Dorada-Chiriguaná

**Versión:** 1.0  
**Fecha:** 12 de Octubre 2025  
**Audiencia:** Especialistas técnicos (cualquier nivel de experiencia)

---

## 📋 ¿QUÉ ES UNA DECISIÓN TÉCNICA (DT)?

Una **Decisión Técnica (DT)** es un documento que:

✅ **Documenta** un cambio técnico propuesto  
✅ **Justifica** por qué es necesario el cambio  
✅ **Especifica** qué archivos cambiar y cómo  
✅ **Se ejecuta** automáticamente por el sistema  
✅ **Deja trazabilidad** completa de quién, cuándo, por qué

**Piensa en una DT como:**
> "Una orden de cambio técnico que el sistema entiende y ejecuta automáticamente"

---

## 🎯 ¿CUÁNDO NECESITO UNA DT?

Necesitas crear una DT cuando quieras:

### ✅ Casos comunes:

| Situación | Ejemplo | Tipo de DT |
|:----------|:--------|:-----------|
| **Cambiar una cantidad** | "Las cajas de fibra deben ser 1,823 (no 2,068)" | Ajuste de cantidad |
| **Agregar un equipo nuevo** | "Necesitamos 5 cámaras adicionales en PK 450" | Nuevo elemento |
| **Cambiar un criterio técnico** | "El espaciamiento debe ser 300m (no 500m)" | Criterio técnico |
| **Eliminar elementos** | "Las balizas no son necesarias (señalización virtual)" | Eliminación |
| **Modificar ubicación** | "La cámara en PK 350 debe estar en PK 352" | Cambio de ubicación |

### ❌ Casos donde NO necesitas DT:

- Correcciones de typos en documentación
- Cambios de formato (negritas, colores, etc.)
- Preguntas o consultas (usa email)
- Cambios en archivos administrativos

---

## 🚀 CÓMO GENERAR UNA DT (PASO A PASO)

### MÉTODO 1: Desde el Layout Maestro (RECOMENDADO) ⭐

Este es el método **más fácil** para cambios masivos.

---

#### **PASO 1: Abrir el Layout Maestro**

```
Ruta: IX. WBS y Planificacion/WBS_Layout_Maestro.html
```

O desde Portal WBS → Click "Layout Maestro"

---

#### **PASO 2: Aplicar Filtros**

**Ejemplo: Quieres cambiar todas las cajas de fibra**

1. **Tipo de Equipo:** Seleccionar `TELECOMUNICACIONES`
2. **Sistema:** Seleccionar `Fibra`
3. Presionar "🔍 Filtrar"

**Resultado:** Verás ~1,953 elementos de fibra óptica

---

#### **PASO 3: Hacer Click en "📋 Crear DT desde Filtro"**

Verás un formulario como este:

```
┌─────────────────────────────────────────────────────┐
│ GENERAR DECISIÓN TÉCNICA DESDE FILTRO               │
├─────────────────────────────────────────────────────┤
│                                                      │
│ Sistema detectado: FIBRA                            │
│ Elementos filtrados: 1,953                          │
│                                                      │
│ ┌─────────────────────────────────────────────┐    │
│ │ Observación Técnica:                        │    │
│ │ ┌─────────────────────────────────────────┐ │    │
│ │ │ Las cajas deben espaciarse cada 300m   │ │    │
│ │ │ según criterio de mantenibilidad.      │ │    │
│ │ │ Cantidad correcta: 1,823 cajas         │ │    │
│ │ └─────────────────────────────────────────┘ │    │
│ └─────────────────────────────────────────────┘    │
│                                                      │
│ ┌─────────────────────────────────────────────┐    │
│ │ Justificación:                              │    │
│ │ ┌─────────────────────────────────────────┐ │    │
│ │ │ Reducir puntos de falla y facilitar    │ │    │
│ │ │ mantenimiento preventivo. Espaciamiento│ │    │
│ │ │ 300m cumple estándares internacionales │ │    │
│ │ └─────────────────────────────────────────┘ │    │
│ └─────────────────────────────────────────────┘    │
│                                                      │
│ Criterio de diseño aplicado: (Opcional)            │
│ ┌─────────────────────────────────────────────┐    │
│ │ UIC 518 - Mantenibilidad de redes FO       │    │
│ └─────────────────────────────────────────────┘    │
│                                                      │
│ [ Cancelar ]  [ 📥 Generar DT ]                     │
│                                                      │
└─────────────────────────────────────────────────────┘
```

---

#### **PASO 4: Completar el Formulario**

**📝 Observación Técnica** (Obligatorio):
- ¿Qué quieres cambiar?
- ¿De qué cantidad a qué cantidad?
- ¿En qué items WBS?

**Ejemplo:**
```
Las cajas de empalme de fibra deben ser 1,823 unidades (no 2,068).
Esto corresponde a un espaciamiento de 300m en la longitud contractual
de 520.78 km, más 4 cajas por puente en 22 puentes principales.
```

**💡 Justificación** (Obligatorio):
- ¿Por qué este cambio?
- ¿Qué beneficio trae?
- ¿Qué norma o estándar lo respalda?

**Ejemplo:**
```
El espaciamiento de 300m cumple con:
- Norma UIC 518 (Mantenibilidad de redes ferroviarias)
- Facilita localización de fallas (OTDR)
- Reduce costos de mantenimiento preventivo
- Mejora disponibilidad del sistema
```

**📏 Criterio de Diseño** (Opcional pero recomendado):
- ¿Qué norma técnica aplica?
- ¿Qué cálculo usaste?

**Ejemplo:**
```
UIC 518 - Redes de fibra óptica ferroviarias
Cálculo: 520.78 km ÷ 0.3 km = 1,735 cajas lineales
         22 puentes × 4 cajas = 88 cajas
         TOTAL: 1,823 cajas
```

---

#### **PASO 5: Click en "📥 Generar DT"**

El sistema:
1. ✅ Genera archivo con nombre: `DT-FIBRA-641-2025-10-12.md`
2. ✅ Incluye YAML con instrucciones automáticas
3. ✅ Descarga automáticamente a tu carpeta de Descargas

---

#### **PASO 6: Guardar la DT en el Proyecto**

**Mover el archivo a:**
```
II. Apendices Tecnicos/Decisiones_Tecnicas/DT-FIBRA-641-2025-10-12.md
```

**Formas de hacerlo:**
- Copiar desde Descargas y pegar en la carpeta
- O arrastrar el archivo
- O usar comando: `move C:\Users\...\DT-*.md "II. Apendices Tecnicos\Decisiones_Tecnicas\"`

---

#### **PASO 7: Notificar a PMO**

**Email a PMO:**
```
Asunto: Nueva DT para aprobación: DT-FIBRA-641

Hola equipo PMO,

He generado una Decisión Técnica para ajustar la cantidad de cajas 
de empalme de fibra óptica.

DT ID: DT-FIBRA-641-2025-10-12
Sistema: FIBRA ÓPTICA
Tipo de cambio: Ajuste de cantidad
Archivos afectados: WBS, Layout, Ingeniería

La DT está guardada en:
II. Apendices Tecnicos/Decisiones_Tecnicas/DT-FIBRA-641-2025-10-12.md

Por favor, revisar y aprobar.

Gracias,
[Tu nombre]
Especialista de Telecomunicaciones
```

---

#### **PASO 8: PMO Ejecuta la DT**

**El PMO hará:**
```powershell
# Opción A: Ejecutar workflow completo
.\scripts\servir_ingenieria_completo.ps1 -Sistema 02

# Opción B: Que Cursor la ejecute (según .cursorrules)
```

**El sistema automáticamente:**
1. ✅ Detecta la DT nueva
2. ✅ Lee el YAML con instrucciones
3. ✅ Actualiza WBS_Presupuestal_v2.0.md
4. ✅ Regenera layout (1,823 cajas)
5. ✅ Actualiza layout_datos.js
6. ✅ Consolida ingeniería conceptual
7. ✅ Actualiza matrices de trazabilidad
8. ✅ Genera documentos Word/HTML
9. ✅ Completa log de ejecución en la DT

---

#### **PASO 9: Verificar los Cambios**

1. Abrir `WBS_Layout_Maestro.html`
2. Presionar **Ctrl+Shift+F5** (limpiar cache)
3. Filtrar por "Fibra"
4. Verificar: Ahora muestra 1,823 cajas ✅

---

## 🔍 MÉTODO 2: DT desde un Elemento Individual

**Caso de uso:** Cambiar un equipo específico (no masivo)

---

### **PASO 1: Buscar el Elemento**

1. Abrir Layout Maestro
2. Usar filtros para encontrar el equipo
3. Ejemplo: Cámara CCTV en PK 350+200

---

### **PASO 2: Click en Botón "📋 DT"**

Cada fila de la tabla tiene un botón **📋 DT** al final.

---

### **PASO 3: Completar Formulario**

El formulario se pre-llena con:
- ✅ Sistema detectado
- ✅ Descripción del equipo
- ✅ UFV y PK actuales
- ✅ Especificaciones actuales

**Solo completas:**
- ¿Qué quieres cambiar?
- ¿Por qué?
- ¿Criterio técnico?

---

### **PASO 4: Generar y Guardar**

Mismo proceso que Método 1 (pasos 5-9)

---

## 📄 ESTRUCTURA DE UNA DT

### Secciones de una DT (12 secciones):

```markdown
# DT-FIBRA-641-2025-10-12

## 1. IDENTIFICACIÓN
- ID: DT-FIBRA-641-2025-10-12
- Sistema: FIBRA ÓPTICA
- Fecha: 12 de Octubre 2025
- Especialista: [Tu nombre]

## 2. ÍTEM WBS AFECTADO
- Código: 2.3.103
- Descripción: Cajas de empalme y distribución 80x80
- Cantidad actual: 2,068 UND
- Cantidad propuesta: 1,823 UND

## 3. TIPO DE CAMBIO
- Ajuste de cantidad

## 4. OBSERVACIÓN TÉCNICA
[Tu descripción del cambio]

## 5. JUSTIFICACIÓN
[Por qué es necesario]

## 6. CRITERIO DE DISEÑO APLICADO
[Normas, estándares, cálculos]

## 7. ALTERNATIVAS EVALUADAS
| Opción | Espaciamiento | Cajas | Costo | Observación |
|--------|---------------|-------|-------|-------------|
| A      | 250m          | 2,083 | +$10M | Muy costoso |
| B      | 300m          | 1,823 | Base  | SELECCIONADA |
| C      | 500m          | 1,041 | -$20M | No cumple UIC |

## 8. IMPACTO PRESUPUESTAL
- Cantidad actual: 2,068 UND × $1,350,000 = $2,791,800,000
- Cantidad propuesta: 1,823 UND × $1,350,000 = $2,461,050,000
- **Ahorro: $330,750,000 COP (-12%)**

## 9. RIESGOS IDENTIFICADOS
| ID | Descripción | Mitigación |
|----|-------------|------------|
| R-FIBRA-NEW | Espaciamiento 300m puede ser insuficiente | Validar con OTDR |

## 10. INSTRUCCIONES PARA CURSOR ⚙️

```yaml
dt_metadata:
  dt_id: "DT-FIBRA-641-2025-10-12"
  sistema: "FIBRA"
  tipo_cambio: "ajuste_cantidad"
  impacto_layout: true
  items_wbs_afectados:
    - "2.3.103"

archivos_actualizar:
  - file: "IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md"
    seccion: "Item 2.3.103"
    cambios:
      - campo: "cantidad"
        buscar: "2068"
        reemplazar: "1823"
  
  - file: "IX. WBS y Planificacion/layout.md"
    accion: "ejecutar_script"
    script: "regenerar_fibra_1824_cajas.ps1"
```

## 11. ESTADO DE EJECUCIÓN
- [ ] 🔧 Ejecutado por Cursor: [fecha-hora]
- [ ] ✅ Verificado en interfaces
- [ ] 📧 Stakeholders notificados

## 12. LOG DE EJECUCIÓN
(Se completa automáticamente al ejecutar)
```

**📌 Nota:** Secciones 1-9 las completas TÚ. Sección 10 la genera el sistema. Secciones 11-12 las completa Cursor al ejecutar.

---

## 💡 EJEMPLO COMPLETO: DT REAL

### Caso: "Cambiar cantidad de cajas de fibra de 2,068 a 1,823"

---

#### **CONTEXTO:**

**Situación actual:**
- WBS dice: 2,068 cajas de empalme
- Layout tiene: 2,068 cajas distribuidas

**Problema detectado:**
- Revisando la longitud contractual (520.78 km)
- Con espaciamiento de 300m (estándar UIC 518)
- Deberían ser: 520.78 ÷ 0.3 = 1,735 cajas lineales
- Más cajas en puentes: 22 puentes × 4 = 88 cajas
- **Total correcto: 1,823 cajas** (no 2,068)

**Especialista decide:** Crear DT para corregir

---

#### **GENERACIÓN DE LA DT:**

**1. Abrir Layout Maestro**
- Archivo: `WBS_Layout_Maestro.html`

**2. Filtrar por Fibra**
- Tipo: TELECOMUNICACIONES
- Sistema: Fibra
- Resultado: 1,953 elementos

**3. Click "📋 Crear DT desde Filtro"**

**4. Completar formulario:**

```
┌────────────────────────────────────────────────────────┐
│ Observación Técnica:                                   │
├────────────────────────────────────────────────────────┤
│ La cantidad actual de cajas de empalme (2,068) no     │
│ corresponde con el cálculo según longitud              │
│ contractual.                                           │
│                                                         │
│ Cálculo correcto:                                      │
│ - Longitud: 520.78 km                                  │
│ - Espaciamiento: 300m (UIC 518)                        │
│ - Cajas lineales: 520.78 ÷ 0.3 = 1,735               │
│ - Cajas en puentes: 22 × 4 = 88                       │
│ - TOTAL: 1,823 cajas                                   │
│                                                         │
│ Además, se requieren 130 domos de fusión (cada 4km).   │
└────────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────┐
│ Justificación:                                         │
├────────────────────────────────────────────────────────┤
│ Cumplimiento de norma UIC 518 (redes FO ferroviarias).│
│                                                         │
│ Beneficios del espaciamiento 300m:                    │
│ - Facilita localización de fallas con OTDR             │
│ - Reduce tiempo de reparación                          │
│ - Mejora disponibilidad del sistema                    │
│ - Cumple estándares internacionales                    │
│                                                         │
│ Impacto presupuestal: Ahorro de $330M COP (-12%)      │
└────────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────┐
│ Criterio de diseño:                                    │
├────────────────────────────────────────────────────────┤
│ UIC 518 OR - Instalaciones de fibra óptica en          │
│ infraestructura ferroviaria.                           │
│                                                         │
│ Espaciamiento recomendado: 250-500m                    │
│ Criterio adoptado: 300m (mantenibilidad óptima)        │
└────────────────────────────────────────────────────────┘
```

**5. Click "📥 Generar DT"**

**6. Se descarga:**
```
DT-FIBRA-641-2025-10-12.md
```

---

#### **CONTENIDO DE LA DT GENERADA:**

El archivo descargado incluye **12 secciones completas**:

- ✅ Secciones 1-9: Con la información que ingresaste
- ✅ Sección 10: YAML generado automáticamente con instrucciones
- ✅ Secciones 11-12: Para completar al ejecutar

**Ejemplo de YAML generado:**

```yaml
dt_metadata:
  dt_id: "DT-FIBRA-641-2025-10-12"
  fecha: "2025-10-12"
  especialista: "Juan Pérez"
  sistema: "FIBRA"
  tipo_cambio: "ajuste_cantidad"
  impacto_layout: true
  items_wbs_afectados:
    - "2.3.103"  # Cajas de empalme
    - "2.3.104"  # Domos de fusión

recalculo_automatico:
  longitud_contractual_km: 520.78
  espaciamiento_km: 0.3
  cajas_lineales: 1735
  puentes_principales: 22
  cajas_por_puente: 4
  cajas_en_puentes: 88
  total_cajas: 1823
  domos_cada_km: 4
  domos_fusion: 130

archivos_actualizar:
  - file: "IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md"
    seccion: "Item 2.3.103"
    cambios:
      - campo: "cantidad"
        buscar: "2068"
        reemplazar: "1823"
        
  - file: "IX. WBS y Planificacion/layout.md"
    accion: "ejecutar_script"
    script: "regenerar_fibra_1824_cajas.ps1"
    
  - file: "III. Ingenieria conceptual/28_Sistema_FibraOptica_Integrado.md"
    seccion: "3.2 Cantidades"
    cambios:
      - campo: "cajas"
        buscar: "2,068 cajas"
        reemplazar: "1,823 cajas (1,735 lineales + 88 puentes)"

validaciones:
  - verificar_archivos_existen: true
  - backup_antes_modificar: true
  - validar_formato_numeros: true
  - confirmar_con_usuario: true
```

**Este YAML es lo que Cursor lee para ejecutar los cambios automáticamente.**

---

## 🔄 ¿QUÉ PASA DESPUÉS DE CREAR UNA DT?

### Flujo de Aprobación y Ejecución:

```
┌──────────────────────────────────────────┐
│ ESPECIALISTA                             │
│ 1. Genera DT desde Layout Maestro        │
│ 2. Guarda en carpeta Decisiones_Tecnicas│
│ 3. Notifica a PMO                        │
└──────┬───────────────────────────────────┘
       │
       ↓
┌──────▼───────────────────────────────────┐
│ PMO                                      │
│ 4. Revisa DT (justificación, impacto)   │
│ 5. Si aprueba → Ejecuta script           │
│    .\scripts\servir_ingenieria_completo  │
└──────┬───────────────────────────────────┘
       │
       ↓
┌──────▼───────────────────────────────────┐
│ CURSOR (Automático)                      │
│ 6. Detecta DT con impacto_layout: true   │
│ 7. Lee YAML (instrucciones)              │
│ 8. Valida archivos existen               │
│ 9. Crea backup mental                    │
│ 10. Aplica cambios en 6 niveles:         │
│     ├─ WBS Presupuestal                  │
│     ├─ Layout (regenera 1,823 cajas)     │
│     ├─ Ingeniería Conceptual             │
│     ├─ Matrices                          │
│     ├─ Documentos ejecutivos             │
│     └─ Índices                           │
│ 11. Completa log en sección 12 de DT     │
│ 12. Marca checkbox ✅ en sección 11       │
└──────┬───────────────────────────────────┘
       │
       ↓
┌──────▼───────────────────────────────────┐
│ SISTEMA ACTUALIZADO                      │
│ 13. Interfaces HTML sincronizadas        │
│ 14. Documentos Word/HTML regenerados     │
│ 15. Trazabilidad completa mantenida      │
└──────┬───────────────────────────────────┘
       │
       ↓
┌──────▼───────────────────────────────────┐
│ PMO                                      │
│ 16. Verifica log de ejecución            │
│ 17. Notifica a especialista ✅            │
└──────────────────────────────────────────┘
```

**Tiempo total:** ~30 segundos (automático)

---

## ✅ ¿CÓMO SÉ SI MI DT FUE EJECUTADA?

### Verificación 1: Revisar el Archivo DT

Abrir el archivo `DT-FIBRA-641-2025-10-12.md`

**Buscar sección 11:**
```markdown
## 11. ESTADO DE EJECUCIÓN
- [x] 🔧 Ejecutado por Cursor: 2025-10-12 15:30:45
- [x] ✅ Verificado en interfaces
- [ ] 📧 Stakeholders notificados
```

**Si tiene ✅ marcado** → Ya fue ejecutada

---

### Verificación 2: Revisar el Log

**Buscar sección 12:**
```markdown
## 12. LOG DE EJECUCIÓN

Fecha ejecución: 2025-10-12 15:30:45
Usuario Cursor: Sistema WBS
Archivos modificados: 15
  - WBS_Presupuestal_v2.0.md
  - layout.md
  - layout_datos.js
  - 28_Sistema_FibraOptica_Integrado.md
  - MATRIZ_DEPENDENCIAS_DOCUMENTALES_v1.0.md
  - ... (10 más)
  
Ítems recalculados: 2
  - 2.3.103 (Cajas de empalme)
  - 2.3.104 (Domos de fusión)
  
Scripts ejecutados: 1
  - regenerar_fibra_1824_cajas.ps1 (exitoso)

Elementos generados: 1,953
  - 1,735 cajas lineales (cada 300m)
  - 88 cajas en puentes (22 × 4)
  - 130 domos de fusión (cada 4km)

Errores encontrados: 0
Advertencias: 0
Tiempo ejecución: 28 segundos

✅ EJECUCIÓN EXITOSA
```

**Si tiene log completo** → Todo funcionó correctamente

---

### Verificación 3: Revisar las Interfaces

**Abrir Layout Maestro:**
1. `WBS_Layout_Maestro.html`
2. Ctrl+Shift+F5 (limpiar cache)
3. Filtrar por "Fibra"
4. **Verificar:** Estadísticas muestran 1,823 cajas ✅

**Abrir Presupuesto:**
1. `WBS_Presupuesto_SCC.html`
2. Buscar item 2.3.103
3. **Verificar:** Cantidad = 1,823 ✅

---

## ⚠️ PROBLEMAS COMUNES Y SOLUCIONES

### ❓ "No veo los cambios en la interfaz"

**Causa:** Cache del navegador

**Solución:**
```
1. Presionar Ctrl + Shift + F5 (recarga forzada)
2. O cerrar navegador completamente y volver a abrir
3. O abrir en ventana incógnita (Ctrl+Shift+N)
```

---

### ❓ "Mi DT no se ejecuta"

**Posibles causas:**

**Causa 1:** No está en la carpeta correcta
- **Solución:** Mover a `II. Apendices Tecnicos/Decisiones_Tecnicas/`

**Causa 2:** PMO aún no la ejecutó
- **Solución:** Enviar email de recordatorio a PMO

**Causa 3:** Error en el YAML
- **Solución:** Contactar a soporte técnico

---

### ❓ "¿Cómo edito una DT ya creada?"

**Respuesta:**
1. Abrir el archivo .md en cualquier editor de texto
2. Editar **solo secciones 1-9** (contexto técnico)
3. **NO editar** sección 10 (YAML) a menos que sepas lo que haces
4. Guardar el archivo
5. Notificar a PMO que hay una versión actualizada

---

### ❓ "¿Puedo crear una DT manualmente?"

**Respuesta:** Sí, pero **NO es recomendado**

**Si quieres hacerlo:**
1. Copiar plantilla: `II. Apendices Tecnicos/Decisiones_Tecnicas/TEMPLATE_DT_CON_YAML_v1.0.md`
2. Renombrar: `DT-SISTEMA-NNN-FECHA.md`
3. Completar las 12 secciones
4. **CUIDADO con el YAML** (debe tener formato exacto)

**Mejor:** Usa el generador automático del Layout Maestro ✅

---

## 📊 TIPOS DE DTs QUE PUEDES CREAR

### 1️⃣ **Ajuste de Cantidad**

**Ejemplo:** "Las torres TETRA deben ser 37 (no 33)"

**Afecta:**
- WBS Presupuestal
- Layout de equipos
- Documentos de ingeniería

**Tiempo de ejecución:** ~30 segundos

---

### 2️⃣ **Nuevo Elemento**

**Ejemplo:** "Agregar 5 cámaras CCTV en PK 450-455"

**Afecta:**
- WBS Presupuestal (nuevo item o aumenta cantidad)
- Layout (nuevos elementos agregados)
- Documentos de ingeniería

**Tiempo de ejecución:** ~45 segundos

---

### 3️⃣ **Criterio Técnico**

**Ejemplo:** "Cambiar espaciamiento de cajas de 500m a 300m"

**Afecta:**
- Criterios técnicos maestros
- Ingeniería conceptual
- Cálculos de cantidades (puede cambiar WBS)

**Tiempo de ejecución:** ~1 minuto

---

### 4️⃣ **Eliminación**

**Ejemplo:** "Eliminar balizas (señalización virtual)"

**Afecta:**
- WBS Presupuestal (elimina item)
- Layout (elimina elementos)
- Documentos (marca como "no aplica")

**Tiempo de ejecución:** ~30 segundos

---

### 5️⃣ **Riesgo + Cronograma**

**Ejemplo:** "Lead time de fibra es 9 meses (riesgo crítico)"

**Afecta:**
- Matriz de riesgos
- Cronograma del proyecto
- Plan de adquisiciones

**Tiempo de ejecución:** ~20 segundos

---

## 🎯 MEJORES PRÁCTICAS

### ✅ HACER:

1. **Ser específico en la justificación**
   - ❌ MAL: "Porque es mejor así"
   - ✅ BIEN: "Cumple norma UIC 518 y reduce costos de mantenimiento 15%"

2. **Incluir cálculos**
   - ✅ Mostrar cómo llegaste a la cantidad propuesta
   - ✅ Incluir fórmulas (520.78 ÷ 0.3 = 1,735)

3. **Referenciar normas**
   - ✅ UIC 518, IEC 62443, EN 50126, etc.
   - ✅ Estándares del contrato (AT1-AT10)

4. **Evaluar alternativas**
   - ✅ Mostrar que consideraste otras opciones
   - ✅ Explicar por qué elegiste esta

5. **Cuantificar impacto**
   - ✅ Impacto presupuestal ($330M ahorro)
   - ✅ Impacto en cronograma (+2 meses, -3 meses)

---

### ❌ NO HACER:

1. **Crear DT sin justificación sólida**
   - Cada DT debe tener fundamento técnico claro

2. **Cambiar cantidades "a ojo"**
   - Siempre respaldar con cálculos

3. **Ignorar impacto presupuestal**
   - Cambios >10% requieren aprobación gerencial

4. **Editar el YAML manualmente**
   - A menos que sepas exactamente qué haces

5. **Crear DTs duplicadas**
   - Verificar que no exista una DT similar

---

## 📞 ¿NECESITAS AYUDA?

### Contactos según tu pregunta:

| Pregunta | Contactar |
|:---------|:----------|
| ¿Cómo uso el Layout? | Ver este manual (arriba) |
| ¿Cómo genero una DT? | Ver [Guía de Decisiones Técnicas](#) |
| ¿Problema técnico? | ti@proyecto-ld-ch.com |
| ¿Aprobación de DT? | pmo@proyecto-ld-ch.com |
| ¿Consulta contractual? | administrador-contractual@proyecto.com |

---

## 📚 DOCUMENTOS RELACIONADOS

**Guías de usuario:**
- `GUIA_DECISIONES_TECNICAS.md` - Guía completa de DTs (este documento)
- `MANUAL_DE_USO.md` - Manual general del sistema
- `README.md` - Documentación técnica completa

**Documentos técnicos:**
- `ARCHITECTURE.md` - Arquitectura del sistema
- `.cursorrules` - Reglas de ejecución automática
- `ANALISIS_ARQUITECTURA_SISTEMA_v14.7.5_FINAL.md` - Análisis completo

**Soporte:**
- `scripts/REQUISITOS_SISTEMA.md` - Requisitos de instalación
- `MEJORAS_PROPUESTAS.md` - Mejoras de seguridad implementadas

---

## 🎉 RESUMEN

**Usar el sistema es FÁCIL:**

1. 🌐 **Acceder** → Portal web o archivo local
2. 🔍 **Explorar** → Click en las tarjetas del menú
3. 📋 **Proponer cambios** → Generar DT desde Layout
4. ✅ **Verificar** → Revisar que la DT se ejecutó
5. 📥 **Descargar** → Obtener documentos en Word

**No necesitas saber programar.**  
**Todo está diseñado para ser intuitivo.**

Si tienes dudas, contacta a PMO o revisa la [Guía de DTs](#).

---

**Manual creado:** 12 de Octubre 2025  
**Versión:** 1.0  
**Para:** Usuarios finales (técnicos y no técnicos)  
**Actualizado:** Con mejoras v14.7.5

