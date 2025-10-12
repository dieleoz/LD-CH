# MATRIZ DE DEPENDENCIAS DOCUMENTALES v1.0
## Proyecto APP La Dorada-Chiriguaná

**Fecha:** Enero 2025  
**Versión:** 1.0  
**Responsable:** Administrador Contractual EPC  
**Propósito:** Rastrear qué archivos se afectan cuando cambia una decisión técnica  

---

## 🎯 **PROPÓSITO DE ESTA MATRIZ**

Esta matriz permite a Cursor IDE Agent y otros agentes **identificar automáticamente** todos los archivos que deben actualizarse cuando se modifica una decisión técnica, especificación o criterio.

### **BENEFICIOS:**
- ✅ Cursor sabe EXACTAMENTE qué archivos revisar (no adivina)
- ✅ Trazabilidad completa de cambios
- ✅ Evita inconsistencias por olvido de actualización
- ✅ Reduce tiempo de búsqueda de 2-3 horas a 5-10 minutos

### **CÓMO USAR:**
1. **Identificas cambio:** Ejemplo: "Cajas fibra 500m → 1000m"
2. **Buscas en matriz:** Componente "Fibra - Cajas empalme"
3. **Obtienes lista:** 4-6 archivos específicos a actualizar
4. **Actualizas archivos:** Con trazabilidad (Origen: DT-FIBRA-001)

---

## 📋 **MATRIZ DE DEPENDENCIAS POR SISTEMA**

### **SISTEMA 01: CONTROL Y SEÑALIZACIÓN**

#### **CTC - Centro de Control de Tráfico**
| Componente | Si cambias en... | Afecta estos archivos | Tipo Impacto | Sección Específica |
|:-----------|:----------------|:---------------------|:-------------|:-------------------|
| Arquitectura CTC | DT-CTC-001 | III/26_Sistema_CTC_Integrado.md | Diseño conceptual | Sección 3.1 |
| Arquitectura CTC | DT-CTC-001 | V.2_Centro_Control_Trafico_CTC_Detalle.md | Especificaciones | Sección 4.2 |
| Arquitectura CTC | DT-CTC-001 | WBS_Presupuestal_v2.0.md | Costos | Item 1.1 |
| Arquitectura CTC | DT-CTC-001 | X/SISTEMA_01_Control_Master.md | Consolidado | Sección 4-5 |

#### **ATP/ETCS - Sistema Embarcado**
| Componente | Si cambias en... | Afecta estos archivos | Tipo Impacto | Sección Específica |
|:-----------|:----------------|:---------------------|:-------------|:-------------------|
| Equipos ATP | DT-ATP-001 | III/32_Material_Rodante_Integrado.md | Cantidad equipos | Tabla 2.3 |
| Equipos ATP | DT-ATP-001 | V.5_Sistemas_Seguridad_Detalle.md | Especificaciones | Sección 3.1 |
| Equipos ATP | DT-ATP-001 | WBS_Presupuestal_v2.0.md | Costos | Item 1.2 |

#### **ENCE - Enclavamientos**
| Componente | Si cambias en... | Afecta estos archivos | Tipo Impacto | Sección Específica |
|:-----------|:----------------|:---------------------|:-------------|:-------------------|
| Estaciones ENCE | DT-ENCE-001 | III/29_Sistema_Senalizacion_Integrado.md | Cantidades | Sección 2.4 |
| Estaciones ENCE | DT-ENCE-001 | V.1_Señalizacion_Ferroviaria_Detalle.md | Especificaciones | Sección 5.2 |
| Estaciones ENCE | DT-ENCE-001 | WBS_Presupuestal_v2.0.md | Costos | Item 1.3 |
| Estaciones ENCE | DT-ENCE-001 | IV/39_Planos_Preliminares.md | Ubicaciones | Tabla PKs |

---

### **SISTEMA 02: TELECOMUNICACIONES**

