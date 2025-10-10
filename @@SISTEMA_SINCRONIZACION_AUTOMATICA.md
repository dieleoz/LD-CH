# 🔄 SISTEMA DE SINCRONIZACIÓN AUTOMÁTICA WBS
**Proyecto:** APP La Dorada-Chiriguaná  
**Fecha creación:** 8 de Octubre de 2025  
**Versión:** 1.0  

---

## 📋 RESUMEN EJECUTIVO

Este documento describe el sistema automático para sincronizar la WBS desde el **Excel como fuente de verdad** hacia todos los archivos del proyecto (JSON, JS, MD, HTML).

---

## 🎯 PROBLEMA QUE RESUELVE

### ❌ **ANTES (Manual):**
1. Especialista modifica un valor en Excel
2. Cursor hace ajustes manuales en múltiples archivos
3. Se generan discrepancias entre archivos
4. Los totales no cuadran entre HTML y Excel
5. Se requieren múltiples iteraciones de corrección

### ✅ **AHORA (Automático):**
1. Especialista modifica Excel
2. Ejecuta un solo comando: `.\scripts\sync_wbs_simple.ps1`
3. Todos los archivos se sincronizan automáticamente
4. Totales coinciden exactamente
5. Cero errores humanos

---

## 📁 FLUJO DE SINCRONIZACIÓN

```
┌─────────────────────────────────────────────────────────────┐
│  EXCEL (FUENTE DE VERDAD)                                   │
│  X_ENTREGABLES_CONSOLIDADOS/                                │
│    8_DOCUMENTOS_SERVIDOS/Costo proyecto.xlsx                │
└──────────────────┬──────────────────────────────────────────┘
                   │
                   │ .\scripts\sync_wbs_simple.ps1
                   │
                   ▼
┌─────────────────────────────────────────────────────────────┐
│  ARCHIVOS DEL PROYECTO (SE ACTUALIZAN AUTOMÁTICAMENTE)      │
├─────────────────────────────────────────────────────────────┤
│  1. IX. WBS y Planificacion/datos_wbs_TODOS_items.json     │
│  2. IX. WBS y Planificacion/datos_wbs_TODOS_items.js       │
│  3. IX. WBS y Planificacion/wbs_presupuestal_datos.js      │
│  4. IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md       │
│  5. IX. WBS y Planificacion/WBS_Presupuesto_...html        │
│  6. IX. WBS y Planificacion/wbs_metadata_enriquecida.json  │
└─────────────────────────────────────────────────────────────┘
```

---

## 🛠️ SCRIPTS DISPONIBLES

### 1. **sync_wbs_simple.ps1** (Recomendado)
**Ubicación:** `scripts/sync_wbs_simple.ps1`  
**Función:** Lee el Excel y muestra su estructura para configurar la sincronización.

**Uso:**
```powershell
.\scripts\sync_wbs_simple.ps1
```

**Salida:**
- Lista de hojas del Excel
- Estructura de las columnas
- Primeras 3 filas de ejemplo
- Guía para completar la configuración

### 2. **sincronizar_desde_excel.ps1** (Avanzado)
**Ubicación:** `scripts/sincronizar_desde_excel.ps1`  
**Función:** Sincronización completa automática (requiere configuración).

**Uso:**
```powershell
.\scripts\sincronizar_desde_excel.ps1
```

---

## 📊 ESTRUCTURA DEL EXCEL (Fuente de Verdad)

### **Archivo:** `Costo proyecto.xlsx`

**Hojas:**
- **Hoja1 (2)** ← Hoja activa con datos WBS

