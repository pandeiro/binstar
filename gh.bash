#!/bin/bash

E_BADARGS=65
USAGE="Usage: $0 [-u, --update] || <USER> <REPOSITORY> [PATH]\n\nOptions:\n-u, --update  Update all repos in $GITHUB_HOME"

[ -z "$GITHUB_HOME" ] && echo "To use this script, set GITHUB_HOME" && exit 1

case $# in
    [0])
	echo -ne "$USAGE" && exit 0
        ;;
    [1])
	cmd=pull
	if [ $1 = '-u' ]; then
	    cd $GITHUB_HOME
	    for r in *; do
		if [ -d "$r" ] && [ -d "$r/.git" ]; then
		    cd "$r"
		    echo "Updating $r"
		    git $cmd
		    cd ..
		fi
	    done
	else
	    echo "$USAGE" && exit $BAD_ARGS
	fi
        ;;
    [2-3])
	cmd=clone
	user="$1"
	repo="${2%.git}.git"
	url="git://github.com/$user/$repo"
        if [ ! -z "$3" ]; then
	    dest="$3"
	else
	    dest="$GITHUB_HOME"
	fi
	cd "$dest"
	git $cmd "$url"
	;;
    *) exit "$E_BADARGS"
        ;;
esac

exit 0

