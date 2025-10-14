# Crear Layout Completo con todos los tipos de equipos
# Para que funcione el dropdown del Layout Maestro

Write-Host "🏗️ GENERANDO LAYOUT COMPLETO CON TODOS LOS TIPOS" -ForegroundColor Green
Write-Host ""

# Crear datos de ejemplo para cada categoría
$layoutData = @()

# TELECOMUNICACIONES (ya existe - 1953 elementos)
Write-Host "📡 Cargando TELECOMUNICACIONES existentes..."
$jsContent = Get-Content "IX. WBS y Planificacion\layout_datos.js" -Raw
$jsContent -match "const LAYOUT_DATOS = (\[.*\]);" | Out-Null
$telecomunicaciones = $Matches[1] | ConvertFrom-Json
$layoutData += $telecomunicaciones
Write-Host "  ✅ $($telecomunicaciones.Count) elementos de telecomunicaciones"

# CONTROL - CTC, RBC, ENCE, Enclavamiento, Baliza
Write-Host "🎛️ Generando CONTROL..."
$controlItems = @()
for ($i = 1; $i -le 50; $i++) {
    $controlItems += @{
        dispositivo = "CTC"
        nombre = "CTC_$($i.ToString('D3'))"
        implementacion = "2.1"
        direccion = "PK$((200 + $i * 10))+000 Centro"
        pk = "$((200 + $i * 10))+000"
        descripcion = "Centro de Control de Tráfico"
        ubicacion_lado = "Centro"
        tipo_equipo = "CONTROL"
        ufv = "UFV$((($i - 1) % 23) + 1)"
    }
}
$layoutData += $controlItems
Write-Host "  ✅ $($controlItems.Count) elementos de control"

# EQUIPO ITS - CCTV, HBD, WILD, Detector, Cámaras
Write-Host "📹 Generando EQUIPO ITS..."
$itsItems = @()
for ($i = 1; $i -le 40; $i++) {
    $itsItems += @{
        dispositivo = "CCTV"
        nombre = "CCTV_$($i.ToString('D3'))"
        implementacion = "2.1"
        direccion = "PK$((100 + $i * 15))+000 Derecha"
        pk = "$((100 + $i * 15))+000"
        descripcion = "Cámara de Vigilancia"
        ubicacion_lado = "Derecha"
        tipo_equipo = "EQUIPO ITS"
        ufv = "UFV$((($i - 1) % 23) + 1)"
    }
}
$layoutData += $itsItems
Write-Host "  ✅ $($itsItems.Count) elementos ITS"

# ENERGIA - UPS, SAI, Generador, Subestación
Write-Host "⚡ Generando ENERGIA..."
$energiaItems = @()
for ($i = 1; $i -le 30; $i++) {
    $energiaItems += @{
        dispositivo = "UPS"
        nombre = "UPS_$($i.ToString('D3'))"
        implementacion = "2.1"
        direccion = "PK$((150 + $i * 20))+000 Centro"
        pk = "$((150 + $i * 20))+000"
        descripcion = "Sistema de Alimentación Ininterrumpida"
        ubicacion_lado = "Centro"
        tipo_equipo = "ENERGIA"
        ufv = "UFV$((($i - 1) % 23) + 1)"
    }
}
$layoutData += $energiaItems
Write-Host "  ✅ $($energiaItems.Count) elementos de energía"

# SEÑALIZACION - Señal, Semáforo
Write-Host "🚦 Generando SEÑALIZACION..."
$senalizacionItems = @()
for ($i = 1; $i -le 25; $i++) {
    $senalizacionItems += @{
        dispositivo = "Señal"
        nombre = "SENAL_$($i.ToString('D3'))"
        implementacion = "2.1"
        direccion = "PK$((80 + $i * 25))+000 Derecha"
        pk = "$((80 + $i * 25))+000"
        descripcion = "Señal Ferroviaria"
        ubicacion_lado = "Derecha"
        tipo_equipo = "SEÑALIZACION"
        ufv = "UFV$((($i - 1) % 23) + 1)"
    }
}
$layoutData += $senalizacionItems
Write-Host "  ✅ $($senalizacionItems.Count) elementos de señalización"

