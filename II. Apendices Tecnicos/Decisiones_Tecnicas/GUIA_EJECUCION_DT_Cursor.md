# 📘 GUÍA DE EJECUCIÓN: Decisiones Técnicas con Cursor
## Para PMO / Administrador Contractual EPC

---

## 🎯 **OBJETIVO**

Esta guía te enseña cómo ejecutar Decisiones Técnicas (DT) generadas desde la WBS Interactiva usando Cursor IDE.

---

## 📋 **FLUJO COMPLETO (3 PASOS)**

### **PASO 1: Recibir DT del Especialista**

El especialista (fibra, TETRA, civil, etc.) usa la WBS Interactiva y genera una DT.

**Tú recibes un archivo:**
```
Nombre: DT-FIBRA-042-2025-10-07.md
Ubicación: Email adjunto / Carpeta compartida / Downloads
```

---

### **PASO 2: Mover DT a Carpeta Correcta**

**Opción A: Manual (Arrastrar y soltar)**
```
1. Abre tu explorador de archivos
2. Navega a: Downloads/ (o donde esté el archivo)
3. Corta el archivo: DT-FIBRA-042-2025-10-07.md
4. Navega a: II. Apendices Tecnicos/Decisiones_Tecnicas/
5. Pega el archivo
```

**Opción B: Desde terminal**
```powershell
# Desde la raíz del proyecto
Move-Item "D:\Downloads\DT-FIBRA-042-2025-10-07.md" "II. Apendices Tecnicos\Decisiones_Tecnicas\"
```

---

### **PASO 3: Ejecutar en Cursor**

#### **Opción A: Abrir archivo en Cursor**

1. **Abrir Cursor IDE**
   - Doble clic en el ícono de Cursor

2. **Abrir archivo DT**
   - Método 1: Arrastrar archivo a Cursor
   - Método 2: File → Open → Navegar a `II. Apendices Tecnicos/Decisiones_Tecnicas/DT-FIBRA-042-2025-10-07.md`
   - Método 3: Desde terminal:
     ```bash
     cursor "II. Apendices Tecnicos\Decisiones_Tecnicas\DT-FIBRA-042-2025-10-07.md"
     ```

3. **Ejecutar DT**
   - En el chat de Cursor (Ctrl+L o Cmd+L), escribe:
   ```
   Ejecuta DT-FIBRA-042
   ```

4. **Confirmar ejecución**
   - Cursor mostrará resumen:
   ```
   📋 DECISIÓN TÉCNICA: DT-FIBRA-042
   Ítem WBS: 1.1.3
   
   Archivos a actualizar (3):
   ✓ WBS_Presupuestal_v3.0.md → v3.1
   ✓ V.3_Comunicacion.md
   ✓ MATRIZ_DEPENDENCIAS.md
   
   ¿Ejecutar? (Sí/No)
   ```

5. **Responder "Sí"**
   - Cursor ejecutará todos los cambios automáticamente

6. **Revisar resultado**
   ```
   ✅ DT-FIBRA-042 EJECUTADA
   
   Archivos actualizados (3):
   ✓ WBS_Presupuestal v3.0 → v3.1 ✅
   ✓ V.3_Comunicacion (Tabla 5.3) ✅
   ✓ MATRIZ_DEPENDENCIAS (nueva fila) ✅
   
   Log completado en DT-FIBRA-042-2025-10-07.md
   ```

---

#### **Opción B: Comando directo (Desde terminal Cursor)**

Si ya estás en Cursor:

```
Tú escribes en chat:
"Ejecuta la DT más reciente en II/Decisiones_Tecnicas/"

Cursor:
- Busca archivos DT-*.md
- Identifica el más reciente
- Lo abre y ejecuta
```

---

## 🔍 **COMANDOS ÚTILES**

### **1. Ejecutar DT**
```
Ejecuta DT-FIBRA-042
```
o
```
Ejecuta esta DT
```
(Si ya tienes el archivo abierto)

### **2. Simular (Sin aplicar cambios)**
```
Simula DT-FIBRA-042
```
- Cursor te muestra QUÉ haría pero NO aplica cambios
- Útil para revisar antes de ejecutar

### **3. Validar (Solo verificar)**
```
Valida DT-FIBRA-042
```
- Cursor solo verifica que:
  - Archivos existen
  - YAML es válido
  - Formato es correcto
- No ejecuta nada

### **4. Revertir (Deshacer cambios)**
```
Revierte DT-FIBRA-042
```
- Solo funciona si hay backup
- Deshace los cambios aplicados

---

## 📊 **QUÉ HACE CURSOR AUTOMÁTICAMENTE**

Cuando ejecutas una DT, Cursor:

