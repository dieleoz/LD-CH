# GUÍA RÁPIDA: DECISIONES TÉCNICAS (DT)
## ¿Cómo Proponer Cambios en el Sistema WBS?

**Versión:** 1.0  
**Fecha:** 12 de Octubre 2025  
**Tiempo de lectura:** 5 minutos

---

## 🎯 ¿QUÉ ES UNA DT?

Una **Decisión Técnica (DT)** es la forma de proponer cambios técnicos en el proyecto.

**En palabras simples:**
> "Es como llenar un formulario explicando QUÉ quieres cambiar y POR QUÉ, y el sistema lo ejecuta automáticamente."

**Ejemplo:** "Quiero cambiar las cajas de fibra de 2,068 a 1,823 porque el cálculo correcto es 520.78km ÷ 300m"

---

## ⚡ INICIO RÁPIDO (3 PASOS)

### 1️⃣ **ABRIR Layout Maestro**
```
Archivo: IX. WBS y Planificacion/WBS_Layout_Maestro.html
```

### 2️⃣ **FILTRAR lo que quieres cambiar**
```
Ejemplo: 
- Tipo: TELECOMUNICACIONES
- Sistema: Fibra
- Resultado: 1,953 elementos
```

### 3️⃣ **CLICK en "📋 Crear DT desde Filtro"**
```
Completa:
- ¿Qué quieres cambiar?
- ¿Por qué?
- ¿Criterio técnico?

Descarga: DT-FIBRA-641-2025-10-12.md
```

**¡Listo!** Ya tienes tu DT generada.

---

## 📝 EJEMPLO REAL PASO A PASO

### **CASO: Ajustar Cantidad de Cajas de Fibra**

#### **ANTES de la DT:**
- WBS dice: **2,068 cajas**
- Layout tiene: **2,068 cajas**

#### **PROBLEMA detectado:**
Revisando el cálculo con longitud contractual:
- 520.78 km ÷ 300m espaciamiento = 1,735 cajas
- 22 puentes × 4 cajas = 88 cajas
- **Total correcto: 1,823 cajas** ❌ (no 2,068)

---

### **SOLUCIÓN: Crear DT**

#### **PASO 1: Abrir Layout**
- Doble click en `WBS_Layout_Maestro.html`

#### **PASO 2: Filtrar Fibra**
- **Tipo de Equipo:** TELECOMUNICACIONES
- **Sistema:** Fibra
- Click "🔍 Filtrar"
- **Resultado:** 1,953 elementos mostrados

#### **PASO 3: Crear DT**
- Click botón "📋 Crear DT desde Filtro" (parte superior)

#### **PASO 4: Llenar Formulario**

**Ventana emergente aparece:**

```
┌──────────────────────────────────────────────────┐
│ GENERAR DECISIÓN TÉCNICA                         │
├──────────────────────────────────────────────────┤
│                                                   │
│ 📌 Sistema detectado: FIBRA                      │
│ 📊 Elementos filtrados: 1,953                    │
│                                                   │
│ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━  │
│                                                   │
│ 📝 Observación Técnica: *                        │
│ ┌───────────────────────────────────────────┐   │
│ │ Escribir aquí...                          │   │
│ └───────────────────────────────────────────┘   │
│                                                   │
│ 💡 Justificación: *                              │
│ ┌───────────────────────────────────────────┐   │
│ │ Escribir aquí...                          │   │
│ └───────────────────────────────────────────┘   │
│                                                   │
│ 📏 Criterio de diseño: (Opcional)                │
│ ┌───────────────────────────────────────────┐   │
│ │ Escribir aquí...                          │   │
│ └───────────────────────────────────────────┘   │
│                                                   │
│ [ Cancelar ]         [ 📥 Generar DT ]           │
│                                                   │
└──────────────────────────────────────────────────┘
```

**Completar así:**

**Observación Técnica:**
```
La cantidad actual de cajas de empalme (2,068) no corresponde 
con el cálculo correcto según longitud contractual.

Cálculo correcto:
- Longitud contractual: 520.78 km (PK 201+470 a PK 722+250)
- Espaciamiento: 300m (estándar UIC 518)
- Cajas lineales: 520.78 ÷ 0.3 = 1,735 unidades
- Cajas en puentes: 22 puentes × 4 cajas = 88 unidades
- TOTAL CORRECTO: 1,823 cajas (no 2,068)

Adicional: 130 domos de fusión (cada 4km según diseño)
```

