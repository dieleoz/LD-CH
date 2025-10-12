# 🏗️ PLAN DE IMPLEMENTACIÓN: Layout Dinámico Completo

**Proyecto:** APP La Dorada - Chiriguaná  
**Versión:** Sistema Integrado v15.0  
**Fecha:** 11 de Octubre 2025  
**Alcance:** Sistema completo de layout dinámico con recálculo automático  

---

## 🎯 **VISIÓN: Lo que quieres (Entendido perfectamente)**

No quieres una tabla plana de equipos. Quieres:

### **Sistema Integral de Mapeo Dinámico:**

```
LAYOUT DINÁMICO = Base de Datos Georreferenciada del Proyecto

ORGANIZADO POR:
├─ TIPO (Edificación, Infraestructura, Sistemas)
│  ├─ INSTALACIÓN (Estación México, Puente Magdalena, etc.)
│  │  ├─ EQUIPO 1 (Torre TETRA)
│  │  ├─ EQUIPO 2 (Subestación)
│  │  ├─ EQUIPO 3 (UPS)
│  │  └─ ...
│  └─ ...

CONECTADO CON DTs:
- DT cambia cantidad → Layout RECALCULA ubicaciones
- DT cambia criterio → Layout REDISTRIBUYE equipos
- DT agrega sistema → Layout GENERA "kit" completo

AYUDA A COMPLETAR DISEÑO:
- "¿Cuántas estaciones tengo?" → 26
- "¿Dónde están?" → PK con mapa
- "¿Qué tiene cada estación?" → Lista de equipos por estación
- "¿Faltan equipos?" → Validación vs DTs
```

---

## 📊 **ESTRUCTURA PROPUESTA:**

### **1. Base de Datos Jerárquica:**

