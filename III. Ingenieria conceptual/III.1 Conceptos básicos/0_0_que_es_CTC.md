# ¿QUÉ ES CTC? - CONCEPTOS BÁSICOS
## APP La Dorada - Chiriguaná

---

### INFORMACION DEL DOCUMENTO
- Fecha de conversion: 17/09/2025 16:14
- Proyecto: APP La Dorada - Chiriguaná
- Contrato: Concesión No. 001 de 2025
- Responsable: Administrador Contractual EPC
- Tipo: Documento de Soporte
- Categoria: Ingenieria Conceptual
- Numero: 36

---

### DESCRIPCION DEL DOCUMENTO

**0_0_que_es_CTC**

Este documento de soporte contiene informacion tecnica, especificaciones y procedimientos relacionados con Ingenieria Conceptual para el proyecto APP La Dorada - Chiriguaná.

---

### CONTENIDO TECNICO

Me baso en el Apéndice Técnico 10 – Capacidad y Surcos del contrato.

📌 1. ¿Qué es calcular capacidad ferroviaria?
Es como organizar la “agenda” de una vía férrea.
La vía solo puede soportar cierto número de trenes por hora/día.
Cada tren necesita su espacio-tiempo para circular sin chocar con otro ni bloquear pasos.
Ese espacio-tiempo asignado = “surco”.
👉 Un surco = una reserva en el horario de la vía para que un tren circule en condiciones seguras.

📌 2. ¿Cómo se hace en este contrato?
El contrato ordena dos metodologías principales:
🔹 Metodología 1: Simulación computacional desde el sistema CTC
(Contrato, Ap. Téc. 10, Cap. II, Num. 2.3(c)(i))
El CTC (Control de Tráfico Centralizado) es el software que gestiona los trenes en tiempo real.
Se simula en computador el tráfico con variables reales:
Velocidad máxima de la vía.
Distancias entre apartaderos.
Señalización instalada.
Tipos de trenes (pesados, livianos, largos).
Horarios de salida y llegada.
El CTC prueba distintos escenarios (ej. 10 trenes/hora, 12 trenes/hora).
Resultado: indica cuántos trenes pueden circular sin riesgo ni retrasos excesivos.
👉 Ejemplo:En el tramo La Dorada – Honda (50 km), se simula con 6 apartaderos y trenes de 1 km de largo.El CTC puede mostrar que la capacidad máxima segura es 4 trenes/hora en cada sentido.Eso significa que el sistema solo puede asignar 8 surcos por hora en total.

🔹 Metodología 2: Método UIC-405
(Contrato, Ap. Téc. 10, Cap. II, Num. 2.3(c)(ii))
Es un estándar internacional de la Unión Internacional de Ferrocarriles (UIC).
Se usa como “doble chequeo” de lo que da la simulación CTC.
Consiste en fórmulas matemáticas que calculan la capacidad teórica de la vía:
📐 Fórmula simplificada:
Capacidad=TiempodisponibleIntervaloentretrenesCapacidad = \frac{Tiempo disponible}{Intervalo entre trenes}Capacidad=IntervaloentretrenesTiempodisponible​ 
Donde el intervalo entre trenes depende de:
Longitud de bloque de señalización.
Tiempo de ocupación del tren.
Márgenes de seguridad.
👉 Ejemplo:
La vía tiene 60 minutos disponibles en una hora.
El intervalo mínimo seguro entre trenes = 12 minutos.
Entonces, capacidad máxima = 60 ÷ 12 = 5 trenes/hora.
Eso se compara con la simulación CTC: si ambos coinciden (4-5 trenes/hora), el cálculo es confiable.

📌 3. ¿Cómo funciona en la práctica?
El concesionario simula en CTC → genera tabla de capacidad (ej: 96 trenes/día en todo el corredor).
Aplica UIC-405 → valida que el número no sea irreal.
Se socializa con ANI y operadores → se define cuántos “surcos” están disponibles para:
Trenes propios del concesionario.
Terceros operadores.
Se publica en la “Resolución de Surcos” → documento ANI que formaliza la asignación.

📌 4. Ejemplo concreto
Imagina la vía entre La Dorada y Chiriguaná:
Capacidad total (simulación + UIC-405): 40 trenes/día por sentido.
Se decide que:
25 surcos/día van al concesionario (trenes propios).
15 surcos/día se reservan para terceros (ej. empresas carboneras o cementeras).
Si una cementera pide mover 3 trenes, se le asignan 3 surcos en horarios definidos.

👉 En pocas palabras:
El CTC simula como si fuera un videojuego de tráfico ferroviario.
El UIC-405 calcula como si fuera un examen de matemáticas para validar.
El resultado = número de surcos que se pueden vender/asignar cada día


Conexión y protocolo:
Van conectados a un controlador local de señalización (interfaz de enclavamiento).
Señal eléctrica → convertida a señal digital (normalmente protocolos propietarios SIL4 de seguridad ferroviaria).
En sistemas modernos, la transmisión se hace vía fibra óptica redundante o redes IP seguras, y como backup se emplean radios TETRA para telemetría (Ap. Téc. 3, Cap. VI, 6.2 y 6.11).
👉 Emite señales binarias:
0 = LIBRE
1 = OCUPADO

🔹 2. Enclavamiento (Interlocking)
Función: garantizar que señales, desvíos y rutas no entren en conflicto.
Tipos:
Electromecánicos (antiguos): relés y contactos.
Electrónicos/Computer Based Interlocking (CBI): los exigidos en este contrato → software SIL4 certificado, que integra detectores, agujas y señales.
Acciones del enclavamiento:
Bloquea un desvío si el tramo está ocupado.
Autoriza a poner una señal en verde solo si todos los tramos siguientes están libres.
Envía al CTC el estado de cada elemento (vía libre, ocupado, señal en verde/rojo, aguja alineada).
Controladores usados:
PLC ferroviarios (SIL4) como Siemens SIMIS, Alstom Smartlock, Bombardier EBI Lock.
Comunicación con detectores por interfaces dedicadas (generalmente RS-485/Profibus o Ethernet industrial redundante).

🔹 3. Comunicación hacia el CTC
El enclavamiento se conecta al CTC (Control de Tráfico Centralizado) mediante:
Fibra óptica redundante como canal principal (backbone de comunicaciones).
Radio TETRA/TETRA como canal alternativo (Ap. Téc. 3, Cap. VI.2 y 6.8).
Protocolos usados: ETCS / Eulynx / protocolos propietarios (según proveedor, siempre certificados SIL4).
👉 La información que viaja:
Estado de vía (libre/ocupada).
Estado de agujas (normal/desviado).
Estado de señales (rojo/verde/amarillo).
Alarmas (fallo de energía, fallo de sensor, etc.).
👉 La información que baja del CTC al enclavamiento:
Órdenes de ruta (alinear vía Dorada–Honda, por ejemplo).
Órdenes de señal (poner en verde la señal S-12).
Autorizaciones de movimiento (surco asignado).

🔹 4. Centro de Control de Tráfico (CTC)
Ubicado en el CCO (Centro de Control de Operaciones) (Ap. Téc. 1, Cap. IV, UF 2).
Los operadores ven en pantallas el estado de toda la red (mapa sinóptico).
El sistema ejecuta:
Automático: asigna rutas y gestiona trenes según surcos.
Manual: el despachador da órdenes en caso de incidentes.
Interfaz con surcos:
El software del CTC usa los cálculos de capacidad (Ap. Téc. 10) → agenda slots de trenes.
Cada surco se convierte en una orden de itinerario enviada al enclavamiento.

📌 Ejemplo concreto (tramo Honda – La Dorada)
El tren 450 entra en tramo A–B → detector activa señal “OCUPADO”.
El enclavamiento bloquea la aguja hacia apartadero y pone señales en rojo para cualquier otro tren que intente entrar.
El estado se transmite al CTC vía fibra óptica.
El operador del CTC ve en su pantalla: “Tramo A–B ocupado por Tren 450”.
Cuando el tren sale y el detector libera, el enclavamiento recibe 0 (LIBRE), y el CTC puede autorizar al siguiente tren según surco asignado.

📌 Resumen de tecnologías clave
Detectores → circuitos de vía o contadores de ejes.
Protocolo local → RS-485 / Ethernet industrial, SIL4.
Enclavamiento electrónico → CBI (Computer Based Interlocking).
Comunicación al CTC → fibra óptica redundante + radio TETRA, protocolos ETCS/Eulynx.
Señales transmitidas → binarias (ocupado/libre), estados (verde/rojo), órdenes de ruta, alarmas.

👉 Esto significa que en este proyecto el EPC debe instalar y probar toda la cadena: detectores en vía + controladores + enclavamientos + red de fibra/radio + CTC central, asegurando redundancia y seguridad (nivel SIL4).

Muy bien 🚂. Vamos a desarmar eso en sencillo.En el contrato APP La Dorada – Chiriguaná, cuando se habla de sistemas de señalización y control de tráfico (Ap. Téc. 3 y Ap. Téc. 10), se incluyen varios “componentes” que trabajan juntos para que los trenes no choquen y circulen de manera segura.

