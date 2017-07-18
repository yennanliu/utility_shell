#!/bin/sh

### function


function to_upper () {
read -p "plz enter a string : " string 
#input="$1"
output=$(tr [a-z] [A-Z]  <<< "$string")
echo $output
}

function do_backup {
tar -czvf $HOME/backup.tgz ${HOME}/bin
}

function show_cal {
if [ -x /usr/bin/ncal ] ; then
command="/usr/bin/ncal -w"
else
command="/usr/bin/cal"
fi
$command
}

###


while true  
do
clear
echo "Choose an item: a,b or c"
echo "a: top"
echo "b: Display Calendar"
echo "c: Exit"
echo "d: date"
echo "e: to upper"
echo "f: do backup"
read -sn1
#REPLY=$(to_upper "$REPLY")
case "$REPLY"  in
	a) top;; 
	b) cal ;;
	c) exit 0 ;;
	d) date ;;
	e) to_upper ;;
	f) do_backup ;;
esac 

read -n1 -p "Press any key to continue"
done
