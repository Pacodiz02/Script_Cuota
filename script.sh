#!/usr/bin/env bash
#Zona de declaración de variables

libreria=$(cd $(dirname "${BASH_SOURCE[0]}") >/dev/null && pwd)
source $libreria/funciones

DIRECTORIO="/QUOTA"
DISPOSITIVO="sda1"
REPO="ftp.es.debian.org"
BINARIO="quota"

#Zona de declaración de funciones
f_limpia
f_root
f_conexion $REPO
f_instalarPaquete
f_existe_directorio $DIRECTORIO
f_UUID $DISPOSITIVO
f_modifica_fstab
f_habilita_cuota
f_plantilla_cuota
f_configura_cuota $DIRECTORIO