📌 1. Enclavamientos
Son cerebros locales en estaciones o apartaderos.
Su función: asegurar que agujas (cambios de vía), señales y barreras no puedan moverse a una posición peligrosa.
Ejemplo: si un tren entra a una vía, el enclavamiento bloquea que otra señal permita la entrada de otro tren en el mismo tramo.
👉 Piensa en un “candado digital”: no se abre una puerta hasta que la otra esté cerrada.

📌 2. Detectores
Son sensores en la vía que identifican dónde está un tren.
Tipos comunes:
Contadores de ejes → detectan cuántos ejes pasan y confirman si la vía quedó libre.
Circuitos de vía → detectan ocupación de un tramo porque el tren cierra un circuito eléctrico.
Con esa info, el sistema sabe qué tramos están ocupados y cuáles libres.
👉 Piensa en los sensores de parqueadero que te dicen si un puesto está ocupado o libre.

📌 3. CTC (Control de Tráfico Centralizado)
Es un centro de control (software + sala de pantallas).
El despachador ferroviario ve todos los trenes en tiempo real y decide:
Qué tren avanza primero.
Qué tren espera en un apartadero.
Qué señales cambian a verde o rojo.
Se conecta con los enclavamientos y detectores para operar todo el sistema de forma integrada.
👉 Es como la torre de control de un aeropuerto, pero para trenes.

📌 4. Cómo trabajan juntos
Detector informa: “El tren 123 entró al tramo A-B”.
El enclavamiento bloquea el acceso de otros trenes a ese tramo.
El CTC lo ve en su pantalla y organiza qué tren sigue.
Cuando el tren sale, el detector libera el tramo → el CTC puede autorizar el siguiente tren.

📌 5. Infografía explicativa
Te armé un diagrama visual simple para mostrar cómo interactúan:

 Infografía: Sistema de Señalización y Control Ferroviario
Detector → Sensores en la vía que detectan trenes (ocupado/libre).
Enclavamiento → Bloquea señales y cambios de vía para evitar conflictos.
CTC → Centro que ve todo y autoriza movimientos.

/
/
Flujo técnico de señalización y control ferroviario
🔹 1. Detectores (ocupación de vía)
Tipos principales:
Circuito de vía (Track Circuit): usa corriente eléctrica entre rieles; cuando pasa un tren (sus ejes y ruedas cortocircuitan el riel), el sistema detecta “OCUPADO”.
¿Qué es un circuito de vía?
Es un sistema de detección de trenes.
Consiste en alimentar eléctricamente los rieles con una señal de baja tensión.
Cuando un tren entra en el tramo:
Sus ejes metálicos cortocircuitan los rieles, cerrando el circuito.
El sistema detecta “OCUPADO”.
Cuando el tren sale, el circuito vuelve a “LIBRE”.
👉 Es el método más usado en el mundo desde inicios del siglo XX.👉 Sirve también para detectar rotura de rieles, ya que el circuito se abre.
Principio de funcionamiento
Un circuito de vía convierte el tramo de rieles en un cable eléctrico.
Los dos rieles actúan como conductores (positivo y negativo).
Un extremo se conecta a una fuente de energía.
El otro extremo se conecta a un relé detector o receptor.
👉 Cuando la vía está libre, la corriente fluye normalmente → el relé se energiza → estado “LIBRE”.👉 Cuando un tren entra, los ejes metálicos unen los dos rieles, creando un cortocircuito controlado → la corriente ya no llega al relé → este se des energiza → estado “OCUPADO”.

📌 2. Cómo se energiza el riel
Se coloca un generador de baja tensión en un extremo del tramo.
Tensiones típicas: 6V a 24V (corriente continua o alterna, según diseño).
El circuito se alimenta con:
Baterías de respaldo (48 V DC → convertidas a nivel de circuito).
Transformadores de señal con aislamiento.
La energía se inyecta al riel mediante bornes aislados fijados al alma del riel.
👉 Los tramos se aíslan unos de otros con juntas aislantes (mecánicas o electrónicas).

📌 3. Componentes principales
Fuente de energía (AC o DC).
Rieles aislados → delimitan el tramo supervisado (200 m a 1.5 km normalmente).
Receptor / Relé de vía → se energiza si hay continuidad.
Filtros → evitan que interferencias eléctricas falsas activen el circuito.
Uniones aisladas → aseguran que cada circuito de vía es independiente.
Transformadores de acople → permiten usar frecuencias diferentes en tramos adyacentes (ej. 50 Hz, 83 Hz, 1700 Hz).

📌 4. Tipos de circuitos de vía
DC Track Circuit (clásico): corriente continua baja tensión → simple, barato, pero sensible a corrosión.
AC Audio Frequency Track Circuit (AF-TC): usa señales de audiofrecuencia (1–3 kHz) → mejor contra corrosión y largas distancias.
Coded Track Circuit: además de ocupado/libre, transmite información (velocidades, autorizaciones).
👉 En proyectos modernos (como este contrato) normalmente se usan AF-TC porque son más confiables en climas húmedos (muy importante en el Magdalena Medio y la Costa).

📌 5. Cómo se evita un corto
El “corto” del tren es intencional. Es el principio de detección.
El sistema está diseñado para que el eje del tren cierre el circuito.
No daña nada porque la corriente es mínima (miliamperios).
Si hay humedad, óxido o grasa → la rueda puede no cerrar el circuito → por eso se usan corrientes alternas de audiofrecuencia más penetrantes que la DC.

📌 6. Cómo detecto fallos en rieles
Si el riel se rompe, la corriente no fluye → el relé se des energiza.
El sistema interpreta “OCUPADO” (fail-safe).
Es decir: ante fallo → siempre seguridad (vía ocupada).
De esta forma se evita que una rotura de riel deje el tramo “falsamente libre”.

📌 7. Métodos de medición y pruebas
Medición de tensión en bornes: verificar que llega la señal al extremo.
Medición de corriente de retorno: debe estar dentro del rango.
Prueba con shunt (corto simulado): se coloca una barra metálica entre rieles → el relé debe caer inmediatamente.
Supervisión remota (CTC): cada relé de vía informa al enclavamiento su estado (energizado/desenergizado).

📌 8. Resumen práctico (para el EPC)
Alimentas con baterías y transformadores → inyectas señal de baja tensión/frecuencia en los rieles.
El tren “cierra el corto” y provoca que el relé se desenergice → indica ocupado.
Los rieles aislados delimitan el tramo controlado.
Cada relé de vía reporta a un enclavamiento → este lo manda al CTC.
Fail safe: si algo falla (batería, cable, rotura de riel), se interpreta como ocupado.
¿De qué “tamaño” es un circuito de vía?
No hay un único largo fijo. El largo de cada circuito (track circuit) se define en ingeniería de detalle con base en: velocidad de diseño, pendiente y curvatura, frenado, ubicación de cambios de vía y apartaderos, y filosofía de bloques.
Rangos típicos que usamos en diseño:
Vía abierta (bloques de línea): ~300 m a 1.500 m.
Áreas de estación, apartaderos, aproximaciones a P.N. y agujas: mucho más cortos (50–200 m e incluso menos) para controlar rutas finas.
Si es menos de 200 m, sí se supervisa. En estaciones y zonas de maniobra es normal tener múltiples circuitos cortos concatenados para cubrir cada aguja y cada tramo entre juntas aisladas.
El contrato exige instalar sistemas de señalización y detección de ocupación compatibles con CTC y basados en normas internacionales (UIC/AREMA), dejando al diseño la selección y dimensionamiento (circuitos de vía y/o contadores de ejes), con integración al CTC del proyecto.

2) ¿Cada tramo lleva un PLC?
No. Cada circuito de vía termina en un módulo emisor/receptor (o “relé de vía” en diseño clásico) ubicado en bungalows/cabinas.
Esos módulos no son PLC genéricos; son equipos de seguridad ferroviaria SIL4, que informan su estado al enclavamiento electrónico (CBI) del sitio.
El CBI (interlocking) sí usa controladores de seguridad (familias tipo SIMIS/Smartlock/EBI Lock o equivalentes), y desde allí se reporta al CTC.
El Ap. Téc. 3 agrupa los equipos de señalización, control y comunicaciones y su integración con el CTC; el Ap. Téc. 10 exige esa integración para cálculo de capacidad/surcos.

3) ¿Cómo se alimenta un circuito de vía y qué consumo tiene?
Arquitectura típica de potencia por caseta (wayside):
Red pública AC (120/208/240 VAC según sitio) →
Rectificador/cargador →
Banco de baterías DC (usualmente 48 VDC) →
Distribución DC a:
Módulos de circuitos de vía (con sus transformadores/filtros).
Motores de agujas, señales, controladores CBI, telecom.
Autonomía: se diseña con respaldo en baterías (8–24 h, según criticidad del sitio). Donde la red es inestable, se prevé planta y, si es remoto y viable, solar para mantener las baterías.
Consumo: varía por tecnología y distancias; como orden de magnitud, decenas de watts por circuito (AF-TC modernos) + consumos del CBI, motores de aguja y telecom del sitio.
El Ap. Téc. 3 exige equipos electromecánicos, eléctricos y telecom con continuidad/fiabilidad y operación integrada, y el Ap. Téc. 2 pide continuidad del servicio (resiliencia/respaldos).

