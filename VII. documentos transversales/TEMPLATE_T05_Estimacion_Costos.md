# TEMPLATE T05: ESTIMACIÓN DE COSTOS

**Archivo:** `METODOLOGIA/Templates/T05_Estimacion_Costos.md`

```markdown
# ESTIMACIÓN DE COSTOS: [SISTEMA]

**Proyecto:** [NOMBRE_PROYECTO]  
**Sistema:** [NOMBRE_SISTEMA]  
**Fecha:** [DD/MM/AAAA]  
**Responsable:** [NOMBRE]  
**Estado:** [Draft/Review/Approved]

---

## 1. CAPEX (Capital Expenditure)

### 1.1 Equipos y Hardware

| Ítem | Descripción | Cantidad | Costo Unitario | Costo Total | Observaciones |
|:-----|:------------|:---------|:---------------|:------------|:--------------|
| Servidor CTC | Servidor principal con redundancia | 2 | $50,000 | $100,000 | Incluye licencias SO |
| Switch Core | Switch de red 10GbE | 2 | $15,000 | $30,000 | Redundante N+1 |
| Estación Trabajo | PC industrial para operadores | 6 | $3,000 | $18,000 | Incluye monitores |
| Enclavamiento | Sistema de enclavamientos electrónicos | 25 | $8,000 | $200,000 | Por estación |
| UPS | Sistema de respaldo energético | 3 | $10,000 | $30,000 | Central y estaciones |
| Cableado | Fibra óptica y cobre | [Metros] | $[X]/m | $[X] | Según distancias |
| **SUBTOTAL EQUIPOS** | | | | **$378,000** | |

### 1.2 Software y Licencias

| Ítem | Tipo | Descripción | Costo | Observaciones |
|:-----|:-----|:------------|:------|:--------------|
| Software CTC | Perpetua + 3 años soporte | Licencia principal del sistema | $150,000 | Incluye 3 años soporte |
| Base de datos | Perpetua | Licencia base de datos | $20,000 | PostgreSQL/Oracle |
| SO Windows Server | Perpetua | Sistema operativo servidores | $5,000 | Por servidor |
| Antivirus | Anual | Protección de servidores | $2,000 | Renovación anual |
| **SUBTOTAL SOFTWARE** | | | **$177,000** | |

### 1.3 Ingeniería y Puesta en Marcha

| Ítem | Descripción | Esfuerzo | Costo Unitario | Costo Total | Observaciones |
|:-----|:------------|:---------|:---------------|:------------|:--------------|
| Ingeniería detalle | Diseño detallado del sistema | 500 h-h | $100/h | $50,000 | Especialista senior |
| Instalación | Montaje e instalación física | 1,000 h-h | $80/h | $80,000 | Técnicos especializados |
| Configuración | Configuración y parametrización | 300 h-h | $90/h | $27,000 | Ingeniero de sistemas |
| Pruebas FAT/SAT | Pruebas en fábrica y sitio | 200 h-h | $100/h | $20,000 | Especialista en pruebas |
| Capacitación | Entrenamiento del personal | 100 h-h | $100/h | $10,000 | Usuarios finales |
| Documentación | Manuales y procedimientos | 150 h-h | $100/h | $15,000 | Documentación técnica |
| **SUBTOTAL INGENIERÍA** | | | | **$202,000** | |

### 1.4 Contingencias y Otros

| Concepto | Descripción | Porcentaje | Costo Base | Costo Contingencia |
|:---------|:------------|:-----------|:-----------|:-------------------|
| Contingencia técnica | Variaciones en especificaciones | 15% | $757,000 | $113,550 |
| Contingencia temporal | Retrasos en suministro | 5% | $757,000 | $37,850 |
| **TOTAL CONTINGENCIAS** | | | | **$151,400** | |

### 1.5 Resumen CAPEX

| Categoría | Costo | Porcentaje |
|:----------|:------|:-----------|
| Equipos y Hardware | $378,000 | 41.5% |
| Software y Licencias | $177,000 | 19.4% |
| Ingeniería y Puesta en Marcha | $202,000 | 22.2% |
| Contingencias | $151,400 | 16.6% |
| **CAPEX TOTAL** | **$908,400** | **100%** |

---

## 2. OPEX (Operating Expenditure) - Anual

### 2.1 Mantenimiento

| Ítem | Descripción | Costo Anual | Observaciones |
|:-----|:------------|:------------|:--------------|
| Mantenimiento preventivo equipos | Servicio de mantenimiento hardware | $30,000 | Contrato anual |
| Soporte software (año 4+) | Soporte técnico software | $25,000 | A partir del año 4 |
| Repuestos (2% CAPEX) | Inventario de repuestos | $18,168 | 2% del CAPEX |
| Actualizaciones de seguridad | Parches y actualizaciones | $5,000 | Anual |
| **SUBTOTAL MANTENIMIENTO** | | **$78,168** | |

### 2.2 Personal Operativo

| Rol | Cantidad | Salario Anual | Costo Total | Observaciones |
|:----|:---------|:--------------|:------------|:--------------|
| Operador CTC (24/7) | 8 | $30,000 | $240,000 | 4 turnos de 2 personas |
| Supervisor de turno | 2 | $40,000 | $80,000 | Supervisión operativa |
| Técnico mantenimiento | 2 | $30,000 | $60,000 | Mantenimiento preventivo |
| Especialista IT | 1 | $45,000 | $45,000 | Soporte técnico |
| **SUBTOTAL PERSONAL** | | | **$425,000** | |

### 2.3 Consumibles y Servicios

| Ítem | Descripción | Costo Anual | Observaciones |
|:-----|:------------|:------------|:--------------|
| Energía eléctrica | Consumo de energía | $12,000 | Según tarifa industrial |
| Comunicaciones (enlaces) | Enlaces de comunicaciones | $15,000 | Fibra óptica dedicada |
| Seguros | Seguro de equipos | $8,000 | Cobertura total |
| Licencias de software | Renovación anual | $5,000 | Antivirus y otros |
| **SUBTOTAL CONSUMIBLES** | | **$40,000** | |

### 2.4 Resumen OPEX Anual

| Categoría | Costo Anual | Porcentaje |
|:----------|:------------|:-----------|
| Mantenimiento | $78,168 | 14.4% |
| Personal Operativo | $425,000 | 78.3% |
| Consumibles y Servicios | $40,000 | 7.4% |
| **OPEX TOTAL ANUAL** | **$543,168** | **100%** |

---

## 3. ANÁLISIS DE SENSIBILIDAD

### 3.1 Escenarios de Costo

| Escenario | CAPEX | OPEX Anual | Variación CAPEX | Variación OPEX |
|:----------|:------|:-----------|:---------------|:---------------|
| Optimista (-15%) | $772,140 | $461,693 | -$136,260 | -$81,475 |
| **Base** | **$908,400** | **$543,168** | **-** | **-** |
| Pesimista (+25%) | $1,135,500 | $678,960 | +$227,100 | +$135,792 |

### 3.2 Factores de Sensibilidad

| Factor | Impacto en CAPEX | Impacto en OPEX | Observaciones |
|:-------|:----------------|:----------------|:--------------|
| Cambio en especificaciones | ±20% | ±5% | Principal factor de riesgo |
| Retraso en suministro | +15% | +10% | Costos de aceleración |
| Cambio de moneda | ±10% | ±10% | Equipos importados |
| Variación en mano de obra | ±25% | ±15% | Disponibilidad de personal |

---

## 4. COMPARACIÓN CON PRESUPUESTO CONTRACTUAL

### 4.1 Presupuesto Asignado

| Concepto | Presupuesto Contractual | Estimación Actual | Diferencia | Estado |
|:---------|:----------------------|:------------------|:-----------|:--------|
| CAPEX | $[X] | $908,400 | $[X - 908,400] | [DENTRO/EXCEDIDO] |
| OPEX Anual | $[X] | $543,168 | $[X - 543,168] | [DENTRO/EXCEDIDO] |

### 4.2 Análisis de Desviaciones

**Si la estimación excede el presupuesto:**
- [ ] Identificar partidas optimizables
- [ ] Evaluar alternativas de menor costo
- [ ] Solicitar incremento de presupuesto
- [ ] Reducir alcance si es posible

**Si la estimación está dentro del presupuesto:**
- [ ] Confirmar que se mantienen todas las especificaciones
- [ ] Evaluar mejoras adicionales con el excedente
- [ ] Documentar ahorro para otros sistemas

---

## 5. BREAK-EVEN ANALYSIS

### 5.1 Cálculo de Punto de Equilibrio

**Supuestos:**
- Vida útil del sistema: 15 años
- Tasa de descuento: 8% anual
- Inflación: 3% anual

**Cálculo:**
- CAPEX inicial: $908,400
- OPEX promedio anual: $543,168
- Valor presente total: $[X]
- Beneficio anual requerido: $[X]

### 5.2 Análisis de Rentabilidad

| Métrica | Valor | Observaciones |
|:--------|:------|:--------------|
| Payback period | [X] años | Tiempo de recuperación |
| NPV (15 años) | $[X] | Valor presente neto |
| IRR | [X]% | Tasa interna de retorno |
| ROI (15 años) | [X]% | Retorno de inversión |

---

## 6. RECOMENDACIONES

### 6.1 Optimización de Costos
1. **Negociación con proveedores:** Obtener descuentos por volumen
2. **Optimización de especificaciones:** Revisar requisitos no críticos
3. **Estrategia de adquisición:** Evaluar leasing vs compra
4. **Personal:** Considerar outsourcing de operación

### 6.2 Gestión de Riesgos Financieros
1. **Contratos de precio fijo:** Con proveedores principales
2. **Seguro de cambio:** Para equipos importados
3. **Reserva de contingencia:** Mantener 15% para imprevistos
4. **Monitoreo mensual:** Seguimiento de costos vs presupuesto

### 6.3 Alternativas de Financiamiento
1. **Financiación directa:** Presupuesto del proyecto
2. **Leasing operativo:** Para equipos de tecnología
3. **PPP (Public-Private Partnership):** Modelo de concesión
4. **Crédito bancario:** Para capital de trabajo

---

## 7. CRONOGRAMA DE GASTOS

### 7.1 Desembolsos CAPEX

| Trimestre | Concepto | Monto | Observaciones |
|:----------|:---------|:------|:--------------|
| Q1 | Ingeniería detalle | $50,000 | Inicio del proyecto |
| Q2 | Adquisición equipos | $555,000 | Orden de compra |
| Q3 | Instalación | $80,000 | Obras de instalación |
| Q4 | Pruebas y puesta en marcha | $223,400 | Finalización |

### 7.2 Flujo de Caja OPEX

| Año | Mantenimiento | Personal | Servicios | Total |
|:----|:-------------|:---------|:----------|:------|
| 1 | $78,168 | $425,000 | $40,000 | $543,168 |
| 2 | $78,168 | $425,000 | $40,000 | $543,168 |
| 3 | $78,168 | $425,000 | $40,000 | $543,168 |
| 4+ | $103,168 | $425,000 | $40,000 | $568,168 |

---

## 8. REFERENCIAS

### 8.1 Referencias de Mercado
- **Cotizaciones proveedores:** [Fecha y proveedor]
- **Benchmarking:** [Proyectos similares]
- **Índices de precios:** [IPC, inflación sectorial]

### 8.2 Referencias Contractuales
- **Presupuesto base:** [Documento específico]
- **Especificaciones:** [Documento técnico]
- **Condiciones comerciales:** [Contrato principal]

---

**INSTRUCCIONES DE USO:**
1. Completar todas las secciones marcadas con [CORCHETES]
2. Actualizar precios según mercado actual
3. Validar estimaciones con especialistas
4. Documentar supuestos y limitaciones
5. Revisar periódicamente durante el proyecto

**CONTROL DE VERSIONES:**
| Versión | Fecha | Autor | Descripción |
|:--------|:------|:------|:------------|
| 0.1 | [Fecha] | [Nombre] | Versión inicial |
| 1.0 | [Fecha] | [Nombre] | Versión aprobada |
```