**Justificación:**
```
Cumplimiento de norma UIC 518 (Redes de fibra óptica en 
infraestructura ferroviaria).

BENEFICIOS del espaciamiento 300m:
✅ Facilita localización de fallas con OTDR
✅ Reduce tiempo de reparación (acceso cada 300m)
✅ Mejora disponibilidad del sistema
✅ Cumple estándares internacionales ferroviarios
✅ Balance óptimo: costo vs mantenibilidad

IMPACTO PRESUPUESTAL:
- Cantidad anterior: 2,068 × $1,350,000 = $2,791,800,000
- Cantidad nueva: 1,823 × $1,350,000 = $2,461,050,000
- AHORRO: $330,750,000 COP (-12% en este item)
```

**Criterio de diseño:**
```
UIC 518 OR - Instalaciones de fibra óptica en 
infraestructura ferroviaria

Espaciamiento recomendado: 250-500m
Criterio adoptado: 300m (mantenibilidad óptima)

Referencia: AT3 Especificaciones Generales, Sección 4.2.3
```

---

#### **PASO 5: Click "📥 Generar DT"**

**El sistema:**
1. ✅ Genera archivo: `DT-FIBRA-641-2025-10-12.md`
2. ✅ Incluye todo lo que escribiste (secciones 1-9)
3. ✅ Agrega YAML con instrucciones automáticas (sección 10)
4. ✅ Descarga automáticamente a tu carpeta

**Verás notificación:**
```
✅ DT generada exitosamente
📥 Archivo descargado: DT-FIBRA-641-2025-10-12.md
```

---

#### **PASO 6: Guardar la DT**

**Mover el archivo descargado a:**
```
II. Apendices Tecnicos/Decisiones_Tecnicas/DT-FIBRA-641-2025-10-12.md
```

**Cómo:**
1. Ir a tu carpeta de Descargas
2. Copiar el archivo DT-FIBRA-641-2025-10-12.md
3. Ir a la carpeta del proyecto
4. Pegar en: `II. Apendices Tecnicos\Decisiones_Tecnicas\`

---

#### **PASO 7: Notificar a PMO**

**Enviar email:**
```
Para: pmo@proyecto-ld-ch.com
Asunto: Nueva DT para aprobación: DT-FIBRA-641

Hola equipo,

He generado una Decisión Técnica para ajustar la cantidad de 
cajas de empalme de fibra óptica:

📋 ID: DT-FIBRA-641-2025-10-12
🔧 Sistema: FIBRA ÓPTICA  
📊 Tipo: Ajuste de cantidad (2,068 → 1,823)
💰 Impacto: Ahorro $330M COP (-12%)

Justificación: Cumplimiento norma UIC 518, espaciamiento 300m

Archivos afectados: WBS, Layout, Ingeniería Conceptual

La DT está en: II. Apendices Tecnicos/Decisiones_Tecnicas/

Por favor revisar y aprobar.

