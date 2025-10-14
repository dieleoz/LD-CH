# 🚀 GUÍA: Migrar Git a Nuevo PC
## Proyecto APP La Dorada-Chiriguaná

**Fecha:** 14 de Octubre 2025  
**Situación:** Migración de PC  
**Objetivo:** Configurar Git en nuevo portátil con acceso completo

---

## 📍 **PASO 1: EXTRAER CREDENCIALES DEL PC ACTUAL**

### **Método 1: Ver Token desde Windows Credential Manager**

1. **Abrir Credential Manager:**
   - Presiona `Windows + R`
   - Escribe: `control /name Microsoft.CredentialManager`
   - Presiona Enter

2. **Buscar credencial de GitHub:**
   - Click en "Credenciales de Windows"
   - Busca: `git:https://github.com`
   - Click en la flecha para expandir
   - Click en "Mostrar" junto a "Contraseña"
   - Te pedirá tu contraseña de Windows
   - **COPIAR Y GUARDAR** ese token (es tu Personal Access Token)

### **Método 2: Desde PowerShell (alternativo)**

```powershell
# Ver si existe la credencial
cmdkey /list | findstr git

# Resultado esperado:
# Destino: LegacyGeneric:target=git:https://github.com
```

**⚠️ IMPORTANTE:** El token es como una contraseña larga (tipo: `ghp_xxxxxxxxxxxxxxxxxxxx`). Guárdalo en lugar seguro.

---

## 💾 **INFORMACIÓN ACTUAL DE TU CONFIGURACIÓN**

### **Repositorio GitHub:**
```
URL: https://github.com/dieleoz/LD-CH.git
Usuario: dieleoz
Rama: main
```

### **Tu configuración Git:**
```
Nombre: Diego Leoz
Email: dieleoz@example.com
```

### **Credenciales guardadas en:**
```
Windows Credential Manager
Destino: git:https://github.com
```

---

## 🔧 **PASO 2: CONFIGURAR EL NUEVO PC**

### **Opción A: INSTALACIÓN RÁPIDA (Recomendada)**

#### **1. Instalar Git**

```powershell
# Opción 1: Con winget (más rápido)
winget install --id Git.Git -e --source winget

# Opción 2: Manual
# Ir a: https://git-scm.com/download/win
# Descargar e instalar
```

#### **2. Configurar Git**

```powershell
# Configurar tu identidad
git config --global user.name "Diego Leoz"
git config --global user.email "dieleoz@example.com"

# Configurar el helper de credenciales
git config --global credential.helper manager

# Verificar configuración
git config --global --list
```

#### **3. Clonar el repositorio**

```powershell
# Navegar a la carpeta deseada
cd "D:\OneDrive - Grupo Ortiz\LFC\02. Ingenieria\02. Ingenieria Conceptual"

# Clonar el repositorio
git clone https://github.com/dieleoz/LD-CH.git "0.0 Formatos para IA"

# Te pedirá:
# Usuario: dieleoz
# Contraseña: [PEGAR EL TOKEN QUE GUARDASTE]
```

#### **4. Listo!**

El token quedará guardado en el Credential Manager del nuevo PC y no te volverá a pedir credenciales.

---

### **Opción B: USAR GITHUB DESKTOP (Más fácil, sin comandos)**

#### **1. Instalar GitHub Desktop**

- Ir a: https://desktop.github.com/
- Descargar e instalar
- Abrir GitHub Desktop

#### **2. Autenticar**

- File → Options → Sign in
- Iniciar sesión con tu cuenta GitHub (navegador)
- Autorizar GitHub Desktop

#### **3. Clonar repositorio**

- File → Clone repository
- Buscar: `LD-CH`
- Seleccionar ruta local: `D:\OneDrive - Grupo Ortiz\LFC\02. Ingenieria\02. Ingenieria Conceptual\0.0 Formatos para IA`
- Click "Clone"

#### **4. Listo!**

Todo funcionará automáticamente desde la interfaz visual.

---

## 🔑 **PASO 3: GUARDAR EL TOKEN (IMPORTANTE)**

### **Donde guardar el token:**

1. **En un gestor de contraseñas** (recomendado):
   - LastPass, 1Password, Bitwarden, etc.
   - Título: "GitHub - Token LD-CH"

2. **En archivo cifrado**:
   - Crear archivo: `GITHUB_TOKEN_PRIVADO.txt`
   - Guardarlo SOLO en OneDrive personal (NO en el repo)
   - Agregarlo al `.gitignore` si está en la carpeta del proyecto

3. **NUNCA:**
   - ❌ Subirlo a GitHub
   - ❌ Enviarlo por email sin cifrar
   - ❌ Guardarlo en archivos del repositorio

---

## 📋 **PASO 4: VERIFICAR CONFIGURACIÓN EN NUEVO PC**

### **Script de verificación:**

Guarda este script como `VERIFICAR_GIT_NUEVO_PC.ps1`:

```powershell
Write-Host "`n🔍 VERIFICACIÓN GIT - NUEVO PC" -ForegroundColor Cyan
Write-Host "==============================`n" -ForegroundColor Cyan

