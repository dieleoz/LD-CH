# ===============================================
# SCRIPT: Verificación Git - Nuevo PC
# Proyecto: APP La Dorada-Chiriguaná
# Versión: 1.0
# Fecha: 14 Octubre 2025
# ===============================================

Write-Host "`n🔍 VERIFICACIÓN GIT - NUEVO PC" -ForegroundColor Cyan
Write-Host "==============================`n" -ForegroundColor Cyan

$errores = 0
$advertencias = 0

# Test 1: Git instalado
Write-Host "Test 1: Verificando instalación de Git..." -ForegroundColor Yellow
try {
    $gitVersion = git --version 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  ✅ Git instalado: $gitVersion" -ForegroundColor Green
    } else {
        throw
    }
} catch {
    Write-Host "  ❌ Git NO encontrado" -ForegroundColor Red
    Write-Host "     Solución: winget install Git.Git" -ForegroundColor Yellow
    $errores++
}

Write-Host ""

# Test 2: Configuración global
Write-Host "Test 2: Verificando configuración global..." -ForegroundColor Yellow
$userName = git config --global user.name 2>$null
$userEmail = git config --global user.email 2>$null
$credHelper = git config --global credential.helper 2>$null

if ($userName -and $userEmail) {
    Write-Host "  ✅ Usuario: $userName" -ForegroundColor Green
    Write-Host "  ✅ Email: $userEmail" -ForegroundColor Green
    
    if ($credHelper) {
        Write-Host "  ✅ Credential Helper: $credHelper" -ForegroundColor Green
    } else {
        Write-Host "  ⚠️  Credential Helper NO configurado" -ForegroundColor Yellow
        Write-Host "     Solución: git config --global credential.helper manager" -ForegroundColor Yellow
        $advertencias++
    }
} else {
    Write-Host "  ❌ Git no configurado completamente" -ForegroundColor Red
    Write-Host "     Solución:" -ForegroundColor Yellow
    Write-Host '       git config --global user.name "Diego Leoz"' -ForegroundColor Yellow
    Write-Host '       git config --global user.email "dieleoz@example.com"' -ForegroundColor Yellow
    Write-Host '       git config --global credential.helper manager' -ForegroundColor Yellow
    $errores++
}

Write-Host ""

# Test 3: Credenciales guardadas
Write-Host "Test 3: Verificando credenciales de GitHub..." -ForegroundColor Yellow
try {
    $credList = cmdkey /list 2>&1 | Out-String
    if ($credList -match "git:https://github.com") {
        Write-Host "  ✅ Credenciales GitHub guardadas en Windows" -ForegroundColor Green
    } else {
        Write-Host "  ⚠️  Credenciales NO guardadas aún" -ForegroundColor Yellow
        Write-Host "     Se pedirán en el primer push (normal en instalación nueva)" -ForegroundColor Gray
        $advertencias++
    }
} catch {
    Write-Host "  ⚠️  No se pudo verificar credenciales" -ForegroundColor Yellow
    $advertencias++
}

Write-Host ""

# Test 4: Repositorio local
Write-Host "Test 4: Verificando repositorio local..." -ForegroundColor Yellow
if (Test-Path ".git") {
    try {
        $repoUrl = git remote get-url origin 2>&1
        $branch = git branch --show-current 2>&1
        
        if ($repoUrl -match "github.com") {
            Write-Host "  ✅ Repositorio: $repoUrl" -ForegroundColor Green
            Write-Host "  ✅ Rama actual: $branch" -ForegroundColor Green
            
            # Test 5: Estado sincronización
            Write-Host "`nTest 5: Verificando sincronización..." -ForegroundColor Yellow
            try {
                git fetch 2>&1 | Out-Null
                $status = git status -sb 2>&1
                Write-Host "  ✅ Estado: $status" -ForegroundColor Green
                
                # Verificar si hay cambios pendientes
                $statusLong = git status --porcelain 2>&1
                if ($statusLong) {
                    $numChanges = ($statusLong | Measure-Object).Count
                    Write-Host "  ⚠️  Tienes $numChanges archivo(s) con cambios pendientes" -ForegroundColor Yellow
                    $advertencias++
                } else {
                    Write-Host "  ✅ Working tree limpio - No hay cambios pendientes" -ForegroundColor Green
                }
            } catch {
                Write-Host "  ⚠️  No se pudo verificar sincronización (puede requerir credenciales)" -ForegroundColor Yellow
                $advertencias++
            }
        } else {
            Write-Host "  ❌ URL de repositorio incorrecta: $repoUrl" -ForegroundColor Red
            Write-Host "     Debería ser: https://github.com/dieleoz/LD-CH.git" -ForegroundColor Yellow
            $errores++
        }
    } catch {
        Write-Host "  ❌ Error al verificar repositorio" -ForegroundColor Red
        $errores++
    }
} else {
    Write-Host "  ⚠️  No estás en un repositorio Git" -ForegroundColor Yellow
    Write-Host "     Navega a la carpeta del proyecto o clona el repo:" -ForegroundColor Gray
    Write-Host "     git clone https://github.com/dieleoz/LD-CH.git" -ForegroundColor Gray
    $advertencias++
}

Write-Host ""

# Resumen final
Write-Host "================================" -ForegroundColor Cyan
Write-Host "RESUMEN DE VERIFICACIÓN" -ForegroundColor Cyan
Write-Host "================================`n" -ForegroundColor Cyan

if ($errores -eq 0 -and $advertencias -eq 0) {
    Write-Host "✅ TODO PERFECTO - Git configurado correctamente" -ForegroundColor Green
    Write-Host "`n🚀 Puedes empezar a trabajar con Git sin problemas`n" -ForegroundColor Green
} elseif ($errores -eq 0) {
    Write-Host "✅ CONFIGURACIÓN BÁSICA OK" -ForegroundColor Green
    Write-Host "⚠️  $advertencias advertencia(s) - No críticas" -ForegroundColor Yellow
    Write-Host "`n👉 Git funcionará, pero revisa las advertencias arriba`n" -ForegroundColor Yellow
} else {
    Write-Host "❌ $errores error(es) encontrado(s)" -ForegroundColor Red
    Write-Host "⚠️  $advertencias advertencia(s)" -ForegroundColor Yellow
    Write-Host "`n👉 Corrige los errores antes de usar Git`n" -ForegroundColor Red
}

# Información adicional
Write-Host "================================" -ForegroundColor Cyan
Write-Host "INFORMACIÓN DEL PROYECTO" -ForegroundColor Cyan
Write-Host "================================`n" -ForegroundColor Cyan
Write-Host "Repositorio: https://github.com/dieleoz/LD-CH" -ForegroundColor White
Write-Host "Portal Web: https://dieleoz.github.io/LD-CH/" -ForegroundColor White
Write-Host "Usuario: dieleoz" -ForegroundColor White
Write-Host "Rama principal: main" -ForegroundColor White
Write-Host ""

# Siguiente paso
if ($errores -eq 0) {
    Write-Host "📋 SIGUIENTE PASO:" -ForegroundColor Cyan
    Write-Host "   Para hacer tu primer commit, ejecuta:" -ForegroundColor White
    Write-Host "   .\GIT_COMMIT_v14.7.6.bat" -ForegroundColor Green
    Write-Host ""
}

