-- SOLUCIÓN DE REFERENCIA (DOCENTE)
-- Proyecto MMSQL - MásMóvil

-- 1. CREACIÓN DE TABLAS CON RESTRICCIONES CHECK (RA3)
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    dni VARCHAR(9) UNIQUE NOT NULL 
        CONSTRAINT check_dni CHECK (dni ~ '^[0-9]{8}[A-Z]$'),
    email VARCHAR(150) UNIQUE NOT NULL
        CONSTRAINT check_email CHECK (email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    telefono VARCHAR(9) 
        CONSTRAINT check_tlf CHECK (telefono ~ '^[679][0-9]{8}$'),
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE -- Borrado lógico (RA5)
);

CREATE TABLE cuentas_bancarias (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES clientes(id),
    iban VARCHAR(24) NOT NULL
        CONSTRAINT check_iban CHECK (iban ~ '^ES[0-9]{22}$'),
    banco VARCHAR(100)
);

-- 2. SEGURIDAD: RBAC (RA5/RA6)
-- Crear roles
CREATE ROLE db_admin;
CREATE ROLE app_user;
CREATE ROLE auditor_user;

-- Asignar permisos
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO db_admin;
GRANT SELECT, INSERT, UPDATE ON clientes, cuentas_bancarias TO app_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO auditor_user;

-- 3. CONSULTA DE EJEMPLO (RA4)
-- Listar clientes activos con su IBAN
SELECT c.nombre, c.apellidos, cb.iban
FROM clientes c
JOIN cuentas_bancarias cb ON c.id = cb.cliente_id
WHERE c.activo = TRUE;

-- 4. BORRADO LÓGICO (RA5)
-- En lugar de DELETE, desactivamos al cliente
UPDATE clientes SET activo = FALSE WHERE dni = '12345678Z';
