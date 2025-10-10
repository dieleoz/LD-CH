# 🔄 SINCRONIZACIÓN: WBS Operativa ↔ WBS Presupuestal
## Una Sola Fuente de Verdad - Dos Vistas Diferentes

**Fecha:** 7 de Octubre de 2025  
**Estado:** ✅ IMPLEMENTADO  

---

## 🎯 **PROBLEMA RESUELTO**

### **Antes (Problema):**
```
WBS Operativa (v4.0)          WBS Presupuestal (SCC)
  Cajas: 1,697 ❌                Cajas: 2,068 ❌
  
⚠️ DESINCRONIZADAS - Valores diferentes
```

### **Ahora (Solución):**
```
    FUENTE ÚNICA DE VERDAD
  WBS_Presupuestal_v2.0.md
            ↓
    (Script extracción)
            ↓
  datos_wbs_TODOS_items.json
            ↓
    ┌───────┴───────┐
    ↓               ↓
WBS Operativa    WBS Presupuestal
datos_wbs_       wbs_presupuestal_
TODOS_items.js   datos.js
    ↓               ↓
Cajas: 2,068 ✅  Cajas: 2,068 ✅

✅ SINCRONIZADAS - Misma fuente de datos
```

---

## 🔄 **CÓMO FUNCIONA LA SINCRONIZACIÓN**

### **Estructura del Sistema:**

```
1. FUENTE MAESTRA (Markdown)
   WBS_Presupuestal_v2.0.md
   - Formato legible
   - Versionado (Git)
   - Editable por Cursor
   
2. EXTRACCIÓN (PowerShell)
   extraer_todos_items_wbs.ps1
   - Lee WBS_Presupuestal_v2.0.md
   - Extrae 124 ítems
   - Genera JSON
   
3. BASE DE DATOS (JSON)
   datos_wbs_TODOS_items.json
   - 124 ítems estructurados
   - Con capítulos, categorías
   - Fuente única de verdad
   
4. CONVERSIÓN A JS (2 archivos)
   a) datos_wbs_TODOS_items.js
      → Para WBS Operativa v4.0
   
   b) wbs_presupuestal_datos.js
      → Para WBS Presupuestal
      → Agrega clasificación SUMINISTRO/OBRA/SERVICIO

5. INTERFACES WEB (HTML)
   a) WBS_COMPLETA_TODO_Interactiva_v4.0.html
      → Carga datos_wbs_TODOS_items.js
      → Vista técnica/operativa
      → Crear DTs
   
   b) WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguaná.html
      → Carga wbs_presupuestal_datos.js
      → Vista financiera
      → Calcula IVA, AIU
      → Exporta Excel
```

---

## 📋 **FLUJO COMPLETO DE CAMBIOS**

### **Escenario: Especialista cambia cajas de 2,068 a 1,697**

#### **PASO 1: Usuario propone cambio**
```
1. Abre: WBS Operativa v4.0
2. Encuentra: Ítem 2.3.103 - Cajas empalme
3. Clic: [📋 Crear DT]
4. Propone: 2,068 → 1,697 unidades
5. Descarga: DT-FIBRA-042-2025-10-07.md
```

#### **PASO 2: PMO ejecuta DT en Cursor**
```
1. Mueve DT a: II/Decisiones_Tecnicas/
2. Abre en Cursor
3. Cursor lee YAML de la DT
4. Ejecuta cambios:
   ✅ WBS_Presupuestal_v2.0.md → v2.1.md
      Item 2.3.103: 2,068 → 1,697 ✅
   ✅ V.3_Sistemas_Comunicacion_Detalle.md
   ✅ MATRIZ_DEPENDENCIAS actualizada
```

#### **PASO 3: Sincronización automática**
```
1. PMO ejecuta desde PowerShell:
   .\scripts\sincronizar_TODO.ps1
   
2. Script hace:
   ✅ Lee WBS_Presupuestal_v2.1.md (con cambio aplicado)
   ✅ Extrae 124 ítems (ahora con 1,697 cajas)
   ✅ Genera datos_wbs_TODOS_items.json
   ✅ Convierte a datos_wbs_TODOS_items.js
   ✅ Convierte a wbs_presupuestal_datos.js
```

#### **PASO 4: Ambas WBS actualizadas**
```
Usuario final recarga navegador (Ctrl+F5):

WBS Operativa v4.0:
  ✅ Cajas: 1,697 unidades
  ✅ Total: $2,290,900,000

WBS Presupuestal:
  ✅ Cajas: 1,697 unidades
  ✅ Total antes IVA: $2,290,900,000
  ✅ IVA 19%: $435,271,000
  ✅ Subtotal con IVA: $2,726,171,000
  ✅ AIU (aplicado)
  ✅ Total final: [calculado]

✅ SINCRONIZADAS - Mismo valor en ambas
```