Saludos,
[Tu nombre]
Especialista Telecomunicaciones
```

---

## ⏱️ ¿CUÁNTO TARDA?

### Generar la DT (Tu parte):
- **Filtrar elementos:** 30 segundos
- **Completar formulario:** 5-10 minutos
- **Guardar y notificar:** 2 minutos
- **TOTAL:** ~10-15 minutos

### Ejecutar la DT (PMO):
- **Revisión PMO:** ~10-30 minutos
- **Ejecución automática:** ~30 segundos
- **Verificación:** ~5 minutos
- **TOTAL:** ~15-35 minutos

### Propagación de Cambios (Automático):
```
Detección DT → 1 segundo
Ejecución script especializado → 10-20 segundos
Regeneración layout → 5 segundos
Consolidación ingeniería → 5 segundos
Generación Word/HTML → 5 segundos
──────────────────────────
TOTAL: ~30 segundos (automático)
```

---

## ✅ CHECKLIST: Antes de Enviar una DT

Verifica que tu DT tenga:

- [ ] **Observación técnica clara** (qué cambiar)
- [ ] **Justificación sólida** (por qué cambiar)
- [ ] **Cálculos mostrados** (cómo llegaste al número)
- [ ] **Norma referenciada** (UIC, IEC, EN, AT...)
- [ ] **Impacto presupuestal** (cuánto cuesta/ahorra)
- [ ] **Alternativas consideradas** (qué más evaluaste)
- [ ] **Archivo guardado** en carpeta Decisiones_Tecnicas/
- [ ] **PMO notificado** por email

**Si tienes todo ✅** → Tu DT está lista para aprobación

---

## 🎓 CASOS DE USO REALES

### Caso 1: "Reducir Torres TETRA de 40 a 37"

**DT:** DT-TETRA-037  
**Razón:** Diseño RF optimizado con simulación  
**Impacto:** Ahorro $45M COP  
**Ejecutada:** ✅ 7-Oct-2025  
**Resultado:** Layout actualizado con 37 torres

---

### Caso 2: "Eliminar Balizas (Señalización Virtual)"

**DT:** DT-BALIZA-001  
**Razón:** ATP embarcado hace balizas físicas innecesarias  
**Impacto:** Ahorro $2,500M COP  
**Ejecutada:** ✅ 7-Oct-2025  
**Resultado:** 300+ balizas eliminadas del layout

---

### Caso 3: "Ajustar Cajas de Fibra a 1,823"

**DT:** DT-FIBRA-641  
**Razón:** Cálculo correcto según longitud contractual  
**Impacto:** Ahorro $330M COP  
**Ejecutada:** ✅ 11-Oct-2025  
**Resultado:** 1,823 cajas + 130 domos en layout

---

## 🚫 ERRORES COMUNES

### ❌ Error 1: "No justificar bien"

**MAL:**
```
Observación: Cambiar a 1,823
Justificación: Porque es el número correcto
```

**BIEN:**
```
Observación: Las cajas deben ser 1,823 según cálculo:
520.78 km ÷ 0.3m espaciamiento = 1,735 + 88 en puentes

Justificación: Cumple UIC 518, facilita mantenimiento,
reduce costos operativos 15%, mejora disponibilidad.
```

---

### ❌ Error 2: "No incluir cálculos"

**MAL:**
```
Cantidad propuesta: 37 torres
```

**BIEN:**
```
Cantidad propuesta: 37 torres

Cálculo:
- Longitud: 520.78 km
- Cobertura por torre: 15 km (radio 7.5 km)
- Mínimo teórico: 520.78 ÷ 15 = 35 torres
- Redundancia: +2 torres para zonas críticas
- TOTAL: 37 torres
```

---

### ❌ Error 3: "Cambiar sin evaluar alternativas"

**MAL:**
```
Propuesta: 300m espaciamiento
```

**BIEN:**
```
Alternativas evaluadas:

| Espaciamiento | Cajas | Costo | Pro | Contra |
|---------------|-------|-------|-----|--------|
| 250m | 2,083 | +$10M | Muy accesible | Muy costoso |
| 300m | 1,823 | Base | Balance óptimo | - |
| 500m | 1,041 | -$20M | Económico | No cumple UIC |

SELECCIONADA: 300m (balance óptimo costo/mantenibilidad)
```

---

## 🎨 PLANTILLA RÁPIDA PARA COPIAR

Usa esta plantilla para completar el formulario:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📝 OBSERVACIÓN TÉCNICA:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Describir QUÉ cambiar]:
El item [CODIGO_WBS] "[DESCRIPCION]" debe cambiar de 
[CANTIDAD_ACTUAL] a [CANTIDAD_NUEVA] unidades.

CÁLCULO:
- [Mostrar fórmula o justificación numérica]
- Ejemplo: 520.78 km ÷ 0.3 km = 1,735 unidades

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💡 JUSTIFICACIÓN:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

POR QUÉ es necesario este cambio:

1. Cumplimiento normativo: [Norma aplicable]
2. Beneficio técnico: [Qué mejora]
3. Beneficio económico: [Ahorro o costo]
4. Beneficio operativo: [Mantenibilidad, disponibilidad]

IMPACTO PRESUPUESTAL:
- Actual: [CANT_ACTUAL] × [VU] = [TOTAL_ACTUAL]
- Propuesto: [CANT_NUEVA] × [VU] = [TOTAL_NUEVO]
- Diferencia: [AHORRO o INCREMENTO] ([% cambio])

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📏 CRITERIO DE DISEÑO: (Opcional)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Norma técnica: [UIC XXX, IEC XXXXX, EN XXXXX]
Sección del contrato: [AT1-AT10, Cláusula X.Y]
Estándar aplicado: [Descripción breve]

```

