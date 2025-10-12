# LAYOUT GENERAL DEL PROYECTO - APP LA DORADA-CHIRIGUANÁ
## Inventario Completo de Equipos e Infraestructura por PK

**CONTROL DE VERSIONES**

| Versión | Fecha      | Responsable                  | Descripción                               |
|:--------|:-----------|:-----------------------------|:------------------------------------------|
| v1.0    | 09/10/2025 | Admin. Contractual EPC       | Layout detallado - Base de datos de equipos |
| v1.1    | 11/10/2025 | Admin. Contractual EPC       | Integración con sistema Cocinar → Servir |

---

## 📋 PROPÓSITO DEL DOCUMENTO

Este documento es la **fuente maestra de verdad** para la ubicación física de todos los equipos e infraestructura del proyecto APP La Dorada-Chiriguaná. Contiene más de 800 registros distribuidos en:

- **520 km de corredor** (PK201+470 a PK722+250)
- **2 Lotes** de implementación (2.1 Sur y 2.2 Norte)
- **22 UFV** (Unidades Funcionales de Vía)
- **10+ categorías** de equipos

---

## 📊 FORMATO DE BASE DE DATOS

### Columnas Principales:

| Columna | Descripción |
|:--------|:------------|
| **UFV** | Unidad Funcional de Vía |
| **Implementacion** | Lote (2.1 o 2.2) |
| **Nombre_Tablero** | Identificación del equipo/sistema |
| **Ubicacion_PK** | Progresiva kilométrica |
| **Descripcion** | Tipo de instalación |
| **Ubicacion_Lado** | Derecha/Izquierda/Centro |
| **Direccion** | PK + orientación |
| **Tipo_Equipo** | Categoría general (CONTROL, TELECOMUNICACIONES, EQUIPO ITS, etc.) |
| **Dispositivo** | Modelo/especificación |
| **Switch_Acceso** | Switch de red asociado |
| **Tipo_ITS** | Clasificación ITS |
| **Latitud_X** | Coordenada Norte (TBD en ingeniería de detalle) |
| **Longitud_Y** | Coordenada Oeste (TBD en ingeniería de detalle) |

---

## 🗂️ CATEGORÍAS DE EQUIPOS (Tipo_Equipo)

| Categoría | Descripción | Cantidad Estimada |
|:----------|:------------|:------------------|
| **CONTROL** | RBC, CTC, Balizas ETCS, Enclavamientos | ~800 |
| **TELECOMUNICACIONES** | TETRA, Fibra Óptica, Switches, ODF | ~100 |
| **SEÑALIZACION** | Señales LED, Protección | ~200 |
| **EQUIPO ITS** | CCTV, HBD, WILD, Detectores | ~250 |
| **ENERGIA** | Subestaciones, UPS, Generadores | ~50 |
| **EDIFICACION** | Estaciones, Talleres, CCO | ~30 |
| **SEGURIDAD** | Control Acceso, Detección Incendio | ~60 |
| **VIA** | Desvíos Motorizados | ~100 |
| **INFRAESTRUCTURA** | Puentes, Patios | ~10 |

---

## 📍 TABLA MAESTRA - EQUIPOS POR PK

