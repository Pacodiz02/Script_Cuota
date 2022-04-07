#!usr/bin/env bash
#Zona de declaración de variables

libreria="/home/github/Script_Cuota"
source $libreria/funciones

DIRECTORIO="/QUOTA"
DISPOSITIVO="sda1"
REPO="ftp.es.debian.org"

#Zona de declaración de funciones
f_limpia
f_root

if ! f_existe_directorio $DIRECTORIO 
then
    echo "No existe el directorio "$DIRECTORIO
else
    echo "Se ha encontrado el directorio "$DIRECTORIO
exit;
fi;

f_UUID $DISPOSITIVO
f_conexion $REPO
