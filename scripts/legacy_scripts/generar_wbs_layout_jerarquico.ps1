# ================================================================
#  GENERAR WBS LAYOUT JERARQUICO (HTML)
#  Crea interfaz visual con 3 pestanas
# ================================================================

Write-Host ""
Write-Host "Generando interfaz visual jerarquica..." -ForegroundColor Cyan
Write-Host ""

# Leer layout jerarquico
$layoutJson = Get-Content "VIII. Documentos Maestros y Metodologia\LAYOUT_JERARQUICO_v1.0.json" -Raw | ConvertFrom-Json

# Convertir a JavaScript embebido
$layoutDataJs = $layoutJson | ConvertTo-Json -Depth 10 -Compress

# Generar HTML
$html = @"
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LAYOUT JERARQUICO - APP La Dorada-Chiriguana</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, #00bcd4 0%, #0097a7 100%); padding: 20px; }
        
        .container { max-width: 1800px; margin: 0 auto; background: white; border-radius: 12px; box-shadow: 0 20px 60px rgba(0,0,0,0.3); }
        
        .header { background: linear-gradient(135deg, #00bcd4 0%, #0097a7 100%); color: white; padding: 30px; text-align: center; border-radius: 12px 12px 0 0; }
        .header h1 { font-size: 32px; margin-bottom: 10px; }
        .header p { font-size: 16px; opacity: 0.95; }
        
        .tabs { display: flex; background: #f5f5f5; border-bottom: 3px solid #00bcd4; }
        .tab { flex: 1; padding: 15px; text-align: center; cursor: pointer; font-weight: 600; transition: all 0.3s; border: none; background: #f5f5f5; }
        .tab:hover { background: #e0e0e0; }
        .tab.active { background: white; color: #00bcd4; border-bottom: 3px solid #00bcd4; }
        
        .tab-content { padding: 20px; min-height: 70vh; display: none; }
        .tab-content.active { display: block; }
        
        .stats { padding: 15px 30px; background: #fff3cd; border-bottom: 2px solid #ffc107; display: flex; justify-content: space-around; flex-wrap: wrap; gap: 20px; }
        .stat-item { text-align: center; }
        .stat-number { font-size: 28px; font-weight: 700; color: #00bcd4; }
        .stat-label { font-size: 12px; color: #666; }
        
        .instalacion { background: #f9f9f9; border-left: 4px solid #00bcd4; padding: 15px; margin-bottom: 15px; border-radius: 4px; cursor: pointer; transition: all 0.3s; }
        .instalacion:hover { background: #e3f2fd; transform: translateX(5px); }
        .instalacion-header { display: flex; justify-content: space-between; align-items: center; }
        .instalacion-header h3 { color: #00bcd4; font-size: 18px; }
        .instalacion-info { font-size: 14px; color: #666; margin-top: 5px; }
        .instalacion-equipos { display: none; margin-top: 15px; padding-top: 15px; border-top: 1px solid #ddd; }
        .instalacion-equipos.expanded { display: block; }
        
        .equipo-item { padding: 8px 12px; background: white; border-radius: 4px; margin-bottom: 8px; display: flex; justify-content: space-between; }
        .equipo-categoria { display: inline-block; padding: 3px 8px; background: rgba(0,188,212,0.1); color: #00bcd4; border-radius: 3px; font-size: 11px; font-weight: 600; }
        
        .timeline { position: relative; height: 100px; background: #f0f0f0; border-radius: 8px; padding: 20px; margin: 20px 0; }
        .timeline-marker { position: absolute; width: 12px; height: 12px; background: #00bcd4; border-radius: 50%; cursor: pointer; transform: translateX(-50%); }
        .timeline-marker:hover { width: 16px; height: 16px; background: #ff5722; }
        
        .btn { padding: 12px 24px; border: none; border-radius: 6px; font-size: 14px; font-weight: 600; cursor: pointer; color: white; transition: all 0.3s; }
        .btn-excel { background: linear-gradient(135deg, #28a745 0%, #218838 100%); }
        .btn-pdf { background: linear-gradient(135deg, #dc3545 0%, #c82333 100%); }
        
        .footer { background: #1e3c72; color: white; padding: 20px; text-align: center; font-size: 14px; border-radius: 0 0 12px 12px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>LAYOUT JERARQUICO DE EQUIPOS</h1>
            <p>Vista Integral por Instalaciones, Sistemas y UFV</p>
            <p><strong>Proyecto:</strong> APP La Dorada-Chiriguana | <strong>Version:</strong> 1.0 Jerarquico</p>
        </div>
        
        <div class="stats">
            <div class="stat-item">
                <div class="stat-number" id="totalEquipos">0</div>
                <div class="stat-label">Total Equipos</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" id="totalEdificaciones">0</div>
                <div class="stat-label">Edificaciones</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" id="totalPuentes">0</div>
                <div class="stat-label">Puentes</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" id="totalTetra">0</div>
                <div class="stat-label">Nodos TETRA</div>
            </div>
        </div>
        
        <div class="tabs">
            <button class="tab active" onclick="cambiarTab(0)">Por Instalacion</button>
            <button class="tab" onclick="cambiarTab(1)">Por Sistema</button>
            <button class="tab" onclick="cambiarTab(2)">Por UFV</button>
        </div>
        
        <!-- VISTA 1: POR INSTALACION -->
        <div id="tab0" class="tab-content active">
            <h2 style="margin-bottom:20px; color:#00bcd4;">Vista por Instalacion</h2>
            
            <h3 style="margin:20px 0 10px 0; color:#333;">EDIFICACIONES</h3>
            <div id="edificaciones-container"></div>
            
            <h3 style="margin:20px 0 10px 0; color:#333;">INFRAESTRUCTURA</h3>
            <div id="infraestructura-container"></div>
            
            <button class="btn btn-excel" onclick="exportarExcel()" style="margin-top:20px;">Exportar Excel</button>
        </div>
        
        <!-- VISTA 2: POR SISTEMA -->
        <div id="tab1" class="tab-content">
            <h2 style="margin-bottom:20px; color:#00bcd4;">Vista por Sistema Distribuido</h2>
            <div id="sistemas-container"></div>
        </div>
        
        <!-- VISTA 3: POR UFV -->
        <div id="tab2" class="tab-content">
            <h2 style="margin-bottom:20px; color:#00bcd4;">Vista por UFV (Geografica)</h2>
            <div id="ufv-container"></div>
        </div>
        
        <div class="footer">
            <p>2025 APP La Dorada-Chiriguana | Sistema WBS Interactivo v15.0</p>
            <p>Layout Jerarquico v1.0 | Generado: $((Get-Date).ToString("dd/MM/yyyy HH:mm"))</p>
        </div>
    </div>

    <script>
        const layoutData = $layoutDataJs;
        
        console.log('Layout jerarquico cargado:', layoutData.metadata.total_equipos, 'equipos');
        
        function init() {
            actualizarEstadisticas();
            renderizarEdificaciones();
            renderizarInfraestructura();
            renderizarSistemas();
            renderizarPorUFV();
        }
        
        function actualizarEstadisticas() {
            document.getElementById('totalEquipos').textContent = layoutData.metadata.total_equipos;
            document.getElementById('totalEdificaciones').textContent = layoutData.instalaciones.edificaciones.length;
            document.getElementById('totalPuentes').textContent = layoutData.instalaciones.infraestructura.length;
            document.getElementById('totalTetra').textContent = layoutData.sistemas_distribuidos.red_tetra.cantidad_nodos;
        }
        
        function renderizarEdificaciones() {
            const container = document.getElementById('edificaciones-container');
            let html = '';
            
            layoutData.instalaciones.edificaciones.forEach((est, idx) => {
                html += '<div class="instalacion" onclick="toggleEquipos(' + idx + ', \'edif\')">';
                html += '<div class="instalacion-header">';
                html += '<h3>' + est.nombre + '</h3>';
                html += '<span style="color:#666;">' + est.total_equipos + ' equipos</span>';
                html += '</div>';
                html += '<div class="instalacion-info">PK ' + est.pk + ' | UFV ' + est.ufv + ' | ' + est.subtipo + '</div>';
                html += '<div class="instalacion-equipos" id="edif-' + idx + '">';
                
                if (est.equipos && est.equipos.length > 0) {
                    est.equipos.forEach(eq => {
                        html += '<div class="equipo-item">';
                        html += '<div><strong>' + eq.id + '</strong><br><span style="font-size:12px; color:#666;">' + eq.descripcion + '</span></div>';
                        html += '<span class="equipo-categoria">' + eq.categoria + '</span>';
                        html += '</div>';
                    });
                } else {
                    html += '<div style="color:#999; font-style:italic;">Sin equipos asignados</div>';
                }
                
                html += '</div></div>';
            });
            
            container.innerHTML = html;
        }
        
        function renderizarInfraestructura() {
            const container = document.getElementById('infraestructura-container');
            let html = '';
            
            layoutData.instalaciones.infraestructura.forEach((puente, idx) => {
                html += '<div class="instalacion" onclick="toggleEquipos(' + idx + ', \'infra\')" style="border-left-color:#ff5722;">';
                html += '<div class="instalacion-header">';
                html += '<h3>' + puente.nombre + '</h3>';
                html += '<span style="color:#666;">' + puente.total_equipos + ' equipos</span>';
                html += '</div>';
                html += '<div class="instalacion-info">PK ' + puente.pk_inicio + ' | UFV ' + puente.ufv + ' | Infraestructura Prioritaria</div>';
                html += '<div class="instalacion-equipos" id="infra-' + idx + '">';
                
                if (puente.equipos && puente.equipos.length > 0) {
                    puente.equipos.forEach(eq => {
                        html += '<div class="equipo-item">';
                        html += '<div><strong>' + eq.id + '</strong><br><span style="font-size:12px; color:#666;">' + eq.descripcion + ' (PK ' + eq.pk + ')</span></div>';
                        html += '<span class="equipo-categoria">' + eq.categoria + '</span>';
                        html += '</div>';
                    });
                } else {
                    html += '<div style="color:#999; font-style:italic;">Sin equipos asignados</div>';
                }
                
                html += '</div></div>';
            });
            
            container.innerHTML = html;
        }
        
        function renderizarSistemas() {
            const container = document.getElementById('sistemas-container');
            let html = '<h3>Red TETRA (' + layoutData.sistemas_distribuidos.red_tetra.cantidad_nodos + ' nodos)</h3>';
            html += '<div class="timeline" style="margin-bottom:30px;">';
            
            // Timeline visual (simplificado)
            layoutData.sistemas_distribuidos.red_tetra.nodos.forEach((nodo, idx) => {
                const pos = (idx / layoutData.sistemas_distribuidos.red_tetra.cantidad_nodos) * 100;
                html += '<div class="timeline-marker" style="left:' + pos + '%; top:50%;" title="' + nodo.id + ' (PK ' + nodo.pk + ')"></div>';
            });
            
            html += '</div>';
            
            html += '<h4>Listado de Nodos:</h4>';
            html += '<div style="columns:3; column-gap:20px; margin-top:15px;">';
            layoutData.sistemas_distribuidos.red_tetra.nodos.forEach(nodo => {
                html += '<div style="break-inside:avoid; padding:8px; background:#f9f9f9; border-radius:4px; margin-bottom:8px;">';
                html += '<strong>' + nodo.id + '</strong><br>';
                html += '<span style="font-size:12px; color:#666;">PK ' + nodo.pk + ' | UFV ' + nodo.ufv + '</span>';
                html += '</div>';
            });
            html += '</div>';
            
            container.innerHTML = html;
        }
        
        function renderizarPorUFV() {
            const container = document.getElementById('ufv-container');
            
            // Agrupar por UFV
            const porUFV = {};
            
            layoutData.instalaciones.edificaciones.forEach(est => {
                if (!porUFV[est.ufv]) porUFV[est.ufv] = { edificaciones: 0, equipos: 0 };
                porUFV[est.ufv].edificaciones++;
                porUFV[est.ufv].equipos += est.total_equipos;
            });
            
            let html = '';
            Object.keys(porUFV).sort().forEach(ufv => {
                html += '<div class="instalacion" style="border-left-color:#4caf50;">';
                html += '<div class="instalacion-header">';
                html += '<h3>' + ufv + '</h3>';
                html += '<span style="color:#666;">' + porUFV[ufv].equipos + ' equipos</span>';
                html += '</div>';
                html += '<div class="instalacion-info">' + porUFV[ufv].edificaciones + ' instalaciones</div>';
                html += '</div>';
            });
            
            container.innerHTML = html;
        }
        
        function toggleEquipos(idx, tipo) {
            const elem = document.getElementById(tipo + '-' + idx);
            elem.classList.toggle('expanded');
        }
        
        function cambiarTab(idx) {
            document.querySelectorAll('.tab').forEach((t, i) => {
                t.classList.toggle('active', i === idx);
            });
            document.querySelectorAll('.tab-content').forEach((c, i) => {
                c.classList.toggle('active', i === idx);
            });
        }
        
        function exportarExcel() {
            alert('Exportacion Excel: Funcionalidad en desarrollo');
        }
        
        window.addEventListener('DOMContentLoaded', init);
    </script>
</body>
</html>
"@

# Guardar HTML
$outputPath = "IX. WBS y Planificacion\WBS_Layout_Maestro.html"
$utf8NoBOM = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText($outputPath, $html, $utf8NoBOM)

Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host "  INTERFAZ VISUAL GENERADA" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Archivo: $outputPath" -ForegroundColor White
Write-Host "Tamano: $([math]::Round((Get-Item $outputPath).Length / 1KB, 1)) KB" -ForegroundColor White
Write-Host ""
Write-Host "Abriendo..." -ForegroundColor Yellow

start $outputPath

Write-Host ""
Write-Host "SISTEMA LAYOUT JERARQUICO COMPLETADO!" -ForegroundColor Green
Write-Host ""

