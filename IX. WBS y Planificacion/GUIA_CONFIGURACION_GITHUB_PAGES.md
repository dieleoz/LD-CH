# 🌐 GUÍA: CONFIGURAR GITHUB PAGES - PORTAL WEB
**Repositorio:** https://github.com/dieleoz/LD-CH  
**Fecha:** 10 de Octubre 2025  
**Tiempo estimado:** 5 minutos

---

## 🎯 **OBJETIVO**

Publicar el Sistema WBS v14.6 en la web con GitHub Pages para que sea accesible desde cualquier navegador con las credenciales:
- **Usuario:** `0rt1z`
- **Contraseña:** `0rt1z`

---

## 📋 **PASOS DETALLADOS**

### **PASO 1: Ir a Configuración del Repositorio**

1. Abre tu navegador web
2. Ve a: **https://github.com/dieleoz/LD-CH**
3. En la parte superior del repositorio, busca la pestaña **"⚙️ Settings"**
4. Haz clic en **"Settings"**

**Captura visual:**
```
[Code] [Issues] [Pull requests] [Actions] [Projects] [Security] [⚙️ Settings]
                                                                      ↑
                                                                  Haz clic aquí
```

---

### **PASO 2: Ir a la Sección Pages**

1. En el menú lateral izquierdo, busca la sección **"Code and automation"**
2. Dentro de esa sección, busca **"Pages"**
3. Haz clic en **"Pages"**

**Ruta en el menú:**
```
Settings
├── General
├── Access
│   ├── Collaborators
│   └── Moderation
├── Code and automation
│   ├── Branches
│   ├── Tags
│   ├── Rules
│   ├── Actions
│   ├── Webhooks
│   ├── Environments
│   └── 📄 Pages  ← HAZ CLIC AQUÍ
└── ...
```

---

### **PASO 3: Configurar la Fuente (Source)**

En la página de GitHub Pages verás una sección llamada **"Build and deployment"**.

1. **En "Source":**
   - Selecciona: **"Deploy from a branch"** (por defecto)

2. **En "Branch":**
   - **Primer dropdown:** Selecciona **`main`**
   - **Segundo dropdown:** Selecciona **`/ (root)`**
   
   ```
   Branch: [main ▼] [/ (root) ▼] [Save]
            ↑          ↑           ↑
         Rama      Carpeta    Guardar
   ```

3. Haz clic en el botón **"Save"**

---

### **PASO 4: Esperar el Despliegue (2-3 minutos)**

1. Después de hacer clic en "Save", GitHub comenzará a construir tu sitio
2. Verás un mensaje: **"Your site is being built from the `main` branch"**
3. Refresca la página cada 30 segundos
4. Cuando esté listo, verás:
   ```
   ✅ Your site is live at https://dieleoz.github.io/LD-CH/
   ```

---

### **PASO 5: Acceder a Tu Sitio Web**

1. Abre una nueva pestaña del navegador
2. Ve a: **https://dieleoz.github.io/LD-CH/**
3. Verás la pantalla de login del portal
4. Ingresa las credenciales:
   - **Usuario:** `0rt1z`
   - **Contraseña:** `0rt1z`
5. ¡Accederás al Portal WBS!

---

## ✅ **VERIFICACIÓN**

### **¿Cómo sé que está funcionando?**

**Pantalla de login debe mostrar:**
- 🚂 Título: "Sistema WBS"
- Subtítulo: "APP La Dorada-Chiriguaná"
- Badge: "v14.6 | Acceso Seguro"
- Campos: Usuario y Contraseña
- Botón: "Acceder al Sistema"

**Después del login exitoso:**
- 🎯 Portal con dashboard
- 📊 Métricas: 181 Documentos, 6 Interfaces, 17 Riesgos, $307B
- 6 tarjetas de acceso rápido a interfaces

---

## 🔧 **CONFIGURACIÓN AVANZADA (OPCIONAL)**

### **Dominio Personalizado:**

Si tienes un dominio propio (ej: `wbs.grupoortiz.com`):

1. En la misma página de GitHub Pages
2. Sección **"Custom domain"**
3. Ingresa tu dominio
4. Configura DNS según instrucciones de GitHub

---

### **HTTPS Forzado:**

