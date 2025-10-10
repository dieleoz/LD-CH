# Script: Generar Cronograma Agresivo 36 Meses + 12 Buffer
# Basado en: @@CRONOGRAMA_AGRESIVO_36M_v1.0.md

Write-Host "Generando Cronograma Agresivo 36m + 12m buffer..." -ForegroundColor Cyan

$cronograma = @{
    proyecto = "APP La Dorada-Chiriguaná - PLAN AGRESIVO"
    estrategia = "36 meses base + 12 meses buffer riesgos"
    fecha_base = "2025-06-01"
    fecha_actual = "2025-10-01"
    mes_actual = 4
    duracion_plan_base_meses = 48
    duracion_buffer_meses = 12
    duracion_total_meses = 60
    fecha_fin_plan = "2029-05-31"
    fecha_fin_buffer = "2030-05-31"
    
    fases = @(
        @{
            id = "F1"
            nombre = "INGENIERÍA"
            mes_inicio = 0
            mes_fin = 12
            duracion_meses = 12
            estado = "EN CURSO"
            avance_pct = 33
            descripcion = "Ingeniería conceptual, básica y de detalle. Aprobación ANI Mes 12."
        },
        @{
            id = "F2"
            nombre = "ADQUISICIONES URGENTES"
            mes_inicio = 12
            mes_fin = 14
            duracion_meses = 2
            estado = "PENDIENTE"
            avance_pct = 0
            descripcion = "Compras paralelas post-aprobación ANI. Lead times 4-12 meses."
        },
        @{
            id = "F3"
            nombre = "OBRA - PREPARACION"
            mes_inicio = 13
            mes_fin = 18
            duracion_meses = 6
            estado = "PENDIENTE"
            avance_pct = 0
            descripcion = "Obras civiles, torres, ductos. Esperar edificio CCO M18."
        },
        @{
            id = "F4"
            nombre = "INSTALACION PRIMARIA"
            mes_inicio = 19
            mes_fin = 26
            duracion_meses = 8
            estado = "PENDIENTE"
            avance_pct = 0
            descripcion = "Fibra, CTC, TETRA. Requiere edificio M18 y MR M20."
        },
        @{
            id = "F5"
            nombre = "INSTALACION SECUNDARIA"
            mes_inicio = 25
            mes_fin = 34
            duracion_meses = 10
            estado = "PENDIENTE"
            avance_pct = 0
            descripcion = "ATP/ITCS, ITS, Embarcados. Requiere MR M20."
        },
        @{
            id = "F6"
            nombre = "INTEGRACION Y PRUEBAS"
            mes_inicio = 32
            mes_fin = 44
            duracion_meses = 13
            estado = "PENDIENTE"
            avance_pct = 0
            descripcion = "FAT, SAT, pruebas integradas, certificación ANI."
        },
        @{
            id = "F7"
            nombre = "PUESTA EN MARCHA"
            mes_inicio = 44
            mes_fin = 48
            duracion_meses = 4
            estado = "PENDIENTE"
            avance_pct = 0
            descripcion = "Operación asistida, capacitación, entrega final."
        },
        @{
            id = "F8"
            nombre = "BUFFER RIESGOS"
            mes_inicio = 49
            mes_fin = 60
            duracion_meses = 12
            estado = "RESERVA"
            avance_pct = 0
            descripcion = "Contingencia para absorber retrasos sin incumplir."
        }
    )
    
    entregas_externas = @(
        @{
            id = "EXT-01"
            nombre = "Edificio CCO Terminado"
            responsable = "ANI / Contratista Civil"
            mes_requerido = 18
            lead_time_meses = 12
            orden_en_mes = 6
            criticidad = "CRÍTICA"
            nota = "SIN EDIFICIO NO SE PUEDE instalar CTC ni servidores. ANI responsable de entrega."
        },
        @{
            id = "EXT-02"
            nombre = "Material Rodante Certificado"
            responsable = "Fenoco / ANI"
            mes_requerido = 20
            lead_time_meses = 9
            orden_en_mes = 11
            criticidad = "CRÍTICA"
            nota = "SIN MATERIAL RODANTE NO SE PUEDE instalar sistemas embarcados (ATP, TETRA, GSM-R)."
        },
        @{
            id = "EXT-03"
            nombre = "Subestaciones Eléctricas"
            responsable = "Operador Red Eléctrica"
            mes_requerido = 16
            lead_time_meses = 8
            orden_en_mes = 8
            criticidad = "ALTA"
            nota = "SIN ENERGÍA NO SE PUEDE operar equipos electrónicos."
        },
        @{
            id = "EXT-04"
            nombre = "Acceso Vía Fenoco"
            responsable = "Fenoco"
            mes_requerido = 14
            criticidad = "ALTA"
            nota = "SIN ACCESO NO SE PUEDE tender fibra ni hacer obras en vía."
        },
        @{
            id = "EXT-05"
            nombre = "Permisos Ambientales"
            responsable = "ANLA"
            mes_requerido = 12
            lead_time_meses = 6
            orden_en_mes = 6
            criticidad = "ALTA"
            nota = "SIN PERMISOS NO SE PUEDE iniciar obras civiles."
        }
    )
    
    hitos = @(
        @{ id = "H1"; nombre = "Aprobacion ANI Disenos"; mes = 12; criticidad = "CRITICA"; responsable = "ANI"; tipo = "Externo" },
        @{ id = "H2"; nombre = "Ordenes Lote 1-2 Emitidas"; mes = 13; criticidad = "ALTA"; responsable = "PMO"; tipo = "Interno" },
        @{ id = "H3"; nombre = "Subestaciones Operativas"; mes = 16; criticidad = "ALTA"; responsable = "Operador Red"; tipo = "Externo" },
        @{ id = "H4"; nombre = "Edificio CCO Entregado"; mes = 18; criticidad = "CRITICA"; responsable = "ANI"; tipo = "Externo" },
        @{ id = "H5"; nombre = "Material Rodante Certificado"; mes = 20; criticidad = "CRITICA"; responsable = "Fenoco"; tipo = "Externo" },
        @{ id = "H6"; nombre = "Fibra en Sitio"; mes = 22; criticidad = "ALTA"; responsable = "Proveedor"; tipo = "Proveedor" },
        @{ id = "H7"; nombre = "ATP/ITCS en Sitio"; mes = 25; criticidad = "CRITICA"; responsable = "Proveedor"; tipo = "Proveedor" },
        @{ id = "H8"; nombre = "Backbone Operativo"; mes = 26; criticidad = "ALTA"; responsable = "Especialista"; tipo = "Interno" },
        @{ id = "H9"; nombre = "Sistemas Embarcados"; mes = 34; criticidad = "ALTA"; responsable = "Especialista"; tipo = "Interno" },
        @{ id = "H10"; nombre = "SAT Completo"; mes = 44; criticidad = "CRITICA"; responsable = "ANI"; tipo = "Externo" },
        @{ id = "H11"; nombre = "Entrega Final"; mes = 48; criticidad = "CRITICA"; responsable = "ANI"; tipo = "Externo" }
    )
    
    ruta_critica = @(
        "M12: Aprobación ANI",
        "M13: Orden ATP/ITCS (12m) + Fibra (9m)",
        "M18: Edificio CCO (EXT-01)",
        "M20: Material Rodante (EXT-02)",
        "M22: Fibra llega",
        "M25: ATP llega",
        "M30: CTC-ATP integrado",
        "M34: Embarcados completos",
        "M44: SAT",
        "M48: ENTREGA FINAL"
    )
    
    restricciones = @(
        "NO instalar CTC sin Edificio CCO (EXT-01 M18)",
        "NO instalar Cámaras sin Fibra+Cableado (M26)",
        "NO ATP embarcado sin Material Rodante (EXT-02 M20)",
        "NO Pruebas integradas sin FATs (M38)",
        "NO SAT sin integración completa (M42)",
        "NO Ordenar compras sin aprobación ANI (M12)"
    )
    
    supuestos = @(
        "Aprobación ANI Mes 12 sin observaciones mayores",
        "Edificio CCO entregado Mes 18 (ANI responsable)",
        "Material Rodante certificado Mes 20 (Fenoco responsable)",
        "Proveedores cumplen lead times exactos",
        "Personal calificado disponible",
        "Clima favorable para obras",
        "Permisos ANLA vigentes Mes 12",
        "Acceso vía Fenoco sin restricciones",
        "Subestaciones operativas Mes 16",
        "Fenoco coordina shutdowns 2 veces/mes",
        "Flujo de caja disponible según cronograma",
        "TRM estable ±10%"
    )
    
    flujo_pagos = @{
        modelo_suministros = @{ anticipo = 30; entrega = 50; instalacion = 10; cierre = 10 }
        modelo_obras = @{ anticipo = 10; avance_50 = 40; avance_100 = 40; liquidacion = 10 }
        total_proyecto_cop = 264901000000
        fases = @(
            @{ fase = "Ingenieria"; meses = "0-12"; monto = 26490000000; pct = 10 },
            @{ fase = "Anticipos 30pct"; meses = "13-14"; monto = 67470000000; pct = 25 },
            @{ fase = "Infraestructura"; meses = "15-18"; monto = 26490000000; pct = 10 },
            @{ fase = "Entregas 50pct"; meses = "19-26"; monto = 112450000000; pct = 43 },
            @{ fase = "Instalacion 10pct"; meses = "27-34"; monto = 22490000000; pct = 8 },
            @{ fase = "Cierre 10pct"; meses = "35-48"; monto = 9511000000; pct = 4 }
        )
    }
    
    buffer_riesgos = @{
        meses_disponibles = 12
        uso_estimado = @(
            @{ riesgo = "Retraso aprobación ANI"; probabilidad = 40; meses_buffer = 2 },
            @{ riesgo = "Retraso entrega CCO (EXT-01)"; probabilidad = 50; meses_buffer = 3 },
            @{ riesgo = "Retraso Material Rodante (EXT-02)"; probabilidad = 30; meses_buffer = 2 },
            @{ riesgo = "Retraso ATP/ITCS (12m lead)"; probabilidad = 60; meses_buffer = 3 },
            @{ riesgo = "Integración CTC-ATP"; probabilidad = 50; meses_buffer = 2 }
        )
    }
    
    total_actividades = 0
    actividades = @()
}

# Guardar
$cronograma | ConvertTo-Json -Depth 15 | Set-Content "IX. WBS y Planificacion\cronograma_datos.json" -Encoding UTF8

# Generar JS
$fecha = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$jsContent = @"
// Cronograma Agresivo 36m + 12m buffer
// Generado: $fecha
// Fuente: Análisis PMO + Contrato + WBS

window.cronogramaData = $($cronograma | ConvertTo-Json -Depth 15 -Compress);
"@

$jsContent | Set-Content "IX. WBS y Planificacion\cronograma_datos.js" -Encoding UTF8

Write-Host "[OK] Cronograma Agresivo generado" -ForegroundColor Green
Write-Host "Fases: $($cronograma.fases.Count) (8 con buffer)" -ForegroundColor White
Write-Host "Hitos: $($cronograma.hitos.Count)" -ForegroundColor White
Write-Host "Entregas Externas: $($cronograma.entregas_externas.Count)" -ForegroundColor Yellow
Write-Host "Duración: 48m + 12m buffer = 60m total" -ForegroundColor White

