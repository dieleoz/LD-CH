# ================================================================
# SCRIPT: Verificar estado de Git en este PC
# ================================================================

Write-Host ""
Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  VERIFICACIÓN GIT - NUEVO PC                                  ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# ================================================================
# TEST 1: ¿Git está instalado?
# ================================================================

Write-Host "🔍 TEST 1: Verificando si Git está instalado..." -ForegroundColor Yellow

try {
    $gitVersion = & git --version 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   ✅ Git encontrado: $gitVersion" -ForegroundColor Green
        $gitInstalado = $true
    } else {
        throw "Git no encontrado"
    }
} catch {
    Write-Host "   ❌ Git NO está instalado o no está en PATH" -ForegroundColor Red
    $gitInstalado = $false
}

Write-Host ""

# ================================================================
# TEST 2: ¿Git está configurado?
# ================================================================

if ($gitInstalado) {
    Write-Host "🔍 TEST 2: Verificando configuración Git..." -ForegroundColor Yellow
    
    try {
        $userName = git config --global user.name 2>&1
        $userEmail = git config --global user.email 2>&1
        
        if ($userName -and $userEmail) {
            Write-Host "   ✅ Usuario: $userName" -ForegroundColor Green
            Write-Host "   ✅ Email: $userEmail" -ForegroundColor Green
            $gitConfigurado = $true
        } else {
            Write-Host "   ❌ Git no está configurado" -ForegroundColor Red
            $gitConfigurado = $false
        }
    } catch {
        Write-Host "   ❌ Error verificando configuración" -ForegroundColor Red
        $gitConfigurado = $false
    }
    
    Write-Host ""
}

# ================================================================
# TEST 3: ¿Este es un repositorio Git?
# ================================================================

Write-Host "🔍 TEST 3: Verificando repositorio..." -ForegroundColor Yellow

if (Test-Path ".git") {
    Write-Host "   ✅ Este ES un repositorio Git" -ForegroundColor Green
    
    if ($gitInstalado) {
        try {
            $repoUrl = git remote get-url origin 2>&1
            Write-Host "   ✅ Conectado a: $repoUrl" -ForegroundColor Green
            $repoConectado = $true
        } catch {
            Write-Host "   ❌ No hay remote 'origin' configurado" -ForegroundColor Red
            $repoConectado = $false
        }
    }
} else {
    Write-Host "   ❌ Esta carpeta NO es un repositorio Git" -ForegroundColor Red
    $repoConectado = $false
}

Write-Host ""

# ================================================================
# DIAGNÓSTICO Y RECOMENDACIONES
# ================================================================

Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  DIAGNÓSTICO                                                  ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

if (-not $gitInstalado) {
    Write-Host "❌ ACCIÓN REQUERIDA: Instalar Git" -ForegroundColor Red
    Write-Host ""
    Write-Host "   OPCIÓN A - Instalar con winget (Recomendado):" -ForegroundColor Yellow
    Write-Host "   " -NoNewline
    Write-Host "   winget install --id Git.Git -e --source winget" -ForegroundColor White
    Write-Host ""
    Write-Host "   OPCIÓN B - GitHub Desktop (Más fácil):" -ForegroundColor Yellow
    Write-Host "   1. Descargar: https://desktop.github.com/" -ForegroundColor White
    Write-Host "   2. Instalar y hacer login" -ForegroundColor White
    Write-Host "   3. Add Local Repository → Seleccionar esta carpeta" -ForegroundColor White
    Write-Host ""
}
elseif (-not $gitConfigurado) {
    Write-Host "⚠️ ACCIÓN REQUERIDA: Configurar Git" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "   Ejecuta estos comandos:" -ForegroundColor White
    Write-Host "   git config --global user.name `"Tu Nombre`"" -ForegroundColor Cyan
    Write-Host "   git config --global user.email `"tu.email@grupoortiz.com`"" -ForegroundColor Cyan
    Write-Host ""
}
elseif (-not $repoConectado) {
    Write-Host "⚠️ ACCIÓN REQUERIDA: Conectar repositorio" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "   Ejecuta:" -ForegroundColor White
    Write-Host "   git remote add origin https://github.com/dieleoz/LD-CH.git" -ForegroundColor Cyan
    Write-Host ""
}
else {
    Write-Host "✅ TODO CONFIGURADO CORRECTAMENTE" -ForegroundColor Green
    Write-Host ""
    Write-Host "   Puedes ejecutar:" -ForegroundColor White
    Write-Host "   .\GIT_COMMIT_v14.7.6.bat" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "   O manualmente:" -ForegroundColor White
    Write-Host "   git status" -ForegroundColor Cyan
    Write-Host "   git add ." -ForegroundColor Cyan
    Write-Host "   git commit -m `"v14.7.6: Fix completo`"" -ForegroundColor Cyan
    Write-Host "   git push origin main" -ForegroundColor Cyan
    Write-Host ""
}

# ================================================================
# INFORMACIÓN ADICIONAL
# ================================================================

Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  INFORMACIÓN DEL REPOSITORIO                                  ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""
Write-Host "   📁 Repositorio: LD-CH" -ForegroundColor White
Write-Host "   🔗 URL: https://github.com/dieleoz/LD-CH" -ForegroundColor White
Write-Host "   👤 Usuario: dieleoz" -ForegroundColor White
Write-Host "   🌐 GitHub Pages: https://dieleoz.github.io/LD-CH/" -ForegroundColor White
Write-Host "   📌 Branch: main" -ForegroundColor White
Write-Host ""

# ================================================================
# RESUMEN DE ARCHIVOS A SUBIR
# ================================================================

Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  ARCHIVOS LISTOS PARA COMMIT (12)                             ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

$archivosModificados = @(
    "README.md",
    "@@Roadmap_v14.7_Marco_Gestion_Consolidado.md",
    "IX. WBS y Planificacion/datos_wbs_TODOS_items.js",
    "IX. WBS y Planificacion/WBS_COMPLETA_TODO_Interactiva_v4.0.html",
    "scripts/extraer_todos_items_wbs.ps1",
    "scripts/regenerar_fibra_1824_cajas.ps1",
    "scripts/completar_37_estaciones_TETRA.ps1",
    "IX. WBS y Planificacion/FIX_WBS_COMPLETA_14Oct2025.md",
    "ANALISIS_ARQUITECTURA_DT_REGENERACION_v14.7.5.md",
    "@@ARQUITECTURA_FLUJO_DT_COMPLETO_v14.7.6.md",
    "RESUMEN_SESION_14Oct2025_v14.7.6.md",
    "@@FIX_COMPLETO_v14.7.6_14Oct2025.md"
)

$contador = 1
foreach ($archivo in $archivosModificados) {
    if (Test-Path $archivo) {
        Write-Host "   ✅ $contador. $archivo" -ForegroundColor Green
    } else {
        Write-Host "   ⚠️ $contador. $archivo (no encontrado)" -ForegroundColor Yellow
    }
    $contador++
}

Write-Host ""
Write-Host "════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

pause

