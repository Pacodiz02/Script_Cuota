#!usr/bin/env bash
#Zona de declaración de variables

libreria="/home/usuario/script"
source $libreria/funciones

DIRECTORIO="/QUOTA"
DISPOSITIVO="/dev/sdb1"

#Zona de declaración de funciones
f_root

if ! f_existe_directorio $DIRECTORIO 
then
    echo "No existe el directorio "$DIRECTORIO
else
    echo "Se ha encontrado el directorio "$DIRECTORIO
exit;
fi;

if ! f_UUID $DISPOSITIVO
then
   echo "No se ha encontrado el UUID del dispositivo indicado"
else
    echo "Se ha encontrado el UUID del dispositivo"
exit;
fi;
