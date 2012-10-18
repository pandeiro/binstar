#!/bin/bash

E_BADARGS=65
USAGE="Increments or sets backlight value (0-976) on Lenovo IdeaPad U260 screen\n\nUsage: $0 [VALUE]\n"

if [ $# -gt 1 ]; then
    echo -ne "$USAGE"
    exit $E_BADARGS
fi

if  [ $# -eq 1 ]; then
    if [ $1 = '-h' ] ||  [ $1 = '--help' ]; then
	echo -ne "$USAGE"
	exit 0
    fi
fi


brightness=/sys/class/backlight/intel_backlight/brightness

min=0; low=400; medium=575; high=750; max=976

current_level=$(<$brightness)

if [ $1 -ge $min ] && [ $1 -le $max ]; then
    new_level=$1
elif [ $current_level -eq $max ]; then
    new_level=$low
elif [ $current_level -lt $low ]; then
    new_level=$low
elif [ $current_level -le $medium ]; then
    new_level=$medium
elif [ $current_level -le $high ]; then
    new_level=$high
else
    new_level=$max
fi

echo $new_level | sudo tee $brightness