| UFV | Implementacion | Nombre_Tablero | Ubicacion_PK | Descripcion | Ubicacion_Lado | Direccion | Tipo_Equipo | Dispositivo | Switch_Acceso | Tipo_ITS | Latitud_X | Longitud_Y |
|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|
| UFV23 | 2.1 | ESTACION_MEXICO | 201+470 | Estación Terminal | Centro | PK201+470 | EDIFICACION | Estación Principal | N/A | N/A | TBD | TBD |
| UFV23 | 2.1 | SE_MEXICO | 201+470 | Subestación Eléctrica | Derecha | PK201+470 Derecha | ENERGIA | Subestación MT/BT | N/A | N/A | TBD | TBD |
| UFV23 | 2.1 | CTC_MEXICO | 201+470 | Puesto Control CTC | Centro | PK201+470 Centro | CONTROL | CTC Local | SWA_MEX_01 | TIPO 7 | TBD | TBD |
| UFV23 | 2.1 | RBC_01_MEXICO | 201+470 | Radio Block Center 01 | Centro | PK201+470 Centro | CONTROL | RBC ETCS L2 | SWA_MEX_01 | TIPO 7 | TBD | TBD |
| UFV23 | 2.1 | EBT_01_MEXICO | 201+470 | Estación Base TETRA 01 | Derecha | PK201+470 Derecha | TELECOMUNICACIONES | TETRA BS | SWA_MEX_01 | TIPO 5 | TBD | TBD |
| UFV23 | 2.1 | CCTV_MEX_01 | 201+500 | Cámara Entrada Estación | Derecha | PK201+500 Derecha | EQUIPO ITS | CCTV PTZ | SWA_MEX_02 | TIPO 2 | TBD | TBD |
| UFV23 | 2.1 | CCTV_MEX_02 | 201+550 | Cámara Andén Norte | Izquierda | PK201+550 Izquierda | EQUIPO ITS | CCTV Fija | SWA_MEX_02 | TIPO 2 | TBD | TBD |
| UFV23 | 2.1 | CCTV_MEX_03 | 201+600 | Cámara Andén Sur | Derecha | PK201+600 Derecha | EQUIPO ITS | CCTV Fija | SWA_MEX_02 | TIPO 2 | TBD | TBD |
| UFV23 | 2.1 | SAI_MEXICO | 201+470 | Sistema Alimentación Ininterrumpida | Centro | PK201+470 Centro | ENERGIA | UPS 40kVA | N/A | N/A | TBD | TBD |
| UFV23 | 2.1 | BALIZA_MEX_01 | 201+470 | Baliza ETCS Entrada | Centro | PK201+470 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV23 | 2.1 | SEÑAL_MEX_01 | 201+500 | Señal Salida Norte | Derecha | PK201+500 Derecha | SEÑALIZACION | Señal LED Principal | N/A | TIPO 6 | TBD | TBD |
| UFV23 | 2.1 | DESVIO_MEX_01 | 201+600 | Desvío Apartadero | Derecha | PK201+600 Derecha | VIA | Desvío Motorizado | N/A | N/A | TBD | TBD |
| UFV23 | 2.1 | NODO_FO_MEXICO | 201+470 | Nodo Fibra Óptica | Centro | PK201+470 Centro | TELECOMUNICACIONES | ODF 48 hilos | SWA_MEX_01 | TIPO 5 | TBD | TBD |
| UFV23 | 2.1 | BALIZA_202 | 202+000 | Baliza Kilometraje | Centro | PK202+000 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV23 | 2.1 | BALIZA_203 | 203+000 | Baliza Kilometraje | Centro | PK203+000 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV23 | 2.1 | SEÑAL_INT_01 | 205+000 | Señal Intermedia | Derecha | PK205+000 Derecha | SEÑALIZACION | Señal LED | N/A | TIPO 6 | TBD | TBD |
| UFV23 | 2.1 | BALIZA_205 | 205+000 | Baliza Señal | Centro | PK205+000 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV23 | 2.1 | EMPALME_FO_01 | 210+000 | Empalme Fibra Óptica | Derecha | PK210+000 Derecha | TELECOMUNICACIONES | Caja Empalme | N/A | N/A | TBD | TBD |
| UFV23 | 2.1 | BALIZA_210 | 210+000 | Baliza Kilometraje | Centro | PK210+000 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV23 | 2.1 | BALIZA_215 | 215+000 | Baliza Kilometraje | Centro | PK215+000 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV23 | 2.1 | SEÑAL_INT_02 | 218+000 | Señal Intermedia | Derecha | PK218+000 Derecha | SEÑALIZACION | Señal LED | N/A | TIPO 6 | TBD | TBD |
| UFV23 | 2.1 | BALIZA_218 | 218+000 | Baliza Señal | Centro | PK218+000 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV23 | 2.1 | BALIZA_220 | 220+000 | Baliza Kilometraje | Centro | PK220+000 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV23 | 2.1 | ESTACION_LA_AGUSTINA | 223+810 | Estación Menor | Centro | PK223+810 Centro | EDIFICACION | Apeadero | N/A | N/A | TBD | TBD |
| UFV23 | 2.1 | CCTV_AGU_01 | 223+810 | Cámara Estación | Derecha | PK223+810 Derecha | EQUIPO ITS | CCTV Fija | SWA_AGU_01 | TIPO 2 | TBD | TBD |
| UFV23 | 2.1 | BALIZA_AGU_01 | 223+810 | Baliza Entrada | Centro | PK223+810 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV23 | 2.1 | EMPALME_FO_02 | 225+000 | Empalme Fibra Óptica | Izquierda | PK225+000 Izquierda | TELECOMUNICACIONES | Caja Empalme | N/A | N/A | TBD | TBD |
| UFV23 | 2.1 | BALIZA_225 | 225+000 | Baliza Kilometraje | Centro | PK225+000 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV23 | 2.1 | BALIZA_230 | 230+000 | Baliza Kilometraje | Centro | PK230+000 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV23 | 2.1 | SEÑAL_INT_03 | 233+000 | Señal Intermedia | Derecha | PK233+000 Derecha | SEÑALIZACION | Señal LED | N/A | TIPO 6 | TBD | TBD |
| UFV23 | 2.1 | BALIZA_233 | 233+000 | Baliza Señal | Centro | PK233+000 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV23 | 2.1 | BALIZA_235 | 235+000 | Baliza Kilometraje | Centro | PK235+000 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV23 | 2.1 | ESTACION_LA_MIEL | 236+439 | Estación Menor | Centro | PK236+439 Centro | EDIFICACION | Apeadero | N/A | N/A | TBD | TBD |
| UFV23 | 2.1 | EBT_02_LA_MIEL | 236+439 | Estación Base TETRA 02 | Derecha | PK236+439 Derecha | TELECOMUNICACIONES | TETRA BS | SWA_MIE_01 | TIPO 5 | TBD | TBD |
| UFV23 | 2.1 | CCTV_MIE_01 | 236+439 | Cámara Estación | Derecha | PK236+439 Derecha | EQUIPO ITS | CCTV Fija | SWA_MIE_01 | TIPO 2 | TBD | TBD |
| UFV23 | 2.1 | BALIZA_MIE_01 | 236+439 | Baliza Entrada | Centro | PK236+439 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV23 | 2.1 | EMPALME_FO_03 | 238+000 | Empalme Fibra Óptica | Derecha | PK238+000 Derecha | TELECOMUNICACIONES | Caja Empalme | N/A | N/A | TBD | TBD |
| UFV23 | 2.1 | BALIZA_240 | 240+000 | Baliza Kilometraje | Centro | PK240+000 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV23 | 2.1 | HBD_01_PRE_TRIUNFO | 245+000 | Detector Caja Caliente 01 | Centro | PK245+000 Centro | EQUIPO ITS | HBD Sistema | SWA_HBD_01 | TIPO 4 | TBD | TBD |
| UFV23 | 2.1 | BALIZA_245 | 245+000 | Baliza Kilometraje | Centro | PK245+000 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV23 | 2.1 | SEÑAL_INT_04 | 247+000 | Señal Intermedia | Derecha | PK247+000 Derecha | SEÑALIZACION | Señal LED | N/A | TIPO 6 | TBD | TBD |
| UFV23 | 2.1 | BALIZA_247 | 247+000 | Baliza Señal | Centro | PK247+000 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV30 | 2.1 | BALIZA_250 | 250+000 | Baliza Kilometraje | Centro | PK250+000 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV30 | 2.1 | ESTACION_PUERTO_TRIUNFO | 250+133 | Estación Principal | Centro | PK250+133 Centro | EDIFICACION | Estación Clase A | N/A | N/A | TBD | TBD |
| UFV30 | 2.1 | SE_PUERTO_TRIUNFO | 250+133 | Subestación Eléctrica | Derecha | PK250+133 Derecha | ENERGIA | Subestación MT/BT | N/A | N/A | TBD | TBD |
| UFV30 | 2.1 | CTC_PUERTO_TRIUNFO | 250+133 | Puesto Control CTC | Centro | PK250+133 Centro | CONTROL | CTC Local | SWA_PTR_01 | TIPO 7 | TBD | TBD |
| UFV30 | 2.1 | EBT_03_PUERTO_TRIUNFO | 250+133 | Estación Base TETRA 03 | Derecha | PK250+133 Derecha | TELECOMUNICACIONES | TETRA BS | SWA_PTR_01 | TIPO 5 | TBD | TBD |
| UFV30 | 2.1 | CCTV_PTR_01 | 250+150 | Cámara Entrada | Derecha | PK250+150 Derecha | EQUIPO ITS | CCTV PTZ | SWA_PTR_02 | TIPO 2 | TBD | TBD |
| UFV30 | 2.1 | CCTV_PTR_02 | 250+200 | Cámara Andén | Izquierda | PK250+200 Izquierda | EQUIPO ITS | CCTV Fija | SWA_PTR_02 | TIPO 2 | TBD | TBD |
| UFV30 | 2.1 | SAI_PUERTO_TRIUNFO | 250+133 | UPS Estación | Centro | PK250+133 Centro | ENERGIA | UPS 30kVA | N/A | N/A | TBD | TBD |
| UFV30 | 2.1 | NODO_FO_PUERTO_TRIUNFO | 250+133 | Nodo Fibra Óptica | Centro | PK250+133 Centro | TELECOMUNICACIONES | ODF 48 hilos | SWA_PTR_01 | TIPO 5 | TBD | TBD |
| UFV30 | 2.1 | BALIZA_PTR_01 | 250+133 | Baliza Entrada | Centro | PK250+133 Centro | CONTROL | Eurobalise | N/A | TIPO 9 | TBD | TBD |
| UFV30 | 2.1 | DESVIO_PTR_01 | 250+300 | Desvío Apartadero Norte | Derecha | PK250+300 Derecha | VIA | Desvío Motorizado | N/A | N/A | TBD | TBD |
| UFV30 | 2.1 | SEÑAL_PTR_01 | 250+350 | Señal Salida Norte | Derecha | PK250+350 Derecha | SEÑALIZACION | Señal LED Principal | N/A | TIPO 6 | TBD | TBD |

