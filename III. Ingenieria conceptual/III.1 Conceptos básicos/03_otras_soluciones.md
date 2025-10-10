# 03_otras_soluciones
## Documento de Soporte - Ingenieria Conceptual

---

### INFORMACION DEL DOCUMENTO
- Fecha de conversion: 17/09/2025 16:14
- Proyecto: APP La Dorada - ChiriguanÃ¡
- Contrato: Concesion No. 001 de 2025
- Responsable: Administrador Contractual EPC
- Tipo: Documento de Soporte
- Categoria: Ingenieria Conceptual
- Numero: 39

---

### DESCRIPCION DEL DOCUMENTO

**03_otras_soluciones**

Este documento de soporte contiene informacion tecnica, especificaciones y procedimientos relacionados con Ingenieria Conceptual para el proyecto APP La Dorada - ChiriguanÃ¡.

---

### CONTENIDO TECNICO

SALIDAS TÉCNICAS NO-POLÍTICASCumplimiento Contractual ITCS sin AlstomSALIDA TÉCNICA 1: RETRO-FIT CON GATEWAY CERTIFICADO ⭐⭐⭐⭐⭐Concepto: Implementar ITCS mediante integración técnica, no compra directa¿Qué hacer?Comprar locomotoras U18C básicas (sin ITCS embarcado)Contratar integración técnica con empresa especializada en PTCInstalar gateway ITCS-compatible certificado por laboratorio independienteCertificar funcionalmente que cumple los requerimientos contractualesProveedores Especializados en Retrofit PTC:Wabtec Railway Electronics (especialistas en retrofit de locomotoras vintage)Progress Rail Services (Caterpillar - expertos en modernización U18)Railpower Technologies (especialistas en equipos embarcados aftermarket)ZTR Control Systems (integradores de sistemas ferroviarios)Componentes del Sistema:Locomotora U18C básica    ↓+ Gateway ITCS/I-ETMS (hardware + software)+ Radio TETRA (220MHz/900MHz según zona)+ GPS ferroviario de precisión+ Display de cabina ITCS-compatible+ Interface con sistema de frenado+ Logger de eventos (certificado SIL4)    ↓= Sistema funcionalmente equivalente a ITCS AlstomVentajas:Costo 40-60% menor que ITCS Alstom originalCumple obligación contractual ("equipamiento técnico embarcado necesario")Base técnica sólida (retrofit es práctica común en EE.UU.)Certificable por ONAC/CIDET como equivalente funcionalCronograma:Mes 1-2: Compra locomotoras básicas + contratos retrofitMes 3-8: Instalación y pruebas en tallerMes 9-12: Certificación funcional y pruebas con FENOCOSALIDA TÉCNICA 2: EQUIVALENCIA FUNCIONAL POR NORMA ⭐⭐⭐⭐Concepto: Demostrar que I-ETMS cumple normas que exige el contratoBase legal: AT3 exige normas AREMA, UIC, RETIE - NO específicamente "Alstom"¿Qué hacer?Análisis normativo detallado del AT3 vs. especificaciones I-ETMSCertificación por ONAC de cumplimiento normativo I-ETMSPrueba de interoperabilidad documentada con protocolo FENOCO existentePresentar equivalencia técnica basada en cumplimiento normativo, no en marcaMatriz de Cumplimiento Normativo:Norma ContractualEspecificación ITCS AlstomCumplimiento I-ETMS WabtecAREMA C&S Manual✅ Certificado FRA✅ Type Approved FRAUIC Leaflet 406⚠️ No aplicable (sistema US)✅ Compatible vía gatewayRETIE (Colombia)⚠️ Requiere homologación✅ Homologable por ONACGPS Ferroviario✅ Precisión < 2m✅ Precisión < 1mRadio TETRA✅ 220MHz/450MHz✅ 220MHz/450MHz/900MHzDocumentación técnica requerida:Certificado FRA de I-ETMS (Type Approval)Manual técnico comparativo ITCS vs I-ETMSProtocolo de interoperabilidad (caso Amtrak-Norfolk Southern)Dictamen ONAC sobre equivalencia funcionalVentajas:Argumento puramente técnico basado en normasDocumentación oficial (FRA, ONAC)Precedentes operativos (15 años funcionando en Michigan)SALIDA TÉCNICA 3: DESARROLLO PROPIO CON LICENCIAMIENTO ⭐⭐⭐Concepto: Desarrollar OBU propio bajo licencia de tecnología existente¿Qué hacer?Alianza tecnológica con universidad colombiana (Nal, Andes, Javeriana)Licenciamiento de IP de sistema PTC existente (Wabtec, Hitachi, Siemens)Desarrollo de OBU colombiano basado en estándares internacionalesCertificación SIL4 por laboratorio acreditadoSocios Técnicos Potenciales:Universidad Nacional - Facultad de IngenieríaUniversidad de los Andes - Departamento de Ingeniería EléctricaSENA - Centro de Tecnología FerroviariaCIDET - Centro de certificación tecnológicaArquitectura del Sistema Propio:Hardware Base: Computadora embarcada (COTS industrial)    ↓Software Core: Stack PTC licenciado (I-ETMS, ETCS, o ACSES)    ↓Interfaces: GPS + TETRA + CAN-Bus locomotora    ↓Certificación: SIL4 por CIDET/ONAC    ↓Resultado: OBU "colombiano" funcionalmente ITCSPresupuesto estimado:Licenciamiento tecnológico: $2-5 millones USDDesarrollo e integración: $3-8 millones USDCertificación SIL4: $1-2 millones USDTotal: $6-15 millones USD (vs. $50-100 millones cotización Alstom)Cronograma realista:Mes 1-6: Negociación de licencias + equipo técnicoMes 7-18: Desarrollo, integración y pruebasMes 19-24: Certificación y homologaciónMes 25-30: Implementación en locomotoras del proyectoVentajas:Soberanía tecnológica realCosto controlado y predecibleCapacidad nacional instaladaTransferencia tecnológica permanenteSALIDA TÉCNICA 4: INTEROPERABILIDAD POR GATEWAY ⭐⭐⭐⭐Concepto: Sistema híbrido que "habla" tanto ITCS como I-ETMS¿Qué hacer?Instalar I-ETMS Wabtec en material rodante propioDesarrollar gateway de traducción ITCS↔I-ETMSImplementar doble stack de protocolos en OBUCertificar interoperabilidad con pruebas reales con FENOCOArquitectura Técnica:Locomotora con OBU Híbrido:    ┌─────────────────────────────────────┐    │  I-ETMS Core (Wabtec)              │    │  ├── Protocolo nativo I-ETMS       │    │  ├── Interface ITCS via Gateway    │    │  ├── Radio TETRA (multi-frequency) │    │  └── GPS + CAN-Bus locomotive      │    └─────────────────────────────────────┘              ↓    ┌─────────────────────────────────────┐    │  Gateway de Interoperabilidad      │    │  ├── Traductor ITCS ←→ I-ETMS      │    │  ├── Buffer de mensajes            │    │  ├── Logger de eventos             │    │  └── Certificación SIL4            │    └─────────────────────────────────────┘Funcionamiento en Red Mixta:En dominio propio (La Dorada-Chiriguaná): Funciona como I-ETMS nativoEn dominio FENOCO: Gateway traduce a protocolos ITCSEn handover: Transición automática entre protocolosPrecedente técnico: Caso Amtrak-Norfolk Southern (funcionando desde 2008)Proveedores del Gateway:Wabtec (tienen experiencia en interoperabilidad)Bombardier/Alstom (ironicamente, pueden proveer gateway)Ansaldo STS (especialistas en integración)Empresa nacional (desarrollo propio con universidades)SALIDA TÉCNICA 5: CERTIFICACIÓN POR TERCEROS ⭐⭐⭐Concepto: Validar que cualquier sistema PTC cumple requerimientos contractuales¿Qué hacer?Contratar organismo certificador independiente (ONAC, CIDET, SGS, Bureau Veritas)Definir matriz de ensayos basada en obligaciones contractuales específicasProbar múltiples sistemas PTC contra esa matrizCertificar equivalencia funcional del que mejor puntúeMatriz de Ensayos Propuesta:Requerimiento ContractualEnsayoITCS AlstomI-ETMS WabtecETCS HitachiInterop. con FENOCOPrueba real✅⚠️ Requiere gateway⚠️ Requiere gatewayRadio TETRALab + campo✅✅✅GPS < 2m precisiónMedición✅✅ Mejor✅Normas AREMADocumental⚠️✅ FRA Type Approved⚠️SIL4 certificadoDocumental✅✅✅Costo totalComercial❌ Muy alto✅ Competitivo✅ CompetitivoVentajas:Proceso objetivo y técnicoDocumentación irrefutableRespaldo de organismo certificador independienteBase sólida para homologación por InterventoríaRECOMENDACIÓN TÉCNICA PRINCIPALCOMBINAR SALIDAS 1 + 4: Retrofit + Gateway¿Por qué esta combinación?Menor riesgo técnico: Retrofit es práctica probadaCumplimiento contractual claro: Sistema embarcado funcionalmente ITCSInteroperabilidad garantizada: Gateway probado en otros paísesCosto razonable: 40-60% menos que solución AlstomTimeline realista: 12-18 meses implementaciónPlan de Acción Inmediato:Semana 1-2:Contactar Wabtec Railway Electronics para cotización retrofitSolicitar especificaciones técnicas detalladas del gatewayContratar ONAC/CIDET para estudio de viabilidad de certificaciónMes 1:Comprar locomotoras U18C básicas (sin esperar decisión ITCS)Firmar contrato retrofit con proveedor seleccionadoIniciar proceso certificación con organismo independienteMes 2-6:Desarrollo e instalación del sistema retrofitPruebas de laboratorio y certificación SIL4Preparación documentación para homologaciónMes 7-12:Pruebas de campo con material rodanteValidación de interoperabilidad con FENOCOEntrega a Interventoría de sistema certificado y operativoDocumentación Técnica para Interventoría:Certificado de equivalencia funcional (ONAC/CIDET)Pruebas de interoperabilidad exitosas con FENOCOCumplimiento normativo (AREMA, UIC, RETIE)Garantía de funcionamiento por 10 añosPlan de mantenimiento y soporte técnico localEsta aproximación es puramente técnica, basada en ingeniería y certificación, sin necesidad de gestión política.Esta información es únicamente de carácter informativo. Se recomienda su revisión y validación por el equipo jurídico del proyecto antes de ser utilizada formalmente.

