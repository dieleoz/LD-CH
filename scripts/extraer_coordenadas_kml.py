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
        
        # Buscar coordenadas en el Point
        point = placemark.find('kml:Point', ns)
        if point is not None:
            coords_elem = point.find('kml:coordinates', ns)
            if coords_elem is not None and coords_elem.text:
                coords = coords_elem.text.strip()
                parts = coords.split(',')
                if len(parts) >= 2:
                    lng = float(parts[0])
                    lat = float(parts[1])
                    
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
    ruta_kml = "X_ENTREGABLES_CONSOLIDADOS/5_INDICES_NAVEGACION/doc.kml"
    ruta_salida = "IX. WBS y Planificacion/coordenadas_kml.json"
    
    if not os.path.exists(ruta_kml):
        print(f"Archivo no encontrado: {ruta_kml}")
        exit(1)
    
    extraer_coordenadas_kml(ruta_kml, ruta_salida)
    print("\nProceso completado")

