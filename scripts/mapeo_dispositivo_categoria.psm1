# ================================================================
# MÓDULO: Mapeo de Dispositivos a Categorías WBS
# Fecha: 15 Octubre 2025
# Propósito: Función centralizada para mapear dispositivos a categorías
# ================================================================
# CATEGORÍAS BASADAS EN CAPÍTULOS WBS:
# 1. CONTROL Y SEÑALIZACION
# 2. TELECOMUNICACIONES
# 3. SISTEMAS ITS Y SEGURIDAD
# 4. PASOS A NIVEL
# 5. CENTRO DE CONTROL
# 6. MATERIAL RODANTE
# ================================================================

function Get-CategoriaDesdeDispositivo {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Dispositivo,
        
        [Parameter(Mandatory=$false)]
        [string]$Nombre = "",
        
        [Parameter(Mandatory=$false)]
        [string]$Descripcion = ""
    )
    
    # Mapeo de dispositivos a CATEGORÍAS WBS (Capítulos)
    # IMPORTANTE: NO HARDCODEAR - Este mapeo se basa en el tipo de dispositivo
    
    # CAPÍTULO 2: TELECOMUNICACIONES
    # (TETRA, GSM-R, Fibra Óptica)
    if ($Dispositivo -match '(TETRA|GSM-R|Caja Empalme|Domo|ODF|Fibra|Switch|Router|Nodo|Antena|Radio)' -or
        $Nombre -match '(EBT|CAJA_FO|DOMO|ODF|GSM|NOD|SWA)' -or
        $Descripcion -match '(TETRA|GSM|Fibra|Optic|Empalme|Fusion)') {
        return "TELECOMUNICACIONES"
    }
    
    # CAPÍTULO 1: CONTROL Y SEÑALIZACION
    # (CTC, ATP, ENCE, Desvíos, Señalización)
    if ($Dispositivo -match '(CTC|RBC|ATP|ENCE|Enclavamiento|Baliza|LEU|Desvío|Aguja|Señal|Semáforo|Controlador)' -or
        $Nombre -match '(CTC|RBC|ENCE|BAL|LEU|ATP|DES|AGJ|SEN|SEM)' -or
        $Descripcion -match '(Control|Enclavamiento|ATP|Desvío|Aguja|Señal|Semáforo)') {
        return "CONTROL Y SEÑALIZACION"
    }
    
    # CAPÍTULO 3: SISTEMAS ITS Y SEGURIDAD
    # (CCTV, Control Accesos, Detección Incendios)
    if ($Dispositivo -match '(CCTV|Cámara|HBD|WILD|Detector|Sensor|Control Acceso|Detección|Incendio)' -or
        $Nombre -match '(CAM|DET|CCTV|ACC|INC)' -or
        $Descripcion -match '(Cámara|Detector|Video|Vigilancia|Acceso|Incendio|Seguridad)') {
        return "SISTEMAS ITS Y SEGURIDAD"
    }
    
    # CAPÍTULO 4: PASOS A NIVEL
    # (PAN Tipo C, Tipo B, Otros)
    if ($Dispositivo -match '(PAN|Paso.*Nivel|Barrera|Campana)' -or
        $Nombre -match '(PAN|PN_)' -or
        $Descripcion -match '(Paso.*Nivel|PAN)') {
        return "PASOS A NIVEL"
    }
    
    # CAPÍTULO 5: CENTRO DE CONTROL
    # (Edificio CCO, Sala Control, SCADA)
    if ($Dispositivo -match '(CCO|SCADA|Sala Control|Servidor|Workstation|Consola)' -or
        $Nombre -match '(CCO|SCADA|SRV|CON)' -or
        $Descripcion -match '(CCO|SCADA|Control.*Central|Sala.*Control)') {
        return "CENTRO DE CONTROL"
    }
    
    # CAPÍTULO 6: MATERIAL RODANTE
    # (ATP Embarcados, EOT)
    if ($Dispositivo -match '(ATP.*Embarcado|EOT|Tren|Locomotora|Material.*Rodante)' -or
        $Nombre -match '(ATP_EMB|EOT|TREN|LOC)' -or
        $Descripcion -match '(ATP.*Embarcado|EOT|Material.*Rodante)') {
        return "MATERIAL RODANTE"
    }
    
    # ENERGÍA (Equipos de soporte - asignar a categoría del equipo principal)
    if ($Dispositivo -match '(UPS|SAI|Generador|Subestación|Batería)' -or
        $Nombre -match '(UPS|SAI|GEN|SUB)' -or
        $Descripcion -match '(UPS|Energía|Generador)') {
        return "ENERGIA"
    }
    
    # INFRAESTRUCTURA (Edificaciones generales)
    if ($Dispositivo -match '(Estación|Taller|Edificio|Caseta)' -or
        $Nombre -match '(EST|TAL|EDI)' -or
        $Descripcion -match '(Estación|Taller|Edificio)') {
        return "INFRAESTRUCTURA"
    }
    
    # Por defecto: OTROS
    return "OTROS"
}

# Exportar la función
Export-ModuleMember -Function Get-CategoriaDesdeDispositivo
