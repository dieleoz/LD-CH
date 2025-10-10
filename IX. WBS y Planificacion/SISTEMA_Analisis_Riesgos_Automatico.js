/**
 * SISTEMA DE ANÁLISIS AUTOMÁTICO DE RIESGOS
 * Evalúa cambios propuestos en WBS y genera riesgos automáticamente
 */

const SistemaRiesgos = {
    
    // UMBRALES DE RIESGO
    umbrales: {
        // Cajas de fibra
        cajas_fibra_espaciamiento: {
            optimo_min: 300,
            optimo_max: 400,
            aceptable_min: 250,
            aceptable_max: 500,
            limite_normativo: 500,
            norma: "UIT-T G.652.D"
        },
        
        // Torres TETRA
        torres_tetra_cantidad: {
            minimo_absoluto: 33,
            optimo: 37,
            maximo_eficiente: 42,
            norma: "ETSI EN 300 396"
        },
        
        // Workstations CTC
        workstations_cantidad: {
            minimo_operativo: 6,
            optimo_con_redundancia: 8,
            maximo_recomendado: 10
        },
        
        // Impacto económico
        impacto_economico: {
            bajo: 100000000,        // < $100M
            medio: 500000000,       // $100M - $500M
            alto: 1000000000,       // $500M - $1,000M
            critico: 5000000000     // > $1,000M
        }
    },
    
    // ANÁLISIS DE CAMBIO PROPUESTO
    analizarCambio(item, valorNuevo, tipoCambio) {
        const riesgos = [];
        
        // CASO 1: CAJAS DE FIBRA (Espaciamiento)
        if (item.codigo === "2.3.103" && tipoCambio === "espaciamiento") {
            const espaciamiento = valorNuevo;
            const umbral = this.umbrales.cajas_fibra_espaciamiento;
            
            // Calcular nueva cantidad
            const nuevaCantidad = Math.ceil(594000 / espaciamiento) + 88;
            const cantidadActual = parseInt(item.cantidad);
            const delta = nuevaCantidad - cantidadActual;
            const impactoEconomico = delta * item.vu_cop;
            
            // EVALUACIÓN DE RIESGOS
            
            // Riesgo 1: Espaciamiento fuera de rango óptimo
            if (espaciamiento < umbral.optimo_min) {
                riesgos.push({
                    id: `R-FIBRA-NEW-${Date.now()}`,
                    categoria: "Técnico",
                    descripcion: `Espaciamiento ${espaciamiento}m muy corto aumenta CAPEX innecesariamente`,
                    probabilidad: "Alta",
                    impacto: "Alto",
                    nivel_riesgo: "ALTO",
                    origen_decision: `Espaciamiento ${espaciamiento}m < ${umbral.optimo_min}m (óptimo mínimo)`,
                    estrategia_sugerida: "Mitigar: Ajustar a rango óptimo 300m-400m",
                    responsable: "Especialista Fibra",
                    estado: "Nuevo - Pendiente Aprobación",
                    accion_requerida: "REVISAR Y JUSTIFICAR",
                    vinculacion_contractual: "AT1 - Apéndice Técnico 1, Sección 2.1 (Fibra Óptica)",
                    hito_verificacion: "Ingeniería Detalle - Validación Diseño OSP"
                });
            }
            
            if (espaciamiento > umbral.aceptable_max) {
                riesgos.push({
                    id: `R-FIBRA-NEW-${Date.now() + 1}`,
                    categoria: "Técnico-Normativo",
                    descripcion: `Espaciamiento ${espaciamiento}m excede límite normativo UIT-T (${umbral.limite_normativo}m)`,
                    probabilidad: "Alta",
                    impacto: "Crítico",
                    nivel_riesgo: "CRÍTICO",
                    origen_decision: `Espaciamiento ${espaciamiento}m > ${umbral.limite_normativo}m (límite normativo)`,
                    estrategia_sugerida: "Evitar: NO PROCEDE - Incumple norma UIT-T G.652.D",
                    responsable: "PMO + Especialista Fibra",
                    estado: "Bloqueante - Requiere Aprobación Formal",
                    accion_requerida: "DETENER - NO APROBAR",
                    vinculacion_contractual: "AT1 - Apéndice Técnico 1, Cláusula 2.1.3 (Cumplimiento Normas)",
                    hito_verificacion: "Revisión PMO + Validación Legal"
                });
            }
            
            // Riesgo 2: Impacto económico significativo
            if (Math.abs(impactoEconomico) > this.umbrales.impacto_economico.alto) {
                riesgos.push({
                    id: `R-ECON-NEW-${Date.now() + 2}`,
                    categoria: "Financiero",
                    descripcion: `Cambio de espaciamiento genera impacto económico de ${this.formatearPeso(Math.abs(impactoEconomico))} (${impactoEconomico > 0 ? 'incremento' : 'ahorro'})`,
                    probabilidad: "Alta",
                    impacto: Math.abs(impactoEconomico) > this.umbrales.impacto_economico.critico ? "Crítico" : "Alto",
                    nivel_riesgo: Math.abs(impactoEconomico) > this.umbrales.impacto_economico.critico ? "CRÍTICO" : "ALTO",
                    origen_decision: `DT cambio espaciamiento ${espaciamiento}m → Δ ${delta} cajas`,
                    estrategia_sugerida: impactoEconomico < 0 ? "Aceptar: Genera ahorro significativo" : "Validar: Requiere justificación sólida",
                    responsable: "CFO + PMO",
                    estado: "Nuevo - Requiere Aprobación Financiera",
                    accion_requerida: impactoEconomico < 0 ? "APROBAR SI TÉCNICAMENTE VIABLE" : "VALIDAR NECESIDAD",
                    vinculacion_contractual: "Contrato Principal - Cláusula 3.5 (Modificaciones Presupuestales)",
                    hito_verificacion: "Aprobación CFO + Comité Directivo"
                });
            }
            
            // Riesgo 3: Tiempo de localización de fallas
            if (espaciamiento > 400) {
                riesgos.push({
                    id: `R-OPE-NEW-${Date.now() + 3}`,
                    categoria: "Operacional",
                    descripcion: `Espaciamiento ${espaciamiento}m aumenta tiempo de localización de fallas en ~${Math.ceil((espaciamiento - 300) / 50)} minutos`,
                    probabilidad: "Media",
                    impacto: "Medio",
                    nivel_riesgo: "MEDIO",
                    origen_decision: `Espaciamiento ${espaciamiento}m > 400m (umbral operacional)`,
                    estrategia_sugerida: "Asumir: Documentar en Plan de Mantenimiento",
                    responsable: "Jefe Operaciones",
                    estado: "Nuevo - Pendiente Validación",
                    accion_requerida: "DOCUMENTAR EN PLAN MANTENIMIENTO",
                    vinculacion_contractual: "AT6 - Apéndice Técnico 6 (Operación y Mantenimiento)",
                    hito_verificacion: "Plan de Mantenimiento - Procedimiento Localización Fallas"
                });
            }
        }
        
        // CASO 2: TORRES TETRA (Cantidad)
        if (item.codigo === "2.1.100" && tipoCambio === "cantidad") {
            const cantidad = parseInt(valorNuevo);
            const umbral = this.umbrales.torres_tetra_cantidad;
            
            if (cantidad < umbral.minimo_absoluto) {
                riesgos.push({
                    id: `R-TETRA-NEW-${Date.now()}`,
                    categoria: "Técnico-Crítico",
                    descripcion: `${cantidad} torres TETRA insuficientes para cobertura 100% (mínimo: ${umbral.minimo_absoluto})`,
                    probabilidad: "Alta",
                    impacto: "Crítico",
                    nivel_riesgo: "CRÍTICO",
                    origen_decision: `Cantidad ${cantidad} < ${umbral.minimo_absoluto} (mínimo según simulación RF)`,
                    estrategia_sugerida: "Evitar: NO PROCEDE - Incumple requisito cobertura 100%",
                    responsable: "Especialista TETRA + PMO",
                    estado: "Bloqueante",
                    accion_requerida: "DETENER - INCREMENTAR A MÍNIMO 33",
                    vinculacion_contractual: "AT1 - Sección 3.1 (Cobertura TETRA 100% obligatoria)",
                    hito_verificacion: "Pruebas de Cobertura - PAC"
                });
            }
            
            if (cantidad > umbral.maximo_eficiente) {
                riesgos.push({
                    id: `R-TETRA-NEW-${Date.now() + 1}`,
                    categoria: "Financiero",
                    descripcion: `${cantidad} torres excede cantidad eficiente (óptimo: ${umbral.optimo}), genera sobrecosto`,
                    probabilidad: "Alta",
                    impacto: "Medio",
                    nivel_riesgo: "MEDIO",
                    origen_decision: `Cantidad ${cantidad} > ${umbral.maximo_eficiente} (máximo eficiente)`,
                    estrategia_sugerida: "Validar: Justificar necesidad o reducir",
                    responsable: "PMO + CFO",
                    estado: "Nuevo - Requiere Justificación",
                    accion_requerida: "JUSTIFICAR TÉCNICAMENTE",
                    vinculacion_contractual: "Contrato - Optimización de Recursos",
                    hito_verificacion: "Aprobación PMO"
                });
            }
        }
        
        // GENÉRICO: Impacto económico significativo
        if (tipoCambio === "cantidad" || tipoCambio === "precio") {
            const valorActual = item.total_cop;
            const valorNuevoTotal = tipoCambio === "cantidad" 
                ? valorNuevo * item.vu_cop 
                : item.cantidad * valorNuevo;
            const impacto = Math.abs(valorNuevoTotal - valorActual);
            
            if (impacto > this.umbrales.impacto_economico.critico) {
                riesgos.push({
                    id: `R-ECON-NEW-${Date.now()}`,
                    categoria: "Financiero-Crítico",
                    descripcion: `Cambio genera impacto crítico de ${this.formatearPeso(impacto)} (${valorNuevoTotal > valorActual ? 'incremento' : 'ahorro'})`,
                    probabilidad: "Alta",
                    impacto: "Crítico",
                    nivel_riesgo: "CRÍTICO",
                    origen_decision: `DT-${item.codigo} → Δ ${this.formatearPeso(impacto)}`,
                    estrategia_sugerida: valorNuevoTotal < valorActual ? "Aceptar: Ahorro significativo si técnicamente viable" : "Evitar: Requiere aprobación Junta Directiva",
                    responsable: "CFO + Junta Directiva",
                    estado: "Nuevo - Requiere Aprobación Directiva",
                    accion_requerida: valorNuevoTotal < valorActual ? "VALIDAR TÉCNICAMENTE" : "APROBAR EN JUNTA",
                    vinculacion_contractual: "Contrato Principal - Cláusula 3.5.2 (Modificaciones >5%)",
                    hito_verificacion: "Aprobación Junta Directiva"
                });
            }
        }
        
        return riesgos;
    },
    
    // EVALUAR NIVEL DE RIESGO GLOBAL
    evaluarNivelRiesgo(probabilidad, impacto) {
        const matrizRiesgo = {
            "Baja": { "Bajo": "BAJO", "Medio": "BAJO", "Alto": "MEDIO", "Crítico": "ALTO" },
            "Media": { "Bajo": "BAJO", "Medio": "MEDIO", "Alto": "ALTO", "Crítico": "CRÍTICO" },
            "Alta": { "Bajo": "MEDIO", "Medio": "ALTO", "Alto": "CRÍTICO", "Crítico": "CRÍTICO" }
        };
        
        return matrizRiesgo[probabilidad]?.[impacto] || "MEDIO";
    },
    
    // GENERAR YAML PARA ACTUALIZAR MATRIZ_RIESGOS
    generarYAMLActualizacionRiesgos(riesgos, dtID) {
        let yaml = `
# Actualización automática de MATRIZ_RIESGOS_PMO_AMPLIADA
matriz_riesgos_actualizar:
  - file: "VIII. Documentos Maestros y Metodologia/Matrices_Dependencias/MATRIZ_RIESGOS_PMO_AMPLIADA_v1.0.md"
    accion: "agregar_riesgos_nuevos"
    riesgos_nuevos:
`;
        
        riesgos.forEach(riesgo => {
            yaml += `      - id: "${riesgo.id}"
        categoria: "${riesgo.categoria}"
        descripcion: "${riesgo.descripcion}"
        probabilidad: "${riesgo.probabilidad}"
        impacto: "${riesgo.impacto}"
        nivel_riesgo: "${riesgo.nivel_riesgo}"
        estrategia: "${riesgo.estrategia_sugerida}"
        responsable: "${riesgo.responsable}"
        estado: "${riesgo.estado}"
        fuente: "Sistema"
        origen_decision: "${dtID}"
        hito_verificacion: "${riesgo.hito_verificacion}"
        vinculacion_contractual: "${riesgo.vinculacion_contractual}"
        fecha_identificacion: "${new Date().toISOString().split('T')[0]}"
        accion_requerida: "${riesgo.accion_requerida}"
`;
        });
        
        yaml += `
    notificar:
      - tipo: "pmo"
        mensaje: "${riesgos.length} riesgos nuevos identificados por ${dtID}"
      - tipo: "especialista"
        mensaje: "Revisar riesgos asociados a tu propuesta"
`;
        
        return yaml;
    },
    
    // FORMATEAR PESO
    formatearPeso(valor) {
        return '$' + Math.abs(valor).toLocaleString('es-CO');
    }
};

// Exportar para uso global
if (typeof module !== 'undefined' && module.exports) {
    module.exports = SistemaRiesgos;
}

