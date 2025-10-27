#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script para extraer coordenadas del archivo KML del proyecto LD-CH
Uso: python scripts/extraer_coordenadas_kml.py
"""

import xml.etree.ElementTree as ET
import json
import os

def extraer_coordenadas_kml(ruta_kml, ruta_salida):
    """Extrae coordenadas de un archivo KML"""
    
    print(f"Leyendo KML: {ruta_kml}")
    
    # Parsear KML
    tree = ET.parse(ruta_kml)
    root = tree.getroot()
    
    # Namespace
    ns = {'kml': 'http://www.opengis.net/kml/2.2'}
    
    coordenadas = []
    
    # Buscar todos los Placemarks
    for placemark in root.findall('.//kml:Placemark', ns):
        name_elem = placemark.find('kml:name', ns)
        if name_elem is None:
            continue
            
        name = name_elem.text.strip()
        
        # Verificar descripción para filtrar solo "La Dorada - Chiriguana"
        desc_elem = placemark.find('kml:description', ns)
        if desc_elem is None or desc_elem.text is None:
            continue
            
        desc_text = desc_elem.text.strip()
        # Solo incluir si es el tramo correcto
        if 'La Dorada - Chiriguana' not in desc_text and 'Chiriguaná' not in desc_text:
            continue
        
        # Buscar coordenadas en el Point
        point = placemark.find('kml:Point', ns)
        if point is not None:
            coords_elem = point.find('kml:coordinates', ns)
            if coords_elem is not None and coords_elem.text:
                coords = coords_elem.text.strip()
                parts = coords.split(',')
                if len(parts) >= 2:
                    # En KML el formato es: longitude,latitude,elevation
                    # Invertir para Leaflet que usa: latitude,longitude
                    lng = float(parts[0])  # longitude first
                    lat = float(parts[1])  # latitude second
                    
                    # Intentar convertir nombre a PK (si es numérico)
                    try:
                        pk = int(name)
                    except ValueError:
                        pk = None
                    
                    coordenadas.append({
                        'PK': pk if pk else name,
                        'nombre': name,
                        'longitud': lng,
                        'latitud': lat
                    })
    
    print(f"Encontradas {len(coordenadas)} coordenadas")
    
    # Guardar JSON
    with open(ruta_salida, 'w', encoding='utf-8') as f:
        json.dump(coordenadas, f, indent=2, ensure_ascii=False)
    
    print(f"Guardadas en: {ruta_salida}")
    
    # Mostrar primeras 10
    print("\nPrimeras 10 coordenadas:")
    for coord in coordenadas[:10]:
        print(f"  PK: {coord['PK']} | {coord['latitud']}, {coord['longitud']}")
    
    return coordenadas

if __name__ == '__main__':
    import sys
    import os
    
    # Obtener directorio del script
    script_dir = os.path.dirname(os.path.abspath(__file__))
    project_root = os.path.dirname(script_dir)
    
    ruta_kml = os.path.join(project_root, "X_ENTREGABLES_CONSOLIDADOS", "5_INDICES_NAVEGACION", "doc.kml")
    ruta_salida = os.path.join(project_root, "IX. WBS y Planificacion", "coordenadas_kml.json")
    
    if not os.path.exists(ruta_kml):
        print(f"Archivo no encontrado: {ruta_kml}")
        exit(1)
    
    extraer_coordenadas_kml(ruta_kml, ruta_salida)
    print("\nProceso completado")

