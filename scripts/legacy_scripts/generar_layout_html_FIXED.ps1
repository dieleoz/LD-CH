# ================================================================
#  GENERAR LAYOUT HTML - VERSION CORREGIDA (UTF-8 + Sin Emojis)
# ================================================================

Write-Host ""
Write-Host "Generando Layout HTML (UTF-8 Corregido)..." -ForegroundColor Cyan
Write-Host ""

$layoutMd = "layout.md"
$outputHtml = "IX. WBS y Planificacion\WBS_Layout_Maestro.html"

# Parsear layout.md
$lineas = Get-Content $layoutMd -Encoding UTF8
$filasTabla = $lineas | Select-Object -Skip 238 | Where-Object { $_ -match '^\| UFV' }

Write-Host "Filas parseadas: $($filasTabla.Count)" -ForegroundColor Green

# Convertir a JSON correcto
$equiposArray = @()

foreach ($fila in $filasTabla) {
    $columnas = ($fila -replace '^\||\|$', '' -split '\|') | ForEach-Object { $_.Trim() }
    
    if ($columnas.Count -ge 13) {
        $equipo = [PSCustomObject]@{
            UFV = $columnas[0]
            Implementacion = $columnas[1]
            Nombre_Tablero = $columnas[2]
            Ubicacion_PK = $columnas[3]
            Descripcion = $columnas[4]
            Ubicacion_Lado = $columnas[5]
            Direccion = $columnas[6]
            Tipo_Equipo = $columnas[7]
            Dispositivo = $columnas[8]
            Switch_Acceso = $columnas[9]
            Tipo_ITS = $columnas[10]
            Latitud_X = $columnas[11]
            Longitud_Y = $columnas[12]
        }
        $equiposArray += $equipo
    }
}

Write-Host "Equipos convertidos: $($equiposArray.Count)" -ForegroundColor Green

# Convertir a JSON
$jsonData = $equiposArray | ConvertTo-Json -Compress -Depth 5

Write-Host "JSON generado: $([math]::Round($jsonData.Length / 1KB, 1)) KB" -ForegroundColor Green

