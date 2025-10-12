# MATRIZ DE RIESGOS PMO - VERSIÓN AMPLIADA v1.0
## APP La Dorada - Chiriguaná

**Fecha:** Enero 2025  
**Responsable:** PMO / Administrador Contractual EPC  
**Basado en:** `00. Gobernanza PMO/Matriz_Riesgos_PMO_Consolidada_v1.0.md`  
**Cambios:** Agregados campos `Origen_Decisión` y `Hito_Verificación`  

---

## 🎯 **PROPÓSITO DE LA AMPLIACIÓN**

Esta versión ampliada de la Matriz de Riesgos PMO agrega **dos campos críticos** para trazabilidad de decisiones técnicas:

1. **Origen_Decisión:** Rastrea de qué Decisión Técnica (DT) nace el riesgo
2. **Hito_Verificación:** Indica en qué hito del cronograma se verifica/cierra el riesgo

### **BENEFICIO:**
- ✅ Trazabilidad completa: Riesgo → Decisión Técnica → Hito
- ✅ Cursor/Agentes pueden agregar riesgos automáticamente
- ✅ PMO puede filtrar riesgos por origen (contractual vs. técnico)
- ✅ Seguimiento vinculado al cronograma

---

## 📋 **ESTRUCTURA AMPLIADA**

### **Campos Originales:**
- **ID:** Identificador único del riesgo
- **Categoría:** Técnico/Contractual/Gestión/Económico/Ambiental
- **Descripción:** Qué puede salir mal
- **Prob:** Probabilidad (Alta/Media/Baja)
- **Impacto:** Impacto (Alto/Medio/Bajo)
- **Estrategia:** Evitar/Mitigar/Transferir/Aceptar
- **Responsable:** Quién gestiona el riesgo
- **Estado:** Activo/En validación/Cerrado
- **Fuente:** Documento origen del riesgo

### **Campos Nuevos:** ⭐
- **Origen_Decisión:** ID de Decisión Técnica (DT-XXX-NNN) o "N/A" si es riesgo general
- **Hito_Verificación:** ID de hito (H-XXX-NNN) donde se verifica, o "Continuo" si es monitoreo permanente
- **Plan_Accion:** ⭐ **NUEVO (10-Oct-2025)** - Acción inmediata concreta que el responsable debe ejecutar (máx 200 caracteres)

---

## 📊 **MATRIZ AMPLIADA - RIESGOS OPERATIVOS**

