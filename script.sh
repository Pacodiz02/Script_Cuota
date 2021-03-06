#!/usr/bin/env bash

libreria=$(cd $(dirname "${BASH_SOURCE[0]}") >/dev/null && pwd)
source $libreria/funciones

#Zona de uso de funciones
f_limpia
f_root
f_conexion
f_instalaPaquete
f_existe_directorio
f_mostrar_lsblk
read -p "Introduce el dispositivo sobre el que aplicar la cuota: " dispositivo
uuid=$(blkid -s UUID -o value /dev/$dispositivo)
f_UUID
f_modifica_fstab
f_habilita_quota
f_configura_quota
f_plantilla_quota
