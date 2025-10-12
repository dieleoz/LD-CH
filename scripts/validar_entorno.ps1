# ================================================================
# SCRIPT: validar_entorno.ps1
# Valida que todas las dependencias esten instaladas correctamente
# Version: 1.0
# Fecha: 12 de Octubre 2025
# ================================================================

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  VALIDACION DE ENTORNO DEL SISTEMA WBS" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$errores = 0
$advertencias = 0

# ================================================================
# 1. VERIFICAR POWERSHELL
# ================================================================

Write-Host "1. PowerShell..." -NoNewline
if ($PSVersionTable.PSVersion.Major -ge 7 -and $PSVersionTable.PSVersion.Minor -ge 2) {
    Write-Host " OK v$($PSVersionTable.PSVersion)" -ForegroundColor Green
} else {
    Write-Host " ERROR" -ForegroundColor Red
    Write-Host "   Version actual: $($PSVersionTable.PSVersion)" -ForegroundColor Yellow
    Write-Host "   Se requiere: PowerShell 7.2 o superior" -ForegroundColor Yellow
    Write-Host "   Descargar desde: https://github.com/PowerShell/PowerShell/releases" -ForegroundColor Gray
    $errores++
}

# ================================================================
# 2. VERIFICAR MODULOS POWERSHELL
# ================================================================

Write-Host ""
Write-Host "2. Modulos PowerShell:" -ForegroundColor Cyan

$modulosRequeridos = @(
    @{Name='Pester'; MinVersion='5.3.0'; Opcional=$false},
    @{Name='PSExcel'; MinVersion='1.0.0'; Opcional=$true},
    @{Name='powershell-yaml'; MinVersion='0.4.0'; Opcional=$true}
)

foreach ($modulo in $modulosRequeridos) {
    Write-Host "   - $($modulo.Name)..." -NoNewline
    $instalado = Get-Module -ListAvailable -Name $modulo.Name -ErrorAction SilentlyContinue
    
    if ($instalado) {
        $version = $instalado[0].Version
        Write-Host " OK v$version" -ForegroundColor Green
    } else {
        if ($modulo.Opcional) {
            Write-Host " ADVERTENCIA (Opcional)" -ForegroundColor Yellow
            Write-Host "     Instalar: Install-Module -Name $($modulo.Name) -Force" -ForegroundColor Gray
            $advertencias++
        } else {
            Write-Host " ERROR" -ForegroundColor Red
            Write-Host "     Instalar: Install-Module -Name $($modulo.Name) -Force" -ForegroundColor Yellow
            $errores++
        }
    }
}

# ================================================================
# 3. VERIFICAR PANDOC
# ================================================================

Write-Host ""
Write-Host "3. Pandoc..." -NoNewline
try {
    $pandocVersion = & pandoc --version 2>&1 | Select-Object -First 1
    if ($pandocVersion -match '(\d+\.\d+)') {
        Write-Host " OK $pandocVersion" -ForegroundColor Green
    } else {
        throw "Version no detectada"
    }
} catch {
    Write-Host " ERROR" -ForegroundColor Red
    Write-Host "   Pandoc no esta instalado o no esta en el PATH" -ForegroundColor Yellow
    Write-Host "   Instalar desde: https://pandoc.org/installing.html" -ForegroundColor Gray
    Write-Host "   O ejecutar: winget install --id JohnMacFarlane.Pandoc" -ForegroundColor Gray
    $errores++
}

# ================================================================
# 4. VERIFICAR GIT
# ================================================================

Write-Host ""
Write-Host "4. Git..." -NoNewline
try {
    $gitVersion = & git --version 2>&1
    Write-Host " OK $gitVersion" -ForegroundColor Green
} catch {
    Write-Host " ADVERTENCIA" -ForegroundColor Yellow
    Write-Host "   Git no esta instalado o no esta en el PATH" -ForegroundColor Gray
    Write-Host "   Instalar: winget install --id Git.Git" -ForegroundColor Gray
    $advertencias++
}

# ================================================================
# 5. VERIFICAR CREDENCIALES
# ================================================================

Write-Host ""
Write-Host "5. Credenciales..." -NoNewline
if (Test-Path "CREDENCIALES_PORTAL.md") {
    Write-Host " OK CREDENCIALES_PORTAL.md encontrado" -ForegroundColor Green
} else {
    Write-Host " ADVERTENCIA" -ForegroundColor Yellow
    Write-Host "   CREDENCIALES_PORTAL.md no encontrado" -ForegroundColor Gray
    Write-Host "   (Solicitar a PMO del proyecto si necesitas acceso al portal)" -ForegroundColor Gray
    $advertencias++
}

