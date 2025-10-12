# 🗺️ GUÍA RÁPIDA: CÓMO VER Y EXPORTAR EL LAYOUT

**Versión:** 1.0  
**Fecha:** 11 de Octubre 2025  
**Audiencia:** PMO, Ingenieros, Cliente  
**Tiempo de lectura:** 3 minutos

---

## 🎯 **RESUMEN: 4 FORMAS DE VER EL LAYOUT**

| # | Forma | Dónde | Cómo | Mejor Para |
|:-:|:------|:------|:-----|:-----------|
| **1** | **Interfaz WBS** | Menú Principal | Click botón "LAYOUT MAESTRO" | ⭐ Visualización interactiva |
| **2** | **Documentos Ejecutivos** | Word/HTML servidos | Automático al ejecutar `servir.ps1` | ⭐ Cliente final |
| **3** | **Archivo Markdown** | VIII. Documentos Maestros | Abrir `.md` directo | Edición manual |
| **4** | **Excel exportado** | X/8_DOCUMENTOS_SERVIDOS/ | Ejecutar script exportación | ⭐ Análisis de datos |

---

## 📍 **FORMA 1: Ver en Interfaz WBS** ⭐ RECOMENDADA

### Paso a Paso:

```
1. Abrir: IX. WBS y Planificacion/WBS_Menu_Principal.html
2. Buscar tarjeta: "🗺️ LAYOUT MAESTRO - Ubicación de Equipos"
3. Click en botón: "🗺️ ABRIR LAYOUT"
4. ¡Listo! Verás interfaz interactiva
```

### Características de la Interfaz:

✅ **Tabla interactiva** con 800+ equipos  
✅ **Filtros dinámicos:**
   - Por Sistema (CONTROL, TELECOMUNICACIONES, etc.)
   - Por UFV (UFV23, UFV30, etc.)
   - Por PK (búsqueda de texto)  
✅ **Estadísticas en tiempo real:**
   - Total equipos
   - UFV únicas
   - Tipos de equipo
   - Equipos filtrados  
✅ **Colores por tipo de equipo** (amarillo=CONTROL, verde=TELECOM, etc.)  
✅ **Botones de exportación:**
   - 📊 Exportar Excel (descarga CSV)
   - 📄 Imprimir PDF (diálogo impresión navegador)

### Ejemplo de Uso:

**Escenario:** "Quiero ver solo las cámaras CCTV"

```
1. Abrir WBS_Layout_Maestro.html
2. Filtro "Sistema" → Seleccionar "EQUIPO ITS"
3. Filtro "Buscar PK" → Escribir "CCTV"
4. Ver ~180 cámaras CCTV filtradas
5. Click "Exportar Excel" → Descargar CSV con solo cámaras
```

**Tiempo total:** 30 segundos

---

## 📄 **FORMA 2: Ver en Documentos Ejecutivos** ⭐ PARA CLIENTE

### Paso a Paso:

```
1. Ejecutar: .\scripts\servir.ps1 -Todo
   (Layout se inyecta automáticamente)

2. Abrir cualquiera de estos Word/HTML:
   - SISTEMA_01_Control_y_Senalizacion_EJECUTIVO.docx
   - SISTEMA_02_Telecomunicaciones_EJECUTIVO.docx
   - ESPECIALIDAD_04_Ingenieria_Sistemas_EJECUTIVO.docx

3. Ir a la última sección: "📋 ANEXO: Layout de Equipos"

4. ¡Listo! Ver tabla con equipos relevantes del sistema
```

### Qué Verás:

**En SISTEMA_01 (Control):**
- ~700 equipos: Balizas, RBC, CTC, Señales

**En SISTEMA_02 (Telecomunicaciones):**
- ~87 equipos: TETRA, Nodos FO, Empalmes

**En ESPECIALIDAD_04 (Sistemas):**
- ~800 equipos: ¡TODOS los equipos del proyecto!

### Ventaja:

✅ **Cliente ve QUÉ y DÓNDE en un solo documento**  
✅ **No necesita abrir Excel aparte**  
✅ **Layout siempre sincronizado con descripción técnica**

---

## 📝 **FORMA 3: Ver Archivo Markdown Directo**

### Ubicación:

```
VIII. Documentos Maestros y Metodologia/LAYOUT_MAESTRO_EQUIPOS_v1.0.md
```

### Cómo Abrirlo:

**Opción A: En VS Code / Cursor**
```
Click derecho → Abrir con Cursor
```

**Opción B: En Navegador (con extensión)**
```
Arrastrar archivo .md al navegador Chrome
(Requiere extensión Markdown Viewer)
```

