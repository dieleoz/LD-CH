# 🎯 PLAN: WBS INTERACTIVA COMPLETA
## Reemplazar WBS actual con versión 100% interactiva

---

## ❌ **PROBLEMA ACTUAL**

Estás en: `WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguaná.html`

**Lo que ves:**
- Ítem 1.1.2 "Empalmes y conectores": $150,000,000 (Global)
- ❌ NO muestra criterio técnico (por qué ese valor)
- ❌ NO muestra riesgos asociados
- ❌ NO tiene botón para ajustar/modificar
- ❌ NO permite escribir observación DT

**Lo mismo pasa con ~200 ítems** - Solo muestran números sin contexto ni interactividad

---

## ✅ **SOLUCIÓN NECESARIA**

### **WBS donde CADA ítem muestre:**

```
ÍTEM 1.1.2 - Empalmes y conectores

Cantidad: 1 GL
Precio: $150,000,000
Total: $150,000,000
Tipo: SUMINISTRO
✅ Modificable

🎯 CRITERIO TÉCNICO:
• Estimación: ~6,000 fusiones de campo + conectores + splitters
• Desglose:
  - Conectores SC/APC: ~500 × $50,000 = $25M
  - Splitters 1:8: ~100 × $200,000 = $20M
  - Empalmes campo: ~6,000 × $15,000 = $90M
  - Accesorios: $15M
• Fuente: Estimación técnica V.3 Sección 5.4
• ⚠️ RIESGO: Estimación global puede ser insuficiente

⚠️ RIESGOS ASOCIADOS: 2
• R-FIBRA-010: Estimación insuficiente (Media/Medio)
• R-FIBRA-011: Falta detalle técnico (Alta/Medio)

💡 SUGERENCIAS:
• Desglosar en ítems específicos
• Validar con diseño detallado
• Agregar reserva 10%

[📝 Ajustar Cantidad] [💰 Ajustar Precio] [📊 Proponer Desglose]
```

---

## 🔧 **LO QUE VOY A CREAR**

### **Opción 1: REEMPLAZAR WBS actual** (Recomendado)
```
Crear: WBS_Presupuestal_COMPLETA_INTERACTIVA_v3.0.html

Características:
- Carga TODOS los ítems desde JSON
- Cada ítem tiene: Criterio + Riesgos + Botones
- Modal universal para ajustar cualquier ítem
- Análisis completo de 6 secciones para cualquier cambio
- Sistema bidireccional riesgos
```

### **Archivos a crear:**

1. **datos_wbs_completos_con_criterios.json** (Datos completos)
   - ~200 ítems con criterios y riesgos

2. **WBS_Presupuestal_COMPLETA_INTERACTIVA_v3.0.html**
   - Interfaz que carga JSON dinámicamente
   - Modal universal de ajuste
   - Análisis automático integrado

3. **scripts/extraer_wbs_a_json.ps1**
   - Lee WBS_Presupuestal_v2.0.md
   - Genera JSON con todos los ítems

4. **scripts/agregar_criterios_y_riesgos.ps1**
   - Lee CRITERIOS_TECNICOS_MAESTRO
   - Lee MATRIZ_RIESGOS_PMO
   - Enriquece JSON con criterios y riesgos

5. **scripts/sincronizar_riesgos_wbs.ps1**
   - Bidireccional: Matriz MD ↔ JSON ↔ Interfaz

---

## 🚀 **¿QUIERES QUE CREE TODO ESTO AHORA?**

Te daría:
- ✅ WBS con TODOS los ítems (no solo ejemplo)
- ✅ Cada ítem con criterio técnico visible
- ✅ Cada ítem con riesgos asociados
- ✅ Botón [Ajustar] en CADA ítem modificable
- ✅ Campo para escribir observación DT
- ✅ Análisis completo de TODO para cualquier ítem
- ✅ Sistema bidireccional funcional

**Tiempo estimado:** Crear 5 archivos + poblar JSON con ~50-100 ítems principales

**¿Procedo a crear el sistema COMPLETO?**

---

**Alternativa rápida:** Puedo actualizar el menú principal para que te lleve directamente a WBS_Presupuestal_INTERACTIVA_v3.0.html (que ya tiene el ejemplo funcional de las cajas) mientras creo la versión completa.

**¿Qué prefieres?**

