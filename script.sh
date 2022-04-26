#!/usr/bin/env bash

libreria=$(cd $(dirname "${BASH_SOURCE[0]}") >/dev/null && pwd)
source $libreria/funciones

#Zona de uso de funciones
f_limpia
f_root
f_conexion
read -p "Dispositivo sobre el que aplicar la cuota: " dispositivo
f_instalaPaquete
f_existe_directorio
f_UUID
f_existe_en_fstab
f_habilita_quota
f_configura_quota
f_plantilla_quota
