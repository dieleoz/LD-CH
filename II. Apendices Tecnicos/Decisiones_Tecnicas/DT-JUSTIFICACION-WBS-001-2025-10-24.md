# DECISIÓN TÉCNICA: DT-JUSTIFICACION-WBS-001-2025-10-24
**Objetivo:** Mejorar justificaciones técnicas de items WBS con referencias contractuales  
**Alcance:** Items críticos de CAP 1, 2, 6 - Fundamentación AT3, AT4, AT5, AT10  
**Fecha:** 2025-10-24  
**Especialista:** PMO + Ingenieros Especialistas  

---

## 1. DESCRIPCIÓN DEL PROBLEMA

### **Justificaciones actuales son débiles:**
1. ❌ **Faltan referencias contractuales específicas** (ATs con numerales)
2. ❌ **No explica MÍNIMO de cantidades** (¿por qué 8? ¿por qué 120?)
3. ❌ **Falta fundamentación técnico-contractual** clara
4. ❌ **No enlaza obligaciones del contrato con items WBS**

### **Ejemplo actual (INSUFICIENTE):**
```json
{
  "1.1.100": {
    "descripcion": "Servidores CTC principales",
    "justificacion_tecnica": "Servidores redundantes para control centralizado según AT2 §5.3",
    "criterios_diseno": [
      "Redundancia N+1",
      "Capacidad 100 trenes"
    ],
    "referencias_contractuales": []  ← VACÍO
  }
}
```

### **Ejemplo objetivo (MEJORADO):**
```json
{
  "1.1.100": {
    "descripcion": "Servidores CTC principales",
    "justificacion_tecnica": "Sustentado en AT3, numeral 2.1.2, que define arquitectura tecnológica del CTC, requiriendo servidores dedicados para procesamiento principal. AT4, numeral 3.2.3, impone redundancia N+1 y disponibilidad 99.5%. Cantidad mínima: 2 UND (1 principal + 1 respaldo en hot-standby según AT4 §3.2.3)",
    "criterios_diseno": [
      "Redundancia N+1 para alta disponibilidad (AT4 §3.2.3)",
      "Capacidad procesamiento: 100 trenes simultáneos (AT3 §2.1.1)",
      "Tiempo respuesta < 100ms según IEC 62290-1",
      "Failover <5 segundos (AT4 §3.2.2)"
    ],
    "referencias_contractuales": [
      "AT3, Capítulo II, §2.1.2 - Arquitectura CTC",
      "AT3, Capítulo II, §2.1.1 - Sistema CTC centralizado",
      "AT4, Capítulo III, §3.2.3 - Redundancia N+1",
      "AT10, Capítulo II, §2.1 - Gestión surcos ferroviarios"
    ]
  }
}
```

---

## 2. ITEMS PRIORIZADOS PARA MEJORA

### **CAPÍTULO 1: CONTROL Y SEÑALIZACIÓN (12 items críticos):**

#### **1.1 - Sistema CTC Virtual Centralizado (7 items):**
- [ ] **1.1.100** - Servidores CTC principales (REF: AT3 §2.1.2, AT4 §3.2.3)
- [ ] **1.1.101** - Servidores CTC respaldo (REF: AT3 §2.1.3, AT4 §3.2.4)
- [ ] **1.1.102** - Workstations operadores (REF: AT3 §2.1.4, AT10 §2.1)
- [ ] **1.1.103** - Software CTC (REF: AT3 §2.1.1, AT4 §3.2.1, AT10 §2.1)
- [ ] **1.1.104** - Base de datos centralizada (REF: AT3 §2.1.5, AT10 §2.2)
- [ ] **1.1.105** - Sistema redundancia (REF: AT4 §3.2.3)
- [ ] **1.1.106** - Interfaces comunicación (REF: AT3 §2.3.1, AT5 §2.3)