**Copiar, pegar en el formulario, y rellenar los [] con tus datos.**

---

## 📋 TIPOS DE DT (Con Ejemplos)

### 1️⃣ **AJUSTE DE CANTIDAD**

**Cuándo:** Un item tiene cantidad incorrecta

**Ejemplo real:** DT-FIBRA-641
```
Item: 2.3.103 - Cajas de empalme
Cambio: 2,068 → 1,823 unidades
Razón: Cálculo correcto según longitud contractual
```

**Plantilla:**
```
Observación: El item [CODIGO] tiene [CANT_ACTUAL] pero 
debería ser [CANT_CORRECTA] según [CRITERIO].

Justificación: [Norma] establece que [EXPLICACIÓN].

Impacto: Ahorro/Incremento de $[MONTO] COP
```

---

### 2️⃣ **NUEVO ELEMENTO**

**Cuándo:** Falta un equipo en el layout

**Ejemplo real:** DT-CCTV-010 (hipotético)
```
Item: Nuevo
Descripción: 5 cámaras CCTV adicionales
Ubicación: PK 450+000 a PK 455+000
Razón: Zona crítica sin cobertura de video
```

**Plantilla:**
```
Observación: Se requiere agregar [CANTIDAD] [EQUIPO] 
en ubicación [PK o UFV].

Justificación: Zona [DESCRIPCIÓN] no tiene cobertura 
según análisis de riesgo R-[ID].

Impacto: Incremento $[MONTO] COP
```

---

### 3️⃣ **CAMBIO DE CRITERIO TÉCNICO**

**Cuándo:** Un parámetro de diseño debe cambiar

**Ejemplo real:** DT-FIBRA-003 (hipotético)
```
Criterio actual: Espaciamiento 500m
Criterio nuevo: Espaciamiento 300m
Razón: UIC 518 recomienda 250-400m (300m óptimo)
```

**Plantilla:**
```
Observación: El criterio [NOMBRE_CRITERIO] debe cambiar 
de [VALOR_ACTUAL] a [VALOR_NUEVO].

Justificación: [Norma] establece rango [MIN-MAX]. 
Valor óptimo es [VALOR] porque [RAZÓN].

Impacto: Cambio en items [CÓDIGOS_WBS]
```

---

### 4️⃣ **ELIMINACIÓN DE ELEMENTO**

**Cuándo:** Un equipo ya no es necesario

**Ejemplo real:** DT-BALIZA-001
```
Elemento: Balizas de señalización física
Cantidad actual: 300+
Propuesta: Eliminar todas
Razón: ATP embarcado hace balizas innecesarias
```

**Plantilla:**
```
Observación: Los elementos [DESCRIPCIÓN] deben eliminarse 
del alcance.

Justificación: Con la implementación de [SISTEMA_NUEVO], 
estos elementos ya no son necesarios porque [RAZÓN].

Impacto: Ahorro $[MONTO] COP
```

---

## 🔄 ¿QUÉ PASA DESPUÉS DE CREAR LA DT?

### Flujo Simplificado:

```
TÚ                           PMO                    SISTEMA
│                             │                       │
├─ 1. Generas DT              │                       │
│   (10-15 min)               │                       │
│                             │                       │
├─ 2. Guardas archivo ────────→                      │
│   (1 min)                   │                       │
│                             │                       │
│                             ├─ 3. Revisa DT         │
│                             │   (10-30 min)         │
│                             │                       │
│                             ├─ 4. Si aprueba:       │
│                             │   Ejecuta script ─────→
│                             │   (1 comando)         │
│                             │                       │
│                             │                      ├─ 5. Detecta DT
│                             │                      │   (1 seg)
│                             │                      │
│                             │                      ├─ 6. Lee YAML
│                             │                      │   (1 seg)
│                             │                      │
│                             │                      ├─ 7. Valida
│                             │                      │   (2 seg)
│                             │                      │
│                             │                      ├─ 8. Ejecuta cambios
│                             │                      │   en 6 niveles
│                             │                      │   (25 seg)
│                             │                      │
│                             │                      ├─ 9. Completa log
│                             │                      │   (1 seg)
│                             │                      │
│                             ├─ 10. Verifica ←──────┘
│                             │   (5 min)
│                             │
├─ 11. Recibe notificación ←──┤
│   ✅ DT ejecutada             │
│                             │
├─ 12. Verificas en Layout    │
│   Ctrl+Shift+F5             │
│   (1 min)                   │
│                             │
└─ ✅ COMPLETADO               │
```