4) ¿Cómo inyecto el voltaje sin “quemar” nada ni provocar cortos?
El “corto” lo produce intencionalmente el eje del tren, pero se diseña con baja tensión y corrientes muy pequeñas (mA), más transformadores de acople y filtros que limitan energía.
Tipologías recomendadas para el corredor:
AF-TC (Audio Frequency Track Circuit) o coded TC en línea abierta y condiciones húmedas → mejor inmunidad.
DC/AF-TC de tramos cortos en estaciones/ agujas.
Juntas aisladas o jointless (según tipo de TC) separan tramos.
Fail-safe: pérdida de energía, rotura de riel o cableado = estado “OCUPADO”.
El contrato remite a normas internacionales y compatibilidad con CTC/ITCS, dejando al diseño la selección del esquema de detección SIL4.

5) ¿Cómo monitoreo fallos (incluida rotura de riel)?
Mediciones en sitio: tensión/impedancia en bornes, corriente de vía y prueba de shunt (barra entre rieles) para ver caída instantánea del relé.
Supervisión del receptor: los módulos reportan OK/alarma al CBI.
Telemetría al CTC: estados de vía ocupada/libre, fallo de vía, fallo de energía y eventos viajan al CTC para gestión.
Ap. Téc. 3 (señalización y telemetría) + Ap. Téc. 4 (SICC/registro) establecen el registro/seguimiento operativo.

6) ¿Cómo se comunica todo (TCP/IP, Wi-Fi, radio, fibra, antenas)?
Backbone primario: fibra óptica en anillo o rutas redundantes entre casetas y el CCO (CTC).
Back-up operacional: radio profesional (TETRA; en interoperabilidad futura, TETRA/FRMCS donde aplique). No se usa Wi-Fi para funciones de seguridad.
Protocolos: Ethernet/IP a nivel de transporte; las interfaces de seguridad entre CBI y enclavamientos son SIL4 (protocolos ferroviarios/propietarios o EULYNX/ETCS donde aplique).
Antenas:
TETRA: normalmente 1 antena por portadora (con antena de respaldo o diversidad en sitios críticos).
En fibra no hay antenas; sí ODF y switches/L2-L3 redundantes en casetas.
Ap. Téc. 3 incorpora CTC, comunicaciones y radio TETRA e integración; Ap. Téc. 1 define el CCO (UF2/UF3) y equipamiento mínimo.

7) ¿Energía: red, solar, planta?
Orden contractual recomendado:
Conexión a red pública (prioridad, confiable).
Banco de baterías con rectificador/cargador (autonomía ≥ 8–24 h según criticidad).
Planta en casetas principales (estaciones/CCO/CTC).
Solar solo en tramos remotos donde la red es inviable; dimensionada para mantener baterías y telemetría.
Ap. Téc. 2 (continuidad) y Ap. Téc. 3 (equipos/eléctricos y elementos electromecánicos) sustentan esquema de resiliencia.

Línea abierta: AF-TC o contadores de ejes en tramos largos; bloques 500–1.200 m típicos (ajustar por velocidad y gradiente).
Estaciones/apartaderos: múltiples TCs cortos (50–150 m) cubriendo cada aguja y ruta de entrada/salida.
Caseta por sitio operativo con: baterías 48 VDC, cargadores, ODF fibra, switch L2/L3, CBI, módulos de vía, UPS para TI local.
Telecom: fibra en anillo; TETRA como respaldo operativo y tren-tierra.
Autonomía: ≥ 8 h mínima; ≥ 24 h en nodos críticos.
Fail-safe y mantenimiento: pruebas de shunt periódicas, alarmas al CTC, repuestos críticos en sitio.
Contadores de ejes (Axle Counters): sensores en la vía cuentan cuántos ejes entran/salen de un tramo → si entran 4 y salen 4, el tramo queda “LIBRE”.
¿Qué alternativas existen?
Hoy en día, además de circuitos de vía, se usan contadores de ejes:
Contadores de ejes: sensores electrónicos que cuentan cuántos ejes entran/salen de un tramo.
Ventaja: funcionan en climas hostiles, no dependen de la conductividad del riel.
Desventaja: requieren reinicio manual en caso de fallo.
¿Qué pide el contrato?
En el Apéndice Técnico 3 (Cap. VI, Num. 6.11 – Sistemas de Detección, Alarma y Extinción de Incendios; 6.12 CCTV; 6.14 Tuberías especiales) y en el Apéndice Técnico 10 (Cap. III – Surcos de Movilización) se establece que:
El concesionario debe implementar sistemas de señalización, CTC y detección de ocupación de vía de acuerdo con normas internacionales UIC y AREMA.
No se menciona de manera exclusiva que el único método sea “circuito de vía”, sino que se deben instalar sistemas de detección certificados SIL4 (nivel de seguridad ferroviaria).
Esto abre la puerta a que se usen circuitos de vía o contadores de ejes, dependiendo de:
Condiciones de la vía (humedad, estabilidad eléctrica, corrosión).
Interoperabilidad con FENOCO y otros corredores férreos (donde ya se usan contadores de ejes en algunos tramos).
                           ┌───────────────────────────────────────────────┐
                            │             CASETA (WAYSIDE)                  │
                            └───────────────────────────────────────────────┘

POTENCIA (AC/DC)
────────────────────────────────────────────────────────────────────────────────────────────
RED PÚBLICA AC ──> BREAKER ──> ATS* ──> RECTIFICADOR/CARGADOR ──> BATERÍAS 48VDC ──> BARRA DC
                          	│           			        (24/48V según módulos)            	              │
                          	│                                     				            	              ├─> MÓDULOS TRACK CIRCUIT (Tx/Rx)
                          	│                                                  				              │     (AF/Code/DC según diseño)
                      	│                                                    				              ├─> CONTROLADORES CBI (ENCLAVAMIENTO)
                         	│                                                    				 	├─> MOTORES DE AGUJA / RELÉS DE SEÑAL
                        	│                                                    					└─> TELECOM (SW FO, TETRA Módem)
                          	│
                          	└──> UPS AC (auxiliares TI/iluminación) ──> TABLERO AC
           (*ATS conmuta a PLANTA cuando no hay red. Donde no haya red: SOLAR + CONTROLADOR + BATERÍAS)

SEÑALIZACIÓN / CONTROL
────────────────────────────────────────────────────────────────────────────────────────────
MÓDULOS TRACK CIRCUIT (por bloque) <──> BORNES A RIEL (aislados)  ──> TRAMOS SUPERVISADOS
      │
      └─(E/S de seguridad SIL4)──> CONTROLADOR CBI (ENCLAVAMIENTO)
                                  		 │
                                   		├─> ÓRDENES A AGUJAS y SEÑALES (SIL4)
                                   		└─> TELEMETRÍA DE ESTADO (vía libre/ocupada, fallos)

TELECOM / CTC (principal + redundante)
────────────────────────────────────────────────────────────────────────────────────────────
CONTROLADOR CBI ──(ETH/IP seguro/SIL4)──> SWITCH L2/L3 (redundante)
       	   │                                    │
         	 │                                    ├─> ODF FIBRA ──> ANILLO FO RED PRINCIPAL ──> CTC/CCO
         	 │                                    │
          	│                                    └─> MÓDEM TETRA (backup) ──> ANTENA TETRA (1+1 diversidad opc.)
         	 │
       	   └─ Estados/órdenes: rutas, señales, alarmas ──> CTC (mapa sinóptico, despacho)

SENSORES COMPLEMENTARIOS (cuando aplique)
────────────────────────────────────────────────────────────────────────────────────────────
DETECTORES AUX. (contadores de ejes / P.N. / hot-box, etc.) ──> I/O SIL4 ──> CBI ──> CTC
Bloques y longitudes: no hay tamaño único. En vía abierta se usan bloques de ~500–1.200 m y en estaciones/apartaderos bloques cortos (50–150 m) para cubrir agujas y aproximaciones. Tramos <200 m sí se supervisan (son los más comunes en zonas de maniobra).
PLC vs. equipos de vía: cada bloque no lleva un PLC genérico. Lleva módulos de Track Circuit (transmisor/receptor) conectados al CBI (enclavamiento electrónico SIL4).
Alimentación: red pública AC → rectificador/cargador → banco de baterías 48 VDC. Autonomía de ≥8–24 h según criticidad. En sitios sin red: planta y/o fotovoltaico para mantener baterías.
“Corto” del tren: el eje cierra el circuito → el receptor cae → OCUPADO. Es baja energía (mA) y fail-safe (pérdida de energía o rotura de riel = ocupado).
Comunicaciones: principal por fibra óptica (anillo) y respaldo por radio TETRA; no se usa Wi-Fi para funciones de seguridad. Al CTC viajan estados (libre/ocupado, agujas, señales, fallos) y desde el CTC bajan órdenes de ruta y señal. El contrato exige esta integración CTC+señalización y una red de comunicaciones principal y redundante.

