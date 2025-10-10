# ESTIMACIÓN DE CANTIDADES TETRA - ANÁLISIS DE PROBLEMAS
## APP La Dorada - Chiriguaná

**Fecha de actualización:** 27 de enero de 2025  
**Proyecto:** APP La Dorada - Chiriguaná  
**Contrato:** Concesión No. 001 de 2025  
**Documento:** 27.1 - Estimación de Cantidades TETRA  

---

## INFORMACIÓN DEL DOCUMENTO

| Campo | Valor |
|-------|-------|
| **Fecha de actualización** | 27 de enero de 2025 |
| **Proyecto** | APP La Dorada - Chiriguaná |
| **Contrato** | Concesión No. 001 de 2025 |
| **Responsable** | Administrador Contractual EPC |
| **Tipo** | Documento de Soporte |
| **Categoría** | Ingeniería Conceptual |
| **Número** | 27.1 |
| **Estado** | ✅ Contenido completo |

---

## DESCRIPCIÓN DEL DOCUMENTO

**Estimación de Cantidades TETRA - Análisis de Problemas y Soluciones**

Este documento de soporte contiene las estimaciones de cantidades para el sistema TETRA, incluyendo análisis de problemas potenciales y soluciones técnicas para el proyecto APP La Dorada - Chiriguaná.

---

## CONTROL DE VERSIONES

| Versión | Fecha | Responsable | Descripción |
|:---:|:---:|:---|:---|
| **v1.0** | Sep-2025 | Ing. Contractual | Versión inicial |
| **v2.0** | Sep-2025 | Ing. Contractual | Revisión técnica y ampliación de alcance |
| **v3.0** | Ene-2025 | Ing. Contractual | Formato mejorado y estructura optimizada |

---

## ESTIMACIONES DE CANTIDADES - SISTEMAS CRÍTICOS

### 📊 Parámetros Base del Proyecto

**Proyecto:** APP La Dorada-Chiriguaná (540 km)

| Parámetro |
Valor
Fuente

Longitud total corredor
540 km
AT1 (53 UFVF)

Topología fibra
Doble anillo auto-sanante
AT3, Cap. 8.6

Cobertura TETRA
100% corredor + interoperabilidad FENOCO
AT3, Cap. 8.5

Regeneradores L3
Cada 40 km (asunción técnica)
Estándar fibra óptica

Alcance estaciones TETRA
15-25 km (según topografía)
Estándar TETRA ferroviario


1. Sistema TETRA - Estimaciones de Cantidades
1.1 Infraestructura de Torres y Estaciones Base
Estaciones Base TETRA
Cálculo: 540 km ÷ 20 km promedio = 27 estaciones base
Buffer seguridad: +15% = 31 estaciones base
Interoperabilidad FENOCO: +2 estaciones = 33 estaciones base
ESTIMACIÓN: 33 Estaciones Base TETRA
Torres de Comunicaciones
Altura promedio: 45-60 metros (según topografía)
- Zonas planas (60%): 35m de altura × 20 torres = 20 torres estándar
- Zonas montañosas (40%): 60m altura × 13 torres = 13 torres reforzadas
ESTIMACIÓN: 33 Torres (20 estándar + 13 reforzadas)
Casetas de Equipos (Bunkers)
Por cada estación base: 1 caseta de equipos
Dimensiones típicas: 6m × 4m × 3m altura
Especificación: Prefabricada, climatizada, segura
ESTIMACIÓN: 33 Casetas de Equipos
1.2 Equipos TETRA
Estaciones Base
- 33 Estaciones base TETRA (1 por torre)
- 5 Estaciones base redundantes (backup crítico)
- 2 Estaciones base CCO (principal + respaldo)
ESTIMACIÓN: 40 Equipos Estación Base TETRA
Equipos de Control Central
- 2 Servidores TETRA (principal + backup CCO)
- 1 Sistema de gestión de red centralizado
- 2 Consolas de despacho (CCO principal)
- 1 Consola de despacho (CCO respaldo)
Radios Móviles y Portátiles
- Radios embarcados locomotoras: 15 unidades (AT1)
- Radios portátiles mantenimiento: 50 unidades
- Radios vehículos de inspección: 20 unidades
- Radios fijos estaciones: 10 unidades
ESTIMACIÓN: 95 Equipos de Radio
1.3 Consumo Eléctrico TETRA
Por Estación Base
Potencia estación base: 500W
Climatización caseta: 3 kW
Iluminación/auxiliares: 500W
Total por sitio: 4 kW
Total Sistema TETRA
33 sitios × 4 kW = 132 kW
Factor diversidad: 0.8
Potencia instalada requerida: 165 kW
ESTIMACIÓN: 165 kW Total + UPS + Generadores