```javascript
{
  "instalaciones": [
    {
      "id": "EST-MEXICO-001",
      "tipo": "EDIFICACION",
      "subtipo": "Estacion_Principal",
      "nombre": "Estación México",
      "ufv": "UFV23",
      "pk": "201+470",
      "coordenadas": { "lat": "TBD", "lon": "TBD" },
      
      "equipos": [
        {
          "id": "ESTACION_MEXICO",
          "categoria": "Edificio",
          "dispositivo": "Estación Principal",
          "descripcion": "Estación Terminal"
        },
        {
          "id": "EBT_01_MEXICO",
          "categoria": "Telecomunicaciones",
          "dispositivo": "TETRA BS",
          "descripcion": "Estación Base TETRA 01",
          "switch": "SWA_MEX_01",
          "tipo_its": "TIPO 5"
        },
        {
          "id": "SE_MEXICO",
          "categoria": "Energia",
          "dispositivo": "Subestación MT/BT",
          "descripcion": "Subestación Eléctrica",
          "potencia": "TBD kVA"
        },
        {
          "id": "SAI_MEXICO",
          "categoria": "Energia",
          "dispositivo": "UPS 40kVA",
          "descripcion": "Sistema Alimentación Ininterrumpida",
          "autonomia": "2 horas"
        },
        {
          "id": "CTC_MEXICO",
          "categoria": "Control",
          "dispositivo": "CTC Local",
          "descripcion": "Puesto Control CTC",
          "switch": "SWA_MEX_01"
        },
        {
          "id": "RBC_01_MEXICO",
          "categoria": "Control",
          "dispositivo": "RBC ETCS L2",
          "descripcion": "Radio Block Center 01",
          "area_control": "PK201-PK340"
        },
        {
          "id": "CCTV_MEX_01",
          "categoria": "Seguridad_ITS",
          "dispositivo": "CCTV PTZ",
          "descripcion": "Cámara Entrada Estación",
          "ubicacion_especifica": "PK201+500 Derecha"
        },
        {
          "id": "CCTV_MEX_02",
          "categoria": "Seguridad_ITS",
          "dispositivo": "CCTV Fija",
          "descripcion": "Cámara Andén Norte",
          "ubicacion_especifica": "PK201+550 Izquierda"
        },
        {
          "id": "CCTV_MEX_03",
          "categoria": "Seguridad_ITS",
          "dispositivo": "CCTV Fija",
          "descripcion": "Cámara Andén Sur",
          "ubicacion_especifica": "PK201+600 Derecha"
        },
        {
          "id": "NODO_FO_MEXICO",
          "categoria": "Telecomunicaciones",
          "dispositivo": "ODF 48 hilos",
          "descripcion": "Nodo Fibra Óptica",
          "switch": "SWA_MEX_01"
        },
        {
          "id": "DESVIO_MEX_01",
          "categoria": "Via",
          "dispositivo": "Desvío Motorizado",
          "descripcion": "Desvío Apartadero",
          "ubicacion_especifica": "PK201+600 Derecha"
        }
      ],
      
      "resumen_equipos": {
        "total": 11,
        "por_categoria": {
          "Edificio": 1,
          "Telecomunicaciones": 2,
          "Energia": 2,
          "Control": 2,
          "Seguridad_ITS": 3,
          "Via": 1
        }
      },
      
      "origen_dt": ["DT-TETRA-001", "DT-CTC-001"],
      "estado": "Diseñado",
      "fase_construccion": "Lote 2.1 - 27 meses"
    },
    
    // 25 estaciones más...
    
    {
      "id": "PTE-MAGDALENA-001",
      "tipo": "INFRAESTRUCTURA",
      "subtipo": "Puente_Prioritario",
      "nombre": "Puente Río Magdalena",
      "ufv": "UFV02",
      "pk_inicio": "332+230",
      "pk_fin": "332+817",
      "longitud_m": 587,
      
      "equipos": [
        {
          "id": "CCTV_MAG_01",
          "categoria": "Seguridad_ITS",
          "dispositivo": "CCTV PTZ",
          "descripcion": "Cámara Puente Entrada Norte",
          "ubicacion_especifica": "PK332+230 Derecha"
        },
        // 4 cámaras más...
        {
          "id": "DETECTOR_SISMICO_MAG_01",
          "categoria": "Seguridad_ITS",
          "dispositivo": "Detector Sísmico",
          "descripcion": "Detector Sísmico",
          "ubicacion_especifica": "PK332+400 Centro"
        },
        {
          "id": "DETECTOR_SOCAVACION_MAG",
          "categoria": "Seguridad_ITS",
          "dispositivo": "Detector Socavación",
          "descripcion": "Detector Socavación",
          "ubicacion_especifica": "PK332+500 Centro"
        }
      ],
      
      "resumen_equipos": {
        "total": 9,
        "por_categoria": {
          "Seguridad_ITS": 7,
          "Senalizacion": 2
        }
      },
      
      "criticidad": "ALTA",
      "requiere_monitoreo_24_7": true
    }
  ],
  
  "sistemas_distribuidos": [
    {
      "sistema": "Red_TETRA",
      "tipo": "TELECOMUNICACIONES",
      "cantidad_nodos": 37,
      "distribucion": "Cada 12 km con 20% solapamiento",
      "cobertura": "99% del corredor",
      
      "criterios_diseño": {
        "radio_cobertura_km": 15,
        "solapamiento_pct": 20,
        "distancia_efectiva_km": 12,
        "origen_dt": "DT-TETRA-001"
      },
      
      "nodos": [
        { "id": "EBT_01", "pk": "201+470", "ufv": "UFV23", "instalacion_asociada": "EST-MEXICO-001" },
        { "id": "EBT_02", "pk": "236+439", "ufv": "UFV23", "instalacion_asociada": "EST-LA-MIEL-002" },
        // 35 nodos más...
      ]
    }
  ]
}
```

---

## 🔄 **FLUJO COMPLETO CON DT:**

### **Ejemplo: DT-TETRA-030 (Solapamiento 20% → 30%)**

