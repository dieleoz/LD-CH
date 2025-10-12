# VARIABLES DE ENTORNO - PORTAL WEB
## Sistema WBS Interactivo v14.7
## Proyecto APP La Dorada-Chiriguaná

---

## 📋 PROPÓSITO

Este documento describe las variables de entorno requeridas para el funcionamiento seguro del portal web y sistema WBS.

**Objetivo:** Externalizar credenciales y configuraciones sensibles del código fuente.

---

## 🔐 VARIABLES DE AUTENTICACIÓN

### Portal Web (GitHub Pages)

| Variable | Descripción | Ejemplo | Requerido |
|:---------|:------------|:--------|:----------|
| `PORTAL_USERNAME` | Usuario de acceso al portal | `usuario_ejemplo` | ✅ SÍ |
| `PORTAL_PASSWORD` | Contraseña de acceso | `********` | ✅ SÍ |
| `PORTAL_URL` | URL del portal publicado | `https://dieleoz.github.io/LD-CH/` | ✅ SÍ |

**Ubicación real de credenciales:**
- Archivo: `CREDENCIALES_PORTAL.md` (excluido de git)
- Ubicación: Raíz del proyecto (solo local)
- Acceso: Restringido a personal autorizado

---

## 🛠️ VARIABLES DE CONFIGURACIÓN

### Scripts PowerShell

| Variable | Descripción | Valor por defecto | Configurable |
|:---------|:------------|:------------------|:-------------|
| `WBS_ROOT_PATH` | Ruta raíz del proyecto | `D:\one drive grupo ortiz...` | ✅ SÍ |
| `PANDOC_PATH` | Ruta ejecutable Pandoc | `C:\Program Files\Pandoc\pandoc.exe` | ✅ SÍ |
| `ENABLE_DRY_RUN` | Modo simulación (no ejecuta cambios) | `$false` | ✅ SÍ |
| `LOG_LEVEL` | Nivel de logging | `INFO` | ✅ SÍ |

### Sistema de Sincronización

| Variable | Descripción | Valor por defecto | Configurable |
|:---------|:------------|:------------------|:-------------|
| `AUTO_SYNC_ENABLED` | Sincronización automática | `$true` | ✅ SÍ |
| `SYNC_INTERVAL_SECONDS` | Intervalo de sincronización | `300` (5 min) | ✅ SÍ |
| `BACKUP_ENABLED` | Crear backups antes de cambios | `$true` | ✅ SÍ |

---

## 📁 ARCHIVOS DE CONFIGURACIÓN

### Estructura Recomendada

```
Proyecto/
├── CREDENCIALES_PORTAL.md (⚠️ NUNCA en git)
├── VARIABLES_ENTORNO_PORTAL.md (📋 Documentación)
├── .gitignore (🔒 Excluye credenciales)
└── config/
    ├── local.config.ps1 (⚠️ Local, no en git)
    └── default.config.ps1 (✅ Plantilla, en git)
```

### .gitignore (Verificar)

```gitignore
# Credenciales y configuraciones sensibles
CREDENCIALES_PORTAL.md
config/local.config.ps1
*.credentials.json
.env
.env.local
```

---

## 🔧 CONFIGURACIÓN INICIAL

### Paso 1: Obtener Credenciales

```powershell
# Solicitar a PMO del proyecto
# Recibirás archivo: CREDENCIALES_PORTAL.md
```

### Paso 2: Colocar en Ubicación Correcta

```powershell
# Copiar archivo a raíz del proyecto
Copy-Item "C:\temp\CREDENCIALES_PORTAL.md" -Destination $PWD
```

### Paso 3: Verificar Exclusión de Git

```powershell
# Confirmar que archivo está en .gitignore
git check-ignore CREDENCIALES_PORTAL.md
# Debe retornar: CREDENCIALES_PORTAL.md
```

### Paso 4: Validar Entorno

```powershell
# Ejecutar script de validación
.\scripts\validar_entorno.ps1
```

---

## 🔒 MEJORES PRÁCTICAS DE SEGURIDAD

### ✅ HACER (DO)

1. **Mantener credenciales locales**
   - Archivo CREDENCIALES_PORTAL.md solo en máquinas autorizadas
   - No enviar por correo sin cifrar
   - Usar canales seguros (SharePoint, Teams cifrado)

2. **Rotar credenciales periódicamente**
   - Cada 90 días (obligatorio)
   - Inmediato si hay compromiso
   - Al cambiar personal del proyecto

3. **Usar variables de entorno**
   - Scripts lean desde archivo de configuración
   - No hardcodear credenciales en código
   - Validar existencia antes de usar

4. **Documentar accesos**
   - Registrar quién tiene credenciales
   - Fecha de provisión
   - Motivo de acceso

### ❌ NO HACER (DON'T)

1. **NUNCA subir credenciales a git**
   - No hacer commit de CREDENCIALES_PORTAL.md
   - No incluir en README.md
   - No documentar en issues/PRs públicos

2. **No compartir en canales inseguros**
   - No enviar por WhatsApp/Telegram
   - No escribir en Slack público
   - No pegar en código fuente

3. **No usar credenciales débiles**
   - Mínimo 12 caracteres
   - Incluir mayúsculas, minúsculas, números, símbolos
   - No usar palabras del diccionario

4. **No reutilizar credenciales**
   - Diferentes para prod/dev
   - Diferentes por ambiente
   - Únicas por proyecto

---

## 📊 AUDITORÍA Y MONITOREO

### Logs de Acceso

```powershell
# Revisar accesos al portal (GitHub Pages Analytics)
# Monitorear patrones anormales de uso
```

### Alertas de Seguridad

| Evento | Acción |
|:-------|:-------|
| 5+ intentos fallidos de login | Bloquear IP por 5 minutos |
| Acceso desde IP no autorizada | Alertar a PMO |
| Credenciales comprometidas | Rotación inmediata |

---

## 🆘 SOPORTE Y CONTACTO

### Solicitar Credenciales
- **Email:** pmo@proyecto-ld-ch.com
- **Tiempo respuesta:** 24-48 horas hábiles

### Reportar Problemas de Seguridad
- **Email urgente:** seguridad@proyecto-ld-ch.com
- **Teléfono PMO:** [Número confidencial]

### Cambiar Credenciales
- **Proceso:** Solicitar a PMO con justificación
- **Tiempo:** 1-2 horas hábiles

---

## 📚 REFERENCIAS

**Documentos relacionados:**
- `CREDENCIALES_PORTAL.md` - Credenciales reales (confidencial)
- `MEJORAS_PROPUESTAS.md` - Análisis de seguridad
- `README.md` - Documentación principal (sin credenciales)
- `.gitignore` - Archivos excluidos de git

**Estándares aplicados:**
- OWASP Top 10 - Seguridad de aplicaciones web
- NIST SP 800-63B - Gestión de credenciales
- ISO 27001 - Gestión de seguridad de la información

---

**Documento creado:** 12 de Octubre 2025  
**Versión:** 1.0  
**Responsable:** PMO / Seguridad TI  
**Próxima revisión:** Mensual