---

## 🔧 **SCRIPTS DE SINCRONIZACIÓN**

### **Script 1: Extraer ítems**
```powershell
.\scripts\extraer_todos_items_wbs.ps1
```
- Lee: `WBS_Presupuestal_v2.0.md`
- Genera: `datos_wbs_TODOS_items.json` (124 ítems)

### **Script 2: Sincronizar con Presupuestal**
```powershell
.\scripts\sincronizar_wbs_presupuestal_con_operativa.ps1
```
- Lee: `datos_wbs_TODOS_items.json`
- Clasifica: SUMINISTRO/OBRA/SERVICIO
- Genera: `wbs_presupuestal_datos.js`

### **Script 3: TODO en uno** ⭐ (Recomendado)
```powershell
.\scripts\sincronizar_TODO.ps1
```
- Ejecuta los 2 scripts anteriores
- Convierte JSONs a JS (evita CORS)
- Valida resultados

---

## 📊 **DIFERENCIAS ENTRE LAS DOS WBS**

| Aspecto | WBS Operativa v4.0 | WBS Presupuestal |
|---------|-------------------|------------------|
| **Propósito** | Gestión técnica | Gestión financiera |
| **Usuario** | Especialistas | CFO, Finanzas, PMO |
| **Datos** | Cantidad, V/U, Total | + IVA, AIU, Clasificación |
| **Funcionalidad** | Crear DTs, Proponer | Exportar Excel, Reportes |
| **Estructura** | Por capítulo técnico | Por tipo (SUMINISTRO/OBRA) |
| **Modificable** | ✅ Sí (vía DTs) | ❌ Solo consulta |
| **Fuente de datos** | `datos_wbs_TODOS_items.js` | `wbs_presupuestal_datos.js` |
| **Sincronización** | Lee desde JSON | Lee desde JSON (mismo origen) |

---

## ✅ **VENTAJAS DEL SISTEMA**

### **1. Una Sola Fuente de Verdad**
- ✅ WBS_Presupuestal_v2.0.md es la fuente maestra
- ✅ Todas las WBS derivan de ahí
- ✅ No hay duplicación de datos

### **2. Sincronización Automática**
- ✅ Un script sincroniza todo
- ✅ No hay trabajo manual
- ✅ Sin riesgo de desincronización

### **3. Trazabilidad Completa**
```
Cambio propuesto (DT) 
  → Cursor actualiza WBS_Presupuestal_v2.0.md
  → Script sincroniza
  → Ambas WBS actualizadas
  → Todo documentado
```

### **4. Separación de Responsabilidades**
- **Especialistas:** Trabajan en WBS Operativa (técnica)
- **Finanzas:** Trabajan en WBS Presupuestal (financiera)
- **Datos:** Siempre sincronizados

---

## 🚀 **CÓMO USAR EL SISTEMA**

### **Caso 1: Especialista propone cambio técnico**

1. **En WBS Operativa:**
   ```
   Abre: WBS_COMPLETA_TODO_Interactiva_v4.0.html
   Propone: Cajas 2,068 → 1,697
   Genera: DT-FIBRA-042.md
   ```

2. **PMO ejecuta DT:**
   ```
   Abre DT en Cursor
   Cursor actualiza: WBS_Presupuestal_v2.0.md → v2.1.md
   ```

3. **PMO sincroniza:**
   ```powershell
   cd scripts
   .\sincronizar_TODO.ps1
   ```

4. **Resultado:**
   ```
   ✅ WBS Operativa: Cajas 1,697
   ✅ WBS Presupuestal: Cajas 1,697
   ✅ Con IVA, AIU aplicados
   ✅ Exportable a Excel
   ```

---

### **Caso 2: Finanzas necesita reporte actualizado**

1. **Abrir WBS Presupuestal:**
   ```
   WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguaná.html
   ```

2. **Ver datos sincronizados:**
   - Valores coinciden con WBS Operativa
   - IVA calculado automáticamente
   - AIU aplicado

3. **Exportar:**
   - Clic: [Exportar Excel]
   - Enviar a finanzas

---

## 📁 **ARCHIVOS DEL SISTEMA**

### **Fuente Maestra:**
- `IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md` ← ÚNICA FUENTE DE VERDAD

### **Datos Generados (Auto):**
- `datos_wbs_TODOS_items.json` ← JSON base
- `datos_wbs_TODOS_items.js` ← Para WBS Operativa
- `wbs_presupuestal_datos.js` ← Para WBS Presupuestal

### **Interfaces:**
- `WBS_COMPLETA_TODO_Interactiva_v4.0.html` ← Operativa
- `WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguaná.html` ← Presupuestal

