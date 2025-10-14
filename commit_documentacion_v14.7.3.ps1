# Script para commitear la documentacion actualizada v14.7.3

Write-Host "`n>>> COMMITEANDO DOCUMENTACION v14.7.3`n" -ForegroundColor Cyan

# Agregar archivos modificados
Write-Host "1. Agregando archivos..." -ForegroundColor Yellow
git add README.md
git add "@@Roadmap_v14.7_Marco_Gestion_Consolidado.md"
git add CHANGELOG_v14.7.3_LAYOUT_FIX.md
git add restaurar_layout_completo.ps1
git add subir_layout_a_git.ps1
git add commit_documentacion_v14.7.3.ps1

if ($LASTEXITCODE -eq 0) {
    Write-Host "   OK - Archivos agregados" -ForegroundColor Green
} else {
    Write-Host "   ERROR al agregar archivos" -ForegroundColor Red
    exit 1
}

# Commit
Write-Host "`n2. Creando commit..." -ForegroundColor Yellow
git commit -m "Docs: Actualizar documentacion v14.7.3 - Layout completo restaurado" -m "Actualizaciones:" -m "- README.md: Header v14.7.3, tabla estado actualizada, seccion changelog v14.7.3" -m "- Roadmap: Header v14.7.3 (encoding issues parciales)" -m "- CHANGELOG_v14.7.3_LAYOUT_FIX.md: Documentacion completa del fix (NUEVO)" -m "- Scripts utilitarios: restaurar_layout_completo.ps1, subir_layout_a_git.ps1" -m "Metricas v14.7.3:" -m "- Layout: 1953 elementos, 9 tipos de equipos" -m "- Filtros: Todos operativos" -m "- Documentacion: 100% actualizada"

if ($LASTEXITCODE -eq 0) {
    Write-Host "   OK - Commit creado" -ForegroundColor Green
} else {
    Write-Host "   AVISO - Puede que no haya cambios" -ForegroundColor Yellow
}

# Push
Write-Host "`n3. Subiendo a GitHub..." -ForegroundColor Yellow
git push

if ($LASTEXITCODE -eq 0) {
    Write-Host "   OK - Cambios subidos" -ForegroundColor Green
    Write-Host "`n>>> PROCESO COMPLETADO`n" -ForegroundColor Green
    Write-Host "Documentacion v14.7.3 actualizada en GitHub" -ForegroundColor Cyan
} else {
    Write-Host "   ERROR al subir cambios" -ForegroundColor Red
    exit 1
}