### **1. Lee el YAML** (Sección 10 del archivo DT)
- Parsea estructura completa
- Identifica archivos a modificar
- Identifica ítems dependientes

### **2. Valida**
- ✅ Verifica que archivos existen
- ✅ Crea backup del contenido
- ✅ Valida formato de números

### **3. Te muestra resumen y pide confirmación**
- Lista de archivos
- Tipo de cambios
- Ítems afectados

### **4. Ejecuta (si tú apruebas)**
- Abre cada archivo
- Busca sección específica
- Aplica cambios (buscar/reemplazar)
- Versionea archivos (v3.0 → v3.1)
- Recalcula ítems dependientes
- Actualiza matrices

### **5. Documenta**
- Completa log en el archivo DT (Sección 12)
- Marca checkbox "Ejecutado" (Sección 11)
- Reporta resultado completo

---

## ✅ **CHECKLIST: Antes de Ejecutar**

Antes de decir "Sí" a Cursor, verifica:

- [ ] **Archivo DT está en carpeta correcta**
  - `II. Apendices Tecnicos/Decisiones_Tecnicas/`

- [ ] **Revisaste el contenido de la DT**
  - Observación del especialista tiene sentido
  - Justificación técnica es sólida
  - Cambios propuestos son razonables

- [ ] **Validaste el impacto económico**
  - Si ahorro > $100M → OK
  - Si incremento > $50M → Requiere aprobación adicional
  - Si impacto > 15% → Validar con PMO

- [ ] **Identificaste archivos críticos**
  - WBS Presupuestal → Siempre crítico
  - Matrices → Importante
  - Documentos técnicos → Revisar contexto

- [ ] **Tienes backup del proyecto** (opcional pero recomendado)
  - Git commit antes de ejecutar
  - O copia de seguridad manual

---

## 🚨 **QUÉ HACER SI HAY ERRORES**

### **Error 1: Archivo no encontrado**
```
⚠️ Archivo X no encontrado. Continuando...
```

**Acción:**
- Cursor continúa con siguientes archivos
- Al final, revisa qué archivos faltaron
- Búscalos manualmente y aplica cambio si es necesario

### **Error 2: Sección no encontrada**
```
⚠️ Sección Y no encontrada en archivo X. ¿Buscar manualmente? (Sí/No)
```

**Acción:**
- Di "Sí" para que Cursor busque alternativas
- O di "No" y aplica cambio manualmente después

### **Error 3: Validación falla**
```
❌ Validación falló: [razón]. Ejecución detenida.
```

**Acción:**
- NO se aplicaron cambios
- Revisa la razón del error
- Corrige en archivo DT o archivo destino
- Vuelve a ejecutar

### **Error 4: Formato incorrecto**
```
❌ YAML inválido en sección 10
```

**Acción:**
- Revisa archivo DT
- Sección 10 debe tener:
  ```markdown
  ## 10. INSTRUCCIONES PARA CURSOR
  
  ```yaml
  # YAML aquí
  ```
  ```
- Corrige formato y vuelve a ejecutar

---

## 📝 **DESPUÉS DE EJECUTAR**

### **1. Revisar log en DT**
- Abre archivo DT ejecutado
- Ve a Sección 12 "LOG DE EJECUCIÓN"
- Verifica:
  - Fecha y hora correctas
  - Archivos modificados listados
  - Sin errores

### **2. Revisar archivos modificados**
- WBS_Presupuestal (nueva versión)
- Documentos técnicos actualizados
- Matrices con nueva fila

### **3. Validar en WBS Interactiva**
- Abre WBS Interactiva en navegador
- Busca el ítem modificado
- Verifica que valores se actualizaron
- (Opcional) Ejecutar `sincronizar_riesgos_wbs_v2.ps1` si cambió MATRIZ_RIESGOS

### **4. Notificar al especialista**
```
✅ DT-FIBRA-042 ejecutada exitosamente

Cambios aplicados:
- WBS actualizado (v3.0 → v3.1)
- 3 archivos modificados
- 2 ítems dependientes recalculados
- Ahorro aplicado: $500,900,000

Próximos pasos:
- Validación en campo
- Actualización de cronograma si aplica
```

---

## 🎯 **CASOS DE USO FRECUENTES**

### **Caso 1: Ajuste de cantidad (Ej: Cajas 300m → 350m)**
```
1. Recibo: DT-FIBRA-042-Cajas-350m.md
2. Muevo a: II/Decisiones_Tecnicas/
3. Abro en Cursor
4. Ejecuto: "Ejecuta DT-FIBRA-042"
5. Confirmo: "Sí"
6. Reviso resultado
7. Notifico al especialista
```