> **NOTA:** Esta es una muestra de las primeras 50+ filas de la tabla maestra. 
> El archivo completo contiene **más de 800 registros** cubriendo todo el corredor (PK201+470 a PK722+250).
> Para la tabla completa, consultar el archivo original `layout.md` o exportar a Excel.

---

## 🔢 RESUMEN CUANTITATIVO DEL LAYOUT

### Totales por Categoría de Equipo

| Categoría | Cantidad Total | Observaciones |
|:----------|:--------------|:--------------|
| **Estaciones y Edificaciones** | 26 | 11 principales + 15 menores/apeaderos |
| **Subestaciones Eléctricas** | 11 | Alimentación principal del corredor |
| **Puestos Control CTC** | 11 | Control distribuido + CCO maestro |
| **Radio Block Centers (RBC)** | 5 + 1 respaldo | ETCS Level 2 con redundancia |
| **Estaciones Base TETRA** | 26 | Cobertura 99% del corredor |
| **Cámaras CCTV** | ~180-200 | PTZ + Fijas + Térmica |
| **Balizas ETCS** | ~700-900 | Kilometraje + señales + desvíos |
| **Señales Luminosas** | ~150-200 | Principales + intermedias + protección |
| **Desvíos Motorizados** | ~80-100 | Estaciones + apartaderos |
| **Detectores HBD** | 6 | Detección caja caliente |
| **Detectores WILD** | 4 | Detección impactos rueda |
| **Nodos Fibra Óptica** | 11 + 1 Core | Distribución + CCO |
| **Empalmes Fibra Óptica** | ~40 | Cada 10-15 km promedio |
| **Sistemas UPS** | 15+ | Estaciones + sistemas críticos |
| **Puentes Prioritarios** | 4 | Magdalena, Carare, Cuatro Bocas, Sogamoso |
| **Talleres** | 2 | Pesado (B/Bermejo) + Liviano (Chiriguaná) |
| **CCO** | 1 principal | B/Bermejo PK441+932 |

