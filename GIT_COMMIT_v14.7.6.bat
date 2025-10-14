@echo off
chcp 65001 > nul
echo.
echo ╔═══════════════════════════════════════════════════════════════╗
echo ║  GIT COMMIT v14.7.6 - Fix Arquitectónico Completo            ║
echo ╚═══════════════════════════════════════════════════════════════╝
echo.

REM Cambiar al directorio del proyecto
cd /d "%~dp0"

echo 📁 Agregando archivos modificados...
echo.

git add "README.md"
git add "@@Roadmap_v14.7_Marco_Gestion_Consolidado.md"
git add "IX. WBS y Planificacion/datos_wbs_TODOS_items.js"
git add "IX. WBS y Planificacion/WBS_COMPLETA_TODO_Interactiva_v4.0.html"
git add "scripts/extraer_todos_items_wbs.ps1"
git add "scripts/regenerar_fibra_1824_cajas.ps1"
git add "scripts/completar_37_estaciones_TETRA.ps1"
git add "IX. WBS y Planificacion/FIX_WBS_COMPLETA_14Oct2025.md"
git add "ANALISIS_ARQUITECTURA_DT_REGENERACION_v14.7.5.md"
git add "@@ARQUITECTURA_FLUJO_DT_COMPLETO_v14.7.6.md"
git add "RESUMEN_SESION_14Oct2025_v14.7.6.md"
git add "@@FIX_COMPLETO_v14.7.6_14Oct2025.md"

echo ✅ Archivos agregados
echo.
echo 💾 Creando commit...
echo.

git commit -m "v14.7.6: Fix arquitectónico completo - Sincronización automática WBS" -m "- Fix: WBS_COMPLETA_TODO HTML carga 159 ítems correctamente" -m "- Fix: Exporta window.wbsDataGlobal + window.datos_wbs (compatibilidad)" -m "- Fix: Elimina tarjetas N/A de capítulos y subcapítulos" -m "- Mejora: extraer_todos_items_wbs.ps1 genera JS automático" -m "- Mejora: regenerar_fibra sincroniza WBS (PASO 8+9)" -m "- Gap cerrado: DTs futuras mantienen sincronización" -m "- Docs: README y Roadmap v14.7.5" -m "- Sistema 100% dinámico, 0% hardcoding"

if %ERRORLEVEL% EQU 0 (
    echo ✅ Commit creado exitosamente
    echo.
    echo 🚀 Subiendo a GitHub...
    echo.
    
    git push origin main
    
    if %ERRORLEVEL% EQU 0 (
        echo.
        echo ╔═══════════════════════════════════════════════════════════════╗
        echo ║  ✅ COMMIT EXITOSO - v14.7.6 SUBIDO A GITHUB                 ║
        echo ╚═══════════════════════════════════════════════════════════════╝
        echo.
        echo 📊 12 archivos modificados subidos
        echo 🌐 GitHub Pages se actualizará en 1-2 minutos
        echo.
        echo 🔗 Verifica en:
        echo    https://dieleoz.github.io/LD-CH/IX.%%20WBS%%20y%%20Planificacion/WBS_COMPLETA_TODO_Interactiva_v4.0.html
        echo.
        echo 💡 Recuerda: Ctrl+Shift+F5 para limpiar caché del navegador
        echo.
    ) else (
        echo.
        echo ❌ Error al hacer push
        echo 💡 Verifica tu conexión a internet o credenciales Git
        echo.
    )
) else (
    echo.
    echo ❌ Error al crear commit
    echo 💡 Verifica que Git esté instalado y configurado
    echo.
)

pause