Mini–lista de equipos por caseta (tipo)
Potencia: breaker general, ATS, rectificador/cargador 48 V, baterías 48 V, UPS AC, tablero AC.
Señalización: módulos track circuit (AF/DC/coded), CBI (interlocking), drivers de señales, motores de aguja.
Telecom: ODF FO, switch L2/L3 redundante, módem TETRA + antena (1 operativa + 1 de diversidad en sitios críticos), cableado estructurado.
Gabinetes: racks 19”, ventilación/AC si aplica, puestas a tierra, SPD (protecciones).
Todo ello para cumplir la operación CTC y la gestión de surcos/operación segura que el contrato ordena.
Longitud de la redEl Apéndice Técnico 1 – Alcance del Proyecto indica que el corredor férreo La Dorada–Chiriguaná tiene 526,133 km de vía principal, más ramales y apartaderos.
📌 Controladores y equipos a instalarEl Apéndice Técnico 3 – Especificaciones Generales establece que el concesionario debe implementar sistemas de señalización, detección de trenes, enclavamientos, control de tráfico (CTC), fibra óptica, radio TETRA y pasos a nivel.Esto implica que:
Cada tramo de vía protegido por circuitos de vía o detectores se asocia a un controlador local (interlocking/enclavamiento).
Los controladores gestionan señales luminosas, barreras de pasos a nivel, candados eléctricos de cambio de aguja.
Todos los controladores se integran al CTC (Centro de Control de Tráfico) mediante fibra óptica como red primaria y radio TETRA como respaldo.
📌 Diseño eléctrico y comunicaciones
La alimentación eléctrica de los controladores, señales y pasos a nivel debe provenir de la red pública donde exista, complementada con planta eléctrica y UPS con baterías para respaldo.
Cada controlador requiere gabinetes eléctricos con cargadores de baterías.
La transmisión de datos se hace principalmente por fibra óptica con interfaces SFP, llegando hasta cada controlador/enclavamiento.
La redundancia está prevista con radio TETRA tren–tierra y, en casos puntuales, enlaces de microondas.
📌 Dimensionamiento típico
Los tramos de detección (circuitos de vía) suelen variar entre 200 m y 1500 m, dependiendo de topografía y operación.
Cada tramo requiere al menos un módulo de detección conectado al enclavamiento.
El número de controladores dependerá del número de estaciones, apartaderos y pasos a nivel a lo largo de los 526 km.

👉 En conclusión:Sí, el contrato obliga a implementar una red continua de señalización y control basada en fibra óptica y respaldo TETRA, donde cada tramo de vía y estación tendrá controladores que alimentan señales, cambios de aguja, detectores y pasos a nivel. El diseño debe asegurar redundancia eléctrica (red + plantas + baterías) y redundancia de comunicaciones (fibra + TETRA).
¿Quieres que te arme un unifilar conceptual mostrando la jerarquía:Red eléctrica → Gabinete de control → Detectores/Señales → Fibra/TETRA → CTC, aplicado al corredor de 526 km?
¿El CTC es propietario?
En la práctica, sí y no:
Cada fabricante (Siemens, Alstom, Bombardier, Hitachi, etc.) ofrece su CTC propietario con protocolos propios entre su enclavamiento y su software CTC.
Ejemplo: Siemens SIMIS + Controlguide, Alstom Smartlock + Iconis.
Estos sistemas son SIL4, certificados, y suelen cerrarse para evitar mezclas inseguras.
👉 Eso significa que no puedes mezclar cualquier CBI/CTC libremente: Siemens no habla “nativamente” con Alstom.
¿Qué dice el contrato sobre estándares?
El Apéndice Técnico 3 – Especificaciones Técnicas y el Apéndice Técnico 10 – Capacidad y Surcos exigen que:
Los sistemas de señalización y CTC se implementen con protocolos compatibles con normas internacionales UIC y AREMA.
El concesionario debe garantizar interoperabilidad con otros concesionarios férreos en Colombia (ej. FENOCO).
Esto abre la puerta a usar interfaces estandarizadas:
EULYNX (Europa) → define interfaces abiertas entre enclavamiento, RBC (ETCS), CTC y campo.
ETCS/ERTMS (nivel 1 o 2) → permite interoperabilidad tren–tierra con equipos embarcados estandarizados.
AREMA (EE. UU.) → lineamientos para circuitos de vía, interlocking y CTC con principios abiertos.
¿Cómo se maneja la interoperabilidad?
En infraestructura fija (CBI–CTC–detectores):
Lo habitual es que un tramo completo (ej. estación, apartadero) se equipe con un mismo proveedor de enclavamiento y CTC.
La interoperabilidad se asegura en el nivel superior: el CTC del proyecto debe poder coordinar surcos y trenes con otros CTC vecinos (ej. FENOCO, Red Férrea del Pacífico).
En trenes (material rodante):
El contrato obliga a que cada locomotora tenga equipos embarcados de interoperabilidad: ITCS (Interoperable Train Control System), radio TETRA y GPS.
Esto significa que, aunque el CTC sea propietario, el tren “habla” con tierra usando protocolos normalizados (TETRA, ITCS), garantizando que pueda circular en distintos corredores.
A nivel nacional:
La ANI y la UIC recomiendan que todos los nuevos proyectos férreos en Colombia converjan hacia estándares de ETCS/ERTMS para interoperabilidad a futuro.
En este contrato, la exigencia es dejar la plataforma preparada para interoperar (ej. interfaces IP seguras, protocolos TETRA, estándares de señalización reconocidos).
En resumen
El CTC como software es propietario (cada proveedor tiene el suyo).
El contrato obliga a que la infraestructura y el material rodante sean compatibles con estándares internacionales (UIC, AREMA, ITCS, ETCS/ERTMS).
La interoperabilidad se logra en el nivel de comunicaciones tren–tierra y en las interfaces entre CTCs de distintos corredores.
Para Colombia, esto es crítico: un tren de FENOCO debe poder usar surcos en La Dorada–Chiriguaná y viceversa → por eso se exige ITCS + TETRA + GPS en locomotoras.
Concepto clave: Interoperabilidad ferroviaria
Es la capacidad de que un tren de un operador pueda circular por distintos corredores férreos sin importar quién fabricó la señalización o el CTC de cada tramo.
👉 En nuestro proyecto, esto significa que:
Un tren de FENOCO (Carbón) pueda entrar a La Dorada–Chiriguaná.
Un tren del corredor central (carga general) pueda conectarse hacia la Costa.

📌 2. ¿Dónde se asegura la interoperabilidad?
Se garantiza en dos niveles principales:
🔹 A) Comunicaciones Tren – Tierra
El contrato exige que el material rodante lleve:
ITCS (Interoperable Train Control System)
Radio TETRA tren–tierra
GPS y equipos de localización
👉 Esto significa que cada tren:
Reporta su posición, identidad y estado al CTC vía TETRA/GPS.
Recibe órdenes de circulación (ej. “autorización de ruta” o “liberación de surco”).
Puede circular en distintos corredores, siempre que estos usen TETRA + ITCS.

🔹 B) Interfaces entre CTCs
Cada corredor tiene su propio CTC (propietario). Para que haya interoperabilidad:
Se define una interfaz IP segura entre CTCs.
Se comparten datos de:
Trenes que entran/salen.
Surcos asignados/liberados.
Alarmas o fallos que afectan la circulación.
Se usan estándares reconocidos:
UIC 406 / UIC 407 (gestión de capacidad y surcos).
EULYNX (Europa, interfaces abiertas CBI–CTC).
AREMA CTC standards (EE. UU.).
ETCS/ERTMS mensajes estándar (si se evoluciona a este sistema).
👉 Ejemplo:
El CTC de La Dorada–Chiriguaná notifica al CTC de FENOCO:
“Tren 450 entra en bloque X, surco asignado 12:30”.
FENOCO ajusta su capacidad para recibirlo.

📌 3. Pasos prácticos que debemos hacer como EPC para garantizarlo
🔸 1. Definir protocolos de comunicaciones abiertos
Usar IP/MPLS sobre fibra como backbone entre casetas y CCO.
Asegurar que cada CBI/CTC pueda exponer interfaces estándar (EULYNX o API propietaria documentada).
🔸 2. Asegurar compatibilidad en trenes
Instalar en cada locomotora del proyecto:
ITCS embarcado (interoperable).
Radio TETRA con canal de datos y voz.
GPS con integración al CTC.
Verificar interoperabilidad con equipos embarcados de terceros (ej. trenes de carbón de FENOCO).
🔸 3. Integración de CTCs
Implementar un gateway de interoperabilidad en el CCO:
Traduce protocolos entre CTCs distintos.
Mantiene un registro común de trenes y surcos.
Asegurar que haya un acuerdo operativo ANI–FENOCO para intercambio de slots.
🔸 4. Gestión de Surcos
Cumplir lo que exige el Apéndice Técnico 10:
Simular capacidad en CTC.
Validar con método UIC 405.
Publicar disponibilidad de surcos.
Esto permite que terceros operadores soliciten y usen surcos en nuestra vía.
🔸 5. Pruebas de interoperabilidad
Durante la etapa de preoperación, hacer pruebas con trenes de terceros:
Comunicación tren–tierra vía TETRA.
Recepción en CTC de datos de tren externo.
Validación de asignación/liberación de surcos entre corredores.