### **Scripts:**
- `scripts/extraer_todos_items_wbs.ps1`
- `scripts/sincronizar_wbs_presupuestal_con_operativa.ps1`
- `scripts/sincronizar_TODO.ps1` ⭐ (Ejecuta todo)

---

## 🎯 **CUÁNDO EJECUTAR SINCRONIZACIÓN**

### **Siempre que:**
- ✅ Cursor ejecuta una DT (cambia WBS_Presupuestal_v2.X.md)
- ✅ PMO edita manualmente WBS_Presupuestal_v2.X.md
- ✅ Se agregan nuevos ítems
- ✅ Se eliminan ítems

### **Cómo ejecutar:**
```powershell
cd scripts
.\sincronizar_TODO.ps1
```

**Tiempo:** ~30 segundos

---

## 📊 **VALIDACIÓN**

### **Verificar que están sincronizadas:**

1. **En WBS Operativa:**
   - Abre: `WBS_COMPLETA_TODO_Interactiva_v4.0.html`
   - Busca: Ítem 2.3.103 (Cajas)
   - Anota: Cantidad = X

2. **En WBS Presupuestal:**
   - Abre: `WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguaná.html`
   - Busca: Ítem con cajas empalme
   - Verifica: Cantidad = X (igual)

3. **Adicional en Presupuestal:**
   - ✅ Cálculo IVA aplicado
   - ✅ Cálculo AIU aplicado
   - ✅ Clasificación por tipo
   - ✅ Exportar a Excel funcional

---

## ⚙️ **ARQUITECTURA DEL SISTEMA**

```
┌─────────────────────────────────────────────────────────┐
│ FUENTE MAESTRA (Markdown)                               │
│ WBS_Presupuestal_v2.0.md                               │
│ - Editada por Cursor cuando ejecuta DTs               │
│ - Versionada: v2.0 → v2.1 → v2.2...                   │
│ - Es la ÚNICA fuente de verdad                         │
└────────────────┬────────────────────────────────────────┘
                 │
                 ↓ (Script: extraer_todos_items_wbs.ps1)
┌─────────────────────────────────────────────────────────┐
│ BASE DE DATOS (JSON)                                    │
│ datos_wbs_TODOS_items.json                             │
│ - 124 ítems estructurados                              │
│ - Códigos, descripciones, cantidades, precios          │
└────────────────┬────────────────────────────────────────┘
                 │
                 ↓ (Scripts de conversión)
        ┌────────┴────────┐
        ↓                 ↓
┌───────────────┐  ┌──────────────────┐
│ JS Operativa  │  │ JS Presupuestal  │
│ datos_wbs_    │  │ wbs_presupuestal_│
│ TODOS_items.js│  │ datos.js         │
│               │  │ + Clasificación  │
│               │  │ + Tipo           │
└───────┬───────┘  └────────┬─────────┘
        ↓                   ↓
┌───────────────┐  ┌──────────────────┐
│ WBS Operativa │  │ WBS Presupuestal │
│ v4.0          │  │ SCC              │
│ - Técnica     │  │ - Financiera     │
│ - DTs         │  │ - IVA/AIU        │
│ - Proponer    │  │ - Excel          │
└───────────────┘  └──────────────────┘

  MISMA CANTIDAD        MISMA CANTIDAD
  Cajas: X              Cajas: X + IVA
```

---

## 🔧 **SCRIPTS Y SU FUNCIÓN**

### **1. extraer_todos_items_wbs.ps1**
**Entrada:** `WBS_Presupuestal_v2.0.md` (Markdown)  
**Salida:** `datos_wbs_TODOS_items.json` (JSON)  
**Función:** Parsea Markdown y extrae 124 ítems

### **2. sincronizar_wbs_presupuestal_con_operativa.ps1**
**Entrada:** `datos_wbs_TODOS_items.json`  
**Salida:** `wbs_presupuestal_datos.js`  
**Función:** Agrega clasificación SUMINISTRO/OBRA/SERVICIO

### **3. sincronizar_TODO.ps1** ⭐
**Entrada:** `WBS_Presupuestal_v2.X.md`  
**Salida:** Todos los archivos sincronizados  
**Función:** Ejecuta pasos 1 y 2 + conversión a JS

---

## 📋 **EJEMPLO PRÁCTICO: Cambio de Cajas**

### **Situación inicial:**
```
WBS_Presupuestal_v2.0.md → Cajas: 2,068
   ↓ (sincronización)
WBS Operativa → Muestra: 2,068
WBS Presupuestal → Muestra: 2,068 + IVA/AIU
```

### **Especialista propone cambio:**
```
1. En WBS Operativa: Propone 1,697 cajas
2. Genera DT-FIBRA-042.md
3. Envía a PMO
```