#### **Fibra Óptica - Infraestructura OSP**
| Componente | Si cambias en... | Afecta estos archivos | Tipo Impacto | Sección Específica |
|:-----------|:----------------|:---------------------|:-------------|:-------------------|
| **Cajas de empalme** | **DT-FIBRA-001** | **V. Ingenieria de detalle/V.3_Sistemas_Comunicacion_Detalle.md** | **Cantidades** | **Tabla 5.3, Línea 234** |
| **Cajas de empalme** | **DT-FIBRA-001** | **WBS_Presupuestal_v2.0.md** | **Costos** | **Item 3.1.5** |
| **Cajas de empalme** | **DT-FIBRA-001** | **IV/37_Memorias_Diseno_Basico.md** | **Especificaciones** | **Sección 4.2.3** |
| **Cajas de empalme** | **DT-FIBRA-001** | **III/28_Sistema_FibraOptica_Integrado.md** | **Criterios diseño** | **Sección 2.2** |
| **Cajas de empalme** | **DT-FIBRA-001** | **X/SISTEMA_02_Telecomunicaciones_Master.md** | **Consolidado** | **Sección 5.2.3** |
| Longitud fibra | DT-FIBRA-002 | III/28_Sistema_FibraOptica_Integrado.md | Cantidades | Tabla 2.1 |
| Longitud fibra | DT-FIBRA-002 | WBS_Presupuestal_v2.0.md | Costos | Item 3.1.1 |
| Topología red | DT-FIBRA-003 | V.3_Sistemas_Comunicacion_Detalle.md | Arquitectura | Sección 3.2 |
| **Cajas c/300m + Domos c/4km** | **DT-FIBRA-641** | **layout.md** | **Cantidades** | **Todas las UFVs** |
| **Cajas c/300m + Domos c/4km** | **DT-FIBRA-641** | **WBS_Presupuestal_v2.0.md** | **Costos** | **Item 2.3.103, 2.3.109** |
| **Cajas c/300m + Domos c/4km** | **DT-FIBRA-641** | **layout_datos.js** | **Regenerar** | **Script automático** |
| **Cajas c/300m + Domos c/4km** | **DT-FIBRA-641** | **V.3_Sistemas_Comunicacion_Detalle.md** | **Criterios** | **Sección instalación** |

#### **TETRA - Radio Digital**
| Componente | Si cambias en... | Afecta estos archivos | Tipo Impacto | Sección Específica |
|:-----------|:----------------|:---------------------|:-------------|:-------------------|
| Estaciones TETRA | DT-TETRA-001 | III/27_Sistema_TETRA_Integrado.md | Cantidades | Tabla 2.2 |
| Estaciones TETRA | DT-TETRA-001 | V.3_Sistemas_Comunicacion_Detalle.md | Especificaciones | Sección 4.1 |
| Estaciones TETRA | DT-TETRA-001 | WBS_Presupuestal_v2.0.md | Costos | Item 3.2 |
| Estaciones TETRA | DT-TETRA-001 | IV/39_Planos_Preliminares.md | Ubicaciones | Mapa torres |
| Torres TETRA altura | DT-TETRA-002 | V.4_Sistemas_Potencia_Detalle.md | Requerimientos | Sección 2.1 |

#### **GSM-R - Comunicaciones Ferroviarias**
| Componente | Si cambias en... | Afecta estos archivos | Tipo Impacto | Sección Específica |
|:-----------|:----------------|:---------------------|:-------------|:-------------------|
| Estaciones GSM-R | DT-GSMR-001 | III/27_Sistema_TETRA_Integrado.md | Colocalización | Sección 3.3 |
| Estaciones GSM-R | DT-GSMR-001 | V.3_Sistemas_Comunicacion_Detalle.md | Especificaciones | Sección 4.2 |
| Estaciones GSM-R | DT-GSMR-001 | WBS_Presupuestal_v2.0.md | Costos | Item 3.3 |

---

### **SISTEMA 03: ITS Y SEGURIDAD**

