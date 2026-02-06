# SEÑALIZACIÓN FERROVIARIA - CONTRATO 8.1
## APP La Dorada - Chiriguaná

**Fecha de actualización:** 19 de septiembre de 2025  
**Proyecto:** APP La Dorada - Chiriguaná  
**Contrato:** Concesión No. 001 de 2025  
**Documento:** 1 - Señalización Ferroviaria  

---

## INFORMACIÓN DEL DOCUMENTO

| Campo | Valor |
|-------|-------|
| **Fecha de actualización** | 19 de septiembre de 2025 |
| **Proyecto** | APP La Dorada - Chiriguaná |
| **Contrato** | Concesión No. 001 de 2025 |
| **Responsable** | Administrador Contractual EPC |
| **Tipo** | Documento de Ingeniería de Detalle |
| **Categoría** | Señalización Ferroviaria |
| **Número** | 1 |
| **Estado** | ✅ Contenido completo |

---

## DESCRIPCIÓN DEL DOCUMENTO

**Señalización Ferroviaria - Contrato 8.1**

Este documento contiene las especificaciones técnicas detalladas para el sistema de señalización ferroviaria del proyecto APP La Dorada - Chiriguaná, conforme a las obligaciones contractuales establecidas.

---

## CONTROL DE VERSIONES

| Versión | Fecha | Responsable | Descripción |
|:---:|:---:|:---|:---|
| **v1.0** | Sep-2025 | Ing. Contractual | Versión inicial |
| **v2.0** | Sep-2025 | Ing. Contractual | Revisión técnica y ampliación de alcance |
| **v3.0** | Ene-2025 | Ing. Contractual | Formato mejorado y estructura optimizada |
| **v4.0** | Ene-2025 | Ing. Contractual | Metodología Punto 42 aplicada - COMPLETADO |
| **v4.1** | Sep-2025 | Ing. Contractual | Actualización fechas y riesgos PMI - COMPLETADO |

---

## CONTENIDO TÉCNICO

### 8.1 Señalización Ferroviaria - ESPECIFICACIONES TECNICAS DETALLADAS

**Basado en analisis del documento conceptual 29_Sistema_Senalizacion_Integrado:**

#### **SISTEMA DE ENCLAVAMIENTOS ELECTRONICOS (CBI)**
- **5 Enclavamientos Electronicos:** Zapatosa, Garcia Cadena, Barrancabermeja, Puerto Berrio-Grecia, La Dorada-Mexico
- **Arquitectura Modular:** Diseno modular que permite desarrollo independiente de la logica de control
- **Interfaces SCI-CC-A:** Comunicacion con CTC segun norma NAS 830
- **Deteccion de Trenes:** Contadores de ejes (norma ADIF ED3M1) en lugar de circuitos de via tradicionales

#### **SISTEMA DE PASOS A NIVEL (146 PN)**
- **9 PN Tipo C:** Barreras automaticas en zonas de mayor trafico vehicular
- **15 PN Tipo B:** Senales luminosas/acusticas con sistemas de proteccion
- **122 PN Tipo A:** Senalizacion fija coordinada con campanas de cultura vial (AT8)

#### **TECNOLOGIA DE SENALIZACION**
- **Senalizacion LED:** Tecnologia LED (ET 03.365.501.0) para alta eficiencia energetica
- **Alimentacion Redundante:** UPS y sistemas de respaldo para operacion continua
- **Integracion ITCS:** Preparacion de interfaces para futura integracion con control positivo de trenes

#### **SISTEMA DE ENERGÍA DEDICADO**
- **UPS para Enclavamientos:** Sistema UPS Online (Doble Conversión) de 5kVA mínimo, con autonomía de 8 horas para cargas críticas (CBI, contadores de ejes).
- **Tableros de Distribución:** Tableros AC y DC con protecciones termomagnéticas individuales por circuito.
- **Sistema de Puesta a Tierra:** Malla de tierra dedicada para equipos de señalización, con resistencia < 5 Ohms.
- **Insumos:**
    - **Cableado de Potencia:** Cableado de cobre de sección adecuada, con aislamiento THHN/THWN.
    - **Bancos de Baterías:** Baterías selladas VRLA, libres de mantenimiento, con vida útil de diseño > 5 años.
    - **Conectores y Terminales:** Terminales de compresión y conectores de alta calidad para asegurar conexiones fiables.

#### **INTEGRACIÓN Y ESTÁNDARES**
- **🚂 ITCS ETCS Level 2:** Interfaces preparadas para sistemas de control embarcados hasta AT3
- **🔗 Interoperabilidad FENOCO:** Compatibilidad con sistemas FENOCO según protocolos UIC
- **📊 Disponibilidad AT4:** Cumplimiento de disponibilidad 99.5% según indicadores contractuales

---

## RIESGOS IDENTIFICADOS PARA ANÁLISIS PMI

| ID | Categoría | Probabilidad | Impacto | Descripción | Estrategia de Mitigación |
|:---:|:---:|:---:|:---:|:---|:---|
| **R-085** | Técnico | Alta | Alto | Dependencia AT3 para especificaciones ITCS en señalización | Desarrollar interfaces de señalización basadas en ETCS Level 2 hasta disponibilidad de AT3 |
| **R-086** | Técnico | Media | Alto | Fallo en interoperabilidad FENOCO por interfaces incompatibles | Establecer protocolos de señalización compatibles con sistemas FENOCO existentes |
| **R-087** | Contractual | Media | Alto | Incumplimiento de disponibilidad 99.5% en señalización según AT4 | Implementar sistemas de monitoreo para garantizar cumplimiento de disponibilidad |
| **R-088** | Operacional | Alta | Medio | Complejidad en gestión de 146 pasos a nivel con ITCS | Desarrollar protocolos de prueba específicos para ITCS y FENOCO |
| **R-089** | Técnico | Media | Medio | Integración de señalización con sistemas FENOCO existentes | Establecer procedimientos de fallback para sistemas de señalización |

---

## 6. INTEGRACIÓN CON DOCUMENTOS RELACIONADOS

### 2.1 Documentos Base (Completados ✅)
- **AT1_AlcanceProyecto v3.0** ✅ - Alcance de señalización ferroviaria
- **AT2_OperacionMantenimiento v3.0** ✅ - Operación y mantenimiento de señalización
- **AT4_IndicadoresDesempeno v3.0** ✅ - Indicadores de señalización ferroviaria
- **`29_Sistema_Senalizacion_Integrado...md`** ✅ - Documento conceptual base.
