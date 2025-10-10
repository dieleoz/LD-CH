# TEMPLATE: DECISIÓN TÉCNICA CON YAML v1.0
## Formato estándar para DTs auto-generadas desde WBS Interactiva

---

## 🎯 **PROPÓSITO**

Este template muestra el formato completo de una Decisión Técnica (DT) generada automáticamente desde la WBS Interactiva, incluyendo la sección YAML con instrucciones para Cursor.

---

## 📋 **ESTRUCTURA COMPLETA**

### **Secciones 1-9: Análisis y Documentación**
- Generadas automáticamente por JavaScript
- Incluyen: Contexto, Observaciones, Valores, Criterios, Riesgos, Recomendaciones

### **Sección 10: INSTRUCCIONES PARA CURSOR (YAML)** ⭐
- **Esta es la clave del sistema**
- Contiene instrucciones parseables para ejecución automática
- Cursor lee este YAML y ejecuta los cambios

### **Secciones 11-12: Estado y Log**
- Checkboxes de aprobación
- Log de ejecución (completado por Cursor)

---

## ⚙️ **EJEMPLO DE YAML (Sección 10)**

```yaml
# Configuración de ejecución automatizada
dt_metadata:
  id: "DT-FIBRA-042"
  fecha: "2025-10-07"
  timestamp: "2025-10-07T15:30:00.000Z"
  item_wbs: "1.1.3"
  tipo_cambio: "cantidad"
  estado: "pendiente_ejecucion"

archivos_actualizar:
  - file: "IX. WBS y Planificacion/WBS_Presupuestal_v3.0.md"
    accion: "actualizar_y_versionar"
    seccion: "Item 1.1.3"
    cambios:
      - campo: "cantidad"
        buscar: "2068"
        reemplazar: "1697"
        tipo: "numero"
      - campo: "total_cop"
        buscar: "2791800000"
        reemplazar: "2290900000"
        tipo: "numero"
        recalcular: true
    versionamiento:
      version_actual: "v3.0"
      version_nueva: "v3.1"
      razon: "DT-FIBRA-042 - cantidad"
      agregar_nota: "Origen: DT-FIBRA-042 | Fecha: 2025-10-07"

  - file: "V.3_Sistemas_Comunicacion_Detalle.md"
    accion: "validar_y_actualizar"
    seccion: "Tabla 5.3"
    cambios:
      - campo: "cantidad_item_1.1.3"
        buscar: "2068"
        reemplazar: "1697"
        validar_contexto: true
        notas: "Verificar que sea el ítem correcto antes de aplicar"

  - file: "VIII. Documentos Maestros y Metodologia/Matrices_Dependencias/MATRIZ_DEPENDENCIAS_DOCUMENTALES_v1.0.md"
    accion: "agregar_fila"
    seccion: "Tabla principal"
    nueva_fila:
      sistema: "fibra"
      decision_tecnica: "DT-FIBRA-042"
      archivos_afectados: "WBS_Presupuestal, 2 archivos técnicos"
      tipo_impacto: "Cantidades"

items_dependientes:
  recalcular: true
  items:
    - "1.1.5"
    - "1.1.10"
    - "1.1.13"
  formula_base: "proporcional_a_item_principal"

validaciones:
  - verificar_archivos_existen: true
  - backup_antes_modificar: true
  - validar_formato_numeros: true
  - validar_normas_aplicables: ["UIT-T G.652.D"]
  - confirmar_con_usuario: true

notificaciones:
  - tipo: "inicio"
    mensaje: "Iniciando ejecución de DT-FIBRA-042"
  - tipo: "progreso"
    mensaje: "Actualizando archivo {nombre_archivo}..."
  - tipo: "completado"
    mensaje: "✅ DT-FIBRA-042 ejecutado exitosamente - {cantidad_archivos} archivos actualizados"
  - tipo: "error"
    mensaje: "❌ Error en {archivo}: {descripcion_error}"

manejo_errores:
  - archivo_no_existe: "reportar_y_continuar"
  - seccion_no_encontrada: "pedir_confirmacion_manual"
  - validacion_falla: "detener_y_reportar"
  - backup_falla: "detener_ejecucion"
```

---

## 📖 **EXPLICACIÓN DEL YAML**

### **1. dt_metadata** (Metadatos)
```yaml
dt_metadata:
  id: "DT-FIBRA-042"           # Identificador único
  fecha: "2025-10-07"           # Fecha generación
  item_wbs: "1.1.3"             # Ítem WBS afectado
  tipo_cambio: "cantidad"       # Tipo: cantidad|precio|desglose
  estado: "pendiente_ejecucion" # Estado actual
```

