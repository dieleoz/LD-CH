# Script: Generar Cronograma PMO Realista
# Basado en: @@CRONOGRAMA_MAESTRO_PMO_v1.0.md
# Estructura: 12m ingenier\u00eda + 49m obra = 61m total

Write-Host "Generando Cronograma PMO Realista..." -ForegroundColor Cyan

# Leer WBS
$wbs = Get-Content "IX. WBS y Planificacion\datos_wbs_TODOS_items.json" | ConvertFrom-Json

# Estructura base
$cronograma = @{
    proyecto = "APP La Dorada-Chiriguana"
    fecha_base = "2025-06-01"  # Mes 0 (hace 4 meses desde hoy Oct)
    fecha_actual = "2025-10-01"  # Mes 4 (HOY)
    mes_actual = 4
    duracion_total_meses = 61
    fecha_fin = "2030-06-30"  # Mes 61
    
    fases = @(
        @{
            nombre = "FASE 1: INGENIER\u00cdA"
            mes_inicio = 0
            mes_fin = 12
            duracion_meses = 12
            estado = "EN CURSO"
            avance_pct = 33
            descripcion = "Ingenier\u00eda conceptual, b\u00e1sica y de detalle. Aprobaci\u00f3n ANI Mes 12."
        },
        @{
            nombre = "FASE 2: ADQUISICIONES"
            mes_inicio = 12
            mes_fin = 25
            duracion_meses = 13
            estado = "PENDIENTE"
            avance_pct = 0
            descripcion = "Compras escalonadas post-aprobaci\u00f3n ANI. Lead times 3-12 meses."
        },
        @{
            nombre = "FASE 3: OBRA - Preparaci\u00f3n Sitio"
            mes_inicio = 13
            mes_fin = 18
            duracion_meses = 6
            estado = "PENDIENTE"
            avance_pct = 0
            descripcion = "Obras civiles, torres, rutas fibra. Sin equipos a\u00fan."
        },
        @{
            nombre = "FASE 4: OBRA - Instalaci\u00f3n Primaria"
            mes_inicio = 19
            mes_fin = 28
            duracion_meses = 10
            estado = "PENDIENTE"
            avance_pct = 0
            descripcion = "Instalaci\u00f3n servidores, fibra, TETRA, material rodante."
        },
        @{
            nombre = "FASE 5: OBRA - Instalaci\u00f3n Secundaria"
            mes_inicio = 25
            mes_fin = 40
            duracion_meses = 16
            estado = "PENDIENTE"
            avance_pct = 0
            descripcion = "ATP/ITCS, integraci\u00f3n sistemas, ITS, embarcados."
        },
        @{
            nombre = "FASE 6: PRUEBAS Y COMISIONAMIENTO"
            mes_inicio = 35
            mes_fin = 55
            duracion_meses = 20
            estado = "PENDIENTE"
            avance_pct = 0
            descripcion = "FAT, SAT, pruebas integradas, certificaciones."
        },
        @{
            nombre = "FASE 7: PUESTA EN MARCHA"
            mes_inicio = 55
            mes_fin = 61
            duracion_meses = 6
            estado = "PENDIENTE"
            avance_pct = 0
            descripcion = "Operaci\u00f3n asistida, capacitaci\u00f3n, ajustes finales."
        }
    )
    
    hitos = @(
        @{ nombre = "H1: Aprobaci\u00f3n ANI Dise\u00f1os"; mes = 12; criticidad = "CR\u00cdTICA"; estado = "PENDIENTE" },
        @{ nombre = "H2: \u00d3rdenes Compra Lote 1 Emitidas"; mes = 13; criticidad = "CR\u00cdTICA"; estado = "PENDIENTE" },
        @{ nombre = "H3: Fibra en Sitio"; mes = 22; criticidad = "ALTA"; estado = "PENDIENTE" },
        @{ nombre = "H4: ATP/ITCS en Sitio"; mes = 25; criticidad = "CR\u00cdTICA"; estado = "PENDIENTE" },
        @{ nombre = "H5: CTC-ATP Integrado"; mes = 32; criticidad = "CR\u00cdTICA"; estado = "PENDIENTE" },
        @{ nombre = "H6: FATs Completados"; mes = 40; criticidad = "ALTA"; estado = "PENDIENTE" },
        @{ nombre = "H7: SAT Completo"; mes = 55; criticidad = "CR\u00cdTICA"; estado = "PENDIENTE" },
        @{ nombre = "H8: Entrega Final"; mes = 61; criticidad = "CR\u00cdTICA"; estado = "PENDIENTE" }
    )
    
    ruta_critica = @(
        "Aprobaci\u00f3n ANI (M12)",
        "Orden ATP/ITCS (M13)",
        "Llegada ATP/ITCS (M25)",
        "Instalaci\u00f3n ATP (M25-32)",
        "Integraci\u00f3n CTC-ATP (M32-40)",
        "Pruebas integradas (M40-48)",
        "SAT completo (M48-55)",
        "Puesta en marcha (M55-61)"
    )
    
    actividades = @()
    
    supuestos_cronograma = @(
        "Aprobaci\u00f3n ANI Mes 12 sin observaciones mayores",
        "Lead times seg\u00fan benchmark industria (\u00b115%)",
        "Proveedores cumplen tiempos contractuales",
        "Flujo de caja disponible seg\u00fan cronograma",
        "Personal calificado disponible en fechas",
        "No cambios normativos durante ejecuci\u00f3n",
        "Clima no afecta >10% cronograma",
        "Fenoco coordina shutdowns para pruebas"
    )
    
    riesgos_cronograma = @(
        @{ id = "R-CRONO-001"; descripcion = "ATP/ITCS lead time 12m"; probabilidad = "ALTA"; impacto = "CR\u00cdTICO"; exposicion = 4.8 },
        @{ id = "R-CRONO-002"; descripcion = "Fibra lead time 9m"; probabilidad = "ALTA"; impacto = "ALTO"; exposicion = 4.2 },
        @{ id = "R-CRONO-003"; descripcion = "Integraci\u00f3n CTC-ATP"; probabilidad = "MEDIA"; impacto = "ALTO"; exposicion = 3.5 },
        @{ id = "R-CRONO-004"; descripcion = "Aprobaci\u00f3n ANI Mes 12"; probabilidad = "MEDIA"; impacto = "CR\u00cdTICO"; exposicion = 4.0 }
    )
    
    flujo_pagos = @{
        modelo_suministros = @{ anticipo = 30; entrega = 50; instalacion = 10; cierre = 10 }
        modelo_obras = @{ anticipo = 10; avance_50 = 40; avance_100 = 40; liquidacion = 10 }
        total_proyecto_cop = 264901000000
        desembolso_mes_promedio = 4343000000
    }
    
    total_actividades = 0
}

# Guardar
$cronograma | ConvertTo-Json -Depth 10 | Set-Content "IX. WBS y Planificacion\cronograma_datos.json" -Encoding UTF8

# Generar JS
$fecha = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$jsContent = @"
// Cronograma PMO generado autom\u00e1ticamente
// Fecha: $fecha
// Fuente: An\u00e1lisis PMO basado en contrato + WBS

window.cronogramaData = $($cronograma | ConvertTo-Json -Depth 10 -Compress);
"@

$jsContent | Set-Content "IX. WBS y Planificacion\cronograma_datos.js" -Encoding UTF8

Write-Host "[OK] Cronograma PMO generado" -ForegroundColor Green
Write-Host "Fases: $($cronograma.fases.Count)" -ForegroundColor White
Write-Host "Hitos: $($cronograma.hitos.Count)" -ForegroundColor White
Write-Host "Duraci\u00f3n total: 61 meses" -ForegroundColor White

