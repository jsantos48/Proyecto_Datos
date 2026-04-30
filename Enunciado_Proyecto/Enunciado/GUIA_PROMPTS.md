# Guía de Prompt Engineering para ASIR

Para que la IA sea tu aliada y no tu enemiga, debes darle contexto técnico específico. Aquí tienes consejos y ejemplos para este proyecto.

## 1. El Método "Actuar como..."
No pidas solo "hazme una tabla". Define el rol:
> *"Actúa como un Administrador de Bases de Datos senior experto en PostgreSQL 15. Diseña la tabla de clientes para una empresa de telecomunicaciones..."*

## 2. Especifica Restricciones Técnicas
La IA suele olvidar las restricciones de integridad si no se las pides explícitamente.
> **Mal:** "Hazme una tabla de clientes con DNI".
> **Bien:** "Genera el DDL para la tabla `clientes` en PostgreSQL. Incluye un campo `dni` que sea PRIMARY KEY y tenga una restricción `CHECK` que valide que el formato son 8 números y una letra mayúscula usando expresiones regulares (`~`)."

## 3. Ejemplo de Prompt "Perfecto" para el Backend
> *"Necesito un script en Python 3.10 que se conecte a una base de datos PostgreSQL usando la librería `psycopg2`. La conexión debe leerse de variables de entorno (DB_HOST, DB_NAME, DB_USER, DB_PASS). El script debe permitir insertar un nuevo cliente pidiendo los datos por consola. Incluye manejo de excepciones y asegúrate de cerrar la conexión al finalizar."*

## 4. Cómo pedir Ayuda para Errores
Si el código falla, no digas "no funciona". Pega el error:
> *"Estoy ejecutando este script en un contenedor Docker de Postgres y obtengo este error: `connection to server at "localhost" (127.0.0.1), port 5432 failed: Connection refused`. Mi docker-compose es este: [pegar código]. ¿Qué estoy configurando mal en el mapeo de puertos?"*

## 5. El "Checklist" de la IA
Antes de dar por bueno un código de la IA, pregúntale:
* "¿Este código sigue las normas de la 3ª Forma Normal?"
* "¿Hay alguna vulnerabilidad de seguridad (como SQL Injection) en este script?"
* "¿Cómo puedo automatizar esto con un `cron` en Linux?"
