# 🔧 SCRIPTS DE SINCRONIZACIÓN
## Sistema Bidireccional WBS ↔ Riesgos ↔ Terminal

---

## 📋 **SCRIPTS DISPONIBLES**

### **1. sincronizar_riesgos_wbs.ps1** ⭐
**Propósito:** Convierte MATRIZ_RIESGOS_PMO a JSONs para WBS Interactiva

**Cuándo ejecutar:**
- Después de actualizar MATRIZ_RIESGOS_PMO desde terminal
- Cuando PMO agrega/modifica riesgos
- Antes de presentar WBS a especialistas

**Cómo ejecutar:**
```powershell
cd scripts
.\sincronizar_riesgos_wbs.ps1
```

**Output:**
- Crea JSONs en: `IX. WBS y Planificacion/riesgos_cache/`
- Un JSON por ítem WBS con riesgos
- Timestamp de última actualización

---

### **2. generar_wbs_interactiva_completa.ps1**
**Propósito:** Genera WBS Interactiva con TODOS los ítems

**Cuándo ejecutar:**
- Primera vez (setup inicial)
- Cuando se agregan nuevos ítems a WBS
- Cuando se actualizan criterios técnicos

**Cómo ejecutar:**
```powershell
cd scripts
.\generar_wbs_interactiva_completa.ps1
```

---

## 🔄 **FLUJO DE USO**

### **Setup Inicial (Una sola vez):**
```
1. Ejecutar: generar_wbs_interactiva_completa.ps1
2. Ejecutar: sincronizar_riesgos_wbs.ps1
3. Abrir: WBS_Presupuestal_COMPLETA_INTERACTIVA_v3.0.html
```

### **Uso Diario:**
```
PMO actualiza riesgo → Ejecuta sincronizar_riesgos_wbs.ps1 → Interfaz actualiza
```

---

**Elaborado por:** Administrador Contractual EPC  
**Fecha:** 7 de Octubre de 2025  

