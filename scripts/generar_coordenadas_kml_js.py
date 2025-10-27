#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script para convertir coordenadas_kml.json a coordenadas_kml.js
"""

import json
import os

# Leer JSON
ruta_json = "IX. WBS y Planificacion/coordenadas_kml.json"
ruta_js = "IX. WBS y Planificacion/coordenadas_kml.js"

with open(ruta_json, 'r', encoding='utf-8') as f:
    data = json.load(f)

# Crear JS
js_content = "// Coordenadas del KML - Extraídas de doc.kml\n"
js_content += f"const coordenadasKML = {json.dumps(data, indent=2, ensure_ascii=False)};\n"
js_content += "\n// Exponer globalmente\n"
js_content += "if (typeof window !== 'undefined') {\n"
js_content += "    window.coordenadasKML = coordenadasKML;\n"
js_content += "}"

# Guardar
with open(ruta_js, 'w', encoding='utf-8') as f:
    f.write(js_content)

print(f"Generado: {ruta_js}")
print(f"   {len(data)} coordenadas")