# ================================================================
# 6. VERIFICAR CARPETAS CLAVE
# ================================================================

Write-Host ""
Write-Host "6. Estructura de carpetas:" -ForegroundColor Cyan

$carpetasClave = @(
    "IX. WBS y Planificacion",
    "II. Apendices Tecnicos\Decisiones_Tecnicas",
    "scripts",
    "scripts\modules",
    "X_ENTREGABLES_CONSOLIDADOS"
)

foreach ($carpeta in $carpetasClave) {
    Write-Host "   - $carpeta..." -NoNewline
    if (Test-Path $carpeta) {
        Write-Host " OK" -ForegroundColor Green
    } else {
        Write-Host " ERROR" -ForegroundColor Red
        $errores++
    }
}

# ================================================================
# 7. VERIFICAR ARCHIVOS CRITICOS
# ================================================================

Write-Host ""
Write-Host "7. Archivos criticos:" -ForegroundColor Cyan

$archivosCriticos = @(
    "README.md",
    "IX. WBS y Planificacion\datos_wbs_TODOS_items.json",
    "IX. WBS y Planificacion\WBS_Menu_Principal.html",
    "scripts\cocinar.ps1",
    "scripts\servir.ps1"
)

foreach ($archivo in $archivosCriticos) {
    $nombre = Split-Path $archivo -Leaf
    Write-Host "   - $nombre..." -NoNewline
    if (Test-Path $archivo) {
        Write-Host " OK" -ForegroundColor Green
    } else {
        Write-Host " ERROR" -ForegroundColor Red
        $errores++
    }
}

# ================================================================
# 8. VERIFICAR MODULOS CUSTOM
# ================================================================

Write-Host ""
Write-Host "8. Modulos custom del sistema:" -ForegroundColor Cyan

$modulosCustom = @(
    "scripts\modules\Logger.psm1",
    "scripts\modules\SistemaMapper.psm1",
    "scripts\modules\DTDetector.psm1",
    "scripts\modules\LayoutExecutor.psm1",
    "scripts\modules\Consolidator.psm1"
)

foreach ($modulo in $modulosCustom) {
    $nombre = Split-Path $modulo -Leaf
    Write-Host "   - $nombre..." -NoNewline
    if (Test-Path $modulo) {
        Write-Host " OK" -ForegroundColor Green
    } else {
        Write-Host " ADVERTENCIA (Nuevo en v14.7.5)" -ForegroundColor Yellow
        $advertencias++
    }
}

# ================================================================
# RESUMEN FINAL
# ================================================================

Write-Host ""
Write-Host "================================================================" -ForegroundColor White

if ($errores -eq 0 -and $advertencias -eq 0) {
    Write-Host "  ENTORNO VALIDADO COMPLETAMENTE" -ForegroundColor Green
    Write-Host "================================================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "El sistema esta listo para usar." -ForegroundColor Green
    Write-Host ""
    Write-Host "COMANDOS PRINCIPALES:" -ForegroundColor Cyan
    Write-Host "  .\scripts\sincronizar_SISTEMA_COMPLETO_v14.3.ps1  # Sincronizar WBS" -ForegroundColor White
    Write-Host "  .\scripts\cocinar_v2.ps1 -ConLogs                 # Cocinar con logs" -ForegroundColor White
    Write-Host "  .\scripts\servir.ps1                              # Servir documentos" -ForegroundColor White
    Write-Host ""
    exit 0
    
} elseif ($errores -eq 0 -and $advertencias -gt 0) {
    Write-Host "  ENTORNO VALIDADO CON ADVERTENCIAS" -ForegroundColor Yellow
    Write-Host "================================================================" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Advertencias: $advertencias" -ForegroundColor Yellow
    Write-Host "El sistema funcionara, pero algunas funcionalidades pueden estar limitadas." -ForegroundColor White
    Write-Host ""
    exit 0
    
} else {
    Write-Host "  ENTORNO CON ERRORES" -ForegroundColor Red
    Write-Host "================================================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Errores encontrados: $errores" -ForegroundColor Red
    Write-Host "Advertencias: $advertencias" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Por favor, instala las dependencias faltantes antes de continuar." -ForegroundColor White
    Write-Host "Ver guia completa: scripts\REQUISITOS_SISTEMA.md" -ForegroundColor Cyan
    Write-Host ""
    exit 1
}