#### **CCTV - Videovigilancia**
| Componente | Si cambias en... | Afecta estos archivos | Tipo Impacto | Sección Específica |
|:-----------|:----------------|:---------------------|:-------------|:-------------------|
| Cámaras CCTV | DT-CCTV-001 | III/31_Sistema_CCTV_Integrado.md | Cantidades | Tabla 2.1 |
| Cámaras CCTV | DT-CCTV-001 | V.5_Sistemas_Seguridad_Detalle.md | Especificaciones | Sección 3.2 |
| Cámaras CCTV | DT-CCTV-001 | WBS_Presupuestal_v2.0.md | Costos | Item 4.1 |
| Ubicación cámaras | DT-CCTV-002 | IV/39_Planos_Preliminares.md | Planos | Mapa seguridad |

---

### **SISTEMA 04: MATERIAL RODANTE**

#### **Locomotoras - Equipamiento**
| Componente | Si cambias en... | Afecta estos archivos | Tipo Impacto | Sección Específica |
|:-----------|:----------------|:---------------------|:-------------|:-------------------|
| Cantidad locomotoras | DT-MR-001 | III/32_Material_Rodante_Integrado.md | Cantidades | Sección 2.1 |
| Cantidad locomotoras | DT-MR-001 | V.4_Sistemas_Potencia_Detalle.md | Requerimientos | Tabla 4.2 |
| Cantidad locomotoras | DT-MR-001 | WBS_Presupuestal_v2.0.md | Costos | Item 5.1 |
| EOT - Dispositivos | DT-EOT-001 | III/32_Material_Rodante_Integrado.md | Especificaciones | Sección 3.4 |
| EOT - Dispositivos | DT-EOT-001 | WBS_Presupuestal_v2.0.md | Costos | Item 5.2 |

---

### **SISTEMA 05: INFRAESTRUCTURA OPERATIVA**

#### **CCO - Centro de Control**
| Componente | Si cambias en... | Afecta estos archivos | Tipo Impacto | Sección Específica |
|:-----------|:----------------|:---------------------|:-------------|:-------------------|
| Ubicación CCO | DT-CCO-001 | III/26_Sistema_CTC_Integrado.md | Localización | Sección 2.1 |
| Ubicación CCO | DT-CCO-001 | IV/39_Planos_Preliminares.md | Planos | Mapa general |
| Ubicación CCO | DT-CCO-001 | IV/40_Plan_GestionPermisos.md | Permisos | Tabla municipios |
| Capacidad CCO | DT-CCO-002 | V.2_Centro_Control_Trafico_CTC_Detalle.md | Especificaciones | Sección 4.1 |

---

### **COMPONENTES TRANSVERSALES**

#### **Potencia y Energía**
| Componente | Si cambias en... | Afecta estos archivos | Tipo Impacto | Sección Específica |
|:-----------|:----------------|:---------------------|:-------------|:-------------------|
| Subestaciones | DT-POT-001 | V.4_Sistemas_Potencia_Detalle.md | Especificaciones | Sección 2.2 |
| Subestaciones | DT-POT-001 | WBS_Presupuestal_v2.0.md | Costos | Item 6.1 |
| UPS/Respaldo | DT-POT-002 | V.4_Sistemas_Potencia_Detalle.md | Capacidad | Tabla 3.1 |

#### **Interfaces entre Sistemas**
| Componente | Si cambias en... | Afecta estos archivos | Tipo Impacto | Sección Específica |
|:-----------|:----------------|:---------------------|:-------------|:-------------------|
| Protocolo CTC-ITCS | DT-INT-001 | IV/41_Interfaces_Sistemas.md | Especificaciones | Tabla FFFIS |
| Protocolo CTC-ITCS | DT-INT-001 | V.2_CTC_Detalle.md | Arquitectura | Sección 5.3 |

---

## 🔄 **CÓMO ACTUALIZAR ESTA MATRIZ**

