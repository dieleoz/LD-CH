# DECISIÓN TÉCNICA: DT-TETRA-030

**Sistema:** Telecomunicaciones - TETRA  
**Fecha:** 11/10/2025  
**Tipo:** Modificación Criterio Técnico  
**Estado:** EJEMPLO (Para referencia)  
**Impacto Layout:** ✅ SÍ (Recálculo de ubicaciones)  

---

## 1. CONTEXTO

Se propone cambiar el criterio de solapamiento de cobertura TETRA de 20% a 30% para mejorar la redundancia de cobertura en zonas montañosas del corredor.

---

## 2. ANÁLISIS TÉCNICO

**Criterio actual:**
- Solapamiento: 20% entre estaciones
- Radio de cobertura: 15 km
- Distancia efectiva: 15 × (1 - 0.20) = 12 km
- Cantidad de estaciones: 594 km ÷ 12 km = 49.5 ≈ 37 estaciones

**Criterio propuesto:**
- Solapamiento: 30% entre estaciones
- Radio de cobertura: 15 km
- Distancia efectiva: 15 × (1 - 0.30) = 10.5 km
- Cantidad de estaciones: 594 km ÷ 10.5 km = 56.6 ≈ **57 estaciones**

**Impacto:**
- +20 estaciones TETRA nuevas
- Mejor cobertura en zonas críticas
- Mayor redundancia

---

## 10. INSTRUCCIONES PARA CURSOR ⚙️

```yaml
dt_metadata:
  id: "DT-TETRA-030"
  fecha: "2025-10-11"
  item_wbs: "2.1.100"
  tipo_cambio: "criterio_recalculo"
  impacto_layout: true

archivos_actualizar:
  - file: "IX. WBS y Planificacion/WBS_Presupuestal_v2.0.md"
    seccion: "Item 2.1.100"
    cambios:
      - campo: "cantidad"
        buscar: "37"
        reemplazar: "57"
      - campo: "total_cop"
        buscar: "valor_anterior"
        reemplazar: "valor_nuevo"
        recalcular: true

  - file: "V.3_Sistemas_Comunicacion_Detalle_v5.0.md"
    seccion: "4.2 Cobertura TETRA"
    cambios:
      - campo: "criterio_solapamiento"
        buscar: "20%"
        reemplazar: "30%"
      - campo: "cantidad_estaciones"
        buscar: "37"
        reemplazar: "57"

# 🆕 NUEVA SECCION: RECALCULO DE LAYOUT
layout_recalcular:
  activar: true
  sistema: "Red_TETRA"
  parametro_cambio: "solapamiento_pct"
  valor_anterior: 20
  valor_nuevo: 30
  
  recalculo_automatico:
    cantidad_anterior: 37
    cantidad_nueva: 57
    pk_inicio: "201+470"
    pk_fin: "722+250"
    distancia_anterior_km: 12
    distancia_nueva_km: 10.42
    metodo: "distribucion_uniforme"
  
  generar_instalaciones_nuevas: true
  tipo_instalacion: "Nodo_TETRA_Intermedio"
  
  kit_por_instalacion:
    - categoria: "Telecomunicaciones"
      dispositivo: "TETRA BS"
      nomenclatura: "EBT_[NUMERO]"
      
    - categoria: "Energia"
      dispositivo: "UPS 10kVA"
      nomenclatura: "SAI_[UBICACION]"
      
    - categoria: "Telecomunicaciones"
      dispositivo: "Switch PoE"
      nomenclatura: "SWA_[UBICACION]_01"
      
    - categoria: "Seguridad_ITS"
      dispositivo: "CCTV Fija"
      nomenclatura: "CCTV_[UBICACION]_01"

# Script a ejecutar
scripts_ejecutar:
  - script: "recalcular_layout_desde_DT.ps1"
    parametros: "-DT_Path 'II. Apendices Tecnicos/Decisiones_Tecnicas/DT-TETRA-030-2025-10-11.md'"
    orden: "despues_de_actualizar_archivos"
```

---

## 11. ESTADO DE EJECUCIÓN

- [ ] 🔧 Pendiente de ejecución

---

## 12. LOG DE EJECUCIÓN

*Se completará automáticamente al ejecutar*

---

**ESTE ES UN DOCUMENTO DE EJEMPLO** para demostrar la nueva estructura de DTs con recálculo automático de layout.

Para usar esta plantilla:
1. Crear DT real con ID único
2. Completar secciones 1-9 con análisis técnico
3. Ajustar YAML de sección 10 según necesidad
4. Cursor ejecutará y recalculará layout automáticamente

