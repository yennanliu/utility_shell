#!/bin/sh

# V1 
echo "Number of arguments $#   (V1)"
while [ -n "$1" ] && [ -n "$2" ]  && [ -n "$3" ] ; do 
	echo "$1 $2 $3"
	shift 3  # shift 3 arguments. i.e. 1,2,3 -> 4,5,6....
done 

if [ -n "$1" ] &&   [ -n "$2" ]
then echo "$1 $2"
else 
echo $1
fi   
 
# V2 
echo "Number of arguments $#   (V2)"
while [ -n "$1" ] && [ -n "$2" ]  && [ -n "$3" ] ; do 
	echo "$1 $2 $3"
	shift 3  # shift 3 arguments. i.e. 1,2,3 -> 4,5,6....
done 

echo $@  # if not input at least 3 arguments, just print all input arguments instead 
