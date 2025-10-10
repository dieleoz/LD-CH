#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script para extraer información de contratos PDF
Proyecto APP La Dorada - Chiriguaná
"""

import PyPDF2
import pdfplumber
import re
import os
from pathlib import Path

class ContractExtractor:
    def __init__(self, pdf_path):
        self.pdf_path = pdf_path
        self.text_content = ""
        self.tables = []
        self.sections = {}
    
    def extract_text_pypdf2(self):
        """Extrae texto usando PyPDF2"""
        try:
            with open(self.pdf_path, 'rb') as file:
                pdf_reader = PyPDF2.PdfReader(file)
                text = ""
                for page in pdf_reader.pages:
                    text += page.extract_text() + "\n"
                return text
        except Exception as e:
            print(f"Error con PyPDF2: {e}")
            return ""
    
    def extract_text_pdfplumber(self):
        """Extrae texto y tablas usando pdfplumber"""
        try:
            with pdfplumber.open(self.pdf_path) as pdf:
                text = ""
                tables = []
                for page in pdf.pages:
                    # Extraer texto
                    page_text = page.extract_text()
                    if page_text:
                        text += page_text + "\n"
                    
                    # Extraer tablas
                    page_tables = page.extract_tables()
                    if page_tables:
                        tables.extend(page_tables)
                
                return text, tables
        except Exception as e:
            print(f"Error con pdfplumber: {e}")
            return "", []
    
    def extract_sections(self, text):
        """Extrae secciones específicas del contrato"""
        sections = {
            'obligaciones': [],
            'plazos': [],
            'penalidades': [],
            'garantias': [],
            'seguros': [],
            'especificaciones_tecnicas': []
        }
        
        # Patrones para identificar secciones
        patterns = {
            'obligaciones': r'(?i)(obligaci[oó]n|debe|deber[aá]|est[aá] obligado)',
            'plazos': r'(?i)(plazo|tiempo|d[ií]a|mes|a[ñn]o|fecha)',
            'penalidades': r'(?i)(penalidad|multa|sanci[oó]n|incumplimiento)',
            'garantias': r'(?i)(garant[ií]a|fianza|aval)',
            'seguros': r'(?i)(seguro|p[oó]liza|cobertura)',
            'especificaciones_tecnicas': r'(?i)(especificaci[oó]n|t[ée]cnico|dise[ñn]o|planos)'
        }
        
        for section, pattern in patterns.items():
            matches = re.finditer(pattern, text)
            for match in matches:
                # Extraer contexto alrededor del match
                start = max(0, match.start() - 200)
                end = min(len(text), match.end() + 200)
                context = text[start:end]
                sections[section].append(context)
        
        return sections
    
    def save_results(self, output_dir="extracted_contracts"):
        """Guarda los resultados extraídos"""
        Path(output_dir).mkdir(exist_ok=True)
        
        base_name = Path(self.pdf_path).stem
        
        # Guardar texto completo
        with open(f"{output_dir}/{base_name}_texto_completo.txt", 'w', encoding='utf-8') as f:
            f.write(self.text_content)
        
        # Guardar secciones extraídas
        with open(f"{output_dir}/{base_name}_secciones.txt", 'w', encoding='utf-8') as f:
            for section, content in self.sections.items():
                f.write(f"\n=== {section.upper()} ===\n")
                for item in content:
                    f.write(f"{item}\n\n")
        
        # Guardar tablas si existen
        if self.tables:
            with open(f"{output_dir}/{base_name}_tablas.txt", 'w', encoding='utf-8') as f:
                for i, table in enumerate(self.tables):
                    f.write(f"\n=== TABLA {i+1} ===\n")
                    for row in table:
                        f.write(f"{' | '.join(str(cell) for cell in row)}\n")
        
        print(f"Resultados guardados en: {output_dir}/")

def main():
    # Configuración
    pdf_files = [
        "contrato_general.pdf",
        "apendices_tecnicos.pdf",
        "especificaciones.pdf"
    ]
    
    for pdf_file in pdf_files:
        if os.path.exists(pdf_file):
            print(f"Procesando: {pdf_file}")
            extractor = ContractExtractor(pdf_file)
            
            # Extraer usando pdfplumber (más completo)
            text, tables = extractor.extract_text_pdfplumber()
            extractor.text_content = text
            extractor.tables = tables
            
            # Extraer secciones
            extractor.sections = extractor.extract_sections(text)
            
            # Guardar resultados
            extractor.save_results()
        else:
            print(f"Archivo no encontrado: {pdf_file}")

if __name__ == "__main__":
    main()
