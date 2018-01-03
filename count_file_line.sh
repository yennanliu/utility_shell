#!/bin/sh


function is_file {	
if [ ! -f "$1" ] ; then 
	echo "$1 does not seem to be a file"
	exit 2 
fi 
}

function clean_file {
is_file "$1"
BEFORE=$(wc -1 "$1")
echo "the file $1 starts with $BEFORE"
sed -i.bak '/^\s*#/d;/^$/d'   "$1"
AFTER=$(wc -1 "$1")
echo "the file $1 now $AFTER"
}

read -p "enter a file name to check : "
echo "$REPLY"
clean_file "$REPLY"
#is_file "$1"
exit 1 



# bash count_file_line.sh