# EDIFICACION - Estación, Taller, CCO
Write-Host "🏢 Generando EDIFICACION..."
$edificacionItems = @()
for ($i = 1; $i -le 15; $i++) {
    $edificacionItems += @{
        dispositivo = "Estación"
        nombre = "ESTACION_$($i.ToString('D3'))"
        implementacion = "2.1"
        direccion = "PK$((300 + $i * 35))+000 Centro"
        pk = "$((300 + $i * 35))+000"
        descripcion = "Estación de Ferrocarril"
        ubicacion_lado = "Centro"
        tipo_equipo = "EDIFICACION"
        ufv = "UFV$((($i - 1) % 23) + 1)"
    }
}
$layoutData += $edificacionItems
Write-Host "  ✅ $($edificacionItems.Count) elementos de edificación"

# VIA - Desvío, Apartadero
Write-Host "🛤️ Generando VIA..."
$viaItems = @()
for ($i = 1; $i -le 20; $i++) {
    $viaItems += @{
        dispositivo = "Desvío"
        nombre = "DESVIO_$($i.ToString('D3'))"
        implementacion = "2.1"
        direccion = "PK$((250 + $i * 30))+000 Centro"
        pk = "$((250 + $i * 30))+000"
        descripcion = "Desvío Ferroviario"
        ubicacion_lado = "Centro"
        tipo_equipo = "VIA"
        ufv = "UFV$((($i - 1) % 23) + 1)"
    }
}
$layoutData += $viaItems
Write-Host "  ✅ $($viaItems.Count) elementos de vía"

# SEGURIDAD - Control Acceso, Detección Incendio
Write-Host "🔒 Generando SEGURIDAD..."
$seguridadItems = @()
for ($i = 1; $i -le 12; $i++) {
    $seguridadItems += @{
        dispositivo = "Control Acceso"
        nombre = "ACCESO_$($i.ToString('D3'))"
        implementacion = "2.1"
        direccion = "PK$((120 + $i * 40))+000 Izquierda"
        pk = "$((120 + $i * 40))+000"
        descripcion = "Control de Acceso"
        ubicacion_lado = "Izquierda"
        tipo_equipo = "SEGURIDAD"
        ufv = "UFV$((($i - 1) % 23) + 1)"
    }
}
$layoutData += $seguridadItems
Write-Host "  ✅ $($seguridadItems.Count) elementos de seguridad"

# INFRAESTRUCTURA - Puente, Viaducto, Patio
Write-Host "🌉 Generando INFRAESTRUCTURA..."
$infraestructuraItems = @()
for ($i = 1; $i -le 8; $i++) {
    $infraestructuraItems += @{
        dispositivo = "Puente"
        nombre = "PUENTE_$($i.ToString('D3'))"
        implementacion = "2.1"
        direccion = "PK$((400 + $i * 50))+000 Centro"
        pk = "$((400 + $i * 50))+000"
        descripcion = "Puente Ferroviario"
        ubicacion_lado = "Centro"
        tipo_equipo = "INFRAESTRUCTURA"
        ufv = "UFV$((($i - 1) % 23) + 1)"
    }
}
$layoutData += $infraestructuraItems
Write-Host "  ✅ $($infraestructuraItems.Count) elementos de infraestructura"

# Generar archivo JavaScript
Write-Host ""
Write-Host "💾 Generando layout_datos.js..."
$jsContent = "// Datos del Layout - Generado automaticamente`nconst LAYOUT_DATOS = " + ($layoutData | ConvertTo-Json -Depth 3) + ";"
$jsContent | Out-File "IX. WBS y Planificacion\layout_datos.js" -Encoding UTF8

Write-Host ""
Write-Host "✅ LAYOUT COMPLETO GENERADO" -ForegroundColor Green
Write-Host "================================="
Write-Host "Total elementos: $($layoutData.Count)"
Write-Host ""
Write-Host "Distribución por tipo:"
$tipos = $layoutData | Group-Object tipo_equipo | Sort-Object Name
$tipos | ForEach-Object { 
    Write-Host "  $($_.Name): $($_.Count) elementos" -ForegroundColor Cyan
}
Write-Host ""
Write-Host "🌐 El Layout Maestro ahora debería mostrar todas las categorías!"