### **2. archivos_actualizar** (Lista de archivos)
```yaml
archivos_actualizar:
  - file: "ruta/archivo.md"    # Ruta relativa al workspace
    accion: "actualizar"        # Acción: actualizar|agregar_fila|eliminar
    seccion: "Item 1.1.3"       # Sección específica del archivo
    cambios:                    # Array de cambios
      - campo: "cantidad"       # Campo a modificar
        buscar: "2068"          # Valor actual
        reemplazar: "1697"      # Valor nuevo
```

### **3. items_dependientes** (Ítems que requieren recálculo)
```yaml
items_dependientes:
  recalcular: true              # Si debe recalcular
  items:                        # Lista de ítems
    - "1.1.5"
    - "1.1.10"
  formula_base: "proporcional_a_item_principal"  # Tipo de recálculo
```

### **4. validaciones** (Validaciones pre-ejecución)
```yaml
validaciones:
  - verificar_archivos_existen: true    # Verifica que archivos existan
  - backup_antes_modificar: true        # Crea backup antes de cambiar
  - confirmar_con_usuario: true         # Pide confirmación
```

### **5. notificaciones** (Mensajes al usuario)
```yaml
notificaciones:
  - tipo: "inicio"
    mensaje: "Iniciando ejecución..."
  - tipo: "completado"
    mensaje: "✅ Ejecutado exitosamente"
```

### **6. manejo_errores** (Qué hacer en errores)
```yaml
manejo_errores:
  - archivo_no_existe: "reportar_y_continuar"      # Si archivo no existe
  - seccion_no_encontrada: "pedir_confirmacion_manual"  # Si sección no se encuentra
  - validacion_falla: "detener_y_reportar"         # Si validación falla
```

---

## 🔄 **FLUJO DE USO**

### **1. Usuario Final (Especialista)**
```
WBS Interactiva → Propone cambio → Clic [Generar DT]
   ↓
Descarga: DT-FIBRA-042-2025-10-07.md (con YAML incluido)
```

### **2. PMO/Admin**
```
Recibe DT → Mueve a II/Decisiones_Tecnicas/
   ↓
Abre en Cursor IDE
   ↓
Escribe: "Ejecuta DT-FIBRA-042"
```

### **3. Cursor (Automático)**
```
Lee sección 10 (YAML)
   ↓
Parsea estructura archivos_actualizar
   ↓
Confirma con usuario
   ↓
Ejecuta cambios en archivos
   ↓
Actualiza matrices
   ↓
Recalcula ítems dependientes
   ↓
Reporta resultados
```

---

## ✅ **VENTAJAS DEL SISTEMA YAML**

1. **Explícito y auditable**
   - Todo cambio está documentado
   - Se sabe exactamente qué se va a hacer

2. **Parseable automáticamente**
   - Cursor puede leer YAML directamente
   - No requiere interpretación de lenguaje natural

3. **Versionable**
   - El YAML es texto plano
   - Se puede versionar en Git

4. **Flexible**
   - Fácil agregar nuevos campos
   - Extensible para futuros casos

5. **Traceable**
   - Cada cambio referencia su DT origen
   - Historial completo de decisiones

---

## 📝 **NOTAS DE IMPLEMENTACIÓN**

### **Para desarrolladores JavaScript (WBS):**
- La función `generarDTMarkdown()` ya genera este formato
- El YAML se construye dinámicamente según el ítem WBS
- Los valores se interpolan desde el objeto `item`

### **Para Cursor (.cursorrules):**
- Debe detectar archivos `DT-*.md` en `II/Decisiones_Tecnicas/`
- Leer sección "## 10. INSTRUCCIONES PARA CURSOR"
- Extraer bloque YAML entre ` ```yaml ` y ` ``` `
- Parsear con librería YAML
- Ejecutar según estructura `archivos_actualizar`

### **Para PMO:**
- Solo necesita mover archivo DT a carpeta correcta
- Abrir en Cursor
- Decir "Ejecuta [ID_DT]"
- Cursor hace el resto

---

## 🎯 **EJEMPLO COMPLETO**

Ver archivo de ejemplo generado:
- `II/Decisiones_Tecnicas/EJEMPLO_DT-FIBRA-042-Cajas-350m.md`

---

**Elaborado por:** Sistema WBS Interactivo v3.0  
**Fecha:** 7 de Octubre de 2025  
**Versión:** 1.0  
**Formato:** Markdown + YAML  

