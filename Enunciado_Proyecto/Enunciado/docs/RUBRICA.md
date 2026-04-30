# Rúbrica de Evaluación: Proyecto MMSQL (ASIR)

| Criterio | Peso | Excelente (9-10) | Bien (6-8) | Insuficiente (0-5) |
| :--- | :---: | :--- | :--- | :--- |
| **Infraestructura (RA1/RA6)** | 20% | Docker funcional en la nube, acceso remoto verificado y Git con historial coherente. | Docker funcional localmente o nubes gratuitas con fallos menores de red. | No usa Docker o no es accesible remotamente. |
| **Diseño y Normalización (RA2)** | 20% | Modelo en 3FN, sin redundancias y cubriendo todos los campos del formulario. | Modelo en 2FN o con errores leves en cardinalidad. | Errores graves de diseño o no normalizado. |
| **Integridad Física (RA3)** | 20% | Implementa todos los `CHECK` (DNI, IBAN, etc.) con Regex correctas en PostgreSQL. | Implementa algunos `CHECK` o tipos de datos mejorables. | Sin restricciones de integridad física. |
| **Consultas y DML (RA4/RA5)** | 20% | 10 consultas de negocio complejas y gestión correcta de borrados lógicos. | Consultas simples o sin lógica de borrado lógico. | Menos de 5 consultas o errores sintácticos. |
| **Seguridad y Backups (RA6)** | 20% | Roles RBAC bien definidos y backup automático enviado a ubicación externa. | Backup local automático pero sin envío externo. | Sin backups o sin gestión de roles. |
| **Auditoría de IA (Transversal)** | Oblig. | Diario completo, crítico y demuestra comprensión del código. | Diario incompleto o poco profundo. | Sin diario (Proyecto no evaluable). |

## Puntos Extra (Ultra-valoración)
*   **Backend Python (+1.0):** Script funcional que permite inserción/consulta desde consola.
*   **Interfaz HTML/Web (+1.5):** Formulario web que conecta con la BBDD PostgreSQL.
*   **Complejidad SQL (+0.5):** Uso de Triggers para auditoría o Procedimientos (opcional).
