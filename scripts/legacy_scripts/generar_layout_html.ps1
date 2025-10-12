# ================================================================
#  SCRIPT: Generar Layout HTML con Datos Embebidos
# ================================================================
#
# PROPÓSITO:
#   Genera WBS_Layout_Maestro.html con datos del layout embebidos
#   para evitar problemas de CORS al usar fetch() local
#
# USO:
#   .\scripts\generar_layout_html.ps1
#

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  GENERAR LAYOUT HTML CON DATOS EMBEBIDOS" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$layoutPath = "VIII. Documentos Maestros y Metodologia\LAYOUT_MAESTRO_EQUIPOS_v1.0.md"
$htmlOutput = "IX. WBS y Planificacion\WBS_Layout_Maestro.html"

# ================================================================
# PARSEAR LAYOUT
# ================================================================

Write-Host "Parseando layout maestro..." -ForegroundColor Yellow

if (-not (Test-Path $layoutPath)) {
    Write-Host "❌ ERROR: Layout no encontrado: $layoutPath" -ForegroundColor Red
    exit 1
}

$contenido = Get-Content $layoutPath -Raw -Encoding UTF8

# Buscar tabla maestra
$patron = '(?s)## 📍 TABLA MAESTRA - EQUIPOS POR PK.*?\n\n(\|.+?\|.+?\n\|[-:]+.*?\n)((?:\|.+?\n)+)'

$equipos = @()

if ($contenido -match $patron) {
    $headerLine = $matches[1]
    $dataLines = $matches[2]
    
    # Extraer headers
    $headers = ($headerLine -split '\n')[0] -replace '^\||\|$', '' -split '\|' | ForEach-Object { $_.Trim() }
    
    # Parsear filas
    $rowLines = $dataLines -split '\n' | Where-Object { $_ -match '^\|' -and $_ -notmatch '^[\|\s\-:]+$' }
    
    foreach ($rowLine in $rowLines) {
        if (-not $rowLine) { continue }
        
        $valores = $rowLine -replace '^\||\|$', '' -split '\|' | ForEach-Object { $_.Trim() }
        
        if ($valores.Count -eq $headers.Count) {
            $obj = @{}
            for ($i = 0; $i -lt $headers.Count; $i++) {
                $obj[$headers[$i]] = $valores[$i]
            }
            $equipos += $obj
        }
    }
    
    Write-Host "✅ Equipos parseados: $($equipos.Count)" -ForegroundColor Green
}
else {
    Write-Host "❌ ERROR: No se pudo parsear la tabla" -ForegroundColor Red
    exit 1
}

# ================================================================
# CONVERTIR A JSON
# ================================================================

Write-Host "Convirtiendo a JSON..." -ForegroundColor Yellow

$equiposJson = $equipos | ConvertTo-Json -Compress -Depth 10

# Escapar para JavaScript
$equiposJson = $equiposJson -replace '"', '\"' -replace '\r\n', '\n'

Write-Host "✅ JSON generado: $([math]::Round($equiposJson.Length / 1KB, 1)) KB" -ForegroundColor Green

# ================================================================
# GENERAR HTML
# ================================================================

Write-Host "Generando HTML..." -ForegroundColor Yellow

