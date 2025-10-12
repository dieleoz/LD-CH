# MODULO: SistemaMapper
# Mapeo de sistemas y configuracion
# Fecha: 12 de Octubre 2025

function Get-SistemaMapping {
    return @{
        "01" = @{ Nombre = "Control_y_Senalizacion"; Fuentes = @("26. Sistem_CTC*.md", "29_Sistema_Senalizacion*.md") }
        "02" = @{ Nombre = "Telecomunicaciones"; Fuentes = @("28_Sistema_FibraOptica*.md", "27_Sistema_TETRA*.md") }
        "03" = @{ Nombre = "ITS_y_Seguridad"; Fuentes = @("31_Sistema_CCTV*.md", "30_Sistema_ITS*.md") }
        "04" = @{ Nombre = "Material_Rodante"; Fuentes = @("32_Material_Rodante*.md") }
        "05" = @{ Nombre = "Infraestructura_Operativa"; Fuentes = @("V.4_Sistemas_Potencia*.md") }
        "06" = @{ Nombre = "Integracion_y_Coordinacion"; Fuentes = @("34_Criterios_Interoperabilidad*.md") }
    }
}

Export-ModuleMember -Function 'Get-SistemaMapping'