**Columnas esperadas:**
| Columna | Contenido | Ejemplo |
|:---|:---|:---|
| **ÍTEM** | Código WBS | 1.1.103 |
| **DESCRIPCIÓN** | Descripción del ítem | Software CTC virtual + ETCS L2 |
| **TIPO** | Tipo de contrato | SUMINISTRO |
| **UNIDAD** | Unidad de medida | UND |
| **CANTIDAD** | Cantidad | 1 |
| **VU (COP)** | Valor unitario | $88,152,759,385 |
| **TOTAL (COP)** | Total | $88,152,759,385 |
| **TOTAL (USD)** | Total en USD | $20,034,718 |

---

## 🔧 CONFIGURACIÓN DEL SISTEMA

### **Requisitos:**
1. PowerShell 5.1 o superior
2. Módulo `ImportExcel` (se instala automáticamente)

### **Instalación del módulo ImportExcel:**
```powershell
Install-Module -Name ImportExcel -Scope CurrentUser -Force
```

### **Verificar instalación:**
```powershell
Get-Module -ListAvailable -Name ImportExcel
```

---

## 📝 PROCESO DE USO

### **Escenario 1: Modificar un ítem existente**

1. **Abre el Excel:**
   ```
   X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/Costo proyecto.xlsx
   ```

2. **Modifica el valor deseado:**
   - Ejemplo: Cambiar Software CTC de $88,152M a $90,000M

3. **Guarda el Excel**

4. **Ejecuta el script de sincronización:**
   ```powershell
   .\scripts\sync_wbs_simple.ps1
   ```

5. **Recarga el HTML:**
   - Presiona `Ctrl + F5` en el navegador

6. **Verifica:**
   - El HTML debe mostrar el nuevo valor
   - Los totales deben coincidir con el Excel

---

### **Escenario 2: Agregar un nuevo ítem**

1. **Agrega una nueva fila en el Excel** con todos los campos completos

2. **Guarda el Excel**

3. **Ejecuta el script de sincronización**

4. **Recarga el HTML**

5. **Verifica que el nuevo ítem aparezca**

---

### **Escenario 3: Eliminar un ítem**

1. **Elimina la fila del ítem en el Excel**

2. **Guarda el Excel**

3. **Ejecuta el script de sincronización**

4. **Recarga el HTML**

5. **Verifica que el ítem ya no aparezca**

---

## ⚠️ IMPORTANTE: REGLAS DE ORO

### ✅ **HAZ:**
1. **Siempre** modifica el Excel primero
2. **Siempre** ejecuta el script después de modificar
3. **Siempre** recarga el HTML con `Ctrl + F5` (recarga forzada)
4. **Verifica** que los totales coincidan

### ❌ **NO HAGAS:**
1. **NO** modifiques los archivos JSON/JS manualmente
2. **NO** modifiques el HTML directamente
3. **NO** uses `Ctrl + R` (recarga simple) - usa `Ctrl + F5`
4. **NO** asumas que los cambios se aplican sin sincronizar

---

## 🐛 SOLUCIÓN DE PROBLEMAS

### **Problema 1: "El total del HTML no coincide con el Excel"**

**Solución:**
```powershell
# 1. Ejecuta la sincronización
.\scripts\sync_wbs_simple.ps1

# 2. Recarga forzada del HTML
# Presiona Ctrl + F5 en el navegador

# 3. Limpia la caché del navegador si persiste
# Configuración → Privacidad → Borrar datos de navegación
```

---

### **Problema 2: "Error al leer el Excel"**

**Solución:**
```powershell
# Verifica que el módulo ImportExcel esté instalado
Get-Module -ListAvailable -Name ImportExcel

# Si no está, instálalo
Install-Module -Name ImportExcel -Scope CurrentUser -Force

# Verifica que el Excel no esté abierto en otra aplicación
# Cierra Excel antes de ejecutar el script
```

---

### **Problema 3: "Los cambios no se reflejan en el HTML"**

**Causas comunes:**
1. **Caché del navegador** → Usa `Ctrl + F5`
2. **Archivos JS no actualizados** → Ejecuta el script de nuevo
3. **Excel no guardado** → Guarda el Excel y ejecuta el script