$htmlContent = @"
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LAYOUT MAESTRO - Equipos por PK/UFV | APP La Dorada-Chiriguaná</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #00bcd4 0%, #0097a7 100%);
            padding: 20px;
            min-height: 100vh;
        }
        
        .container {
            max-width: 1600px;
            margin: 0 auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            overflow: hidden;
        }
        
        .header {
            background: linear-gradient(135deg, #00bcd4 0%, #0097a7 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .header h1 { font-size: 32px; margin-bottom: 10px; text-shadow: 2px 2px 4px rgba(0,0,0,0.2); }
        .header p { font-size: 16px; opacity: 0.95; }
        
        .controls {
            padding: 20px 30px;
            background: #f5f5f5;
            border-bottom: 3px solid #00bcd4;
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            align-items: center;
        }
        
        .control-group {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }
        
        .control-group label {
            font-size: 12px;
            font-weight: 600;
            color: #555;
            text-transform: uppercase;
        }
        
        .control-group select,
        .control-group input {
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            min-width: 200px;
        }
        
        .control-group select:focus,
        .control-group input:focus {
            outline: none;
            border-color: #00bcd4;
        }
        
        .btn-export {
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            color: white;
            margin-left: auto;
        }
        
        .btn-export:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .btn-excel { background: linear-gradient(135deg, #28a745 0%, #218838 100%); }
        .btn-pdf { background: linear-gradient(135deg, #dc3545 0%, #c82333 100%); }
        .btn-clear { background: linear-gradient(135deg, #6c757d 0%, #545b62 100%); }
        
        .stats {
            padding: 15px 30px;
            background: #fff3cd;
            border-bottom: 2px solid #ffc107;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }
        
        .stat-item { text-align: center; }
        .stat-number { font-size: 28px; font-weight: 700; color: #00bcd4; }
        .stat-label { font-size: 12px; color: #666; text-transform: uppercase; }
        
        .table-container {
            padding: 30px;
            overflow-x: auto;
            max-height: 600px;
            overflow-y: auto;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }
        
        thead {
            background: linear-gradient(135deg, #00bcd4 0%, #0097a7 100%);
            color: white;
            position: sticky;
            top: 0;
            z-index: 10;
        }
        
        th {
            padding: 12px 8px;
            text-align: left;
            font-weight: 600;
            white-space: nowrap;
            border-right: 1px solid rgba(255,255,255,0.2);
        }
        
        td {
            padding: 10px 8px;
            border-bottom: 1px solid #e0e0e0;
            white-space: nowrap;
        }
        
        tbody tr:hover { background-color: #e3f2fd; cursor: pointer; }
        tbody tr:nth-child(even) { background-color: #f9f9f9; }
        
        .tipo-CONTROL { background-color: #fff9c4 !important; }
        .tipo-TELECOMUNICACIONES { background-color: #c8e6c9 !important; }
        .tipo-EQUIPO_ITS { background-color: #bbdefb !important; }
        .tipo-ENERGIA { background-color: #ffccbc !important; }
        .tipo-EDIFICACION { background-color: #d1c4e9 !important; }
        .tipo-SEÑALIZACION { background-color: #ffecb3 !important; }
        .tipo-SEGURIDAD { background-color: #ffcdd2 !important; }
        .tipo-VIA { background-color: #f0f4c3 !important; }
        .tipo-INFRAESTRUCTURA { background-color: #e1bee7 !important; }
        
        .empty-state {
            text-align: center;
            padding: 60px 30px;
            color: #999;
        }
        
        .footer {
            background: #1e3c72;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 14px;
        }
        
        @media print {
            body { background: white; padding: 0; }
            .controls { display: none; }
            .stats { page-break-after: avoid; }
            .table-container { max-height: none; overflow: visible; }
            thead { display: table-header-group; }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🗺️ LAYOUT MAESTRO DE EQUIPOS</h1>
            <p>Inventario Completo por Punto Kilométrico (PK) y Unidad Funcional de Vía (UFV)</p>
            <p><strong>Proyecto:</strong> APP La Dorada-Chiriguaná | <strong>Versión:</strong> 1.1</p>
        </div>
        
        <div class="controls">
            <div class="control-group">
                <label>🔍 Filtrar por Sistema:</label>
                <select id="filtroSistema" onchange="filtrarTabla()">
                    <option value="">Todos los Sistemas</option>
                    <option value="CONTROL">CONTROL (RBC, CTC, Balizas)</option>
                    <option value="SEÑALIZACION">SEÑALIZACION (Señales LED)</option>
                    <option value="TELECOMUNICACIONES">TELECOMUNICACIONES (TETRA, Fibra)</option>
                    <option value="EQUIPO ITS">EQUIPO ITS (CCTV, HBD, WILD)</option>
                    <option value="SEGURIDAD">SEGURIDAD (Control Acceso)</option>
                    <option value="ENERGIA">ENERGIA (Subestaciones, UPS)</option>
                    <option value="EDIFICACION">EDIFICACION (Estaciones, Talleres)</option>
                    <option value="VIA">VIA (Desvíos)</option>
                    <option value="INFRAESTRUCTURA">INFRAESTRUCTURA (Puentes)</option>
                </select>
            </div>
            
            <div class="control-group">
                <label>📍 Filtrar por UFV:</label>
                <select id="filtroUFV" onchange="filtrarTabla()">
                    <option value="">Todas las UFV</option>
                </select>
            </div>
            
            <div class="control-group">
                <label>🔎 Buscar:</label>
                <input type="text" id="filtroBuscar" placeholder="PK, nombre, descripción..." oninput="filtrarTabla()">
            </div>
            
            <button class="btn-export btn-clear" onclick="limpiarFiltros()">🔄 Limpiar</button>
            <button class="btn-export btn-excel" onclick="exportarExcel()">📊 Excel</button>
            <button class="btn-export btn-pdf" onclick="window.print()">📄 PDF</button>
        </div>
        
        <div class="stats" id="stats">
            <div class="stat-item">
                <div class="stat-number" id="totalEquipos">0</div>
                <div class="stat-label">Total Equipos</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" id="totalUFV">0</div>
                <div class="stat-label">UFV Únicas</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" id="totalTipos">0</div>
                <div class="stat-label">Tipos de Equipo</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" id="equiposFiltrados">0</div>
                <div class="stat-label">Equipos Mostrados</div>
            </div>
        </div>
        
        <div class="table-container">
            <table id="tablaLayout">
                <thead>
                    <tr>
                        <th>UFV</th>
                        <th>Lote</th>
                        <th>Nombre Tablero</th>
                        <th>PK</th>
                        <th>Descripción</th>
                        <th>Lado</th>
                        <th>Dirección</th>
                        <th>Tipo Equipo</th>
                        <th>Dispositivo</th>
                        <th>Switch</th>
                        <th>Tipo ITS</th>
                        <th>Lat X</th>
                        <th>Long Y</th>
                    </tr>
                </thead>
                <tbody id="tablaBody"></tbody>
            </table>
        </div>
        
        <div class="footer">
            <p>© 2025 APP La Dorada-Chiriguaná | Sistema WBS Interactivo v14.7</p>
            <p>Layout Maestro v1.1 | Generado: $(Get-Date -Format 'dd/MM/yyyy HH:mm') | Equipos: $($equipos.Count)</p>
        </div>
    </div>

    <script>
        // ================================================================
        // DATOS EMBEBIDOS (Generados desde Layout Maestro)
        // ================================================================
        
        const layoutData = $($equiposJson | ConvertTo-Json -Depth 10);
        let layoutDataFiltrada = [...layoutData];
        
        console.log('✅ Layout cargado:', layoutData.length, 'equipos');
        
        // ================================================================
        // INICIALIZACIÓN
        // ================================================================
        
        // Poblar filtro UFV
        const ufvUnicas = [...new Set(layoutData.map(e => e.UFV))].sort();
        const selectUFV = document.getElementById('filtroUFV');
        ufvUnicas.forEach(ufv => {
            const option = document.createElement('option');
            option.value = ufv;
            option.textContent = ufv;
            selectUFV.appendChild(option);
        });
        
        // Renderizar inicialmente
        renderizarTabla();
        actualizarEstadisticas();
        
        // ================================================================
        // FILTRADO
        // ================================================================
        
        function filtrarTabla() {
            const filtroSistema = document.getElementById('filtroSistema').value;
            const filtroUFV = document.getElementById('filtroUFV').value;
            const filtroBuscar = document.getElementById('filtroBuscar').value.toLowerCase();
            
            layoutDataFiltrada = layoutData.filter(equipo => {
                let pasa = true;
                
                if (filtroSistema && equipo['Tipo_Equipo'] !== filtroSistema) pasa = false;
                if (filtroUFV && equipo.UFV !== filtroUFV) pasa = false;
                
                if (filtroBuscar) {
                    const textoCompleto = Object.values(equipo).join(' ').toLowerCase();
                    if (!textoCompleto.includes(filtroBuscar)) pasa = false;
                }
                
                return pasa;
            });
            
            renderizarTabla();
            actualizarEstadisticas();
        }
        
        function limpiarFiltros() {
            document.getElementById('filtroSistema').value = '';
            document.getElementById('filtroUFV').value = '';
            document.getElementById('filtroBuscar').value = '';
            filtrarTabla();
        }
        
        // ================================================================
        // RENDERIZADO
        // ================================================================
        
        function renderizarTabla() {
            const tbody = document.getElementById('tablaBody');
            
            if (layoutDataFiltrada.length === 0) {
                tbody.innerHTML = '<tr><td colspan="13" class="empty-state"><h3>No se encontraron equipos</h3><p>Prueba con otros filtros</p></td></tr>';
                return;
            }
            
            tbody.innerHTML = layoutDataFiltrada.map(e => {
                const tipoClass = 'tipo-' + (e['Tipo_Equipo'] || '').replace(/ /g, '_');
                return ``
                    <tr class="`${tipoClass}``">
                        <td>`${e.UFV || ''}``</td>
                        <td>`${e.Implementacion || ''}``</td>
                        <td><strong>`${e.Nombre_Tablero || ''}``</strong></td>
                        <td><strong>`${e['Ubicacion_PK'] || ''}``</strong></td>
                        <td>`${e.Descripcion || ''}``</td>
                        <td>`${e['Ubicacion_Lado'] || ''}``</td>
                        <td>`${e.Direccion || ''}``</td>
                        <td><span style="padding: 4px 8px; background: rgba(0,0,0,0.1); border-radius: 4px; font-weight: 600;">`${e['Tipo_Equipo'] || ''}``</span></td>
                        <td>`${e.Dispositivo || ''}``</td>
                        <td>`${e['Switch_Acceso'] || ''}``</td>
                        <td>`${e['Tipo_ITS'] || ''}``</td>
                        <td>`${e['Latitud_X'] || ''}``</td>
                        <td>`${e['Longitud_Y'] || ''}``</td>
                    </tr>
                ``;
            }).join('');
        }
        
        function actualizarEstadisticas() {
            document.getElementById('totalEquipos').textContent = layoutData.length;
            document.getElementById('equiposFiltrados').textContent = layoutDataFiltrada.length;
            
            const ufvUnicas = new Set(layoutData.map(e => e.UFV));
            document.getElementById('totalUFV').textContent = ufvUnicas.size;
            
            const tiposUnicos = new Set(layoutData.map(e => e['Tipo_Equipo']));
            document.getElementById('totalTipos').textContent = tiposUnicos.size;
        }
        
        // ================================================================
        // EXPORTACIÓN
        // ================================================================
        
        function exportarExcel() {
            if (layoutDataFiltrada.length === 0) {
                alert('⚠️ No hay datos para exportar');
                return;
            }
            
            const headers = Object.keys(layoutDataFiltrada[0]);
            let csv = headers.join(',') + '\n';
            
            layoutDataFiltrada.forEach(equipo => {
                const valores = headers.map(h => {
                    const valor = equipo[h] || '';
                    return ``"`${valor.replace(/"/g, '""')}``"``;
                });
                csv += valores.join(',') + '\n';
            });
            
            const blob = new Blob(['\ufeff' + csv], { type: 'text/csv;charset=utf-8;' });
            const link = document.createElement('a');
            const url = URL.createObjectURL(blob);
            const fecha = new Date().toISOString().slice(0,10);
            link.setAttribute('href', url);
            link.setAttribute('download', ``Layout_Maestro_`${fecha}``.csv``);
            link.style.visibility = 'hidden';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
            
            alert('✅ Exportado: ' + layoutDataFiltrada.length + ' equipos a CSV\n\nAbre el archivo en Excel para ver con formato.');
        }
    </script>
</body>
</html>
"@

# Guardar HTML
$htmlContent | Out-File $htmlOutput -Encoding UTF8 -Force

Write-Host "✅ HTML generado: $htmlOutput" -ForegroundColor Green

# Verificar tamaño
if (Test-Path $htmlOutput) {
    $tamano = [math]::Round((Get-Item $htmlOutput).Length / 1KB, 1)
    Write-Host "   Tamaño: $tamano KB" -ForegroundColor White
}

Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host "  LAYOUT HTML GENERADO CON ÉXITO" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "ABRIR AHORA:" -ForegroundColor Magenta
Write-Host "  start `"$htmlOutput`"" -ForegroundColor Yellow
Write-Host ""
Write-Host "DESDE MENÚ WBS:" -ForegroundColor Magenta
Write-Host "  WBS_Menu_Principal.html → Click 'LAYOUT MAESTRO'" -ForegroundColor Yellow
Write-Host ""
Write-Host "¡LAYOUT LISTO!" -ForegroundColor Green
Write-Host ""

