# MATRIZ DE LEVANTAMIENTO DE REQUERIMIENTOS
## ESPECIALIDAD: INGENIERÍA ELÉCTRICA
### APP La Dorada - Chiriguaná

**Fecha:** 24 de Noviembre 2025  
**Responsable Área:** _________________________  
**Fecha Compromiso Entrega:** _________________

---

## INSTRUCCIONES PARA EL FUNCIONAL

Por favor complete esta matriz con la información faltante para poder ajustar/cerrar la ingeniería de detalle:

1. **Revisar** cada requerimiento identificado
2. **Validar** si está completado o falta información
3. **Completar** las columnas de "Información que Falta" y "Acción Requerida"
4. **Definir** fecha compromiso para cada pendiente
5. **Firmar** y devolver al Coordinador Contractual

---

## REQUERIMIENTOS IDENTIFICADOS - INGENIERÍA ELÉCTRICA

| # | Requerimiento | Doc Fuente | Prioridad | Estado | Información que Falta | Acción Requerida | Responsable | Fecha Compromiso | Observaciones |
|:-:|:--------------|:-----------|:---------:|:------:|:----------------------|:-----------------|:------------|:-----------------|:--------------|
| **1** | Suministro eléctrico para 37 torres TETRA | Eléctrica | 🔴 CRÍTICA | ⏳ Pendiente | • Potencia requerida por torre<br>• Acometidas identificadas<br>• Coordinación operadora red<br>• Backup energético (solar/generador) | Dimensionar potencia y coordinar acometidas | | | |
| **2** | UPS en todas las locaciones críticas (CTC, TETRA, estaciones) | Infraestructura Op. | 🔴 CRÍTICA | ⏳ Pendiente | • Listado locaciones críticas<br>• Capacidad UPS por instalación<br>• Autonomía requerida por localización<br>• Carga crítica por locación | Especificar UPS por instalación | | | |
| **3** | Sistema PAT (Puesta a Tierra) según IEEE todas instalaciones | Eléctrica | 🔴 CRÍTICA | ⏳ Pendiente | • Estudios resistividad suelo<br>• Tipo malla tierra por instalación<br>• Normativa aplicable (IEEE 80)<br>• Pruebas aceptación definidas | Diseñar sistema PAT | | | |
| **4** | Autonomía mínima 4 horas para UPS en locaciones críticas | Infraestructura Op. | 🔴 CRÍTICA | ⏳ Pendiente | • Listado locaciones críticas<br>• Carga crítica por locación<br>• Autonomía requerida<br>• Dimensionamiento baterías | Dimensionar UPS con autonomía 4h | | | |
| **5** | Generadores de respaldo en 9 instalaciones críticas | Infraestructura Op. | 🟡 ALTA | ⏳ Pendiente | • Ubicación por instalación<br>• Capacidad generadores<br>• Tipo (diesel/gas)<br>• Tanques combustible dimensionados | Especificar generadores | | | |
| **6** | Tableros eléctricos y transformadores dimensionados | Eléctrica | 🟡 ALTA | ⏳ Pendiente | • Capacidad transformadores<br>• Ubicación transformadores<br>• Tableros principales<br>• Protecciones dimensionadas | Dimensionar transformadores y tableros | | | |
| **7** | Coordinación con operadora de red para acometidas | Eléctrica | 🔴 CRÍTICA | ⏳ Pendiente | • Operadora identificada<br>• Puntos de acometida<br>• Capacidad disponible<br>• Cronograma instalación | Coordinar con operadora red | | | |
| **8** | Sistema de alimentación principal 800 kVA | Eléctrica | 🔴 CRÍTICA | ⏳ Pendiente | • Distribución cargas por sistema<br>• Factor de seguridad aplicado<br>• Crecimiento futuro considerado<br>• Ubicación subestación principal | Diseñar sistema alimentación | | | |
| **9** | Distribución de cargas eléctricas por nodo | Eléctrica | 🔴 CRÍTICA | ⏳ Pendiente | • Nodos eléctricos identificados<br>• Carga por nodo calculada<br>• Balance de fases<br>• Factor de potencia > 0.95 | Calcular cargas por nodo | | | |
| **10** | Especificaciones de consumos eléctricos por equipo | Equipos_Señalizacion | 🟡 ALTA | ⏳ Pendiente | • Consumo por tipo de equipo<br>• Factor de uso<br>• Cargas simultáneas<br>• Picos de demanda | Especificar consumos | | | |
| **11** | Sistema SCADA para monitoreo energético | Infraestructura Op. | 🟡 ALTA | ⏳ Pendiente | • Alcance monitoreo<br>• Protocolo SCADA<br>• Interfaces RTU<br>• Centro control | Especificar SCADA | | | |
| **12** | Factor de potencia > 0.95 según RETIE | Eléctrica | 🔴 CRÍTICA | ⏳ Pendiente | • Banco de capacitores dimensionado<br>• Ubicación compensación<br>• Control automático<br>• Medición factor potencia | Diseñar compensación | | | |

