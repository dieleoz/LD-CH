# Reporte: Integración de Coordenadas Real del KML

**Fecha**: 15 de Octubre de 2025  
**Proyecto**: APP La Dorada-Chiriguaná  
**Rama**: `feature/layout-leaflet-georeferenciado`

---

## Objetivo

Integrar las coordenadas reales del archivo `doc.kml` extraído del `.kmz` en el layout georreferenciado interactivo.

---

## Proceso Realizado

### 1. Extracción de Coordenadas

**Script creado**: `scripts/extraer_coordenadas_kml.py`

- Parseo del archivo KML con `xml.etree.ElementTree`
- Extracción de Placemarks con tags `<name>` y `<coordinates>`
- Conversión de nombres a PKs numéricos
- Guardado en formato JSON

**Resultado**: 896 coordenadas extraídas exitosamente

**Archivo generado**: `IX. WBS y Planificacion/coordenadas_kml.json`

### 2. Estructura de Coordenadas

```json
{
  "PK": 202,
  "nombre": "202",
  "longitud": -74.671727,
  "latitud": 5.476584
}
```

**Rango de PKs**: 202 a 1097  
**Total puntos**: 896 coordenadas geográficas

### 3. Integración en Layout HTML

**Archivo modificado**: `WBS_LAYOUT_Georeferenciado_Leaflet.html`

**Cambios realizados**:

1. **Carga de coordenadas KML**:
   ```javascript
   fetch('coordenadas_kml.json')
       .then(response => response.json())
       .then(data => {
           window.coordenadasKML = data;
       });
   ```

2. **Mapeo de equipos por PK**:
   - Buscar equipos por PK en `coordenadasKML`
   - Usar coordenadas reales si existe match
   - Fallback a coordenadas aproximadas si no hay match

3. **Lógica de coordenadas**:
   ```javascript
   if (coordKML) {
       // Usar coordenadas reales del KML
       lat = coordKML.latitud;
       lng = coordKML.longitud;
   } else {
       // Calcular coordenadas aproximadas desde PK
   }
   ```

---

## Resultados

### Coordenadas Existentes

- ✅ **896 puntos de referencia** con coordenadas reales
- ✅ **Rango geográfico**: 
  - Latitud: 5.47° N (La Dorada) a 9.30° N (Chiriguaná)
  - Longitud: -74.67° W a -73.60° W

### PKs Cubiertos

Ejemplos de PKs con coordenadas reales:
- PK 202: 5.476584° N, -74.671727° W
- PK 203: 5.483585° N, -74.677433° W
- PK 204: 5.490742° N, -74.682948° W
- ...
- PK 1097: Coordenadas finales del corredor

### Mapeo de Equipos

El layout puede mapear todos los equipos del proyecto usando:
- **PK exacto**: Si el equipo tiene un PK que existe en `coordenadasKML`
- **PK aproximado**: Si el equipo tiene un PK cercano a algún punto de referencia
- **Fallback**: Si no hay match, genera coordenadas aproximadas

---

## Archivos Modificados

1. `scripts/extraer_coordenadas_kml.py` ✅ CREAR
   - Script Python para extraer coordenadas del KML

2. `IX. WBS y Planificacion/coordenadas_kml.json` ✅ CREAR
   - Archivo JSON con 896 coordenadas reales

3. `IX. WBS y Planificacion/WBS_LAYOUT_Georeferenciado_Leaflet.html` ✅ MODIFICAR
   - Carga de coordenadas KML
   - Mapeo de equipos por PK con coordenadas reales
   - Logging para debugging

---

## Próximos Pasos

1. **Probar en GitHub Pages**:
   - Verificar que `coordenadas_kml.json` se carga correctamente
   - Confirmar que los marcadores aparecen en el mapa

2. **Optimización**:
   - Considerar indexar el JSON por PK para búsquedas más rápidas
   - Agregar clustering para manejar mejor 896+ marcadores

3. **Integración**:
   - Actualizar `layout_datos.js` para incluir coordenadas reales cuando coincidan
   - Mejorar el matching de PKs para mayor precisión

---

## Comandos Git

```bash
# Cambios en rama
git checkout feature/layout-leaflet-georeferenciado

# Archivos añadidos
git add scripts/extraer_coordenadas_kml.py
git add IX. WBS y Planificacion/coordenadas_kml.json
git add IX. WBS y Planificacion/WBS_LAYOUT_Georeferenciado_Leaflet.html

# Commit
git commit -m "feat: Integrar coordenadas reales del KML en layout georreferenciado"

# Push
git push origin feature/layout-leaflet-georeferenciado
```

---

## Estado

✅ **COMPLETADO**: Coordenadas reales del KML extraídas e integradas en el layout georreferenciado

**Commit**: `eb9403d`  
**Rama**: `feature/layout-leaflet-georeferenciado`