---

### OBJETIVOS DEL DOCUMENTO

| Objetivo | Descripcion |
|:---|:---|
| Definir | Especificaciones tecnicas para Ingenieria Conceptual |
| Establecer | Procedimientos y metodologias aplicables |
| Garantizar | Cumplimiento de estandares del proyecto |
| Facilitar | Implementacion y seguimiento |

### GESTION DE RIESGOS

| Riesgo | Probabilidad | Impacto | Mitigacion |
|:---|:---:|:---:|:---|
| Cambios en especificaciones | Media | Alto | Validacion continua con stakeholders |
| Retrasos en implementacion | Media | Medio | Seguimiento de cronograma detallado |
| Desviaciones tecnicas | Baja | Medio | Revisiones tecnicas periodicas |

### CRONOGRAMA DE IMPLEMENTACION

| Fase | Actividad | Duracion | Responsable |
|:---|:---|:---:|:---|
| Fase 1 | Revision y validacion | 1 semana | Equipo Tecnico |
| Fase 2 | Implementacion | 2-4 semanas | Contratista |
| Fase 3 | Pruebas y validacion | 1 semana | Supervision |

### RECURSOS REQUERIDOS

- Personal tecnico especializado
- Herramientas y equipos especificos
- Software de monitoreo y control
- Documentacion de referencia

### METRICAS DE SEGUIMIENTO

| Metrica | Objetivo | Frecuencia | Responsable |
|:---|:---:|:---:|:---|
| Cumplimiento tecnico | 100% | Semanal | Supervisor Tecnico |
| Cumplimiento de cronograma | 95% | Diaria | Jefe de Proyecto |
| Calidad de implementacion | Excelente | Quincenal | Auditoria Tecnica |

---

## ADVERTENCIA LEGAL

Esta informacion es unicamente de caracter informativo. Se recomienda su revision y validacion por el equipo juridico del proyecto antes de ser utilizada formalmente.

---

Estado del documento: Convertido - 17/09/2025  
Version: 1.0  
Responsable: Administrador Contractual EPC  
Proxima actualizacion: 17/10/2025
