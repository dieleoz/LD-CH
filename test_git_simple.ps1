# Test simple de Git
Write-Host ""
Write-Host "=== VERIFICACION GIT ===" -ForegroundColor Cyan
Write-Host ""

# Test 1: Git instalado?
Write-Host "1. Verificando Git..." -ForegroundColor Yellow
try {
    $ver = git --version 2>&1
    Write-Host "   OK Git instalado: $ver" -ForegroundColor Green
} catch {
    Write-Host "   ERROR: Git no encontrado" -ForegroundColor Red
    Write-Host "   Instalar con: winget install Git.Git" -ForegroundColor Yellow
    exit
}

# Test 2: Configurado?
Write-Host ""
Write-Host "2. Verificando configuracion..." -ForegroundColor Yellow
$name = git config --global user.name
$email = git config --global user.email

if ($name -and $email) {
    Write-Host "   OK Usuario: $name" -ForegroundColor Green
    Write-Host "   OK Email: $email" -ForegroundColor Green
} else {
    Write-Host "   PENDIENTE: Configurar usuario" -ForegroundColor Yellow
}

# Test 3: Repo conectado?
Write-Host ""
Write-Host "3. Verificando repositorio..." -ForegroundColor Yellow
if (Test-Path ".git") {
    Write-Host "   OK Este ES un repo Git" -ForegroundColor Green
    try {
        $remote = git remote get-url origin 2>&1
        Write-Host "   OK Conectado a: $remote" -ForegroundColor Green
    } catch {
        Write-Host "   PENDIENTE: Configurar remote" -ForegroundColor Yellow
    }
} else {
    Write-Host "   ERROR: No es un repo Git" -ForegroundColor Red
}

Write-Host ""
Write-Host "=======================" -ForegroundColor Cyan
Write-Host ""

pause

