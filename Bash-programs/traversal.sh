#!/bin/sh

indent() {
	j=0;
	while [ "$j" -lt "$1" ]; do
		echo -n "  "
		j=`expr $j + 1`
	done
}

traverse() {
	cd "$1"
	ls | while read i
	do
		indent $2
		if [ -d "$i" ]; then
			echo "Directory: $i"
			(traverse "$i" `expr $2 + 1`)
		else
			echo "File: $i"
		fi
	done
}

if [ -z "$1" ]; then
	traverse . 0
else
	traevrse "$1" 0
fi