| ID | Categoría | Descripción | Prob | Impacto | Estrategia | Responsable | Estado | Fuente | **Origen_Decisión** | **Hito_Verificación** | **Items_WBS** | **Plan_Accion** |
|:--:|:----------|:------------|:----:|:--------|:-----------|:------------|:-------|:-------|:-------------------|:---------------------|:-------------|:----------------|
| R-AT3-01 | Técnico | Dependencia AT3 para ITCS ETCS L2 | Alta | Alto | Mitigar: ETCS L2 estándar | Ing. Sistemas | Activo | P42 / Docs ITCS | N/A | H-ITCS-001 | 1.1.100, 1.2.100 | Documentar supuestos de diseño y solicitar clarificación a Interventoría |
| R-INT-01 | Técnico | Interoperabilidad con FENOCO (UIC) | Media | Alto | Mitigar: Protocolos UIC | Comunicaciones | Activo | P42 / Interfaces | N/A | H-INT-002 | 1.1.106, 4.1.100 | Coordinar reuniones técnicas mensuales con FENOCO para validar interfaces |
| R-AT4-01 | Contractual | Cumplimiento disponibilidad AT4 | Media | Alto | Mitigar: N+1, monitoreo | Ing. Sistemas | Activo | AT4 / P42 | N/A | Continuo | 1.1.100, 1.1.101, 1.1.106, 2.1.100, 3.1.100, 5.1.100 | Realizar análisis RAMS detallado y asegurar redundancia N+1 en diseños críticos |
| R-CYB-01 | Técnico | Ciberseguridad IEC 62443 | Media | Alto | Mitigar: Defensa en profundidad | Ciberseguridad | Activo | VII.2.11 | N/A | H-CYB-001 | 1.1.100, 1.1.105, 1.1.106, 1.1.108, 2.1.100, 3.1.100, 5.1.100 | Contratar póliza de seguro contra ciberriesgos y realizar auditorías de seguridad periódicas |
| R-IF-01 | Gestión | Desalineación en interfaces (ICD) | Alta | Alto | Mitigar: Plan Gestión Interfaces | PMO/Integración | Activo | 41. Interfaces | N/A | H-IF-003 | 1.1.106, 5.3.103 | Realizar workshops de integración y definir ICD para cada par de sistemas |
| R-PERM-01 | Contractual | Retrasos permisos ANE/ANLA | Media | Alto | Mitigar: Plan de permisos | Gestor Permisos | Activo | 40. Permisos | N/A | H-PERM-001 | 1.0.100 | Iniciar gestión temprana de permisos y mantener comunicación constante con autoridad ambiental |
| R-FIBRA-001 | Cronograma | Lead time crítico fibra 9m (pago 3m + fabric 4m + nac 2m) | Alta | Crítico | EVITAR - Ordenar 9m antes | PMO Adquisiciones | Activo | DT-FIBRA-003 | DT-FIBRA-003 | Orden Mes -9 | 2.3.100, 2.3.103 | Ordenar fibra óptica con 9 meses de anticipación (Mes -9 respecto a instalación) |
| R-FM-001 | Fuerza Mayor | Huelgas transporte, problemas FENOCO, paros sector | Media | Alto | MITIGAR - Plan contingencia, proveedores alternativos | PMO | Activo | Contrato | N/A | Continuo | 2.3.100, 2.3.103, 2.1.100, 3.2.100, 4.1.100, 6.1.100 | Desarrollar plan de contingencia con proveedores alternativos y rutas de transporte backup |
| R-GES-004 | Gestión | Desfase aprobación diseños vs cronograma Plan Obras | Media | Alto | MITIGAR - Integrar cronograma entregables ingeniería con Plan Obras | PMO | Activo | A.1 Análisis | N/A | H-APROB-M12 | 1.1.100, 1.1.103, 1.2.100, 2.1.100, 2.3.100, 3.1.100, 5.1.100 | Crear y socializar matriz de aprobaciones con plazos claros para cada entregable |
| R-CON-001 | Contractual | Ambigüedad medición disponibilidad PAN 100% (KPI inalcanzable) | Media | Alto | MITIGAR - Consulta Interventoría criterios medición | PMO Calidad | Activo | A.2 Análisis | N/A | Continuo | 3.2.100 | Solicitar a ANI clarificación formal sobre metodología de medición de disponibilidad para los PAN |
| R-OPE-001 | Operacional | Falla conmutación failover sistemas redundantes | Media | Alto | MITIGAR - Pruebas conmutación obligatorias FAT/SAT | Especialista Sistemas | Activo | A.2 Análisis | N/A | H-SAT-M44 | 1.1.100, 2.1.100 | Incluir pruebas de conmutación por falla (failover) en protocolos de pruebas SAT |
| R-CAL-001 | Gestión | Calidad materiales/mano obra no cumple estándares | Media | Alto | MITIGAR - Control calidad estricto, certificaciones | PMO Calidad | Activo | A.3 Análisis | N/A | Continuo | 1.1.100, 1.1.103, 1.2.100, 2.3.100, 2.3.103, 3.2.100, 4.1.100, 6.1.100 | Implementar plan de aseguramiento de calidad estricto con inspecciones en fábrica y en sitio |
| R-ITCS-001 | Técnico | Indefinición sistema ITCS (ATP/ETCS L2/CBTC) - Bloqueador 58% proyecto | Alta | Crítico | EVITAR - Oficiar ANI, decisión Mes 6 | Gerencia Técnica + ANI | Activo | BLOCKER-001 | N/A | H-ITCS-DEF-M6 | 1.1.100, 1.1.103, 1.2.100 | **ACCIÓN HOY:** Enviar oficio formal a ANI solicitando definición tecnológica. Preparar matriz de decisión técnica comparando PTC/ETCS/CBTC |
| R-FENOCO-001 | Técnico | Protocolos propietarios FENOCO (Siemens Trainguard) - Interoperabilidad indefinida | Alta | Crítico | MITIGAR - Reunión FENOCO Mes 5, gateway UIC Plan B | PMO + FENOCO | Activo | BLOCKER-002 | N/A | H-FENOCO-M6 | 1.1.106, 4.1.100 | **ACCIÓN HOY:** Enviar comunicación formal a FENOCO solicitando especificaciones Siemens Trainguard. Agendar reunión técnica (15 días) |
| R-PAN-001 | Contractual | Cantidades PAN NO confirmadas (regularización en curso) - Variación ±10% | Media | Medio | ACEPTAR - Diseño modular ±10%, contingencia $489M | PMO + Seguridad Vial | Activo | BLOCKER-003 | N/A | HG-PAN-04-M10 | 3.2.100 | **ACCIÓN HOY:** Confirmar diseño modular de PANs. Validar asignación de contingencia $489M en presupuesto |
| R-MR-001 | Gestión | Cronograma MR indefinido (15 locomotoras) - Secuencia pruebas NO definida | Media | Medio | MITIGAR - Plan adaptable, certificación en banco si no llega | PMO + Gerencia Operaciones | Activo | BLOCKER-004 | N/A | H-MR-M5 | 6.1.100 | **ACCIÓN HOY:** Enviar oficio a ANI solicitando cronograma detallado de entrega. Desarrollar 3 escenarios de planificación

