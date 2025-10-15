# SISTEMA DE EJECUCIÓN MODULAR DE DECISIONES TÉCNICAS v2.1

**Proyecto:** APP La Dorada-Chiriguaná  
**Fecha Implementación:** 15 Octubre 2025  
**Versión:** 2.1  
**Estado:** ✅ IMPLEMENTADO

---

## 🎯 PROBLEMA RESUELTO

### **Antes (v2.0):**
❌ Ejecución monolítica de DTs  
❌ Fallos en un paso detenían todo  
❌ Difícil identificar qué falló  
❌ Rollback todo o nada  
❌ Poca visibilidad del progreso

### **Ahora (v2.1):**
✅ Ejecución subsistema por subsistema  
✅ Fallos aislados no detienen todo  
✅ Identificación precisa de errores  
✅ Rollback selectivo por subsistema  
✅ Progreso claro y confirmación en cada paso

---

## 📋 CONCEPTO: SUBSISTEMAS

Una DT se divide en **SUBSISTEMAS INDEPENDIENTES**, cada uno con:

```yaml
subsistema:
  id: "layout"                    # Identificador único
  nombre: "Actualizar Layout"     # Nombre descriptivo
  orden: 1                        # Orden de ejecución
  critico: true                   # ¿Fallo detiene todo?
  dependencias: []                # Otros subsistemas requeridos
  
  archivos: [...]                 # Archivos a modificar
  scripts_ejecutar: [...]         # Scripts a correr
  validaciones: [...]             # Checks pre/post
  rollback: {...}                 # Cómo revertir
  resultado_esperado: "..."       # Qué debe quedar
```

### **Tipos de Subsistemas:**

1. **Críticos** (`critico: true`)
   - No se pueden saltar
   - Su fallo DETIENE toda la DT
   - Ejemplo: Actualizar WBS Presupuestal

2. **Opcionales** (`critico: false`)
   - Pueden saltarse si usuario decide
   - Su fallo NO detiene la DT
   - Ejemplo: Regenerar datos_wbs (puede tener bugs)

---

## 🔧 MODOS DE EJECUCIÓN

### **MODO 1: Automático** ⚡
- Ejecuta todos los subsistemas sin pausa
- Una confirmación inicial
- Útil cuando confías en la DT

### **MODO 2: Subsistema por subsistema** 🔧 (RECOMENDADO)
- Pausa antes de cada subsistema
- Usuario confirma cada paso
- Máximo control y visibilidad
- **Más seguro para DTs complejas**

### **MODO 3: Simulación** 👁️
- No modifica nada
- Solo muestra qué se haría
- Útil para pruebas

---

## 📊 FLUJO DE USUARIO (MODO 2 - RECOMENDADO)

### **PASO 1: Detección**
```
Usuario abre DT-TETRA-038-Criterio_10pct_Solapamiento.md

Cursor detecta:
  - Es una DT (archivo DT-*.md)
  - Tiene YAML con ejecucion_modular.activado: true
  - Hay 5 subsistemas definidos
```

### **PASO 2: Pregunta modo**
```
📋 DT-TETRA-038 detectada (5 subsistemas)

¿Cómo quieres ejecutar?

1. ⚡ Todo automático
2. 🔧 Subsistema por subsistema (RECOMENDADO)
3. 👁️  Solo simular
4. ❌ Cancelar

Tu elección [1/2/3/4]:
```

### **PASO 3: Usuario elige opción 2**