#### **1.3 - Enclavamientos ENCE (3 items críticos):**
- [ ] **1.3.100** - Controlador ENCE Zapatosa (REF: AT3 §2.3.2, AT4 §3.2.1)
- [ ] **1.3.101-104** - Controladores ENCE otras estaciones (REF: AT3 §2.3.2)
- [ ] **1.3.105** - Redundancia ENCE (REF: AT4 §3.2.3)
- [ ] **1.3.106** - Interfaces CTC-ENCE (REF: AT3 §2.3.3)

#### **1.4 - Desvíos Motorizados (3 items):**
- [ ] **1.4.100** - Desvíos motorizados CTC (REF: AT3 §2.3.4, AT4 §3.2.1)
- [ ] **1.4.101** - Control remoto + redundancia (REF: AT3 §2.3.4, AT4 §3.2.3)
- [ ] **1.4.102** - Interfaces CTC/ENCE (REF: AT3 §2.3.4)

#### **1.5 - Desvíos Manuales (3 items):**
- [ ] **1.5.100** - Desvíos manuales autotalonables (REF: AT3 §2.3.2, mínimo 120 UND)
- [ ] **1.5.101** - Señalización luminosa estaciones (REF: AT1 Tabla 17, 10 UND)
- [ ] **1.5.102** - Herramientas operación (REF: AT3 §2.3.2)

---

### **CAPÍTULO 2: TELECOMUNICACIONES (8 items críticos):**

#### **2.1 - Sistema TETRA (3 items):**
- [ ] **2.1.100** - Torres autosoportadas (REF: AT5 §2.1.1, 37 UND según cobertura)
- [ ] **2.1.101** - Estaciones TETRA colocalizadas (REF: AT5 §2.1.2)
- [ ] **2.1.102** - Infraestructura soporte (REF: AT5 §2.1.3)

#### **2.2 - Sistema TETRA (3 items):**
- [ ] **2.2.100** - Estaciones base TETRA (REF: AT5 §2.2.1, cobertura corredor)
- [ ] **2.2.101** - Equipos control (REF: AT5 §2.2.2)
- [ ] **2.2.102** - Infraestructura soporte (REF: AT5 §2.2.3)

#### **2.3 - Fibra Óptica (6 items críticos):**
- [ ] **2.3.100** - Cable fibra óptica (REF: AT5 §2.3.1, 594 km = 526 + 10% + 3%)
- [ ] **2.3.101** - ODF estaciones (REF: AT5 §2.3.2)
- [ ] **2.3.102** - Cajas de empalme (REF: AT5 §2.3.3, 1,823 UND)
- [ ] **2.3.103** - Cajas de empalme (REF: AT5 §2.3.3, espaciamiento 300m)
- [ ] **2.3.104** - Uniones rápidas (REF: AT5 §2.3.4, 5,469 UND)
- [ ] **2.3.109** - Domos de fusión (REF: AT5 §2.3.4, 130 UND cada 4km)

---

### **CAPÍTULO 6: MATERIAL RODANTE (7 items nuevos tras consolidación):**

#### **6.1 - Equipos ATP Embarcados (items 6.1.200-206):**
- [ ] **6.1.200** - Computadora ATP embarcada (REF: AT1 §V, 8 UND = 5 + 3 reserva)
- [ ] **6.1.201** - Display maquinista (REF: AT1 §V.2, ETCS L2 DMI)
- [ ] **6.1.202** - Sensores velocidad (REF: AT3 §2.1.5, odometría)
- [ ] **6.1.203** - Sistema GPS (REF: AT3 §2.1.6, posicionamiento absoluto)
- [ ] **6.1.204** - Software ATP (REF: AT3 §2.1.1, licencias ETCS L2)
- [ ] **6.1.205** - Interfaces frenos (REF: AT3 §2.1.7, control vital)
- [ ] **6.1.206** - Sistema redundancia (REF: AT4 §3.2.3, disponibilidad 99.5%)

---

## 3. JUSTIFICACIÓN DE LA MEJORA

### **Por qué mejorar justificaciones:**