**Opción C: En Obsidian / Typora**
```
Abrir con aplicación Markdown
```

### Cuándo Usarlo:

- ✅ Editar/actualizar el layout
- ✅ Revisar estructura de datos
- ✅ Copiar tabla completa

---

## 📊 **FORMA 4: Exportar a Excel** ⭐ PARA ANÁLISIS

### Método A: Desde Interfaz WBS (Rápido)

```
1. Abrir: WBS_Layout_Maestro.html
2. Aplicar filtros (opcional)
3. Click botón: "📊 Exportar Excel"
4. Descargar: Layout_Maestro_[FECHA].csv
5. Abrir CSV en Excel
```

**Resultado:** CSV con equipos filtrados

---

### Método B: Desde Script PowerShell (Profesional)

#### **B1: Exportar como CSV (Siempre funciona)**

```powershell
.\scripts\exportar_layout_excel.ps1
```

**Genera:**
- `LAYOUT_MAESTRO_EQUIPOS_2025-10-11.csv` en `X/8_DOCUMENTOS_SERVIDOS/`
- Abrir en Excel → Formato tabla automático
- Todas las 800+ filas

---

#### **B2: Exportar como Excel .xlsx con Pestañas (Requiere Excel instalado)**

```powershell
.\scripts\exportar_layout_excel.ps1 -ConExcel
```

**Genera:**
- `LAYOUT_MAESTRO_EQUIPOS_2025-10-11.xlsx`

**Pestañas creadas automáticamente:**
1. **MASTER_LAYOUT** - Todos los equipos (800+)
2. **CONTROL** - Solo equipos de control (~700)
3. **TELECOMUNICACIONES** - Solo telecom (~87)
4. **EQUIPO ITS** - Solo ITS (~250)
5. **ENERGIA** - Solo energía (~50)
6. **EDIFICACION** - Solo edificaciones (~30)
7. **SEÑALIZACION** - Solo señalización (~200)
8. **SEGURIDAD** - Solo seguridad (~60)
9. **VIA** - Solo vía (~100)
10. **INFRAESTRUCTURA** - Solo infraestructura (~10)

**Ventaja:** Excel profesional listo para análisis con filtros Excel nativos, tablas dinámicas, gráficos, etc.

---

## 📄 **EXPORTAR A PDF**

### Método A: Desde Interfaz WBS (Más Fácil) ⭐

```
1. Abrir: WBS_Layout_Maestro.html
2. Aplicar filtros (opcional)
3. Click botón: "📄 Imprimir PDF"
4. En diálogo de impresión:
   - Destino → "Guardar como PDF"
   - Orientación → "Horizontal"
   - Márgenes → "Estrechos"
5. Click "Guardar"
```

**Resultado:** PDF con tabla filtrada, listo para imprimir

---

### Método B: Desde Script PowerShell (Avanzado)

```powershell
.\scripts\exportar_layout_pdf.ps1
```

**Genera:**
- `LAYOUT_MAESTRO_EQUIPOS_2025-10-11.pdf` en `X/8_DOCUMENTOS_SERVIDOS/PDF/`
- Formato profesional con tabla de contenidos
- Orientación horizontal automática

**Con filtros:**
```powershell
# Solo sistema CONTROL
.\scripts\exportar_layout_pdf.ps1 -Sistema CONTROL

# Solo UFV23
.\scripts\exportar_layout_pdf.ps1 -UFV UFV23
```

---

### Método C: Desde Documentos Ejecutivos Word

```
1. Ejecutar: .\scripts\servir.ps1 -Sistema 04
   (Genera Word con layout completo)

2. Abrir: ESPECIALIDAD_04_Ingenieria_Sistemas_EJECUTIVO.docx

3. En Word → Archivo → Guardar Como → PDF

4. ¡Listo! PDF con descripción técnica + layout completo
```

**Ventaja:** Documento ejecutivo completo (descripción + layout) en PDF

---

## 🎯 **CASOS DE USO POR ROL**

### **Ingeniero de Detalle**

**Necesidad:** "Quiero ver todas las balizas entre PK300 y PK400"

**Solución:**
```
1. Abrir: WBS_Layout_Maestro.html
2. Filtro Sistema → CONTROL
3. Filtro PK → Escribir "3" (muestra PK 300-399)
4. Ver ~20 balizas filtradas
```

---

### **PMO / Cliente**

**Necesidad:** "Necesito un Excel con todos los equipos para auditoría"

**Solución:**
```powershell
.\scripts\exportar_layout_excel.ps1 -ConExcel
```

**Resultado:** Excel profesional con 10 pestañas, listo para entregar

---

### **Coordinador de Obra**

