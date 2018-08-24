#!/bin/sh



for name in `ls "$1"` ; do

if 
	[ -f "$1/$name" ] ; then  # check if is a normal file 
	echo "$1/$name (is a file)"
elif [ -d "$1/$name" ]; then # check if is a directory 
	echo "$1/$name (is a directory)"

else 
	echo  "$1/$name (is others )"

fi 
done 