```
PASO 1: DT creada con YAML extendido
───────────────────────────────────────
layout_recalcular:
  activar: true
  sistema: "Red_TETRA"
  parametro_cambio: "solapamiento_pct"
  valor_anterior: 20
  valor_nuevo: 30
  
  recalculo_automatico:
    distancia_anterior_km: 12
    distancia_nueva_km: 10.42
    cantidad_anterior: 37
    cantidad_nueva: 57
    pk_inicio: "201+470"
    pk_fin: "722+250"
    
  generar_instalaciones_nuevas: true
  kit_por_instalacion:
    - Torre_TETRA
    - Subestacion_pequena (si es intermedia)
    - UPS_basico
    - Switch_acceso
    
    
PASO 2: Cursor ejecuta DT
───────────────────────────────────────
1. Actualiza 6 niveles actuales
2. NUEVO: Ejecuta recalcular_layout_completo.ps1
   
   a) Lee layout.json jerárquico
   
   b) Encuentra sistema "Red_TETRA"
      Nodos actuales: 37
   
   c) Aplica nuevo criterio:
      Distancia = 594 km ÷ (1 - 0.30) = 594 ÷ 0.70 = 848.57 km efectivos
      Nodos = 848.57 ÷ 15 km = 56.6 ≈ 57 nodos
   
   d) GENERA 20 nuevas instalaciones TETRA:
      Para cada nueva instalación:
        - Calcula PK óptimo (distribuido uniformemente)
        - Identifica UFV correspondiente
        - Crea ID: EBT_[numero]
        - Genera "kit" de equipos:
          * Torre TETRA (dispositivo principal)
          * Subestación pequeña (si es intermedia)
          * UPS 10kVA
          * Switch acceso SWA_[UBICACION]_01
   
   e) INSERTA en layout.json:
      20 nuevas instalaciones con 4 equipos c/u = 80 equipos nuevos
   
   f) VERSIONA: layout v1.1 → v1.2
   
   g) REGENERA archivos derivados:
      - layout.md (Markdown plano para backup)
      - layout_data.json (datos puros)
      - WBS_Layout_Maestro.html (interfaz visual)


PASO 3: Layout "pintado" en WBS
───────────────────────────────────────
WBS_Layout_Maestro.html ahora muestra:

Vista 1: Por Instalación
  Estación México (11 equipos)
  Estación La Miel (8 equipos)
  ...
  Nueva Estación Intermedia 01 (4 equipos) ← NUEVA
  Nueva Estación Intermedia 02 (4 equipos) ← NUEVA
  ...

Vista 2: Por Sistema
  Red TETRA: 57 nodos (antes 37) ← ACTUALIZADO
    - 26 en estaciones principales
    - 31 en ubicaciones intermedias ← NUEVAS

Vista 3: Mapa PK
  Timeline visual con marcadores en cada PK


PASO 4: Documentos servidos coherentes
───────────────────────────────────────
Word/HTML generados contienen:
  Descripción: "57 estaciones TETRA con 30% solapamiento"
  Layout inyectado: 57 ubicaciones con PKs calculados
  TODO coherente ✅
```

---

## 🛠️ **COMPONENTES A IMPLEMENTAR:**

### **Componente 1: Layout Jerárquico (JSON Maestro)**

**Archivo:** `VIII/LAYOUT_JERARQUICO_v1.0.json`

**Estructura:**
```json
{
  "metadata": {
    "proyecto": "APP La Dorada-Chiriguaná",
    "version": "1.2",
    "fecha_actualizacion": "2025-10-11",
    "origen_dts": ["DT-TETRA-001", "DT-CTC-001", "DT-TETRA-030"],
    "total_instalaciones": 46,
    "total_equipos": 480
  },
  
  "instalaciones": {
    "edificaciones": [ /* 26 estaciones */ ],
    "infraestructura": [ /* 4 puentes + CCO + talleres */ ],
    "nodos_distribuidos": [ /* 57 TETRA, 40 empalmes FO, etc. */ ]
  },
  
  "plantillas_equipos": {
    "KIT_ESTACION_PRINCIPAL": [
      "Edificio_Estacion",
      "Torre_TETRA",
      "Subestacion_MT_BT",
      "UPS_40kVA",
      "CTC_Local",
      "Nodo_FO_48_hilos",
      "Camaras_CCTV_x3",
      "Control_Acceso",
      "Desvios_Motorizados_x2"
    ],
    
    "KIT_ESTACION_INTERMEDIA": [
      "Torre_TETRA",
      "UPS_10kVA",
      "Switch_Acceso",
      "Camara_CCTV_x1"
    ],
    
    "KIT_PUENTE_PRIORITARIO": [
      "Camaras_CCTV_PTZ_x4-6",
      "Detector_Sismico",
      "Detector_Socavacion",
      "Senalizacion_Proteccion_x2",
      "Iluminacion_Perimetral"
    ]
  }
}
```