# Test 1: Git instalado
try {
    $gitVersion = git --version
    Write-Host "✅ Git instalado: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Git NO encontrado" -ForegroundColor Red
    Write-Host "   Instalar con: winget install Git.Git" -ForegroundColor Yellow
    exit
}

# Test 2: Configuración global
$userName = git config --global user.name
$userEmail = git config --global user.email
$credHelper = git config --global credential.helper

if ($userName -and $userEmail) {
    Write-Host "✅ Usuario: $userName" -ForegroundColor Green
    Write-Host "✅ Email: $userEmail" -ForegroundColor Green
    Write-Host "✅ Credential Helper: $credHelper" -ForegroundColor Green
} else {
    Write-Host "❌ Git no configurado completamente" -ForegroundColor Red
    Write-Host "   Ejecutar:" -ForegroundColor Yellow
    Write-Host '   git config --global user.name "Diego Leoz"' -ForegroundColor Yellow
    Write-Host '   git config --global user.email "dieleoz@example.com"' -ForegroundColor Yellow
}

# Test 3: Credenciales guardadas
$credStored = cmdkey /list | Select-String "git:https://github.com"
if ($credStored) {
    Write-Host "✅ Credenciales GitHub guardadas en Windows" -ForegroundColor Green
} else {
    Write-Host "⚠️  Credenciales NO guardadas aún" -ForegroundColor Yellow
    Write-Host "   Se pedirán en el primer push" -ForegroundColor Yellow
}

# Test 4: Repositorio local
if (Test-Path ".git") {
    $repoUrl = git remote get-url origin
    $branch = git branch --show-current
    Write-Host "✅ Repositorio: $repoUrl" -ForegroundColor Green
    Write-Host "✅ Rama actual: $branch" -ForegroundColor Green
    
    # Test 5: Estado sincronización
    git fetch
    $status = git status -sb
    Write-Host "✅ Estado: $status" -ForegroundColor Green
} else {
    Write-Host "⚠️  No estás en un repositorio Git" -ForegroundColor Yellow
    Write-Host "   Navega a la carpeta del proyecto o clona el repo" -ForegroundColor Yellow
}

Write-Host "`n✅ VERIFICACIÓN COMPLETA`n" -ForegroundColor Green
```

---

## 🎯 **RESUMEN RÁPIDO**

### **En el PC ACTUAL (hoy):**

1. ✅ Extraer token desde Credential Manager
2. ✅ Guardarlo en lugar seguro
3. ✅ Guardar esta guía

### **En el PC NUEVO (cuando migres):**

1. ✅ Instalar Git o GitHub Desktop
2. ✅ Configurar usuario/email
3. ✅ Clonar repositorio (te pedirá el token)
4. ✅ Verificar que todo funciona

### **Tiempo estimado:** 10-15 minutos

---

## 📞 **INFORMACIÓN DE CONTACTO**

### **Repositorio:**
- **GitHub:** https://github.com/dieleoz/LD-CH
- **Usuario:** dieleoz
- **Portal Web:** https://dieleoz.github.io/LD-CH/

### **Si tienes problemas:**

1. **Token perdido/expirado:**
   - Ir a: https://github.com/settings/tokens
   - Generate new token (classic)
   - Permisos: `repo` (full control)
   - Copiar y guardar el nuevo token

2. **No puedes hacer push:**
   - Verificar credenciales: `git config --global --list`
   - Verificar token: Credential Manager → git:https://github.com
   - Re-autenticar: Hacer push y pegar token cuando pida

3. **Repositorio no clona:**
   - Verificar conexión internet
   - Verificar URL: `https://github.com/dieleoz/LD-CH.git`
   - Verificar token tiene permisos `repo`

---

## 🔐 **SEGURIDAD**

### **Token de acceso:**
- ✅ Trátalo como una contraseña
- ✅ Guárdalo cifrado
- ✅ No lo compartas
- ✅ Renuévalo cada 90 días
- ✅ Revócalo si se compromete

### **Backup:**
- ✅ Todo el código está en GitHub
- ✅ OneDrive sincroniza automáticamente
- ✅ No perderás trabajo

---

## ✅ **CHECKLIST DE MIGRACIÓN**

### **Antes de cambiar de PC:**
- [ ] Extraer token de Credential Manager
- [ ] Guardar token en lugar seguro
- [ ] Verificar que todo está pusheado a GitHub
- [ ] Guardar esta guía

### **En el nuevo PC:**
- [ ] Instalar Git o GitHub Desktop
- [ ] Configurar user.name y user.email
- [ ] Clonar repositorio LD-CH
- [ ] Pegar token cuando se solicite
- [ ] Verificar con `VERIFICAR_GIT_NUEVO_PC.ps1`
- [ ] Hacer un commit de prueba

### **Verificación final:**
- [ ] `git status` funciona
- [ ] `git pull` funciona
- [ ] `git push` funciona
- [ ] Archivos sincronizados correctamente

---

**Última actualización:** 14 de Octubre 2025  
**Versión:** 1.0  
**Para:** Migración de PC  
**Proyecto:** APP La Dorada-Chiriguaná v14.7.6

**¡Éxito en tu migración! 🚀**