**Necesidad:** "Necesito imprimir layout de la UFV23 para reunión"

**Solución:**
```
1. Abrir: WBS_Layout_Maestro.html
2. Filtro UFV → UFV23
3. Click "Imprimir PDF"
4. Guardar → Imprimir
```

---

### **Especialista de Sistemas**

**Necesidad:** "Necesito documentar ubicación de equipos TETRA"

**Solución:**
```
1. Ejecutar: .\scripts\servir.ps1 -Sistema 02
2. Abrir: SISTEMA_02_Telecomunicaciones_EJECUTIVO.docx
3. Ir a "ANEXO: Layout de Equipos de Telecomunicaciones"
4. Ver ~87 equipos TETRA/FO con PK/UFV
5. Guardar como PDF si necesario
```

---

## 📋 **CHECKLIST DE VALIDACIÓN**

Antes de entregar layout al cliente, verificar:

- [ ] **Datos completos:** 800+ equipos cargados
- [ ] **Filtros funcionan:** Probar filtro por Sistema, UFV, PK
- [ ] **Exportación Excel:** CSV descarga correctamente
- [ ] **Exportación PDF:** PDF se genera/imprime bien
- [ ] **Layout en docs ejecutivos:** Visible en Word/HTML
- [ ] **Estadísticas correctas:** Totales coinciden con resumen
- [ ] **Coordenadas actualizadas:** Si ya se hizo levantamiento topográfico

---

## ⚡ **COMANDOS RÁPIDOS DE REFERENCIA**

```powershell
# Ver layout en WBS
start "IX. WBS y Planificacion\WBS_Menu_Principal.html"
# → Click en "LAYOUT MAESTRO"

# Exportar a CSV (siempre funciona)
.\scripts\exportar_layout_excel.ps1

# Exportar a Excel .xlsx (requiere Excel)
.\scripts\exportar_layout_excel.ps1 -ConExcel

# Exportar a PDF (requiere Pandoc)
.\scripts\exportar_layout_pdf.ps1

# Servir docs con layout integrado
.\scripts\servir.ps1 -Todo

# Ver layout en ejecutivo SISTEMA_04
start "X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS\WORD\ESPECIALIDAD_04_Ingenieria_Sistemas_EJECUTIVO.docx"
```

---

## 🔧 **SOLUCIÓN DE PROBLEMAS**

| Problema | Causa | Solución |
|:---------|:------|:---------|
| **"Layout no carga en HTML"** | Ruta archivo incorrecta | Verificar que existe `VIII/LAYOUT_MAESTRO_EQUIPOS_v1.0.md` |
| **"Exportación Excel falla"** | Excel no instalado | Usar solo CSV o instalar Excel |
| **"PDF no se genera"** | Pandoc no instalado | Instalar Pandoc o usar "Imprimir PDF" en navegador |
| **"Filtros no funcionan"** | JavaScript deshabilitado | Habilitar JavaScript en navegador |
| **"Tabla muy grande en Word"** | 800+ filas | Usar filtros antes de servir o dividir en múltiples docs |

---

## 💡 **TIPS Y MEJORES PRÁCTICAS**

### ✅ Para Visualización Rápida:
```
Abrir: WBS_Layout_Maestro.html
```
**Razón:** Interfaz más rápida, filtros instantáneos

### ✅ Para Entregables Cliente:
```powershell
.\scripts\servir.ps1 -Todo
```
**Razón:** Layout se integra automáticamente en documentos ejecutivos

### ✅ Para Análisis de Datos:
```powershell
.\scripts\exportar_layout_excel.ps1 -ConExcel
```
**Razón:** Excel con pestañas permite tablas dinámicas, gráficos, análisis avanzado

### ✅ Para Imprimir:
```
WBS_Layout_Maestro.html → Filtrar → Imprimir PDF
```
**Razón:** Control total sobre qué equipos imprimir

---

## 📊 **EJEMPLO COMPLETO: Flujo de Trabajo Real**

### Situación:
**Cliente pide:** "Necesito un Excel con todas las cámaras CCTV de la UFV40/41 (Complejo Bermejo)"

### Solución Paso a Paso:

```
1. Abrir: WBS_Menu_Principal.html
2. Click: "LAYOUT MAESTRO"
3. Filtro Sistema → "EQUIPO ITS"
4. Filtro UFV → "UFV40/41"
5. Filtro PK → Escribir "CCTV" (opcional)
6. Ver resultado: 13 cámaras CCTV en Bermejo
7. Click: "Exportar Excel"
8. Enviar CSV al cliente
```