---

### **Componente 2: Script de Recálculo Automático**

**Archivo:** `scripts/recalcular_layout_desde_DT.ps1`

**Lógica:**

```powershell
param(
    [string]$DT_Path
)

# 1. PARSEAR DT
$dt = Get-Content $DT_Path -Raw
$yamlMatch = $dt -match '(?s)```yaml\s+(.+?)```'
$yaml = Parse-Yaml($yamlMatch)

# 2. DETECTAR CAMBIOS QUE AFECTAN LAYOUT
if ($yaml.layout_recalcular.activar) {
    
    $sistema = $yaml.layout_recalcular.sistema  # Ej: "Red_TETRA"
    $cantidadNueva = $yaml.layout_recalcular.cantidad_nueva  # Ej: 57
    
    # 3. RECALCULAR DISTRIBUCIÓN
    $pkInicio = 201.470
    $pkFin = 722.250
    $distanciaTotal = $pkFin - $pkInicio  # 520.78 km
    
    $distanciaPorNodo = $distanciaTotal / $cantidadNueva
    # = 520.78 / 57 = 9.14 km por nodo
    
    # 4. GENERAR NUEVAS UBICACIONES
    $nuevosNodos = @()
    $pkActual = $pkInicio
    
    for ($i = 1; $i -le $cantidadNueva; $i++) {
        $ufv = Calcular-UFV-Desde-PK($pkActual)
        $esEstacionPrincipal = Es-Estacion-Principal($pkActual)
        
        $nodo = @{
            ID = "EBT_$($i.ToString('00'))"
            PK = Format-PK($pkActual)
            UFV = $ufv
            Tipo = if ($esEstacionPrincipal) { "Estacion_Principal" } else { "Nodo_Intermedio" }
            Equipos = if ($esEstacionPrincipal) { $KIT_ESTACION_PRINCIPAL } else { $KIT_NODO_INTERMEDIO }
        }
        
        $nuevosNodos += $nodo
        $pkActual += $distanciaPorNodo
    }
    
    # 5. ACTUALIZAR LAYOUT JERARQUICO
    $layoutJson = Get-Content "VIII/LAYOUT_JERARQUICO_v1.0.json" | ConvertFrom-Json
    $layoutJson.sistemas_distribuidos.Red_TETRA.nodos = $nuevosNodos
    $layoutJson.metadata.version = "v1.2"
    $layoutJson | ConvertTo-Json -Depth 10 | Out-File "VIII/LAYOUT_JERARQUICO_v1.0.json"
    
    # 6. REGENERAR DERIVADOS
    .\scripts\generar_layout_md_desde_json.ps1
    .\scripts\generar_wbs_layout_visual.ps1
}
```

---

### **Componente 3: Vista Visual Mejorada (3 pestañas)**

**Archivo:** `WBS_Layout_Maestro.html` mejorado

**Vista 1: Por Instalación (Jerárquica)**
```
EDIFICACIONES (26 instalaciones)
├─ [Expandir] Estación México (PK 201+470) - 11 equipos
│  ├─ Edificio Principal
│  ├─ Torre TETRA (EBT_01)
│  ├─ Subestación (SE_MEXICO)
│  ├─ UPS 40kVA
│  ├─ CTC Local
│  ├─ RBC_01
│  ├─ Cámaras CCTV (3)
│  ├─ Nodo FO
│  └─ Desvíos (2)
│
├─ [Expandir] Estación Puerto Triunfo (PK 250+133) - 10 equipos
│  ...

INFRAESTRUCTURA (6 instalaciones)
├─ [Expandir] Puente Río Magdalena (PK 332+230-817) - 9 equipos
│  ├─ Cámaras CCTV PTZ (5)
│  ├─ Detector Sísmico (1)
│  ├─ Detector Socavación (1)
│  └─ Señalización (2)
│
├─ [Expandir] CCO Principal B/Bermejo (PK 441+932) - 40+ equipos
   ...

SISTEMAS DISTRIBUIDOS
├─ Red TETRA: 57 nodos distribuidos cada 9.14 km
├─ Red Fibra Óptica: 40 empalmes cada 10 km
└─ Sistema Eléctrico: 11 subestaciones
```

