# 🚀 CÓMO PROBAR EL SISTEMA AHORA MISMO
## 3 Formas de Probar (Elige la más fácil)

---

## ⭐ **OPCIÓN 1: PRUEBA RÁPIDA (2 minutos)** - Recomendado

### **Con archivo de ejemplo (Sin riesgo)**

1. **Abre el archivo de ejemplo en Cursor:**
   ```bash
   cursor "II. Apendices Tecnicos\Decisiones_Tecnicas\EJEMPLO_DT-FIBRA-999-2025-10-07.md"
   ```

2. **En el chat de Cursor (Ctrl+L o Cmd+L), escribe:**
   ```
   Simula DT-FIBRA-999
   ```

3. **Cursor te mostrará:**
   - ✅ Qué archivos modificaría
   - ✅ Qué cambios aplicaría
   - ✅ Qué ítems recalcularía
   - ❌ **NO aplica cambios** (solo simula)

4. **Si quieres ejecutar de verdad:**
   ```
   Ejecuta DT-FIBRA-999
   ```
   Cursor pedirá confirmación antes de aplicar cambios.

---

## 🌐 **OPCIÓN 2: DESDE WBS INTERACTIVA (Flujo completo)**

### **Genera tu propia DT**

1. **Abre WBS Interactiva:**
   - Navega a: `IX. WBS y Planificacion/`
   - Abre: `WBS_Menu_Principal.html`
   - Clic en: "⭐ NUEVA: WBS INTERACTIVA COMPLETA v3.0"

2. **Propón un cambio:**
   - Filtra por: "Modificables"
   - Abre: "1.1.2 - Empalmes y conectores"
   - Clic: [📋 Crear Decisión Técnica]
   - Llena:
     - Tipo: "desglose"
     - Observación: "Propongo desglosar global en ítems específicos"
     - Justificación: "Mayor control en compras y seguimiento"
   - Clic: [📋 Generar DT Completo]

3. **Se descarga archivo:**
   ```
   DT-FIBRA-XXX-2025-10-07.md
   ```

4. **Mueve a carpeta correcta:**
   ```powershell
   Move-Item "D:\Downloads\DT-FIBRA-*.md" "II. Apendices Tecnicos\Decisiones_Tecnicas\"
   ```

5. **Ejecuta en Cursor:**
   ```bash
   cursor "II. Apendices Tecnicos\Decisiones_Tecnicas\DT-FIBRA-XXX-2025-10-07.md"
   ```
   
   En chat Cursor:
   ```
   Ejecuta DT-FIBRA-XXX
   ```

---

## 📖 **OPCIÓN 3: LEE LA DOCUMENTACIÓN PRIMERO**

### **Para entender el flujo completo**

1. **Lee la guía de ejecución:**
   ```
   Abre: GUIA_EJECUCION_DT_Cursor.md
   ```
   - Flujo en 3 pasos
   - Comandos útiles
   - Qué hace Cursor
   - Manejo de errores

2. **Lee la documentación del sistema:**
   ```
   Abre: @@SISTEMA_DT_YAML_IMPLEMENTADO.md
   ```
   - Implementación completa
   - Ejemplo de YAML
   - Ventajas del sistema

3. **Lee el template de referencia:**
   ```
   Abre: TEMPLATE_DT_CON_YAML_v1.0.md
   ```
   - Explicación de cada sección
   - Documentación YAML
   - Ejemplos

---

## 🎯 **COMANDO MÁS SIMPLE (¡Prueba esto primero!)**

Copia y pega esto en tu terminal:

```bash
cursor "II. Apendices Tecnicos\Decisiones_Tecnicas\EJEMPLO_DT-FIBRA-999-2025-10-07.md"
```

Cuando se abra Cursor, escribe en el chat:

```
Simula DT-FIBRA-999
```

**¡Y listo!** Verás cómo funciona sin aplicar cambios.

---

## ✅ **QUÉ ESPERAR**

### **Cuando ejecutas "Simula DT-FIBRA-999":**

Cursor responderá algo como:

```
🔍 SIMULACIÓN DT-FIBRA-999 (Dry-run mode)

Archivos que se modificarían (2):
- WBS_Presupuestal_AMPLIADA_v3.0.md
  → Cambio: cantidad "2068" → "1697" en item 1.1.3
  → Versión: v3.0 → v3.1

- MATRIZ_DEPENDENCIAS_DOCUMENTALES_v1.0.md
  → Nueva fila: DT-FIBRA-999

Ítems que se recalcularían (3):
- 1.1.5: Uniones rápidas
- 1.1.10: Insumos fusionado
- 1.1.13: Cajas repuesto

✓ Simulación completa. No se aplicaron cambios.
```

### **Cuando ejecutas "Ejecuta DT-FIBRA-999":**

Cursor preguntará:

```
📋 DECISIÓN TÉCNICA: DT-FIBRA-999
Ítem WBS: 1.1.3
Tipo de cambio: cantidad

Archivos a actualizar (2):
✓ WBS_Presupuestal_AMPLIADA_v3.0.md → v3.1
✓ MATRIZ_DEPENDENCIAS_DOCUMENTALES_v1.0.md

Recalcular ítems dependientes: 1.1.5, 1.1.10, 1.1.13

¿Ejecutar? (Sí/No)
```

Si dices "Sí", ejecutará todos los cambios y te mostrará el resultado.

---

## 📁 **ARCHIVOS IMPORTANTES**

| Archivo | Para Qué |
|---------|----------|
| `EJEMPLO_DT-FIBRA-999-2025-10-07.md` | **Prueba rápida** |
| `GUIA_EJECUCION_DT_Cursor.md` | **Guía paso a paso** |
| `@@SISTEMA_DT_YAML_IMPLEMENTADO.md` | **Documentación completa** |
| `WBS_Menu_Principal.html` | **Generar DTs reales** |
| `.cursorrules` | **Configuración Cursor** |

---

## 🆘 **SI ALGO NO FUNCIONA**

1. **Verifica que Cursor esté instalado:**
   ```bash
   cursor --version
   ```

2. **Verifica que `.cursorrules` existe:**
   ```bash
   Test-Path ".cursorrules"
   ```
   Debe devolver: `True`

3. **Verifica que archivo de ejemplo existe:**
   ```bash
   Test-Path "II. Apendices Tecnicos\Decisiones_Tecnicas\EJEMPLO_DT-FIBRA-999-2025-10-07.md"
   ```
   Debe devolver: `True`

4. **Si Cursor no reconoce el comando:**
   - Abre el archivo manualmente en Cursor
   - Escribe en chat: "Ejecuta esta DT"

---

## 🎉 **¡LISTO!**

**Empieza con el comando más simple:**

```bash
cursor "II. Apendices Tecnicos\Decisiones_Tecnicas\EJEMPLO_DT-FIBRA-999-2025-10-07.md"
```

Luego en Cursor:

```
Simula DT-FIBRA-999
```

**¡Y verás el sistema en acción!** 🚀

---

**Fecha:** 7 de Octubre de 2025  
**Sistema:** WBS Interactivo v3.0  