**Tiempo total:** 1 minuto  
**Archivos generados:** 1 CSV con 13 filas  
**Cliente:** Feliz 😊

---

## 🗂️ **UBICACIONES DE ARCHIVOS**

### Archivo Maestro (Fuente de Verdad):
```
VIII. Documentos Maestros y Metodologia/LAYOUT_MAESTRO_EQUIPOS_v1.0.md
```

### Interfaz HTML:
```
IX. WBS y Planificacion/WBS_Layout_Maestro.html
```

### Documentos Servidos con Layout:
```
X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/
├── WORD/
│   └── ESPECIALIDAD_04_Ingenieria_Sistemas_EJECUTIVO.docx (con layout completo)
└── HTML/
    └── ESPECIALIDAD_04_Ingenieria_Sistemas_EJECUTIVO.html (con layout completo)
```

### Exportaciones:
```
X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/
├── LAYOUT_MAESTRO_EQUIPOS_2025-10-11.csv
├── LAYOUT_MAESTRO_EQUIPOS_2025-10-11.xlsx (si usas -ConExcel)
└── PDF/
    └── LAYOUT_MAESTRO_EQUIPOS_2025-10-11.pdf
```

---

## 🚀 **FLUJO RECOMENDADO PARA ENTREGAS**

### Entrega Mensual a Cliente:

```powershell
# Paso 1: Cocinar (consolidar cambios de la cocina)
.\scripts\cocinar.ps1 -Todo

# Paso 2: Servir (generar Word/HTML con layout integrado)
.\scripts\servir.ps1 -Todo

# Paso 3: Exportar layout a Excel (archivo independiente)
.\scripts\exportar_layout_excel.ps1 -ConExcel

# Resultado:
# ✅ 13 documentos Word con layout integrado
# ✅ 13 documentos HTML con layout integrado
# ✅ 1 Excel con layout completo en pestañas
```

**Entregar al cliente:**
- Carpeta `X/8_DOCUMENTOS_SERVIDOS/` completa
- Cliente tiene:
  - 13 Word con contexto técnico + layout relevante
  - 1 Excel con layout completo para análisis
  - Todo sincronizado desde una sola fuente

---

## 📞 **¿NECESITAS AYUDA?**

### Para visualización:
- Abrir: `WBS_Layout_Maestro.html`
- Si no carga → Verificar que existe `LAYOUT_MAESTRO_EQUIPOS_v1.0.md`

### Para exportación:
- CSV → Siempre funciona, no requiere nada instalado
- Excel .xlsx → Requiere Excel instalado en Windows
- PDF → Usar "Imprimir PDF" del navegador (siempre funciona)

### Para integración en docs:
- Ejecutar: `.\scripts\servir.ps1 -Todo`
- Ver resultado en: `X/8_DOCUMENTOS_SERVIDOS/WORD/ESPECIALIDAD_04_...docx`

---

## 🎉 **RESUMEN VISUAL**

```
┌─────────────────────────────────────────────────────┐
│  LAYOUT MAESTRO (Fuente Única)                     │
│  VIII/LAYOUT_MAESTRO_EQUIPOS_v1.0.md               │
│  800+ equipos con PK, UFV, Tipo, Coordenadas       │
└─────────────────────────────────────────────────────┘
                        ↓
        ┌───────────────┴───────────────┐
        ↓                               ↓
┌──────────────────┐          ┌──────────────────┐
│  VER INTERACTIVO │          │  EXPORTAR        │
│                  │          │                  │
│  WBS_Layout_     │          │  📊 Excel/CSV    │
│  Maestro.html    │          │  📄 PDF          │
│                  │          │  📝 Word (auto)  │
│  ✅ Filtros      │          │                  │
│  ✅ Búsqueda     │          │  ✅ Completo     │
│  ✅ Estadísticas │          │  ✅ Filtrado     │
└──────────────────┘          └──────────────────┘
```

---

**Documento creado:** 11 de Octubre 2025  
**Autor:** Administrador Contractual EPC  
**Próxima actualización:** Cuando se agreguen coordenadas GPS  

---

## 🎯 **ACCIÓN INMEDIATA**

**Para ver el layout AHORA mismo:**

1. Abre el archivo que tienes abierto actualmente: `WBS_Menu_Principal.html`
2. Busca la tarjeta azul cyan: **"🗺️ LAYOUT MAESTRO"**
3. Click en el botón **"🗺️ ABRIR LAYOUT"**
4. ¡Explora los 800+ equipos con filtros interactivos!

**Para exportar a Excel AHORA:**
```powershell
.\scripts\exportar_layout_excel.ps1
```

**¡Disfruta tu sistema de layout clase mundial!** 🚀

