# Layout Georreferenciado - APP La Dorada-Chiriguaná

**Versión**: 1.0  
**Fecha**: 15 de Octubre de 2025  
**Rama**: `feature/layout-leaflet-georeferenciado` → MERGEADO a `main`

---

## 📍 Descripción

Layout georreferenciado interactivo que muestra todos los elementos del proyecto ferroviario en un mapa interactivo usando **Leaflet.js** y coordenadas reales extraídas del archivo KML del proyecto.

---

## 🎯 Características

✅ **522 coordenadas reales** extraídas del KML  
✅ **2199 elementos** georreferenciados  
✅ **Filtros por sistema**: Control, Telecomunicaciones, Seguridad, Energía  
✅ **Colores por tipo** de sistema  
✅ **Popup informativo** con detalles de cada elemento  
✅ **Mapa interactivo** con zoom y navegación  

---

## 📂 Archivos

### Archivos Principales

- `WBS_LAYOUT_Georeferenciado_Leaflet.html` - Interfaz principal del mapa
- `coordenadas_kml.js` - Coordenadas extraídas del KML (522 puntos)
- `layout_datos.js` - Datos de equipos y elementos del proyecto (2199 elementos)

### Scripts

- `scripts/extraer_coordenadas_kml.py` - Extrae coordenadas del doc.kml
- `scripts/generar_coordenadas_kml_js.py` - Convierte JSON a JS

### Documentación

- `REPORTE_COORDENADAS_KML.md` - Reporte detallado de la extracción
- `INDICE_NAVEGACION_MAESTRO_v1.0.md` - Índice actualizado con sección KML

---

## 🌐 Acceso

**GitHub Pages**: https://dieleoz.github.io/LD-CH/IX.%20WBS%20y%20Planificacion/WBS_LAYOUT_Georeferenciado_Leaflet.html

---

## 🔧 Uso

### Visualizar el Layout

1. Abrir el archivo `WBS_LAYOUT_Georeferenciado_Leaflet.html` en GitHub Pages
2. El mapa se carga automáticamente con todos los elementos
3. Los marcadores se muestran por colores según el sistema:
   - 🔴 **Rojo**: Control y Señalización
   - 🔵 **Azul**: Telecomunicaciones
   - 🟢 **Verde**: Seguridad
   - 🟠 **Naranja**: Energía

### Filtrar por Sistema

- Usar el dropdown "⚙️ Sistema" para filtrar por tipo
- Seleccionar un sistema para ver solo esos elementos
- Seleccionar "Todos los sistemas" para ver todo

### Información de Equipos

- Hacer clic en cualquier marcador para ver detalles
- Se muestra nombre, dispositivo, tipo, PK, ubicación, descripción

---

## 📊 Datos

### Coordenadas KML

- **Total de puntos**: 522
- **Rango de PKs**: 202 a 722 (PKs del corredor La Dorada-Chiriguaná)
- **Fuente**: `doc.kml` extraído del archivo `.kmz`

### Elementos Layout

- **Total de elementos**: 2199
- **Coordenadas reales**: 522 (unos 24% tienen PK exacto en KML)
- **Coordenadas aproximadas**: 1677 (por interpolación)
- **Tipo de elementos**: CTC, RBC, Paneles, Cajas, Antenas, etc.

---

## 🎨 Colores

| Sistema | Color | Hex |
|---------|-------|-----|
| Control y Señalización | 🔴 Rojo | `#e74c3c` |
| Telecomunicaciones | 🔵 Azul | `#3498db` |
| Seguridad | 🟢 Verde | `#2ecc71` |
| Energía | 🟠 Naranja | `#f39c12` |
| Otros | 🔵 Azul (default) | `#3498db` |

---

## 🔄 Actualización de Coordenadas

Si necesitas actualizar las coordenadas del KML:

```bash
# 1. Extraer nuevas coordenadas del KML
python scripts/extraer_coordenadas_kml.py

# 2. Convertir a JS
python scripts/generar_coordenadas_kml_js.py

# 3. Commit y push
git add IX.\ WBS\ y\ Planificacion/coordenadas_kml.js
git commit -m "Update: Coordenadas KML actualizadas"
git push
```

---

## 📝 Notas Técnicas

### Formato de PK

Los PKs en `layout_datos.js` usan formato ferroviario: `"338+250"` (338 km + 250 m)

El código convierte esto a número: `338+250` → `338` para buscar en `coordenadas_kml.js`

### Interpolación

Cuando un PK no tiene coordenada exacta en el KML, se interpola linealmente entre La Dorada (5.453°, -74.661°) y Chiriguaná (9.363°, -73.564°)

### Referencias Geográficas

- **La Dorada** (inicio): 5.453345°, -74.661383°
- **Chiriguaná** (fin): 9.362617°, -73.564402°
- **Corredor**: ~384 km de longitud

---

## ✅ Estado

- [x] Extracción de coordenadas del KML
- [x] Integración en layout HTML
- [x] Conversión a JS para evitar CORS
- [x] Filtros por sistema
- [x] Colores por tipo
- [x] Popup informativo
- [x] Ajuste automático de bounds
- [x] Merge a `main`
- [x] Push a GitHub Pages

---

**Última actualización**: 15 de Octubre de 2025  
**Commit**: `aa08f0c` - Merge feature/layout-leaflet-georeferenciado