### **PASO 4: Subsistema 1**
```
┌─────────────────────────────────────────────────────────────┐
│ SUBSISTEMA 1/5: Actualizar Layout                         │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│ ID: layout                                                  │
│ Crítico: SÍ                                                │
│ Dependencias: ninguna                                       │
│                                                              │
│ ARCHIVOS A MODIFICAR (1):                                  │
│   • layout.md                                              │
│                                                              │
│ SCRIPTS A EJECUTAR (1):                                    │
│   • completar_39_estaciones_TETRA_10pct.ps1                │
│     Generar 39 estaciones con espaciamiento 13.71 km       │
│                                                              │
│ VALIDACIONES (2):                                          │
│   ✓ Verificar 39 estaciones generadas                      │
│   ✓ Verificar archivo layout.md existe                     │
│                                                              │
│ RESULTADO ESPERADO:                                         │
│   layout.md con 39 torres TETRA (EBT_01 a EBT_39)         │
│                                                              │
├─────────────────────────────────────────────────────────────┤
│ ¿Ejecutar este subsistema? [S/n/i/q]                      │
│   S = Sí, ejecutar ahora                                   │
│   n = No, saltar (NO PERMITIDO - es crítico)               │
│   i = Más información                                       │
│   q = Cancelar todo                                        │
└─────────────────────────────────────────────────────────────┘
```

### **PASO 5: Usuario dice "S"**

```
Ejecutando subsistema 1/5...

✓ Validando archivos existen...
✓ Ejecutando script: completar_39_estaciones_TETRA_10pct.ps1
  - Generando 39 estaciones...
  - Integrando en layout.md...
  - Limpiadas 40 líneas antiguas...
✓ Validando resultado...
  - 39 estaciones encontradas ✅
  - EBT_01 en PK 201+470 ✅
  - EBT_39 en PK 722+250 ✅

✅ SUBSISTEMA 1 COMPLETADO

Tiempo: 12 segundos

Archivos modificados:
  ✓ layout.md - 39 torres TETRA agregadas

Scripts ejecutados:
  ✓ completar_39_estaciones_TETRA_10pct.ps1 - Exitoso

Validaciones:
  ✓ 39 estaciones generadas - OK
  ✓ Archivo layout.md existe - OK

Resultado: layout.md actualizado con 39 torres TETRA
```

### **PASO 6: Continúa con subsistema 2, 3, 4, 5...**

Mismo proceso para cada uno.

### **PASO 7: Reporte final**
```
═══════════════════════════════════════════════════════════
  DT-TETRA-038 - REPORTE DE EJECUCIÓN MODULAR
═══════════════════════════════════════════════════════════

SUBSISTEMAS EJECUTADOS: 5/5

✅ EXITOSOS (4):
  1. layout - 12s
  2. layout_datos - 45s
  3. wbs_presupuestal - 8s
  5. documentos_maestros - 3s

⚠️  OMITIDOS (1):
  4. datos_wbs - (opcional, falló - error de rutas)

ARCHIVOS MODIFICADOS TOTAL: 5
  • layout.md
  • IX. WBS y Planificacion/layout_datos.js
  • IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md
  • scripts/completar_39_estaciones_TETRA_10pct.ps1 (nuevo)
  • DT-TETRA-038-Criterio_10pct_Solapamiento.md

SCRIPTS EJECUTADOS: 3/4
  ✓ completar_39_estaciones_TETRA_10pct.ps1
  ✓ convertir_layout_a_js.ps1
  ✓ (datos_wbs omitido)

TIEMPO TOTAL: 1 minuto 8 segundos

ESTADO FINAL: ⚠️ PARCIAL (4/5 exitosos, 1 opcional omitido)
```

---

## 🛠️ EJEMPLO DE FALLO Y RECUPERACIÓN

### **Escenario: Subsistema 3 falla**

```
❌ SUBSISTEMA 3/5 FALLÓ

Error: No se pudo actualizar WBS_Presupuestal

Archivo: IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md
Línea: 235
Detalle: Patrón no encontrado "2.1.100.*37"

¿Qué quieres hacer?

1. 🔄 Reintentar este subsistema
2. ⏭️  Continuar sin este subsistema (NO PERMITIDO - es crítico)
3. ↩️  Revertir cambios de este subsistema
4. 🛑 Cancelar toda la DT
5. ℹ️  Ver detalles del error

Tu elección [1/2/3/4/5]:
```

**Usuario elige 1 (Reintentar):**
- Cursor reintenta el mismo subsistema
- Puede funcionar si fue error temporal

**Usuario elige 3 (Revertir):**
- Cursor revierte SOLO los cambios del subsistema 3
- Subsistemas 1 y 2 permanecen intactos

