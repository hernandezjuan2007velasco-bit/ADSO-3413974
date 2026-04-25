-- ========================================
-- CREAR BASE DE DATOS (ejecutar en postgres)
-- ========================================
CREATE DATABASE gobernanza_db;

-- ========================================
-- (Luego abrir Query Tool en gobernanza_db)
-- ========================================

-- ========================================
-- CREACIÓN DE ROLES
-- ========================================
CREATE ROLE admin_role LOGIN PASSWORD 'admin123';
CREATE ROLE ddl_role LOGIN PASSWORD 'ddl123';
CREATE ROLE dml_role LOGIN PASSWORD 'dml123';
CREATE ROLE tcl_role LOGIN PASSWORD 'tcl123';

-- ========================================
-- ELIMINAR PERMISOS POR DEFECTO
-- ========================================
REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON DATABASE gobernanza_db FROM PUBLIC;

-- ========================================
-- PERMISOS ADMIN
-- ========================================
GRANT ALL PRIVILEGES ON DATABASE gobernanza_db TO admin_role;
GRANT ALL ON SCHEMA public TO admin_role;

-- ========================================
-- PERMISOS DDL (estructura)
-- ========================================
GRANT CONNECT ON DATABASE gobernanza_db TO ddl_role;
GRANT USAGE, CREATE ON SCHEMA public TO ddl_role;

-- ========================================
-- PERMISOS DML (datos)
-- ========================================
GRANT CONNECT ON DATABASE gobernanza_db TO dml_role;
GRANT USAGE ON SCHEMA public TO dml_role;

-- ========================================
-- PERMISOS TCL (transacciones)
-- ========================================
GRANT CONNECT ON DATABASE gobernanza_db TO tcl_role;
-- ========================================
-- CREACIÓN DE TABLA (ejecutar como postgres o admin)
-- ========================================
CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    salario NUMERIC
);

-- ========================================
-- REGISTRO INICIAL
-- ========================================
INSERT INTO empleados (nombre, salario)
VALUES ('Juan', 2000);

-- ========================================
-- PERMISOS SOBRE TABLA
-- ========================================
-- Admin
GRANT ALL ON empleados TO admin_role;

-- DML
GRANT SELECT, INSERT, UPDATE, DELETE ON empleados TO dml_role;

-- TCL (opcional solo lectura)
GRANT SELECT ON empleados TO tcl_role;

-- DDL sin acceso a datos
REVOKE ALL ON empleados FROM ddl_role;

-- ========================================
-- PERMISOS SOBRE SECUENCIA (IMPORTANTE)
-- ========================================
GRANT USAGE, SELECT ON SEQUENCE empleados_id_seq TO dml_role;