---

## 📋 **EJEMPLO DE RIESGO DERIVADO DE DECISIÓN TÉCNICA**

### **Caso: Cambio de espaciamiento de cajas de fibra óptica**

| ID | Categoría | Descripción | Prob | Impacto | Estrategia | Responsable | Estado | Fuente | **Origen_Decisión** | **Hito_Verificación** | **Plan_Accion** |
|:--:|:----------|:------------|:----:|:--------|:-----------|:------------|:-------|:-------|:-------------------|:---------------------|:----------------|
| R-FIBRA-006 | Económico | Ahorro CAPEX no realizado si cajas cada 1000m fallan | 20% | Medio | Aceptar: Beneficio supera riesgo | PMO | Activo | WBS / Análisis | **DT-FIBRA-001** | **H-FIBRA-005** | Monitorear costo final de fibra para confirmar ahorro proyectado. Validar en H-FIBRA-005 |

**Explicación:**
- **Origen_Decisión = DT-FIBRA-001:** Este riesgo nace de la decisión de cambiar cajas de 500m a 1000m
- **Hito_Verificación = H-FIBRA-005:** Se verificará en el hito de "Instalación y pruebas de fibra óptica completadas"
- **Plan_Accion:** Acción concreta que el responsable debe ejecutar para gestionar el riesgo

---

## 🔧 **CÓMO USAR LOS CAMPOS NUEVOS**

### **Campo: Origen_Decisión**

**Valores posibles:**
- **DT-[SISTEMA]-[NNN]:** ID de la Decisión Técnica específica que generó este riesgo
- **N/A:** Si el riesgo es general, contractual o no derivado de una decisión técnica específica

**Ejemplo de uso:**
```
Cursor Agent agrega riesgo después de aprobar DT-FIBRA-001:

ID: R-FIBRA-006
Descripción: "Ahorro no realizado si cajas cada 1000m no cumplen"
Origen_Decisión: DT-FIBRA-001
```

### **Campo: Hito_Verificación**

**Valores posibles:**
- **H-[SISTEMA]-[NNN]:** ID del hito del cronograma donde se verifica/cierra
- **Continuo:** Si es un riesgo que se monitorea permanentemente durante toda la operación

**Ejemplo de uso:**
```
PMO verifica riesgo en hito:

Hito_Verificación: H-FIBRA-005
Fecha hito: Mayo 2025
Actividad: Pruebas de fibra completadas
Acción: Verificar que cajas cada 1000m funcionan correctamente
```

### **Campo: Plan_Accion** ⭐ **NUEVO**

**Propósito:** Definir la **acción inmediata y concreta** que el responsable debe ejecutar para gestionar el riesgo.

**Formato:**
- **Texto claro y accionable** (máximo 200 caracteres)
- **Verbo de acción al inicio:** "Enviar", "Desarrollar", "Confirmar", "Solicitar", etc.
- **Si es crítico:** Prefijo "**ACCIÓN HOY:**" en negrita

**Valores posibles:**
- **Acción concreta:** "Enviar oficio a ANI solicitando definición tecnológica"
- **Múltiples pasos:** "Confirmar diseño modular. Validar contingencia presupuestal"
- **Plan B incluido:** "Reunión FENOCO (15 días). Plan B: Gateway UIC genérico"

