const criteriosTecnicosBase = {
  "version": "1.0",
  "fecha": "2025-10-07",
  "nota": "Base de conocimiento de criterios técnicos para ítems WBS",
  "criterios": {
    "2.3.103": {
      "item": "2.3.103",
      "nombre": "Cajas de empalme 80x80",
      "criterio_tecnico": {
        "justificacion": "Espaciamiento 300m según UIT-T + 88 nodos críticos",
        "calculo_detallado": "520.78 km ÷ 0.3 km = 1,736 cajas lineales + 88 cajas en 22 puentes = 1,824 total",
        "desglose": [
          "Cajas lineales: 1,736 unidades (cada 300m sobre longitud contractual 520.78 km)",
          "Cajas en puentes: 88 unidades (22 puentes × 4 cajas por puente)",
          "Cable fibra óptica: 594 km (520.78 km + 10% reserva para enrollado en cajas)",
          "Total cajas: 1,824 unidades"
        ],
        "fuente_normativa": "UIT-T G.652.D (establece máximo 500m entre puntos de empalme)",
        "fuente_diseno": "Diseño OSP - Planos AS-BUILT sección 2.2",
        "documentos_referencia": [
          "III/28_Sistema_FibraOptica_Integrado.md (Sección 2.2)",
          "V.3_Sistemas_Comunicacion_Detalle.md (Tabla 5.3)",
          "IV/37_Memorias_Diseno_Basico.md (Anexo C - Cálculo de cajas)"
        ],
        "restriccion": "Espaciamiento modificable entre 300m y 500m (límite UIT-T)",
        "alternativas": [
          "350m → 1,697 cajas (ahorro $500M, cumple norma)",
          "400m → 1,485 cajas (ahorro $787M, aumenta tiempo fallas)",
          "500m → 1,188 cajas (ahorro $1,188M, límite normativo)"
        ]
      },
      "riesgos_asociados": [
        {
          "id": "R-FIBRA-003",
          "descripcion": "Espaciamiento muy corto (300m) aumenta CAPEX innecesariamente",
          "probabilidad": "Alta",
          "impacto": "Alto",
          "estrategia": "Proponer DT para ajustar a 350m-400m"
        },
        {
          "id": "R-FIBRA-006",
          "descripcion": "Espaciamiento mayor dificulta localización de fallas",
          "probabilidad": "Baja",
          "impacto": "Medio",
          "estrategia": "Mantener entre 300m-400m para balance óptimo"
        }
      ]
    },
    "2.1.100": {
      "item": "2.1.100",
      "nombre": "Torres autosoportadas TETRA",
      "criterio_tecnico": {
        "justificacion": "37 torres para cobertura 594 km con solapamiento 20%",
        "calculo_detallado": "Alcance por torre: 12-16 km → 594 km ÷ 12 km = 49.5 torres → Optimizado a 37 con solapamiento inteligente",
        "desglose": [
          "Torres backbone: 30 unidades (espaciamiento ~20 km)",
          "Torres en nodos críticos: 5 unidades (estaciones, patios)",
          "Torres de refuerzo cobertura: 2 unidades (zonas complejas)"
        ],
        "fuente_normativa": "ETSI EN 300 396 (TETRA estándar)",
        "fuente_diseno": "Estudio de cobertura RF - Simulación propagación",
        "documentos_referencia": [
          "V.3_Sistemas_Comunicacion_Detalle.md (Sección 3.1)",
          "III/29_Sistema_TETRA_Integrado.md (Memoria de cálculo)",
          "IV/38_Estudio_Cobertura_RF.md (Simulaciones)"
        ],
        "restriccion": "Mínimo 33 torres para garantizar cobertura 100% según simulación",
        "alternativas": [
          "33 torres → Cobertura mínima 100% (riesgo en zonas complejas)",
          "37 torres → Cobertura 100% + 20% solapamiento (recomendado)",
          "42 torres → Cobertura 100% + 30% solapamiento (sobrecosto)"
        ]
      },
      "riesgos_asociados": [
        {
          "id": "R-TETRA-001",
          "descripcion": "Cantidad insuficiente genera zonas sin cobertura",
          "probabilidad": "Media",
          "impacto": "Alto",
          "estrategia": "Validar con estudio de propagación actualizado"
        }
      ]
    },
    "3.1.100": {
      "item": "3.1.100",
      "nombre": "Cámaras CCTV",
      "criterio_tecnico": {
        "justificacion": "73 cámaras para monitoreo de 48 PAN + 12 talleres + 8 CCO + 5 estaciones",
        "calculo_detallado": "48 pasos a nivel × 1 cámara + 12 talleres × 1 + 8 áreas CCO + 5 estaciones ENCE = 73 total",
        "desglose": [
          "Pasos a nivel (PAN): 48 cámaras (1 por cada PAN crítico)",
          "Talleres mantenimiento: 12 cámaras (entrada/salida)",
          "Centro Control Operacional: 8 cámaras (perímetro + interior)",
          "Estaciones ENCE: 5 cámaras (seguridad enclavamientos)"
        ],
        "fuente_normativa": "Norma CCTV IP - Resolución mínima 1080p",
        "fuente_diseno": "Plan de Seguridad Integral",
        "documentos_referencia": [
          "VII/Plan_Seguridad_Integral.md (Sección 4.1)",
          "V.3_Sistemas_Comunicacion_Detalle.md (Tabla 6.2)"
        ],
        "restriccion": "Mínimo 1 cámara por punto crítico",
        "alternativas": [
          "73 cámaras → Cobertura básica (1 por punto)",
          "120 cámaras → Cobertura media (redundancia en críticos)",
          "180 cámaras → Cobertura completa (múltiples ángulos)"
        ]
      },
      "riesgos_asociados": []
    },
    "1.1.102": {
      "item": "1.1.102",
      "nombre": "Workstations operadores CTC",
      "criterio_tecnico": {
        "justificacion": "8 estaciones para operación 24/7 con redundancia",
        "calculo_detallado": "3 turnos × 2 operadores por turno = 6 estaciones + 2 redundancia/capacitación = 8 total",
        "desglose": [
          "Estaciones turno diurno: 2 workstations",
          "Estaciones turno nocturno: 2 workstations",
          "Estaciones turno rotativo: 2 workstations",
          "Estaciones backup/capacitación: 2 workstations"
        ],
        "fuente_normativa": "Estándar operación ferroviaria 24/7",
        "fuente_diseno": "Plan de Operaciones CCO",
        "documentos_referencia": [
          "VI/Plan_Operaciones_CCO.md (Sección 2.3)",
          "V.3_Sistemas_Comunicacion_Detalle.md (Tabla 2.1)"
        ],
        "restriccion": "Mínimo 6 para cubrir 3 turnos, recomendado 8 con redundancia",
        "alternativas": [
          "6 workstations → Mínimo operativo (sin redundancia)",
          "8 workstations → Recomendado (con redundancia)",
          "10 workstations → Óptimo (redundancia completa)"
        ]
      },
      "riesgos_asociados": []
    },
    "6.1.100": {
      "item": "6.1.100",
      "nombre": "Sistemas ATP embarcados",
      "criterio_tecnico": {
        "justificacion": "8 sistemas ATP embarcados completos (kit) para seguridad automática del tren - USD $165K c/u @ TRM 4,400",
        "calculo_detallado": "8 trenes × 1 kit ATP por tren = 8 unidades",
        "desglose": ["Kit ATP incluye: Computadora, Display, Sensores velocidad, GPS, Software, Interfaces frenos, Redundancia", "Configuración embarcada en cabina", "Comunicación CCO vía TETRA/GSM-R", "Control velocidad según curva perfil vía"],
        "fuente_normativa": "IEC 62290-1 (ATP), EN 50126 (RAMS)",
        "fuente_diseno": "Sistema seguridad tren - Requerimiento contractual",
        "documentos_referencia": ["II. Apendices Tecnicos/Decisiones_Tecnicas/DT-CTC-472-2025-10-25.md", "V.3.1_Material_Rodante_Detallado.md"],
        "restriccion": "Mínimo 8 unidades (1 por tren según alcance)",
        "alternativas": ["8 unidades → Configuración estándar flota completa", "Mantenimiento según AT2"]
      }
    },
    "6.1.101": {
      "item": "6.1.101",
      "nombre": "Radios TETRA embarcados",
      "criterio_tecnico": {
        "justificacion": "16 radios TETRA para comunicación tren-tierra (2 por tren con redundancia)",
        "calculo_detallado": "8 trenes × 2 radios = 16 unidades",
        "desglose": ["2 radios por tren (primaria + respaldo)", "Comunicación CCO durante operación", "Integración ATP", "Alcance 12-16 km"],
        "fuente_normativa": "ETSI EN 300 396 (TETRA)",
        "fuente_diseno": "Plan comunicaciones tren-tierra",
        "documentos_referencia": ["V.3_Sistemas_Comunicacion_Detalle.md §3.2", "27_Sistema_TETRA_Integrado_v5.0.md"]
      }
    },
    "6.1.102": {
      "item": "6.1.102",
      "nombre": "Radios GSM-R embarcados",
      "criterio_tecnico": {
        "justificacion": "16 radios GSM-R para comunicación tren-tierra (2 por tren con redundancia)",
        "calculo_detallado": "8 trenes × 2 radios = 16 unidades",
        "desglose": ["2 radios por tren (primaria + respaldo)", "Comunicación CTC/CCO", "Backup si TETRA falla", "Interoperabilidad red ferroviaria"],
        "fuente_normativa": "IEC 62280 (GSM-R), EIRENE",
        "fuente_diseno": "Plan comunicaciones GSM-R",
        "documentos_referencia": ["V.3_Sistemas_Comunicacion_Detalle.md §3.3"]
      }
    },
    "6.1.103": {
      "item": "6.1.103",
      "nombre": "Sistemas GPS",
      "criterio_tecnico": {
        "justificacion": "8 sistemas GPS para localización y posicionamiento del tren",
        "calculo_detallado": "8 trenes × 1 sistema = 8 unidades",
        "desglose": ["Posicionamiento tiempo real (±5m)", "Integración ATP embarcado", "Registro recorrido", "Antena GPS techo tren"],
        "fuente_normativa": "IEC 62290-1",
        "fuente_diseno": "Sistema posicionamiento ATP",
        "documentos_referencia": ["V.3.1_Material_Rodante_Detallado.md §5.2"]
      }
    },
    "6.1.104": {
      "item": "6.1.104",
      "nombre": "Sistemas redundancia",
      "criterio_tecnico": {
        "justificacion": "8 sistemas redundancia ATP para alta disponibilidad 99.95%",
        "calculo_detallado": "8 trenes × 1 sistema = 8 unidades",
        "desglose": ["Redundancia N+1 ATP", "Failover <2s", "Duplicación procesador", "Sincronización tiempo real"],
        "fuente_normativa": "EN 50126 (RAMS), IEC 62290-1",
        "fuente_diseno": "Requirement disponibilidad 99.95%",
        "documentos_referencia": ["AT2 - Operación y Mantenimiento", "V.3.1_Material_Rodante_Detallado.md"]
      }
    },
    "6.1.105": {
      "item": "6.1.105",
      "nombre": "Instalación y configuración",
      "criterio_tecnico": {
        "justificacion": "Instalación y configuración ATP embarcados en 8 trenes",
        "calculo_detallado": "8 trenes × 1 servicio = 8 unidades",
        "desglose": ["Montaje kit ATP cabina", "Configuración y calibración", "Pruebas funcionales", "Capacitación operadores", "Documentación as-built"],
        "fuente_normativa": "AT2 - Operación",
        "fuente_diseno": "Plan instalación ATP",
        "documentos_referencia": ["V.3.1_Material_Rodante_Detallado.md §6.1"]
      }
    },
    "6.1.106": {
      "item": "6.1.106",
      "nombre": "Repuestos (10%)",
      "criterio_tecnico": {
        "justificacion": "Repuestos ATP embarcados 10% subtotal = $887,240,000 COP",
        "calculo_detallado": "10% de $8,872,400,000 = $887,240,000",
        "desglose": ["Repuestos componentes críticos", "Software adicional", "Spare parts mantenimiento", "Contrato servicio técnico 1 año"],
        "fuente_normativa": "AT2 - Operación",
        "fuente_diseno": "Plan repuestos ATP",
        "documentos_referencia": ["AT2 §4.2"]
      }
    },
    "6.2.100": {
      "item": "6.2.100",
      "nombre": "Dispositivos EOT completos",
      "criterio_tecnico": {
        "justificacion": "15 dispositivos EOT para señalización extremo tren",
        "calculo_detallado": "15 vagones cola × 1 EOT = 15 unidades",
        "desglose": ["Señalización LED extremo", "Transmisor presión aire", "GPS integrado", "Comunicación TETRA/GSM-R"],
        "fuente_normativa": "UIC 569 (EOT)",
        "fuente_diseno": "Sistema seguridad trenes carga",
        "documentos_referencia": ["V.3.1_Material_Rodante_Detallado.md §5.3"]
      }
    }
  },
  "nota_uso": "Estos criterios deben mostrarse en la WBS Interactiva para cada ítem. Si un ítem no tiene criterio definido aquí, mostrar mensaje indicando que el criterio técnico debe ser documentado."
}

;

console.log('âœ… Criterios tÃ©cnicos cargados:', Object.keys(criteriosTecnicosBase.criterios).length, 'Ã­tems');
