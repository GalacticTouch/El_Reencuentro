#!/bin/bash

# --- CONFIGURACIÓN ---
USUARIO="root"
PASSWORD="1331"
BASE_DATOS="SoftbolStats"
CARPETA_DESTINO="./respaldos"
FECHA=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVO_SALIDA="$CARPETA_DESTINO/backup_$BASE_DATOS_$FECHA.sql"

# Crear la carpeta de respaldos si no existe
mkdir -p "$CARPETA_DESTINO"

# --- EJECUCIÓN DEL RESPALDO ---
echo "Iniciando respaldo de la base de datos '$BASE_DATOS'..."

mysqldump -u "$USUARIO" -p"$PASSWORD" "$BASE_DATOS" > "$ARCHIVO_SALIDA"

# Verificar si se creó correctamente
if [ $? -eq 0 ]; then
    echo "¡Respaldo exitoso! Guardado en: $ARCHIVO_SALIDA"
else
    echo "Hubo un error al generar el respaldo."
fi