### **Caso 2: Propuesta de desglose (Ej: Global → Ítems específicos)**
```
1. Recibo: DT-FIBRA-043-Desglose-Empalmes.md
2. Reviso propuesta de desglose
3. Valido con especialista si es necesario
4. Muevo a carpeta
5. Ejecuto en Cursor
6. WBS se actualiza con nuevos sub-ítems
```

### **Caso 3: Ajuste de precio (Ej: Actualización de mercado)**
```
1. Recibo: DT-CIVIL-050-Precio-Concreto.md
2. Valido que incremento esté justificado
3. Si > 15% → Requiere aprobación PMO
4. Obtengo aprobación
5. Ejecuto en Cursor
6. Actualizo cronograma financiero
```

---

## 💡 **TIPS Y MEJORES PRÁCTICAS**

### **1. Siempre simula primero**
```
Simula DT-FIBRA-042
```
- Te muestra qué pasará
- Sin riesgo de cambios no deseados
- Puedes revisar tranquilo

### **2. Revisa la DT antes de ejecutar**
- Lee secciones 2 (Observación) y 3 (Justificación)
- Valida sección 4 (Valores propuestos)
- Verifica sección 9 (Recomendación del sistema)

### **3. Ejecuta en horarios de bajo tráfico**
- Evita ejecutar cuando otros están trabajando
- Preferible por la mañana o al final del día

### **4. Documenta decisiones importantes**
- DTs con impacto > $100M → Agregar nota en sección 11
- Cambios críticos → Email a PMO con resumen

### **5. Mantén orden en la carpeta**
```
II/Decisiones_Tecnicas/
├── DT-FIBRA-042-2025-10-07.md ✅ Ejecutada
├── DT-FIBRA-043-2025-10-08.md ⏳ Pendiente
├── DT-TETRA-015-2025-10-07.md ✅ Ejecutada
└── logs/
    └── DT-FIBRA-042_ejecucion.log
```

---

## 🔄 **FLUJO COMPLETO VISUAL**

```
┌─────────────────────────────────────────┐
│ 1. ESPECIALISTA                         │
│    - Usa WBS Interactiva                │
│    - Propone cambio                      │
│    - Descarga DT-*.md                    │
│    - Te envía archivo                    │
└────────────┬────────────────────────────┘
             │
             ↓
┌─────────────────────────────────────────┐
│ 2. TÚ (PMO/Admin)                       │
│    - Recibes DT                          │
│    - Mueves a II/Decisiones_Tecnicas/   │
│    - Abres en Cursor                     │
└────────────┬────────────────────────────┘
             │
             ↓
┌─────────────────────────────────────────┐
│ 3. CURSOR (Automático)                  │
│    - Detecta DT                          │
│    - Lee YAML                            │
│    - Valida                              │
│    - Te pregunta: ¿Ejecutar?            │
└────────────┬────────────────────────────┘
             │
             ↓
┌─────────────────────────────────────────┐
│ 4. TÚ CONFIRMAS                         │
│    - Revisas resumen                     │
│    - Dices: "Sí"                         │
└────────────┬────────────────────────────┘
             │
             ↓
┌─────────────────────────────────────────┐
│ 5. CURSOR EJECUTA                       │
│    - Actualiza archivos                  │
│    - Versionea documentos                │
│    - Recalcula dependientes              │
│    - Actualiza matrices                  │
│    - Completa log                        │
└────────────┬────────────────────────────┘
             │
             ↓
┌─────────────────────────────────────────┐
│ 6. TÚ VALIDAS Y NOTIFICAS               │
│    - Revisas archivos modificados        │
│    - Validas en WBS Interactiva          │
│    - Notificas al especialista           │
│    - Documentas en PMO                   │
└─────────────────────────────────────────┘
```

---

## 📞 **SOPORTE**

### **Si tienes dudas:**
1. Consulta: `TEMPLATE_DT_CON_YAML_v1.0.md` (explicación YAML)
2. Consulta: `.cursorrules` (configuración Cursor)
3. Consulta: `@@GUIA_COMPLETA_Sistema_WBS_Interactivo.md` (visión general)

### **Si hay errores técnicos:**
1. Revisa log en Sección 12 del archivo DT
2. Verifica que archivo DT tiene formato correcto
3. Valida que `.cursorrules` está presente
4. Reinicia Cursor si es necesario

### **Si necesitas ayuda:**
- Administrador Sistema WBS
- Equipo Ingeniería EPC

---

**Elaborado por:** Sistema WBS Interactivo v3.0  
**Fecha:** 7 de Octubre de 2025  
**Versión:** 1.0  
**Para:** PMO / Administrador Contractual EPC  