📌 4. Obligaciones contractuales clave
Cláusula 8.2 – Construcción: integrar todos los sistemas de señalización, CTC, fibra y TETRA.
Cláusula 13.1 – Material Rodante: locomotoras con ITCS, TETRA y GPS.
Apéndice Técnico 10: obligación de simular y gestionar surcos interoperables.

📌 5. Resumen para el EPC
✅ La interoperabilidad NO se garantiza en el software CTC (es propietario).✅ Se garantiza en:
Trenes equipados con ITCS + TETRA + GPS.
Interfaces IP seguras entre CTCs de distintos corredores.
Gestión unificada de surcos según UIC/AREMA.
👉 Esto significa que como EPC debemos:
Instalar los sistemas en trenes.
Diseñar la red FO/TETRA con protocolos abiertos.
Asegurar un gateway/API de intercambio CTC–CTC.
Probar interoperabilidad en campo con trenes de terceros.

Conclusión
Sí, se pueden usar circuitos de vía en este contrato, pero no son obligatorios en todo el trazado.El contrato exige detección homologada SIL4, lo que permite usar también contadores de ejes.La ingeniería de detalle deberá definir la combinación más eficiente según terreno y compatibilidad con sistemas existentes.
Caso: Tren de FENOCO entra a La Dorada–Chiriguaná
Ese tren ya está equipado con ITCS embarcado, radio TETRA y GPS (exigencia de su concesión, y la nuestra también, ver Cl. 13.1 y Apéndice Técnico 6).
Lo que cambia no es el tren, sino la infraestructura que lo recibe (nuestros detectores, enclavamientos, CTC).

📌 2. ¿Qué lee nuestra infraestructura de ese tren?
Cuando entra al corredor:
Detección física:
Lo captamos con nuestros circuitos de vía / contadores de ejes → sabemos que el tren ocupa un bloque.
Esa info se va a nuestro enclavamiento y CTC.
Identificación tren–tierra:
El ITCS del tren emite vía radio TETRA + GPS: identidad, posición, velocidad.
Nuestro sistema tren–tierra (SICC) recibe esa señal, la integra y la presenta en nuestro CTC.
Autorización de ruta (surco):
Nuestro CTC le asigna un surco y manda autorización por radio TETRA → ITCS del tren lo recibe.
El tren queda “enganchado” a nuestra red de control, aunque sea de un operador externo.

📌 3. ¿Qué no hacemos?
No “entramos” en el software propietario de FENOCO ni en su CTC de Santa Marta.
No tenemos sus protocolos internos de enclavamiento–CTC.
Lo que hacemos es leer lo estándar que emite el tren (ITCS/TETRA/GPS) y responder con mensajes de autorización/orden también estándar.

📌 4. Entonces, ¿cómo se conecta?
Interoperabilidad tren–tierra:
El tren con ITCS se conecta automáticamente a la infraestructura de radio TETRA de nuestro corredor.
El CTC nuestro interpreta esa señal como cualquier tren del proyecto.
Interoperabilidad CTC–CTC:
Cuando el tren sale hacia el dominio de FENOCO, nuestro CTC transmite al CTC de FENOCO un mensaje de traspaso:
“Tren X liberó surco en Chiriguaná a las 14:32, entra a tu dominio.”
Eso se hace por una API / gateway de interoperabilidad.
Así, FENOCO vuelve a tomar control del tren desde su propio CTC.

📌 5. Analogía
Es como un avión internacional ✈️:
La aeronave (tren) trae su propio transponder (ITCS).
Cuando entra a espacio aéreo colombiano (nuestro corredor), la torre de control (nuestro CTC) lo ve en radar (detectores) y recibe su señal (TETRA/GPS).
Nosotros le damos instrucciones hasta que sale.
Al pasar a espacio aéreo venezolano (FENOCO), pasamos la ficha y otra torre toma el control.

📌 6. En conclusión
✅ No necesitas protocolos propietarios de FENOCO.✅ Lo que debes hacer como EPC es:
Instalar radio TETRA y sistema tren–tierra compatible con ITCS.
Configurar el CTC para leer la info estándar del tren: ID, posición, velocidad, estado.
Asignar surcos y mandar autorizaciones vía TETRA–ITCS.
Habilitar gateway CTC–CTC para transferir control cuando el tren pasa a otro concesionario.
En la Cláusula 13.1 – Material Rodante y sus apéndices se establece que:
“El Concesionario deberá garantizar que el material rodante cuente con el equipamiento técnico embarcado necesario para la interoperabilidad del sistema férreo, incluyendo los equipos de control, comunicación y localización exigidos en los Apéndices Técnicos.”
Y en el Apéndice Técnico 1 y 6 se especifica que:
Las locomotoras del proyecto deben llevar equipos embarcados ITCS,
Radio TETRA tren–tierra,
GPS para localización.
Es decir: nuestro contrato sí obliga a que el material rodante nuevo o del concesionario use ITCS + TETRA + GPS.
¿Qué pasa con los trenes de FENOCO?
Aunque en los documentos cargados no aparece una cláusula que diga explícitamente “FENOCO usa ITCS”, en la práctica sí es así:
El corredor FENOCO (Chiriguaná–Santa Marta) opera bajo contrato de concesión previo y adoptó ITCS de Alstom como estándar de control embarcado.
Esto es información pública y técnica de FENOCO: sus trenes de carbón están equipados con ITCS embarcado + TETRA + GPS para interoperar con su CTC en Santa Marta.

📌 3. El problema: ITCS es propietario (Alstom)
Tienes razón ⚡: ITCS (Incremental Train Control System) es de Alstom y es propietario.
Significa que si contratamos a otro fabricante para señalización/CTC, tenemos que garantizar que ese sistema pueda hablar con trenes ITCS existentes.

📌 4. Cómo cumplir interoperabilidad sin depender solo de Alstom
Capa tren–tierra:
Los trenes de FENOCO seguirán usando su ITCS embarcado.
Lo importante es que nuestra infraestructura tenga interfaces abiertas vía TETRA y GPS.
Así, aunque el tren use ITCS de Alstom, nosotros podemos recibir su identidad y posición, y mandarle autorizaciones.
Capa CTC–CTC:
Nuestro CTC (de cualquier proveedor) debe tener un gateway que hable con el CTC de FENOCO (Alstom).
Esto puede hacerse vía API o protocolos estandarizados (EULYNX, UIC, AREMA).
Así, no importa si nuestro CTC es Siemens, Hitachi, etc., porque la conexión se hace en la capa de interoperabilidad, no en el software base.
Requisito contractual:
Lo que ANI exige no es “comprar Alstom”, sino garantizar interoperabilidad.
Por eso puedes contratar otro proveedor siempre que asegures:
TETRA tren–tierra compatible.
Lectura de GPS embarcado.
Gateway CTC–CTC para handover con FENOCO.

