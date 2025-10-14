# 🔧 GUÍA: Configurar Git en Nuevo PC

**Fecha:** 14 de Octubre 2025  
**Situación:** Nuevo entorno, Git no configurado  
**Objetivo:** Poder hacer commits y push a GitHub

---

## 🎯 **OPCIÓN 1: INSTALAR GIT (SI NO ESTÁ INSTALADO)**

### **Método 1A: Winget (PowerShell - RECOMENDADO)**

```powershell
# Instalar Git con winget
winget install --id Git.Git -e --source winget

# Después de instalar, REINICIAR PowerShell
# Verificar instalación:
git --version
```

**Tiempo:** ~2 minutos

---

### **Método 1B: Descarga manual**

1. Ir a: https://git-scm.com/download/win
2. Descargar instalador de 64-bit
3. Ejecutar instalador con opciones por defecto
4. **IMPORTANTE:** Marcar opción "Git from the command line and also from 3rd-party software"
5. Reiniciar PowerShell
6. Verificar: `git --version`

**Tiempo:** ~5 minutos

---

## 🔐 **OPCIÓN 2: CONFIGURAR GIT (PRIMERA VEZ)**

### **Paso 1: Configurar identidad**

```powershell
# Configurar nombre (reemplaza con tu nombre)
git config --global user.name "Diego Zuñiga"

# Configurar email (el mismo de GitHub)
git config --global user.email "tu.email@grupoortiz.com"

# Verificar configuración
git config --global --list
```

### **Paso 2: Autenticación con GitHub**

**Opción 2A: GitHub CLI (Recomendado)**

```powershell
# Instalar GitHub CLI
winget install --id GitHub.cli

# Autenticar
gh auth login

# Seguir prompts:
# - GitHub.com
# - HTTPS
# - Yes (authenticate Git)
# - Login with a web browser
```

**Opción 2B: Personal Access Token**

1. Ir a: https://github.com/settings/tokens
2. Click: "Generate new token (classic)"
3. Nombre: "LD-CH PC Nuevo"
4. Permisos: `repo` (full control)
5. Generar y copiar token
6. Guardar en lugar seguro

**En el primer push te pedirá:**
- Username: `dieleoz`
- Password: `[pegar el token]`

---

## ✅ **OPCIÓN 3: USAR GITHUB DESKTOP (MÁS FÁCIL)**

### **Si NO quieres configurar Git en terminal:**

1. **Descargar GitHub Desktop:**
   - https://desktop.github.com/
   - Instalar con opciones por defecto

2. **Configurar:**
   - Abrir GitHub Desktop
   - Sign in con tu cuenta GitHub
   - Autorizar aplicación

3. **Abrir repositorio:**
   - File → Add Local Repository
   - Seleccionar carpeta: `D:\onedrive\OneDrive - Grupo Ortiz\LFC\02. Ingenieria\02. Ingenieria Conceptual\0.0 Formatos para IA`
   - Click "Add Repository"

4. **Hacer commit:**
   - Verás 12 archivos modificados
   - Escribir mensaje del commit
   - Click "Commit to main"
   - Click "Push origin"

**Ventaja:** No requiere configuración de terminal, todo es visual.

---

## 🚀 **FLUJO RÁPIDO: PRIMEROS PASOS**

### **Si Git NO está instalado:**

```powershell
# 1. Instalar Git
winget install --id Git.Git -e --source winget

# 2. REINICIAR PowerShell (importante!)
exit

# 3. Abrir nuevo PowerShell y navegar al proyecto
cd "d:\onedrive\OneDrive - Grupo Ortiz\LFC\02. Ingenieria\02. Ingenieria Conceptual\0.0 Formatos para IA"

# 4. Verificar Git
git --version

# 5. Configurar identidad
git config --global user.name "Diego Zuñiga"
git config --global user.email "diego.zuniga@grupoortiz.com"

# 6. Verificar estado del repo
git status

# 7. Hacer commit (usar script .bat)
.\GIT_COMMIT_v14.7.6.bat
```

---

### **Si Git YA está instalado pero no funciona:**

```powershell
# Agregar Git al PATH de esta sesión
$env:Path += ";C:\Program Files\Git\cmd"

# Verificar
git --version

# Si funciona, hacer permanente:
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\Git\cmd", "User")
```

---

## 🎯 **MI RECOMENDACIÓN**

### **Para ti (nuevo PC):**

**Usa GitHub Desktop** (Opción 3):
- ✅ Instalación simple
- ✅ No requiere configurar terminal
- ✅ Interfaz visual amigable
- ✅ Autenticación automática
- ✅ Sin comandos que memorizar

**Tiempo total:** 5 minutos (descarga + instalación + primer commit)

---

### **Después de configurar (cualquier método):**

Ejecuta este script para verificar:

```powershell
# Test de configuración Git
Write-Host "`n🔍 VERIFICACIÓN GIT" -ForegroundColor Cyan
Write-Host "==================`n" -ForegroundColor Cyan

# Test 1: Git instalado
try {
    $gitVersion = git --version
    Write-Host "✅ Git instalado: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Git NO encontrado" -ForegroundColor Red
    Write-Host "   Instalar con: winget install Git.Git" -ForegroundColor Yellow
}

# Test 2: Configuración
try {
    $userName = git config --global user.name
    $userEmail = git config --global user.email
    Write-Host "✅ Usuario: $userName" -ForegroundColor Green
    Write-Host "✅ Email: $userEmail" -ForegroundColor Green
} catch {
    Write-Host "❌ Git no configurado" -ForegroundColor Red
}

# Test 3: Repo actual
try {
    $repoUrl = git remote get-url origin
    Write-Host "✅ Repo conectado: $repoUrl" -ForegroundColor Green
} catch {
    Write-Host "❌ No es un repositorio Git" -ForegroundColor Red
}

Write-Host ""
```

---

## 📋 **GUARDA ESTA INFO**

**Repositorio GitHub:**
- URL: https://github.com/dieleoz/LD-CH
- Branch: main
- Usuario: dieleoz

**Después de configurar Git, ejecuta:**
```cmd
.\GIT_COMMIT_v14.7.6.bat
```

Y estarás listo! 🚀

---

**¿Qué método prefieres usar?**
1. Instalar Git + configurar terminal
2. Usar GitHub Desktop (más fácil)

