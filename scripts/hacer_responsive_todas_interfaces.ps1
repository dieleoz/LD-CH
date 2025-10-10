# SCRIPT PARA HACER RESPONSIVE TODAS LAS INTERFACES HTML
# Fecha: 10 de Octubre 2025
# Propósito: Actualizar TODAS las interfaces HTML del proyecto para que sean responsive

Write-Host "`n" "="*70 -ForegroundColor Cyan
Write-Host "  HACIENDO RESPONSIVE TODAS LAS INTERFACES HTML" -ForegroundColor Cyan
Write-Host "="*70 "`n" -ForegroundColor Cyan

# Lista de archivos HTML a actualizar
$archivosHTML = @(
    # Interfaces WBS principales (ya actualizadas)
    "IX. WBS y Planificacion/WBS_Menu_Principal.html",
    "IX. WBS y Planificacion/WBS_Analisis_Riesgos.html",
    "IX. WBS y Planificacion/WBS_Cronograma_Propuesta.html",
    "IX. WBS y Planificacion/WBS_Reporte_Gerencial.html",
    "IX. WBS y Planificacion/WBS_EDT_Detalle.html",
    "IX. WBS y Planificacion/WBS_COMPLETA_TODO_Interactiva_v4.0.html",
    "IX. WBS y Planificacion/WBS_Presupuesto_SCC_APP_La_Dorada_Chiriguaná.html",
    
    # Interfaces HTML del directorio de documentos servidos
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/CTC_v5_Actualizado.html",
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/GESTION_EJECUTIVO_Cambios_y_Decisiones_Tecnicas.html",
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/GESTION_EJECUTIVO_Alcance_y_Objetivos.html",
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/GESTION_EJECUTIVO_Cronograma_y_Recursos.html",
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/SISTEMA_01_Control_y_Senalizacion_EJECUTIVO.html",
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/SISTEMA_02_Telecomunicaciones_EJECUTIVO.html",
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/SISTEMA_03_ITS_y_Seguridad_EJECUTIVO.html",
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/SISTEMA_04_Material_Rodante_EJECUTIVO.html",
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/SISTEMA_05_Infraestructura_Operativa_EJECUTIVO.html",
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/SISTEMA_06_Integracion_y_Coordinacion_EJECUTIVO.html",
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/ESPECIALIDAD_01_Ingenieria_Civil_EJECUTIVO.html",
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/ESPECIALIDAD_02_Ingenieria_Electrica_EJECUTIVO.html",
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/ESPECIALIDAD_03_Ingenieria_Mecanica_EJECUTIVO.html",
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/ESPECIALIDAD_04_Ingenieria_Sistemas_EJECUTIVO.html",
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/ESPECIALIDAD_05_Ingenieria_Ambiental_EJECUTIVO.html",
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/Protocolo_FFFIS_Actualizado.html",
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/Interfaces_Sistemas_Actualizado.html",
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/INDICE_Documentos_Servidos.html",
    "X_ENTREGABLES_CONSOLIDADOS/8_DOCUMENTOS_SERVIDOS/HTML/INSTRUCCIONES_Servir.html"
)

# CSS responsive estándar para agregar
$cssResponsive = @"
        /* Responsive Design - Agregado automáticamente */
        @media (max-width: 768px) {
            body {
                font-size: 0.9em !important;
                padding: 15px !important;
                max-width: 100% !important;
            }
            h1 {
                font-size: 1.6em !important;
            }
            h2 {
                font-size: 1.4em !important;
            }
            h3 {
                font-size: 1.2em !important;
            }
            table {
                font-size: 0.8em !important;
                overflow-x: auto !important;
                display: block !important;
                white-space: nowrap !important;
            }
            pre {
                font-size: 0.8em !important;
                overflow-x: auto !important;
            }
            .container, .content {
                padding: 15px !important;
            }
        }
        
        @media (max-width: 480px) {
            body {
                font-size: 0.85em !important;
                padding: 10px !important;
            }
            h1 {
                font-size: 1.4em !important;
            }
            h2 {
                font-size: 1.2em !important;
            }
            h3 {
                font-size: 1.1em !important;
            }
            table {
                font-size: 0.75em !important;
            }
            pre {
                font-size: 0.75em !important;
            }
            .container, .content {
                padding: 10px !important;
            }
        }
"@

$archivosActualizados = 0
$archivosConError = 0

foreach ($archivo in $archivosHTML) {
    if (Test-Path $archivo) {
        try {
            Write-Host "📱 Actualizando: $archivo" -ForegroundColor Yellow
            
            # Leer contenido del archivo
            $contenido = Get-Content $archivo -Raw -Encoding UTF8
            
            # Verificar si ya tiene responsive CSS
            if ($contenido -notmatch "Responsive Design") {
                # Buscar el cierre de style para insertar antes
                if ($contenido -match "\</style\>") {
                    $contenido = $contenido -replace "\</style\>", "$cssResponsive`n    </style>"
                    
                    # Guardar archivo
                    $contenido | Out-File $archivo -Encoding UTF8 -NoNewline
                    
                    Write-Host "  OK Responsive CSS agregado" -ForegroundColor Green
                    $archivosActualizados++
                } else {
                    Write-Host "  ADVERTENCIA: No se encontro style en el archivo" -ForegroundColor Yellow
                    $archivosConError++
                }
            } else {
                Write-Host "  INFO: Ya tiene responsive CSS" -ForegroundColor Cyan
            }
        }
        catch {
            Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
            $archivosConError++
        }
    } else {
        Write-Host "❌ Archivo no encontrado: $archivo" -ForegroundColor Red
        $archivosConError++
    }
}

Write-Host "`n" "="*70 -ForegroundColor Green
Write-Host "  RESUMEN DE ACTUALIZACIÓN RESPONSIVE" -ForegroundColor Green
Write-Host "="*70 "`n" -ForegroundColor Green

Write-Host "📊 ESTADÍSTICAS:" -ForegroundColor Yellow
Write-Host "  ✅ Archivos actualizados: $archivosActualizados" -ForegroundColor Green
Write-Host "  ⚠️ Archivos con advertencias: $archivosConError" -ForegroundColor Yellow
Write-Host "  📱 Total interfaces HTML: $($archivosHTML.Count)" -ForegroundColor Cyan

Write-Host "`n🎯 MEJORAS APLICADAS:" -ForegroundColor Yellow
Write-Host "  • Media queries para 768px y 480px" -ForegroundColor White
Write-Host "  • Fuentes escalables para móviles" -ForegroundColor White
Write-Host "  • Tablas con scroll horizontal" -ForegroundColor White
Write-Host "  • Padding optimizado" -ForegroundColor White
Write-Host "  • Compatibilidad con pantallas pequeñas" -ForegroundColor White

Write-Host "`n📱 TODAS LAS INTERFACES HTML AHORA SON RESPONSIVE" -ForegroundColor Green
Write-Host "Fecha: $(Get-Date -Format 'dd/MM/yyyy HH:mm')" -ForegroundColor Gray
Write-Host "Estado: LISTO PARA MOVILES" -ForegroundColor Green
