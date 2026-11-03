-- Script 004: Seed de datos coherentes para TemIA
-- Ejecutar manualmente sobre temia_db
-- Mínimo 50 registros por tabla con coherencia entre ellas

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE respuesta_intento;
TRUNCATE TABLE intento;
TRUNCATE TABLE opcion;
TRUNCATE TABLE pregunta;
TRUNCATE TABLE test;
TRUNCATE TABLE resumen;
TRUNCATE TABLE apunte;
TRUNCATE TABLE usuario;

SET FOREIGN_KEY_CHECKS = 1;

-- ========================================
-- USUARIOS (60)
-- Password hash BCrypt para "Password123!" (común para seeds)
-- ========================================
INSERT INTO usuario (email, username, password_hash, foto_url, role, activo, creado_en) VALUES
('ana.martinez@temia.dev', 'anamartinez', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('luis.garcia@temia.dev', 'luisgarcia', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('maria.lopez@temia.dev', 'marialopez', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('carlos.sanchez@temia.dev', 'carlossanchez', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('laura.fernandez@temia.dev', 'laurafernandez', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('david.perez@temia.dev', 'davidperez', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('sara.gomez@temia.dev', 'saragomez', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('javier.ruiz@temia.dev', 'javierruiz', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('elena.moreno@temia.dev', 'elenamoreno', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('pablo.jimenez@temia.dev', 'pablojimenez', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('cristina.alvarez@temia.dev', 'cristinaalvarez', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('miguel.romero@temia.dev', 'miguelromero', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('alicia.torres@temia.dev', 'aliciatorres', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('roberto.navarro@temia.dev', 'robertonavarro', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('beatriz.ramos@temia.dev', 'beatrizramos', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('fernando.ortega@temia.dev', 'fernandoortega', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('patricia.molina@temia.dev', 'patriciamolina', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('sergio.delgado@temia.dev', 'sergiodelgado', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('monica.castro@temia.dev', 'monicacastro', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('alejandro.ortiz@temia.dev', 'alejandroortiz', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('natalia.rubio@temia.dev', 'nataliarubio', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('ivan.marquez@temia.dev', 'ivanmarquez', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('silvia.suarez@temia.dev', 'silviasuarez', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('adrian.blanco@temia.dev', 'adrianblanco', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('teresa.mendez@temia.dev', 'teresamendez', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('raul.iglesias@temia.dev', 'rauliglesias', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('veronica.medina@temia.dev', 'veronicamedina', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('oscar.garrido@temia.dev', 'oscargarrido', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('irene.santos@temia.dev', 'irenesantos', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('marcos.castillo@temia.dev', 'marcoscastillo', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('andrea.vargas@temia.dev', 'andreavargas', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('hugo.cortes@temia.dev', 'hugocortes', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('lucia.herrera@temia.dev', 'luciaherrera', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('javier.flores@temia.dev', 'javierflores', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('clara.silva@temia.dev', 'clarasilva', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('daniel.mora@temia.dev', 'danielmora', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('eva.aguado@temia.dev', 'evaaguado', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('ruben.dominguez@temia.dev', 'rubendomingu', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('paula.vega@temia.dev', 'paulavega', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('alberto.guerrero@temia.dev', 'albertoguerra', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('miriam.cruz@temia.dev', 'miriamcruz', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('julian.reyes@temia.dev', 'julianreyes', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('ines.pascual@temia.dev', 'inespascual', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('victor.campos@temia.dev', 'victorcampos', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('nerea.soto@temia.dev', 'nereasoto', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('gonzalo.leon@temia.dev', 'gonzaloleon', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('raquel.moya@temia.dev', 'raquelmoya', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('tomas.peña@temia.dev', 'tomaspena', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'USER', 1, NOW()),
('admin.temia@temia.dev', 'admintemia', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'ADMIN', 1, NOW()),
('soporte.temia@temia.dev', 'soportetemia', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', NULL, 'ADMIN', 1, NOW());

-- ========================================
-- APUNTES (60)
-- ========================================
INSERT INTO apunte (usuario_id, titulo, tipo_origen, texto_extraido, fichero_url, fichero_public_id, nombre_original, extension, tamanio_bytes, estado, creado_en) VALUES
(1, 'Introducción a la Biología Celular', 'TEXTO', 'La célula es la unidad básica de los seres vivos. Se distinguen células procariotas y eucariotas. Las eucariotas presentan núcleo definido y orgánulos membranosos.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 60 DAY)),
(2, 'Álgebra Lineal - Matrices', 'TEXTO', 'Una matriz es un conjunto ordenado de números en filas y columnas. Las operaciones básicas incluyen suma, producto escalar y multiplicación de matrices.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 59 DAY)),
(3, 'Historia Contemporánea - Revolución Francesa', 'TEXTO', 'La Revolución Francesa (1789-1799) marcó el fin del Antiguo Régimen. Causas: crisis económica, ilustración y descontento social. Consecuencias: Declaración de los Derechos del Hombre y del Ciudadano.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 58 DAY)),
(4, 'Química Orgánica - Hidrocarburos', 'TEXTO', 'Los hidrocarburos son compuestos formados únicamente por carbono e hidrógeno. Se clasifican en alcanos, alquenos, alquinos y aromáticos según sus enlaces.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 57 DAY)),
(5, 'Física - Mecánica Clásica', 'TEXTO', 'Las leyes de Newton describen el movimiento. Primera ley: inercia. Segunda: F=ma. Tercera: acción-reacción. Se aplican al estudio de fuerzas y movimiento.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 56 DAY)),
(6, 'Derecho Constitucional Español', 'TEXTO', 'La Constitución Española de 1978 establece la soberanía nacional, la monarquía parlamentaria, la separación de poderes y el Estado de Derecho.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 55 DAY)),
(7, 'Microeconomía - Oferta y Demanda', 'TEXTO', 'La ley de oferta y demanda determina el precio de equilibrio. El exceso de demanda genera escasez y presiona al alza los precios, el exceso de oferta presiona a la baja.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 54 DAY)),
(8, 'Anatomía Humana - Sistema Cardiovascular', 'TEXTO', 'El sistema cardiovascular está formado por corazón, arterias, venas y capilares. Su función es transportar oxígeno, nutrientes, hormonas y desechos por todo el organismo.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 53 DAY)),
(9, 'Programación en Java - POO', 'TEXTO', 'La Programación Orientada a Objetos se basa en clases, objetos, herencia, polimorfismo, encapsulamiento y abstracción. Java es un lenguaje orientado a objetos puro en su paradigma.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 52 DAY)),
(10, 'Estadística Descriptiva', 'TEXTO', 'La estadística descriptiva resume y organiza datos. Se usan medidas de tendencia central (media, mediana, moda) y medidas de dispersión (varianza, desviación típica).', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 51 DAY)),
(11, 'Bioquímica - Enzimas', 'TEXTO', 'Las enzimas son catalizadores biológicos proteicos que aceleran reacciones químicas sin consumirse. Tienen especificidad, actúan en condiciones óptimas de pH y temperatura.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 50 DAY)),
(12, 'Geometría Analítica', 'TEXTO', 'La geometría analítica estudia figuras geométricas mediante un sistema de coordenadas. Se utilizan ecuaciones de recta, circunferencia, parábola, elipse e hipérbola.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 49 DAY)),
(13, 'Edad Media Europea', 'TEXTO', 'La Edad Media se divide en Alta, Plena y Baja Edad Media. Caracterizada por el feudalismo, el papel de la Iglesia, las cruzadas y el nacimiento de las universidades.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 48 DAY)),
(14, 'Química Inorgánica - Enlace Químico', 'TEXTO', 'Los enlaces químicos unen átomos para formar compuestos. Tipos: iónico, covalente (polar y apolar), metálico y enlaces intermoleculares.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 47 DAY)),
(15, 'Electromagnetismo', 'TEXTO', 'Los campos eléctricos y magnéticos se relacionan. La ley de Coulomb, campo eléctrico, potencial, corriente eléctrica y campos magnéticos son conceptos fundamentales.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 46 DAY)),
(16, 'Derecho Penal - Principios', 'TEXTO', 'Los principios del Derecho Penal son legalidad, proporcionalidad, culpabilidad, presunción de inocencia y non bis in idem.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 45 DAY)),
(17, 'Macroeconomía - PIB y Ciclo Económico', 'TEXTO', 'El PIB mide la producción de bienes y servicios en un país. El ciclo económico alterna fases de expansión, auge, recesión y recuperación.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 44 DAY)),
(18, 'Fisiología - Sistema Respiratorio', 'TEXTO', 'La respiración permite el intercambio gaseoso entre organismo y ambiente. Hematosis en alveolos, transporte de O2 y CO2, regulación ventilatoria.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 43 DAY)),
(19, 'Bases de Datos - SQL', 'TEXTO', 'SQL permite gestionar bases de datos relacionales. Comandos DDL, DML, DCL. Consultas con SELECT, JOIN, subconsultas, agrupaciones e índices.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 42 DAY)),
(20, 'Probabilidad', 'TEXTO', 'La probabilidad mide la posibilidad de ocurrencia de un suceso. Espacio muestral, sucesos, regla de Laplace, probabilidad condicionada y teorema de Bayes.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 41 DAY)),
(21, 'Genética Mendeliana', 'TEXTO', 'Las leyes de Mendel: principio de uniformidad, segregación y transmisión independiente. Alelos dominantes/recesivos, genotipo/fenotipo, cruces monohíbridos y dihíbridos.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 40 DAY)),
(22, 'Cálculo Diferencial', 'TEXTO', 'El límite, continuidad y derivadas. Reglas de derivación, regla de la cadena, aplicaciones: máximos, mínimos, monotonía y optimización.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 39 DAY)),
(23, 'Siglo XX - Guerras Mundiales', 'TEXTO', 'Primera Guerra Mundial (1914-1918) por rivalidades imperialistas. Segunda (1939-1945) con ascenso del fascismo, Holocausto y formación de la ONU.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 38 DAY)),
(24, 'Termodinámica', 'TEXTO', 'Leyes de la termodinámica: conservación energía, entropía, equilibrio térmico. Procesos isotérmicos, adiabáticos, isobáricos e isocóricos.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 37 DAY)),
(25, 'Óptica', 'TEXTO', 'La luz se comporta como onda y corpúsculo. Reflexión, refracción, lentes convergentes/divergentes, formación de imágenes y espejos.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 36 DAY)),
(26, 'Derecho Administrativo', 'TEXTO', 'El Derecho Administrativo regula actividad de la Administración Pública. Principios de legalidad, competencia, proporcionalidad e interés general.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 35 DAY)),
(27, 'Finanzas - Valor del Dinero', 'TEXTO', 'Valor temporal del dinero: interés simple y compuesto, valor actual y futuro, anualidades, VAN y TIR para evaluación de inversiones.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 34 DAY)),
(28, 'Inmunología Básica', 'TEXTO', 'Sistema inmunitario innato y adaptativo. Linfocitos B y T, anticuerpos, respuesta humoral y celular, memoria inmunológica y vacunas.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 33 DAY)),
(29, 'Estructuras de Datos', 'TEXTO', 'Arrays, listas enlazadas, pilas, colas, árboles, grafos. Algoritmos de búsqueda y ordenación. Complejidad temporal y espacial.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 32 DAY)),
(30, 'Inferencia Estadística', 'TEXTO', 'Estimación puntual y por intervalos, contrastes de hipótesis, errores tipo I/II, p-valor. Distribuciones t, chi-cuadrado y normal.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 31 DAY)),
(31, 'Ecología General', 'TEXTO', 'Ecosistemas, cadenas tróficas, ciclos biogeoquímicos, sucesión ecológica, biodiversidad y cambios climáticos.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 30 DAY)),
(32, 'Cálculo Integral', 'TEXTO', 'Integral indefinida y definida. Métodos de integración, integral por partes, cambio de variable. Aplicaciones: áreas, volúmenes y longitud de arco.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 29 DAY)),
(33, 'Ilustración y Revoluciones Liberales', 'TEXTO', 'Ilustración: razón, libertad, separación poderes. Revoluciones liberales del s.XIX, liberalismo, nacionalismo y movimiento obrero.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 28 DAY)),
(34, 'Química Física - Cinética', 'TEXTO', 'Velocidad de reacción, orden de reacción, factores que influyen, catalizadores, mecanismo de reacción y energía de activación.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 27 DAY)),
(35, 'Ondas y Acústica', 'TEXTO', 'Ondas mecánicas y electromagnéticas. Longitud de onda, frecuencia, interferencia, difracción, efecto Doppler y sonido.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 26 DAY)),
(36, 'Derecho Mercantil', 'TEXTO', 'Sociedades mercantiles, contratos comerciales, títulos valores, concurso de acreedores y regulación del comercio.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 25 DAY)),
(37, 'Marketing - Comportamiento del Consumidor', 'TEXTO', 'Proceso de decisión de compra, factores culturales/sociales/personales/psicológicos, segmentación, posicionamiento y marketing mix.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 24 DAY)),
(38, 'Histología - Tejidos', 'TEXTO', 'Tejidos animales: epitelial, conectivo, muscular y nervioso. Características, tipos, funciones y localización.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 23 DAY)),
(39, 'Redes de Computadores', 'TEXTO', 'Modelo OSI y TCP/IP, direccionamiento IP, subredes, protocolos HTTP/HTTPS, DNS, DHCP, seguridad básica y topologías.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 22 DAY)),
(40, 'Álgebra Abstracta', 'TEXTO', 'Grupos, anillos, cuerpos. Homomorfismos, subgrupos, ideales. Aplicaciones en criptografía y teoría de códigos.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 21 DAY)),
(41, 'Botánica General', 'TEXTO', 'Morfología vegetal, reproducción, fisiología vegetal, taxonomía, evolución de plantas y ecología vegetal.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 20 DAY)),
(42, 'Ecuaciones Diferenciales', 'TEXTO', 'EDO de primer orden, homogéneas, lineales, exactas. EDO lineales de segundo orden. Aplicaciones a física e ingeniería.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 19 DAY)),
(43, 'Guerra Fría', 'TEXTO', 'Bipolaridad USA-URSS, contención, carrera armamentística, crisis de Berlín, Cuba, Vietnam, descolonización y caída del Muro.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 18 DAY)),
(44, 'Electroquímica', 'TEXTO', 'Celdas galvánicas y electrolíticas, potenciales estándar, ley de Nernst, corrosión, pilas y acumuladores.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 17 DAY)),
(45, 'Mecánica de Fluidos', 'TEXTO', 'Hidrostática, hidrodinámica, ecuación de Bernoulli, viscosidad, régimen laminar/turbulento, caudal y pérdidas de carga.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 16 DAY)),
(46, 'Derecho Internacional Público', 'TEXTO', 'Fuentes del Derecho Internacional, sujetos, tratados, responsabilidad internacional, solución pacífica de controversias.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 15 DAY)),
(47, 'Contabilidad Financiera', 'TEXTO', 'Balance, cuenta de resultados, libro diario/mayor, normas contables, análisis financiero e interpretación de estados.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 14 DAY)),
(48, 'Neuroanatomía', 'TEXTO', 'Sistema nervioso central y periférico, neuronas, sinapsis, tronco encefálico, cerebelo, cerebro, médula espinal.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 13 DAY)),
(49, 'Sistemas Operativos', 'TEXTO', 'Procesos, hilos, planificación, memoria, sistemas de archivos, concurrencia, semáforos y gestión de recursos.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 12 DAY)),
(50, 'Topología Básica', 'TEXTO', 'Espacios topológicos, abiertos/cerrados, continuidad, compacidad, conexidad, homeomorfismos.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 11 DAY)),
(1, 'Fisiología Vegetal - Fotosíntesis', 'TEXTO', 'Fotosíntesis: fase luminosa y fase oscura (ciclo de Calvin). Fotofosforilación, factores limitantes y fotorespiración.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 10 DAY)),
(2, 'Álgebra - Espacios Vectoriales', 'TEXTO', 'Espacios vectoriales, subespacios, base y dimensión, transformaciones lineales, autovalores y autovectores.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 9 DAY)),
(3, 'Edad Contemporánea - Globalización', 'TEXTO', 'Globalización económica, política y cultural. Organismos internacionales, globalización vs localización, impactos.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 8 DAY)),
(4, 'Química Orgánica - Funciones', 'TEXTO', 'Alcoholes, aldehídos, cetonas, ácidos carboxílicos, ésteres, aminas. Nomenclatura, propiedades y reactividad.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 7 DAY)),
(5, 'Física - Trabajo y Energía', 'TEXTO', 'Trabajo, energía cinética y potencial, principio de conservación, potencia, energía mecánica y no conservativa.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 6 DAY)),
(6, 'Derecho Civil - Obligaciones', 'TEXTO', 'Obligaciones: concepto, fuentes, elementos. Clases, cumplimiento, incumplimiento, extinción y responsabilidad.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 5 DAY)),
(7, 'Economía Internacional', 'TEXTO', 'Comercio internacional, ventaja comparativa/absoluta, aranceles, tipos de cambio, balanza de pagos, integración económica.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 4 DAY)),
(8, 'Endocrinología', 'TEXTO', 'Sistema endocrino, hormonas, glándulas, regulación hormonal, eje hipotálamo-hipófisis, patologías endocrinas.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 3 DAY)),
(9, 'Programación Web - Spring Boot', 'TEXTO', 'Spring Boot, arquitectura REST, inyección de dependencias, JPA/Hibernate, validación, seguridad JWT.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 2 DAY)),
(10, 'Regresión y Correlación', 'TEXTO', 'Correlación lineal, regresión lineal simple y múltiple, coeficientes, ajuste, predicción e inferencia.', NULL, NULL, NULL, NULL, NULL, 'PROCESADO', DATE_SUB(NOW(), INTERVAL 1 DAY));

-- ========================================
-- RESÚMENES (60)
-- ========================================
INSERT INTO resumen (apunte_id, usuario_id, titulo, contenido, configuracion, modelo_usado, es_publico, creado_en) VALUES
(1, 1, 'Resumen: Célula procariota vs eucariota', 'Diferencias clave entre procariotas y eucariotas: tamaño, orgánulos, ADN, división celular. Estructuras fundamentales y funciones.', '{"longitud":"media","incluir_definiciones":true,"formato":"esquema"}', 'llama-3.1', 1, NOW()),
(2, 2, 'Resumen: Operaciones con matrices', 'Suma, resta, producto por escalar, producto matricial. Propiedades conmutativas/asociativas. Aplicaciones en sistemas lineales.', '{"longitud":"corta","incluir_ejemplos":true,"formato":"lista"}', 'llama-3.1', 0, NOW()),
(3, 3, 'Resumen: Causas y fases de la Revolución Francesa', 'Crisis pre-revolucionaria, Estados Generales, Asamblea Nacional, Convención, Directorio. Declaración DDHH y Ciudadano.', '{"longitud":"media","incluir_fechas":true,"formato":"cronologico"}', 'mistral', 1, NOW()),
(4, 4, 'Resumen: Clasificación de hidrocarburos', 'Alcanos saturados, alquenos insaturados, alquinos, aromáticos. Fórmulas generales, nomenclatura IUPAC básica.', '{"longitud":"corta","incluir_formulas":true,"formato":"tabla"}', 'llama-3.1', 0, NOW()),
(5, 5, 'Resumen: Leyes de Newton', 'Inercia, principio fundamental (F=ma), acción-reacción. Sistemas de referencia inerciales. Aplicaciones prácticas.', '{"longitud":"media","incluir_ejemplos":true,"formato":"esquema"}', 'gemma2', 1, NOW()),
(6, 6, 'Resumen: Principios constitucionales', 'Soberanía nacional, Estado de Derecho, separación poderes, monarquía parlamentaria, derechos fundamentales.', '{"longitud":"media","incluir_articulos":true,"formato":"esquema"}', 'llama-3.1', 1, NOW()),
(7, 7, 'Resumen: Equilibrio oferta-demanda', 'Curvas, desplazamientos, precio equilibrio, exceso oferta/demanda, elasticidad conceptual.', '{"longitud":"corta","incluir_graficas":false,"formato":"lista"}', 'mistral', 0, NOW()),
(8, 8, 'Resumen: Circulación sanguínea', 'Circulación mayor y menor, corazón (cámaras/válvulas), ciclo cardíaco, gasto cardíaco, regulación.', '{"longitud":"media","incluir_esquema":true,"formato":"esquema"}', 'llama-3.1', 1, NOW()),
(9, 9, 'Resumen: Pilares POO', 'Encapsulamiento, herencia, polimorfismo, abstracción. Clases/objetos, modificadores acceso, interfaces.', '{"longitud":"media","incluir_codigo":true,"formato":"lista"}', 'codellama', 0, NOW()),
(10, 10, 'Resumen: Medidas estadísticas', 'Tendencia central y dispersión. Media, mediana, moda, varianza, desviación típica, coeficiente variación.', '{"longitud":"corta","incluir_formulas":true,"formato":"tabla"}', 'llama-3.1', 0, NOW()),
(11, 11, 'Resumen: Enzimas y catálisis', 'Propiedades, sitios activos, especificidad, factores temperatura/pH, inhibidores, cofactores.', '{"longitud":"media","incluir_ejemplos":true,"formato":"esquema"}', 'mistral', 1, NOW()),
(12, 12, 'Resumen: Cónicas', 'Circunferencia, elipse, parábola, hipérbola. Ecuaciones generales/canonicas, elementos, aplicaciones.', '{"longitud":"media","incluir_formulas":true,"formato":"tabla"}', 'llama-3.1', 0, NOW()),
(13, 13, 'Resumen: Feudalismo medieval', 'Vasallaje, feudo, tres órdenes, Iglesia, cruzadas, expansión urbana, universidades.', '{"longitud":"media","incluir_cronologia":true,"formato":"esquema"}', 'gemma2', 1, NOW()),
(14, 14, 'Resumen: Tipos de enlace', 'Iónico, covalente, metálico. Polaridad, geometría molecular básica, fuerzas intermoleculares.', '{"longitud":"corta","incluir_tabla":true,"formato":"tabla"}', 'llama-3.1', 0, NOW()),
(15, 15, 'Resumen: Ley de Coulomb y campo eléctrico', 'Carga eléctrica, ley Coulomb, campo eléctrico, líneas de campo, potencial eléctrico.', '{"longitud":"media","incluir_formulas":true,"formato":"esquema"}', 'mistral', 0, NOW()),
(16, 16, 'Resumen: Principios penalistas', 'Legalidad, irretroactividad, culpabilidad, proporcionalidad, presunción inocencia.', '{"longitud":"corta","incluir_definiciones":true,"formato":"lista"}', 'llama-3.1', 1, NOW()),
(17, 17, 'Resumen: Macroeconomía básica', 'PIB nominal/real, ciclo económico, inflación/desempleo, política fiscal/monetaria conceptual.', '{"longitud":"media","incluir_conceptos":true,"formato":"esquema"}', 'gemma2', 0, NOW()),
(18, 18, 'Resumen: Intercambio gaseoso', 'Vías respiratorias, alveolos, hematosis, transporte O2/CO2, regulación respiratoria.', '{"longitud":"media","incluir_esquema":true,"formato":"esquema"}', 'llama-3.1', 1, NOW()),
(19, 19, 'Resumen: Fundamentos SQL', 'SELECT, WHERE, JOIN, GROUP BY, HAVING, subconsultas, claves, normalización básica.', '{"longitud":"media","incluir_ejemplos":true,"formato":"lista"}', 'codellama', 0, NOW()),
(20, 20, 'Resumen: Cálculo de probabilidades', 'Laplace, probabilidad condicionada, independencia, teorema Bayes, combinatoria básica.', '{"longitud":"media","incluir_formulas":true,"formato":"esquema"}', 'llama-3.1', 0, NOW()),
(21, 21, 'Resumen: Genética mendeliana', 'Leyes Mendel, mono/dihíbrido, dominancia, codominancia, alelos múltiples.', '{"longitud":"media","incluir_cruces":true,"formato":"esquema"}', 'mistral', 1, NOW()),
(22, 22, 'Resumen: Derivadas y aplicaciones', 'Reglas derivación, regla cadena, máximos/mínimos, optimización, gráfica funciones.', '{"longitud":"media","incluir_ejercicios":true,"formato":"lista"}', 'llama-3.1', 0, NOW()),
(23, 23, 'Resumen: Guerras Mundiales', 'Causas, desarrollo, tratados, consecuencias. II Guerra Mundial, totalitarismos, ONU.', '{"longitud":"media","incluir_cronologia":true,"formato":"cronologico"}', 'gemma2', 1, NOW()),
(24, 24, 'Resumen: Primeras leyes termodinámica', 'Conservación, entropía, principios, máquinas térmicas, rendimiento.', '{"longitud":"media","incluir_formulas":true,"formato":"esquema"}', 'llama-3.1', 0, NOW()),
(25, 25, 'Resumen: Óptica geométrica', 'Reflexión/refracción, leyes Snell, lentes, espejos, formación imágenes, aumento.', '{"longitud":"media","incluir_formulas":true,"formato":"esquema"}', 'mistral', 0, NOW()),
(26, 26, 'Resumen: Principios administrativos', 'Legalidad, competencia, proporcionalidad, imparcialidad, motivación, interdicción arbitrariedad.', '{"longitud":"corta","incluir_definiciones":true,"formato":"lista"}', 'llama-3.1', 1, NOW()),
(27, 27, 'Resumen: Interés simple/compuesto', 'Capital, interés, tiempo, monto. Valor actual/futuro, capitalización, actualización.', '{"longitud":"corta","incluir_formulas":true,"formato":"tabla"}', 'llama-3.1', 0, NOW()),
(28, 28, 'Resumen: Inmunidad innata y adaptativa', 'Barreras, fagocitos, respuesta inflamatoria, linfocitos, anticuerpos, memoria.', '{"longitud":"media","incluir_esquema":true,"formato":"esquema"}', 'mistral', 1, NOW()),
(29, 29, 'Resumen: Estructuras lineales', 'Arrays, listas, pilas, colas. Operaciones, ventajas/desventajas, complejidad.', '{"longitud":"media","incluir_ejemplos":true,"formato":"lista"}', 'codellama', 0, NOW()),
(30, 30, 'Resumen: Intervalos de confianza', 'Estimación, nivel confianza, error, tamaño muestra, contraste hipótesis.', '{"longitud":"media","incluir_formulas":true,"formato":"esquema"}', 'llama-3.1', 0, NOW()),
(31, 31, 'Resumen: Flujo de energía y materia', 'Cadenas tróficas, redes tróficas, pirámides ecológicas, ciclos biogeoquímicos.', '{"longitud":"media","incluir_esquema":true,"formato":"esquema"}', 'gemma2', 1, NOW()),
(32, 32, 'Resumen: Integral definida', 'Teorema fundamental, área entre curvas, integración numérica básica, aplicaciones.', '{"longitud":"media","incluir_ejercicios":true,"formato":"lista"}', 'llama-3.1', 0, NOW()),
(33, 33, 'Resumen: Ilustración y liberalismo', 'Rousseau, Montesquieu, Voltaire. Revoluciones, sufragio, constitucionalismo.', '{"longitud":"media","incluir_cronologia":true,"formato":"esquema"}', 'mistral', 1, NOW()),
(34, 34, 'Resumen: Cinética química', 'Velocidad, orden, factores, catalizadores, Arrhenius, mecanismos.', '{"longitud":"media","incluir_formulas":true,"formato":"esquema"}', 'llama-3.1', 0, NOW()),
(35, 35, 'Resumen: Ondas', 'Clasificación, magnitudes, reflexión/refracción, interferencia, difracción, Doppler.', '{"longitud":"media","incluir_formulas":true,"formato":"esquema"}', 'mistral', 0, NOW()),
(36, 36, 'Resumen: Sociedades mercantiles', 'Tipos, constitución, órganos, responsabilidad, disolución.', '{"longitud":"media","incluir_clasificacion":true,"formato":"tabla"}', 'llama-3.1', 1, NOW()),
(37, 37, 'Resumen: Comportamiento consumidor', 'Necesidades, proceso compra, factores, segmentación, posicionamiento.', '{"longitud":"corta","incluir_esquema":true,"formato":"esquema"}', 'gemma2', 0, NOW()),
(38, 38, 'Resumen: Tejidos básicos', 'Epitelial, conectivo, muscular, nervioso. Funciones, subtipos, características.', '{"longitud":"media","incluir_tabla":true,"formato":"tabla"}', 'llama-3.1', 1, NOW()),
(39, 39, 'Resumen: Modelo OSI', 'Capas, funciones, protocolos, encapsulación, comparación TCP/IP.', '{"longitud":"media","incluir_tabla":true,"formato":"tabla"}', 'codellama', 0, NOW()),
(40, 40, 'Resumen: Grupos y subgrupos', 'Definición, propiedades, subgrupos, homomorfismos, grupos cíclicos.', '{"longitud":"media","incluir_ejemplos":true,"formato":"lista"}', 'llama-3.1', 0, NOW()),
(41, 41, 'Resumen: Reino Plantae', 'Clasificación, tejidos vegetales, reproducción, alternancia generaciones.', '{"longitud":"media","incluir_esquema":true,"formato":"esquema"}', 'mistral', 1, NOW()),
(42, 42, 'Resumen: EDO primer orden', 'Variables separables, lineales, exactas, homogéneas. Aplicaciones.', '{"longitud":"media","incluir_ejercicios":true,"formato":"lista"}', 'llama-3.1', 0, NOW()),
(43, 43, 'Resumen: Guerra Fría', 'Bipolaridad, OTAN/Pacto Varsovia, crisis, descolonización, distensión.', '{"longitud":"media","incluir_cronologia":true,"formato":"cronologico"}', 'gemma2', 1, NOW()),
(44, 44, 'Resumen: Pilas electroquímicas', 'Celdas galvánicas, potenciales, espontaneidad, corrosión, electrolisis.', '{"longitud":"media","incluir_formulas":true,"formato":"esquema"}', 'llama-3.1', 0, NOW()),
(45, 45, 'Resumen: Hidrodinámica', 'Ecuación continuidad, Bernoulli, Torricelli, número Reynolds, pérdidas.', '{"longitud":"media","incluir_formulas":true,"formato":"esquema"}', 'mistral', 0, NOW()),
(46, 46, 'Resumen: Derecho Internacional', 'Fuentes, sujetos, tratados, responsabilidad, jurisdicción.', '{"longitud":"media","incluir_clasificacion":true,"formato":"esquema"}', 'llama-3.1', 1, NOW()),
(47, 47, 'Resumen: Estados financieros', 'Balance, cuenta resultados, flujo caja, análisis ratios básicos.', '{"longitud":"media","incluir_tabla":true,"formato":"tabla"}', 'llama-3.1', 0, NOW()),
(48, 48, 'Resumen: SNC y SNP', 'Encéfalo, médula, nervios, receptores, vías, funciones motoras/sensoriales.', '{"longitud":"media","incluir_esquema":true,"formato":"esquema"}', 'mistral', 1, NOW()),
(49, 49, 'Resumen: Gestión de procesos', 'Estados proceso, PCB, planificación, sincronización, deadlocks.', '{"longitud":"media","incluir_esquema":true,"formato":"esquema"}', 'codellama', 0, NOW()),
(50, 50, 'Resumen: Espacios topológicos', 'Topología, bases, continuidad, compacidad, conexidad.', '{"longitud":"media","incluir_definiciones":true,"formato":"lista"}', 'llama-3.1', 0, NOW()),
(51, 51, 'Resumen: Fotosíntesis', 'Fase luminosa, fotosistemas, fase oscura, Rubisco, fotorespiración.', '{"longitud":"media","incluir_esquema":true,"formato":"esquema"}', 'mistral', 1, NOW()),
(52, 52, 'Resumen: Espacios vectoriales', 'Base, dimensión, subespacios, transformaciones lineales, matriz asociada.', '{"longitud":"media","incluir_ejercicios":true,"formato":"lista"}', 'llama-3.1', 0, NOW()),
(53, 53, 'Resumen: Globalización', 'Factores, instituciones, flujos, efectos positivos/negativos, antiglobalización.', '{"longitud":"corta","incluir_esquema":true,"formato":"esquema"}', 'gemma2', 1, NOW()),
(54, 54, 'Resumen: Grupos funcionales', 'Alcoholes, carbonilos, carboxílicos, aminas, nomenclatura, reactividad.', '{"longitud":"media","incluir_tabla":true,"formato":"tabla"}', 'llama-3.1', 0, NOW()),
(55, 55, 'Resumen: Trabajo y energía', 'Teorema trabajo-energía, conservación, fuerzas conservativas/no conservativas.', '{"longitud":"media","incluir_formulas":true,"formato":"esquema"}', 'mistral', 0, NOW()),
(56, 56, 'Resumen: Obligaciones civiles', 'Concepto, fuentes, clases, cumplimiento, responsabilidad contractual/extracontractual.', '{"longitud":"media","incluir_clasificacion":true,"formato":"esquema"}', 'llama-3.1', 1, NOW()),
(57, 57, 'Resumen: Comercio internacional', 'Ventaja comparativa, aranceles, dumping, OMC, integración regional.', '{"longitud":"media","incluir_conceptos":true,"formato":"esquema"}', 'gemma2', 0, NOW()),
(58, 58, 'Resumen: Sistema endocrino', 'Hormonas, glándulas, regulación, feedback, principales hormonas.', '{"longitud":"media","incluir_tabla":true,"formato":"tabla"}', 'llama-3.1', 1, NOW()),
(59, 59, 'Resumen: Spring Boot REST', 'Controladores, servicios, repositorios, DTOs, validación, seguridad.', '{"longitud":"media","incluir_ejemplos":true,"formato":"lista"}', 'codellama', 0, NOW()),
(60, 60, 'Resumen: Regresión lineal', 'Correlación, recta regresión, R^2, significatividad, predicción.', '{"longitud":"media","incluir_formulas":true,"formato":"esquema"}', 'llama-3.1', 0, NOW());

-- ========================================
-- TESTS (60)
-- ========================================
INSERT INTO test (apunte_id, usuario_id, resumen_id, titulo, configuracion, numero_preguntas, creado_en) VALUES
(1, 1, 1, 'Test: Célula y orgánulos', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(2, 2, 2, 'Test: Matrices y operaciones', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(3, 3, 3, 'Test: Revolución Francesa', '{"dificultad":"facil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(4, 4, 4, 'Test: Hidrocarburos', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(5, 5, 5, 'Test: Leyes de Newton', '{"dificultad":"facil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(6, 6, 6, 'Test: Constitución Española', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(7, 7, 7, 'Test: Oferta y demanda', '{"dificultad":"facil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(8, 8, 8, 'Test: Sistema cardiovascular', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(9, 9, 9, 'Test: POO en Java', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(10, 10, 10, 'Test: Estadística descriptiva', '{"dificultad":"facil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(11, 11, 11, 'Test: Enzimas', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(12, 12, 12, 'Test: Geometría analítica', '{"dificultad":"dificil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(13, 13, 13, 'Test: Feudalismo', '{"dificultad":"facil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(14, 14, 14, 'Test: Enlace químico', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(15, 15, 15, 'Test: Electrostática', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(16, 16, 16, 'Test: Principios penales', '{"dificultad":"facil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(17, 17, 17, 'Test: Macroeconomía', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(18, 18, 18, 'Test: Sistema respiratorio', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(19, 19, 19, 'Test: SQL básico', '{"dificultad":"facil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(20, 20, 20, 'Test: Probabilidad', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(21, 21, 21, 'Test: Genética mendeliana', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(22, 22, 22, 'Test: Cálculo diferencial', '{"dificultad":"dificil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(23, 23, 23, 'Test: Guerras Mundiales', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(24, 24, 24, 'Test: Termodinámica', '{"dificultad":"dificil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(25, 25, 25, 'Test: Óptica', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(26, 26, 26, 'Test: Derecho Administrativo', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(27, 27, 27, 'Test: Matemática financiera', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(28, 28, 28, 'Test: Inmunología', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(29, 29, 29, 'Test: Estructuras de datos', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(30, 30, 30, 'Test: Inferencia estadística', '{"dificultad":"dificil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(31, 31, 31, 'Test: Ecología', '{"dificultad":"facil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(32, 32, 32, 'Test: Cálculo integral', '{"dificultad":"dificil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(33, 33, 33, 'Test: Ilustración', '{"dificultad":"facil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(34, 34, 34, 'Test: Cinética química', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(35, 35, 35, 'Test: Ondas', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(36, 36, 36, 'Test: Derecho Mercantil', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(37, 37, 37, 'Test: Marketing', '{"dificultad":"facil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(38, 38, 38, 'Test: Histología', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(39, 39, 39, 'Test: Redes', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(40, 40, 40, 'Test: Álgebra abstracta', '{"dificultad":"dificil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(41, 41, 41, 'Test: Botánica', '{"dificultad":"facil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(42, 42, 42, 'Test: EDOs', '{"dificultad":"dificil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(43, 43, 43, 'Test: Guerra Fría', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(44, 44, 44, 'Test: Electroquímica', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(45, 45, 45, 'Test: Mecánica de fluidos', '{"dificultad":"dificil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(46, 46, 46, 'Test: Derecho Internacional', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(47, 47, 47, 'Test: Contabilidad', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(48, 48, 48, 'Test: Neuroanatomía', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(49, 49, 49, 'Test: Sistemas Operativos', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(50, 50, 50, 'Test: Topología', '{"dificultad":"dificil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(51, 51, 51, 'Test: Fotosíntesis', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(52, 52, 52, 'Test: Espacios vectoriales', '{"dificultad":"dificil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(53, 53, 53, 'Test: Globalización', '{"dificultad":"facil","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(54, 54, 54, 'Test: Funciones orgánicas', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(55, 55, 55, 'Test: Trabajo y energía', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(56, 56, 56, 'Test: Obligaciones', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(57, 57, 57, 'Test: Economía internacional', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(58, 58, 58, 'Test: Endocrinología', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(59, 59, 59, 'Test: Spring Boot', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW()),
(60, 60, 60, 'Test: Regresión', '{"dificultad":"medio","aleatorio":true,"mostrar_explicacion":true}', 5, NOW());

-- ========================================
-- PREGUNTAS (300 = 5 por test)
-- ========================================
INSERT INTO pregunta (test_id, enunciado, explicacion, orden) VALUES
(1, '¿Cuál es la principal diferencia entre célula procariota y eucariota?', 'Las células eucariotas presentan núcleo definido rodeado por membrana, mientras que las procariotas carecen de núcleo verdadero.', 1),
(1, '¿Qué orgánulo se encarga de la respiración celular?', 'Las mitocondrias producen ATP mediante la fosforilación oxidativa.', 2),
(1, '¿Qué estructura regula el paso de sustancias entre célula y medio?', 'La membrana plasmática es semipermeable y regula el intercambio.', 3),
(1, '¿Dónde se sintetizan las proteínas?', 'Los ribosomas son los encargados de la síntesis proteica.', 4),
(1, '¿Qué orgánulo contiene el material genético?', 'El núcleo contiene el ADN y controla las funciones celulares.', 5),
(2, '¿Cómo se define una matriz?', 'Conjunto ordenado de números dispuestos en filas y columnas.', 1),
(2, '¿Para multiplicar dos matrices A*B es necesario que...', 'El número de columnas de A coincida con el número de filas de B.', 2),
(2, '¿Qué matriz tiene 1 en diagonal y 0 resto?', 'La matriz identidad I.', 3),
(2, '¿Una matriz cuadrada es invertible si su determinante es...', 'Distinto de cero.', 4),
(2, '¿La suma de matrices requiere que tengan...', 'Las mismas dimensiones.', 5),
(3, '¿Año de inicio de la Revolución Francesa?', 'Comenzó el 14 de julio de 1789 con la toma de la Bastilla.', 1),
(3, '¿Qué documento proclamó los derechos en 1789?', 'La Declaración de los Derechos del Hombre y del Ciudadano.', 2),
(3, '¿Qué estamento no pagaba impuestos antes de 1789?', 'El clero y la nobleza gozaban de privilegios fiscales.', 3),
(3, '¿Quiénes fueron los jacobinos?', 'Grupo político radical liderado en parte por Robespierre durante el Terror.', 4),
(3, '¿Qué régimen siguió al Directorio?', 'El Consulado liderado por Napoleón Bonaparte.', 5),
(4, '¿Fórmula general de los alcanos?', 'CnH2n+2 para hidrocarburos saturados de cadena abierta.', 1),
(4, '¿Los alquenos tienen...', 'Al menos un doble enlace carbono-carbono.', 2),
(4, '¿Benceno pertenece al grupo de...', 'Hidrocarburos aromáticos.', 3),
(4, '¿Alquinos presentan...', 'Triple enlace entre carbonos.', 4),
(4, '¿Metano es un...', 'Alcano de fórmula CH4.', 5),
(5, '¿Primera ley de Newton?', 'Ley de inercia: todo cuerpo permanece en reposo o MRU si no actúa fuerza neta.', 1),
(5, '¿Fórmula segunda ley?', 'F = m · a', 2),
(5, '¿Tercera ley?', 'Acción y reacción: fuerzas iguales y opuestas.', 3),
(5, '¿Unidad de fuerza SI?', 'Newton (N) = kg·m/s²', 4),
(5, '¿Inercia depende de?', 'De la masa del cuerpo.', 5);

-- Generar preguntas restantes para completar 300 (tests 6-60 con 5 preguntas cada uno)
INSERT INTO pregunta (test_id, enunciado, explicacion, orden)
SELECT t.id, CONCAT('Pregunta ', p.ord, ' sobre ', t.titulo), CONCAT('Explicación detallada para la pregunta ', p.ord, ' del test ', t.titulo, '.'), p.ord
FROM test t
CROSS JOIN (SELECT 1 as ord UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) p
WHERE t.id > 5;

-- ========================================
-- OPCIONES (1200 = 4 por pregunta)
-- ========================================
-- Opciones para preguntas 1-25 (tests 1-5)
INSERT INTO opcion (pregunta_id, texto, es_correcta, orden) VALUES
(1, 'Presencia de núcleo definido', 1, 1),
(1, 'Tamaño mayor', 0, 2),
(1, 'Presencia de pared celular', 0, 3),
(1, 'Forma esférica', 0, 4),
(2, 'Ribosomas', 0, 1),
(2, 'Mitocondrias', 1, 2),
(2, 'Lisosomas', 0, 3),
(2, 'Aparato de Golgi', 0, 4),
(3, 'Pared celular', 0, 1),
(3, 'Membrana plasmática', 1, 2),
(3, 'Núcleo', 0, 3),
(3, 'Citoplasma', 0, 4),
(4, 'Mitocondrias', 0, 1),
(4, 'Ribosomas', 1, 2),
(4, 'Cloroplastos', 0, 3),
(4, 'Vacuola', 0, 4),
(5, 'Ribosomas', 0, 1),
(5, 'Núcleo', 1, 2),
(5, 'Centriolos', 0, 3),
(5, 'Peroxisomas', 0, 4),
(6, 'Conjunto desordenado', 0, 1),
(6, 'Conjunto ordenado en filas y columnas', 1, 2),
(6, 'Solo números enteros', 0, 3),
(6, 'Únicamente diagonales', 0, 4),
(7, 'Mismas filas', 0, 1),
(7, 'Columnas de A = filas de B', 1, 2),
(7, 'Igual número de elementos', 0, 3),
(7, 'Ambas cuadradas', 0, 4),
(8, 'Matriz nula', 0, 1),
(8, 'Matriz identidad', 1, 2),
(8, 'Matriz traspuesta', 0, 3),
(8, 'Matriz simétrica', 0, 4),
(9, 'Mayor que 1', 0, 1),
(9, 'Distinto de cero', 1, 2),
(9, 'Igual a 1', 0, 3),
(9, 'Negativo', 0, 4),
(10, 'Diferentes tamaños', 0, 1),
(10, 'Mismas dimensiones', 1, 2),
(10, 'Mismo tipo numérico', 0, 3),
(10, 'Igual traza', 0, 4),
(11, '4 de julio de 1789', 0, 1),
(11, '14 de julio de 1789', 1, 2),
(11, '21 de junio de 1789', 0, 3),
(11, '26 de agosto de 1789', 0, 4),
(12, 'Código Civil Napoleónico', 0, 1),
(12, 'Declaración de los Derechos del Hombre y del Ciudadano', 1, 2),
(12, 'Constitución del Año III', 0, 3),
(12, 'Carta de 1814', 0, 4),
(13, 'Campesinos', 0, 1),
(13, 'Clero y nobleza', 1, 2),
(13, 'Burgueses', 0, 3),
(13, 'Artesanos', 0, 4),
(14, 'Girondinos', 0, 1),
(14, 'Jacobinos', 1, 2),
(14, 'Feuillants', 0, 3),
(14, 'Cordeliers moderados', 0, 4),
(15, 'Directorio', 0, 1),
(15, 'Consulado', 1, 2),
(15, 'Convención', 0, 3),
(15, 'Asamblea Legislativa', 0, 4),
(16, 'CnH2n', 0, 1),
(16, 'CnH2n+2', 1, 2),
(16, 'CnH2n-2', 0, 3),
(16, 'CnHn', 0, 4),
(17, 'Solo simples enlaces', 0, 1),
(17, 'Al menos un doble enlace carbono-carbono', 1, 2),
(17, 'Solo anillos', 0, 3),
(17, 'Solo triple enlace', 0, 4),
(18, 'Alcanos', 0, 1),
(18, 'Aromáticos', 1, 2),
(18, 'Alquenos', 0, 3),
(18, 'Alquinos', 0, 4),
(19, 'Doble enlace', 0, 1),
(19, 'Triple enlace', 1, 2),
(19, 'Cuádruple enlace', 0, 3),
(19, 'Enlace iónico', 0, 4),
(20, 'Alqueno', 0, 1),
(20, 'Alcano', 1, 2),
(20, 'Alquino', 0, 3),
(20, 'Aromático', 0, 4),
(21, 'Ley de gravitación', 0, 1),
(21, 'Ley de inercia', 1, 2),
(21, 'Ley de Ohm', 0, 3),
(21, 'Ley de Boyle', 0, 4),
(22, 'E = mc²', 0, 1),
(22, 'F = m·a', 1, 2),
(22, 'V = IR', 0, 3),
(22, 'P = V·I', 0, 4),
(23, 'Conservación energía', 0, 1),
(23, 'Acción y reacción', 1, 2),
(23, 'Conservación cantidad movimiento', 0, 3),
(23, 'Principio Arquímedes', 0, 4),
(24, 'Joule', 0, 1),
(24, 'Newton', 1, 2),
(24, 'Watt', 0, 3),
(24, 'Pascal', 0, 4),
(25, 'Volumen', 0, 1),
(25, 'Masa', 1, 2),
(25, 'Densidad', 0, 3),
(25, 'Temperatura', 0, 4);

-- Opciones para el resto de preguntas
INSERT INTO opcion (pregunta_id, texto, es_correcta, orden)
SELECT p.id, CONCAT('Opción A correcta para ', p.id), 1, 1 FROM pregunta p WHERE p.id > 25
UNION ALL SELECT p.id, CONCAT('Opción B incorrecta para ', p.id), 0, 2 FROM pregunta p WHERE p.id > 25
UNION ALL SELECT p.id, CONCAT('Opción C incorrecta para ', p.id), 0, 3 FROM pregunta p WHERE p.id > 25
UNION ALL SELECT p.id, CONCAT('Opción D incorrecta para ', p.id), 0, 4 FROM pregunta p WHERE p.id > 25;

-- ========================================
-- INTENTOS (60)
-- ========================================
INSERT INTO intento (test_id, usuario_id, aciertos, errores, total, porcentaje, iniciado_en, finalizado_en, creado_en) VALUES
(1, 1, 5, 0, 5, 100.00, DATE_SUB(NOW(), INTERVAL 5 DAY), DATE_SUB(NOW(), INTERVAL 5 DAY), NOW()),
(2, 2, 4, 1, 5, 80.00, DATE_SUB(NOW(), INTERVAL 4 DAY), DATE_SUB(NOW(), INTERVAL 4 DAY), NOW()),
(3, 3, 5, 0, 5, 100.00, DATE_SUB(NOW(), INTERVAL 4 DAY), DATE_SUB(NOW(), INTERVAL 4 DAY), NOW()),
(4, 4, 3, 2, 5, 60.00, DATE_SUB(NOW(), INTERVAL 3 DAY), DATE_SUB(NOW(), INTERVAL 3 DAY), NOW()),
(5, 5, 4, 1, 5, 80.00, DATE_SUB(NOW(), INTERVAL 3 DAY), DATE_SUB(NOW(), INTERVAL 3 DAY), NOW()),
(6, 6, 5, 0, 5, 100.00, DATE_SUB(NOW(), INTERVAL 3 DAY), DATE_SUB(NOW(), INTERVAL 3 DAY), NOW()),
(7, 7, 4, 1, 5, 80.00, DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY), NOW()),
(8, 8, 3, 2, 5, 60.00, DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY), NOW()),
(9, 9, 5, 0, 5, 100.00, DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY), NOW()),
(10, 10, 4, 1, 5, 80.00, DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY), NOW()),
(11, 11, 5, 0, 5, 100.00, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY), NOW()),
(12, 12, 3, 2, 5, 60.00, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY), NOW()),
(13, 13, 4, 1, 5, 80.00, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY), NOW()),
(14, 14, 5, 0, 5, 100.00, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY), NOW()),
(15, 15, 4, 1, 5, 80.00, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY), NOW()),
(16, 16, 5, 0, 5, 100.00, NOW(), NOW(), NOW()),
(17, 17, 4, 1, 5, 80.00, NOW(), NOW(), NOW()),
(18, 18, 3, 2, 5, 60.00, NOW(), NOW(), NOW()),
(19, 19, 5, 0, 5, 100.00, NOW(), NOW(), NOW()),
(20, 20, 4, 1, 5, 80.00, NOW(), NOW(), NOW()),
(21, 21, 5, 0, 5, 100.00, NOW(), NOW(), NOW()),
(22, 22, 3, 2, 5, 60.00, NOW(), NOW(), NOW()),
(23, 23, 4, 1, 5, 80.00, NOW(), NOW(), NOW()),
(24, 24, 3, 2, 5, 60.00, NOW(), NOW(), NOW()),
(25, 25, 4, 1, 5, 80.00, NOW(), NOW(), NOW()),
(26, 26, 5, 0, 5, 100.00, NOW(), NOW(), NOW()),
(27, 27, 4, 1, 5, 80.00, NOW(), NOW(), NOW()),
(28, 28, 5, 0, 5, 100.00, NOW(), NOW(), NOW()),
(29, 29, 4, 1, 5, 80.00, NOW(), NOW(), NOW()),
(30, 30, 3, 2, 5, 60.00, NOW(), NOW(), NOW()),
(31, 31, 5, 0, 5, 100.00, NOW(), NOW(), NOW()),
(32, 32, 3, 2, 5, 60.00, NOW(), NOW(), NOW()),
(33, 33, 5, 0, 5, 100.00, NOW(), NOW(), NOW()),
(34, 34, 4, 1, 5, 80.00, NOW(), NOW(), NOW()),
(35, 35, 4, 1, 5, 80.00, NOW(), NOW(), NOW()),
(36, 36, 5, 0, 5, 100.00, NOW(), NOW(), NOW()),
(37, 37, 5, 0, 5, 100.00, NOW(), NOW(), NOW()),
(38, 38, 4, 1, 5, 80.00, NOW(), NOW(), NOW()),
(39, 39, 4, 1, 5, 80.00, NOW(), NOW(), NOW()),
(40, 40, 3, 2, 5, 60.00, NOW(), NOW(), NOW()),
(41, 41, 5, 0, 5, 100.00, NOW(), NOW(), NOW()),
(42, 42, 3, 2, 5, 60.00, NOW(), NOW(), NOW()),
(43, 43, 4, 1, 5, 80.00, NOW(), NOW(), NOW()),
(44, 44, 4, 1, 5, 80.00, NOW(), NOW(), NOW()),
(45, 45, 3, 2, 5, 60.00, NOW(), NOW(), NOW()),
(46, 46, 5, 0, 5, 100.00, NOW(), NOW(), NOW()),
(47, 47, 4, 1, 5, 80.00, NOW(), NOW(), NOW()),
(48, 48, 5, 0, 5, 100.00, NOW(), NOW(), NOW()),
(49, 49, 4, 1, 5, 80.00, NOW(), NOW(), NOW()),
(50, 50, 3, 2, 5, 60.00, NOW(), NOW(), NOW()),
(51, 1, 5, 0, 5, 100.00, NOW(), NOW(), NOW()),
(52, 2, 4, 1, 5, 80.00, NOW(), NOW(), NOW()),
(53, 3, 5, 0, 5, 100.00, NOW(), NOW(), NOW()),
(54, 4, 4, 1, 5, 80.00, NOW(), NOW(), NOW()),
(55, 5, 5, 0, 5, 100.00, NOW(), NOW(), NOW()),
(56, 6, 4, 1, 5, 80.00, NOW(), NOW(), NOW()),
(57, 7, 5, 0, 5, 100.00, NOW(), NOW(), NOW()),
(58, 8, 4, 1, 5, 80.00, NOW(), NOW(), NOW()),
(59, 9, 5, 0, 5, 100.00, NOW(), NOW(), NOW()),
(60, 10, 4, 1, 5, 80.00, NOW(), NOW(), NOW());

-- ========================================
-- RESPUESTA_INTENTO (300 = 5 por intento)
-- ========================================
-- Para intentos con test_id 1-5 usar preguntas 1-25
INSERT INTO respuesta_intento (intento_id, pregunta_id, opcion_elegida_id, es_acierto, explicacion_snapshot, respondido_en)
SELECT i.id, p.id, o.id, 1, p.explicacion, i.finalizado_en
FROM intento i
JOIN pregunta p ON p.test_id = i.test_id
JOIN opcion o ON o.pregunta_id = p.id AND o.es_correcta = 1
WHERE i.test_id BETWEEN 1 AND 5 AND p.orden = ((i.id - 1) % 5) + 1;

-- Completar resto de respuestas
INSERT INTO respuesta_intento (intento_id, pregunta_id, opcion_elegida_id, es_acierto, explicacion_snapshot, respondido_en)
SELECT i.id, p.id, 
  (SELECT o2.id FROM opcion o2 WHERE o2.pregunta_id = p.id ORDER BY RAND() LIMIT 1),
  CASE WHEN (SELECT o2.es_correcta FROM opcion o2 WHERE o2.pregunta_id = p.id ORDER BY RAND() LIMIT 1) = 1 THEN 1 ELSE 0 END,
  p.explicacion, i.finalizado_en
FROM intento i
JOIN pregunta p ON p.test_id = i.test_id
WHERE i.test_id > 5
AND NOT EXISTS (SELECT 1 FROM respuesta_intento ri WHERE ri.intento_id = i.id AND ri.pregunta_id = p.id);

-- Corregir respuestas para garantizar coherencia con aciertos
UPDATE respuesta_intento ri
JOIN intento i ON i.id = ri.intento_id
JOIN pregunta p ON p.id = ri.pregunta_id AND p.test_id = i.test_id
SET ri.es_acierto = 1, ri.opcion_elegida_id = (SELECT o.id FROM opcion o WHERE o.pregunta_id = p.id AND o.es_correcta = 1 LIMIT 1)
WHERE i.aciertos >= 4 AND ((i.id + p.orden) % 3 = 0);

-- Verificación
SELECT 'usuario' as tabla, COUNT(*) as total FROM usuario
UNION ALL SELECT 'apunte', COUNT(*) FROM apunte
UNION ALL SELECT 'resumen', COUNT(*) FROM resumen
UNION ALL SELECT 'test', COUNT(*) FROM test
UNION ALL SELECT 'pregunta', COUNT(*) FROM pregunta
UNION ALL SELECT 'opcion', COUNT(*) FROM opcion
UNION ALL SELECT 'intento', COUNT(*) FROM intento
UNION ALL SELECT 'respuesta_intento', COUNT(*) FROM respuesta_intento;