---

## INFORMACIÓN CRÍTICA PENDIENTE

### **1. SUMINISTRO ELÉCTRICO 37 TORRES TETRA**

**Información requerida:**

**Potencia por Torre:**
- [ ] Potencia requerida por torre (kW): Torre tipo 1: _____ kW, Torre tipo 2: _____ kW
- [ ] Consumo equipos TETRA por torre: _____ kW
- [ ] Consumo climatización (si aplica): _____ kW
- [ ] Factor de seguridad aplicado: _____ %

**Acometidas:**
- [ ] Operadora de red identificada: __________________
- [ ] Puntos de acometida por torre: _____ / 37 torres
- [ ] Capacidad disponible en red: _____ kVA
- [ ] Distancia acometida a torre: Promedio _____ m

**Backup Energético:**
- [ ] Sistema backup definido: ☐ Solar  ☐ Generador  ☐ Baterías  ☐ Híbrido
- [ ] Autonomía backup requerida: _____ horas
- [ ] Capacidad sistema backup: _____ kW

**Coordinación:**
- [ ] Reunión con operadora programada: Fecha __________
- [ ] Cronograma instalación acometidas: Inicio __________, Fin __________
- [ ] Costos estimados acometidas: $__________ COP

**Acción requerida:** _________________________________________________

**Responsable:** ______________________ Fecha: __________________

---

### **2. UPS LOCACIONES CRÍTICAS**

**Información requerida:**

**Locaciones Críticas Identificadas:**
- [ ] CTC (Centro Control Tráfico): Capacidad _____ kVA, Autonomía _____ h
- [ ] 37 torres TETRA: Capacidad _____ kVA c/u, Autonomía _____ h
- [ ] Estaciones críticas (cantidad: _____): Capacidad _____ kVA c/u
- [ ] Otras locaciones críticas: [Listar]

**Especificaciones UPS:**
- [ ] Tecnología: ☐ Online  ☐ Line-interactive  ☐ Standby
- [ ] Voltaje entrada: _____ V
- [ ] Voltaje salida: _____ V
- [ ] Factor de potencia: _____
- [ ] Eficiencia: _____ %

**Baterías:**
- [ ] Tipo baterías: ☐ Plomo-ácido  ☐ Litio  ☐ Otra: __________
- [ ] Capacidad baterías: _____ Ah
- [ ] Cantidad baterías por UPS: _____ unidades
- [ ] Vida útil estimada: _____ años

**Mantenimiento:**
- [ ] Plan mantenimiento preventivo
- [ ] Frecuencia mantenimiento: ☐ Mensual  ☐ Trimestral  ☐ Semestral
- [ ] Repuestos críticos identificados

**Acción requerida:** _________________________________________________

**Responsable:** ______________________ Fecha: __________________

---

### **3. SISTEMA PAT (PUESTA A TIERRA) SEGÚN IEEE**

**Información requerida:**

**Estudios de Suelo:**
- [ ] Estudios resistividad suelo completados: _____ / _____ instalaciones
- [ ] Resistividad promedio medida: _____ Ω·m
- [ ] Tipo de suelo predominante: __________________
- [ ] Variaciones estacionales consideradas: ☐ Sí  ☐ No

**Diseño Malla Tierra:**
- [ ] Tipo malla por instalación:
  - [ ] CTC: Tipo __________, Resistencia objetivo: _____ Ω
  - [ ] Torres TETRA: Tipo __________, Resistencia objetivo: _____ Ω
  - [ ] Estaciones: Tipo __________, Resistencia objetivo: _____ Ω
- [ ] Material conductor: ☐ Cobre  ☐ Aluminio  ☐ Acero galvanizado
- [ ] Sección conductor: _____ mm²

**Normativa:**
- [ ] Normativa aplicable: ☐ IEEE 80  ☐ RETIE  ☐ Otra: __________
- [ ] Resistencia objetivo según normativa: _____ Ω
- [ ] Tensiones de paso y contacto calculadas: ☐ Sí  ☐ No

**Pruebas y Aceptación:**
- [ ] Procedimiento pruebas definido
- [ ] Equipos de medición: ☐ Telurómetro  ☐ Otro: __________
- [ ] Frecuencia pruebas: ☐ Inicial  ☐ Anual  ☐ Otra: __________

**Acción requerida:** _________________________________________________

**Responsable:** ______________________ Fecha: __________________

---

### **4. GENERADORES DE RESPALDO 9 INSTALACIONES**

**Información requerida por instalación:**