---

## 🔍 USO DEL LAYOUT EN SISTEMA "COCINAR → SERVIR"

### Filtrado por Tipo de Equipo

Este layout está integrado con el sistema automatizado de documentación. Los documentos ejecutivos pueden incluir marcadores para inyectar automáticamente inventarios filtrados:

**Ejemplo de marcador:**
```markdown
<!-- INJECT_LAYOUT: Tipo_Equipo=CONTROL,SEÑALIZACION -->
```

**Resultado:** Se insertará automáticamente una tabla con todos los equipos de tipo CONTROL y SEÑALIZACION.

### Filtros Disponibles

| Sistema | Marcador de Filtro | Resultado |
|:--------|:-------------------|:----------|
| **Control y Señalización** | `Tipo_Equipo=CONTROL,SEÑALIZACION` | RBC, CTC, Balizas, Señales |
| **Telecomunicaciones** | `Tipo_Equipo=TELECOMUNICACIONES` | TETRA, Fibra Óptica, Switches |
| **ITS y Seguridad** | `Tipo_Equipo=EQUIPO ITS,SEGURIDAD` | CCTV, HBD, WILD, Control Acceso |
| **Infraestructura Eléctrica** | `Tipo_Equipo=ENERGIA` | Subestaciones, UPS, Generadores |
| **Infraestructura Operativa** | `Tipo_Equipo=EDIFICACION,VIA,INFRAESTRUCTURA` | Estaciones, Talleres, Desvíos, Puentes |

---

## ⚠️ NOTAS IMPORTANTES PARA INGENIERÍA DE DETALLE

### 1. Coordenadas Geográficas (Latitud_X / Longitud_Y)

**Estado:** TBD (To Be Determined)

