import psycopg2
import os
from dotenv import load_dotenv

# Carga variables desde un archivo .env si existe
load_dotenv()

def connect_db():
    try:
        # Configuración de conexión (usar variables de entorno)
        connection = psycopg2.connect(
            user=os.getenv("DB_USER", "admin_asir"),
            password=os.getenv("DB_PASS", "password_segura_123"),
            host=os.getenv("DB_HOST", "localhost"),
            port=os.getenv("DB_PORT", "5432"),
            database=os.getenv("DB_NAME", "masmovil_db")
        )
        
        cursor = connection.cursor()
        
        # Consulta de prueba: Obtener la versión de PostgreSQL
        cursor.execute("SELECT version();")
        record = cursor.fetchone()
        print(f"Conexión exitosa a: {record}\n")

        # Aquí podrías añadir un menú para insertar clientes...
        
    except (Exception, psycopg2.Error) as error:
        print(f"Error al conectar a la base de datos: {error}")
    
    finally:
        if 'connection' in locals() and connection:
            cursor.close()
            connection.close()
            print("Conexión cerrada.")

if __name__ == "__main__":
    connect_db()