**Ejemplo de uso:**
```
Riesgo crítico con acción inmediata:

ID: R-ITCS-001
Plan_Accion: **ACCIÓN HOY:** Enviar oficio formal a ANI solicitando definición 
             tecnológica. Preparar matriz de decisión técnica comparando PTC/ETCS/CBTC
```

```
Riesgo medio con acción de seguimiento:

ID: R-FIBRA-006
Plan_Accion: Monitorear costo final de fibra para confirmar ahorro proyectado. 
             Validar en H-FIBRA-005
```

**Beneficio:** El usuario final ve inmediatamente **QUÉ HACER** sin tener que buscar en otros documentos.

---

## 📋 **INTEGRACIÓN CON OTROS DOCUMENTOS**

### **Vinculación con Decisiones Técnicas:**
```
DT-FIBRA-001_v1.0.md
└── Genera riesgos:
    ├── R-FIBRA-006 (Económico)
    └── R-FIBRA-007 (Técnico)
```

### **Vinculación con Cronograma:**
```
H-FIBRA-005 (Hito cronograma)
└── Verifica riesgos:
    ├── R-FIBRA-006
    └── R-FIBRA-007
```

### **Vinculación con Supuestos:**
```
SUP-FIBRA-001 (Supuesto crítico)
└── Si no se cumple → Activa:
    └── R-FIBRA-006
```

---

## 🔄 **PROCESO DE ACTUALIZACIÓN**

### **Cuando se crea una Decisión Técnica:**
1. Especialista crea `DT-[SISTEMA]-[NNN].md`
2. Identifica riesgos nuevos en sección 5 de la DT
3. Agrega cada riesgo a esta matriz con:
   - Campo `Origen_Decisión = DT-[SISTEMA]-[NNN]`
   - Campo `Hito_Verificación = H-XXX-NNN` (del cronograma)

### **Cuando se cierra un hito:**
1. PMO revisa qué riesgos tienen `Hito_Verificación = H-XXX-NNN`
2. Verifica si el riesgo se materializó o no
3. Actualiza `Estado` a "Cerrado" o "Mitigado"
4. Documenta resultado en campo de observaciones

---

## 📊 **KPIs AMPLIADOS**

| KPI | Objetivo | Frecuencia | Responsable | Filtro |
|:---|:---:|:---:|:---|:---|
| Riesgos críticos abiertos | 0 | Semanal | PMO | Estado=Activo, Impacto=Alto |
| Riesgos de Decisiones Técnicas | < 5 activos | Mensual | Especialistas | Origen_Decisión != N/A |
| Riesgos próximos a verificar | Todos | Semanal | PMO | Hito_Verificación = [próximo mes] |
| Cumplimiento AT4 | 99.95% | Diario | Ing. Sistemas | Categoría=Contractual |

---

## 📚 **REFERENCIAS**

### **Documentos relacionados:**
- `00. Gobernanza PMO/Matriz_Riesgos_PMO_Consolidada_v1.0.md` - Versión original
- `III. Ingenieria conceptual/36.1_Analisis_Riesgos_y_Supuestos_PMI.md` - Análisis detallado
- `VIII. Documentos Maestros y Metodologia/36.2_Metodologia_Gestion_Supuestos.md` - Metodología
- `VIII. Documentos Maestros y Metodologia/Matrices_Dependencias/MATRIZ_DEPENDENCIAS_DOCUMENTALES_v1.0.md` - Dependencias

### **Plantillas relacionadas:**
- `II. Apendices Tecnicos/Decisiones_Tecnicas/PLANTILLA_Decisión_Técnica.md`
- `II. Apendices Tecnicos/Decisiones_Tecnicas/PLANTILLA_Análisis_Cambio.md`

---

## ⚠️ **ADVERTENCIA**

Esta matriz ampliada debe mantenerse sincronizada con:
- Decisiones Técnicas en `II. Apendices Tecnicos/Decisiones_Tecnicas/`
- Cronograma de hitos en `IX. WBS y Planificacion/`
- Matriz original en `00. Gobernanza PMO/`

**No modificar la matriz original** - Esta es una versión extendida para gestión de cambios iterativos.

---

**Elaborado por:** Administrador Contractual EPC  
**Fecha:** Enero 2025  
**Versión:** 1.0 (Ampliada)  
**Estado:** ✅ Operativa  
**Próxima revisión:** Mensual  

