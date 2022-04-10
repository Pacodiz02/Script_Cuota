#!usr/bin/env bash
#Zona de declaración de variables

libreria=$(cd $(dirname "${BASH_SOURCE[0]}") >/dev/null && pwd)
source $libreria/funciones

DIRECTORIO="/QUOTA"
DISPOSITIVO="sda1"
REPO="ftp.es.debian.org"

#Zona de declaración de funciones
f_limpia
f_root
f_existe_directorio $DIRECTORIO
f_UUID $DISPOSITIVO
f_modifica_fstab
f_conexion $REPO