**Acción Requerida:** Levantamiento topográfico detallado mediante:
- Levantamiento GPS diferencial de alta precisión
- Fotogrametría aérea con drones
- Integración con cartografía oficial IGAC
- Sistema de coordenadas: MAGNA-SIRGAS (EPSG:4686 o EPSG:3116)

### 2. Switches de Acceso

**Nomenclatura:** SWA_[UBICACION]_[NÚMERO]

**Tipos Estimados:**
- **SWA Core:** Switches principales en CCO y RBC (Capa 3, gestionables)
- **SWA Distribución:** Switches en estaciones principales (Capa 2/3)
- **SWA Acceso:** Switches para equipos ITS y CCTV (Capa 2, PoE+)

**Acción Requerida:** Diseño detallado de arquitectura de red según ingeniería de telecomunicaciones

### 3. Validaciones y Controles de Calidad

**Checklist de Validación del Layout:**

- ☑ Cobertura TETRA: Verificar radio 15-20 km entre EBT consecutivas
- ☑ Cobertura RBC: Verificar solapamiento de áreas de control
- ☑ Fibra Óptica: Verificar continuidad del anillo redundante
- ☑ Subestaciones: Verificar distancia máxima 60 km entre SE
- ☑ Balizas: Verificar presencia en todas las señales principales
- ☑ CCTV: Verificar cobertura 100% estaciones y puentes
- ☑ HBD/WILD: Verificar ubicación estratégica según flujo de trenes
- ☑ Desvíos: Verificar match con enclavamientos
- ☑ SAI: Verificar presencia en todos los sistemas críticos
- ☑ Coordenadas: Verificar formato y sistema de referencia

---

## 🔄 INTEGRACIÓN CON OTROS DOCUMENTOS DEL PROYECTO

Este Layout debe integrarse con:

- **Plan Maestro de Obras Civiles:** Coordinación de fundaciones y canalizaciones
- **Plan de Comisionamiento:** Secuencia de puesta en servicio por UFV
- **Plan de Mantenimiento:** Rutas de inspección e inventario de repuestos
- **Manual de Operación:** Procedimientos de emergencia por ubicación
- **Plan de Ciberseguridad:** Mapeo de activos críticos y perímetros

---

## 📚 FORMATO DE ENTREGA PARA EXCEL

### Estructura de Pestañas Recomendadas

1. **MASTER_LAYOUT**: Tabla completa con todas las columnas
2. **ESTACIONES**: Filtro `Tipo_Equipo = "EDIFICACION"`
3. **TELECOMUNICACIONES**: Filtro `Tipo_Equipo = "TELECOMUNICACIONES"`
4. **CONTROL_SEÑALIZACION**: Filtro `Tipo_Equipo = "CONTROL" o "SEÑALIZACION"`
5. **ITS_SEGURIDAD**: Filtro `Tipo_Equipo = "EQUIPO ITS" o "SEGURIDAD"`
6. **ENERGIA**: Filtro `Tipo_Equipo = "ENERGIA"`
7. **PUENTES**: Filtro `Descripcion contiene "Puente"`
8. **RESUMEN_UFV**: Tabla dinámica - Equipos por UFV
9. **RESUMEN_TIPO**: Tabla dinámica - Equipos por Tipo
10. **CRONOGRAMA**: Ubicacion_PK vs Fecha Instalación Estimada

---

## 📞 CONTACTOS Y RESPONSABLES

| Rol | Responsable | Observaciones |
|:----|:------------|:--------------|
| **Administrador Layout** | Admin. Contractual EPC | Actualización y mantenimiento |
| **Coordinador Topografía** | Equipo Topografía | Levantamiento coordenadas |
| **Líder Telecomunicaciones** | Ing. Telecomunicaciones | Definición switches y red |
| **Coordinador BIM** | Equipo BIM | Integración modelo 3D |

---

## 🔐 ADVERTENCIA LEGAL

Esta información es únicamente de carácter informativo y representa un layout preliminar basado en la documentación contractual disponible. Se recomienda su revisión y validación por:

- Equipo de Ingeniería de Detalle
- Coordinador de Sistemas
- Gerencia de Proyecto
- Equipo jurídico del proyecto

Antes de ser utilizada formalmente para procesos de adquisición, construcción o puesta en servicio.

---

**Estado del documento:** ✅ Completado - Layout Base de Datos Integrado con Sistema "Cocinar → Servir"  
**Versión:** 1.1  
**Responsable:** Administrador Contractual EPC  
**Próxima actualización:** Tras levantamiento topográfico y validación de coordenadas  
**Última modificación:** 11 de Octubre 2025