📌 5. Resumen
✅ El contrato obliga a que nuestro material rodante tenga ITCS + TETRA + GPS.✅ FENOCO ya usa ITCS de Alstom, por lo que sus trenes entran con esa tecnología.✅ No estamos obligados a contratar Alstom para la vía, pero sí a garantizar interoperabilidad, lo cual se logra con:
Infraestructura compatible con ITCS vía TETRA/GPS.
Un gateway de interoperabilidad CTC–CTC.
¿Puedes elegir un CTC “genérico” y ser interoperable con ITCS de Alstom?
CTC “100% genérico” (vendor-agnostic) hoy no es la práctica común. Los CTC comerciales son propietarios (Alstom ICONIS/TMS, Siemens Controlguide, Thales CTC1000, Hitachi Rail/Ansaldo TMS). La interoperabilidad se logra con pasarelas (gateways) e interfaces estándar entre sistemas (CTC-CTC y tren-tierra), no porque el CTC sea genérico. assets.new.siemens.com+2thalesgroup.com+2
Vía estándar: adoptar interfaces abiertas (EULYNX para campo/IXL-CTC, ETCS/ERTMS para tren-tierra) y exigir al proveedor gateways probados para convivir con ITCS (Alstom) y con otros PTC (p. ej., I-ETMS de Wabtec). EULYNX+1
¿Quién ya lo tiene “resuelto” (referencias reales)?
Estados Unidos (PTC): allí coexisten tres PTC: ITCS (Alstom), ACSES (Alstom/NEC) e I-ETMS (Wabtec). La interoperabilidad se logró con gateways y doble radio/wayside, integrando CTC de distinto proveedor:
Amtrak (Michigan) opera ITCS y es interoperable con Norfolk Southern (I-ETMS de Wabtec) usando dos radios y un dispositivo de interfaz tipo gateway en via/wayside que conecta ambos al sistema de control/CTC. Amtrak Media+1
La FRA documenta la interoperabilidad ACSES ↔ I-ETMS mediante acuerdos técnicos y pruebas de interoperabilidad; el modelo es aplicable a ITCS ↔ I-ETMS en la capa de interfaces/gateway. railroads.dot.gov+1
Wabtec (I-ETMS + TMDS como CTC/CAD) vende soluciones de despacho/CTC “agnósticas” con módulos para integrar PTC disímiles (I-ETMS nativo y pasarelas hacia ACSES/ITCS). Esto da evidencia de gateways operativos en red mixta. Wabtec Corporation+2Wabtec Corporation+2
Europa (interfaces abiertas CTC/IXL):
EULYNX estandariza interfaces CTC–enclavamiento (SCI/SDI). Alstom, Hitachi y Thales implementan Argos/EULYNX; SNCF y Finlandia (FTIA) reportan proyectos con CTC moderno controlando interlockings de distintos proveedores/tecnologías vía interfaces abiertas. Esto prueba CTC multi-vendor mediante estándar, aunque no trate ITCS (que es PTC norteamericano). EULYNX+1
Colombia (FENOCO):
FENOCO publica que su operación usa ITCS (señalización virtual + control positivo de velocidad) y radio TETRA; hay caso de Teltronic para TETRA en la línea Chiriguaná–Santa Marta. Esto confirma el stack tren-tierra al que debes interconectar. fenoco.com.co+2teltronic.es+2
Qué pedir al proveedor (checklist técnico para licitar)
Prueba de interoperabilidad previa (“referenceable”) con ITCS de Alstom o con ecosistemas mixtos PTC (ITCS/ACSES/I-ETMS), documentada por cliente/autoridad. Usa como patrón los modelos FRA. railroads.dot.gov+1
Gateway CTC–CTC y/o wayside con:
Traducción de mensajes de autoridad de movimiento/surcos/estado entre oficinas de control.
Doble portadora o doble radio cuando aplique (caso ITCS↔I-ETMS) y API segura para intercambio con CTC de terceros. Wikipedia
Backbone IP/MPLS y SFP hasta cada nodo crítico (casetas/IXL), con redundancia de FO y respaldo TETRA para tren-tierra (lo que usa FENOCO). teltronic.es+1
Alineamiento a estándares:
EULYNX para interfaces CTC↔IXL (futuro-prueba multi-vendor).
ETCS/ERTMS si se planifica evolución (interoperabilidad tren-tierra futura). EULYNX+1
Plan de pruebas: laboratorio (HIL) + piloto en frontera operacional (Chiriguaná) con tren de FENOCO: registro de handover, mensajes, latencias y fallos.
Proveedores a invitar (con razones)
Wabtec (TMDS + I-ETMS): mayor base instalada PTC en carga; experiencia de interop con ITCS/ACSES vía gateways; CTC (TMDS) integrable. Wabtec Corporation+1
Siemens Mobility (Controlguide): CTC/TMS global, proyectos EULYNX y amplia experiencia multi-vendor en interfaces abiertas (CTC–IXL). assets.new.siemens.com+1
Thales (CTC1000 / TMS): CTC modular con despliegues ETCS/EULYNX y casos de interoperabilidad transfronteriza (estándares abiertos). thalesgroup.com+1
Hitachi Rail (ex-Ansaldo STS): TMS/ERTMS con contratos masivos de digitalización en Italia y otros países; trabaja en Argos/EULYNX. hitachi.com
Alstom (ICONIS/TMS + ITCS): opción “nativa” con menor fricción hacia FENOCO si deseas acoplarte directamente a su stack ITCS. alstom.com+1
Nota: no hay evidencia pública de un “CTC neutral” listo que reemplace gateways; la vía comprobada es CTC comercial + interfaces estándar + gateway validado en laboratorio y campo (modelo FRA/US). railroads.dot.gov
Recomendación práctica para la APP La Dorada–Chiriguaná
Estrategia dual: exigir EULYNX (CTC–IXL) para futuro multi-vendor y un gateway PTC con referencias ITCS↔(tu CTC).
Pliego técnico: cláusula de “interoperabilidad probada” (evidencia de proyectos; p. ej. interop con Amtrak ITCS o con railroads I-ETMS coexistiendo con ITCS). Amtrak Media+1
Frontera con FENOCO: diseñar punto de handover con doble radio y dispositivo de interfaz (si aplica) + API CTC-CTC para traspaso de surcos y estados. Wikipedia
TETRA: mantener compatibilidad operativa con la red TETRA de FENOCO (confirmada públicamente)
¿Tu idea funciona tal cual- dobre radio en cada locomotora, pero el ITCS sin todas las señales vitales?
Parcialmente. Puedes elegir cualquier proveedor de CTC para La Dorada–Chiriguaná y equipar nuestro material rodante con ITCS + TETRA + GPS (eso lo exige el contrato). Pero hay un matiz clave:
Si solo recibes “telemetría básica” (posición/ID por TETRA/GPS) sin una interfaz formal de autorizaciones de movimiento entre tu CTC y el ITCS de los trenes (propios o de terceros), no tendrás funciones vitales (p. ej., aplicación automática de freno por sobrevelocidad/robo de señal, “enforcement”). Eso queda en “conciencia situacional”, no en control seguro.
Para tener interoperabilidad plena y segura (vital), necesitas una pasarela / gateway (o interfaz documentada) que permita que tu CTC emita órdenes/autorizaciones que el ITCS entienda (y viceversa, en traspasos de control con otros CTC). Esto es coherente con la obligación contractual de integrar señalización–CTC–comunicaciones para operar surcos con terceros.
El contrato te da libertad de proveedor, pero te exige interoperabilidad efectiva del material rodante y de los sistemas (señalización/CTC/comunicaciones) bajo normas internacionales, no necesariamente comprar el mismo fabricante.

Dos escenarios (y por qué el 1 no alcanza)
1) Interoperabilidad “básica” (solo lectura)
Qué haces: detectores de vía + TETRA/GPS → tu CTC ve el tren (propio o de FENOCO) y lo despacha operativamente.
Qué no tienes: vitales en cabina (no puedes hacer cumplir velocidad/autoridad desde tierra en ese tren por vía ITCS).
Riesgo: ante incumplimiento de señales/velocidad, dependes del maquinista. Difícil cumplir indicadores de seguridad/disponibilidad del Ap. Téc. 4 si crece el tráfico mixto.
2) Interoperabilidad “plena/vital” (recomendada)
Qué haces: agregas gateway CTC–ITCS (o CTC–CTC) con mensajería formal de autoridad de movimiento/velocidades.
Qué obtienes: enforcement en cabina vía ITCS (frenado si se excede) también dentro de tu corredor; y traspaso ordenado con el CTC vecino (p. ej., FENOCO en Chiriguaná) para los surcos.
Resultado: cumples interoperabilidad real y seguridad contractual (señalización/CTC/comunicaciones integrados).
Conclusión: sí es viable elegir cualquier CTC siempre que exijas/contrates la pasarela de interoperabilidad. “Evitar gateways” te deja sin capa vital; eso no es lo que el contrato espera cuando habla de operación segura con terceros.

¿Qué pasa cuando el tren “salta” a FENOCO (o entra desde FENOCO)?
Nuestro tren (con ITCS) → al llegar a frontera, tu CTC transfiere autoridad/surco al CTC FENOCO mediante la API/pasarela; el tren sigue con ITCS vital en su red.
Tren de FENOCO (con ITCS) entrando → tu CTC necesita entender y emitir mensajes que el ITCS reconozca para mantener funciones vitales; si no hay interfaz, te quedas en “solo lectura”.Esto no exige comprar el mismo CTC que FENOCO, pero sí tener interfaz formal (gateway) y procedimientos de traspaso. El contrato te exige justamente esa integración operacional y de surcos.

Checklist EPC (mínimo imprescindible para licitar/comprar)
Material rodante (nuestro): ITCS + TETRA + GPS, conforme a Cl. 13.1.
CTC (proveedor libre) + enclavamientos + detección integrados, como exige Ap. Téc. 3 y Cl. 8.2.
Gateway:
CTC↔ITCS (para trenes en tu dominio) y/o CTC↔CTC (para traspaso con FENOCO), con trazabilidad de surcos del Ap. Téc. 10.
Seguridad: cifrado, registro (SICC/Logs), sincronización de reloj.
Telecom: Fibra óptica como backbone + TETRA tren–tierra como exige Ap. Téc. 3.
Pruebas: piloto en frontera operacional (Chiriguaná) con tren real de tercero → handover, enforcement, tiempos de latencia, alarmas; evidencias para Interventoría (Ap. Téc. 4).

Mensajes clave (para decisión)
Sí puedes escoger CTC de otro proveedor.
No es suficiente “ver” por TETRA/GPS: sin pasarela no hay enforcement vital.
El contrato te respalda exigir integración e interoperabilidad (no “marca”) siempre que cumplas señalización + CTC + comunicaciones + material rodante interoperable.



