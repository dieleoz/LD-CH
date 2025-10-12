# REQUISITOS DEL SISTEMA - Scripts PowerShell
## Sistema WBS Interactivo v14.7
## Proyecto APP La Dorada-Chiriguaná

**Fecha de creación:** 12 de Octubre 2025  
**Versión:** 1.0  
**Responsable:** Equipo TI / DevOps

---

## 📋 RESUMEN EJECUTIVO

Este documento especifica los **requisitos de sistema, dependencias y configuración** necesarios para ejecutar los scripts PowerShell del Sistema WBS Interactivo.

**Propósito:** Garantizar que nuevos usuarios puedan replicar el entorno de desarrollo/producción sin fricción.

---

## 🖥️ REQUISITOS DE SISTEMA OPERATIVO

### Windows (Recomendado)

| Componente | Versión Mínima | Versión Recomendada | Notas |
|:-----------|:---------------|:--------------------|:------|
| **Windows** | 10 (Build 19041+) | 11 (última versión) | Compatible con PowerShell 7.2+ |
| **PowerShell** | 7.2.0 | 7.4+ | **CRÍTICO** - PowerShell 5.1 NO soportado |
| **RAM** | 8 GB | 16 GB | Para procesamiento de JSONs grandes |
| **Espacio Disco** | 2 GB | 5 GB | Incluye documentos, backups, logs |
| **Permisos** | Usuario estándar | Administrador | Algunos scripts requieren permisos elevados |

### Linux (Ubuntu/Debian)

| Componente | Versión Mínima | Versión Recomendada | Notas |
|:-----------|:---------------|:--------------------|:------|
| **Ubuntu** | 20.04 LTS | 22.04 LTS | Otras distros: validar PowerShell Core |
| **PowerShell Core** | 7.2.0 | 7.4+ | Instalar desde Microsoft repos |
| **RAM** | 8 GB | 16 GB | Similar a Windows |
| **Espacio Disco** | 2 GB | 5 GB | Incluye dependencias |

### macOS

| Componente | Versión Mínima | Versión Recomendada | Notas |
|:-----------|:---------------|:--------------------|:------|
| **macOS** | 12 Monterey | 14 Sonoma | PowerShell 7.2+ requerido |
| **PowerShell Core** | 7.2.0 | 7.4+ | Instalar con Homebrew |
| **RAM** | 8 GB | 16 GB | Similar a Windows |
| **Espacio Disco** | 2 GB | 5 GB | Incluye Homebrew dependencies |

---

## ⚙️ POWERSHELL - INSTALACIÓN Y CONFIGURACIÓN

### Verificar Versión Actual

```powershell
# Verificar versión de PowerShell
$PSVersionTable.PSVersion

# Debe mostrar:
# Major  Minor  Patch  ...
# 7      4      X      ...
```

### Instalar PowerShell 7.4+ (Windows)

```powershell
# Opción 1: Desde Microsoft Store (Recomendado)
# Buscar: "PowerShell" en Microsoft Store → Instalar

# Opción 2: Desde línea de comandos (winget)
winget install --id Microsoft.Powershell --source winget

# Opción 3: Instalador MSI manual
# Descargar desde: https://github.com/PowerShell/PowerShell/releases
```

### Instalar PowerShell 7.4+ (Linux)

```bash
# Ubuntu 22.04 LTS
sudo apt-get update
sudo apt-get install -y wget apt-transport-https software-properties-common
wget -q "https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb"
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y powershell
```

### Instalar PowerShell 7.4+ (macOS)

```bash
# Con Homebrew
brew install --cask powershell

# Verificar instalación
pwsh --version
```

### Habilitar Ejecución de Scripts (Windows)

```powershell
# Ejecutar como Administrador
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Verificar configuración
Get-ExecutionPolicy -List
```

---

## 📦 MÓDULOS POWERSHELL REQUERIDOS

### Módulos Críticos

| Módulo | Versión Mínima | Propósito | Instalación |
|:-------|:---------------|:----------|:------------|
| **Pester** | 5.3.0 | Tests automatizados | `Install-Module -Name Pester -Force` |
| **PSExcel** | 1.0.0 | Manipulación de Excel | `Install-Module -Name PSExcel -Force` |
| **powershell-yaml** | 0.4.0 | Parseo de archivos YAML | `Install-Module -Name powershell-yaml -Force` |

