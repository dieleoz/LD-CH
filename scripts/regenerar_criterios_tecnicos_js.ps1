# ================================================================
# SCRIPT: Regenerar criterios_tecnicos_base.js desde JSON
# Propósito: Convertir JSON a JS con encoding UTF-8 correcto
# ================================================================

Write-Host "Regenerando criterios_tecnicos_base.js..." -ForegroundColor Cyan

$jsonPath = "..\IX. WBS y Planificacion\criterios_tecnicos_base.json"
$jsPath = "..\IX. WBS y Planificacion\criterios_tecnicos_base.js"

# Leer JSON con UTF-8
$jsonContent = Get-Content $jsonPath -Raw -Encoding UTF8

# Generar JS con wrapper
$jsContent = @"
const criteriosTecnicosBase = $jsonContent;

console.log('✅ Criterios técnicos cargados:', Object.keys(criteriosTecnicosBase.criterios).length, 'ítems');
"@

# Guardar con UTF-8
$jsContent | Out-File $jsPath -Encoding UTF8 -Force

Write-Host "✅ Archivo regenerado correctamente" -ForegroundColor Green
Write-Host "   Ruta: $jsPath" -ForegroundColor Gray
Write-Host "   Encoding: UTF-8 sin BOM" -ForegroundColor Gray

