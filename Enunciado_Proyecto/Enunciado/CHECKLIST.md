# Checklist de Autoevaluación - Proyecto MMSQL

Utiliza esta lista para asegurarte de que tu grupo cumple con todos los requisitos antes de la entrega final.

## 1. Investigación e Infraestructura
- [ ] Hemos comparado al menos 3 proveedores Cloud en el `README.md`.
- [ ] PostgreSQL se ejecuta dentro de un contenedor Docker (verificado con `docker ps`).
- [ ] La base de datos es accesible remotamente desde fuera del servidor.
- [ ] El repositorio Git es público y tiene un historial de commits que refleja el trabajo de todos los miembros.

## 2. Diseño de Datos
- [ ] El diseño cubre todos los campos del archivo `02_Formulario_MasMovil.pdf`.
- [ ] El Modelo Relacional está documentado en una **hoja de cálculo** (incluida en `docs/`).
- [ ] Hemos aplicado las reglas de normalización hasta la 3ª Forma Normal (3FN).
- [ ] (Opcional) Hemos incluido el diagrama Entidad-Relación.

## 3. Implementación SQL
- [ ] El script `DDL.sql` crea todas las tablas con sus claves primarias y ajenas.
- [ ] Hemos implementado restricciones `CHECK` con Regex para DNI, Email, IBAN y Teléfono.
- [ ] El script `DML.sql` incluye datos de prueba coherentes.
- [ ] Hemos desarrollado las 10 consultas analíticas requeridas en `sql/`.
- [ ] Hemos implementado la lógica de "Borrado Lógico" (columna `activo` o similar).

## 4. Seguridad y Aseguramiento
- [ ] Hemos creado los 3 roles solicitados (`db_admin`, `app_user`, `auditor_user`).
- [ ] Hemos verificado que cada rol tiene los privilegios mínimos necesarios.
- [ ] El script de backup funciona y se ejecuta automáticamente (vía `cron`).
- [ ] Los backups se almacenan en una ubicación externa al servidor.

## 5. Auditoría de IA
- [ ] El archivo `diario_IA.md` está completo con al menos una entrada por sesión.
- [ ] Hemos documentado los errores que cometió la IA y cómo los corregimos.
- [ ] Hemos verificado manualmente todo el código generado antes de integrarlo.

## 6. Valoración Extra (Puntos VIP)
- [ ] Hemos desarrollado un backend en Python que conecta con la BBDD.
- [ ] Hemos creado una interfaz HTML para el formulario de alta.
- [ ] Hemos implementado Triggers de auditoría para campos sensibles.
