# 📂 GUÍA DE ORGANIZACIÓN DE ARCHIVOS
## Ordenar y Limpiar Proyecto después de Implementación

**Fecha:** 7 de Octubre de 2025  
**Estado:** Sistema implementado - Listo para organizar  

---

## 🎯 **OBJETIVO**

Organizar los 40+ archivos creados hoy en una estructura limpia y mantenible.

---

## 📋 **ARCHIVOS A MANTENER EN RAÍZ (@@)**

### **Documentos de Inicio Rápido (4):**
```
✅ MANTENER en raíz:
├── @@LEEME_SISTEMA_COMPLETO.md ⭐ (Inicio rápido)
├── @@Roadmap_v13.0_Marco_Gestion_Consolidado.md (v13.1)
├── README.md
└── .cursorrules
```

### **Archivos @@SISTEMA_* (Consolidar en carpeta):**
```
📁 Crear: @@Documentacion_Sistema_WBS/
├── @@SISTEMA_COMPLETO_FINAL_7Oct2025.md
├── @@SISTEMA_DT_YAML_IMPLEMENTADO.md
├── @@SISTEMA_RIESGOS_DINAMICO_Integrado.md
├── @@SISTEMA_COMPLETO_WBS_Sincronizado.md
├── @@INTEGRACION_5_Interfaces_WBS.md
├── @@SINCRONIZACION_WBS_Operativa_Presupuestal.md
├── @@WBS_v4_TODOS_Items_y_Nuevos_Capitulos.md
├── @@CRITERIOS_TECNICOS_en_WBS.md
├── @@SOLUCION_Problema_Carga_WBS_v4.md
├── @@COMO_PROBAR_AHORA.md
├── @@PLAN_WBS_Interactiva_Completa.md
├── @@CHECKLIST_Sistema_Completo.md
├── @@RESUMEN_EJECUTIVO_Sistema_WBS_7Oct2025.md
├── @@INDICE_SISTEMA_WBS_Interactivo_7Oct2025.md
└── @@ARCHIVOS_CREADOS_7Oct2025_FINAL.md
```

---

## 📁 **ESTRUCTURA FINAL RECOMENDADA**

```
📂 Proyecto/
│
├── README.md ⭐
├── @@LEEME_SISTEMA_COMPLETO.md ⭐
├── @@Roadmap_v13.0_Marco_Gestion_Consolidado.md (v13.1) ⭐
├── .cursorrules ⭐
│
├── 📁 @@Documentacion_Sistema_WBS/ ⭐ NUEVA
│   ├── @@SISTEMA_COMPLETO_FINAL_7Oct2025.md
│   ├── @@SISTEMA_DT_YAML_IMPLEMENTADO.md
│   ├── @@SISTEMA_RIESGOS_DINAMICO_Integrado.md
│   ├── ... (15 documentos)
│   └── README_Documentacion.md (índice)
│
├── 📁 IX. WBS y Planificacion/
│   ├── WBS_Menu_Principal.html ⭐ PUNTO DE ENTRADA
│   │
│   ├── 📁 Interfaces/ (Opcional - organizar)
│   │   ├── WBS_COMPLETA_TODO_Interactiva_v4.0.html ⭐
│   │   ├── WBS_Presupuestal_COMPLETA_INTERACTIVA_v3.0.html
│   │   ├── WBS_Presupuestal_INTERACTIVA_v3.0.html
│   │   ├── WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguaná.html
│   │   ├── WBS_Reporte_Gerencial.html
│   │   ├── WBS_Cronograma_Propuesta.html
│   │   ├── WBS_Analisis_Riesgos.html
│   │   └── WBS_EDT_Detalle.html
│   │
│   ├── 📁 Datos/ (Opcional - organizar)
│   │   ├── datos_wbs_TODOS_items.json/.js ⭐
│   │   ├── wbs_presupuestal_datos.js ⭐
│   │   ├── criterios_tecnicos_base.json/.js ⭐
│   │   ├── duraciones_cronograma.json/.js ⭐
│   │   ├── reporte_gerencial_data.js ⭐
│   │   ├── riesgos_proyecto.js ⭐
│   │   └── SISTEMA_Analisis_Riesgos_Automatico.js ⭐
│   │
│   ├── 📁 riesgos_cache/
│   │   ├── riesgos_item_1.1.2.json
│   │   └── riesgos_item_1.1.3.json
│   │
│   └── WBS_Presupuestal_v2.0.md ⭐ FUENTE DE VERDAD
│
├── 📁 II. Apendices Tecnicos/Decisiones_Tecnicas/
│   ├── TEMPLATE_DT_CON_YAML_v1.0.md ⭐
│   ├── EJEMPLO_DT-FIBRA-999-2025-10-07.md ⭐
│   ├── PLANTILLA_Decisión_Técnica.md
│   └── README_DECISIONES_TECNICAS.md
│
├── 📁 VIII. Documentos Maestros y Metodologia/Matrices_Dependencias/
│   ├── MATRIZ_DEPENDENCIAS_DOCUMENTALES_v1.0.md ⭐
│   ├── MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md ⭐
│   └── PROMPT_Agente_Cursor_Gestion_Cambios_v1.0.md
│
└── 📁 scripts/ ⭐
    ├── sincronizar_SISTEMA_COMPLETO.ps1 ⭐⭐ COMANDO MAESTRO
    ├── sincronizar_TODO.ps1
    ├── gestionar_riesgos.ps1 ⭐
    ├── generar_reporte_gerencial.ps1
    ├── sincronizar_riesgos_a_html.ps1
    ├── sincronizar_riesgos_wbs_v2.ps1
    ├── extraer_todos_items_wbs.ps1
    ├── generar_wbs_interactiva_completa.ps1
    └── README_SCRIPTS.md
```

