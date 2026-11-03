-- Script 001: Esquema inicial de TemIA
-- Ejecutar manualmente sobre temia_db
-- Charset y collation: utf8mb4_unicode_ci
-- Hibernate ddl-auto = none. Esquema gestionado por scripts SQL.

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS respuesta_intento;
DROP TABLE IF EXISTS intento;
DROP TABLE IF EXISTS opcion;
DROP TABLE IF EXISTS pregunta;
DROP TABLE IF EXISTS test;
DROP TABLE IF EXISTS resumen;
DROP TABLE IF EXISTS apunte;
DROP TABLE IF EXISTS usuario;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE usuario (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(150) NOT NULL,
  username VARCHAR(50) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  foto_url VARCHAR(512) NULL,
  role VARCHAR(20) NOT NULL DEFAULT 'USER',
  activo TINYINT(1) NOT NULL DEFAULT 1,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT uk_usuario_email UNIQUE (email),
  CONSTRAINT uk_usuario_username UNIQUE (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE apunte (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  usuario_id BIGINT NOT NULL,
  titulo VARCHAR(200) NOT NULL,
  tipo_origen ENUM('TEXTO','ARCHIVO') NOT NULL,
  texto_extraido LONGTEXT NULL,
  fichero_url VARCHAR(512) NULL,
  fichero_public_id VARCHAR(255) NULL,
  nombre_original VARCHAR(255) NULL,
  extension VARCHAR(10) NULL,
  tamanio_bytes BIGINT NULL,
  estado ENUM('SUBIDO','PROCESADO') NOT NULL DEFAULT 'SUBIDO',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_apunte_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  INDEX idx_apunte_usuario_id (usuario_id),
  INDEX idx_apunte_creado_en (creado_en)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE resumen (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  apunte_id BIGINT NOT NULL,
  usuario_id BIGINT NOT NULL,
  titulo VARCHAR(200) NOT NULL,
  contenido LONGTEXT NOT NULL,
  configuracion JSON NULL,
  modelo_usado VARCHAR(100) NULL,
  es_publico TINYINT(1) NOT NULL DEFAULT 0,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_resumen_apunte FOREIGN KEY (apunte_id) REFERENCES apunte(id) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT fk_resumen_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  INDEX idx_resumen_apunte_id (apunte_id),
  INDEX idx_resumen_usuario_id (usuario_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE test (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  apunte_id BIGINT NOT NULL,
  usuario_id BIGINT NOT NULL,
  resumen_id BIGINT NULL,
  titulo VARCHAR(200) NOT NULL,
  configuracion JSON NULL,
  numero_preguntas INT NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_test_apunte FOREIGN KEY (apunte_id) REFERENCES apunte(id) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT fk_test_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT fk_test_resumen FOREIGN KEY (resumen_id) REFERENCES resumen(id) ON DELETE SET NULL ON UPDATE RESTRICT,
  INDEX idx_test_apunte_id (apunte_id),
  INDEX idx_test_usuario_id (usuario_id),
  INDEX idx_test_resumen_id (resumen_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE pregunta (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  test_id BIGINT NOT NULL,
  enunciado TEXT NOT NULL,
  explicacion MEDIUMTEXT NOT NULL,
  orden INT NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_pregunta_test FOREIGN KEY (test_id) REFERENCES test(id) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT uk_pregunta_test_orden UNIQUE (test_id, orden),
  INDEX idx_pregunta_test_id (test_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE opcion (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  pregunta_id BIGINT NOT NULL,
  texto TEXT NOT NULL,
  es_correcta TINYINT(1) NOT NULL DEFAULT 0,
  orden INT NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_opcion_pregunta FOREIGN KEY (pregunta_id) REFERENCES pregunta(id) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT uk_opcion_pregunta_orden UNIQUE (pregunta_id, orden),
  INDEX idx_opcion_pregunta_id (pregunta_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE intento (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  test_id BIGINT NOT NULL,
  usuario_id BIGINT NOT NULL,
  aciertos INT NOT NULL DEFAULT 0,
  errores INT NOT NULL DEFAULT 0,
  total INT NOT NULL,
  porcentaje DECIMAL(5,2) NOT NULL DEFAULT 0.00,
  iniciado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  finalizado_en DATETIME NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_intento_test FOREIGN KEY (test_id) REFERENCES test(id) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT fk_intento_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  INDEX idx_intento_usuario_id (usuario_id),
  INDEX idx_intento_test_id (test_id),
  INDEX idx_intento_finalizado_en (finalizado_en)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE respuesta_intento (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  intento_id BIGINT NOT NULL,
  pregunta_id BIGINT NOT NULL,
  opcion_elegida_id BIGINT NULL,
  es_acierto TINYINT(1) NOT NULL DEFAULT 0,
  explicacion_snapshot MEDIUMTEXT NULL,
  respondido_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_respuesta_intento_intento FOREIGN KEY (intento_id) REFERENCES intento(id) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT fk_respuesta_intento_pregunta FOREIGN KEY (pregunta_id) REFERENCES pregunta(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT fk_respuesta_intento_opcion FOREIGN KEY (opcion_elegida_id) REFERENCES opcion(id) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT uk_respuesta_intento_unica UNIQUE (intento_id, pregunta_id),
  INDEX idx_respuesta_intento_intento_id (intento_id),
  INDEX idx_respuesta_intento_pregunta_id (pregunta_id),
  INDEX idx_respuesta_intento_opcion_id (opcion_elegida_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