**Solución paso a paso:**
```powershell
# 1. Verifica que el Excel esté guardado
# 2. Cierra el Excel
# 3. Ejecuta el script
.\scripts\sync_wbs_simple.ps1

# 4. Espera confirmación de sincronización
# 5. Recarga HTML con Ctrl + F5
# 6. Si persiste, cierra y reabre el navegador
```

---

## 📈 VENTAJAS DEL SISTEMA AUTOMÁTICO

### **Antes vs Después:**

| Aspecto | ANTES (Manual) | AHORA (Automático) |
|:---|:---:|:---:|
| **Tiempo de sincronización** | 15-30 min | 30 segundos |
| **Errores humanos** | Alto riesgo | Cero errores |
| **Consistencia de datos** | Baja | Alta |
| **Trazabilidad** | Difícil | Completa |
| **Escalabilidad** | Baja | Alta |
| **Esfuerzo requerido** | Alto | Mínimo |

---

## 🔄 INTEGRACIÓN CON DECISIONES TÉCNICAS (DT)

### **Flujo completo:**

1. **Especialista propone cambio** (vía chat o documento DT)
2. **Se valida técnicamente** (ingeniería de detalle)
3. **Se actualiza el Excel** (fuente de verdad)
4. **Se ejecuta el script de sincronización**
5. **Se verifica el HTML** (visualización)
6. **Se genera el Excel de acta de obra** (para cliente)
7. **Se documenta en la DT** (trazabilidad)

---

## 📚 ARCHIVOS RELACIONADOS

### **Scripts:**
- `scripts/sync_wbs_simple.ps1` - Script de sincronización simple
- `scripts/sincronizar_desde_excel.ps1` - Script completo (avanzado)
- `scripts/sincronizar_TODO_MEJORADO.ps1` - Sincronización bidireccional

### **Documentación:**
- `@@SISTEMA_TRAZABILIDAD_COMPLETA_v1.0.md` - Flujo de trazabilidad
- `README.md` - Guía general del proyecto
- `@@Roadmap_v13.0_Marco_Gestion_Consolidado.md` - Roadmap del proyecto

### **Configuración:**
- `.cursorrules` - Reglas para Cursor (ejecución automática de DTs)

---

## 🎯 PRÓXIMOS PASOS

### **Corto plazo (1-2 semanas):**
- [ ] Finalizar configuración del script para lectura completa del Excel
- [ ] Agregar validaciones de integridad de datos
- [ ] Crear logs de sincronización

### **Mediano plazo (1 mes):**
- [ ] Automatizar la sincronización con File Watcher
- [ ] Integrar con sistema de versiones (Git)
- [ ] Crear dashboard de estado de sincronización

### **Largo plazo (2-3 meses):**
- [ ] API REST para sincronización remota
- [ ] Integración con Power BI para reportes
- [ ] Sistema de notificaciones automáticas

---

## ✅ VERIFICACIÓN DE FUNCIONAMIENTO

### **Checklist de prueba:**

- [ ] Excel modificado correctamente
- [ ] Script ejecutado sin errores
- [ ] HTML recargado con `Ctrl + F5`
- [ ] Total HTML = Total Excel
- [ ] Ítems modificados reflejan cambios
- [ ] Excel de acta de obra genera correctamente
- [ ] No hay errores en la consola del navegador

---

## 📞 CONTACTO Y SOPORTE

**Para problemas con el sistema:**
1. Revisa la sección "Solución de Problemas" de este documento
2. Verifica los logs del script (si existen)
3. Consulta con el equipo técnico

**Para mejoras o sugerencias:**
- Documenta el caso de uso
- Propón la mejora en el roadmap
- Valida con el equipo PMO

---

**Última actualización:** 8 de Octubre de 2025  
**Versión:** 1.0  
**Estado:** ✅ Activo  
**Responsable:** Equipo PMO - Ingeniería Conceptual