---

## 🗑️ **ARCHIVOS A ELIMINAR/ARCHIVAR**

### **Versiones antiguas/redundantes:**
```
⚠️ ARCHIVAR en carpeta old/:
├── WBS_Presupuestal_AMPLIADA_v3.0.md (reemplazada por v4.0)
├── datos_wbs_completos.json (reemplazada por datos_wbs_TODOS_items)
└── Cualquier archivo de prueba temporal
```

### **Archivos demo que ya no se usan:**
```
✅ MANTENER (son ejemplos útiles):
├── EJEMPLO_DT-FIBRA-999-2025-10-07.md
└── SIMULACION_Cajas_350m_Flujo_Completo.md
```

---

## 📊 **ORGANIZACIÓN POR ROL**

### **Para Usuario Final (Especialistas):**
```
Solo necesitan saber:
1. Abrir: WBS_Menu_Principal.html
2. Usar: WBS COMPLETA v4.0
3. Generar DTs cuando propongan cambios
```

### **Para PMO/Admin:**
```
Conocer:
1. Carpeta scripts/ (todos los comandos)
2. .cursorrules (configuración Cursor)
3. Guías en @@Documentacion_Sistema_WBS/
4. MATRIZ_RIESGOS_PMO_AMPLIADA
```

### **Para Gerencia:**
```
Solo acceden:
1. WBS_Menu_Principal.html
2. Reporte Gerencial
3. Cronograma
4. Análisis Riesgos
```

---

## 🔄 **MANTENIMIENTO DEL SISTEMA**

### **Diario:**
- Ejecutar DTs en Cursor (según necesidad)
- Gestionar riesgos desde terminal (si aplica)

### **Después de cada DT:**
```powershell
.\scripts\sincronizar_SISTEMA_COMPLETO.ps1
```

### **Semanal:**
- Revisar DTs ejecutadas
- Validar sincronización de 5 vistas
- Backup de WBS_Presupuestal_v2.X.md

### **Mensual:**
- Documentar criterios técnicos faltantes
- Actualizar duraciones_cronograma.json
- Revisar Pareto (puede cambiar)

---

## ✅ **CHECKLIST DE ORGANIZACIÓN**

### **Paso 1: Crear carpetas nuevas**
- [ ] Crear: `@@Documentacion_Sistema_WBS/`
- [ ] Crear: `IX. WBS y Planificacion/Interfaces/` (opcional)
- [ ] Crear: `IX. WBS y Planificacion/Datos/` (opcional)

### **Paso 2: Mover archivos**
- [ ] Mover 15 archivos `@@SISTEMA_*.md` a `@@Documentacion_Sistema_WBS/`
- [ ] Mover HTMLs a `Interfaces/` (opcional)
- [ ] Mover JSONs/JS a `Datos/` (opcional)

### **Paso 3: Actualizar enlaces**
- [ ] Actualizar rutas en scripts si moviste archivos
- [ ] Actualizar `<script src="">` en HTML si moviste JS
- [ ] Probar que todo sigue funcionando

### **Paso 4: Limpiar**
- [ ] Archivar versiones antiguas en `old/`
- [ ] Eliminar archivos temporales/prueba
- [ ] Actualizar README con nueva estructura

### **Paso 5: Validar**
- [ ] Abrir WBS_Menu_Principal.html
- [ ] Probar las 5 vistas
- [ ] Ejecutar `sincronizar_SISTEMA_COMPLETO.ps1`
- [ ] Confirmar que todo funciona

---

## 📝 **RECOMENDACIÓN**

### **Opción A: Dejar como está (Recomendado para ahora)**
- ✅ Todo funciona
- ✅ Rutas correctas
- ✅ Fácil de encontrar
- ⚠️ Muchos archivos en raíz

### **Opción B: Organizar en carpetas**
- ✅ Estructura más limpia
- ✅ Mejor mantenibilidad
- ⚠️ Requiere actualizar rutas
- ⚠️ Riesgo de romper enlaces

**MI RECOMENDACIÓN:**
1. **Ahora:** Dejar como está (funciona perfectamente)
2. **Próxima semana:** Organizar en carpetas cuando sistema esté estable
3. **Después:** Crear guía de estructura definitiva

---

## 🎯 **PRÓXIMO PASO**

¿Quieres que:
1. **Deje como está** (todo funcional, organizar después) ← Recomendado
2. **Organice ahora** (mover a carpetas, actualizar rutas)
3. **Solo limpie** (eliminar duplicados, versiones antiguas)

**¿Qué prefieres?** 🚀

---

**Elaborado por:** Sistema WBS Interactivo v4.0  
**Fecha:** 7 de Octubre de 2025  