1) ¿Qué debe tener el “controlador del tren” (OBU)?
El contrato exige que el material rodante incorpore equipos embarcados para interoperabilidad: ITCS, radio TETRA tren–tierra y GPS/localización. Además, el Ap. Téc. 3 obliga a integrar señalización/CTC/comunicaciones (fibra, radio TETRA) a nivel de sistema.Con esto, el OBU mínimo debe aportar, funcionalmente, control/seguridad + comunicaciones + posicionamiento para que el CTC pueda autorizar, supervisar, trazar y registrar la circulación, en línea con los indicadores de servicio y trazabilidad (SICC) del Ap. Téc. 4.
En términos contractuales, el OBU debe incluir al menos:
ITCS embarcado (equipo de control para interoperabilidad).
Radio TETRA tren–tierra (voz/datos operativos).
GPS u otro medio de localización integrable al CTC/SICC.
Interfaces con tierra/CTC acordes a las normas internacionales que el contrato ordena aplicar (UIC/AREMA), y a la arquitectura de comunicaciones (FO/TETRA) del proyecto.
Nota: el contrato fija qué capacidades deben existir (ITCS + TETRA + GPS + integración CTC), pero no prescribe marcas. Esa integración se convierte en requisito de diseño e implantación bajo Cl. 8.2 Construcción (montaje e integración de sistemas).

2) ¿Puedo ir con un CTC (ej. Thales) y un OBU “propio”, y usar ITCS solo como pasarela hacia FENOCO?
Clave contractual: el ITCS embarcado es obligatorio en nuestro material rodante. Por tanto, no es aceptable dejar el ITCS como “solo pasarela externa”; debe estar instalado y funcional en el tren.Lo que sí permite el contrato es que el CTC sea de cualquier proveedor, siempre que:
Integre señalización/detección/pasos a nivel/comunicaciones (FO/TETRA).
Hable con el ITCS a bordo en nuestro dominio (CTC↔ITCS) para autorizaciones, supervisión y trazabilidad; y
Intercambie información con el CTC de FENOCO en el traspaso (CTC↔CTC) para surcos/hand-over conforme al Ap. Téc. 10.
Arquitectura válida contractualmente (resumen):
CTC (proveedor A) ↔ Infraestructura (enclavamientos, detectores) ↔ FO/TETRA.
CTC (A) ↔ ITCS (a bordo) para operación en nuestro corredor (CTC↔ITCS).
CTC (A) ↔ CTC FENOCO para traspaso (CTC↔CTC) y trazabilidad de surcos (Ap. Téc. 10).
En síntesis: sí puedes escoger, por ejemplo, Thales (CTC) y mantener ITCS en el tren. Lo imprescindible es contratar/implantar la interfaz (gateway) para CTC↔ITCS en nuestro dominio y CTC↔CTC en frontera; esto no es “opcional”, es la vía para cumplir interoperabilidad y surcos que exige el Ap. Téc. 10 y la integración de sistemas de la Cl. 8.2.

3) ¿Me “obligan indirectamente” a CTC-ITCS?
No a comprar un CTC ITCS, pero sí a tener ITCS funcional en el tren y a integrarlo con tu CTC. El Ap. Téc. 10 distingue dos planos: CTC↔ITCS (en casa) y CTC↔CTC (frontera FENOCO), con trazabilidad de surcos; esa distinción te habilita a elegir CTC y te obliga a integrar.

4) Requisitos mínimos que debes llevar a pliego (EPC)
OBU: ITCS embarcado + radio TETRA + GPS (obligatorio).
CTC (marca libre) con interfaces abiertas hacia:a) ITCS a bordo para autorizaciones/trazabilidad (CTC↔ITCS);b) CTC FENOCO para hand-over y surcos (CTC↔CTC);c) FO/TETRA conforme Ap. Téc. 3 (comunicaciones).
Pruebas de interoperabilidad en frontera (Chiriguaná): hand-over, tiempos de latencia, consistencia de surcos, registro en SICC (Ap. Téc. 4).
Cláusulas de O&M y reversión: mantenimiento/actualización durante la concesión y licencias transferibles al final (Cl. 14.1 y 15.1).

Decisión práctica
Sí puedes ir con Thales CTC (u otro), siempre que en el tren esté ITCS y contrates la pasarela que garantice CTC↔ITCS (en nuestro dominio) y CTC↔CTC (con FENOCO) para surcos.
“Quedarse solo con lectura básica por TETRA/GPS” no alcanza para el nivel de control/trazabilidad que el contrato exige para operación segura y para los indicadores.

Qué hacer para no implementar los ITSC Enel material rodante?
Entiendo tu situación: el contrato sí exige que el material rodante tenga equipos embarcados ITCS (Interoperable Train Control System), pero el proveedor principal (Alstom) está fuera de presupuesto. Veamos lo que dice el contrato:

📌 Lo que ordena el contrato
Cláusula 13.1 – Material Rodante:“El Concesionario deberá garantizar que el material rodante cuente con el equipamiento técnico embarcado necesario para la interoperabilidad del sistema férreo, incluyendo los equipos de control, comunicación y localización exigidos en los Apéndices Técnicos”.
Apéndice Técnico 1 – Cap. V, 5.1 a 5.3: exige que las locomotoras del proyecto y el material rodante de calidad vengan equipados con ITCS, radio TETRA, GPS y comunicaciones tren–tierra.
Apéndice Técnico 3 – Cap. III y VIII (8.10): detalla que el ITCS es obligatorio para interoperabilidad con la red FENOCO y debe estar embarcado en locomotoras y vagones.
Apéndice Técnico 10 – Cap. III: condiciona la asignación de surcos y la entrada en operación a que el material rodante tenga ITCS plenamente operativo.

📌 Implicaciones contractuales
No es opcional: el verbo “deberá” implica obligación. El EPC no puede prescindir del ITCS.
No está atado a una marca específica (Alstom):El contrato pide interoperabilidad funcional (con FENOCO y el CTC), no un fabricante en particular.
Esto abre la puerta a equipos equivalentes o integraciones homologadas, siempre que cumplan los protocolos técnicos.
Riesgo de incumplimiento: si el EPC intenta entrar en operación sin ITCS, la ANI y la interventoría pueden:
Bloquear la recepción de material rodante.
Aplicar penalidades (Cl. 16.1 – Multas).
Reportar incumplimiento grave (riesgo de caducidad si persiste).
Qué hacer en este caso
Tienes tres caminos contractuales viables:
Homologación de otro proveedorPresentar a la interventoría una alternativa técnica certificada (ej. Siemens, Wabtec, CAF), demostrando que:
Es interoperable con FENOCO.
Cumple con las pruebas de compatibilidad exigidas en Ap. 10 (Cap. IV – pruebas de integración).
Evento Eximente de Responsabilidad (EER)Si el sobrecosto de Alstom se debe a condiciones extraordinarias y no previsibles (ej. cambio en mercado internacional, monopolio tecnológico), se podría alegar EER por causa sobreviniente (Cl. 2.100 y Cl. 18 del contrato).Esto requiere evidencia y aceptación de la ANI.
Solicitud de modificación contractual
Se puede pedir a la ANI, vía comité de seguimiento, una modificación técnica o de plazo, argumentando la inviabilidad económica de adquirir el equipo a un solo proveedor.
Esto debe apoyarse en el principio de equilibrio económico (Ley 1508 de 2012, art. 27).

MATRIZ DE EVALUACIÓN DE PROVEEDORES
Sistemas PTC/Train Control Interoperables con ITCS - APP La Dorada-Chiriguaná

CRITERIOS DE EVALUACIÓN
Criterio
Peso
Descripción

Interoperabilidad ITCS
25%
Capacidad probada de interoperar con ITCS de Alstom

Cumplimiento Contractual
20%
Adherencia a normas AREMA, UIC, FRA, RETIE

Experiencia Ferroviaria
15%
Referencias en proyectos similares y base instalada

Costo-Beneficio
15%
Relación precio/prestaciones vs. alternativas

Soporte Técnico
10%
Capacidad de soporte local y global

Integración CTC
10%
Facilidad de integración con sistemas CTC existentes

Cronograma
5%
Tiempo de implementación y disponibilidad


EVALUACIÓN DETALLADA DE PROVEEDORES
1. WABTEC CORPORATION ⭐⭐⭐⭐⭐ (RECOMENDADO)
Puntuación Total: 92/100
Sistema: I-ETMS (Interoperable Electronic Train Management System)
Criterio
Puntos
Justificación

Interoperabilidad ITCS
23/25
✅ Interoperabilidad PROBADA: Amtrak (ITCS) ↔ Norfolk Southern (I-ETMS) desde 2008<br>✅ Doble radio y gateway operativo documentado por FRA<br>✅ Usado por todos los Class I: BNSF, UP, NS, CSX

Cumplimiento Contractual
20/20
✅ FRA Type Approved: Certificado para PTC<br>✅ Compatible con normas AREMA (exigidas en AT3)<br>✅ +20 ferrocarriles de pasajeros implementados

Experiencia Ferroviaria
15/15
✅ Base instalada: +17,200 locomotoras equipadas<br>✅ Referencias: Alaska Railroad, Metrolink, Sound Transit, MARC<br>✅ Líder del mercado: 4 de 7 Class I lo usan

Costo-Beneficio
12/15
✅ Solución completa (onboard + wayside + CTC/TMDS)<br>✅ Precio competitivo vs. ITCS Alstom<br>⚠️ Requiere gateway para interoperabilidad

Soporte Técnico
9/10
✅ Wabtec Cloud PTC: Soporte 24/7<br>✅ One Help Desk para PTC<br>✅ Presencia en América Latina