### Módulos Recomendados

| Módulo | Versión | Propósito | Instalación |
|:-------|:--------|:----------|:------------|
| **PSScriptAnalyzer** | 1.21+ | Análisis estático de código | `Install-Module -Name PSScriptAnalyzer -Force` |
| **PSReadLine** | 2.2+ | Mejoras de línea de comandos | Incluido en PowerShell 7.2+ |

### Instalar Todos los Módulos

```powershell
# Script de instalación completa
$modulos = @(
    @{Name='Pester'; Version='5.3.0'},
    @{Name='PSExcel'; Version='1.0.0'},
    @{Name='powershell-yaml'; Version='0.4.0'},
    @{Name='PSScriptAnalyzer'; MinimumVersion='1.21.0'}
)

foreach ($modulo in $modulos) {
    Write-Host "Instalando $($modulo.Name)..." -ForegroundColor Cyan
    Install-Module -Name $modulo.Name -MinimumVersion $modulo.Version -Force -Scope CurrentUser
}

Write-Host "✅ Todos los módulos instalados correctamente." -ForegroundColor Green
```

### Verificar Módulos Instalados

```powershell
# Listar módulos instalados
Get-Module -ListAvailable | Where-Object {$_.Name -in @('Pester','PSExcel','powershell-yaml','PSScriptAnalyzer')}
```

---

## 🛠️ HERRAMIENTAS EXTERNAS REQUERIDAS

### Pandoc (Conversión de Documentos)

**Propósito:** Convertir archivos Markdown (.md) a Word (.docx) y HTML (.html)

**Versión mínima:** 2.19  
**Versión recomendada:** 3.1+

#### Instalación Windows

```powershell
# Opción 1: Winget (Recomendado)
winget install --id JohnMacFarlane.Pandoc

# Opción 2: Chocolatey
choco install pandoc

# Opción 3: Instalador MSI
# Descargar desde: https://pandoc.org/installing.html
```

#### Instalación Linux

```bash
# Ubuntu/Debian
sudo apt-get install pandoc

# Fedora/RHEL
sudo dnf install pandoc
```

#### Instalación macOS

```bash
# Homebrew
brew install pandoc
```

#### Verificar Instalación

```powershell
# Verificar versión
pandoc --version

# Debe mostrar: pandoc 3.1.x o superior
```

### Git (Control de Versiones)

**Propósito:** Gestión de versiones, sincronización con GitHub

**Versión mínima:** 2.38  
**Versión recomendada:** 2.43+

#### Instalación Windows

```powershell
# Winget
winget install --id Git.Git

# Chocolatey
choco install git
```

#### Instalación Linux

```bash
# Ubuntu/Debian
sudo apt-get install git

# Fedora/RHEL
sudo dnf install git
```

#### Instalación macOS

```bash
# Homebrew
brew install git

# O usar Xcode Command Line Tools
xcode-select --install
```

#### Verificar Instalación

```bash
git --version
# Debe mostrar: git version 2.43.x o superior
```

### Node.js (Opcional - Para Desarrollo Web)

**Propósito:** Validación de archivos JSON/JS, servidor local

**Versión mínima:** 18 LTS  
**Versión recomendada:** 20 LTS

#### Instalación Windows

```powershell
# Winget
winget install --id OpenJS.NodeJS.LTS

# Chocolatey
choco install nodejs-lts
```

#### Instalación Linux

```bash
# Ubuntu/Debian (via NodeSource)
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
```

#### Instalación macOS

```bash
# Homebrew
brew install node@20
```

#### Verificar Instalación

```bash
node --version
npm --version
```

---

## 🔧 CONFIGURACIÓN DEL ENTORNO

### 1. Clonar Repositorio

```bash
# HTTPS (Recomendado para lectura)
git clone https://github.com/dieleoz/LD-CH.git

# SSH (Para contribuidores)
git clone git@github.com:dieleoz/LD-CH.git
```

