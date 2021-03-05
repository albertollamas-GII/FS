!#/bin/bash

propietario=`ls -lF /bin/ls|cut -d " " -f 3`
entero=`echo $1 | grep -q "[0-9]\+" && echo true || echo false`
if [ $# -eq 0 ] || [ $# -ge 3 ] || [ "$2" == "-?" ] || [ "$2" == "-H" ] || [ "$2" == "-h" ];
then 
	nombre=`grep ^$(whoami) /etc/passwd | cut -d: -f5`
	grupo=`grep ^$(whoami) /etc/passwd | cut -d: -f4`
	echo $nombre $grupo
	echo "Ayuda para usar el guion ... etc"
	exit 1
fi

if [ "$1" == "--exec" ] && ! [ -d $2 ];
then
	echo "Error, acción no permitida"

elif [ "./ejercicio1.sh" == $propietario ];
then
	./$3 > pantalla.txt
	./$3 2> error.txt
else
	echo "Ud. no es propietario. Acción no permitida"

fi

if [ "$1" == "--search" ] && [ $2 == $entero ];
then
	grep $2 /etc/passwd | cut -d: -f1
else 
	echo "Error, no puede realizar la acción"
	exit 1
fi


if [ "$2" == "--color" ];
then
	read archivo
	if [ -f $archivo ];
	then
		grep --color ^$(whoami) $archivo
	exit 1
fi


