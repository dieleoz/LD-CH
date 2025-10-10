# Script: Analisis Completo Apendices Tecnicos
# Extrae informacion clave de todos los AT para validacion BLOCKERS

Write-Host "Analizando Apendices Tecnicos..." -ForegroundColor Cyan

$rutaATs = "01. contrato en .md"
$resultados = @()

for ($i = 1; $i -le 10; $i++) {
    $archivo = Join-Path $rutaATs "FORMATEADO_APENDICE TECNICO $i.md"
    
    if (Test-Path $archivo) {
        Write-Host "`nAT$i - Procesando..." -ForegroundColor Yellow
        $content = Get-Content $archivo -Raw -Encoding UTF8
        
        $info = @{
            AT = "AT$i"
            tamano_KB = [math]::Round((Get-Item $archivo).Length / 1KB, 1)
        }
        
        # Buscar palabras clave criticas
        if ($content -match '(\d+)\s+(pasos?\s+a?\s*nivel|PAN)') {
            $info.pasos_nivel = $matches[1]
        }
        
        if ($content -match 'ITCS|ETCS|ATP embarcado|Positive Train Control') {
            $info.sistema_control = "Mencionado"
        } else {
            $info.sistema_control = "NO mencionado"
        }
        
        if ($content -match 'FENOCO|operador existente|interoperabilidad') {
            $info.fenoco = "Mencionado"
        } else {
            $info.fenoco = "NO mencionado"
        }
        
        if ($content -match 'material rodante|locomotora|15 locomotoras') {
            $info.material_rodante = "Mencionado"
        } else {
            $info.material_rodante = "NO mencionado"
        }
        
        if ($content -match '(\d+)\s+meses?.*plazo|plazo.*?(\d+)\s+meses?') {
            $info.plazo_mencionado = "Si"
        } else {
            $info.plazo_mencionado = "NO"
        }
        
        $resultados += [PSCustomObject]$info
    }
}

# Mostrar resultados
Write-Host "`n=== RESUMEN DE ANALISIS ===" -ForegroundColor Green
$resultados | Format-Table -AutoSize

# Exportar a JSON
$resultados | ConvertTo-Json | Set-Content "Reportes\Analisis_ATs_Completo_09Oct2025.json" -Encoding UTF8
Write-Host "`n[OK] Analisis exportado a: Reportes\Analisis_ATs_Completo_09Oct2025.json" -ForegroundColor Green