### 2. Configurar Credenciales

```powershell
# Ver archivo CREDENCIALES_PORTAL.md
# (Solicitar a PMO si no lo tienes)

# Copiar plantilla de configuración
Copy-Item ".env.example" -Destination "config/local.config.ps1"

# Editar con tus credenciales
notepad "config/local.config.ps1"
```

### 3. Validar Entorno

```powershell
# Ejecutar script de validación
.\scripts\validar_entorno.ps1

# Debe mostrar:
# ✅ PowerShell 7.4.x
# ✅ Módulo Pester instalado
# ✅ Módulo PSExcel instalado
# ✅ Pandoc 3.1.x instalado
# ✅ Git 2.43.x instalado
# ✅ Configuración local encontrada
```

---

## 🧪 SCRIPT DE VALIDACIÓN AUTOMÁTICA

### Archivo: `scripts/validar_entorno.ps1`

```powershell
# ================================================================
# SCRIPT: validar_entorno.ps1
# Valida que todas las dependencias estén instaladas correctamente
# ================================================================

Write-Host "`n🔍 VALIDANDO ENTORNO DEL SISTEMA WBS..." -ForegroundColor Cyan
Write-Host "=" * 60 -ForegroundColor Gray

$errores = 0

# 1. Verificar PowerShell
Write-Host "`n1️⃣ PowerShell..." -NoNewline
if ($PSVersionTable.PSVersion.Major -ge 7 -and $PSVersionTable.PSVersion.Minor -ge 2) {
    Write-Host " ✅ $($PSVersionTable.PSVersion)" -ForegroundColor Green
} else {
    Write-Host " ❌ Versión $($PSVersionTable.PSVersion) - Se requiere 7.2+" -ForegroundColor Red
    $errores++
}

# 2. Verificar Módulos
$modulosRequeridos = @('Pester', 'PSExcel', 'powershell-yaml')
Write-Host "`n2️⃣ Módulos PowerShell:"
foreach ($modulo in $modulosRequeridos) {
    Write-Host "   - $modulo..." -NoNewline
    $instalado = Get-Module -ListAvailable -Name $modulo
    if ($instalado) {
        Write-Host " ✅ v$($instalado.Version)" -ForegroundColor Green
    } else {
        Write-Host " ❌ NO INSTALADO" -ForegroundColor Red
        Write-Host "      Ejecutar: Install-Module -Name $modulo -Force" -ForegroundColor Yellow
        $errores++
    }
}

# 3. Verificar Pandoc
Write-Host "`n3️⃣ Pandoc..." -NoNewline
try {
    $pandocVersion = & pandoc --version 2>&1 | Select-Object -First 1
    if ($pandocVersion -match '(\d+\.\d+)') {
        Write-Host " ✅ $pandocVersion" -ForegroundColor Green
    } else {
        throw "Versión no detectada"
    }
} catch {
    Write-Host " ❌ NO INSTALADO" -ForegroundColor Red
    Write-Host "      Instalar desde: https://pandoc.org/installing.html" -ForegroundColor Yellow
    $errores++
}

# 4. Verificar Git
Write-Host "`n4️⃣ Git..." -NoNewline
try {
    $gitVersion = & git --version 2>&1
    Write-Host " ✅ $gitVersion" -ForegroundColor Green
} catch {
    Write-Host " ❌ NO INSTALADO" -ForegroundColor Red
    $errores++
}

# 5. Verificar Credenciales
Write-Host "`n5️⃣ Credenciales..." -NoNewline
if (Test-Path "CREDENCIALES_PORTAL.md") {
    Write-Host " ✅ CREDENCIALES_PORTAL.md encontrado" -ForegroundColor Green
} else {
    Write-Host " ⚠️ CREDENCIALES_PORTAL.md no encontrado" -ForegroundColor Yellow
    Write-Host "      (Solicitar a PMO del proyecto)" -ForegroundColor Gray
}