| # | Ubicación | Capacidad (kVA) | Tipo Combustible | Tanque (L) | Autonomía (h) | Observaciones |
|:-:|:----------|:---------------:|:-----------------|:----------:|:-------------:|:--------------|
| 1 | | | ☐ Diesel ☐ Gas | | | |
| 2 | | | ☐ Diesel ☐ Gas | | | |
| 3 | | | ☐ Diesel ☐ Gas | | | |
| 4 | | | ☐ Diesel ☐ Gas | | | |
| 5 | | | ☐ Diesel ☐ Gas | | | |
| 6 | | | ☐ Diesel ☐ Gas | | | |
| 7 | | | ☐ Diesel ☐ Gas | | | |
| 8 | | | ☐ Diesel ☐ Gas | | | |
| 9 | | | ☐ Diesel ☐ Gas | | | |

**Especificaciones Técnicas:**
- [ ] Marca/modelo preferido: __________________
- [ ] Potencia continua: _____ kW
- [ ] Potencia standby: _____ kW
- [ ] Voltaje salida: _____ V
- [ ] Frecuencia: _____ Hz
- [ ] Nivel ruido máximo: _____ dB

**Sistema de Arranque:**
- [ ] Tipo arranque: ☐ Manual  ☐ Automático  ☐ Remoto
- [ ] Tiempo arranque automático: _____ segundos
- [ ] Transferencia automática: ☐ Sí  ☐ No

**Mantenimiento:**
- [ ] Plan mantenimiento preventivo
- [ ] Horas entre mantenimientos: _____ horas
- [ ] Repuestos críticos: [Listar]

**Acción requerida:** _________________________________________________

**Responsable:** ______________________ Fecha: __________________

---

### **5. DISTRIBUCIÓN CARGAS ELÉCTRICAS POR NODO**

**Información requerida:**

**Metodología de Agrupación:**
- [ ] Nodos eléctricos identificados: Cantidad _____ nodos
- [ ] Criterio agrupación: ☐ Por PK  ☐ Por sistema  ☐ Por UFV  ☐ Otro: __________
- [ ] Metodología aplicada: ☐ Excel template  ☐ Software  ☐ Manual

**Carga por Nodo:**
- [ ] Carga activa por nodo calculada (kW)
- [ ] Carga reactiva por nodo calculada (kVAR)
- [ ] Factor de potencia por nodo: > 0.95
- [ ] Cargas simultáneas consideradas: ☐ Sí  ☐ No

**Balance de Fases:**
- [ ] Desbalance máximo permitido: _____ %
- [ ] Balance verificado: ☐ Sí  ☐ No

**Crecimiento Futuro:**
- [ ] Factor crecimiento aplicado: _____ %
- [ ] Reserva capacidad: _____ %

**Acción requerida:** _________________________________________________

**Responsable:** ______________________ Fecha: __________________

---

## DOCUMENTOS DE SOPORTE REQUERIDOS

Por favor adjuntar al devolver esta matriz:

1. [ ] Diagrama unifilar sistema eléctrico general
2. [ ] Especificaciones técnicas UPS por instalación
3. [ ] Diseño sistema PAT con cálculos
4. [ ] Especificaciones generadores de respaldo
5. [ ] Matriz de cargas eléctricas por nodo (Excel template)
6. [ ] Coordinación operadora red (correspondencia/reuniones)
7. [ ] Estudios resistividad suelo (informes completos)
8. [ ] Presupuesto preliminar sistemas eléctricos

---

## COMPROMISOS ASUMIDOS

| # | Compromiso | Responsable | Fecha Compromiso | Cumplido |
|:-:|:-----------|:------------|:-----------------|:--------:|
| 1 | Dimensionar potencia 37 torres TETRA | | | ☐ |
| 2 | Coordinar acometidas operadora red | | | ☐ |
| 3 | Especificar UPS por instalación | | | ☐ |
| 4 | Diseñar sistema PAT según IEEE | | | ☐ |
| 5 | Dimensionar generadores respaldo | | | ☐ |
| 6 | Calcular cargas eléctricas por nodo | | | ☐ |
| 7 | Especificar transformadores y tableros | | | ☐ |
| 8 | Diseñar compensación factor potencia | | | ☐ |

---

## OBSERVACIONES GENERALES

_________________________________________________________________________

_________________________________________________________________________

_________________________________________________________________________

_________________________________________________________________________

---

## FIRMAS

**Responsable Área Eléctrica:**  
Nombre: _________________________  
Cargo: __________________________  
Firma: __________________________  
Fecha: __________________________

**Coordinador Contractual:**  
Nombre: Diego Leonardo Zuñiga Samboni  
Cargo: Coordinador Contractual  
Firma: __________________________  
Fecha: __________________________

---

## SEGUIMIENTO

**Próxima revisión programada:** _________________

**Reunión seguimiento:** _________________

---

**PARA USO DEL COORDINADOR CONTRACTUAL:**

Estado general: ☐ Completo  ☐ Parcial  ☐ Pendiente

% Completitud: ______%

Items críticos sin resolver: _______________________________________

Escalamiento requerido: ☐ Sí  ☐ No

Observaciones: ________________________________________________________

______________________________________________________________________

