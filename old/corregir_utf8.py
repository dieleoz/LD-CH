#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script de Corrección UTF-8 - APP La Dorada-Chiriguaná
Administrador Contractual EPC
Fecha: 27 de enero de 2025

Este script corrige los caracteres especiales corruptos en los documentos principales
del proyecto APP La Dorada-Chiriguaná.
"""

import os
import re
import shutil
from pathlib import Path

def corregir_caracteres_especiales(texto):
    """
    Corrige los caracteres especiales corruptos más comunes
    """
    # Mapeo de caracteres corruptos a caracteres correctos
    correcciones = {
        # Caracteres españoles corruptos
        'Ã¡': 'á', 'Ã©': 'é', 'Ã­': 'í', 'Ã³': 'ó', 'Ãº': 'ú',
        'Ã±': 'ñ', 'Ã¼': 'ü', 'Ã§': 'ç',
        # Caracteres con acentos
        'Ã¢': 'â', 'Ã£': 'ã', 'Ã¤': 'ä', 'Ã¥': 'å', 'Ã¦': 'æ',
        'Ã¨': 'è', 'Ã«': 'ë', 'Ã¬': 'ì', 'Ã®': 'î', 'Ã¯': 'ï',
        # Caracteres especiales
        'Ã°': 'ð', 'Ã²': 'ò', 'Ã´': 'ô', 'Ãµ': 'õ', 'Ã¶': 'ö',
        'Ã·': '÷', 'Ã¸': 'ø', 'Ã¹': 'ù', 'Ã»': 'û', 'Ã½': 'ý',
        'Ã¾': 'þ', 'Ã¿': 'ÿ',
        # Caracteres específicos encontrados
        'ª': 'ª',  # Orden numeral femenino
        'º': 'º',  # Orden numeral masculino
        '½': '½',  # Un medio
        # Caracteres de control y basura
        'CCm t, [ºoUFk AUFk': '',  # Texto corrupto específico
        'IPCVi½-': '',  # Texto corrupto específico
        'ª"\'1': '',  # Texto corrupto específico
    }
    
    # Aplicar correcciones
    texto_corregido = texto
    for corrupto, correcto in correcciones.items():
        texto_corregido = texto_corregido.replace(corrupto, correcto)
    
    # Limpiar caracteres de control y espacios múltiples
    texto_corregido = re.sub(r'\s+', ' ', texto_corregido)  # Múltiples espacios a uno
    texto_corregido = re.sub(r'[^\x20-\x7E\u00A0-\uFFFF]', '', texto_corregido)  # Caracteres de control
    
    return texto_corregido

def procesar_archivo(archivo_entrada, archivo_salida):
    """
    Procesa un archivo individual para corregir la codificación
    """
    try:
        # Leer archivo con diferentes codificaciones
        contenido = None
        codificacion_original = None
        
        for encoding in ['utf-8', 'latin-1', 'cp1252', 'iso-8859-1']:
            try:
                with open(archivo_entrada, 'r', encoding=encoding) as f:
                    contenido = f.read()
                codificacion_original = encoding
                print(f"  ✓ Leído con codificación: {encoding}")
                break
            except UnicodeDecodeError:
                continue
        
        if contenido is None:
            print(f"  ✗ No se pudo leer el archivo: {archivo_entrada}")
            return False
        
        # Corregir caracteres especiales
        contenido_corregido = corregir_caracteres_especiales(contenido)
        
        # Escribir archivo corregido en UTF-8
        with open(archivo_salida, 'w', encoding='utf-8') as f:
            f.write(contenido_corregido)
        
        print(f"  ✓ Archivo corregido: {archivo_salida}")
        return True
        
    except Exception as e:
        print(f"  ✗ Error procesando archivo: {e}")
        return False

def main():
    """
    Función principal del script
    """
    print("🚨 CORRECCIÓN UTF-8 - APP LA DORADA-CHIRIGUANÁ")
    print("=" * 60)
    
    # Directorio base
    directorio_base = Path(".")
    
    # Archivos a corregir
    archivos_criticos = [
        "01. contrato en .md/FORMATEADO_1 - CONTRATO DE CONCESION NO. 001 DE 2025 - Editable.md",
        "01. contrato en .md/FORMATEADO_APENDICE TECNICO 1.md",
        "01. contrato en .md/FORMATEADO_APENDICE TECNICO 2.md",
        "01. contrato en .md/FORMATEADO_APENDICE TECNICO 3.md",
        "01. contrato en .md/FORMATEADO_APENDICE TECNICO 4.md",
        "01. contrato en .md/FORMATEADO_APENDICE TECNICO 5.md",
        "01. contrato en .md/FORMATEADO_APENDICE TECNICO 6.md",
        "01. contrato en .md/FORMATEADO_APENDICE TECNICO 7.md",
    ]
    
    # Crear backup
    backup_dir = directorio_base / "backup_originales"
    backup_dir.mkdir(exist_ok=True)
    
    archivos_procesados = 0
    archivos_exitosos = 0
    
    for archivo_relativo in archivos_criticos:
        archivo_entrada = directorio_base / archivo_relativo
        
        if not archivo_entrada.exists():
            print(f"⚠️  Archivo no encontrado: {archivo_relativo}")
            continue
        
        print(f"\n📄 Procesando: {archivo_relativo}")
        
        # Crear backup
        backup_file = backup_dir / archivo_entrada.name
        shutil.copy2(archivo_entrada, backup_file)
        print(f"  📦 Backup creado: {backup_file}")
        
        # Procesar archivo
        if procesar_archivo(archivo_entrada, archivo_entrada):
            archivos_exitosos += 1
        
        archivos_procesados += 1
    
    # Resumen
    print("\n" + "=" * 60)
    print("📊 RESUMEN DE CORRECCIÓN UTF-8")
    print("=" * 60)
    print(f"Archivos procesados: {archivos_procesados}")
    print(f"Archivos corregidos: {archivos_exitosos}")
    print(f"Backups creados en: {backup_dir}")
    
    if archivos_exitosos == archivos_procesados:
        print("✅ CORRECCIÓN COMPLETADA EXITOSAMENTE")
    else:
        print("⚠️  CORRECCIÓN PARCIAL - Revisar archivos con errores")
    
    print("\n🎯 PRÓXIMOS PASOS:")
    print("1. Verificar que los archivos se lean correctamente")
    print("2. Validar contenido crítico")
    print("3. Actualizar roadmap con corrección completada")

if __name__ == "__main__":
    main()
