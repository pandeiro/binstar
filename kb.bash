#!/bin/bash

E_BADARGS=65
USAGE="Changes kb layout\n\nUsage: $0 [ -u | -i | -b ]\n\nOptions:\n    -u us\n    -i us intl\n    -b br\n"

if [ $# -ne 1 ]; then
    echo -ne "$USAGE"
    exit 0
fi

case $1 in
    '-u') setxkbmap us
	;;
    '-i') setxkbmap us intl
	;;
    '-b') setxkbmap br
	;;
    *) echo "Invalid option"; exit $E_BADARGS
	;;
esac