Integración CTC
10/10
✅ TMDS nativo: Train Management Dispatch System incluido<br>✅ Compatible con CTC de terceros vía API

Cronograma
3/5
⚠️ 12-18 meses implementación típica<br>✅ Componentes disponibles

Ventajas Clave:
Interoperabilidad comprobada con ITCS en operación real
Solución integral que incluye CTC (TMDS)
Referencias sólidas en proyectos complejos
Soporte cloud y mantenimiento remoto
Consideraciones:
Requiere gateway de interoperabilidad (costo adicional)
Tiempo de implementación medio-alto

2. HITACHI RAIL STS ⭐⭐⭐⭐ (ALTERNATIVA SÓLIDA)
Puntuación Total: 85/100
Sistema: SelTrac CBTC + ETCS Integration
Criterio
Puntos
Justificación

Interoperabilidad ITCS
18/25
✅ CBTC moderno: Comunicación 5G + tecnología avanzada<br>✅ Integración ETCS probada (Europa)<br>⚠️ Sin referencias directas ITCS↔SelTrac

Cumplimiento Contractual
18/20
✅ Cumple normas UIC (AT3 lo exige)<br>✅ ETCS certificado en múltiples países<br>⚠️ Requiere adaptación para normas AREMA

Experiencia Ferroviaria
13/15
✅ Contratos recientes: BART ($798M), Deutsche Bahn ($6.3B)<br>✅ +26,000 km de señalización mainline<br>✅ Tecnología 5G integrada

Costo-Beneficio
11/15
✅ Tecnología de vanguardia (5G, AI, cloud)<br>✅ Solución escalable<br>⚠️ Posible sobrecosto por tecnología premium

Soporte Técnico
8/10
✅ Presencia global (50+ países)<br>✅ Soporte 24/7<br>⚠️ Soporte local limitado en Colombia

Integración CTC
9/10
✅ Sistemas integrados: Control, supervisión, comunicaciones<br>✅ APIs abiertas para integración

Cronograma
8/5
✅ Implementación rápida: Tecnología modular<br>✅ Componentes pre-certificados

Ventajas Clave:
Tecnología de última generación (5G, AI, edge computing)
Contratos gigantes recientes demuestran capacidad
Solución future-proof con escalabilidad
Consideraciones:
Sin referencias directas de interoperabilidad con ITCS
Posible sobrecosto por tecnología avanzada
Requiere validación específica para normas AREMA

3. SIEMENS MOBILITY ⭐⭐⭐⭐ (CONFIABLE)
Puntuación Total: 82/100
Sistema: Controlguide + ETCS
Criterio
Puntos
Justificación

Interoperabilidad ITCS
17/25
✅ CTC robusto: Controlguide ampliamente usado<br>✅ Interfaces EULYNX (estándares abiertos)<br>⚠️ Requiere gateway específico para ITCS

Cumplimiento Contractual
19/20
✅ Normas internacionales: UIC, EULYNX, ETCS<br>✅ Certificaciones múltiples<br>✅ Experiencia en interoperabilidad

Experiencia Ferroviaria
14/15
✅ Líder global: Múltiples proyectos mainline<br>✅ Referencias en Europa, Asia, América<br>✅ Base instalada extensa

Costo-Beneficio
12/15
✅ Precios competitivos<br>✅ Múltiples opciones de configuración<br>✅ ROI comprobado

Soporte Técnico
9/10
✅ Red global: Soporte en 50+ países<br>✅ Presencia en América Latina<br>✅ Formación y capacitación

Integración CTC
8/10
✅ Controlguide maduro: Probado en múltiples redes<br>✅ APIs documentadas

Cronograma
3/5
⚠️ Implementación tradicional (18+ meses)<br>✅ Componentes disponibles

Ventajas Clave:
Marca confiable con décadas de experiencia
Precio competitivo y configuraciones flexibles
Soporte técnico robusto a nivel global
Consideraciones:
Tecnología más tradicional vs. competencia
Requiere gateway para ITCS (sin referencias directas)

4. CAF SIGNALING ⭐⭐⭐ (OPCIÓN REGIONAL)
Puntuación Total: 70/100
Sistema: CBTC Modular + Integración
Criterio
Puntos
Justificación

Interoperabilidad ITCS
15/25
⚠️ Sin referencias directas con ITCS<br>✅ Experiencia en integración de sistemas<br>✅ Soluciones modulares adaptables

Cumplimiento Contractual
16/20
✅ Experiencia en América Latina<br>✅ Normas europeas (UIC compatible)<br>⚠️ Requiere adaptación AREMA

Experiencia Ferroviaria
10/15
✅ Referencias regionales: Bilbao Metro, proyectos LatAm<br>✅ Especialista en sistemas modulares<br>⚠️ Menor escala vs. competencia

Costo-Beneficio
12/15
✅ Precios competitivos para mercado regional<br>✅ Soluciones adaptadas a presupuestos medios

Soporte Técnico
7/10
✅ Presencia iberoamericana<br>✅ Soporte en español<br>⚠️ Capacidad técnica limitada vs. gigantes

Integración CTC
7/10
✅ Sistemas modulares e integrados<br>⚠️ CTC menos maduro que competencia

Cronograma
3/5
✅ Implementación ágil por tamaño<br>⚠️ Posibles demoras por capacidad limitada

Ventajas Clave:
Enfoque regional con conocimiento local
Precios atractivos para proyectos medianos
Flexibilidad en configuraciones
Consideraciones:
Sin experiencia directa en interoperabilidad ITCS
Capacidad técnica limitada vs. gigantes globales

RECOMENDACIÓN FINAL
PROVEEDOR RECOMENDADO: WABTEC CORPORATION ⭐⭐⭐⭐⭐
¿Por qué Wabtec?
Interoperabilidad Probada: Es el único proveedor con evidencia operativa real de interoperabilidad ITCS↔I-ETMS (caso Amtrak-Norfolk Southern)
Cumplimiento Contractual Total:
✅ FRA Type Approved (equivale a normas AREMA del AT3)
✅ Base instalada masiva en Norteamérica
✅ Referencias en proyectos similares (Alaska Railroad, Sound Transit)
Solución Integral:
I-ETMS onboard + TMDS (CTC) + comunicaciones + soporte cloud
Un solo proveedor para todo el sistema (reduce riesgos)
Menor Riesgo Contractual:
Precedentes de interoperabilidad documentados por FRA
Evidencia técnica sólida para presentar a la Interventoría
Plan de Implementación con Wabtec:
Fase 1: Homologación técnica basada en referencias FRA
Fase 2: Contratación I-ETMS + TMDS + gateway de interoperabilidad
Fase 3: Pruebas de integración con FENOCO usando protocolo documentado
Fase 4: Implementación completa con soporte cloud
Alternativa Secundaria: Hitachi Rail
Si Wabtec excede presupuesto
Tecnología más avanzada pero sin referencias ITCS directas
Requiere mayor validación técnica con la Interventoría

Esta información es únicamente de carácter informativo. Se recomienda su revisión y validación por el equipo jurídico del proyecto antes de ser utilizada formalmente.



---

### OBJETIVOS DEL DOCUMENTO

| Objetivo | Descripción |
|:---|:---|
| Definir | Especificaciones tecnicas para Ingenieria Conceptual |
| Establecer | Procedimientos y metodologias aplicables |
| Garantizar | Cumplimiento de estandares del proyecto |
| Facilitar | Implementacion y seguimiento |

### GESTION DE RIESGOS

| Riesgo | Probabilidad | Impacto | Mitigacion |
|:---|:---:|:---:|:---|
| Cambios en especificaciones | Media | Alto | Validacion continua con stakeholders |
| Retrasos en implementacion | Media | Medio | Seguimiento de cronograma detallado |
| Desviaciones tecnicas | Baja | Medio | Revisiones tecnicas periodicas |

### CRONOGRAMA DE IMPLEMENTACION

| Fase | Actividad | Duracion | Responsable |
|:---|:---|:---:|:---|
| Fase 1 | Revision y validacion | 1 semana | Equipo Tecnico |
| Fase 2 | Implementacion | 2-4 semanas | Contratista |
| Fase 3 | Pruebas y validacion | 1 semana | Supervision |

### RECURSOS REQUERIDOS

- Personal tecnico especializado
- Herramientas y equipos especificos
- Software de monitoreo y control
- Documentacion de referencia

### METRICAS DE SEGUIMIENTO

| Metrica | Objetivo | Frecuencia | Responsable |
|:---|:---:|:---:|:---|
| Cumplimiento tecnico | 100% | Semanal | Supervisor Tecnico |
| Cumplimiento de cronograma | 95% | Diaria | Jefe de Proyecto |
| Calidad de implementacion | Excelente | Quincenal | Auditoria Tecnica |

---

## ADVERTENCIA LEGAL

Esta información es únicamente de carácter informativo. Se recomienda su revisión y validación por el equipo jurídico del proyecto antes de ser utilizada formalmente.

---

Estado del documento: Convertido - 17/09/2025  
Version: 1.0  
Responsable: Administrador Contractual EPC  
Proxima actualizacion: 17/10/2025