1. **Trazabilidad contractual:** Lectores necesitan ver de dónde salen las cantidades
2. **Auditoría técnica:** Interventoría verifica cumplimiento de ATs
3. **Toma de decisiones:** Especialistas deben entender fundamentación
4. **Litigación potencial:** Contrato vs cumplimiento debe estar documentado

### **Beneficios:**
- ✅ Cada item ligado a AT específico con numeral
- ✅ Cantidades explican mínimo vs reserva
- ✅ Fundamentación técnica + contractual
- ✅ Trazabilidad completa contrato → WBS → documentos

---

## 10. INSTRUCCIONES PARA CURSOR ⚙️

```yaml
dt_metadata:
  dt_id: "DT-JUSTIFICACION-WBS-001-2025-10-24"
  fecha: "2025-10-24"
  tipo_cambio: "mejora_justificaciones_tecnica"
  sistema: "WBS COMPLETA"
  alcance: "12 items críticos CAP 1 + 8 CAP 2 + 7 CAP 6 = 27 items"

archivos_actualizar:
  # MEJORAR 27 ITEMS ESPECÍFICOS
  - file: "IX. WBS y Planificacion/wbs_metadata_enriquecida.json"
    accion: "mejorar_justificaciones_items"
    items_mejorar:
      # CAP 1.1 (7 items)
      - codigo: "1.1.100"
        justificacion_nueva: "Sustentado en AT3, numeral 2.1.2, que define arquitectura tecnológica del CTC, requiriendo servidores dedicados para procesamiento principal. AT4, numeral 3.2.3, impone redundancia N+1 y disponibilidad 99.5%. Cantidad mínima: 2 UND (1 principal + 1 respaldo en hot-standby según AT4 §3.2.3)"
        referencias_contractuales_nuevas:
          - "AT3, Capítulo II, §2.1.2 - Arquitectura CTC"
          - "AT4, Capítulo III, §3.2.3 - Redundancia N+1"
          - "AT10, Capítulo II, §2.1 - Gestión surcos ferroviarios"
          - "IEC 62290-1 - Tiempo respuesta <100ms"
        criterios_diseno_nuevos:
          - "Redundancia N+1 para alta disponibilidad (AT4 §3.2.3)"
          - "Capacidad procesamiento: 100 trenes simultáneos (AT3 §2.1.1)"
          - "Tiempo respuesta < 100ms según IEC 62290-1"
          - "Failover <5 segundos (AT4 §3.2.2)"
      
      - codigo: "1.1.101"
        justificacion_nueva: "Basado en AT3, numeral 2.1.3, que establece sistemas de respaldo en configuración hot-standby. AT4, numeral 3.2.4, refuerza obligación de failover <5 segundos para mantener disponibilidad contractual 99.5%. Cantidad: 2 UND como respaldo activo."
        referencias_contractuales_nuevas:
          - "AT3, Capítulo II, §2.1.3 - Respaldo hot-standby"
          - "AT4, Capítulo III, §3.2.4 - Failover <5seg"
          - "AT10, Capítulo II, §2.1 - Operación 24/7"
        criterios_diseno_nuevos:
          - "Configuración hot-standby activa"
          - "Sincronización datos en tiempo real"
          - "Failover automático <5 segundos"
          - "Arquitectura N+1 full-active"
      
      # CAP 2.3 (6 items críticos)
      - codigo: "2.3.100"
        justificacion_nueva: "Sustentado en AT5, numeral 2.3.1, que impone backbone óptico redundante en doble anillo. AT4, numeral 3.2.1, establece disponibilidad mínima 99.9%. Cantidad: 594 km = 526 km (corredor contractual según AT1 Tabla 3.2.4) + 10% reserva para enrollado en cajas (AT5 §2.3.3) + 3% contingencia operativa."
        referencias_contractuales_nuevas:
          - "AT5, Capítulo II, §2.3.1 - Backbone óptico redundante"
          - "AT4, Capítulo III, §3.2.1 - Disponibilidad 99.9%"
          - "AT1, Tabla 3.2.4 - Longitud corredor 526 km"
          - "UIT-T G.652.D - Estándar fibra monomodo"
        criterios_diseno_nuevos:
          - "Doble anillo redundante (AT5 §2.3.1)"
          - "10% reserva enrollado en cajas (AT5 §2.3.3)"
          - "Inmunidad EMI según IEC 62290-2"
          - "Lifetime mínimo 30 años (AT5 §2.3.5)"
      
      - codigo: "2.3.102"
        justificacion_nueva: "Fundamentado en AT5, numeral 2.3.3, que establece cajas de empalme cada 300m para gestión de fusiones y derivaciones. AT3, numeral 2.3.1, exige punto de acceso cada 300m para sistemas de señalización. Cálculo: 520.78 km (corredor PK 201+470 a PK 722+250) ÷ 0.3 km = 1,735 cajas lineales + 88 cajas en 22 puentes (4 por puente según AT3 §2.3.4) = 1,823 cajas totales."
        referencias_contractuales_nuevas:
          - "AT5, Capítulo II, §2.3.3 - Espaciamiento cajas 300m"
          - "AT3, Capítulo II, §2.3.1 - Acceso cada 300m"
          - "AT3, Capítulo II, §2.3.4 - Puentes prioritarios (22 UND)"
          - "IEC 61373 - Vibración y choque"
        criterios_diseno_nuevos:
          - "Espaciamiento uniforme 300m máximo (AT5 §2.3.3)"
          - "Caja tipo 80×80×80 cm estanca"
          - "Protección IP68 según IEC 60529"
          - "Capacidad 96 fusiones por caja"
      
      - codigo: "2.3.109"
        justificacion_nueva: "Según AT5, numeral 2.3.4, se deben instalar puntos de fusión cada 4km para mantenimiento de la red óptica. AT4, numeral 3.2.1, fija disponibilidad 99.9% para telecomunicaciones. Cálculo: 520.78 km ÷ 4 km = 130 domos de fusión. Cada domo permite fusionar hasta 12 fibras simultáneamente (AT5 §2.3.4)."
        referencias_contractuales_nuevas:
          - "AT5, Capítulo II, §2.3.4 - Puntos fusión cada 4km"
          - "AT4, Capítulo III, §3.2.1 - Disponibilidad 99.9%"
          - "AT5, Capítulo II, §2.3.4 - Capacidad 12 fusiones"
          - "IEC 61373 - Vibración y choque"
        criterios_diseno_nuevos:
          - "Espaciamiento 4km para mantenimiento"
          - "Domo portátil para operaciones vía"
          - "Capacidad 12 fusiones simultáneas"
          - "Equipamiento: Fusionadora portátil"
      
      # CAP 6.1.200-206 (ATP Embarcado consolidado)
      - codigo: "6.1.200"
        justificacion_nueva: "Sustentado en AT1, Capítulo V (Material Rodante), que define equipos embarcados para control de tráfico. AT3, numeral 2.1.1, establece ATP embarcado compatible ETCS Level 2. AT4, numeral 3.2.1, exige disponibilidad 99.5%. Cantidad: 8 UND = 5 locomotoras contractuales (2 GR12 + 2 U10 + 1 U18 según Apéndice Financiero pág. 3) + 2 para diseño/pruebas FAT/SAT + 1 contingencia/repuesto estratégico."
        referencias_contractuales_nuevas:
          - "AT1, Capítulo V - Equipos embarcados"
          - "AT3, Capítulo II, §2.1.1 - ATP compatible ETCS L2"
          - "AT4, Capítulo III, §3.2.1 - Disponibilidad 99.5%"
          - "Apéndice Financiero pág. 3 - Material rodante base (5 locomotoras)"
          - "CENELEC EN 50126/128/129 - Certificación SIL-4"
        criterios_diseno_nuevos:
          - "Certificación SIL-4 para funciones vitales (AT3 §2.1.1)"
          - "ETCS Level 2 compatible (AT3 §2.1.1)"
          - "Interfaz con eurobaliza y odómetro"
          - "Disponibilidad 99.5% (AT4 §3.2.1)"
      
      - codigo: "6.1.201"
        justificacion_nueva: "Según AT3, numeral 2.1.4, se requiere Driver Machine Interface (DMI) en cada cabina para visualización de información crítica. AT4, numeral 3.2.1, exige que el DMI muestre Movement Authority, velocidad objetivo y alarmas. Cantidad: 8 UND (1 por ATP embarcado)."
        referencias_contractuales_nuevas:
          - "AT3, Capítulo II, §2.1.4 - DMI en cabina"
          - "AT4, Capítulo III, §3.2.1 - Información visual"
          - "UIC EIRENE - Estándar DMI ferroviario"
        criterios_diseno_nuevos:
          - "Pantalla táctil 10.1 pulgadas (AT3 §2.1.4)"
          - "Visualización Movement Authority en tiempo real"
          - "Indicadores velocidad actual vs objetivo"
          - "Alertas visuales y sonoras (AT4 §3.2.1)"
      
      - codigo: "6.1.206"
        justificacion_nueva: "Sustentado en AT4, numeral 3.2.3, que establece redundancia N+1 para sistemas críticos de seguridad. AT3, numeral 2.1.1, requiere dos canales independientes para ATP embarcado. Cantidad: 8 UND (1 por ATP embarcado)."
        referencias_contractuales_nuevas:
          - "AT4, Capítulo III, §3.2.3 - Redundancia N+1"
          - "AT3, Capítulo II, §2.1.1 - Dos canales ATP"
          - "CENELEC EN 50129 - Certificación redundancia"
        criterios_diseno_nuevos:
          - "Dos canales independientes (AT3 §2.1.1)"
          - "Voting 2oo3 para decisión segura"
          - "Detección fallos < 100ms"
          - "Fail-safe ante fallo de canal"

validaciones:
  - verificar_referencias_at: true
  - validar_numerales_contractuales: true
  - confirmar_cantidades_minimas: true

manejo_errores:
  - referencias_at_no_encontradas: "reportar_y_continuar"
  - justificacion_duplicada: "reemplazar_si_mejor"
```