2. Sistema Fibra Óptica - Estimaciones de Cantidades
2.1 Topología de Red
Arquitectura Propuesta
- Anillo Principal: La Dorada → Chiriguaná (540 km)
- Anillo Secundario: Ruta alternativa (560 km, +3.7%)
- Total fibra backbone: 1,100 km
Ramales y Derivaciones
- Ramales a estaciones TETRA: 33 × 2 km promedio = 66 km
- Conexión talleres UF1: 5 km
- Conexión CTC La Dorada: 3 km
- Reserva técnica 10%: 117 km
TOTAL FIBRA: 1,291 km
2.2 Equipos de Red Óptica
Regeneradores/Amplificadores L3
Ubicación cada 40 km en anillo principal:
540 km ÷ 40 km = 14 regeneradores por anillo
Doble anillo: 14 × 2 = 28 regeneradores
Redundancia crítica: +4 equipos
ESTIMACIÓN: 32 Regeneradores Ópticos L3
Switches/Routers de Agregación
- CCO principal: 2 switches core (redundantes)
- Talleres UF1: 2 switches agregación
- Estaciones TETRA: 33 switches acceso
- CTC estaciones: 5 switches (Zapatosa, García Cadena, etc.)
ESTIMACIÓN: 42 Equipos de Conmutación
2.3 Infraestructura de Ductos
Canalización Principal
Doble ruta (anillo): 1,100 km
Ducto PEAD 110mm: 2 ductos × 1,100 km = 2,200 km
Ducto PEAD 160mm (zonas críticas): 200 km
Cámaras de Inspección
Zonas urbanas (15%): 1,100 km × 0.15 ÷ 0.5 km = 330 cámaras
Zonas rurales (85%): 1,100 km × 0.85 ÷ 1.0 km = 935 cámaras
ESTIMACIÓN: 1,265 Cámaras de Inspección
Cables de Fibra Óptica
Cable backbone 48 hilos: 1,100 km
Cable distribución 24 hilos: 200 km (ramales)
Buffer y reparaciones: 130 km
ESTIMACIÓN: 1,430 km Cable Fibra Óptica
2.4 Casetas de Regeneración (Bunkers L3)
Ubicación y Cantidad
32 regeneradores requieren casetas:
- 14 casetas anillo principal
- 14 casetas anillo secundario  
- 4 casetas redundancia crítica
Especificaciones Caseta
Dimensiones: 4m × 3m × 2.8m altura
Características:
- Climatización redundante N+1
- UPS 8 horas autonomía
- Generador backup
- Sistema contra incendio
- Control acceso biométrico
ESTIMACIÓN: 32 Casetas/Bunkers Regeneración
2.5 Consumo Eléctrico Fibra Óptica
Por Regenerador L3
Equipo regenerador: 300W
Climatización: 2 kW
Auxiliares: 200W
Total por caseta: 2.5 kW
Switches y Equipos CCO
CCO switches core: 2 × 1 kW = 2 kW
Switches agregación: 40 × 200W = 8 kW
Climatización CCO: 15 kW
Total Sistema Fibra
Regeneradores: 32 × 2.5 kW = 80 kW
CCO y switches: 25 kW
Total fibra óptica: 105 kW

3. Consolidado de Requerimientos Eléctricos
3.1 Potencia Total Instalada
Sistema
Potencia (kW)
UPS (horas)
Generador

TETRA
165
4 horas
Requerido

Fibra Óptica
105
8 horas
Requerido

CCO Integrado
50
12 horas
N+1

TOTAL
320 kW
Variable
Redundante

3.2 Sistemas de Respaldo
UPS por Tipo de Instalación
- Regeneradores L3: 32 × 4 kVA = 128 kVA UPS
- Estaciones TETRA: 33 × 6 kVA = 198 kVA UPS  
- CCO principal: 80 kVA UPS (N+1)
Generadores
- CCO: 1 generador 100 kVA (N+1)
- Sitios críticos: 10 generadores 25 kVA
- Generadores móviles: 5 × 15 kVA (emergencia)

4. Gestión Predial y Permisos
4.1 Predios Requeridos
Torres TETRA
33 torres × 2,500 m² promedio = 82,500 m²
Servidumbres acceso: 33 × 500 m² = 16,500 m²
Total predial TETRA: 99,000 m² (9.9 hectáreas)
Regeneradores Fibra
32 casetas × 400 m² = 12,800 m²
Servidumbres paso ductos: 1,100 km × 6m = 660 hectáreas
Total predial fibra: 672.8 hectáreas
4.2 Permisos y Licencias
TETRA (ANE - Agencia Nacional Espectro)
- 33 permisos uso espectro (por estación base)
- 1 licencia red troncalizada nacional
- Coordinación interferencias con FENOCO
Fibra Óptica (Operadores Redes)
- 540 km cruces vía férrea (autocruce)
- ~200 cruces redes eléctricas
- ~150 cruces acueducto/alcantarillado
- ~50 cruces gas/hidrocarburos