**Vista 2: Por Sistema Distribuido (Timeline)**
```
Red TETRA (57 nodos):
[==●====●====●====●====●====●====●====●====●====●==]
PK201  220  240  260  280  300  320  340  ... 722

Cada ● = Nodo TETRA
Click en ● → Muestra: EBT_XX, PK, UFV, Kit de equipos
```

**Vista 3: Por UFV (Geográfica)**
```
UFV23 (PK 201-223): 45 equipos
UFV30 (PK 250-269): 38 equipos
UFV31 (PK 269-313): 52 equipos
...
```

---

### **Componente 4: Kits de Equipos por Instalación**

**Cuando DT agrega una estación nueva:**

```yaml
# En DT-TETRA-030:
instalaciones_generar:
  - tipo: "Nodo_Intermedio_TETRA"
    cantidad: 20
    ubicaciones: "calcular_automaticamente"
    
    kit_equipos:
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
        cantidad: 1
        nomenclatura: "CCTV_[UBICACION]_01"
```

**Resultado:** 20 nuevas instalaciones × 4 equipos = 80 equipos generados automáticamente

---

## 📊 **BENEFICIOS DEL SISTEMA COMPLETO:**

| Pregunta | Sin Sistema | Con Sistema Completo |
|:---------|:------------|:---------------------|
| **¿Cuántas estaciones?** | Buscar en Excel manualmente | Click pestaña "Edificaciones" → 26 |
| **¿Dónde están?** | Leer layout.md línea por línea | Mapa visual con marcadores PK |
| **¿Qué tiene cada estación?** | Buscar equipos asociados manual | Click "Expandir" → Ver kit completo |
| **¿Cambio solapamiento TETRA?** | Recalcular manual, actualizar Excel | DT ejecuta → Recalcula automático |
| **¿Falta algún equipo?** | Comparar docs vs layout manual | Script valida: "Falta UPS en estación X" |
| **¿Cuántos puentes y dónde?** | Buscar en docs + Excel | Vista "Infraestructura" → 4 puentes con mapa |

---

## 🚀 **LO QUE VOY A IMPLEMENTAR AHORA:**

### **Fase 1: Validación y Limpieza (1 hora)**

✅ Script: `validar_layout_vs_DTs.ps1`  
✅ Genera reporte de inconsistencias  
✅ Propone limpieza de layout.md  

### **Fase 2: Estructura Jerárquica (2 horas)**

✅ Crear: `LAYOUT_JERARQUICO_v1.0.json`  
✅ Agrupar por: Tipo → Instalación → Equipos  
✅ Definir kits estándar por tipo de instalación  

### **Fase 3: Recálculo Automático (2 horas)**

✅ Script: `recalcular_layout_desde_DT.ps1`  
✅ Calcula ubicaciones según criterios  
✅ Genera "kits" completos automáticamente  

### **Fase 4: Vista Visual Mejorada (1 hora)**

✅ WBS_Layout_Maestro.html con 3 pestañas:  
  - Por Instalación (jerárquica, expandible)
  - Por Sistema (timeline visual)
  - Por UFV (geográfica)

### **Fase 5: Integración Completa (1 hora)**

✅ Modificar servir.ps1 v2.1  
✅ Agregar validación pre-servir  
✅ Documentar flujo completo  

**TIEMPO TOTAL:** 7 horas  
**RESULTADO:** Sistema completo dinámico

---

## 🎯 **¿EMPIEZO CON LA IMPLEMENTACIÓN COMPLETA?**

Voy a crear:
1. ✅ Script de validación (identifica qué sobra/falta)
2. ✅ Layout jerárquico JSON
3. ✅ Script de recálculo automático
4. ✅ Vista visual mejorada (3 pestañas)
5. ✅ Integración con servir.ps1

**¿Procedo con la implementación completa del sistema?** 🚀

Este será el **verdadero** sistema de layout que imaginaste: dinámico, inteligente, jerárquico, y conectado con todo el flujo de DTs.
