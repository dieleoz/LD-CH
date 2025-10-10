@echo off
echo Convirtiendo documentos ejecutivos a Word...

REM Crear directorio si no existe
if not exist "Documentos_Ejecutivos_Convertidos" mkdir "Documentos_Ejecutivos_Convertidos"

echo Convirtiendo Sistema 01...
pandoc "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS\SISTEMA_01_Control_y_Senalizacion_EJECUTIVO.md" -o "Documentos_Ejecutivos_Convertidos\SISTEMA_01_Control_y_Senalizacion_EJECUTIVO.docx"

echo Convirtiendo Sistema 02...
pandoc "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS\SISTEMA_02_Telecomunicaciones_EJECUTIVO.md" -o "Documentos_Ejecutivos_Convertidos\SISTEMA_02_Telecomunicaciones_EJECUTIVO.docx"

echo Convirtiendo Sistema 03...
pandoc "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS\SISTEMA_03_ITS_y_Seguridad_EJECUTIVO.md" -o "Documentos_Ejecutivos_Convertidos\SISTEMA_03_ITS_y_Seguridad_EJECUTIVO.docx"

echo Convirtiendo Sistema 04...
pandoc "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS\SISTEMA_04_Material_Rodante_EJECUTIVO.md" -o "Documentos_Ejecutivos_Convertidos\SISTEMA_04_Material_Rodante_EJECUTIVO.docx"

echo Convirtiendo Sistema 05...
pandoc "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS\SISTEMA_05_Infraestructura_Operativa_EJECUTIVO.md" -o "Documentos_Ejecutivos_Convertidos\SISTEMA_05_Infraestructura_Operativa_EJECUTIVO.docx"

echo Convirtiendo Sistema 06...
pandoc "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS\SISTEMA_06_Integracion_y_Coordinacion_EJECUTIVO.md" -o "Documentos_Ejecutivos_Convertidos\SISTEMA_06_Integracion_y_Coordinacion_EJECUTIVO.docx"

echo Convirtiendo Especialidad 01...
pandoc "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS\ESPECIALIDAD_01_Ingenieria_Civil_EJECUTIVO.md" -o "Documentos_Ejecutivos_Convertidos\ESPECIALIDAD_01_Ingenieria_Civil_EJECUTIVO.docx"

echo Convirtiendo Especialidad 02...
pandoc "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS\ESPECIALIDAD_02_Ingenieria_Electrica_EJECUTIVO.md" -o "Documentos_Ejecutivos_Convertidos\ESPECIALIDAD_02_Ingenieria_Electrica_EJECUTIVO.docx"

echo Convirtiendo Especialidad 03...
pandoc "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS\ESPECIALIDAD_03_Ingenieria_Mecanica_EJECUTIVO.md" -o "Documentos_Ejecutivos_Convertidos\ESPECIALIDAD_03_Ingenieria_Mecanica_EJECUTIVO.docx"

echo Convirtiendo Especialidad 04...
pandoc "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS\ESPECIALIDAD_04_Ingenieria_Sistemas_EJECUTIVO.md" -o "Documentos_Ejecutivos_Convertidos\ESPECIALIDAD_04_Ingenieria_Sistemas_EJECUTIVO.docx"

echo Convirtiendo Especialidad 05...
pandoc "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS\ESPECIALIDAD_05_Ingenieria_Ambiental_EJECUTIVO.md" -o "Documentos_Ejecutivos_Convertidos\ESPECIALIDAD_05_Ingenieria_Ambiental_EJECUTIVO.docx"

echo Convirtiendo Gestion 01...
pandoc "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS\GESTION_EJECUTIVO_Alcance_y_Objetivos.md" -o "Documentos_Ejecutivos_Convertidos\GESTION_EJECUTIVO_Alcance_y_Objetivos.docx"

echo Convirtiendo Gestion 02...
pandoc "X_ENTREGABLES_CONSOLIDADOS\7_SISTEMAS_EJECUTIVOS\GESTION_EJECUTIVO_Cronograma_y_Recursos.md" -o "Documentos_Ejecutivos_Convertidos\GESTION_EJECUTIVO_Cronograma_y_Recursos.docx"

echo.
echo Conversion completada!
echo Archivos guardados en: Documentos_Ejecutivos_Convertidos
echo.
pause