### **Cuando creas una nueva Decisión Técnica:**
1. Identificar el componente afectado
2. Buscar qué archivos mencionan ese componente (usar `grep` o `codebase_search`)
3. Agregar fila a la tabla correspondiente con:
   - ID de la Decisión Técnica
   - Archivos afectados (ruta completa)
   - Tipo de impacto (Cantidades/Costos/Especificaciones/Ubicaciones)
   - Sección específica (para facilitar navegación)

### **Ejemplo de búsqueda:**
```bash
# Buscar dónde se menciona "cajas de empalme" o "500m"
grep -r "cajas de empalme\|500m" "II. Apendices Tecnicos/" "III. Ingenieria conceptual/" "IV. Ingenieria basica/" "V. Ingenieria de detalle/"
```

---

## 📊 **ESTADÍSTICAS DE LA MATRIZ**

| Métrica | Valor | Estado |
|:--------|:------|:-------|
| **Sistemas cubiertos** | 5/6 | 🟡 Parcial |
| **Decisiones técnicas mapeadas** | 15 | 🟡 Base inicial |
| **Archivos rastreados** | 45+ | 🟢 Bueno |
| **Cobertura estimada** | 70% | 🟡 En crecimiento |

**⚠️ Nota:** Esta es una versión inicial. Se debe actualizar continuamente conforme se crean nuevas Decisiones Técnicas.

---

## 🔧 **MANTENIMIENTO DE LA MATRIZ**

### **Frecuencia de actualización:**
- ✅ **Cada nueva Decisión Técnica:** Agregar fila inmediatamente
- ✅ **Mensual:** Revisar coherencia y completitud
- ✅ **Por fase:** Validar cobertura al cerrar fases de ingeniería

### **Responsables:**
- **Creación inicial:** Administrador Contractual EPC
- **Actualización diaria:** Especialista que crea la DT
- **Validación mensual:** PMO

---

## 📚 **REFERENCIAS Y DOCUMENTOS RELACIONADOS**

### **Documentos asociados:**
- `II. Apendices Tecnicos/Decisiones_Tecnicas/` - Decisiones Técnicas versionadas
- `00. Gobernanza PMO/Matriz_Riesgos_PMO_Consolidada_v1.0.md` - Riesgos con campo Origen_Decisión
- `VIII. Documentos Maestros y Metodologia/CRITERIOS_TECNICOS_MAESTRO_v1.0.md` - Criterios maestros
- `X_ENTREGABLES_CONSOLIDADOS/` - Documentos consolidados finales

### **Metodologías relacionadas:**
- `X_ENTREGABLES_CONSOLIDADOS/6_METODOLOGIAS_Y_RECETAS/METODOLOGIA_CONSOLIDACION_DOCUMENTAL_v1.0.md`
- `II. Apendices Tecnicos/Decisiones_Tecnicas/PLANTILLA_Decisión_Técnica.md`
- `II. Apendices Tecnicos/Decisiones_Tecnicas/PLANTILLA_Análisis_Cambio.md`

---

## ⚠️ **ADVERTENCIAS IMPORTANTES**

### **Limitaciones:**
- Esta matriz debe actualizarse ANTES de implementar un cambio
- La efectividad depende de mantenerla actualizada
- Requiere disciplina del equipo para registrar dependencias

### **Mejores prácticas:**
- **SIEMPRE consultar** esta matriz antes de modificar archivos
- **ACTUALIZAR matriz** al crear nueva Decisión Técnica
- **VALIDAR completitud** al cerrar cada fase de ingeniería
- **NO modificar** archivos sin verificar dependencias

---

## 📊 **CONTROL DE CAMBIOS**

| Versión | Fecha | Cambios | Archivos Agregados | Responsable |
|:-------:|:------|:--------|:------------------|:------------|
| 1.0 | Enero 2025 | Versión inicial con 15 decisiones técnicas base | 45+ archivos mapeados | Administrador EPC |

---

**Elaborado por:** Administrador Contractual EPC  
**Fecha:** Enero 2025  
**Estado:** ✅ Operativa - Base inicial creada  
**Próxima revisión:** Febrero 2025  
**Metodología:** Punto 42 v5.0  

