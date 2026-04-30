#!/bin/bash

# Configuración
DB_NAME="masmovil_db"
DB_USER="admin_asir"
BACKUP_DIR="./backups"
DATE=$(date +%Y-%m-%d_%H%M%S)
FILE_NAME="${BACKUP_DIR}/${DB_NAME}_${DATE}.sql"

# Crear directorio si no existe
mkdir -p $BACKUP_DIR

echo "Iniciando copia de seguridad de ${DB_NAME}..."

# Ejecutar pg_dump dentro del contenedor Docker
# Asumimos que el contenedor se llama 'mmsql_db'
docker exec mmsql_db pg_dump -U $DB_USER $DB_NAME > $FILE_NAME

if [ $? -eq 0 ]; then
    echo "Copia de seguridad realizada con éxito: ${FILE_NAME}"
    # AQUÍ DEBEN AÑADIR LA TAREA DE SUBIDA A NUBE EXTERNA (RA6)
    # Ejemplo: rsync, scp, rclone, etc.
else
    echo "Error al realizar la copia de seguridad."
    exit 1
fi

# Limpieza: Borrar backups con más de 7 días
find $BACKUP_DIR -type f -name "*.sql" -mtime +7 -delete
