# 🔧 SCRIPTS DEL PROYECTO v14.7
## Sistema WBS Interactivo + Layout Maestro + Workflow Automático

**Última actualización:** 11 de Octubre 2025  
**Versión:** v14.7.1 - Scripts organizados (58 activos + 23 legacy)  
**Estado:** ✅ CARPETA ORGANIZADA - Workflow principal visible  

---

## 📋 **SCRIPTS PRINCIPALES (CORE WORKFLOW)**

### **⭐⭐ 1. cocinar.ps1** - Consolidar Ingeniería
**Propósito:** Detecta DTs recientes y consolida la "cocina" (I-VI) en documentos ejecutivos

**Funcionalidad v14.7:**
- ✅ **PRE-COCINA:** Detecta DTs con `impacto_layout: true`
- ✅ **Ejecución automática:** Llama scripts especializados (FIBRA, TETRA)
- ✅ **Consolidación:** Extrae y combina ingeniería por sistema

**Cuándo ejecutar:**
- Después de generar DTs desde Layout o WBS
- Para consolidar cambios técnicos

**Cómo ejecutar:**
```powershell
.\scripts\cocinar.ps1 -Sistema 02  # Sistema específico (ej: 02 = Telecomunicaciones)
.\scripts\cocinar.ps1 -Todo        # Todos los sistemas
```

---

### **⭐⭐ 2. servir.ps1** - Generar Entregables Cliente
**Propósito:** Exporta documentos consolidados a Word (.docx) y HTML (.html)

**Funcionalidad:**
- ✅ Lee documentos consolidados de `X_ENTREGABLES_CONSOLIDADOS/7_SISTEMAS_EJECUTIVOS/`
- ✅ Genera Word para cliente
- ✅ Genera HTML para presentaciones

**Cuándo ejecutar:**
- Después de `cocinar.ps1`
- Para generar entregables formales

**Cómo ejecutar:**
```powershell
.\scripts\servir.ps1 -Sistema 02   # Sistema específico
.\scripts\servir.ps1 -Todo         # Todos los sistemas
```

---

### **⭐ 3. servir_ingenieria_completo.ps1** - Workflow Automático COMPLETO
**Propósito:** Ejecuta cocinar + servir en un solo comando (v14.7)

**Funcionalidad:**
- ✅ Llama automáticamente a `cocinar.ps1`
- ✅ Llama automáticamente a `servir.ps1`
- ✅ Workflow completo en 1 comando

**Cuándo ejecutar:**
- Después de crear una DT
- Para actualizar todo el sistema automáticamente

**Cómo ejecutar:**
```powershell
.\scripts\servir_ingenieria_completo.ps1 -Sistema 02  # Recomendado v14.7
```

---

### **⭐ 4. sincronizar_SISTEMA_COMPLETO_v14.3.ps1** - Sincronización WBS
**Propósito:** Sincroniza 3 interfaces HTML (Riesgos + Reporte + Cronograma)

**Funcionalidad:**
- ✅ Cache-busting automático
- ✅ Sincroniza en ~6 segundos

**Cuándo ejecutar:**
- Para actualizar interfaces WBS sin cambios en ingeniería
- Después de modificar riesgos manualmente

**Cómo ejecutar:**
```powershell
.\scripts\sincronizar_SISTEMA_COMPLETO_v14.3.ps1
```

---

### **⭐ 5. regenerar_fibra_1824_cajas.ps1** - Fibra Óptica Especializado
**Propósito:** Regenera layout completo de fibra óptica (1,823 cajas + 130 domos)

**Funcionalidad:**
- ✅ Limpia elementos antiguos (idempotente)
- ✅ Genera 1,735 cajas lineales (cada 300m)
- ✅ Genera 88 cajas en 22 puentes
- ✅ Genera 130 domos fusión (cada 4km)
- ✅ Actualiza `layout.md` y `layout_datos.js`