**Tiempo total:** 
- Tu tiempo: ~15 minutos
- Tiempo PMO: ~35 minutos
- Tiempo sistema: ~30 segundos (automático)

---

## 🎯 CONSEJOS PRÁCTICOS

### ✅ Para que tu DT se apruebe rápido:

1. **Sé claro y conciso**
   - Usa párrafos cortos
   - Listas con viñetas
   - Tablas para comparativas

2. **Muestra números**
   - Cálculos explícitos
   - Impacto presupuestal
   - Porcentajes de cambio

3. **Referencia normas**
   - UIC, IEC, EN, AREMA
   - Apéndices Técnicos (AT1-AT10)
   - Cláusulas del contrato

4. **Evalúa alternativas**
   - Mínimo 2-3 opciones
   - Tabla comparativa
   - Razón de selección

5. **Cuantifica beneficios**
   - Ahorro de costos
   - Mejora de disponibilidad
   - Reducción de riesgos

---

### ❌ Evita:

1. **Ambigüedad**
   - ❌ "Cambiar algunas cajas"
   - ✅ "Cambiar item 2.3.103 de 2,068 a 1,823"

2. **Justificaciones débiles**
   - ❌ "Porque es mejor"
   - ✅ "Cumple UIC 518, reduce costos 15%, mejora disponibilidad"

3. **Olvidar impacto presupuestal**
   - ❌ "Cambio de cantidad"
   - ✅ "Ahorro $330M COP (-12%)"

4. **No referenciar normas**
   - ❌ "Es el estándar"
   - ✅ "UIC 518 OR, Sección 4.2.3"

---

## 📞 PREGUNTAS FRECUENTES

### ❓ ¿Puedo crear una DT sin usar el Layout?

**Respuesta:** Sí, pero es más difícil.

Deberías copiar la plantilla:
`II. Apendices Tecnicos/Decisiones_Tecnicas/TEMPLATE_DT_CON_YAML_v1.0.md`

**PERO es más fácil** usar el generador del Layout Maestro ✅

---

### ❓ ¿Qué pasa si me equivoco en una DT?

**Respuesta:**
1. Si aún NO se ejecutó → Edita el archivo .md
2. Si YA se ejecutó → Crea una DT nueva corrigiendo
3. En ambos casos → Notifica a PMO

**Nota:** Las DTs son **eventos inmutables**, así que mejor crear una DT correctiva que editar una ejecutada.

---

### ❓ ¿Puedo ver el YAML antes de generar la DT?

**Respuesta:** No directamente, pero el sistema lo genera según:
- Sistema seleccionado
- Filtros aplicados
- Items WBS detectados

Es **generado automáticamente** y revisado por PMO antes de ejecutar.

---

### ❓ ¿Cuántas DTs puedo crear?

**Respuesta:** Las que necesites.

**Recomendación:**
- 1 DT por tema (no mezclar cambios no relacionados)
- Ejemplo: DT-FIBRA-641 solo para cajas, DT-FIBRA-642 para domos

**Ya creadas:** 25 DTs en el proyecto

---

## 📚 DOCUMENTOS RELACIONADOS

**Para aprender más:**
- `MANUAL_DE_USO_COMPLETO.md` - Manual general con tutoriales
- `ARCHITECTURE.md` - Cómo funciona el sistema por dentro
- `.cursorrules` - Reglas técnicas de ejecución (técnico)

**Para soporte:**
- Email: pmo@proyecto-ld-ch.com
- Ver: `README.md` sección de contactos

---

## ✨ RESUMEN EN 3 PASOS

```
1️⃣ GENERAR
   Abrir Layout → Filtrar → Click "Crear DT" → Completar formulario

2️⃣ GUARDAR
   Mover archivo a: II. Apendices Tecnicos/Decisiones_Tecnicas/

3️⃣ NOTIFICAR
   Email a PMO → Esperar aprobación → PMO ejecuta → Verificar
```

**¡Es así de simple!** 🎉

---

**Guía creada:** 12 de Octubre 2025  
**Versión:** 1.0  
**Para:** Especialistas técnicos de cualquier nivel  
**Próxima actualización:** Según feedback de usuarios
