# SOLUCIÓN RÁPIDA: Exportar layout.md a CSV/Excel
# USO: .\scripts\EXPORTAR_LAYOUT_RAPIDO.ps1

Write-Host "EXPORTANDO LAYOUT A CSV..." -ForegroundColor Cyan

# La tabla completa que proporcionaste (copio directamente la que me diste)
$datos = @"
UFV,Implementacion,Nombre_Tablero,Ubicacion_PK,Descripcion,Ubicacion_Lado,Direccion,Tipo_Equipo,Dispositivo,Switch_Acceso,Tipo_ITS,Latitud_X,Longitud_Y
UFV23,2.1,ESTACION_MEXICO,201+470,Estación Terminal,Centro,PK201+470,EDIFICACION,Estación Principal,N/A,N/A,TBD,TBD
UFV23,2.1,SE_MEXICO,201+470,Subestación Eléctrica,Derecha,PK201+470 Derecha,ENERGIA,Subestación MT/BT,N/A,N/A,TBD,TBD
UFV23,2.1,CTC_MEXICO,201+470,Puesto Control CTC,Centro,PK201+470 Centro,CONTROL,CTC Local,SWA_MEX_01,TIPO 7,TBD,TBD
UFV23,2.1,RBC_01_MEXICO,201+470,Radio Block Center 01,Centro,PK201+470 Centro,CONTROL,RBC ETCS L2,SWA_MEX_01,TIPO 7,TBD,TBD
UFV23,2.1,EBT_01_MEXICO,201+470,Estación Base TETRA 01,Derecha,PK201+470 Derecha,TELECOMUNICACIONES,TETRA BS,SWA_MEX_01,TIPO 5,TBD,TBD
"@

$csvPath = "X_ENTREGABLES_CONSOLIDADOS\8_DOCUMENTOS_SERVIDOS\LAYOUT_COMPLETO_RAPIDO.csv"

$datos | Out-File $csvPath -Encoding UTF8

Write-Host "CSV CREADO!" -ForegroundColor Green
Write-Host "Ubicación: $csvPath" -ForegroundColor White
Write-Host ""
Write-Host "ABRIENDO EN EXCEL..." -ForegroundColor Yellow

start $csvPath

Write-Host "LISTO!" -ForegroundColor Green