5. Cronograma de Implementación
5.1 Hitos Críticos
Hito
Duración
Dependencias

Gestión predial
Meses 1-15
AT7

Permisos ANE/redes
Meses 6-18
AT5

Ductos fibra
Meses 18-30
Predios liberados

Torres TETRA
Meses 20-32
Permisos ANE

Tendido fibra
Meses 28-34
Ductos terminados

Equipos TETRA
Meses 30-36
Torres listas

Pruebas integración
Meses 34-36
Todos los sistemas

5.2 Ruta Crítica
GESTIÓN PREDIAL → PERMISOS → DUCTOS → FIBRA → INTEGRACIÓN
(El TETRA puede ir en paralelo una vez liberados predios)

6. Puntos Críticos para Ingeniería de Detalle
6.1 Decisiones Técnicas Pendientes
Sistema TETRA
[ ] Definir bandas de frecuencia específicas con ANE
[ ] Validar interoperabilidad protocolos con FENOCO
[ ] Calcular propagación real según topografía específica
[ ] Diseñar redundancia geográfica estaciones críticas
Sistema Fibra Óptica
[ ] Validar rutas alternativas con estudios topográficos
[ ] Confirmar tecnología WDM vs. fibras dedicadas
[ ] Definir estrategia de reparación rápida (< 4 horas)
[ ] Verificar capacidad real por sistema soportado
6.2 Estudios Complementarios Requeridos
Ingeniería de Detalle
1. Estudio propagación radio (TETRA): Drive test 540 km
2. Estudio geotécnico: fundaciones torres + casetas
3. Análisis interferencias: EMC entre TETRA y fibra
4. Cálculo consumo real: mediciones climáticas
5. Plan de frequencies: coordinación ANE y FENOCO
Gestión de Riesgos
1. Backup routes para fibra (en caso de cortes)
2. Sites alternativos TETRA (problemas prediales)
3. Proveedores backup (equipos críticos)
4. Plan de contratación local (O&M)

7. Estimación de Inversión (Orden de Magnitud)
7.1 CAPEX Estimado
Componente
Cantidad
Costo Unit. (USD)
Total (USD)

Estaciones Base TETRA
40
150,000
6,000,000

Torres + Casetas
33
80,000
2,640,000

Regeneradores L3
32
50,000
1,600,000

Fibra Óptica (km)
1,430
8,000
11,440,000

Ductos + Cámaras
1,265
3,500
4,427,500

Switches/Routers
42
25,000
1,050,000

UPS + Generadores
Global
-
2,500,000

Gestión Predial
Global
-
1,500,000

Ingeniería + Permisos
Global
-
3,000,000

TOTAL ESTIMADO
-
-
34,157,500

7.2 OPEX Anual Estimado
- Mantenimiento TETRA: USD 600,000/año
- Mantenimiento Fibra: USD 400,000/año  
- Energía eléctrica: USD 180,000/año
- Personal especializado: USD 350,000/año
- Seguros y licencias: USD 120,000/año

TOTAL OPEX: USD 1,650,000/año

8. Conclusiones y Próximos Pasos
8.1 Factores Críticos de Éxito
Gestión predial temprana: 672 hectáreas + 99,000 m²
Coordinación ANE: 33 permisos espectro + red troncalizada
Gestión interferencias: 400+ cruces con redes existentes
Calidad construcción: 32 bunkers críticos + 33 torres
8.2 Riesgos Principales
Prediales: Retrasos en servidumbres fibra (672 ha)
Regulatorios: Demoras permisos ANE para TETRA
Técnicos: Interferencias no identificadas con FENOCO
Logísticos: Acceso a sitios remotos para mantenimiento
8.3 Recomendaciones EPC
Iniciar gestión predial inmediatamente (ruta crítica)
Contratar especialista en frecuencias TETRA/ANE
Evaluar proveedores con experiencia ferroviaria
Diseñar plan contingencia para rutas alternativas

Esta estimación está basada en asunciones técnicas estándar y debe ser refinada durante la ingeniería de detalle con mediciones reales, estudios específicos de propagación y validación de campo.

Esta información es únicamente de carácter informativo. Se recomienda su revisión y validación por el equipo técnico especializado antes de ser utilizada formalmente.



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
