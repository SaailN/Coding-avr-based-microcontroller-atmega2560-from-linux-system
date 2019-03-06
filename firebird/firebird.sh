#!/bin/bash


#e-yantra IITB

#burn hex file on ubantu using command : firebird.sh filename.c



a=$(avr-gcc -g -Os -mmcu=atmega2560 -c $1) 
                      #compile .c file to .o file

if [[ $? == 0 ]]; then
    echo "Compilation successful."

	filename=$(echo "$1" | cut -f 1 -d '.')
	avr-gcc -g -mmcu=atmega2560 -o "$filename".elf "$filename".o    #linking
	avr-objcopy -j .text -j .data -O ihex "$filename".elf "$filename".hex   #hex creation

	File=$(pwd)


#append "/filename.hex"  to FILE
	FILE="$File/$filename.hex"

	echo $FILE



	OPTIONS=$(getopt -o hf:gb -l help,file:,foo,bar -- "$@")

	if [ $? -ne 0 ]; then
  	echo "getopt error"
  	exit 1
	fi

	eval set -- $OPTIONS

	while true; do
  	case "$1" in
    	-h|--help) HELP=1 ;;
    	-f|--file) FILE="$2" ; shift ;;
    	-g|--foo)  FOO=1 ;;
    	-b|--bar)  BAR=1 ;;
    	--)        shift ; break ;;
    	*)         echo "unknown option: $1" ; exit 1 ;;
  	esac
  	shift
	done




	echo "help: $HELP"
	echo "file: $FILE"
#avrdude -c stk500v2 -p m2560 -P /dev/ttyACM0 -U flash:w:"/home/erts/Buzzer_Beep/default/Buzzer_Beep.hex":i

	sudo avrdude -c stk500v2 -p m2560 -P /dev/ttyACM0 -U flash:w:$FILE:i

else
    echo "Compilation failure."
fi