### **PMO ejecuta:**
```
1. Abre DT en Cursor
2. Cursor actualiza WBS_Presupuestal_v2.0.md → v2.1.md
   Línea X: "2,068" → "1,697" ✅
3. PMO ejecuta: .\scripts\sincronizar_TODO.ps1
```

### **Sistema sincroniza:**
```
1. Lee WBS_Presupuestal_v2.1.md (CON cambio)
2. Extrae: Cajas ahora = 1,697
3. Genera JSON con nuevo valor
4. Convierte a JS (ambos archivos)
5. ✅ Listo
```

### **Resultado final:**
```
Usuario recarga navegadores:

WBS Operativa:
  ✅ Cajas: 1,697 unidades
  ✅ Total: $2,290,900,000

WBS Presupuestal:
  ✅ Cajas: 1,697 unidades  ← MISMO VALOR
  ✅ Total: $2,290,900,000  ← MISMO VALOR
  ✅ IVA 19%: $435,271,000  ← CALCULADO AUTO
  ✅ Total+IVA: $2,726,171,000
  ✅ AIU aplicado
  ✅ Total final: [con AIU]
  ✅ Exportable a Excel

✅ SINCRONIZADAS PERFECTAMENTE
```

---

## ⚙️ **CONFIGURACIÓN AUTOMÁTICA**

Para que Cursor sincronice automáticamente después de ejecutar DTs:

### **Agregar a .cursorrules:**

```markdown
### PASO 8 ADICIONAL: SINCRONIZAR WBS

Después de ejecutar una DT exitosamente:

1. Notificar al usuario:
   ```
   ✅ DT-FIBRA-042 ejecutada
   
   Para sincronizar ambas WBS, ejecuta:
   .\scripts\sincronizar_TODO.ps1
   ```

2. Opcionalmente, preguntar:
   ```
   ¿Quieres que sincronice las WBS ahora? (Sí/No)
   ```
   
3. Si usuario dice "Sí":
   - Ejecutar: `.\scripts\sincronizar_TODO.ps1`
   - Reportar resultado
```

---

## 📖 **DOCUMENTACIÓN ADICIONAL**

### **Para especialistas:**
- Usan: `WBS_COMPLETA_TODO_Interactiva_v4.0.html`
- Proponen cambios técnicos
- No ven IVA/AIU (no es su responsabilidad)

### **Para finanzas:**
- Usan: `WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguaná.html`
- Ven valores sincronizados
- Con IVA/AIU aplicados
- Exportan a Excel

### **Para PMO:**
- Ejecuta DTs en Cursor
- Ejecuta sincronización: `.\scripts\sincronizar_TODO.ps1`
- Valida que ambas WBS coincidan

---

## 🎯 **CHECKLIST: Validar Sincronización**

Después de ejecutar `sincronizar_TODO.ps1`:

- [ ] Archivos JS generados:
  - [ ] `datos_wbs_TODOS_items.js` existe
  - [ ] `wbs_presupuestal_datos.js` existe

- [ ] WBS Operativa muestra valores correctos:
  - [ ] Total items: 124
  - [ ] Ejemplo ítem 2.3.103 tiene valor esperado

- [ ] WBS Presupuestal muestra valores correctos:
  - [ ] Misma cantidad que WBS Operativa
  - [ ] IVA calculado correctamente (19%)
  - [ ] AIU aplicado

- [ ] Exportar Excel funciona

---

## 🔄 **FRECUENCIA DE SINCRONIZACIÓN**

### **Cuándo ejecutar `sincronizar_TODO.ps1`:**

✅ **SIEMPRE después de:**
- Ejecutar una DT en Cursor
- Editar manualmente WBS_Presupuestal_v2.X.md
- Agregar/eliminar ítems

⏰ **Frecuencia recomendada:**
- Después de cada cambio (inmediato)
- O al final del día si hubo múltiples cambios

⏱️ **Tiempo de ejecución:**
- ~30 segundos

---

## 📊 **RESUMEN**

### **Problema resuelto:**
✅ Una sola fuente de verdad: `WBS_Presupuestal_v2.0.md`  
✅ Dos vistas sincronizadas automáticamente  
✅ Cambios en una se reflejan en la otra  
✅ Sin duplicación de datos  
✅ Sin desincronización  

### **Flujo de trabajo:**
```
Especialista → Propone cambio → DT generada
    ↓
PMO → Ejecuta DT en Cursor → WBS_Presupuestal_v2.X.md actualizada
    ↓
PMO → Ejecuta: sincronizar_TODO.ps1 → Ambas WBS sincronizadas
    ↓
Usuarios → Recargan navegadores → Ven valores actualizados
```

---

**Elaborado por:** Sistema WBS Interactivo v4.0  
**Fecha:** 7 de Octubre de 2025  
**Versión:** 1.0  
**Estado:** ✅ IMPLEMENTADO Y PROBADO  