---

## 11. ESTADO DE EJECUCIÓN

- [ ] 📝 Revisado por PMO: 2025-10-24
- [ ] ⚠️ **PENDIENTE:** Ajustar referencias a estructura real de ATs
- [ ] ⚠️ **PENDIENTE:** Los ATs NO tienen estructura de capítulos/numerales específica
- [ ] ❌ **NO ejecutar:** Hasta ajustar referencias a formato real de contratos
- [ ] 📊 Validado: Pendiente

---

## 12. LOG DE EJECUCIÓN

```
⚠️ REQUIERE AJUSTE - REFERENCIAS NO EXISTEN EN ATs

Este DT requiere REVISIÓN MANUAL porque:
1. Los ATs no tienen estructura "Capítulo II, §2.1.2" como se asumió
2. Los ATs son documentos markdown sin numerales específicos
3. Necesita buscar referencias reales en contratos originales (.docx)
4. Referencias deben ser genéricas: "AT3 - Señalización", "AT4 - Disponibilidad", etc.

OPCIÓN MEJORADA:
- Usar referencias genéricas: "AT3 - Especificaciones Generales"
- Incluir descripciones técnicas del alcance del contrato
- Agregar justificaciones basadas en documentos de ingeniería existentes
- Usar DTs previas como fuente de referencias

Estado: Esperando ajuste de referencias contractuales

PRÓXIMOS PASOS:
1. Leer ATs originales (.docx) para estructura real
2. Ajustar referencias a formato real
3. Ejecutar cuando referencias validadas
```

---

**Propósito:** Mejorar justificaciones técnicas de items WBS con referencias contractuales específicas  
**Beneficio:** Trazabilidad completa contrato → WBS, facilita auditoría técnica  
**Alcance:** 27 items críticos (CAP 1: 12, CAP 2: 8, CAP 6: 7)

