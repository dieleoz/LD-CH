#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Extractor avanzado de PDFs con OCR
Para contratos escaneados o con imágenes
"""

import pytesseract
from PIL import Image
import fitz  # PyMuPDF
import cv2
import numpy as np
import os
import re
from pathlib import Path

class AdvancedPDFExtractor:
    def __init__(self, pdf_path, tesseract_path=None):
        self.pdf_path = pdf_path
        if tesseract_path:
            pytesseract.pytesseract.tesseract_cmd = tesseract_path
    
    def extract_text_with_ocr(self):
        """Extrae texto usando OCR de páginas convertidas a imagen"""
        doc = fitz.open(self.pdf_path)
        full_text = ""
        
        for page_num in range(len(doc)):
            page = doc.load_page(page_num)
            
            # Convertir página a imagen
            mat = fitz.Matrix(2, 2)  # Aumentar resolución
            pix = page.get_pixmap(matrix=mat)
            img_data = pix.tobytes("png")
            
            # Convertir a imagen PIL
            image = Image.open(io.BytesIO(img_data))
            
            # Aplicar OCR
            text = pytesseract.image_to_string(image, lang='spa')
            full_text += f"\n--- PÁGINA {page_num + 1} ---\n{text}"
        
        doc.close()
        return full_text
    
    def preprocess_image(self, image):
        """Preprocesa imagen para mejorar OCR"""
        # Convertir a escala de grises
        gray = cv2.cvtColor(np.array(image), cv2.COLOR_RGB2GRAY)
        
        # Aplicar filtros para mejorar calidad
        denoised = cv2.medianBlur(gray, 3)
        thresh = cv2.threshold(denoised, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)[1]
        
        return Image.fromarray(thresh)
    
    def extract_tables_with_ocr(self):
        """Extrae tablas usando OCR"""
        doc = fitz.open(self.pdf_path)
        tables = []
        
        for page_num in range(len(doc)):
            page = doc.load_page(page_num)
            
            # Buscar tablas en la página
            table_rects = page.get_drawings()
            
            for rect in table_rects:
                # Extraer región de la tabla
                clip = fitz.Rect(rect)
                pix = page.get_pixmap(clip=clip)
                img = Image.frombytes("RGB", [pix.width, pix.height], pix.samples)
                
                # OCR en la tabla
                table_text = pytesseract.image_to_string(img, lang='spa')
                tables.append(table_text)
        
        doc.close()
        return tables

def main():
    # Configuración para Windows
    tesseract_path = r"C:\Program Files\Tesseract-OCR\tesseract.exe"
    
    pdf_files = ["contrato.pdf", "anexos.pdf"]
    
    for pdf_file in pdf_files:
        if os.path.exists(pdf_file):
            print(f"Procesando con OCR: {pdf_file}")
            extractor = AdvancedPDFExtractor(pdf_file, tesseract_path)
            
            # Extraer texto con OCR
            text = extractor.extract_text_with_ocr()
            
            # Guardar resultado
            output_file = f"extracted_contracts/{Path(pdf_file).stem}_ocr.txt"
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(text)
            
            print(f"Texto extraído guardado en: {output_file}")

if __name__ == "__main__":
    main()