# Resumen
Write-Host "`n" + ("=" * 60) -ForegroundColor Gray
if ($errores -eq 0) {
    Write-Host "✅ ENTORNO VALIDADO - Listo para usar" -ForegroundColor Green
    exit 0
} else {
    Write-Host "❌ $errores ERROR(ES) ENCONTRADO(S) - Corregir antes de continuar" -ForegroundColor Red
    exit 1
}
```

---

## 📊 MATRIZ DE COMPATIBILIDAD

### Scripts Críticos vs Requisitos

| Script | PowerShell | Pandoc | PSExcel | YAML | Pester |
|:-------|:-----------|:-------|:--------|:-----|:-------|
| `cocinar.ps1` | ✅ 7.2+ | ❌ No | ❌ No | ✅ Sí | ❌ No |
| `servir.ps1` | ✅ 7.2+ | ✅ Sí | ❌ No | ❌ No | ❌ No |
| `servir_ingenieria_completo.ps1` | ✅ 7.2+ | ✅ Sí | ❌ No | ✅ Sí | ❌ No |
| `sincronizar_SISTEMA_COMPLETO_v14.3.ps1` | ✅ 7.2+ | ❌ No | ❌ No | ❌ No | ❌ No |
| `regenerar_fibra_1824_cajas.ps1` | ✅ 7.2+ | ❌ No | ❌ No | ❌ No | ❌ No |
| `actualizar_documentos_detalle.ps1` | ✅ 7.2+ | ❌ No | ❌ No | ✅ Sí | ❌ No |
| `sync_wbs_simple.ps1` | ✅ 7.2+ | ❌ No | ✅ Sí | ❌ No | ❌ No |
| Tests (`*.Tests.ps1`) | ✅ 7.2+ | ❌ No | ❌ No | ❌ No | ✅ Sí |

### Plataformas Soportadas

| Plataforma | Soporte | Scripts Funcionales | Notas |
|:-----------|:--------|:--------------------|:------|
| **Windows 10/11** | ✅ COMPLETO | 100% (58/58) | Plataforma principal |
| **Ubuntu 20.04+** | ✅ COMPLETO | 95% (55/58) | Pandoc requiere config adicional |
| **macOS 12+** | 🟡 PARCIAL | 90% (52/58) | Rutas requieren adaptación |

---

## 🆘 SOLUCIÓN DE PROBLEMAS COMUNES

### Error: "No se puede ejecutar scripts en este sistema"

**Causa:** Política de ejecución de PowerShell restrictiva

**Solución:**
```powershell
# Ejecutar como Administrador
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Error: "Pandoc not found"

**Causa:** Pandoc no está en el PATH del sistema

**Solución Windows:**
```powershell
# Agregar manualmente al PATH
$env:Path += ";C:\Program Files\Pandoc\"

# O reinstalar con winget (agrega automáticamente)
winget install --id JohnMacFarlane.Pandoc
```

### Error: "Module 'Pester' not found"

**Causa:** Módulo no instalado

**Solución:**
```powershell
Install-Module -Name Pester -Force -Scope CurrentUser
```

### Error: "Access to the path is denied"

**Causa:** Permisos insuficientes

**Solución:**
```powershell
# Ejecutar PowerShell como Administrador
# O cambiar permisos de la carpeta
```

---

## 📚 REFERENCIAS

**Documentación oficial:**
- [PowerShell Documentation](https://docs.microsoft.com/powershell)
- [Pandoc User's Guide](https://pandoc.org/MANUAL.html)
- [Pester Documentation](https://pester.dev/)
- [Git Documentation](https://git-scm.com/doc)

**Documentos del proyecto:**
- `README.md` - Documentación principal
- `MEJORAS_PROPUESTAS.md` - Mejoras de seguridad
- `VARIABLES_ENTORNO_PORTAL.md` - Configuración de variables
- `scripts/README_SCRIPTS.md` - Documentación de scripts

---

## 📞 SOPORTE

**Equipo TI / DevOps:**
- Email: ti@proyecto-ld-ch.com
- Ticket interno: Sistema de tickets del proyecto

**PMO:**
- Email: pmo@proyecto-ld-ch.com
- Para solicitudes de acceso y credenciales

---

**Documento creado:** 12 de Octubre 2025  
**Versión:** 1.0  
**Próxima revisión:** Mensual  
**Mantenido por:** Equipo TI / DevOps

