# Script para corregir caracteres mal codificados en todo el proyecto
# Fecha: 10 de Octubre 2025

Write-Host "Corrigiendo caracteres mal codificados en todo el proyecto..." -ForegroundColor Cyan

# Patrones de reemplazo
$reemplazos = @{
    'INGENIERÍA' = 'INGENIERÍA'
    'Ingeniería' = 'Ingeniería'
    'Ingeniería' = 'ingeniería'
    'Operación' = 'Operación'
    'Operación' = 'operación'
    'certificación' = 'certificación'
    'capacitación' = 'capacitación'
    'Aprobación' = 'Aprobación'
    'Aprobación' = 'aprobación'
    'básica' = 'básica'
    'básico' = 'básico'
    'tÃ©cnic' = 'técnic'
    'eléctric' = 'eléctric'
    'MecÃ¡nic' = 'Mecánic'
    'mecÃ¡nic' = 'mecánic'
    'óptic' = 'óptic'
    'Señalizac' = 'Señalizac'
    'Señalizac' = 'señalizac'
    'Tráfico' = 'Tráfico'
    'Tráfico' = 'tráfico'
    'ComunicaciÃ³n' = 'Comunicación'
    'comunicaciÃ³n' = 'comunicación'
    'ProtecciÃ³n' = 'Protección'
    'protecciÃ³n' = 'protección'
    'RevisiÃ³n' = 'Revisión'
    'revisiÃ³n' = 'revisión'
    'GestiÃ³n' = 'Gestión'
    'gestiÃ³n' = 'gestión'
    'SoluciÃ³n' = 'Solución'
    'soluciÃ³n' = 'solución'
    'Interfón' = 'Interfón'
    'Interfón' = 'interfón'
    'ÃndiceÂ' = 'Índice'
    'EspecificaciÃ³n' = 'Especificación'
    'especificaciÃ³n' = 'especificación'
    'Construcción' = 'Construcción'
    'Construcción' = 'construcción'
    'Reversión' = 'Reversión'
    'Reversión' = 'reversión'
}

$archivosCorregidos = 0
$totalReemplazos = 0

# Tipos de archivos a procesar
$tipos = @('*.md', '*.ps1', '*.html', '*.js', '*.json')

foreach ($tipo in $tipos) {
    $archivos = Get-ChildItem -Recurse -Include $tipo -ErrorAction SilentlyContinue
    
    foreach ($archivo in $archivos) {
        try {
            $contenido = Get-Content $archivo.FullName -Raw -Encoding UTF8 -ErrorAction SilentlyContinue
            
            if ($contenido) {
                $contenidoOriginal = $contenido
                
                foreach ($patron in $reemplazos.Keys) {
                    if ($contenido -match $patron) {
                        $contenido = $contenido -replace $patron, $reemplazos[$patron]
                        $totalReemplazos++
                    }
                }
                
                if ($contenido -ne $contenidoOriginal) {
                    $contenido | Set-Content $archivo.FullName -Encoding UTF8
                    $archivosCorregidos++
                    Write-Host "OK $($archivo.Name)" -ForegroundColor Green
                }
            }
        }
        catch {
            Write-Host "ERROR: $($archivo.Name) - $_" -ForegroundColor Red
        }
    }
}

Write-Host "`nCorreccion completada:" -ForegroundColor Cyan
Write-Host "  Archivos corregidos: $archivosCorregidos" -ForegroundColor White
Write-Host "  Total reemplazos: $totalReemplazos" -ForegroundColor White


