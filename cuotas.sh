##############################################


#!/usr/bin/env bash
# Autor: usuario 
# Version: 
# Descripción: 
# Fecha de creación: mar 29 mar 2022 10:30:46 CEST

# Zona de declaración de variables

repo="ftp.es.debian.org"
binario="quota"
dispositivo=""
uuid="sudo blkid -s UUID -o value /dev/$dispositivo"
# Fin Zona
 

# Zona de declaración de funciones

#Límpia pantalla
function f_limpia {
        clear
}

#Mira si eres root
function f_root {
        if [ "$UID" -eq 0 ]; then return 0; else return 1; fi
}       

#Mira si hay conexión con ftp.es.debian.org.
#Devuelve 0 en caso de tenerla, 1 en caso negativo
function f_conexion {

        if ping -c1 $repo &>/dev/null
        then
                echo "Hay conexión"
                return 0
        else
                echo "No hay conexion"
                return 1
        fi

}

#Indica si el binario pasado como parámetro, está instalado devuelve 0, no instalado devuelve 1
function f_instalado {
	if which $1 &>/dev/null; then return 0; else return 1; fi
} 


#Instala el paquete introducido como argumento. Devuelve 0 si lo instala, 1 en caso contrario
function f_instalaPaquete {
	apt update &>/dev/null && apt -y install $binario 
}

#------------------------------------------------------------------------------------------------

#Indica si existe el directorio /QUOTA

function f_existe_directorio {
    mkdir /QUOTA
    if [ echo $? -eq 0 ]; then
        echo "Existe el directorio /QUOTA"
    else
        echo "No existe directorio /QUOTA, creando directorio..."
        mkdir /QUOTA
}

function f_UUID {
        sudo blkid -s UUID -o value /dev/$dispositivo
        if [ echo $? -ne 0 ]; then
                echo "El dispositivo no existe." 
                return 1
                set -e
        
        else
                return 0
                
        fi


}

function f_modifica_fstab {

        if [ echo $? -eq 0 ]; then
                echo UUID=$uuid /QUOTA               ext4    defaults,usrquota,grpquota 0       2
}

function f_existe_en_fstab {
        cat /etc/fstab | egrep -o $uuid

        if [ echo $? -eq 0 ]; then
                echo "El dispositvo ya está añadido en el fichero /etc/fstab"
                return 1
        else
                echo "El dispositivo de bloques no está en el fichero /etc/fstab, añadiendolo a /etc/fstab"
                return 0
        fi


}

function f_habilita_quota {

}

function f_plantilla_quota {

}

function f_configura_quota {

}


# Fin Zona


#MAIN

if ! f_root; then echo "Tienes que ser root para ejecutar el script";exit; fi 
if ! f_conexion; then echo "No hay conexión";  exit; fi
if f_instalado $binario; then echo $binario ya instalado; exit; else echo "No instalado, instalando paquete..."; fi 
if f_instalaPaquete $binario; then echo $binario instalado con éxito.; fi

# END MAIN


##############################################