**Usuario elige 4 (Cancelar):**
- Cursor detiene DT
- Marca subsistemas 1 y 2 como completados en log
- Subsistema 3, 4, 5 quedan como PENDIENTES

---

## 📁 ESTRUCTURA DE YAML MODULAR

```yaml
dt_metadata:
  id: "DT-TETRA-038"
  ejecucion_modular:
    activado: true  # ← CLAVE: activa modo modular
    modo: "secuencial_con_confirmacion"

subsistemas:  # ← Array de subsistemas
  
  - id: "layout"
    nombre: "Actualizar Layout"
    orden: 1
    critico: true
    dependencias: []
    archivos: [...]
    scripts_ejecutar: [...]
    validaciones: [...]
    rollback: {...}
    resultado_esperado: "..."
    
  - id: "wbs"
    nombre: "Actualizar WBS"
    orden: 2
    critico: true
    dependencias: ["layout"]  # ← Depende de que layout esté OK
    archivos: [...]
    ...
```

---

## ✅ VENTAJAS DEL SISTEMA MODULAR

| Aspecto | v2.0 (Monolítico) | v2.1 (Modular) |
|:--------|:------------------|:---------------|
| **Control** | Todo o nada | Granular por subsistema |
| **Debugging** | Difícil localizar fallo | Preciso (subsistema X falló) |
| **Rollback** | Todo o nada | Selectivo por subsistema |
| **Visibilidad** | Baja | Alta (progreso N/TOTAL) |
| **Seguridad** | Media | Alta (confirmación cada paso) |
| **Flexibilidad** | Baja | Alta (puedes saltar opcionales) |
| **Recuperación** | Difícil | Fácil (reintentar subsistema) |

---

## 📚 ARCHIVOS DEL SISTEMA

### **Creados:**
1. `DT-TEMPLATE-MODULAR.md` - Plantilla para DTs modulares
2. `.cursorrules` (actualizado v2.1) - Reglas de ejecución modular
3. `@@SISTEMA_DT_MODULAR_v2.1.md` - Esta documentación

### **A Crear:**
4. `scripts/validar_subsistemas.ps1` - Validador de YAML
5. Refactorización de DTs existentes a formato modular

---

## 🎓 CUÁNDO USAR MODO MODULAR

### **Usar modo modular cuando:**
- ✅ DT afecta múltiples archivos
- ✅ DT tiene scripts que pueden fallar
- ✅ DT modifica layout + WBS + maestros
- ✅ Quieres máximo control
- ✅ Estás probando una DT nueva

### **Usar modo automático cuando:**
- ✅ DT simple (1-2 archivos)
- ✅ DT ya probada antes
- ✅ Confías en los scripts
- ✅ Prisa (pero cuidado!)

---

## 🔮 FUTURAS MEJORAS

1. **Paralelización:**
   - Ejecutar subsistemas sin dependencias en paralelo
   - Ejemplo: layout y wbs simultáneamente

2. **Caché de resultados:**
   - Si reintentas subsistema, usar resultados previos

3. **Interfaz gráfica:**
   - Dashboard HTML con progreso visual

4. **Métricas:**
   - Tiempo promedio por subsistema
   - Tasa de éxito/fallo

5. **Snapshots:**
   - Git commit automático antes de cada subsistema

---

## 📞 COMANDOS ÚTILES

```bash
# Ejecutar DT en modo modular
"Ejecuta DT-TETRA-038 modo modular"

# Ejecutar solo un subsistema específico
"Ejecuta solo subsistema layout de DT-TETRA-038"

# Ver estado de una DT
"Estado DT-TETRA-038"

# Reintentar subsistema que falló
"Reintenta subsistema wbs_presupuestal"

# Revertir subsistema
"Revierte subsistema layout"
```

---

## 🏆 EJEMPLO REAL: DT-TETRA-038

Ver archivo refactorizado:
`II. Apendices Tecnicos/Decisiones_Tecnicas/DT-TETRA-038-MODULAR.md`

---

**Autor:** Sistema WBS Interactivo  
**Versión:** 2.1  
**Última actualización:** 15 Octubre 2025


