# Proyecto Integrador ASIR: Sistema de Alta de Clientes (MMSQL)

## 1. Contexto del Proyecto
El grupo MásMóvil necesita modernizar su infraestructura de base de datos para el proceso de alta de nuevos clientes. El objetivo es diseñar, implementar y asegurar una base de datos robusta que soporte el formulario de contratación (datos personales, servicios de fibra/móvil, y datos de facturación).

El diseño de la base de datos debe basarse obligatoriamente en el formulario de alta adjunto en la carpeta del proyecto: **`02_Formulario_MasMovil.pdf`**.

Este es un proyecto **colaborativo** donde el uso de la Inteligencia Artificial está permitido, siempre que se audite su uso y se verifique técnicamente cada resultado.

## 2. Requisitos Técnicos Obligatorios

### R1: Infraestructura (RA1 / RA6)
*   **Alojamiento:** El servidor PostgreSQL debe estar desplegado en un contenedor **Docker** dentro de un servidor en la nube (VPS, Oracle Cloud, AWS, etc.).
*   **Acceso Remoto:** La base de datos debe permitir conexiones seguras desde los equipos locales de los miembros del grupo.
*   **Gestión de Versiones:** Es obligatorio el uso de **Git** en un repositorio público para compartir scripts y documentación.

### R2: Diseño y Estructura (RA2 / RA3)
*   **Modelo de Datos:** Basado en el PDF proporcionado. Debe incluir al menos: Clientes, Direcciones, Servicios Contratados y Cuentas Bancarias.
*   **Integridad:** Implementar restricciones `CHECK` para validar DNI, Email, IBAN y Teléfono directamente en el motor de la base de datos.
*   **Normalización:** El modelo debe estar normalizado (mínimo 3FN).

### R3: Operativa y Consultas (RA4 / RA5)
*   **Consultas:** Elaborar un set de 10 consultas que resuelvan necesidades de negocio (analítica de altas, facturación por provincia, etc.).
*   **Seguridad (RBAC):** Seguir las directrices de la **guía entregada por el profesor**. Crear al menos tres roles:
    1.  `db_admin`: Control total.
    2.  `app_user`: Permisos DML (Insert/Update/Select) para el backend.
    3.  `auditor_user`: Solo lectura (`SELECT`) para informes.

### R4: Aseguramiento de la Información (RA6)
*   **Backups:** Automatizar una copia de seguridad diaria que se almacene fuera del servidor principal.
*   **Restauración:** Documentar y probar el proceso de recuperación ante desastres.

## 3. Archivos de Ejemplo y Referencia
Se han proporcionado los siguientes archivos como base de trabajo:
*   `infra/docker-compose.yml`: Plantilla de despliegue.
*   `infra/backup_cron.sh`: Script base de copias de seguridad.
*   `src/db_test.py`: Semilla de conexión en Python.
*   `docs/SOLUCION_REFERENCIA.sql`: Ejemplo de estructura y roles.

> **IMPORTANTE:** Estos archivos son **ejemplos incompletos**. Sirven como punto de partida pero deben ser adaptados y ampliados por el grupo para cumplir con todos los requisitos del proyecto. No se deben utilizar sin revisión técnica previa.

## 4. Entregables y Evaluación
1.  **Directorio `sql/`:** Scripts de creación (`DDL.sql`), inserción (`DML.sql`) y consultas (`Queries.sql`).
2.  **Directorio `infra/`:** Archivos `docker-compose.yml` y scripts de backup.
3.  **Documentación Técnica:** **Modelo Relacional en hoja de cálculo** (obligatorio) y diagrama ER (opcional).
4.  **Archivo `diario_IA.md`:** Auditoría obligatoria del uso de la IA.
5.  **Backend (Opcional - Valoración Extra):** Script en Python y/o interfaz HTML para interactuar con la BBDD.

---
**Nota sobre la IA:** El uso de IA sin auditoría o con código no verificado penalizará la nota final. Cada prompt y ajuste debe quedar registrado en el diario.
