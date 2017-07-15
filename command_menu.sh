#!/bin/sh

while true  
do
clear
echo "Choose an item: a,b or c"
echo "a: top"
echo "b: Display Calendar"
echo "c: Exit"
echo "d: date"
read -sn1
case "$REPLY"  in
	a) top;; 
	b) cal ;;
	c) exit 0 ;;
	d) date ;;
esac 

read -n1 -p "Press any key to continue"
done