**Cuándo ejecutar:**
- Llamado automáticamente por `cocinar.ps1` cuando detecta DT-FIBRA con `impacto_layout: true`
- Puede ejecutarse manualmente si necesario

**Cómo ejecutar:**
```powershell
.\scripts\regenerar_fibra_1824_cajas.ps1
```

---

## 📦 **SCRIPTS ESPECIALIZADOS**

### **LAYOUT:**
- `convertir_layout_a_js.ps1` - Convierte layout.md a layout_datos.js
- `generar_layout_integral_completo.ps1` - Layout integral JSON completo
- `validar_layout_completo.ps1` - Validación de layout
- `eliminar_balizas_layout.ps1` - Elimina balizas (señalización virtual)

### **TETRA:**
- `completar_37_estaciones_TETRA.ps1` - Genera 37 estaciones TETRA
- `ejecutar_DT_TETRA_037.ps1` - Ejecuta DT de TETRA

### **DECISIONES TÉCNICAS:**
- `ejecutar_DT_universal.ps1` - Ejecutor universal de DTs

### **SINCRONIZACIÓN:**
- `sincronizar_cronograma.ps1` - Sincroniza cronograma
- `sincronizar_reporte_gerencial.ps1` - Sincroniza reporte
- `sincronizar_riesgos_a_html.ps1` - Sincroniza riesgos

### **EXTRACCIÓN Y COMBINACIÓN:**
- `extraer_TODA_la_cocina_v4.ps1` - Extrae ingeniería (versión actual)
- `combinar_TODA_la_cocina.ps1` - Combina documentos

### **GESTIÓN:**
- `gestionar_riesgos.ps1` - Gestión terminal de riesgos
- `generar_reporte_gerencial.ps1` - Genera reporte Pareto

---

## 🔄 **FLUJO DE USO PRINCIPAL (v14.7)**

### **Workflow Recomendado (1 comando):**
```powershell
# 1. Generar DT desde WBS_Layout_Maestro.html o WBS_COMPLETA_TODO_Interactiva_v4.0.html
# 2. Guardar DT en: II. Apendices Tecnicos/Decisiones_Tecnicas/
# 3. Ejecutar:
.\scripts\servir_ingenieria_completo.ps1 -Sistema 02

# El sistema hace TODO automáticamente:
# ✅ Detecta DT con impacto_layout: true
# ✅ Ejecuta script especializado (regenerar_fibra, completar_TETRA)
# ✅ Consolida ingeniería (cocinar)
# ✅ Genera entregables (servir)
```

### **Workflow Manual (2 comandos):**
```powershell
.\scripts\cocinar.ps1 -Sistema 02   # Consolida ingeniería
.\scripts\servir.ps1 -Sistema 02    # Genera entregables
```

### **Solo Sincronizar WBS (Sin DTs):**
```powershell
.\scripts\sincronizar_SISTEMA_COMPLETO_v14.3.ps1  # ~6 segundos
```

---

## 📁 **ORGANIZACIÓN**

### **Carpeta principal (58 scripts activos):**
- Scripts de workflow principal
- Scripts especializados por sistema
- Scripts de sincronización
- Scripts de análisis y gestión

### **Subcarpeta legacy_scripts/ (23 scripts):**
- Versiones antiguas de scripts
- Scripts reemplazados por funcionalidad HTML
- Scripts experimentales no usados
- Preservados para referencia histórica

---

## 📊 **ESTADÍSTICAS**

- **Scripts activos:** 58
- **Scripts legacy:** 23 (en `legacy_scripts/`)
- **Scripts core:** 5 principales
- **Última limpieza:** 11-Oct-2025
- **Reducción carpeta principal:** -28%

---

**Última actualización:** 11 de Octubre 2025  
**Versión:** v2.0 - Actualizado para v14.7.1  
**Estado:** ✅ CARPETA ORGANIZADA Y DOCUMENTADA  