1. En la página de GitHub Pages
2. Marca la casilla **"Enforce HTTPS"** ✅
3. Esto garantiza conexión segura (recomendado)

---

## 🚨 **SOLUCIÓN DE PROBLEMAS**

### **Problema 1: "404 Page Not Found"**

**Causa:** GitHub Pages aún no terminó de construir el sitio  
**Solución:** Espera 3-5 minutos y refresca

---

### **Problema 2: "Styles not loading"**

**Causa:** Rutas relativas en CSS/JS  
**Solución:** Ya resuelto - el index.html usa rutas relativas correctas

---

### **Problema 3: "index.html shows code instead of rendering"**

**Causa:** Extensión incorrecta o encoding  
**Solución:** Ya resuelto - archivo UTF-8 con extensión .html

---

### **Problema 4: Login no funciona**

**Verificar:**
- Usuario: `0rt1z` (con cero, no letra O)
- Contraseña: `0rt1z` (con cero, no letra O)
- JavaScript habilitado en el navegador
- No hay bloqueador de scripts activo

---

## 📊 **CARACTERÍSTICAS DEL PORTAL WEB**

### **Seguridad:**
- ✅ Login con credenciales
- ✅ Session storage (persiste durante sesión)
- ✅ Logout seguro
- ⚠️ **Nota:** Autenticación básica client-side (para producción real, usar backend)

### **Funcionalidad:**
- ✅ 6 accesos directos a interfaces
- ✅ Dashboard con métricas
- ✅ Diseño responsive (móvil/tablet/desktop)
- ✅ Animaciones suaves
- ✅ UX profesional

### **Rendimiento:**
- ✅ Carga rápida (< 1 segundo)
- ✅ Sin dependencias externas
- ✅ HTML/CSS/JS vanilla

---

## 🎯 **URLS FINALES**

### **Repositorio GitHub:**
```
https://github.com/dieleoz/LD-CH
```

### **Portal Web (después de configurar Pages):**
```
https://dieleoz.github.io/LD-CH/
```

### **Interfaces Directas (después del login):**
```
https://dieleoz.github.io/LD-CH/IX. WBS y Planificacion/WBS_Menu_Principal.html
https://dieleoz.github.io/LD-CH/IX. WBS y Planificacion/WBS_Analisis_Riesgos.html
https://dieleoz.github.io/LD-CH/IX. WBS y Planificacion/WBS_Reporte_Gerencial.html
https://dieleoz.github.io/LD-CH/IX. WBS y Planificacion/WBS_Cronograma_Propuesta.html
```

---

## 🔐 **CREDENCIALES**

**Usuario:** `0rt1z`  
**Contraseña:** `0rt1z`

**⚠️ Importante:** Estas credenciales están en el código client-side (visible). Para mayor seguridad en producción, considera implementar autenticación backend.

---

## ✅ **CHECKLIST DE CONFIGURACIÓN**

- [ ] 1. Ir a https://github.com/dieleoz/LD-CH/settings/pages
- [ ] 2. En "Source": Seleccionar "Deploy from a branch"
- [ ] 3. En "Branch": Seleccionar `main` y `/ (root)`
- [ ] 4. Hacer clic en "Save"
- [ ] 5. Esperar 2-3 minutos (GitHub construye el sitio)
- [ ] 6. Refrescar la página de Settings/Pages
- [ ] 7. Ver mensaje: "Your site is live at https://dieleoz.github.io/LD-CH/"
- [ ] 8. Abrir la URL en nueva pestaña
- [ ] 9. Probar login con 0rt1z / 0rt1z
- [ ] 10. Verificar acceso al portal

---

## 🎉 **RESULTADO ESPERADO**

Después de completar estos pasos, tendrás:

1. ✅ Portal web público accesible desde cualquier lugar
2. ✅ Login de seguridad básica
3. ✅ Acceso a todas las interfaces WBS
4. ✅ Dashboard con métricas del proyecto
5. ✅ Navegación profesional y moderna

---

**¡Tu Sistema WBS v14.6 estará disponible en la web para todo tu equipo!** 🚀

---

**Documento creado:** 10 de Octubre 2025  
**Estado:** ✅ GUÍA LISTA PARA EJECUTAR