# Generar HTML (SIN EMOJIS para evitar problemas de encoding)
$htmlContent = @"
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LAYOUT MAESTRO - Equipos por PK/UFV</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, #00bcd4 0%, #0097a7 100%); padding: 20px; min-height: 100vh; }
        .container { max-width: 1800px; margin: 0 auto; background: white; border-radius: 12px; box-shadow: 0 20px 60px rgba(0,0,0,0.3); }
        .header { background: linear-gradient(135deg, #00bcd4 0%, #0097a7 100%); color: white; padding: 30px; text-align: center; }
        .header h1 { font-size: 32px; margin-bottom: 10px; }
        .header p { font-size: 16px; opacity: 0.95; }
        .controls { padding: 20px; background: #f5f5f5; border-bottom: 3px solid #00bcd4; display: flex; flex-wrap: wrap; gap: 15px; align-items: flex-end; }
        .control-group { display: flex; flex-direction: column; gap: 5px; flex: 1; min-width: 200px; }
        .control-group label { font-size: 12px; font-weight: 600; color: #555; text-transform: uppercase; }
        .control-group select, .control-group input { padding: 10px; border: 2px solid #ddd; border-radius: 6px; font-size: 14px; width: 100%; }
        .control-group select:focus, .control-group input:focus { outline: none; border-color: #00bcd4; }
        .btn { padding: 12px 24px; border: none; border-radius: 6px; font-size: 14px; font-weight: 600; cursor: pointer; color: white; transition: all 0.3s; }
        .btn:hover { transform: translateY(-2px); box-shadow: 0 5px 15px rgba(0,0,0,0.2); }
        .btn-excel { background: linear-gradient(135deg, #28a745 0%, #218838 100%); }
        .btn-pdf { background: linear-gradient(135deg, #dc3545 0%, #c82333 100%); }
        .btn-clear { background: linear-gradient(135deg, #6c757d 0%, #545b62 100%); }
        .stats { padding: 15px 30px; background: #fff3cd; border-bottom: 2px solid #ffc107; display: flex; justify-content: space-around; flex-wrap: wrap; gap: 20px; }
        .stat-item { text-align: center; }
        .stat-number { font-size: 28px; font-weight: 700; color: #00bcd4; }
        .stat-label { font-size: 12px; color: #666; }
        .table-container { padding: 20px; overflow-x: auto; max-height: 70vh; overflow-y: auto; }
        table { width: 100%; border-collapse: collapse; font-size: 12px; }
        thead { background: linear-gradient(135deg, #00bcd4 0%, #0097a7 100%); color: white; position: sticky; top: 0; z-index: 10; }
        th { padding: 10px 6px; text-align: left; font-weight: 600; white-space: nowrap; border-right: 1px solid rgba(255,255,255,0.2); }
        td { padding: 8px 6px; border-bottom: 1px solid #e0e0e0; }
        tbody tr:hover { background-color: #e3f2fd; }
        tbody tr:nth-child(even) { background-color: #f9f9f9; }
        .tipo-CONTROL { background-color: #fff9c4 !important; }
        .tipo-TELECOMUNICACIONES { background-color: #c8e6c9 !important; }
        .tipo-EQUIPO_ITS { background-color: #bbdefb !important; }
        .tipo-ENERGIA { background-color: #ffccbc !important; }
        .tipo-EDIFICACION { background-color: #d1c4e9 !important; }
        .tipo-SENALIZACION { background-color: #ffecb3 !important; }
        .tipo-SEGURIDAD { background-color: #ffcdd2 !important; }
        .tipo-VIA { background-color: #f0f4c3 !important; }
        .tipo-INFRAESTRUCTURA { background-color: #e1bee7 !important; }
        .footer { background: #1e3c72; color: white; padding: 20px; text-align: center; font-size: 14px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>LAYOUT MAESTRO DE EQUIPOS</h1>
            <p>Inventario Completo por Punto Kilometrico (PK) y Unidad Funcional de Via (UFV)</p>
            <p><strong>Proyecto:</strong> APP La Dorada-Chiriguana | <strong>Version:</strong> 1.1 | <strong>Equipos:</strong> $($equiposArray.Count)</p>
        </div>
        
        <div class="controls">
            <div class="control-group">
                <label>Filtrar por Sistema:</label>
                <select id="filtroSistema" onchange="filtrarTabla()">
                    <option value="">Todos los Sistemas</option>
                    <option value="CONTROL">CONTROL (RBC, CTC, Balizas)</option>
                    <option value="SENALIZACION">SENALIZACION (Senales LED)</option>
                    <option value="TELECOMUNICACIONES">TELECOMUNICACIONES (TETRA, Fibra)</option>
                    <option value="EQUIPO ITS">EQUIPO ITS (CCTV, HBD, WILD)</option>
                    <option value="SEGURIDAD">SEGURIDAD (Control Acceso)</option>
                    <option value="ENERGIA">ENERGIA (Subestaciones, UPS)</option>
                    <option value="EDIFICACION">EDIFICACION (Estaciones, Talleres)</option>
                    <option value="VIA">VIA (Desvios)</option>
                    <option value="INFRAESTRUCTURA">INFRAESTRUCTURA (Puentes)</option>
                </select>
            </div>
            
            <div class="control-group">
                <label>Filtrar por UFV:</label>
                <select id="filtroUFV" onchange="filtrarTabla()">
                    <option value="">Todas las UFV</option>
                </select>
            </div>
            
            <div class="control-group">
                <label>Buscar:</label>
                <input type="text" id="filtroBuscar" placeholder="PK, nombre, descripcion..." oninput="filtrarTabla()">
            </div>
            
            <button class="btn btn-clear" onclick="limpiarFiltros()">Limpiar Filtros</button>
            <button class="btn btn-excel" onclick="exportarExcel()">Exportar Excel</button>
            <button class="btn btn-pdf" onclick="window.print()">Imprimir PDF</button>
        </div>
        
        <div class="stats">
            <div class="stat-item">
                <div class="stat-number" id="totalEquipos">0</div>
                <div class="stat-label">Total Equipos</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" id="totalUFV">0</div>
                <div class="stat-label">UFV Unicas</div>
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
            <table>
                <thead>
                    <tr>
                        <th>UFV</th>
                        <th>Lote</th>
                        <th>Nombre Tablero</th>
                        <th>PK</th>
                        <th>Descripcion</th>
                        <th>Lado</th>
                        <th>Direccion</th>
                        <th>Tipo Equipo</th>
                        <th>Dispositivo</th>
                        <th>Switch</th>
                        <th>Tipo ITS</th>
                        <th>Lat X</th>
                        <th>Long Y</th>
                    </tr>
                </thead>
                <tbody id="tablaBody">
                    <tr><td colspan="13" style="text-align:center; padding:40px; color:#999;">Cargando datos...</td></tr>
                </tbody>
            </table>
        </div>
        
        <div class="footer">
            <p>2025 APP La Dorada-Chiriguana | Sistema WBS Interactivo v14.7</p>
            <p>Layout Maestro v1.1 | Equipos: $($equiposArray.Count)</p>
        </div>
    </div>

    <script>
        // Datos embebidos
        const layoutData = $jsonData;
        let layoutDataFiltrada = [];
        
        console.log('Layout cargado:', layoutData.length, 'equipos');
        
        // Inicializar
        function init() {
            try {
                // Poblar filtro UFV
                const ufvUnicas = [...new Set(layoutData.map(e => e.UFV))].sort();
                const selectUFV = document.getElementById('filtroUFV');
                
                ufvUnicas.forEach(ufv => {
                    const option = document.createElement('option');
                    option.value = ufv;
                    option.textContent = ufv;
                    selectUFV.appendChild(option);
                });
                
                // Mostrar todos inicialmente
                layoutDataFiltrada = [...layoutData];
                renderizarTabla();
                actualizarEstadisticas();
                
                console.log('Inicializacion completa');
            } catch (error) {
                console.error('Error en inicializacion:', error);
                document.getElementById('tablaBody').innerHTML = '<tr><td colspan="13" style="text-align:center; padding:40px; color:#c00;">Error: ' + error.message + '</td></tr>';
            }
        }
        
        // Filtrar
        function filtrarTabla() {
            const filtroSistema = document.getElementById('filtroSistema').value;
            const filtroUFV = document.getElementById('filtroUFV').value;
            const filtroBuscar = document.getElementById('filtroBuscar').value.toLowerCase();
            
            layoutDataFiltrada = layoutData.filter(equipo => {
                if (filtroSistema && equipo.Tipo_Equipo !== filtroSistema) return false;
                if (filtroUFV && equipo.UFV !== filtroUFV) return false;
                if (filtroBuscar) {
                    const texto = Object.values(equipo).join(' ').toLowerCase();
                    if (!texto.includes(filtroBuscar)) return false;
                }
                return true;
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
        
        // Renderizar
        function renderizarTabla() {
            const tbody = document.getElementById('tablaBody');
            
            if (layoutDataFiltrada.length === 0) {
                tbody.innerHTML = '<tr><td colspan="13" style="text-align:center; padding:40px; color:#999;">No se encontraron equipos con esos criterios</td></tr>';
                return;
            }
            
            const html = layoutDataFiltrada.map(e => {
                const tipoClass = 'tipo-' + (e.Tipo_Equipo || '').replace(/ /g, '_').replace(/Ñ/g, 'N');
                return '<tr class="' + tipoClass + '">' +
                    '<td>' + (e.UFV || '') + '</td>' +
                    '<td>' + (e.Implementacion || '') + '</td>' +
                    '<td><strong>' + (e.Nombre_Tablero || '') + '</strong></td>' +
                    '<td><strong>' + (e.Ubicacion_PK || '') + '</strong></td>' +
                    '<td>' + (e.Descripcion || '') + '</td>' +
                    '<td>' + (e.Ubicacion_Lado || '') + '</td>' +
                    '<td>' + (e.Direccion || '') + '</td>' +
                    '<td><span style="padding:3px 6px; background:rgba(0,0,0,0.1); border-radius:3px; font-weight:600;">' + (e.Tipo_Equipo || '') + '</span></td>' +
                    '<td>' + (e.Dispositivo || '') + '</td>' +
                    '<td>' + (e.Switch_Acceso || '') + '</td>' +
                    '<td>' + (e.Tipo_ITS || '') + '</td>' +
                    '<td>' + (e.Latitud_X || '') + '</td>' +
                    '<td>' + (e.Longitud_Y || '') + '</td>' +
                    '</tr>';
            }).join('');
            
            tbody.innerHTML = html;
        }
        
        function actualizarEstadisticas() {
            document.getElementById('totalEquipos').textContent = layoutData.length;
            document.getElementById('equiposFiltrados').textContent = layoutDataFiltrada.length;
            document.getElementById('totalUFV').textContent = new Set(layoutData.map(e => e.UFV)).size;
            document.getElementById('totalTipos').textContent = new Set(layoutData.map(e => e.Tipo_Equipo)).size;
        }
        
        // Exportar Excel
        function exportarExcel() {
            if (layoutDataFiltrada.length === 0) {
                alert('No hay datos para exportar');
                return;
            }
            
            const headers = Object.keys(layoutDataFiltrada[0]);
            let csv = headers.join(',') + '\n';
            
            layoutDataFiltrada.forEach(equipo => {
                const valores = headers.map(h => '"' + (equipo[h] || '').replace(/"/g, '""') + '"');
                csv += valores.join(',') + '\n';
            });
            
            const blob = new Blob(['\ufeff' + csv], { type: 'text/csv;charset=utf-8;' });
            const link = document.createElement('a');
            link.href = URL.createObjectURL(blob);
            link.download = 'Layout_Maestro_' + new Date().toISOString().slice(0,10) + '.csv';
            link.click();
            
            alert('Exportado: ' + layoutDataFiltrada.length + ' equipos a CSV');
        }
        
        // Iniciar cuando cargue la pagina
        window.addEventListener('DOMContentLoaded', init);
    </script>
</body>
</html>
"@

# Guardar con UTF-8 sin BOM
$utf8NoBOM = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText($outputHtml, $htmlContent, $utf8NoBOM)

Write-Host ""
Write-Host "HTML guardado: $outputHtml" -ForegroundColor Green
Write-Host "Tamano: $([math]::Round((Get-Item $outputHtml).Length / 1KB, 1)) KB" -ForegroundColor White
Write-Host ""
Write-Host "Abriendo..." -ForegroundColor Yellow

start $outputHtml

Write-Host ""
Write-Host "LISTO - HTML sin problemas de encoding!" -ForegroundColor Green
Write-Host ""

