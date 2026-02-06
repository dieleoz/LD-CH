# TEMPLATE T04: ESPECIFICACIÓN TÉCNICA

**Archivo:** `METODOLOGIA/Templates/T04_Especificacion_Tecnica.md`

```markdown
# ESPECIFICACIÓN TÉCNICA: [EQUIPO/SUBSISTEMA]

**Proyecto:** [NOMBRE_PROYECTO]  
**Sistema:** [NOMBRE_SISTEMA]  
**Fecha:** [DD/MM/AAAA]  
**Responsable:** [NOMBRE]  
**Estado:** [Draft/Review/Approved]

---

## 1. IDENTIFICACIÓN

| Campo | Valor |
|:------|:------|
| **Sistema** | [CTC/ITCS/TETRA/etc.] |
| **Subsistema** | [Servidor Central/Enclavamiento/etc.] |
| **Código** | [CTC-SRV-001] |
| **Cantidad** | [2 unidades] |
| **Versión** | [v1.0] |

---

## 2. FUNCIÓN

[Descripción de la función del equipo en 2-3 párrafos, incluyendo su rol dentro del sistema y cómo contribuye al cumplimiento de los requisitos]

---

## 3. REQUISITOS FUNCIONALES

1. Debe procesar [X] operaciones/segundo
2. Debe almacenar [Y] GB de logs históricos
3. Debe soportar [Z] usuarios simultáneos
4. Debe integrarse con [Sistema externo] mediante [Protocolo]
5. [Otro requisito funcional específico]

---

## 4. ESPECIFICACIONES TÉCNICAS REQUERIDAS

### 4.1 Hardware

#### 4.1.1 Procesador
- **Tipo:** x86-64, multinúcleo
- **Frecuencia mínima:** 3.0 GHz
- **Núcleos:** ≥8
- **Arquitectura:** [Intel/AMD]
- **Cache L3:** ≥16 MB

#### 4.1.2 Memoria RAM
- **Capacidad:** ≥64 GB
- **Tipo:** DDR4 ECC
- **Velocidad:** ≥2400 MHz
- **Configuración:** Redundante
- **Expansibilidad:** Hasta [X] GB

#### 4.1.3 Almacenamiento
- **Primario:** ≥2 TB SSD (RAID 1)
- **Secundario:** ≥8 TB HDD (RAID 5)
- **Hot-swap:** Sí
- **Interfaz:** SATA 3.0 / NVMe
- **Velocidad lectura:** ≥500 MB/s
- **Velocidad escritura:** ≥400 MB/s

#### 4.1.4 Fuente de Poder
- **Tipo:** Redundante (N+1)
- **Potencia:** [X] Watts
- **Eficiencia:** ≥90%
- **Hot-swap:** Sí
- **Entrada:** 100-240V AC, 50-60Hz

### 4.2 Interfaces de Comunicación

#### 4.2.1 Ethernet
- **Puertos:** ≥4 puertos 10GbE
- **Estándar:** IEEE 802.3ae
- **Conectores:** RJ45/SFP+
- **Auto-negotiation:** Sí
- **Jumbo frames:** Hasta 9000 bytes

#### 4.2.2 Serial
- **Puertos:** ≥4 puertos RS-232/485
- **Velocidad:** 300-115200 bps
- **Paridad:** Even/Odd/None
- **Stop bits:** 1-2
- **Control de flujo:** RTS/CTS

#### 4.2.3 USB
- **Puertos:** ≥4 puertos USB 3.0
- **Versión:** USB 3.0/3.1
- **Tipo:** Tipo A
- **Compatibilidad:** USB 2.0

### 4.3 Software

#### 4.3.1 Sistema Operativo
- **Tipo:** [Linux / Windows Server]
- **Versión:** [Ubuntu 20.04 LTS / Windows Server 2019]
- **Arquitectura:** 64-bit
- **Licencia:** [Incluida/Separada]

#### 4.3.2 Base de Datos
- **Tipo:** [PostgreSQL / Oracle / SQL Server]
- **Versión:** [Versión específica]
- **Capacidad:** [X] GB
- **Concurrencia:** [X] conexiones simultáneas

#### 4.3.3 Software de Aplicación
- **Nombre:** [Software CTC/ITCS/etc.]
- **Versión:** [Versión específica]
- **Fabricante:** [Nombre fabricante]
- **Licencia:** [Perpetua/Anual]

### 4.4 Especificaciones Ambientales

#### 4.4.1 Temperatura
- **Operación:** 0°C a 40°C
- **Almacenamiento:** -10°C a 60°C
- **Humedad relativa:** 10% a 90% sin condensación

#### 4.4.2 Altitud
- **Máxima:** Hasta 2,600 msnm
- **Presión atmosférica:** 70-106 kPa

#### 4.4.3 Protección
- **Grado de protección:** IP20 (instalación indoor)
- **Certificaciones:** [CE/FCC/etc.]

### 4.5 Disponibilidad y Confiabilidad

#### 4.5.1 Métricas de Confiabilidad
- **MTBF:** ≥50,000 horas
- **MTTR:** ≤4 horas
- **Disponibilidad requerida:** 99.5%
- **Garantía mínima:** 3 años

#### 4.5.2 Estrategia de Redundancia
- **Componentes redundantes:** [Fuente, disco, ventiladores]
- **Conmutación automática:** Sí
- **Tiempo de conmutación:** <30 segundos

### 4.6 Normativas y Certificaciones

#### 4.6.1 Normativas de Seguridad Funcional
- **IEC 61508:** SIL 2 o superior
- **EN 50128:** Software ferroviario
- **EN 50129:** Sistemas de seguridad

#### 4.6.2 Certificaciones de Calidad
- **ISO 9001:** Calidad del fabricante
- **ISO 14001:** Gestión ambiental
- **OHSAS 18001:** Seguridad laboral

#### 4.6.3 Certificaciones Locales
- **RETIE:** Reglamento eléctrico (Colombia)
- **ICONTEC:** Instituto Colombiano de Normas
- **ANM:** Agencia Nacional de Minería (si aplica)

---

## 5. CRITERIOS DE ACEPTACIÓN

### 5.1 Pruebas de Rendimiento
- **Prueba de carga:** Soportar [X] operaciones/segundo durante 24 horas
- **Prueba de memoria:** Manejar [X] GB de datos sin degradación
- **Prueba de red:** Transmitir a [X] Mbps sin pérdida de paquetes

### 5.2 Pruebas de Integración
- **Con base de datos:** Operación normal por 72 horas
- **Con sistemas externos:** Intercambio de datos según protocolo
- **Con HMI:** Respuesta <[X] segundos a comandos

### 5.3 Pruebas de Disponibilidad
- **Simulación de falla:** Recuperación automática en <[X] minutos
- **Prueba de redundancia:** Operación continua durante falla de componente
- **Prueba de respaldo:** Restauración completa en <[X] horas

### 5.4 Documentación Requerida
- [ ] Manual de usuario
- [ ] Manual técnico de instalación
- [ ] Manual de mantenimiento
- [ ] Certificados de conformidad
- [ ] Especificaciones de software
- [ ] Plan de pruebas ejecutado

---

## 6. FABRICANTES POTENCIALES

| Fabricante | Modelo | Cumplimiento | Costo Estimado | Observaciones |
|:-----------|:-------|:-------------|:---------------|:--------------|
| Fabricante A | Modelo X | 95% | $XX,XXX | Requiere adaptación |
| Fabricante B | Modelo Y | 100% | $XX,XXX | ⭐ Recomendado |
| Fabricante C | Modelo Z | 90% | $XX,XXX | Menor experiencia |

**Criterios de evaluación:**
- Cumplimiento de especificaciones técnicas: 40%
- Experiencia en proyectos ferroviarios: 25%
- Soporte técnico local: 20%
- Costo total de propiedad: 15%

---

## 7. RIESGOS ASOCIADOS

### 7.1 Riesgos Técnicos
| ID | Riesgo | Probabilidad | Impacto | Mitigación | Responsable |
|:---|:-------|:------------|:--------|:-----------|:------------|
| R-SPEC-001 | Incompatibilidad hardware-software | Media | Alto | Validación temprana con fabricante | Ing. Sistemas |
| R-SPEC-002 | Retraso en suministro | Alta | Medio | Pre-orden con fabricante | Procurement |

### 7.2 Riesgos de Cumplimiento
| ID | Riesgo | Probabilidad | Impacto | Mitigación | Responsable |
|:---|:-------|:------------|:--------|:-----------|:------------|
| R-SPEC-003 | No cumplimiento normativas | Baja | Alto | Verificación certificados | QA |

---

## 8. REFERENCIAS

### 8.1 Referencias Contractuales
- **Contrato:** [Cláusula específica]
- **Apéndice Técnico:** [AT[N], Sección específica]
- **Especificación de sistema:** [Documento específico]

### 8.2 Referencias Normativas
- **Normativa 1:** [EN 50126 - RAMS ferroviario]
- **Normativa 2:** [IEC 62443 - Ciberseguridad OT]
- **Normativa 3:** [RETIE - Reglamento eléctrico]

### 8.3 Referencias Técnicas
- **Estándar 1:** [IEEE 802.3 - Ethernet]
- **Estándar 2:** [IEC 61850 - Sistemas eléctricos]
- **Documento técnico:** [Nombre y versión]

---

## 9. APROBACIONES

| Rol | Nombre | Firma | Fecha |
|:----|:-------|:------|:------|
| Ingeniero de Sistemas | [Nombre] | [ ] | [Fecha] |
| Jefe de Proyecto | [Nombre] | [ ] | [Fecha] |
| Cliente | [Nombre] | [ ] | [Fecha] |

---

**INSTRUCCIONES DE USO:**
1. Completar todas las secciones marcadas con [CORCHETES]
2. Adaptar especificaciones según el tipo de equipo
3. Validar cumplimiento con normativas aplicables
4. Documentar riesgos específicos del equipo
5. Obtener aprobaciones requeridas antes de licitación

**CONTROL DE VERSIONES:**
| Versión | Fecha | Autor | Descripción |
|:--------|:------|:------|:------------|
| 0.1 | [Fecha] | [Nombre] | Versión inicial |
| 1.0 | [Fecha] | [Nombre] | Versión aprobada |
```
